"""Обогащение компании и первого лица. Цепочка: название → ИНН → выписка.

Если DADATA_TOKEN не задан или источник недоступен, возвращает пустые
блоки с confidence 0 — это честный результат, а не ошибка выполнения.
"""
from __future__ import annotations

from datetime import datetime, timezone

from server.enrich import dadata, person
from server.models import Company, Contact, FinanceYear, Owner
from server.sources.base import SourceUnavailable

EnrichResult = tuple[Company | None, Owner | None, float, float]


async def enrich_company(
    *,
    company_name: str | None,
    company_inn: str | None,
    dadata_token: str,
) -> EnrichResult:
    """Возвращает (company, owner, confidence_company, confidence_owner)."""
    if not dadata_token:
        return None, None, 0.0, 0.0

    inn = company_inn
    if not inn and company_name:
        try:
            suggestions = await dadata.suggest_party(company_name, dadata_token)
        except SourceUnavailable:
            suggestions = []
        if suggestions:
            inn = (suggestions[0].get("data") or {}).get("inn")

    if not inn:
        return None, None, 0.0, 0.0

    try:
        found = await dadata.find_by_inn(inn, dadata_token)
    except SourceUnavailable:
        found = None

    if not found:
        # ИНН есть, но выписка не нашлась — компания частично известна
        return Company(inn=inn, legal_name=company_name), None, 0.3, 0.0

    data = found.get("data") or {}
    state = data.get("state") or {}
    address = data.get("address") or {}
    name = data.get("name") or {}

    company = Company(
        legal_name=found.get("value") or name.get("full") or company_name,
        inn=data.get("inn") or inn,
        ogrn=data.get("ogrn"),
        registered_at=_epoch_millis_to_date(state.get("registration_date")),
        okved=data.get("okved"),
        address=address.get("value"),
        status=state.get("status"),
        site=None,
        finance=_parse_finance(data.get("finance")),
    )

    owner = None
    confidence_owner = 0.0
    management = data.get("management")
    if isinstance(management, dict) and management.get("name"):
        parts = person.split_full_name(management["name"])
        owner = Owner(
            full_name=management["name"].title(),
            gender=parts.get("gender"),
            role=management.get("post"),
            source="ЕГРЮЛ",
            contacts=Contact(),
        )
        confidence_owner = 0.7

    confidence_company = 0.9 if company.status else 0.6
    return company, owner, confidence_company, confidence_owner


def _epoch_millis_to_date(value: object) -> str | None:
    """DaData отдаёт даты как unix-время в миллисекундах, а не строкой —
    это выяснилось на тестовой фикстуре, не на живом ответе, так что
    стоит перепроверить через scripts/inspect_dadata.py при первом
    реальном запуске."""
    if value is None:
        return None
    if isinstance(value, str):
        return value
    try:
        return datetime.fromtimestamp(int(value) / 1000, tz=timezone.utc).date().isoformat()
    except (TypeError, ValueError, OSError):
        return None


def _parse_finance(raw: object) -> list[FinanceYear]:
    """ЕГРЮЛ/DaData отдают финансы годами. Форма ниже не проверена на
    живом ответе (нет токена в среде разработки) — если структура
    окажется другой, эта функция просто вернёт пустой список, ничего
    не сломав выше по цепочке. Свериться через scripts/inspect_dadata.py."""
    years: list[FinanceYear] = []
    if not isinstance(raw, dict):
        return years
    year_data = raw.get("year")
    if not isinstance(year_data, dict):
        return years
    for year_str, values in year_data.items():
        try:
            year = int(year_str)
        except (TypeError, ValueError):
            continue
        if not isinstance(values, dict):
            continue
        years.append(
            FinanceYear(
                year=year,
                revenue=values.get("income") or values.get("revenue"),
                profit=values.get("profit"),
            )
        )
    return sorted(years, key=lambda f: f.year)
