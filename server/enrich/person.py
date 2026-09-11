"""Замена трём платным методам DaData (cleaner.dadata.ru), которые в проекте
не используются. Всё локально, без сети и без денег.
"""
from __future__ import annotations

import re

import phonenumbers
from phonenumbers import carrier as pn_carrier
from phonenumbers import geocoder as pn_geocoder
from phonenumbers import timezone as pn_timezone

ROLE_PREFIXES = {
    "info", "hr", "sales", "office", "support", "mail", "job", "jobs",
    "contact", "hello", "admin", "no-reply", "noreply", "vacancy", "cv",
    "recruitment", "recruiting", "career", "careers",
}


def is_role_email(email: str) -> bool:
    """True, если адрес похож на общий ящик отдела, а не на личный."""
    local = email.split("@")[0].lower()
    local = re.split(r"[.\-_+0-9]", local)[0]
    return local in ROLE_PREFIXES


def describe_phone(raw: str, default_region: str = "RU") -> dict:
    """Регион, оператор и часовой пояс по номеру. Нужно не для галочки:
    письмо и звонок должны попадать в рабочее время работодателя."""
    try:
        parsed = phonenumbers.parse(raw, default_region)
    except phonenumbers.NumberParseException:
        return {"valid": False}

    if not phonenumbers.is_valid_number(parsed):
        return {"valid": False}

    zones = pn_timezone.time_zones_for_number(parsed)
    return {
        "valid": True,
        "e164": phonenumbers.format_number(parsed, phonenumbers.PhoneNumberFormat.E164),
        "region": pn_geocoder.description_for_number(parsed, "ru") or None,
        "carrier": pn_carrier.name_for_number(parsed, "ru") or None,
        "timezone": zones[0] if zones else None,
    }


_MALE_PATRONYMIC_ENDINGS = ("ович", "евич", "ич")
_FEMALE_PATRONYMIC_ENDINGS = ("овна", "евна", "инична")


def split_full_name(raw: str) -> dict:
    """Разбивает 'ИВАНОВ ИВАН ИВАНОВИЧ' на части и определяет пол по отчеству.

    Это не замена DaData "Разбор ФИО" целиком — тот ещё склоняет по
    падежам. Для MVP склонение не нужно: письмо обращается по имени
    в именительном падеже, "Здравствуйте, Иван", и этого достаточно.
    """
    parts = raw.strip().title().split()
    result: dict[str, str | None] = {
        "last_name": None,
        "first_name": None,
        "patronymic": None,
        "gender": None,
    }
    if len(parts) >= 1:
        result["last_name"] = parts[0]
    if len(parts) >= 2:
        result["first_name"] = parts[1]
    if len(parts) >= 3:
        patronymic = parts[2]
        result["patronymic"] = patronymic
        lowered = patronymic.lower()
        if lowered.endswith(_FEMALE_PATRONYMIC_ENDINGS):
            result["gender"] = "F"
        elif lowered.endswith(_MALE_PATRONYMIC_ENDINGS):
            result["gender"] = "M"
    return result
