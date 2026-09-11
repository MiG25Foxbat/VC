import asyncio
import json
from pathlib import Path

from server.sources import trudvsem

FIXTURE = Path(__file__).parent / "fixtures" / "trudvsem_search.json"


class _FakeResponse:
    def __init__(self, payload: dict):
        self._payload = payload

    def raise_for_status(self) -> None:
        return None

    def json(self) -> dict:
        return self._payload


class _FakeClient:
    def __init__(self, payload: dict, *_, **__):
        self._payload = payload

    async def __aenter__(self):
        return self

    async def __aexit__(self, *_exc):
        return False

    async def get(self, *_args, **_kwargs):
        return _FakeResponse(self._payload)


def test_parses_fixture_and_skips_broken_records(monkeypatch):
    payload = json.loads(FIXTURE.read_text(encoding="utf-8"))
    monkeypatch.setattr(trudvsem.httpx, "AsyncClient", lambda *a, **kw: _FakeClient(payload))

    items = asyncio.run(trudvsem.search("ассистент"))

    # в фикстуре три записи, третья без job-name — должна быть отброшена
    assert len(items) == 2

    first = items[0]
    assert first.title == "Бизнес-ассистент собственника"
    assert first.company_inn == "7712345678"
    assert first.salary_from == 80000
    assert first.salary_to == 120000
    assert first.url.startswith("https://trudvsem.ru")
    assert first.source == "trudvsem"

    second = items[1]
    assert second.company_inn is None  # ИНН в источнике нет — подключается DaData


def test_empty_payload_returns_empty_list(monkeypatch):
    monkeypatch.setattr(trudvsem.httpx, "AsyncClient", lambda *a, **kw: _FakeClient({"results": {}}))
    items = asyncio.run(trudvsem.search("что угодно"))
    assert items == []
