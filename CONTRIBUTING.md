# Contributing to tis-selectivity

Thank you for considering a contribution to this project!  
Please read these guidelines before opening an issue or pull request.

---

## Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [How to Report Bugs](#how-to-report-bugs)
3. [How to Suggest Features](#how-to-suggest-features)
4. [Development Setup](#development-setup)
5. [Coding Standards](#coding-standards)
6. [Commit Message Convention](#commit-message-convention)
7. [Pull Request Process](#pull-request-process)

---

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).  
By participating, you agree to uphold this standard.

---

## How to Report Bugs

- Search [existing issues](../../issues) first.
- Open a new issue using the **Bug report** template.
- Include steps to reproduce, expected vs actual behaviour, and your environment.

---

## How to Suggest Features

- Search [existing issues](../../issues) to avoid duplicates.
- Open a new issue using the **Feature request** template.
- Describe the problem you are solving and the proposed solution.

---

## Development Setup

```bash
git clone https://github.com/josh-oloro/tis-selectivity.git
cd tis-selectivity
make setup          # create venv and install all dependencies
```

Run the full check suite:

```bash
make lint           # ruff linting
make test           # pytest
make notebook-check # headless notebook execution
```

---

## Coding Standards

| Concern     | Tool              |
|-------------|-------------------|
| Formatting  | `ruff format`     |
| Linting     | `ruff check`      |
| Type checks | (planned: mypy)   |
| Tests       | `pytest`          |

- Keep source modules in `src/tis_selectivity/`.
- Keep exploratory work in `notebooks/exploratory/`.
- Do **not** commit notebook outputs (clear them before committing).

---

## Commit Message Convention

Use [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <short summary>
```

Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `ci`.

---

## Pull Request Process

1. Create a feature branch from `main`.
2. Ensure `make lint` and `make test` pass locally.
3. Update `CHANGELOG.md` under `[Unreleased]`.
4. Open a PR and fill in the template.
5. A maintainer will review and merge once CI is green.
