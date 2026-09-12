import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/search_state.dart';
import '../widgets/vacancy_tile.dart';
import 'card_screen.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Лента')),
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
    final items = state.result?.items ?? const [];
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
