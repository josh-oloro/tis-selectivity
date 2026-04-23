.DEFAULT_GOAL := help

PYTHON  ?= python3
VENV    := .venv
PIP     := $(VENV)/bin/pip
PYTEST  := $(VENV)/bin/pytest
RUFF    := $(VENV)/bin/ruff
JUPYTER := $(VENV)/bin/jupyter

# ─── Bootstrap ───────────────────────────────────────────────────────────────
.PHONY: setup
setup: ## Create virtual env and install all dependencies (including dev extras)
	$(PYTHON) -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -e ".[dev]"

# ─── Formatting & Linting ────────────────────────────────────────────────────
.PHONY: format
format: ## Auto-format source code with ruff
	$(RUFF) format src tests

.PHONY: lint
lint: ## Lint source code with ruff
	$(RUFF) check src tests

# ─── Testing ─────────────────────────────────────────────────────────────────
.PHONY: test
test: ## Run unit and integration tests with pytest
	$(PYTEST) tests/

.PHONY: test-unit
test-unit: ## Run unit tests only
	$(PYTEST) tests/unit/

.PHONY: test-integration
test-integration: ## Run integration tests only
	$(PYTEST) tests/integration/

# ─── Notebooks ───────────────────────────────────────────────────────────────
.PHONY: notebook-check
notebook-check: ## Execute all exploratory notebooks headlessly (smoke test)
	$(VENV)/bin/pytest --nbmake notebooks/exploratory/

.PHONY: notebook-start
notebook-start: ## Launch JupyterLab
	$(JUPYTER) lab

# ─── Cleanup ─────────────────────────────────────────────────────────────────
.PHONY: clean
clean: ## Remove caches, build artifacts, and coverage reports
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -exec rm -rf {} +
	rm -rf .pytest_cache .ruff_cache htmlcov .coverage coverage.xml build dist *.egg-info

# ─── Help ────────────────────────────────────────────────────────────────────
.PHONY: help
help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
	  awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-22s\033[0m %s\n", $$1, $$2}'
