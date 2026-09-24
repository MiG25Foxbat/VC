"""FastAPI-сервис. Без состояния: всё, что найдено и не отправлено,
хранит клиент. Кеш здесь — только чтобы не бить по источникам и по
модели повторно за секунды, а не как хранилище."""
from __future__ import annotations

import logging
import re
from datetime import datetime, timedelta, timezone
from pathlib import Path

import phonenumbers
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from pydantic import BaseModel

from server.cache import TTLCache
from server.config import load_settings
from server.enrich.company import enrich_company
from server.llm import generate
from server.models import Company, ContactCandidate, Confidence, Letter, Meta, Owner, ResultCard, Vacancy
from server.sources import superjob, trudvsem
from server.sources.base import SourceUnavailable

logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")
log = logging.getLogger("agent")

settings = load_settings()
cache = TTLCache(ttl_seconds=settings.cache_ttl_seconds)
PROFILES_DIR = Path(__file__).resolve().parent.parent / "profiles"

app = FastAPI(title="Агент откликов", version="0.1.0")

# Клиент — Flutter web (и любой другой браузерный клиент) с другого
# origin. API без авторизации и без cookie-сессий, скрывать тут нечего —
# ограничивать origin означало бы только ломать легитимных клиентов.
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)


# ---- схемы запросов ---------------------------------------------------

class SearchRequest(BaseModel):
    query: str
    region: str | None = None
    remote: bool | None = None
    salary_from: int | None = None
    sources: list[str] | None = None
    limit: int = 20


class SearchResponseItem(BaseModel):
    id: str
    title: str
    company_name: str | None
    company_inn: str | None
    salary_from: int | None
    salary_to: int | None
    location: str | None
    url: str
    published_at: str | None
    description: str | None
    source: str


class SearchResponse(BaseModel):
    items: list[SearchResponseItem]
    errors: list[dict]


class PrepareRequest(BaseModel):
    """Клиент присылает то, что уже получил из /search — сервер без
    состояния и вакансию по id заново не ищет."""

    vacancy_id: str
    source: str
    profile_id: str = "default"
    profile_text: str | None = None
    title: str
    url: str
    company_name: str | None = None
    company_inn: str | None = None
    salary_from: int | None = None
    salary_to: int | None = None
    location: str | None = None
    published_at: str | None = None
    description: str | None = None


class ForgetRequest(BaseModel):
    cache_key: str


class ExtractRequest(BaseModel):
    """Вакансия, найденная где-то в сети и вставленная вручную —
    L3 каскада источников из раздела 4 docs/BUILD.md."""

    raw_text: str


class ExtractResponse(BaseModel):
    title: str | None = None
    salary_from: int | None = None
    salary_to: int | None = None
    currency: str | None = None
    employment: str | None = None
    remote: bool | None = None
    location: str | None = None
    company_name: str | None = None
    duties: list[str] = []
    requirements: list[str] = []
    conditions: list[str] = []


# ---- эндпоинты ---------------------------------------------------------

@app.get("/health")
async def health() -> dict:
    return {"status": "ok"}


@app.post("/search", response_model=SearchResponse)
async def search(req: SearchRequest) -> SearchResponse:
    cache.sweep()
    active_sources = req.sources or ["trudvsem"]
    items: list[Vacancy] = []
    errors: list[dict] = []

    if "trudvsem" in active_sources:
        try:
            found = await trudvsem.search(
                req.query, limit=req.limit, region=req.region, timeout=settings.http_timeout_seconds
            )
            items.extend(found)
        except SourceUnavailable as exc:
            log.warning("источник недоступен: %s", exc)
            errors.append({"source": exc.source, "reason": exc.reason})

    if "superjob" in active_sources:
        try:
            found = await superjob.search(
                req.query,
                limit=req.limit,
                region=req.region,
                timeout=settings.http_timeout_seconds,
                app_id=settings.superjob_app_id,
            )
            items.extend(found)
        except SourceUnavailable as exc:
            log.warning("источник недоступен: %s", exc)
            errors.append({"source": exc.source, "reason": exc.reason})

    for name in active_sources:
        if name not in ("trudvsem", "superjob"):
            errors.append({"source": name, "reason": "источник ещё не подключён"})

    if req.salary_from:
        items = [v for v in items if v.salary_from is None or v.salary_from >= req.salary_from]

    response_items = [
        SearchResponseItem(
            id=v.id,
            title=v.title,
            company_name=v.company_name,
            company_inn=v.company_inn,
            salary_from=v.salary_from,
            salary_to=v.salary_to,
            location=v.location,
            url=v.url,
            published_at=v.published_at,
            description=v.description,
            source=v.source,
        )
        for v in items
    ]
    return SearchResponse(items=response_items, errors=errors)


@app.post("/extract", response_model=ExtractResponse)
async def extract(req: ExtractRequest) -> ExtractResponse:
    """Разбирает вставленный вручную текст вакансии в структуру, которую
    можно тут же отдать в /prepare — тот же контракт полей, что и у
    вакансии из /search (title, company_name, salary_from...)."""
    if not req.raw_text.strip():
        raise HTTPException(status_code=400, detail="Пустой текст вакансии")
    if not settings.llm_api_key:
        raise HTTPException(status_code=400, detail="LLM_API_KEY не задан — разбор текста недоступен")

    try:
        raw = await generate.extract_vacancy(req.raw_text, settings=settings)
    except Exception as exc:  # модель могла вернуть не-JSON или упасть по сети
        raise HTTPException(status_code=502, detail=f"Не удалось разобрать текст: {exc}") from exc

    return ExtractResponse(
        title=raw.get("title"),
        salary_from=raw.get("salary_from"),
        salary_to=raw.get("salary_to"),
        currency=raw.get("currency"),
        employment=raw.get("employment"),
        remote=raw.get("remote"),
        location=raw.get("location"),
        company_name=raw.get("company_name"),
        duties=raw.get("duties") or [],
        requirements=raw.get("requirements") or [],
        conditions=raw.get("conditions") or [],
    )


@app.post("/prepare", response_model=ResultCard)
async def prepare(req: PrepareRequest) -> ResultCard | JSONResponse:
    cache_key = cache.make_key(req.source, req.vacancy_id, req.profile_id)
    cached = cache.get(cache_key)
    if cached is not None:
        return cached

    vacancy = Vacancy(
        id=req.vacancy_id,
        title=req.title,
        salary_from=req.salary_from,
        salary_to=req.salary_to,
        location=req.location,
        url=req.url,
        published_at=req.published_at,
        description=req.description,
        source=req.source,
        company_name=req.company_name,
        company_inn=req.company_inn,
    )

    company, owner, conf_company, conf_owner = await enrich_company(
        company_name=vacancy.company_name,
        company_inn=vacancy.company_inn,
        dadata_token=settings.dadata_token,
    )

    letter = None
    brief = None
    if settings.llm_api_key:
        dossier_block = _build_dossier_block(vacancy, company, owner)
        profile_text = req.profile_text or _load_profile(req.profile_id)
        try:
            letter = await generate.write_letter(
                profile_text, vacancy.model_dump_json(), dossier_block, settings=settings
            )
            if not _resolve_addressee(company, owner):
                # Адресата нет — письмо всё равно должно писаться (на
                # основе вакансии/профиля, без личного имени), но модель
                # иногда всё же подставляет имя от себя (поймано вживую).
                # Не выбрасываем всё письмо целиком — вырезаем только
                # приветствие с выдуманным именем, остальной текст (живая
                # деталь, гипотеза, факты) фабрикацией не является.
                letter = Letter(
                    text=_strip_fabricated_greeting(letter.text),
                    platform=_strip_fabricated_greeting(letter.platform),
                    message=_strip_fabricated_greeting(letter.message),
                    facts=letter.facts,
                )
            brief = await generate.write_brief(vacancy.model_dump_json(), dossier_block, settings=settings)
        except Exception as exc:  # ошибка модели не должна ронять карточку целиком
            log.warning("модель не отработала: %s", exc)
    else:
        log.info("LLM_API_KEY не задан — письмо и разбор пропущены")

    contacts = _resolve_contacts(vacancy, owner)

    expires_at = datetime.now(timezone.utc) + timedelta(seconds=settings.cache_ttl_seconds)
    card = ResultCard(
        vacancy=vacancy,
        company=company,
        owner=owner,
        reviews=[],
        letter=letter,
        brief=brief,
        contacts=contacts,
        meta=Meta(
            confidence=Confidence(company=conf_company, owner=conf_owner, reviews=0.0),
            cache_key=cache_key,
            expires_at=expires_at.isoformat(),
        ),
    )
    cache.set(cache_key, card)
    return card


@app.post("/forget")
async def forget(req: ForgetRequest) -> dict:
    deleted = cache.delete(req.cache_key)
    return {"deleted": deleted}


# ---- вспомогательное ----------------------------------------------------

def _load_profile(profile_id: str) -> str:
    path = PROFILES_DIR / f"{profile_id}.yaml"
    if not path.exists():
        log.warning("профиль %s не найден по пути %s", profile_id, path)
        return ""
    return path.read_text(encoding="utf-8")


def _resolve_addressee(company: Company | None, owner: Owner | None) -> str | None:
    """Настоящее имя, к которому можно обратиться в письме: либо
    найденный руководитель, либо ИП, чьё имя и есть название компании
    ("ИП Сергиенко Андрей Викторович"). None — значит адресата нет,
    письмо всё равно пишется, но без личного имени."""
    if owner and owner.full_name:
        return owner.full_name
    if company and company.legal_name:
        name = company.legal_name.upper()
        if name.startswith("ИП ") or "ИНДИВИДУАЛЬНЫЙ ПРЕДПРИНИМАТЕЛЬ" in name:
            return company.legal_name
    return None


_GREETING_NAME_RE = re.compile(r"^\s*([А-ЯЁ][а-яё]+)\s*[,!]")
_GENERIC_GREETING_WORDS = {
    "добрый", "здравствуйте", "приветствую", "уважаемые", "уважаемый",
    "уважаемая", "коллеги", "команда",
}


def _strip_fabricated_greeting(text: str) -> str:
    """Адресата нет, но модель иногда всё равно открывает письмо личным
    именем ("Алексей, добрый день..."), хотя write_letter.md прямо
    просит обращаться без имени в этом случае. Ловим только эту
    ситуацию — первое слово, оканчивающееся запятой/восклицанием,
    которое не входит в список нейтральных приветствий — и заменяем
    само приветствие, не трогая остальной текст (там фабрикации нет,
    это живая деталь и факты со ссылками)."""
    if not text:
        return text
    match = _GREETING_NAME_RE.match(text)
    if not match or match.group(1).lower() in _GENERIC_GREETING_WORDS:
        return text
    return "Добрый день!" + text[match.end() :]


_EMAIL_RE = re.compile(r"[\w.+-]+@[\w-]+\.[a-zA-Zа-яА-Я]{2,}")
# "@handle" — но не хвост email (перед @ не должно быть буквы/точки/дефиса),
# и отдельно ссылка вида t.me/handle.
_TELEGRAM_HANDLE_RE = re.compile(r"(?<![\w.+-])@([A-Za-z0-9_]{4,32})\b")
_TELEGRAM_LINK_RE = re.compile(r"(?:https?://)?t\.me/([A-Za-z0-9_]{4,32})")


def _extract_vacancy_contacts(text: str | None) -> list[ContactCandidate]:
    """Контакт, написанный прямо в тексте вакансии — самый надёжный
    источник: это то, что работодатель сам опубликовал, не догадка и не
    резолвинг по имени компании. confidence="confirmed"."""
    if not text:
        return []
    found: list[ContactCandidate] = []
    seen: set[str] = set()

    for match in _EMAIL_RE.finditer(text):
        email = match.group(0)
        if email.lower() in seen:
            continue
        seen.add(email.lower())
        found.append(
            ContactCandidate(
                label="Почта из текста вакансии",
                value=email,
                kind="email",
                source="вакансия",
                confidence="confirmed",
            )
        )

    for match in phonenumbers.PhoneNumberMatcher(text, "RU"):
        e164 = phonenumbers.format_number(match.number, phonenumbers.PhoneNumberFormat.E164)
        if e164 in seen:
            continue
        seen.add(e164)
        found.append(
            ContactCandidate(
                label="Телефон из текста вакансии",
                value=e164,
                kind="phone",
                source="вакансия",
                confidence="confirmed",
            )
        )

    for pattern in (_TELEGRAM_HANDLE_RE, _TELEGRAM_LINK_RE):
        for match in pattern.finditer(text):
            handle = "@" + match.group(1)
            if handle.lower() in seen:
                continue
            seen.add(handle.lower())
            found.append(
                ContactCandidate(
                    label="Telegram из текста вакансии",
                    value=handle,
                    kind="telegram",
                    source="вакансия",
                    confidence="confirmed",
                )
            )

    return found


def _resolve_contacts(vacancy: Vacancy, owner: Owner | None) -> list[ContactCandidate]:
    """Порядок проверки: контакт прямо из вакансии → сама страница
    вакансии (туда и уходит "platform"-формат письма) → руководитель по
    ЕГРЮЛ последним и с confidence="verify" — это имя из реестра, не
    подтверждённый канал связи, до отправки стоит перепроверить, что
    это тот самый человек, а не просто действующий директор по бумагам."""
    contacts = _extract_vacancy_contacts(vacancy.description)

    if vacancy.url:
        contacts.append(
            ContactCandidate(
                label="Страница вакансии",
                value=vacancy.url,
                kind="url",
                source="вакансия",
                confidence="confirmed",
            )
        )

    if owner and owner.full_name:
        contacts.append(
            ContactCandidate(
                label=owner.full_name,
                role=owner.role,
                value=owner.full_name,
                kind="name",
                source=owner.source or "ЕГРЮЛ",
                confidence="verify",
            )
        )

    return contacts


def _build_dossier_block(vacancy: Vacancy, company, owner) -> str:
    # АДРЕСАТ отдельной строкой и явным текстом — модели надёжнее
    # получить готовый ответ, чем самой решать по обрывкам ЕГРЮЛ-данных,
    # есть ли в справке настоящее имя (на этом ловили фабрикацию).
    addressee = _resolve_addressee(company, owner)
    if addressee:
        lines = [f"АДРЕСАТ: {addressee}"]
    else:
        lines = [
            "АДРЕСАТ: не найден. Не выдумывай имя — пиши без личного "
            "обращения (нейтральное приветствие или обращение к компании/команде)."
        ]
    lines.append(f"[вакансия:{vacancy.url}] {vacancy.title}, работодатель: {vacancy.company_name or 'неизвестен'}")
    if company:
        lines.append(
            f"[ЕГРЮЛ] {company.legal_name}, ИНН {company.inn}, "
            f"статус {company.status}, адрес {company.address}"
        )
        for f in company.finance:
            lines.append(f"[ЕГРЮЛ] {f.year}: выручка {f.revenue}, прибыль {f.profit}")
    if owner:
        lines.append(f"[ЕГРЮЛ] Руководитель: {owner.full_name}, должность: {owner.role}")
    if not company and not owner:
        lines.append("[нет данных] Компания не найдена в открытых реестрах.")
    return "\n".join(lines)
