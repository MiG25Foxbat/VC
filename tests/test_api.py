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


def test_prepare_blanks_letter_that_addresses_a_name_not_in_the_dossier():
    # Поймано вживую: одна и та же справка (owner=None, компания —
    # обычное АО, не ИП) дважды подряд дала модели письмо то пустым (как
    # требует write_letter.md), то адресованным вымышленному "Алексею".
    # Раз в справке точно неоткуда взять имя, сервер обязан подстраховать
    # промпт кодом, а не полагаться, что модель сама всегда соблюдает
    # правило "нет имени — пустой текст".
    import dataclasses

    import server.api.main as main_module
    from server.models import Brief, Company, Letter, LetterFact

    async def fake_enrich_company(*, company_name, company_inn, dadata_token):
        company = Company(legal_name='АО "ЯНДЕКС БАНК"', inn="7750004168", status="ACTIVE")
        return company, None, 0.9, 0.0  # owner=None, как в реальном ответе DaData

    async def fake_write_letter(profile, vacancy, dossier, *, settings):
        # модель нарушает собственную инструкцию и всё равно пишет письмо
        # во всех трёх форматах, не только в "text"
        return Letter(
            text="Алексей, добрый день...",
            platform="Алексей, откликаюсь на вакансию...",
            message="Алексей, привет!",
            facts=[LetterFact(claim="выдуманное утверждение", source_url="https://example.test")],
        )

    async def fake_write_brief(vacancy, dossier, *, settings):
        return Brief()

    fake_settings = dataclasses.replace(main_module.settings, llm_api_key="fake-key")
    with (
        patch.object(main_module, "settings", new=fake_settings),
        patch("server.api.main.enrich_company", new=fake_enrich_company),
        patch("server.api.main.generate.write_letter", new=fake_write_letter),
        patch("server.api.main.generate.write_brief", new=fake_write_brief),
    ):
        payload = {
            "vacancy_id": "no-owner-1",
            "source": "manual",
            "title": "Персональный ассистент",
            "url": "",
            "company_name": "Яндекс",
        }
        resp = client.post("/prepare", json=payload)

    assert resp.status_code == 200
    data = resp.json()
    assert data["owner"] is None
    assert data["letter"]["text"] == ""
    assert data["letter"]["platform"] == ""
    assert data["letter"]["message"] == ""
    assert data["letter"]["facts"] == []


def test_prepare_keeps_letter_addressed_to_sole_proprietor_named_in_company_legal_name():
    # Контрольный случай на ту же защиту: у ИП нет отдельного owner, имя
    # руководителя — это и есть company.legal_name. Гвард не должен
    # затирать законное письмо в этом случае.
    import dataclasses

    import server.api.main as main_module
    from server.models import Brief, Company, Letter, LetterFact

    async def fake_enrich_company(*, company_name, company_inn, dadata_token):
        company = Company(legal_name="ИП Сергиенко Андрей Викторович", inn="260905850343", status="ACTIVE")
        return company, None, 0.9, 0.0

    async def fake_write_letter(profile, vacancy, dossier, *, settings):
        return Letter(
            text="Андрей, добрый день...",
            facts=[LetterFact(claim="факт", source_url="https://example.test")],
        )

    async def fake_write_brief(vacancy, dossier, *, settings):
        return Brief()

    fake_settings = dataclasses.replace(main_module.settings, llm_api_key="fake-key")
    with (
        patch.object(main_module, "settings", new=fake_settings),
        patch("server.api.main.enrich_company", new=fake_enrich_company),
        patch("server.api.main.generate.write_letter", new=fake_write_letter),
        patch("server.api.main.generate.write_brief", new=fake_write_brief),
    ):
        payload = {
            "vacancy_id": "sole-proprietor-1",
            "source": "trudvsem",
            "title": "Системный администратор",
            "url": "https://trudvsem.ru/x",
            "company_name": "ИП Сергиенко А. В.",
        }
        resp = client.post("/prepare", json=payload)

    assert resp.status_code == 200
    data = resp.json()
    assert data["letter"]["text"] == "Андрей, добрый день..."


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


def test_prepare_resolves_confirmed_contact_from_vacancy_description():
    # Контакт, написанный работодателем прямо в тексте вакансии — самый
    # надёжный источник, не догадка. Должен прийти с confidence="confirmed".
    payload = {
        "vacancy_id": "with-contact-1",
        "source": "trudvsem",
        "title": "Бизнес-ассистент",
        "url": "https://trudvsem.ru/x",
        "description": "Присылайте резюме на ivan@romashka.ru или пишите в телеграм @ivan_hr.",
    }
    resp = client.post("/prepare", json=payload)

    assert resp.status_code == 200
    contacts = resp.json()["contacts"]
    by_kind = {c["kind"]: c for c in contacts}
    assert by_kind["email"]["value"] == "ivan@romashka.ru"
    assert by_kind["email"]["confidence"] == "confirmed"
    assert by_kind["email"]["source"] == "вакансия"
    assert by_kind["telegram"]["value"] == "@ivan_hr"
    # ссылка на саму вакансию тоже входит как подтверждённый контакт —
    # именно туда уходит "platform"-формат письма
    assert by_kind["url"]["value"] == "https://trudvsem.ru/x"


def test_prepare_does_not_mistake_email_domain_for_telegram_handle():
    # "@handle" ищем только когда перед @ нет буквы/точки/дефиса — иначе
    # хвост email ("...@romashka.ru") ложно распознаётся как telegram.
    payload = {
        "vacancy_id": "email-only-1",
        "source": "trudvsem",
        "title": "Бизнес-ассистент",
        "url": "https://trudvsem.ru/x",
        "description": "Пишите на ivan@romashka.ru",
    }
    resp = client.post("/prepare", json=payload)

    assert resp.status_code == 200
    kinds = [c["kind"] for c in resp.json()["contacts"]]
    assert "telegram" not in kinds


def test_prepare_adds_owner_as_unverified_contact_when_found_in_egrul():
    # Руководитель по ЕГРЮЛ — это имя из реестра, не подтверждённый канал
    # связи. Должен прийти последним и с confidence="verify", не "confirmed".
    import dataclasses

    import server.api.main as main_module
    from server.models import Owner

    async def fake_enrich_company(*, company_name, company_inn, dadata_token):
        owner = Owner(full_name="Иванов Иван Иванович", role="Генеральный директор", source="ЕГРЮЛ")
        return None, owner, 0.0, 0.7

    fake_settings = dataclasses.replace(main_module.settings, llm_api_key="")
    with (
        patch.object(main_module, "settings", new=fake_settings),
        patch("server.api.main.enrich_company", new=fake_enrich_company),
    ):
        payload = {
            "vacancy_id": "egrul-owner-1",
            "source": "trudvsem",
            "title": "Бизнес-ассистент",
            "url": "https://trudvsem.ru/x",
            "company_name": "ООО Ромашка",
        }
        resp = client.post("/prepare", json=payload)

    assert resp.status_code == 200
    contacts = resp.json()["contacts"]
    owner_contact = next(c for c in contacts if c["kind"] == "name")
    assert owner_contact["value"] == "Иванов Иван Иванович"
    assert owner_contact["confidence"] == "verify"
    assert owner_contact["source"] == "ЕГРЮЛ"
