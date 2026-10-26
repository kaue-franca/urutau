# churn-90d
Purpose: predict 90-day churn for subscription accounts so the retention team can target offers; weekly scoring.

## Commands
- Setup: `uv sync`
- Tests / checks: `uv run pytest -q && uv run python -m churn.checks.leakage`
- Reproduce all reported numbers: `uv run make results` (writes `results/*.json` and figures)

## Data
- Raw: `data/raw/accounts_2024-01_2026-06.parquet` (sha256 in `data/raw/SHA256SUMS`) — read-only
- Features are built only from events before the scoring date; see `churn/features.py`.
- Holdout: `data/holdout/2026-04_2026-06.parquet` — sealed; every access is logged in `sdd/log.md`

## Domain constraints
- A false positive costs one discount (≈ R$ 30); a missed churner costs ≈ R$ 400 of margin.
- "Churn" = cancellation or 30 days unpaid; definition frozen by DEC-001.
- No personal data leaves `data/`; never print raw rows in logs.

## Method
- Scientific SDD (urutau). Records live in `sdd/`; start every session with `sdd/status.md`.
- Active modules: `/home/kaue/urutau/modules/ml.md`
