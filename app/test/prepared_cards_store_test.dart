import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:agent_otklikov/models/models.dart';
import 'package:agent_otklikov/storage/prepared_cards_store.dart';

QueueRecord _fakeRecord(String id) {
  final vacancy = SearchResultItem(
    id: id,
    title: 'Вакансия $id',
    url: 'https://example.test/$id',
    source: 'trudvsem',
  );
  final card = ResultCard(
    vacancy: Vacancy(id: id, title: 'Вакансия $id', url: 'https://example.test/$id', source: 'trudvsem'),
    meta: CardMeta(cacheKey: 'key-$id', expiresAt: '2026-01-01T00:00:00Z'),
  );
  return QueueRecord(vacancy: vacancy, card: card, preparedAt: '2026-01-01T00:00:00Z');
}

void main() {
  // Регрессия: loadAll() отдавал .toList(growable: false), и второй
  // upsert() падал с "Unsupported operation: Cannot add to a fixed-length
  // list" на всех вакансиях после первой — поймано вживую на телефоне.
  test('upsert принимает больше одной карточки подряд', () async {
    SharedPreferences.setMockInitialValues({});
    final store = PreparedCardsStore();

    await store.upsert(_fakeRecord('1'));
    await store.upsert(_fakeRecord('2'));
    await store.upsert(_fakeRecord('3'));

    final all = await store.loadAll();
    expect(all.length, 3);
  });

  test('upsert обновляет существующую запись по cacheKey, не дублирует', () async {
    SharedPreferences.setMockInitialValues({});
    final store = PreparedCardsStore();

    final first = _fakeRecord('1');
    await store.upsert(first);
    await store.upsert(first.copyWith(status: QueueStatus.sent));

    final all = await store.loadAll();
    expect(all.length, 1);
    expect(all.single.status, QueueStatus.sent);
  });
}
