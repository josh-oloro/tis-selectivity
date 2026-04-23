# tis-selectivity

> Exploratory data analysis and reproducible research toolkit for TIS (Translation Initiation Site) selectivity in neuronal populations.

[![CI](https://github.com/josh-oloro/tis-selectivity/actions/workflows/ci.yml/badge.svg)](https://github.com/josh-oloro/tis-selectivity/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

---

## Quick Start

```bash
git clone https://github.com/josh-oloro/tis-selectivity.git
cd tis-selectivity
make setup          # create venv & install dependencies
make notebook-start # launch JupyterLab
```

---

## Project Structure

This repository follows a production-oriented Python data project layout to improve
maintainability, reproducibility, and collaboration.

```text
tis-selectivity/
├── .github/
│   └── workflows/
│       ├── ci.yml                  # Lint + test on every push/PR
│       └── notebook-smoke.yml      # Headless notebook execution
├── src/
│   └── tis_selectivity/
│       └── __init__.py             # Reusable analysis modules
├── tests/
│   ├── unit/                       # Isolated unit tests
│   └── integration/                # End-to-end integration tests
├── notebooks/
│   ├── exploratory/                # EDA and prototyping notebooks
│   │   ├── kpms.ipynb
│   │   ├── cluster_batch12.ipynb
│   │   ├── file_extract.ipynb
│   │   ├── movement.ipynb
│   │   └── selectivity_analysis.ipynb
│   └── reports/                    # Presentation-ready notebooks
├── data/
│   ├── raw/                        # Immutable source data
│   │   ├── ami_metrics.csv
│   │   └── kpms_se_lmm_test.csv
│   ├── interim/                    # Intermediate transformation outputs
│   └── processed/                  # Model/report-ready outputs
├── docs/
│   ├── architecture.md             # System design overview
│   ├── data-dictionary.md          # Dataset column definitions
│   └── runbook.md                  # Operational procedures
├── scripts/
│   ├── ingest/                     # Data ingestion entry points
│   └── analysis/                   # Analysis workflow scripts
├── configs/
│   ├── dev/                        # Development configuration
│   ├── test/                       # Test configuration
│   └── prod/                       # Production configuration
├── reports/
│   └── figures/                    # Exported charts and report assets
├── README.md
├── CONTRIBUTING.md
├── CHANGELOG.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
├── LICENSE
├── .gitignore
├── .editorconfig
├── .gitattributes
├── Makefile
└── pyproject.toml
```

### Key directory roles

| Path | Purpose |
|------|---------|
| `src/tis_selectivity/` | Reusable application/analysis code (business logic only; no notebooks) |
| `tests/` | Automated tests (`unit/` and `integration/`) |
| `notebooks/exploratory/` | EDA and prototyping |
| `notebooks/reports/` | Presentation-ready, fully executed notebooks |
| `data/raw/` | Immutable source data – **never modify** |
| `data/interim/` | Temporary transformation artefacts |
| `data/processed/` | Final cleaned data ready for analysis |
| `scripts/` | CLI entry points for ingestion and analysis workflows |
| `configs/` | Environment-specific configuration (`dev`, `test`, `prod`) |
| `docs/` | Architecture notes, data dictionary, and operational runbook |
| `reports/figures/` | Exported charts and report assets |
| `.github/workflows/` | CI pipelines (lint, tests, notebook smoke checks) |

---

## Common Commands

```bash
make setup            # install all dependencies into .venv
make lint             # ruff linting
make format           # ruff auto-formatting
make test             # run pytest suite
make notebook-check   # smoke-test all notebooks headlessly
make clean            # remove build/cache artefacts
```

---

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) before opening a pull request.

## License

[MIT](LICENSE) © Josh Oloro