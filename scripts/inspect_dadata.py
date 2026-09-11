#!/usr/bin/env python3
"""Один живой запрос к DaData, чтобы свериться с реальной формой ответа
findById/party, особенно с блоком finance — он в коде не проверен.

    export DADATA_TOKEN=...
    python scripts/inspect_dadata.py 7707083893   # ИНН Яндекса для примера

Если структура finance будет другой — поправь _parse_finance
в server/enrich/company.py, остальной код не тронется.
"""
from __future__ import annotations

import json
import os
import sys

import httpx

FIND_URL = "https://suggestions.dadata.ru/suggestions/api/4_1/rs/findById/party"


def main() -> None:
    token = os.getenv("DADATA_TOKEN", "")
    if not token:
        print("Нет DADATA_TOKEN в окружении. export DADATA_TOKEN=... и повтори.")
        sys.exit(1)

    inn = sys.argv[1] if len(sys.argv) > 1 else "7707083893"
    resp = httpx.post(
        FIND_URL,
        headers={
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": f"Token {token}",
        },
        json={"query": inn},
        timeout=15.0,
    )
    resp.raise_for_status()
    data = resp.json()

    suggestions = data.get("suggestions", [])
    print(f"Найдено записей: {len(suggestions)}")
    if not suggestions:
        return

    print(json.dumps(suggestions[0], ensure_ascii=False, indent=2))

    finance = (suggestions[0].get("data") or {}).get("finance")
    print("\n--- Блок finance (сверить с server/enrich/company.py::_parse_finance) ---")
    print(json.dumps(finance, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
