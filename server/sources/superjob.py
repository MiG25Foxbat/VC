"""Источник L0: SuperJob, api.superjob.ru. Открытое API, нужен только
X-Api-App-Id (секретный ключ приложения, регистрация бесплатная на
https://api.superjob.ru/register, ключ смотреть на https://api.superjob.ru/info).

Схема ответа сверена по официальной документации и вживую (2026-09-12,
рабочий ключ), метод GET /2.0/vacancies/, поле objects[]:
"id", "profession", "firm_name", "payment_from"/"payment_to" (int,
0 означает «оклад по договорённости», не 0 рублей), "currency",
"date_published" (unixtime), "address", "town": {"title"}, "link".
У SuperJob нет ИНН работодателя в вакансии — цепочка обогащения по
названию компании уже умеет резолвить ИНН через DaData suggest
(server/enrich/company.py), поэтому company_inn всегда None для
этого источника, это не баг.

Расхождение с документацией, найденное на живых данных: поле "work"
(должностные обязанности, по описанию в документации) у всех
проверенных вакансий пустое — реальный текст вакансии лежит в
"candidat" ("требования к кандидату" по документации, но по факту
туда же сваливают весь текст вакансии), иногда ещё в "compensation".
Берём первое непустое из трёх.
"""
from __future__ import annotations

from datetime import datetime, timezone

import httpx

from server.models import Vacancy
from server.sources.base import SourceUnavailable

BASE_URL = "https://api.superjob.ru/2.0/vacancies/"


def _to_int(value) -> int | None:
    if value in (None, ""):
        return None
    try:
        parsed = int(value)
    except (TypeError, ValueError):
        return None
    return parsed or None


def _unixtime_to_date(value) -> str | None:
    if value in (None, ""):
        return None
    try:
        return datetime.fromtimestamp(int(value), tz=timezone.utc).date().isoformat()
    except (TypeError, ValueError, OSError):
        return None


def _parse_one(v: dict) -> Vacancy | None:
    if not isinstance(v, dict):
        return None

    vacancy_id = v.get("id")
    url = v.get("link")
    title = v.get("profession")
    if not (vacancy_id and url and title):
        return None

    town = v.get("town") or {}
    if not isinstance(town, dict):
        town = {}

    type_of_work = v.get("type_of_work") or {}
    if not isinstance(type_of_work, dict):
        type_of_work = {}

    return Vacancy(
        id=str(vacancy_id),
        title=str(title),
        salary_from=_to_int(v.get("payment_from")),
        salary_to=_to_int(v.get("payment_to")),
        currency=v.get("currency") or "RUR",
        employment=type_of_work.get("title") or None,
        remote=None,
        location=v.get("address") or town.get("title") or None,
        url=str(url),
        published_at=_unixtime_to_date(v.get("date_published")),
        description=v.get("work") or v.get("candidat") or v.get("compensation") or None,
        source="superjob",
        company_name=v.get("firm_name") or None,
        company_inn=None,  # SuperJob не отдаёт ИНН — резолвится по имени через DaData
    )


async def search(
    query: str,
    *,
    limit: int = 20,
    region: str | None = None,
    timeout: float = 15.0,
    app_id: str,
) -> list[Vacancy]:
    if not app_id:
        raise SourceUnavailable("superjob", "SUPERJOB_APP_ID не задан")

    params: dict[str, str | int] = {"keyword": query, "count": min(limit, 100)}
    if region:
        params["town"] = region

    async with httpx.AsyncClient(timeout=timeout) as client:
        try:
            resp = await client.get(
                BASE_URL, headers={"X-Api-App-Id": app_id}, params=params
            )
            resp.raise_for_status()
        except httpx.HTTPError as exc:
            raise SourceUnavailable("superjob", str(exc)) from exc

    try:
        data = resp.json()
    except ValueError as exc:
        raise SourceUnavailable("superjob", f"не json в ответе: {exc}") from exc

    raw_items = data.get("objects")
    if not isinstance(raw_items, list):
        raise SourceUnavailable("superjob", f"неожиданная форма ответа: {type(raw_items)}")

    items: list[Vacancy] = []
    for raw in raw_items:
        parsed = _parse_one(raw)
        if parsed is not None:
            items.append(parsed)
    return items
