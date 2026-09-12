import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';

/// Локальное хранилище подготовленных карточек. Бэкенд без состояния
/// и засыпает — то, что уже подготовлено (письмо, справка), должно жить
/// на устройстве независимо от серверного кеша и его TTL.
class PreparedCardsStore {
  static const _key = 'prepared_cards_v1';

  Future<List<QueueRecord>> loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];
    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((e) => QueueRecord.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }

  Future<void> _saveAll(List<QueueRecord> records) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(records.map((r) => r.toJson()).toList());
    await prefs.setString(_key, raw);
  }

  /// Ищет уже подготовленную карточку по той же вакансии — чтобы не
  /// дёргать /prepare повторно и не тратить суточный лимит модели.
  Future<QueueRecord?> findByVacancy(String source, String vacancyId) async {
    final all = await loadAll();
    for (final r in all) {
      if (r.vacancy.source == source && r.vacancy.id == vacancyId) return r;
    }
    return null;
  }

  Future<void> upsert(QueueRecord record) async {
    final all = await loadAll();
    final idx = all.indexWhere((r) => r.card.meta.cacheKey == record.card.meta.cacheKey);
    if (idx >= 0) {
      all[idx] = record;
    } else {
      all.insert(0, record);
    }
    await _saveAll(all);
  }

  Future<void> updateStatus(String cacheKey, QueueStatus status) async {
    final all = await loadAll();
    final idx = all.indexWhere((r) => r.card.meta.cacheKey == cacheKey);
    if (idx < 0) return;
    all[idx] = all[idx].copyWith(status: status);
    await _saveAll(all);
  }
}
