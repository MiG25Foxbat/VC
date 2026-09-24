"""Источник L0: публичные Telegram-каналы с вакансиями, через Telethon
(MTProto-клиент, не HTTP — httpx тут не подходит, поэтому асинхронность
через сам Telethon).

В отличие от job-board API, у Telegram-канала нет полнотекстового поиска
по вакансиям — можно только читать историю сообщений. Поэтому здесь
`query` фильтрует уже прочитанные сообщения по подстроке в тексте
(регистронезависимо), а не уходит в отдельный поисковый эндпоинт.

Требует уже готовую, залогиненную сессию — интерактивный вход (номер
телефона, код подтверждения) в серверном процессе невозможен и не
делается. `TELEGRAM_SESSION` — это Telethon `StringSession`, а не путь
к `.session`-файлу: диск на Render временный и стирается при засыпании,
файл сессии до следующего запроса просто не доживёт. Получить строку
один раз локально:

    python -c "
    from telethon.sync import TelegramClient
    from telethon.sessions import StringSession
    with TelegramClient(StringSession(), api_id, api_hash) as client:
        print(client.session.save())
    "

(первый запуск спросит номер телефона и код — это единственный момент,
когда логин интерактивный) и положить результат в `TELEGRAM_SESSION`
там же, где остальные секреты (Render env vars, не в репозиторий).
"""
from __future__ import annotations

import re
from datetime import datetime, timedelta, timezone

from telethon import TelegramClient
from telethon.errors import FloodWaitError
from telethon.sessions import StringSession

from server.models import Vacancy
from server.sources.base import SourceUnavailable

MAX_AGE_DAYS = 30
MESSAGES_PER_CHANNEL = 200

# Спам, который в канале встречается наравне с вакансиями — не имеет отношения
# к качеству конкретного объявления, отсеивается до всякой остальной фильтрации.
_EXCLUDE_RE = re.compile(
    r"\bреклама\b|\bкурс\b|\bинвестиц|\bкрипт|\bказино\b|заработок от дома без вложений",
    re.I,
)

_SALARY_RE = re.compile(
    r"(?:от\s*)?(\d[\d\s]{2,})\s*(?:-|до|—)?\s*(\d[\d\s]{2,})?\s*(?:руб|₽|rur)",
    re.I,
)


def _extract_salary(text: str) -> tuple[int | None, int | None]:
    match = _SALARY_RE.search(text)
    if not match:
        return None, None
    parts = [p.replace(" ", "") for p in match.groups() if p]
    values = [int(p) for p in parts if p.isdigit()]
    if not values:
        return None, None
    if len(values) == 1:
        return values[0], None
    return values[0], values[1]


def _make_title(text: str) -> str:
    first_line = text.strip().splitlines()[0].strip()
    return first_line[:120] if first_line else "Вакансия из Telegram"


async def search(
    query: str,
    *,
    limit: int = 20,
    region: str | None = None,  # noqa: ARG001 — у канала нет структурированного региона
    timeout: float = 15.0,
    api_id: str,
    api_hash: str,
    session: str,
    channels: list[str],
) -> list[Vacancy]:
    if not (api_id and api_hash and session):
        raise SourceUnavailable("telegram", "TELEGRAM_API_ID/API_HASH/SESSION не заданы")
    if not channels:
        raise SourceUnavailable("telegram", "TELEGRAM_CHANNELS пуст")

    query_lower = query.lower()
    min_date = datetime.now(timezone.utc) - timedelta(days=MAX_AGE_DAYS)
    items: list[Vacancy] = []

    client = TelegramClient(StringSession(session), int(api_id), api_hash, timeout=timeout)
    try:
        await client.connect()
        if not await client.is_user_authorized():
            raise SourceUnavailable("telegram", "сессия не авторизована — нужно перевыпустить TELEGRAM_SESSION")

        for channel in channels:
            try:
                entity = await client.get_entity(channel)
            except (ValueError, FloodWaitError) as exc:
                raise SourceUnavailable("telegram", f"канал {channel} недоступен: {exc}") from exc

            async for message in client.iter_messages(entity, limit=MESSAGES_PER_CHANNEL):
                if message.date and message.date < min_date:
                    break  # сообщения идут от новых к старым, дальше только старее

                text = (message.message or "").strip()
                if not text or query_lower not in text.lower():
                    continue
                if _EXCLUDE_RE.search(text):
                    continue

                salary_from, salary_to = _extract_salary(text)
                username = getattr(entity, "username", None) or channel
                items.append(
                    Vacancy(
                        id=f"{username}:{message.id}",
                        title=_make_title(text),
                        salary_from=salary_from,
                        salary_to=salary_to,
                        currency="RUR",
                        employment=None,
                        remote=None,
                        location=None,
                        url=f"https://t.me/{username}/{message.id}",
                        published_at=message.date.isoformat() if message.date else None,
                        description=text,
                        source="telegram",
                        company_name=None,  # в посте канала нет структурированного поля компании
                        company_inn=None,
                    )
                )
                if len(items) >= limit:
                    return items
    except FloodWaitError as exc:
        raise SourceUnavailable("telegram", f"flood wait {exc.seconds}с") from exc
    finally:
        await client.disconnect()

    return items
