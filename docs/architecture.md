# Architecture

## Overview

`tis-selectivity` is a Python/Jupyter data-analysis project focused on
**TIS (Translation Initiation Site) selectivity** in neuronal populations.

## High-Level Data Flow

```
Raw Data (data/raw/)
       │
       ▼
Ingestion Scripts (scripts/ingest/)
       │
       ▼
Interim Data (data/interim/)
       │
       ▼
Analysis Notebooks (notebooks/exploratory/)
       │
       ├──► Processed Data (data/processed/)
       │
       └──► Reports & Figures (reports/figures/)
```

## Key Components

| Component                  | Purpose                                          |
|----------------------------|--------------------------------------------------|
| `src/tis_selectivity/`     | Reusable analysis logic (functions, classes)     |
| `notebooks/exploratory/`   | Exploratory and experimental Jupyter notebooks   |
| `notebooks/reports/`       | Presentation-ready, fully executed notebooks     |
| `data/raw/`                | Immutable source data (never modified)           |
| `data/interim/`            | Intermediate transformation outputs              |
| `data/processed/`          | Final cleaned/transformed data for analysis      |
| `scripts/`                 | CLI entry points for ingestion and analysis      |
| `configs/`                 | YAML/TOML configuration per environment          |

## Design Principles

- **Reproducibility** – all randomness seeded; data lineage tracked.
- **Separation of concerns** – notebooks for exploration, `src/` for reusable logic.
- **Environment isolation** – virtual environment managed via `make setup`.
