from server.enrich.person import describe_phone, is_role_email, split_full_name


def test_role_email_detected():
    assert is_role_email("info@company.ru") is True
    assert is_role_email("hr@company.ru") is True
    assert is_role_email("HR2@company.ru") is True
    assert is_role_email("ivan.petrov@company.ru") is False


def test_phone_parsed_with_region_and_timezone():
    result = describe_phone("+79161234567")
    assert result["valid"] is True
    assert result["e164"] == "+79161234567"
    assert result["timezone"]


def test_phone_invalid_input_does_not_raise():
    result = describe_phone("это не номер телефона")
    assert result["valid"] is False


def test_split_name_detects_gender_from_patronymic():
    parts = split_full_name("ИВАНОВ ИВАН ИВАНОВИЧ")
    assert parts["last_name"] == "Иванов"
    assert parts["first_name"] == "Иван"
    assert parts["gender"] == "M"


def test_split_name_female():
    parts = split_full_name("ПЕТРОВА МАРИЯ СЕРГЕЕВНА")
    assert parts["gender"] == "F"


def test_split_name_without_patronymic():
    parts = split_full_name("Смирнова Анна")
    assert parts["patronymic"] is None
    assert parts["gender"] is None
