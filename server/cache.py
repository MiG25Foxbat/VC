"""Кеш в памяти процесса с TTL. Без диска и без базы.

Render стирает временный диск при каждом засыпании, поэтому диск
и не нужен — всё равно жить дольше одного цикла сна он не будет.
Персональные данные не должны переживать TTL ни при каких условиях,
это не оптимизация, а требование раздела 4 docs/BUILD.md.
"""
from __future__ import annotations

import hashlib
import time
from dataclasses import dataclass
from typing import Any


@dataclass
class _Entry:
    value: Any
    expires_at: float


class TTLCache:
    def __init__(self, ttl_seconds: int) -> None:
        self._ttl = ttl_seconds
        self._store: dict[str, _Entry] = {}

    @staticmethod
    def make_key(*parts: str) -> str:
        raw = "|".join(str(p) for p in parts)
        return hashlib.sha256(raw.encode("utf-8")).hexdigest()[:24]

    def get(self, key: str) -> Any | None:
        entry = self._store.get(key)
        if entry is None:
            return None
        if entry.expires_at < time.time():
            del self._store[key]
            return None
        return entry.value

    def set(self, key: str, value: Any) -> float:
        expires_at = time.time() + self._ttl
        self._store[key] = _Entry(value=value, expires_at=expires_at)
        return expires_at

    def delete(self, key: str) -> bool:
        return self._store.pop(key, None) is not None

    def sweep(self) -> int:
        """Удаляет протухшие записи. Дешёво вызывать перед каждым /search."""
        now = time.time()
        dead = [k for k, e in self._store.items() if e.expires_at < now]
        for k in dead:
            del self._store[k]
        return len(dead)

    def __len__(self) -> int:
        return len(self._store)
