"""Контракт данных. Соответствует разделу 3 docs/BUILD.md.

Любое поле, которое не удалось собрать, остаётся None или пустым
списком — это осознанный результат, а не ошибка. Модель никогда
не подставляет догадку вместо отсутствующих данных.
"""
from __future__ import annotations

from pydantic import BaseModel, Field


class Vacancy(BaseModel):
    id: str
    title: str
    salary_from: int | None = None
    salary_to: int | None = None
    currency: str = "RUR"
    employment: str | None = None
    remote: bool | None = None
    location: str | None = None
    url: str
    published_at: str | None = None
    description: str | None = None
    source: str
    company_name: str | None = None
    company_inn: str | None = None


class FinanceYear(BaseModel):
    year: int
    revenue: int | None = None
    profit: int | None = None


class Company(BaseModel):
    legal_name: str | None = None
    inn: str | None = None
    ogrn: str | None = None
    registered_at: str | None = None
    okved: str | None = None
    address: str | None = None
    status: str | None = None
    site: str | None = None
    finance: list[FinanceYear] = Field(default_factory=list)


class Contact(BaseModel):
    email: str | None = None
    email_is_role: bool | None = None
    phone: str | None = None
    phone_region: str | None = None
    phone_timezone: str | None = None
    telegram: str | None = None
    page: str | None = None


class Signal(BaseModel):
    text: str
    url: str
    date: str | None = None


class Owner(BaseModel):
    full_name: str | None = None
    gender: str | None = None
    role: str | None = None
    source: str | None = None
    contacts: Contact = Field(default_factory=Contact)
    signals: list[Signal] = Field(default_factory=list)


class Review(BaseModel):
    source: str
    rating: float | None = None
    count: int | None = None
    summary: str | None = None
    url: str | None = None


class LetterFact(BaseModel):
    claim: str
    source_url: str


class Letter(BaseModel):
    text: str
    platform: str = ""
    message: str = ""
    facts: list[LetterFact] = Field(default_factory=list)


class ContactCandidate(BaseModel):
    """Один вариант "куда писать" с прозрачной проверкой источника.

    confidence: "confirmed" — контакт прямо из текста вакансии или сама
    вакансия; "likely" — со страницы/из карточки компании; "verify" —
    имя из реестра (ЕГРЮЛ), не подтверждённый канал связи, до отправки
    стоит перепроверить, что это тот самый человек.
    """

    label: str
    role: str | None = None
    value: str
    kind: str  # email | phone | telegram | url | name
    source: str
    confidence: str  # confirmed | likely | verify


class Brief(BaseModel):
    questions: list[str] = Field(default_factory=list)
    likely_test: str | None = None
    salary_range: str | None = None
    red_flags: list[str] = Field(default_factory=list)


class Confidence(BaseModel):
    company: float = 0.0
    owner: float = 0.0
    reviews: float = 0.0


class Meta(BaseModel):
    confidence: Confidence = Field(default_factory=Confidence)
    cache_key: str
    expires_at: str


class ResultCard(BaseModel):
    vacancy: Vacancy
    company: Company | None = None
    owner: Owner | None = None
    reviews: list[Review] = Field(default_factory=list)
    letter: Letter | None = None
    brief: Brief | None = None
    contacts: list[ContactCandidate] = Field(default_factory=list)
    meta: Meta
