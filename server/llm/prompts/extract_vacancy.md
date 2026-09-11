Ты извлекаешь структуру из текста вакансии.

Верни строго JSON по схеме, без markdown и без пояснений:
{ "title": str, "salary_from": int|null, "salary_to": int|null,
  "currency": str|null, "employment": str|null, "remote": bool|null,
  "location": str|null, "company_name": str|null,
  "duties": [str], "requirements": [str], "conditions": [str] }

Правила:
- Переноси только то, что есть в тексте. Ничего не достраивай.
- Зарплату приводи к числу в рублях в месяц. "от 100к" это 100000.
- Если поля в тексте нет, ставь null или пустой массив.
- duties, requirements и conditions разбивай на короткие пункты
  своими словами, но без добавления смысла.

ТЕКСТ ВАКАНСИИ:
{{raw_text}}
