import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import '../state/queue_state.dart';
import '../widgets/vacancy_tile.dart';
import 'card_screen.dart';

/// Очередь отправки: всё, что уже подготовлено локально, независимо от
/// того, жив ли сейчас сервер. Отсюда же — отметки "отправлено"/"отказ".
class QueueScreen extends ConsumerWidget {
  const QueueScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(queueProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Очередь отправки'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(queueProvider.notifier).refresh(),
          ),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Не удалось загрузить очередь: $e')),
        data: (records) {
          if (records.isEmpty) {
            return const Center(
              child: Text('Пусто — подготовленные карточки появятся здесь автоматически'),
            );
          }
          return ListView.separated(
            itemCount: records.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final record = records[index];
              return VacancyTile(
                item: record.vacancy,
                trailing: _StatusChip(status: record.status),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CardScreen(vacancy: record.vacancy, initialRecord: record),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});
  final QueueStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      QueueStatus.ready => ('готово', Colors.blueGrey),
      QueueStatus.sent => ('отправлено', Colors.green),
      QueueStatus.declined => ('отказ', Colors.red),
    };
    return Chip(
      label: Text(label, style: const TextStyle(fontSize: 11, color: Colors.white)),
      backgroundColor: color,
      visualDensity: VisualDensity.compact,
    );
  }
}
