# Runbook

Operational instructions for running, testing, and maintaining the
`tis-selectivity` project.

---

## Prerequisites

| Tool    | Minimum Version |
|---------|-----------------|
| Python  | 3.10            |
| Git     | 2.40            |
| Make    | 4.x             |

---

## First-Time Setup

```bash
git clone https://github.com/josh-oloro/tis-selectivity.git
cd tis-selectivity
make setup
```

This creates a `.venv/` directory and installs all runtime and dev dependencies.

---

## Day-to-Day Commands

| Task                        | Command                  |
|-----------------------------|--------------------------|
| Format code                 | `make format`            |
| Lint code                   | `make lint`              |
| Run all tests               | `make test`              |
| Run unit tests only         | `make test-unit`         |
| Run integration tests only  | `make test-integration`  |
| Smoke-test all notebooks    | `make notebook-check`    |
| Start JupyterLab            | `make notebook-start`    |
| Clean build artefacts       | `make clean`             |

---

## Adding New Notebooks

1. Place exploratory notebooks in `notebooks/exploratory/`.
2. Place presentation-ready notebooks in `notebooks/reports/`.
3. **Clear all outputs** before committing (`Kernel → Restart & Clear Output`).

---

## Updating Dependencies

```bash
# Add a dependency to pyproject.toml, then reinstall
make setup
```

---

## CI Failures

- **Lint failure** – run `make lint` locally and fix reported issues.
- **Test failure** – run `make test` locally; check stack trace for details.
- **Notebook smoke failure** – ensure the notebook runs end-to-end with `make notebook-check`.
