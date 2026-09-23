import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/api_client.dart';
import '../models/models.dart';
import '../state/providers.dart';
import '../state/queue_state.dart';
import '../widgets/fact_list.dart';
import '../widgets/minute_wait_indicator.dart';
import '../widgets/vacancy_tile.dart';

/// Карточка с письмом и редактором. Если вакансия уже разбиралась —
/// показываем сохранённую локально карточку сразу, без обращения к
/// серверу: бэкенд без состояния и может уже забыть её по TTL или
/// банально спать, а у нас она всё равно есть.
class CardScreen extends ConsumerStatefulWidget {
  const CardScreen({super.key, required this.vacancy, this.initialRecord});

  final SearchResultItem vacancy;
  final QueueRecord? initialRecord;

  @override
  ConsumerState<CardScreen> createState() => _CardScreenState();
}

const _formatSegments = [
  ButtonSegment(value: 0, label: Text('Email')),
  ButtonSegment(value: 1, label: Text('Площадка')),
  ButtonSegment(value: 2, label: Text('Сообщение')),
];

class _CardScreenState extends ConsumerState<CardScreen> {
  QueueRecord? _record;
  bool _loading = false;
  String? _error;
  int _formatIndex = 0;
  late final TextEditingController _textController;
  late final TextEditingController _platformController;
  late final TextEditingController _messageController;

  TextEditingController get _activeController =>
      [_textController, _platformController, _messageController][_formatIndex];

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _platformController = TextEditingController();
    _messageController = TextEditingController();
    _record = widget.initialRecord;
    if (_record != null) {
      _fillLetterControllers(_record!.card.letter);
    } else {
      _loadOrPrepare();
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _platformController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _fillLetterControllers(Letter? letter) {
    _textController.text = letter?.text ?? '';
    _platformController.text = letter?.platform ?? '';
    _messageController.text = letter?.message ?? '';
  }

  Future<void> _loadOrPrepare() async {
    final store = ref.read(preparedCardsStoreProvider);
    final cached = await store.findByVacancy(widget.vacancy.source, widget.vacancy.id);
    if (cached != null) {
      setState(() {
        _record = cached;
        _fillLetterControllers(cached.card.letter);
      });
      return;
    }
    await _prepare();
  }

  Future<void> _prepare() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final v = widget.vacancy;
      final profileText = await ref.read(profileStoreProvider).load();
      final card = await ref.read(apiClientProvider).prepare(
        PrepareRequestBody(
          vacancyId: v.id,
          source: v.source,
          profileText: profileText.isEmpty ? null : profileText,
          title: v.title,
          url: v.url,
          companyName: v.companyName,
          companyInn: v.companyInn,
          salaryFrom: v.salaryFrom,
          salaryTo: v.salaryTo,
          location: v.location,
          publishedAt: v.publishedAt,
          description: v.description,
        ),
      );
      final record = QueueRecord(
        vacancy: v,
        card: card,
        preparedAt: DateTime.now().toIso8601String(),
      );
      await ref.read(queueProvider.notifier).upsert(record);
      if (!mounted) return;
      setState(() {
        _record = record;
        _fillLetterControllers(card.letter);
        _loading = false;
      });
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Сервер ответил ошибкой: ${e.message}';
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Не удалось собрать карточку: $e';
        _loading = false;
      });
    }
  }

  Future<void> _saveEditedLetter() async {
    final record = _record;
    if (record == null) return;
    // Сохраняем все три формата разом, не только тот, что сейчас открыт —
    // правки в остальных вкладках не должны потеряться при переключении.
    final edited = record.card.copyWith(
      letter: (record.card.letter ?? const Letter(text: '')).copyWith(
        text: _textController.text,
        platform: _platformController.text,
        message: _messageController.text,
      ),
    );
    final updated = record.copyWith(card: edited);
    await ref.read(queueProvider.notifier).upsert(updated);
    setState(() => _record = updated);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Изменения сохранены на устройстве')),
    );
  }

  Future<void> _setStatus(QueueStatus status) async {
    final record = _record;
    if (record == null) return;
    if (status == QueueStatus.sent) {
      await ref.read(queueProvider.notifier).markSent(record.card.meta.cacheKey);
    } else {
      await ref.read(queueProvider.notifier).markDeclined(record.card.meta.cacheKey);
    }
    if (!mounted) return;
    setState(() => _record = record.copyWith(status: status));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(status == QueueStatus.sent ? 'Отмечено как отправленное' : 'Отмечено как отказ'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.vacancy.title, overflow: TextOverflow.ellipsis)),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_loading) {
      return const Center(child: MinuteWaitIndicator());
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_error!, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton(onPressed: _prepare, child: const Text('Повторить')),
            ],
          ),
        ),
      );
    }
    final record = _record;
    if (record == null) {
      return const SizedBox.shrink();
    }
    final card = record.card;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        VacancyTile(item: widget.vacancy),
        const Divider(height: 24),
        _ConfidenceRow(confidence: card.meta.confidence),
        const SizedBox(height: 16),
        if (card.company != null) _CompanySection(company: card.company!),
        if (card.owner != null) _OwnerSection(owner: card.owner!),
        if (card.contacts.isNotEmpty) _ContactsSection(contacts: card.contacts),
        const SizedBox(height: 16),
        Text('Письмо', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        if (card.letter == null ||
            (card.letter!.text.isEmpty && card.letter!.platform.isEmpty && card.letter!.message.isEmpty))
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Письмо не написано: в справке не нашлось имени того, кому '
                'писать, либо ещё не задан LLM_API_KEY на сервере. '
                'Без имени письмо не пишется — так задумано, чтобы не '
                'обращаться безлично.',
              ),
            ),
          )
        else ...[
          SegmentedButton<int>(
            segments: _formatSegments,
            selected: {_formatIndex},
            onSelectionChanged: (s) => setState(() => _formatIndex = s.first),
          ),
          const SizedBox(height: 8),
          TextField(
            key: ValueKey(_formatIndex),
            controller: _activeController,
            maxLines: null,
            minLines: 6,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: _saveEditedLetter, child: const Text('Сохранить правки')),
          ),
          const SizedBox(height: 8),
          FactList(facts: card.letter!.facts),
        ],
        const SizedBox(height: 16),
        if (card.brief != null) _BriefSection(brief: card.brief!),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: record.status == QueueStatus.declined
                    ? null
                    : () => _setStatus(QueueStatus.declined),
                child: const Text('Отказ'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton(
                onPressed:
                    record.status == QueueStatus.sent ? null : () => _setStatus(QueueStatus.sent),
                child: const Text('Отправлено'),
              ),
            ),
          ],
        ),
        if (record.status != QueueStatus.ready)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Статус: ${record.status == QueueStatus.sent ? 'отправлено' : 'отказ'}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}

class _ConfidenceRow extends StatelessWidget {
  const _ConfidenceRow({required this.confidence});
  final Confidence confidence;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        _confidenceChip('компания', confidence.company),
        _confidenceChip('руководитель', confidence.owner),
        _confidenceChip('отзывы', confidence.reviews),
      ],
    );
  }

  Widget _confidenceChip(String label, double value) {
    final pct = (value * 100).round();
    return Chip(label: Text('$label: $pct%'), visualDensity: VisualDensity.compact);
  }
}

class _CompanySection extends StatelessWidget {
  const _CompanySection({required this.company});
  final Company company;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(company.legalName ?? 'Компания', style: Theme.of(context).textTheme.titleSmall),
            if (company.inn != null) Text('ИНН ${company.inn}'),
            if (company.status != null) Text('Статус: ${company.status}'),
            if (company.address != null) Text(company.address!),
            for (final f in company.finance)
              Text('${f.year}: выручка ${f.revenue ?? '—'}, прибыль ${f.profit ?? '—'}'),
          ],
        ),
      ),
    );
  }
}

class _OwnerSection extends StatelessWidget {
  const _OwnerSection({required this.owner});
  final Owner owner;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(owner.fullName ?? 'Руководитель не найден', style: Theme.of(context).textTheme.titleSmall),
            if (owner.role != null) Text(owner.role!),
            if (owner.source != null) Text('Источник: ${owner.source}', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _ContactsSection extends StatelessWidget {
  const _ContactsSection({required this.contacts});
  final List<ContactCandidate> contacts;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Куда писать', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            for (final c in contacts) _ContactRow(contact: c),
          ],
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({required this.contact});
  final ContactCandidate contact;

  (String, Color) _badge() => switch (contact.confidence) {
        'confirmed' => ('подтверждено', Colors.green),
        'likely' => ('вероятно', Colors.orange),
        _ => ('проверить', Colors.blueGrey),
      };

  @override
  Widget build(BuildContext context) {
    final (label, color) = _badge();
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.value, style: Theme.of(context).textTheme.bodyMedium),
                Text(
                  '${contact.label} · источник: ${contact.source}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Theme.of(context).colorScheme.outline),
                ),
              ],
            ),
          ),
          Chip(
            label: Text(label, style: const TextStyle(fontSize: 11, color: Colors.white)),
            backgroundColor: color,
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}

class _BriefSection extends StatelessWidget {
  const _BriefSection({required this.brief});
  final Brief brief;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Разбор перед разговором', style: Theme.of(context).textTheme.titleSmall),
            if (brief.salaryRange != null) Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('Вилка: ${brief.salaryRange}'),
            ),
            if (brief.likelyTest != null) Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('Вероятное тестовое: ${brief.likelyTest}'),
            ),
            if (brief.questions.isNotEmpty) ...[
              const Padding(padding: EdgeInsets.only(top: 8), child: Text('Вопросы:')),
              for (final q in brief.questions) Text('• $q'),
            ],
            if (brief.redFlags.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('Red flags', style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ),
              for (final r in brief.redFlags)
                Text('⚠ $r', style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ],
          ],
        ),
      ),
    );
  }
}
