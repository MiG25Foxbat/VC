"""Только два бесплатных метода DaData. Платные (cleaner.dadata.ru) не трогаем —
их функции закрыты локально в server/enrich/person.py.
"""
from __future__ import annotations

import httpx

from server.sources.base import SourceUnavailable

SUGGEST_URL = "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/party"
FIND_URL = "https://suggestions.dadata.ru/suggestions/api/4_1/rs/findById/party"


def _headers(token: str) -> dict[str, str]:
    return {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": f"Token {token}",
    }


async def suggest_party(name: str, token: str, *, count: int = 3, timeout: float = 15.0) -> list[dict]:
    async with httpx.AsyncClient(timeout=timeout) as client:
        try:
            resp = await client.post(
                SUGGEST_URL, headers=_headers(token), json={"query": name, "count": count}
            )
            resp.raise_for_status()
        except httpx.HTTPError as exc:
            raise SourceUnavailable("dadata_suggest", str(exc)) from exc
    return resp.json().get("suggestions", [])


async def find_by_inn(inn: str, token: str, *, timeout: float = 15.0) -> dict | None:
    async with httpx.AsyncClient(timeout=timeout) as client:
        try:
            resp = await client.post(FIND_URL, headers=_headers(token), json={"query": inn})
            resp.raise_for_status()
        except httpx.HTTPError as exc:
            raise SourceUnavailable("dadata_find", str(exc)) from exc
    suggestions = resp.json().get("suggestions", [])
    return suggestions[0] if suggestions else None
