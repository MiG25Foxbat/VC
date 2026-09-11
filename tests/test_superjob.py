import asyncio
import json
from pathlib import Path

from server.sources import superjob

FIXTURE = Path(__file__).parent / "fixtures" / "superjob_search.json"


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
    monkeypatch.setattr(superjob.httpx, "AsyncClient", lambda *a, **kw: _FakeClient(payload))

    items = asyncio.run(superjob.search("ассистент", app_id="fake-app-id"))

    # в фикстуре три записи, третья без link — должна быть отброшена
    assert len(items) == 2

    first = items[0]
    assert first.title == "Бизнес-ассистент руководителя"
    assert first.company_name == "ООО Тестовая Компания"
    assert first.salary_from == 90000
    assert first.salary_to == 130000
    assert first.url.startswith("https://www.superjob.ru")
    assert first.source == "superjob"
    assert first.company_inn is None  # SuperJob не отдаёт ИНН — резолвится через DaData

    second = items[1]
    assert second.salary_from is None  # payment_from=0 при agreement=true — не оклад в 0 рублей
    assert second.salary_to is None


def test_empty_objects_returns_empty_list(monkeypatch):
    monkeypatch.setattr(superjob.httpx, "AsyncClient", lambda *a, **kw: _FakeClient({"objects": []}))
    items = asyncio.run(superjob.search("что угодно", app_id="fake-app-id"))
    assert items == []


def test_missing_app_id_raises_without_network_call():
    from server.sources.base import SourceUnavailable

    async def run():
        return await superjob.search("ассистент", app_id="")

    try:
        asyncio.run(run())
        assert False, "должно было бросить SourceUnavailable"
    except SourceUnavailable:
        pass
