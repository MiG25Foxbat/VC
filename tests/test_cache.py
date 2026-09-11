import time

from server.cache import TTLCache


def test_set_get_delete():
    cache = TTLCache(ttl_seconds=60)
    key = cache.make_key("trudvsem", "123", "default")
    cache.set(key, {"x": 1})
    assert cache.get(key) == {"x": 1}
    assert cache.delete(key) is True
    assert cache.get(key) is None


def test_delete_missing_key_is_safe():
    cache = TTLCache(ttl_seconds=60)
    assert cache.delete("нет такого ключа") is False


def test_entry_expires_after_ttl():
    cache = TTLCache(ttl_seconds=0)
    key = cache.make_key("a")
    cache.set(key, 1)
    time.sleep(0.01)
    assert cache.get(key) is None


def test_sweep_removes_only_expired():
    cache = TTLCache(ttl_seconds=0)
    dead_key = cache.make_key("dead")
    cache.set(dead_key, 1)
    time.sleep(0.01)

    alive_cache = TTLCache(ttl_seconds=60)
    alive_key = alive_cache.make_key("alive")
    alive_cache.set(alive_key, 1)

    assert cache.sweep() == 1
    assert len(alive_cache) == 1


def test_same_input_gives_same_key():
    assert TTLCache.make_key("a", "b") == TTLCache.make_key("a", "b")
    assert TTLCache.make_key("a", "b") != TTLCache.make_key("a", "c")
