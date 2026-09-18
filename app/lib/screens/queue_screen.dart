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
          final notSent = records.where((r) => r.status != QueueStatus.sent).toList();
          final sent = records.where((r) => r.status == QueueStatus.sent).toList();
          return ListView(
            children: [
              if (notSent.isNotEmpty) _sectionHeader(context, 'Не отправлено'),
              for (final r in notSent) _tile(context, r),
              if (sent.isNotEmpty) _sectionHeader(context, 'Отправлено'),
              for (final r in sent) _tile(context, r),
            ],
          );
        },
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
        child: Text(title, style: Theme.of(context).textTheme.titleSmall),
      );

  Widget _tile(BuildContext context, QueueRecord record) => VacancyTile(
        item: record.vacancy,
        trailing: _StatusChip(status: record.status),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => CardScreen(vacancy: record.vacancy, initialRecord: record)),
        ),
      );
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
