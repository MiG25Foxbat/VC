"""Три вызова модели на один отклик: сжатие досье, письмо, разбор вакансии.
Извлечение сырого текста вакансии (extract_vacancy) вызывается только
на уровне L3 каскада источников, здесь же — генерация под уже
структурированные данные.
"""
from __future__ import annotations

from pathlib import Path

from server.config import Settings
from server.llm.client import chat_json
from server.models import Brief, Letter, LetterFact

PROMPTS_DIR = Path(__file__).parent / "prompts"


def _render(name: str, **kwargs: str) -> str:
    text = (PROMPTS_DIR / name).read_text(encoding="utf-8")
    for key, value in kwargs.items():
        text = text.replace("{{" + key + "}}", value)
    return text


async def extract_vacancy(raw_text: str, *, settings: Settings) -> dict:
    prompt = _render("extract_vacancy.md", raw_text=raw_text)
    return await chat_json(
        prompt, base_url=settings.llm_base_url, api_key=settings.llm_api_key, model=settings.llm_model
    )


async def compress_dossier(sources_block: str, *, settings: Settings) -> dict:
    prompt = _render("compress_dossier.md", sources_block=sources_block)
    return await chat_json(
        prompt, base_url=settings.llm_base_url, api_key=settings.llm_api_key, model=settings.llm_model
    )


async def write_letter(profile: str, vacancy: str, dossier: str, *, settings: Settings) -> Letter:
    prompt = _render("write_letter.md", profile=profile, vacancy=vacancy, dossier=dossier)
    raw = await chat_json(
        prompt,
        base_url=settings.llm_base_url,
        api_key=settings.llm_api_key,
        model=settings.llm_model,
        temperature=0.4,
    )
    facts = [LetterFact(**f) for f in raw.get("facts", []) if f.get("claim") and f.get("source_url")]
    return Letter(text=raw.get("text", ""), facts=facts)


async def write_brief(vacancy: str, dossier: str, *, settings: Settings) -> Brief:
    prompt = _render("write_brief.md", vacancy=vacancy, dossier=dossier)
    raw = await chat_json(
        prompt, base_url=settings.llm_base_url, api_key=settings.llm_api_key, model=settings.llm_model
    )
    return Brief(
        questions=raw.get("questions", []),
        likely_test=raw.get("likely_test"),
        salary_range=raw.get("salary_range"),
        red_flags=raw.get("red_flags", []),
    )
