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
	ruff check . --fix
	ruff format .

docker-build:
	docker build -t ghcr.io/justinthelaw/repository-template/example:${VERSION} .

docker-run:
	docker run -it ghcr.io/justinthelaw/repository-template/example:${VERSION}

docker-run-gpu:
	echo "NotImplementedError, GPU Device: ${DEVICE}"

docker-push:
	docker push ghcr.io/justinthelaw/repository-template/example:${VERSION}

zarf-create:
	zarf package create . --confirm

zarf-deploy:
	zarf package deploy --confirm zarf-package-*.tar.zst

zarf-publish:
	zarf package publish zarf-*.tar.zst oci://ghcr.io/justinthelaw/packages/
