.DEFAULT_GOAL := help

local-bin:
	echo "🚀 symlink script to ~/.local/bin/{{ cookiecutter.__project_slug }} ..."
	rm -f ${HOME}/.local/bin/{{ cookiecutter.__project_slug }}
	ln -sf "${project_dir}/.venv/bin/{{ cookiecutter.__project_slug }}"  "${HOME}/.local/bin/"

check:
	echo "🚀 Linting code: Pre-commit"
	pre-commit run -a

test:
	echo "🚀 Testing code: Pytest"
	pytest

coverage:
	coverage report

typehint:
	echo "🚀 Static type checking: Mypy"
	mypy src/

lint-pre:
	echo "🚀 Linting code: Ruff (pre)"
	ruff check --select=E9,F63,F7,F82

lint:
	echo "🚀 Linting code: Ruff (full)"
	ruff check

checklist: lint typehint test

black:
	echo "🚀 Format code: Black"
	black .

pip-install:
	echo "🚀 Pip install requirements"
	pip install -r requirements-dev.txt

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: local-bin check test typehint lint-pre lint checklist black pip-install help
