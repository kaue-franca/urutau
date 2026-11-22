<!-- urutau:begin v0.2.0 modules=ml -->
(The urutau method and the ml module are generated here by `urutau init` / `urutau update`.)
<!-- urutau:end -->

# churn-90d
<!-- Fictional example: data, numbers and commits are invented to show the format. -->
Purpose: predict 90-day churn for subscription accounts so the retention team can target offers; weekly scoring.
Pace: step

## Commands
- Setup: `uv sync`
- Tests / lint: `uv run pytest -q && uv run python -m churn.checks.leakage` · `uv run ruff check .`
- Reproduce every reported number: `uv run make results` (writes `results/*.json` and figures)

## Data
- Raw: `data/raw/accounts_2024-01_2026-06.parquet` (sha256 in `data/raw/SHA256SUMS`) — read-only
- Features use only events before the scoring date; see `churn/features.py`.
- Holdout: `data/holdout/2026-04_2026-06.parquet` — sealed; every look is logged in `sdd/log.md`

## Constraints
- A false positive costs one discount (≈ R$ 30); a missed churner costs ≈ R$ 400 of margin.
- "Churn" = cancellation or 30 days unpaid; definition frozen by DEC-001.
- No personal data leaves `data/`; never print raw rows in logs.
