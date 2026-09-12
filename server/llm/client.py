"""Минимальный клиент под протокол OpenAI chat completions. Работает с любым
провайдером из docs/BUILD.md раздела 5, потому что все они говорят на этом
протоколе — смена провайдера это смена LLM_BASE_URL/LLM_MODEL/LLM_API_KEY,
а не этого файла.
"""
from __future__ import annotations

import asyncio
import json

import httpx


class LLMError(Exception):
    pass


RETRY_ATTEMPTS = 3


async def chat_json(
    prompt: str,
    *,
    base_url: str,
    api_key: str,
    model: str,
    temperature: float = 0.3,
    timeout: float = 60.0,
) -> dict:
    """Отправляет промпт, ожидает единственный JSON-объект в ответе.

    Повторяет запрос при обрыве соединения: на практике TLS-рукопожатие
    к generativelanguage.googleapis.com иногда рвётся с пустым
    httpx.ConnectError — не лимит и не авторизация, просто сетевая
    нестабильность, второй попытки обычно достаточно.
    """
    if not api_key:
        raise LLMError("LLM_API_KEY не задан")

    url = base_url.rstrip("/") + "/chat/completions"
    payload = {
        "model": model,
        "messages": [{"role": "user", "content": prompt}],
        "temperature": temperature,
    }
    headers = {"Authorization": f"Bearer {api_key}", "Content-Type": "application/json"}

    last_exc: httpx.HTTPError | None = None
    for attempt in range(RETRY_ATTEMPTS):
        try:
            async with httpx.AsyncClient(timeout=timeout) as client:
                resp = await client.post(url, headers=headers, json=payload)
                resp.raise_for_status()
            break
        except httpx.HTTPError as exc:
            last_exc = exc
            if attempt < RETRY_ATTEMPTS - 1:
                await asyncio.sleep(1.5 * (attempt + 1))
    else:
        raise LLMError(str(last_exc)) from last_exc

    data = resp.json()
    try:
        text = data["choices"][0]["message"]["content"]
    except (KeyError, IndexError, TypeError) as exc:
        raise LLMError(f"неожиданный ответ модели: {data}") from exc

    return _extract_json(text)


def _extract_json(text: str) -> dict:
    """Модели иногда оборачивают JSON в ```json ... ``` несмотря на просьбу
    не делать этого. Снимаем обёртку и берём содержимое между первой { и
    последней }, а не парсим весь текст как есть."""
    cleaned = text.strip()
    if cleaned.startswith("```"):
        cleaned = cleaned.strip("`")
        if cleaned.lower().startswith("json"):
            cleaned = cleaned[4:]

    start = cleaned.find("{")
    end = cleaned.rfind("}")
    if start == -1 or end == -1 or end < start:
        raise LLMError(f"модель не вернула JSON: {text[:300]!r}")

    try:
        return json.loads(cleaned[start : end + 1])
    except json.JSONDecodeError as exc:
        raise LLMError(f"невалидный JSON от модели: {exc}") from exc
