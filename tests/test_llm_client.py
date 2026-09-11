import asyncio

import httpx
import pytest

from server.llm.client import LLMError, chat_json


class _FakeResponse:
    def __init__(self, payload: dict):
        self._payload = payload

    def raise_for_status(self) -> None:
        return None

    def json(self) -> dict:
        return self._payload


class _FakeAsyncClient:
    def __init__(self, payload: dict):
        self._payload = payload

    async def __aenter__(self):
        return self

    async def __aexit__(self, *_exc):
        return False

    async def post(self, *_args, **_kwargs):
        return _FakeResponse(self._payload)


def _client_factory(payload):
    return lambda *a, **kw: _FakeAsyncClient(payload)


def test_extracts_plain_json(monkeypatch):
    payload = {"choices": [{"message": {"content": '{"text": "привет", "facts": []}'}}]}
    monkeypatch.setattr(httpx, "AsyncClient", _client_factory(payload))

    result = asyncio.run(
        chat_json("промпт", base_url="https://example.test/v1", api_key="key", model="m")
    )
    assert result == {"text": "привет", "facts": []}


def test_strips_markdown_fence(monkeypatch):
    content = '```json\n{"text": "привет"}\n```'
    payload = {"choices": [{"message": {"content": content}}]}
    monkeypatch.setattr(httpx, "AsyncClient", _client_factory(payload))

    result = asyncio.run(
        chat_json("промпт", base_url="https://example.test/v1", api_key="key", model="m")
    )
    assert result == {"text": "привет"}


def test_missing_api_key_raises_without_network_call():
    with pytest.raises(LLMError):
        asyncio.run(chat_json("промпт", base_url="https://example.test", api_key="", model="m"))


def test_broken_response_raises_llm_error(monkeypatch):
    payload = {"choices": [{"message": {"content": "тут нет никакого json"}}]}
    monkeypatch.setattr(httpx, "AsyncClient", _client_factory(payload))

    with pytest.raises(LLMError):
        asyncio.run(chat_json("промпт", base_url="https://example.test", api_key="key", model="m"))
