# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Added
- Production-ready repository layout (`src/`, `tests/`, `notebooks/`, `data/`, `docs/`, `scripts/`, `configs/`, `reports/`).
- Boilerplate files: `.gitignore`, `.editorconfig`, `.gitattributes`, `pyproject.toml`, `Makefile`, `LICENSE`.
- Governance files: `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`.
- CI workflows: `ci.yml` (lint + test), `notebook-smoke.yml` (headless notebook execution).
- Documentation stubs: `docs/architecture.md`, `docs/data-dictionary.md`, `docs/runbook.md`.

### Changed
- Moved all Jupyter notebooks to `notebooks/exploratory/` with snake_case names.
- Moved CSV datasets to `data/raw/` with snake_case names.

---

## [0.1.0] – 2026-04-23

### Added
- Initial exploratory notebooks (KPMS, cluster batch 12, file extraction, movement, selectivity analysis).
- Raw datasets: `ami_metrics.csv`, `kpms_se_lmm_test.csv`.
