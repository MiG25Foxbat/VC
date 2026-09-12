import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import 'providers.dart';

/// Список подготовленных карточек — источник правды для экрана "Очередь"
/// и для проверки "эта вакансия уже разобрана?" на карточке. Читает и
/// пишет через PreparedCardsStore, то есть переживает перезапуск
/// приложения и сон сервера.
class QueueNotifier extends AsyncNotifier<List<QueueRecord>> {
  @override
  Future<List<QueueRecord>> build() => ref.read(preparedCardsStoreProvider).loadAll();

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => ref.read(preparedCardsStoreProvider).loadAll());
  }

  Future<void> upsert(QueueRecord record) async {
    await ref.read(preparedCardsStoreProvider).upsert(record);
    await refresh();
  }

  Future<void> markSent(String cacheKey) async {
    await ref.read(preparedCardsStoreProvider).updateStatus(cacheKey, QueueStatus.sent);
    await _forgetOnServer(cacheKey);
    await refresh();
  }

  Future<void> markDeclined(String cacheKey) async {
    await ref.read(preparedCardsStoreProvider).updateStatus(cacheKey, QueueStatus.declined);
    await _forgetOnServer(cacheKey);
    await refresh();
  }

  /// Сообщает серверу, что карточку можно стереть из кеша: отправлено
  /// или отказ, персональные данные дальше в памяти процесса не нужны.
  /// Локальная копия остаётся — это личная история пользователя, а не
  /// то, что обязано жить на сервере.
  Future<void> _forgetOnServer(String cacheKey) async {
    try {
      await ref.read(apiClientProvider).forget(cacheKey);
    } catch (_) {
      // сервер мог уже поспать и забыть это сам по TTL — не критично
    }
  }
}

final queueProvider = AsyncNotifierProvider<QueueNotifier, List<QueueRecord>>(QueueNotifier.new);
