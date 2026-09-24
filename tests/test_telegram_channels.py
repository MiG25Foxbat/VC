import asyncio
from datetime import datetime, timedelta, timezone

from server.sources import telegram_channels

NOW = datetime.now(timezone.utc)


class _FakeMessage:
    def __init__(self, id: int, text: str, date=None):
        self.id = id
        self.message = text
        self.date = date or NOW


class _FakeEntity:
    def __init__(self, username: str):
        self.username = username


class _FakeClient:
    def __init__(self, messages: list[_FakeMessage], authorized: bool = True):
        self._messages = messages
        self._authorized = authorized
        self.disconnected = False

    async def connect(self):
        return None

    async def is_user_authorized(self):
        return self._authorized

    async def get_entity(self, channel):
        return _FakeEntity(channel)

    async def iter_messages(self, _entity, limit=200):
        for m in self._messages[:limit]:
            yield m

    async def disconnect(self):
        self.disconnected = True


def _run(fake_client, **kwargs):
    import server.sources.telegram_channels as mod

    original_client, original_session = mod.TelegramClient, mod.StringSession
    mod.TelegramClient = lambda *a, **kw: fake_client
    mod.StringSession = lambda *a, **kw: object()  # содержимое не важно, TelegramClient замокан
    try:
        return asyncio.run(
            mod.search(
                kwargs.pop("query", "ассистент"),
                api_id="123",
                api_hash="hash",
                session="session-string",
                channels=["it_vakansii_jobs"],
                **kwargs,
            )
        )
    finally:
        mod.TelegramClient = original_client
        mod.StringSession = original_session


def test_filters_by_query_substring_and_skips_spam():
    messages = [
        _FakeMessage(1, "Ищем бизнес-ассистента, удалённо, от 80000 руб."),
        _FakeMessage(2, "Курс по трейдингу, заработок от дома без вложений!"),
        _FakeMessage(3, "Требуется продавец-консультант"),
    ]
    fake_client = _FakeClient(messages)
    items = _run(fake_client, query="ассистент")

    assert len(items) == 1
    assert items[0].source == "telegram"
    assert items[0].salary_from == 80000
    assert items[0].url == "https://t.me/it_vakansii_jobs/1"
    assert fake_client.disconnected is True


def test_stops_at_messages_older_than_max_age():
    old_date = NOW - timedelta(days=60)
    messages = [
        _FakeMessage(1, "Свежая вакансия ассистента", date=NOW),
        _FakeMessage(2, "Старая вакансия ассистента", date=old_date),
    ]
    items = _run(_FakeClient(messages), query="ассистент")
    assert len(items) == 1
    assert items[0].id.endswith(":1")


def test_unauthorized_session_raises_source_unavailable():
    fake_client = _FakeClient([], authorized=False)
    try:
        _run(fake_client, query="ассистент")
        assert False, "должно было поднять SourceUnavailable"
    except telegram_channels.SourceUnavailable as exc:
        assert exc.source == "telegram"


def test_missing_credentials_raises_without_connecting():
    import server.sources.telegram_channels as mod

    async def _go():
        return await mod.search("ассистент", api_id="", api_hash="", session="", channels=["x"])

    try:
        asyncio.run(_go())
        assert False, "должно было поднять SourceUnavailable"
    except telegram_channels.SourceUnavailable as exc:
        assert "TELEGRAM_API_ID" in exc.reason
