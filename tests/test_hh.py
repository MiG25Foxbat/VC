import asyncio
from pathlib import Path

from server.sources import hh

FIXTURE = Path(__file__).parent / "fixtures" / "hh_search.html"


class _FakeResponse:
    def __init__(self, text: str, status_code: int = 200):
        self.text = text
        self.status_code = status_code

    def raise_for_status(self) -> None:
        return None


class _FakeClient:
    def __init__(self, text: str, status_code: int = 200):
        self._text = text
        self._status_code = status_code

    async def __aenter__(self):
        return self

    async def __aexit__(self, *_exc):
        return False

    async def get(self, *_args, **_kwargs):
        return _FakeResponse(self._text, self._status_code)


def test_parses_fixture_and_skips_broken_records(monkeypatch):
    html_text = FIXTURE.read_text(encoding="utf-8")
    monkeypatch.setattr(hh.httpx, "AsyncClient", lambda *a, **kw: _FakeClient(html_text))

    items = asyncio.run(hh.search("ассистент"))

    # в фикстуре три записи, третья без name — должна быть отброшена
    assert len(items) == 2

    first = items[0]
    assert first.title == "Бизнес-ассистент"
    assert first.company_name == "ООО Ромашка"
    assert first.company_inn is None  # hh.ru не отдаёт ИНН — резолвится DaData
    assert first.salary_from == 80000
    assert first.salary_to == 120000
    assert first.url == "https://hh.ru/vacancy/111111"  # не opaque viewUrl с confirm/meta
    assert first.remote is False
    assert first.employment == "полная"
    assert first.source == "hh.ru"
    assert first.description is None  # поиск не отдаёт текст вакансии

    second = items[1]
    assert second.remote is True
    assert second.employment == "частичная"
    assert second.location == "Санкт-Петербург, Невский проспект, 1"


def test_blocked_response_raises_source_unavailable(monkeypatch):
    monkeypatch.setattr(hh.httpx, "AsyncClient", lambda *a, **kw: _FakeClient("<html></html>", 403))
    try:
        asyncio.run(hh.search("ассистент"))
        assert False, "должно было поднять SourceUnavailable"
    except hh.SourceUnavailable as exc:
        assert exc.source == "hh.ru"


def test_missing_state_tag_raises_source_unavailable(monkeypatch):
    # hh.ru поменял вёрстку или отдал заглушку (капча) вместо результатов —
    # источник считается недоступным, а не роняет весь /search
    monkeypatch.setattr(hh.httpx, "AsyncClient", lambda *a, **kw: _FakeClient("<html><body>no template here</body></html>"))
    try:
        asyncio.run(hh.search("ассистент"))
        assert False, "должно было поднять SourceUnavailable"
    except hh.SourceUnavailable:
        pass


def test_empty_vacancies_returns_empty_list(monkeypatch):
    html_text = '<template id="HH-Lux-InitialState">{"vacancySearchResult":{"vacancies":[]}}</template>'
    monkeypatch.setattr(hh.httpx, "AsyncClient", lambda *a, **kw: _FakeClient(html_text))
    items = asyncio.run(hh.search("что угодно"))
    assert items == []
