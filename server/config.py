"""Настройки процесса. Всё из переменных окружения, ничего не захардкожено.

Смена провайдера модели — это смена трёх переменных, а не правка кода.
"""
from __future__ import annotations

import os
from dataclasses import dataclass


@dataclass(frozen=True)
class Settings:
    llm_provider: str
    llm_base_url: str
    llm_model: str
    llm_api_key: str

    dadata_token: str
    superjob_app_id: str

    telegram_api_id: str
    telegram_api_hash: str
    telegram_session: str  # StringSession, не путь к .session-файлу — диск на Render временный
    telegram_channels: list[str]

    cache_ttl_seconds: int
    http_timeout_seconds: float
    max_concurrent_sources: int


def load_settings() -> Settings:
    return Settings(
        llm_provider=os.getenv("LLM_PROVIDER", "google"),
        llm_base_url=os.getenv(
            "LLM_BASE_URL",
            "https://generativelanguage.googleapis.com/v1beta/openai/",
        ),
        llm_model=os.getenv("LLM_MODEL", "gemini-3.5-flash-lite"),
        llm_api_key=os.getenv("LLM_API_KEY", ""),
        dadata_token=os.getenv("DADATA_TOKEN", ""),
        superjob_app_id=os.getenv("SUPERJOB_APP_ID", ""),
        telegram_api_id=os.getenv("TELEGRAM_API_ID", ""),
        telegram_api_hash=os.getenv("TELEGRAM_API_HASH", ""),
        telegram_session=os.getenv("TELEGRAM_SESSION", ""),
        telegram_channels=[
            c.strip() for c in os.getenv("TELEGRAM_CHANNELS", "it_vakansii_jobs").split(",") if c.strip()
        ],
        cache_ttl_seconds=int(os.getenv("CACHE_TTL_SECONDS", "604800")),
        http_timeout_seconds=float(os.getenv("HTTP_TIMEOUT_SECONDS", "15")),
        max_concurrent_sources=int(os.getenv("MAX_CONCURRENT_SOURCES", "6")),
    )
