import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/search_state.dart';
import '../widgets/vacancy_tile.dart';
import 'card_screen.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  final _filterController = TextEditingController();

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лента'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: TextField(
              controller: _filterController,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(
                isDense: true,
                prefixIcon: Icon(Icons.search),
                hintText: 'Фильтр по названию или компании',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
      body: _buildBody(context, state),
    );
  }

  Widget _buildBody(BuildContext context, SearchState state) {
    if (state.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null) {
      return Center(child: Text(state.error!));
    }
    var items = state.result?.items ?? const [];
    final filter = _filterController.text.trim().toLowerCase();
    if (filter.isNotEmpty) {
      items = items
          .where((i) =>
              i.title.toLowerCase().contains(filter) ||
              (i.companyName ?? '').toLowerCase().contains(filter))
          .toList();
    }
    if (items.isEmpty) {
      return const Center(child: Text('Пока пусто — начни с поиска'));
    }
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = items[index];
        return VacancyTile(
          item: item,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => CardScreen(vacancy: item)),
            );
          },
        );
      },
    );
  }
}
