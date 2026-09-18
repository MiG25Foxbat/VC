import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import '../state/search_state.dart';
import 'profile_screen.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key, this.onSearched});

  /// Вызывается после успешного поиска — чтобы переключить вкладку на "Лента".
  final VoidCallback? onSearched;

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _queryController = TextEditingController(text: 'бизнес-ассистент');
  final _regionController = TextEditingController();
  final _salaryController = TextEditingController();
  bool _useTrudvsem = true;
  bool _useSuperjob = true;

  @override
  void dispose() {
    _queryController.dispose();
    _regionController.dispose();
    _salaryController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final query = _queryController.text.trim();
    if (query.isEmpty) return;
    final sources = [if (_useTrudvsem) 'trudvsem', if (_useSuperjob) 'superjob'];
    final body = SearchRequestBody(
      query: query,
      region: _regionController.text.trim().isEmpty ? null : _regionController.text.trim(),
      salaryFrom: int.tryParse(_salaryController.text.trim()),
      sources: sources.isEmpty ? null : sources,
      limit: 30,
    );
    await ref.read(searchProvider.notifier).runSearch(body);
    final state = ref.read(searchProvider);
    if (state.error == null) widget.onSearched?.call();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Поиск вакансий'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'Профиль кандидата',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _queryController,
              decoration: const InputDecoration(
                labelText: 'Что ищем',
                hintText: 'бизнес-ассистент, офис-менеджер',
              ),
              onSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _regionController,
              decoration: const InputDecoration(labelText: 'Регион (необязательно)'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _salaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Зарплата от (необязательно)'),
            ),
            const SizedBox(height: 12),
            Text('Источники', style: Theme.of(context).textTheme.titleSmall),
            CheckboxListTile(
              value: _useTrudvsem,
              onChanged: (v) => setState(() => _useTrudvsem = v ?? true),
              title: const Text('Работа России (trudvsem)'),
              contentPadding: EdgeInsets.zero,
            ),
            CheckboxListTile(
              value: _useSuperjob,
              onChanged: (v) => setState(() => _useSuperjob = v ?? true),
              title: const Text('SuperJob'),
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: state.loading ? null : _submit,
              child: state.loading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Искать'),
            ),
            if (state.loading)
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text(
                  'Сервер мог заснуть от простоя — первый ответ иногда идёт до минуты.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            if (state.error != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(state.error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ),
            if (state.result != null) ...[
              const SizedBox(height: 16),
              Text('Найдено: ${state.result!.items.length}'),
              for (final err in state.result!.errors)
                Text(
                  '${err.source}: ${err.reason}',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
