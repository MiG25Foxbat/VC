"""Источник: hh.ru.

Не L0 в обычном смысле — официальный API (api.hh.ru/vacancies) с апреля
2026 закрыт для соискателей (403 без верификации работодателя). Модуль
читает обычную страницу поиска (hh.ru/search/vacancy), которую видит
любой посетитель браузером, и извлекает уже готовый JSON, который сайт
кладёт в HTML для своего JS-приложения (тег `<template
id="HH-Lux-InitialState">`) — не выполняя JavaScript, не используя
headless-браузер.

Это осознанное исключение из общего правила «не обходить защиту от
автоматического доступа» (`.claude/skills/add-source/SKILL.md`) —
robots.txt hh.ru запрещает автоматический доступ к разделу поиска,
схема JSON нигде не документирована и может измениться без
предупреждения. Подключено по прямому запросу продукта, несмотря на
эти риски. Если источник начнёт отдавать капчу/блокировку — это
нормальный исход (`SourceUnavailable`), обходить капчу/блокировку
здесь не пытаемся.

Сверено на живых данных (2026-09-24), см. tests/fixtures/hh_search.html:
- Нет ИНН работодателя и нет текста вакансии (обязанности/требования) в
  результатах поиска — только структурные поля. Как и у SuperJob, ИНН
  резолвится по имени через DaData; описание остаётся пустым, это не
  баг, а формат выдачи поиска (в отличие от SuperJob, где текст в
  списке всё же есть).
- `viewUrl` часто приходит как `/view/confirm?...&meta=<токен>` —
  трекинг-ссылка с opaque-параметрами, не стабильный постоянный адрес
  вакансии. Строим URL сами из `vacancyId` (`/vacancy/<id>`), это
  надёжнее.
- `workFormats` — список `{"workFormatsElement": [...]}`, а не список
  объектов с полем `id`, как можно было бы предположить по названию.
"""
from __future__ import annotations

import html
import json
import re

import httpx

from server.models import Vacancy
from server.sources.base import SourceUnavailable

SEARCH_URL = "https://hh.ru/search/vacancy"

# hh.ru кладёт начальное состояние своего JS-приложения в этот тег —
# оттуда достаём результаты поиска, не выполняя JavaScript.
_STATE_TAG_RE = re.compile(r'<template[^>]*id="HH-Lux-InitialState"[^>]*>(.*?)</template>', re.S)

_USER_AGENT = (
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
    "(KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"
)

_EMPLOYMENT_LABELS = {
    "FULL": "полная",
    "PART": "частичная",
    "PROJECT": "проектная",
    "VOLUNTEER": "волонтёрство",
    "PROBATION": "стажировка",
}


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
        return int(float(value)) or None
    except (TypeError, ValueError):
        return None


def _extract_remote(raw: dict) -> bool | None:
    work_formats = raw.get("workFormats")
    if not isinstance(work_formats, list) or not work_formats:
        return None
    codes: set[str] = set()
    for entry in work_formats:
        if isinstance(entry, dict):
            codes.update(entry.get("workFormatsElement") or [])
    if not codes:
        return None
    return "REMOTE" in codes


def _extract_employment(raw: dict) -> str | None:
    employment = raw.get("employment")
    code = employment.get("@type") if isinstance(employment, dict) else None
    if not code:
        return None
    return _EMPLOYMENT_LABELS.get(code, code)


def _extract_location(raw: dict) -> str | None:
    address = raw.get("address")
    if isinstance(address, dict) and address.get("displayName"):
        return address["displayName"]
    area = raw.get("area")
    if isinstance(area, dict):
        return area.get("name")
    return None


def _parse_one(raw: dict) -> Vacancy | None:
    if not isinstance(raw, dict):
        return None

    vacancy_id = raw.get("vacancyId")
    title = raw.get("name")
    if not vacancy_id or not title:
        return None

    company = raw.get("company") or {}
    if not isinstance(company, dict):
        company = {}

    compensation = raw.get("compensation") or {}
    if not isinstance(compensation, dict):
        compensation = {}

    return Vacancy(
        id=str(vacancy_id),
        title=str(title),
        salary_from=_to_int(compensation.get("from")),
        salary_to=_to_int(compensation.get("to")),
        currency=_first(compensation, "currencyCode") or "RUR",
        employment=_extract_employment(raw),
        remote=_extract_remote(raw),
        location=_extract_location(raw),
        url=f"https://hh.ru/vacancy/{vacancy_id}",
        published_at=_first(raw, "creationTime", "publicationTime"),
        description=None,  # поиск не отдаёт текст вакансии, см. docstring модуля
        source="hh.ru",
        company_name=_first(company, "visibleName", "name"),
        company_inn=None,  # hh.ru не отдаёт ИНН — резолвится по имени через DaData
    )


async def search(
    query: str,
    *,
    limit: int = 20,
    region: str | None = None,  # noqa: ARG001 — hh.ru использует числовые area-коды,
    # свободный текст региона сюда не транслируется (см. docstring); всегда ищем по всей России
    timeout: float = 15.0,
) -> list[Vacancy]:
    params = {"text": query, "area": 113, "page": 0}
    headers = {"User-Agent": _USER_AGENT, "Accept-Language": "ru-RU,ru;q=0.9"}

    async with httpx.AsyncClient(timeout=timeout) as client:
        try:
            resp = await client.get(SEARCH_URL, params=params, headers=headers)
        except httpx.HTTPError as exc:
            raise SourceUnavailable("hh.ru", str(exc)) from exc

    if resp.status_code == 403:
        raise SourceUnavailable("hh.ru", "заблокирован (403) — hh.ru ограничил запрос")
    try:
        resp.raise_for_status()
    except httpx.HTTPError as exc:
        raise SourceUnavailable("hh.ru", str(exc)) from exc

    match = _STATE_TAG_RE.search(resp.text)
    if not match:
        raise SourceUnavailable("hh.ru", "не найден тег состояния — hh.ru изменил вёрстку или отдал заглушку")

    try:
        state = json.loads(html.unescape(match.group(1)))
    except json.JSONDecodeError as exc:
        raise SourceUnavailable("hh.ru", f"не удалось разобрать JSON состояния: {exc}") from exc

    raw_items = ((state.get("vacancySearchResult") or {}).get("vacancies")) or []
    if not isinstance(raw_items, list):
        raise SourceUnavailable("hh.ru", f"неожиданная форма ответа: {type(raw_items)}")

    items: list[Vacancy] = []
    for raw in raw_items[:limit]:
        parsed = _parse_one(raw)
        if parsed is not None:
            items.append(parsed)
    return items
