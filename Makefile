VERSION ?= $(shell git describe --abbrev=0 --tags | sed -e 's/^v//')
ifeq ($(VERSION),)
  VERSION := latest
endif

DEVICE ?= 0

.PHONY: all

create-venv:
	python -m venv .venv

requirements-gpu:
	python -m pip install -r requirements-gpu.txt

requirements-dev:
	python -m pip install -r requirements-dev.txt

requirements:
	pip-sync requirements.txt requirements-dev.txt

build-requirements:
	pip-compile -o requirements.txt pyproject.toml

build-requirements-dev:
	pip-compile --extra dev -o requirements-dev.txt pyproject.toml

build-requirements-gpu:
	pip-compile --extra dev -o requirements-gpu.txt pyproject.toml

fetch-model:
	echo "NotImplementedError"

test:
	pytest **/*.py

dev:
	python src/main.py

lint:
	ruff check .
	ruff format .

docker-build:
	echo "NotImplementedError"

docker-run:
	echo "NotImplementedError"

docker-run-gpu:
	echo "NotImplementedError"

docker-push:
	echo "NotImplementedError"
