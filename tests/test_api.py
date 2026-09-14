from unittest.mock import AsyncMock, patch

from fastapi.testclient import TestClient

from server.api.main import app
from server.models import Vacancy

client = TestClient(app)


def test_health():
    resp = client.get("/health")
    assert resp.status_code == 200
    assert resp.json() == {"status": "ok"}


def test_cors_allows_browser_clients():
    # Flutter web (и любой другой браузерный клиент) идёт с другого origin —
    # без этого заголовка браузер молча блокирует ответ как "Failed to fetch",
    # хотя сервер его честно обработал. Поймано вживую на реальном клиенте.
    resp = client.get("/health", headers={"Origin": "http://localhost:8734"})
    assert resp.headers.get("access-control-allow-origin") == "*"


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


def test_extract_returns_structured_vacancy():
    import dataclasses

    import server.api.main as main_module

    async def fake_extract_vacancy(raw_text, *, settings):
        assert "Ищем бизнес-ассистента" in raw_text
        return {
            "title": "Бизнес-ассистент",
            "salary_from": 100000,
            "salary_to": None,
            "currency": "RUB",
            "employment": "полная занятость",
            "remote": True,
            "location": "Москва",
            "company_name": "ООО Ромашка",
            "duties": ["Вести календарь"],
            "requirements": ["Опыт от года"],
            "conditions": ["Удалённо"],
        }

    fake_settings = dataclasses.replace(main_module.settings, llm_api_key="fake-key")
    with (
        patch.object(main_module, "settings", new=fake_settings),
        patch("server.api.main.generate.extract_vacancy", new=fake_extract_vacancy),
    ):
        resp = client.post("/extract", json={"raw_text": "Ищем бизнес-ассистента в ООО Ромашка"})

    assert resp.status_code == 200
    data = resp.json()
    assert data["title"] == "Бизнес-ассистент"
    assert data["company_name"] == "ООО Ромашка"
    assert data["duties"] == ["Вести календарь"]


def test_extract_without_llm_key_returns_bad_request():
    resp = client.post("/extract", json={"raw_text": "Ищем бизнес-ассистента"})
    assert resp.status_code == 400


def test_extract_rejects_empty_text():
    import dataclasses

    import server.api.main as main_module

    fake_settings = dataclasses.replace(main_module.settings, llm_api_key="fake-key")
    with patch.object(main_module, "settings", new=fake_settings):
        resp = client.post("/extract", json={"raw_text": "   "})

    assert resp.status_code == 400


def test_extract_model_failure_returns_502_not_empty_response():
    import dataclasses

    import server.api.main as main_module
    from server.llm.client import LLMError

    async def boom(raw_text, *, settings):
        raise LLMError("модель не вернула JSON")

    fake_settings = dataclasses.replace(main_module.settings, llm_api_key="fake-key")
    with (
        patch.object(main_module, "settings", new=fake_settings),
        patch("server.api.main.generate.extract_vacancy", new=boom),
    ):
        resp = client.post("/extract", json={"raw_text": "Ищем бизнес-ассистента"})

    assert resp.status_code == 502


def test_prepare_uses_profile_text_from_request_over_server_file():
    # Бэкенд без состояния и на Render server/profiles/default.yaml просто
    # нет — это личные данные, в git не коммитятся. Клиент обязан прислать
    # текст профиля сам, а не полагаться на файл на сервере.
    import dataclasses

    import server.api.main as main_module

    captured = {}

    async def fake_write_letter(profile, vacancy, dossier, *, settings):
        captured["profile"] = profile
        from server.models import Letter

        return Letter(text="письмо", facts=[])

    async def fake_write_brief(vacancy, dossier, *, settings):
        from server.models import Brief

        return Brief()

    fake_settings = dataclasses.replace(main_module.settings, llm_api_key="fake-key")
    with (
        patch.object(main_module, "settings", new=fake_settings),
        patch("server.api.main.generate.write_letter", new=fake_write_letter),
        patch("server.api.main.generate.write_brief", new=fake_write_brief),
    ):
        payload = {
            "vacancy_id": "profile-text-1",
            "source": "trudvsem",
            "title": "Бизнес-ассистент",
            "url": "https://trudvsem.ru/x",
            "profile_text": "name: Тест Тестов\ncontacts: {}\n",
        }
        resp = client.post("/prepare", json=payload)

    assert resp.status_code == 200
    assert captured["profile"] == "name: Тест Тестов\ncontacts: {}\n"


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
