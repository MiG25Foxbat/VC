#!/usr/bin/env python3
"""Один живой запрос к Работе России, чтобы свериться с реальной формой
ответа. Запусти это первым, до того как доверять server/sources/trudvsem.py:

    python scripts/inspect_trudvsem.py "бизнес-ассистент"

Печатает сырой JSON первой вакансии целиком. Если имена ключей будут
другими, чем в комментарии наверху server/sources/trudvsem.py — поправь
их там, а не переписывай логику вокруг.
"""
from __future__ import annotations

import json
import sys

import httpx

BASE_URL = "https://opendata.trudvsem.ru/api/v1/vacancies"


def main() -> None:
    query = sys.argv[1] if len(sys.argv) > 1 else "ассистент"
    resp = httpx.get(BASE_URL, params={"text": query, "limit": 3}, timeout=15.0)
    resp.raise_for_status()
    data = resp.json()

    print("Верхнеуровневые ключи ответа:", list(data.keys()))

    vacancies = (data.get("results") or {}).get("vacancies") or data.get("vacancies") or []
    print(f"Найдено вакансий в этом ответе: {len(vacancies)}")

    if not vacancies:
        print("Пусто. Проверь запрос или формат ответа поменялся сильнее, чем ожидалось.")
        return

    print("\n--- Первая вакансия целиком ---")
    print(json.dumps(vacancies[0], ensure_ascii=False, indent=2))

    first = vacancies[0].get("vacancy", vacancies[0])
    print("\n--- Ключи внутри неё ---")
    print(list(first.keys()) if isinstance(first, dict) else type(first))

    company = first.get("company") if isinstance(first, dict) else None
    if isinstance(company, dict):
        print("\n--- Ключи внутри company ---")
        print(list(company.keys()))
        print("Есть ли ИНН прямо в вакансии:", "inn" in company)


if __name__ == "__main__":
    main()
