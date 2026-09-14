import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/api_client.dart';
import '../models/models.dart';
import '../state/providers.dart';
import '../state/queue_state.dart';
import '../widgets/minute_wait_indicator.dart';
import 'card_screen.dart';

enum _Phase { input, extracting, review, preparing }

/// L3 каскада источников: вакансия, которую пользователь нашёл сам
/// где-то в сети и вставил текстом целиком. /extract превращает текст
/// в структуру, дальше — тот же /prepare, что и для search-результатов.
class PasteVacancyScreen extends ConsumerStatefulWidget {
  const PasteVacancyScreen({super.key});

  @override
  ConsumerState<PasteVacancyScreen> createState() => _PasteVacancyScreenState();
}

class _PasteVacancyScreenState extends ConsumerState<PasteVacancyScreen> {
  _Phase _phase = _Phase.input;
  String? _error;
  ExtractedVacancy? _extracted;

  final _rawTextController = TextEditingController();
  final _urlController = TextEditingController();

  late final TextEditingController _titleController;
  late final TextEditingController _companyController;
  late final TextEditingController _salaryFromController;
  late final TextEditingController _salaryToController;
  late final TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _companyController = TextEditingController();
    _salaryFromController = TextEditingController();
    _salaryToController = TextEditingController();
    _locationController = TextEditingController();
  }

  @override
  void dispose() {
    _rawTextController.dispose();
    _urlController.dispose();
    _titleController.dispose();
    _companyController.dispose();
    _salaryFromController.dispose();
    _salaryToController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _extract() async {
    final rawText = _rawTextController.text.trim();
    if (rawText.isEmpty) return;
    setState(() {
      _phase = _Phase.extracting;
      _error = null;
    });
    try {
      final extracted = await ref.read(apiClientProvider).extractVacancy(rawText);
      if (!mounted) return;
      setState(() {
        _extracted = extracted;
        _titleController.text = extracted.title ?? '';
        _companyController.text = extracted.companyName ?? '';
        _salaryFromController.text = extracted.salaryFrom?.toString() ?? '';
        _salaryToController.text = extracted.salaryTo?.toString() ?? '';
        _locationController.text = extracted.location ?? '';
        _phase = _Phase.review;
      });
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Не удалось разобрать текст: ${e.message}';
        _phase = _Phase.input;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Не удалось разобрать текст: $e';
        _phase = _Phase.input;
      });
    }
  }

  String _buildDescription() {
    final extracted = _extracted;
    if (extracted == null) return '';
    final parts = <String>[];
    if (extracted.duties.isNotEmpty) {
      parts.add('Обязанности:\n${extracted.duties.map((d) => '- $d').join('\n')}');
    }
    if (extracted.requirements.isNotEmpty) {
      parts.add('Требования:\n${extracted.requirements.map((r) => '- $r').join('\n')}');
    }
    if (extracted.conditions.isNotEmpty) {
      parts.add('Условия:\n${extracted.conditions.map((c) => '- $c').join('\n')}');
    }
    return parts.join('\n\n');
  }

  Future<void> _prepare() async {
    final title = _titleController.text.trim();
    final companyName = _companyController.text.trim();
    if (title.isEmpty || companyName.isEmpty) {
      setState(() => _error = 'Название вакансии и компания обязательны — заполни или поправь вручную.');
      return;
    }
    setState(() {
      _phase = _Phase.preparing;
      _error = null;
    });
    try {
      final id = 'manual-${DateTime.now().millisecondsSinceEpoch}';
      final url = _urlController.text.trim();
      final vacancy = SearchResultItem(
        id: id,
        title: title,
        companyName: companyName,
        salaryFrom: int.tryParse(_salaryFromController.text.trim()),
        salaryTo: int.tryParse(_salaryToController.text.trim()),
        location: _locationController.text.trim().isEmpty ? null : _locationController.text.trim(),
        url: url,
        description: _buildDescription(),
        source: 'manual',
      );
      final profileText = await ref.read(profileStoreProvider).load();
      final card = await ref.read(apiClientProvider).prepare(
        PrepareRequestBody(
          vacancyId: id,
          source: 'manual',
          profileText: profileText.isEmpty ? null : profileText,
          title: title,
          url: url,
          companyName: companyName,
          salaryFrom: vacancy.salaryFrom,
          salaryTo: vacancy.salaryTo,
          location: vacancy.location,
          description: vacancy.description,
        ),
      );
      final record = QueueRecord(
        vacancy: vacancy,
        card: card,
        preparedAt: DateTime.now().toIso8601String(),
      );
      await ref.read(queueProvider.notifier).upsert(record);
      if (!mounted) return;
      setState(() => _phase = _Phase.review);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => CardScreen(vacancy: vacancy, initialRecord: record)),
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Сервер ответил ошибкой: ${e.message}';
        _phase = _Phase.review;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Не удалось собрать карточку: $e';
        _phase = _Phase.review;
      });
    }
  }

  void _startOver() {
    setState(() {
      _phase = _Phase.input;
      _extracted = null;
      _error = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Вставить вакансию')),
      body: switch (_phase) {
        _Phase.extracting => const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Разбираю текст на название, зарплату, компанию…'),
                ],
              ),
            ),
          ),
        _Phase.preparing => const Center(child: MinuteWaitIndicator()),
        _Phase.input => _buildInput(context),
        _Phase.review => _buildReview(context),
      },
    );
  }

  Widget _buildInput(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Вставь полный текст вакансии, найденной где угодно в сети — '
            'модель сама выделит название, компанию, зарплату и условия.',
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _rawTextController,
            maxLines: 14,
            minLines: 8,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Вставь текст вакансии сюда…',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _urlController,
            decoration: const InputDecoration(labelText: 'Ссылка на вакансию (необязательно)'),
            keyboardType: TextInputType.url,
          ),
          const SizedBox(height: 12),
          FilledButton(onPressed: _extract, child: const Text('Разобрать')),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ),
        ],
      ),
    );
  }

  Widget _buildReview(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Проверь, что модель распознала правильно', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 12),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Название вакансии *'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _companyController,
            decoration: const InputDecoration(labelText: 'Компания *'),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _salaryFromController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Зарплата от'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _salaryToController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'до'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _locationController,
            decoration: const InputDecoration(labelText: 'Локация'),
          ),
          if (_extracted != null && _extracted!.duties.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text('Обязанности (из текста)', style: Theme.of(context).textTheme.titleSmall),
            for (final d in _extracted!.duties) Text('• $d'),
          ],
          if (_extracted != null && _extracted!.requirements.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text('Требования (из текста)', style: Theme.of(context).textTheme.titleSmall),
            for (final r in _extracted!.requirements) Text('• $r'),
          ],
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(onPressed: _startOver, child: const Text('Начать заново')),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(onPressed: _prepare, child: const Text('Написать письмо')),
              ),
            ],
          ),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ),
        ],
      ),
    );
  }
}
