import asyncio
import json
from pathlib import Path

from server.enrich import company as company_mod

FIXTURE = Path(__file__).parent / "fixtures" / "dadata_find_by_id.json"


def test_enrich_from_known_inn(monkeypatch):
    payload = json.loads(FIXTURE.read_text(encoding="utf-8"))
    found = payload["suggestions"][0]

    async def fake_find_by_inn(inn, token, **kwargs):
        assert inn == "7712345678"
        return found

    monkeypatch.setattr(company_mod.dadata, "find_by_inn", fake_find_by_inn)

    company, owner, conf_company, conf_owner = asyncio.run(
        company_mod.enrich_company(
            company_name="ООО Ромашка", company_inn="7712345678", dadata_token="fake-token"
        )
    )

    assert company is not None
    assert company.inn == "7712345678"
    assert company.status == "ACTIVE"
    assert len(company.finance) == 2
    assert company.finance[0].year == 2023  # отсортировано по возрастанию

    assert owner is not None
    assert owner.full_name == "Иванов Иван Иванович"
    assert owner.gender == "M"
    assert owner.source == "ЕГРЮЛ"
    assert conf_company > 0.5
    assert conf_owner > 0.5


def test_no_token_returns_empty_without_network_call(monkeypatch):
    async def boom(*_a, **_kw):
        raise AssertionError("не должен ходить в сеть без токена")

    monkeypatch.setattr(company_mod.dadata, "suggest_party", boom)
    monkeypatch.setattr(company_mod.dadata, "find_by_inn", boom)

    company, owner, conf_company, conf_owner = asyncio.run(
        company_mod.enrich_company(company_name="Кто угодно", company_inn=None, dadata_token="")
    )

    assert company is None
    assert owner is None
    assert conf_company == 0.0
    assert conf_owner == 0.0


def test_name_resolved_to_inn_via_suggest(monkeypatch):
    async def fake_suggest(name, token, **kwargs):
        return [{"data": {"inn": "7712345678"}}]

    async def fake_find(inn, token, **kwargs):
        assert inn == "7712345678"
        return None  # ИНН нашёлся, а выписка — нет, тоже нормальный исход

    monkeypatch.setattr(company_mod.dadata, "suggest_party", fake_suggest)
    monkeypatch.setattr(company_mod.dadata, "find_by_inn", fake_find)

    company, owner, conf_company, _ = asyncio.run(
        company_mod.enrich_company(company_name="ООО Ромашка", company_inn=None, dadata_token="fake")
    )

    assert company is not None
    assert company.inn == "7712345678"
    assert owner is None
    assert conf_company == 0.3
