<!-- urutau:begin v0.3.0 -->
(The setup copies the urutau method here; not shown in this example.)
<!-- urutau:end -->

# churn-90d
<!-- Fictional example: data, numbers and commits are invented to show the format. -->
Purpose: predict 90-day churn for subscription accounts so the retention team can target offers; weekly scoring.
Pace: step

## Commands
- Setup: `uv sync`
- Code tests / lint: `uv run pytest -q && uv run python -m churn.checks.leakage` · `uv run ruff check .`
- Reproduce every reported number: `uv run make results` (writes `results/*.json` and figures)

## Inputs
- Raw: `data/raw/accounts_2024-01_2026-06.parquet` (sha256 in `data/raw/SHA256SUMS`) — read-only
- Features use only events before the scoring date; see `churn/features.py`.
- Holdout: `data/holdout/2026-04_2026-06.parquet` — kept untouched for the final check; every look is logged in `sdd/log.md`

## Constraints
- A false positive costs one discount (≈ R$ 30); a missed churner costs ≈ R$ 400 of margin.
- "Churn" = cancellation or 30 days unpaid; definition fixed by Decision 1 in `sdd/log.md`.
- No personal data leaves `data/`; never print raw rows in logs.
