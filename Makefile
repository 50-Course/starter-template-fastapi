VENV ?= .venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip

install:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

run:
	$(PYTHON) -m uvicorn app.main:app --reload

run-dev:
	fastapi dev

migrations:
	alembic revision --autogenerate -m "migration"
	
migrate:
	alembic upgrade head

