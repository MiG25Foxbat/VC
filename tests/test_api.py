from unittest.mock import AsyncMock, patch

from fastapi.testclient import TestClient

from server.api.main import app
from server.models import Vacancy

client = TestClient(app)


def test_health():
    resp = client.get("/health")
    assert resp.status_code == 200
    assert resp.json() == {"status": "ok"}


def test_search_returns_items_from_trudvsem():
    fake = Vacancy(
        id="1",
        title="Бизнес-ассистент",
        url="https://trudvsem.ru/x",
        source="trudvsem",
        company_name="ООО Ромашка",
        company_inn="7712345678",
    )
    with patch("server.api.main.trudvsem.search", new=AsyncMock(return_value=[fake])):
        resp = client.post("/search", json={"query": "ассистент"})

    assert resp.status_code == 200
    data = resp.json()
    assert data["items"][0]["title"] == "Бизнес-ассистент"
    assert data["errors"] == []


def test_search_passes_through_vacancy_description():
    fake = Vacancy(
        id="1",
        title="Бизнес-ассистент",
        url="https://trudvsem.ru/x",
        source="trudvsem",
        company_name="ООО Ромашка",
        company_inn="7712345678",
        description="Ведение календаря руководителя, контроль поручений.",
    )
    with patch("server.api.main.trudvsem.search", new=AsyncMock(return_value=[fake])):
        resp = client.post("/search", json={"query": "ассистент"})

    assert resp.status_code == 200
    assert resp.json()["items"][0]["description"] == "Ведение календаря руководителя, контроль поручений."


def test_search_source_failure_does_not_break_response():
    from server.sources.base import SourceUnavailable

    async def boom(*_a, **_kw):
        raise SourceUnavailable("trudvsem", "таймаут")

    with patch("server.api.main.trudvsem.search", new=boom):
        resp = client.post("/search", json={"query": "ассистент"})

    assert resp.status_code == 200
    data = resp.json()
    assert data["items"] == []
    assert data["errors"][0]["source"] == "trudvsem"


def test_search_returns_items_from_superjob_when_requested():
    fake = Vacancy(
        id="2",
        title="Ассистент отдела продаж",
        url="https://www.superjob.ru/x",
        source="superjob",
        company_name="ООО Ромашка",
        company_inn=None,
    )
    with patch("server.api.main.superjob.search", new=AsyncMock(return_value=[fake])):
        resp = client.post("/search", json={"query": "ассистент", "sources": ["superjob"]})

    assert resp.status_code == 200
    data = resp.json()
    assert data["items"][0]["title"] == "Ассистент отдела продаж"
    assert data["items"][0]["source"] == "superjob"
    assert data["errors"] == []


def test_search_superjob_failure_does_not_break_trudvsem_results():
    from server.sources.base import SourceUnavailable

    fake_trudvsem = Vacancy(
        id="1",
        title="Бизнес-ассистент",
        url="https://trudvsem.ru/x",
        source="trudvsem",
        company_name="ООО Ромашка",
        company_inn="7712345678",
    )

    async def boom(*_a, **_kw):
        raise SourceUnavailable("superjob", "SUPERJOB_APP_ID не задан")

    with (
        patch("server.api.main.trudvsem.search", new=AsyncMock(return_value=[fake_trudvsem])),
        patch("server.api.main.superjob.search", new=boom),
    ):
        resp = client.post("/search", json={"query": "ассистент", "sources": ["trudvsem", "superjob"]})

    assert resp.status_code == 200
    data = resp.json()
    assert len(data["items"]) == 1
    assert data["items"][0]["source"] == "trudvsem"
    assert data["errors"] == [{"source": "superjob", "reason": "SUPERJOB_APP_ID не задан"}]


def test_prepare_without_llm_key_returns_card_without_letter():
    payload = {
        "vacancy_id": "1",
        "source": "trudvsem",
        "title": "Бизнес-ассистент",
        "url": "https://trudvsem.ru/x",
        "company_name": "ООО Ромашка",
    }
    resp = client.post("/prepare", json=payload)
    assert resp.status_code == 200
    data = resp.json()
    assert data["vacancy"]["title"] == "Бизнес-ассистент"
    assert data["letter"] is None  # LLM_API_KEY не задан в тестовом окружении
    assert data["meta"]["cache_key"]


def test_forget_deletes_from_cache():
    payload = {
        "vacancy_id": "999",
        "source": "trudvsem",
        "title": "Тестовая вакансия",
        "url": "https://trudvsem.ru/y",
    }
    prepared = client.post("/prepare", json=payload).json()
    cache_key = prepared["meta"]["cache_key"]

    resp = client.post("/forget", json={"cache_key": cache_key})
    assert resp.status_code == 200
    assert resp.json() == {"deleted": True}

    resp_again = client.post("/forget", json={"cache_key": cache_key})
    assert resp_again.json() == {"deleted": False}
