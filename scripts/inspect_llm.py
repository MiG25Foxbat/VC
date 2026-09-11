#!/usr/bin/env python3
"""Проверка, что ключ модели работает и что LLM_MODEL существует
под этим провайдером.

    export LLM_API_KEY=...
    python scripts/inspect_llm.py
"""
from __future__ import annotations

import asyncio
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))

from server.config import load_settings  # noqa: E402
from server.llm.client import LLMError, chat_json  # noqa: E402


async def main() -> None:
    settings = load_settings()
    if not settings.llm_api_key:
        print("Нет LLM_API_KEY в окружении.")
        return

    print(f"Провайдер: {settings.llm_provider}, модель: {settings.llm_model}")
    try:
        result = await chat_json(
            'Ответь строго JSON: {"ok": true, "note": "работает"}',
            base_url=settings.llm_base_url,
            api_key=settings.llm_api_key,
            model=settings.llm_model,
        )
    except LLMError as exc:
        print(f"Ошибка: {exc}")
        return

    print("Ответ модели:", result)


if __name__ == "__main__":
    asyncio.run(main())
