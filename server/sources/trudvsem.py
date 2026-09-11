"""Источник L0: Работа России, opendata.trudvsem.ru. Открытое API, ключ не нужен.

Сверено вживую через scripts/inspect_trudvsem.py (2026-09-12). Реальная
форма ответа: { "results": { "vacancies": [ { "vacancy": { ... } } ] } },
внутри vacancy — "id", "job-name", "vac_url", "creation-date",
"salary_min"/"salary_max" (int), "company": {"name", "inn", "companycode"},
"region": {"name"}, "addresses": {"address": [{"location"}]}, "duty",
"employment" (часто отсутствует отдельно от "schedule"), "currency".

Два расхождения с тем, что предполагал код до проверки:
- "companycode" — это ОГРН компании, а не альтернативное имя для ИНН.
  Использовать его как запасной company_inn подставляло бы чужой номер
  вместо честного None.
- "salary_max" приходит как 0 (не отсутствует), когда в вакансии указан
  только нижний порог зарплаты — 0 в этом поле нужно читать как None.

Парсер всё равно не падает на неожиданной форме: _first() берёт первое
непустое значение из списка реальных имён ключей, а не падает, если
что-то не совпало.
"""
from __future__ import annotations

import httpx

from server.models import Vacancy
from server.sources.base import SourceUnavailable

BASE_URL = "https://opendata.trudvsem.ru/api/v1/vacancies"


def _first(d: dict, *keys: str, default=None):
    for key in keys:
        value = d.get(key)
        if value not in (None, ""):
            return value
    return default


def _to_int(value) -> int | None:
    if value in (None, ""):
        return None
    try:
        parsed = int(float(str(value).replace(" ", "").replace(",", ".")))
    except (TypeError, ValueError):
        return None
    return parsed or None


def _parse_one(raw: dict) -> Vacancy | None:
    v = raw.get("vacancy", raw) if isinstance(raw, dict) else None
    if not isinstance(v, dict):
        return None

    vacancy_id = _first(v, "id", "vac_id", "vacancy_id")
    url = _first(v, "vac_url", "url")
    title = _first(v, "job-name", "job_name", "title", "name")
    if not (vacancy_id and url and title):
        return None

    company = v.get("company") or v.get("employer") or {}
    if not isinstance(company, dict):
        company = {}

    region = v.get("region") or v.get("area") or {}
    if not isinstance(region, dict):
        region = {}

    addresses = v.get("addresses") or {}
    address_list = addresses.get("address") if isinstance(addresses, dict) else None
    street_address = None
    if isinstance(address_list, list) and address_list:
        first_address = address_list[0]
        if isinstance(first_address, dict):
            street_address = first_address.get("location") or None

    return Vacancy(
        id=str(vacancy_id),
        title=str(title),
        salary_from=_to_int(_first(v, "salary_min", "salary_from")),
        salary_to=_to_int(_first(v, "salary_max", "salary_to")),
        currency=_first(v, "currency") or "RUR",
        employment=_first(v, "employment"),
        remote=None,
        location=street_address or _first(region, "name") or None,
        url=str(url),
        published_at=_first(v, "creation-date", "creation_date", "published_at"),
        description=_first(v, "duty", "description", "requirement"),
        source="trudvsem",
        company_name=_first(company, "name") or None,
        company_inn=_first(company, "inn"),
    )


async def search(
    query: str,
    *,
    limit: int = 20,
    region: str | None = None,
    timeout: float = 15.0,
) -> list[Vacancy]:
    params: dict[str, str | int] = {"text": query, "limit": limit}
    if region:
        params["region"] = region

    async with httpx.AsyncClient(timeout=timeout) as client:
        try:
            resp = await client.get(BASE_URL, params=params)
            resp.raise_for_status()
        except httpx.HTTPError as exc:
            raise SourceUnavailable("trudvsem", str(exc)) from exc

    try:
        data = resp.json()
    except ValueError as exc:
        raise SourceUnavailable("trudvsem", f"не json в ответе: {exc}") from exc

    raw_items = (
        (data.get("results") or {}).get("vacancies")
        or data.get("vacancies")
        or []
    )
    if not isinstance(raw_items, list):
        raise SourceUnavailable("trudvsem", f"неожиданная форма ответа: {type(raw_items)}")

    items: list[Vacancy] = []
    for raw in raw_items:
        parsed = _parse_one(raw)
        if parsed is not None:
            items.append(parsed)
    return items
