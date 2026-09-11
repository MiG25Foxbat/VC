class SourceError(Exception):
    def __init__(self, source: str, reason: str) -> None:
        self.source = source
        self.reason = reason
        super().__init__(f"{source}: {reason}")


class SourceUnavailable(SourceError):
    """Источник недоступен или ответил ошибкой. Не должно ронять весь /search —
    вызывающий код кладёт это в список errors и продолжает с остальными источниками."""
