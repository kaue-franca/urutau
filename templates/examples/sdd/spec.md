# Spec — churn-90d
Question: Can we rank accounts by 90-day churn risk well enough that targeting the top decile beats the current rule ("no login in 21 days")?
Goal type: prediction
Scope: accounts active on the scoring date; monthly plans only.
Non-goals: explaining why customers churn; annual plans; pricing changes.
Constraints: features available at scoring time only; model scored weekly in < 10 min.

## Acceptance criteria
- AC-01: precision in top decile ≥ rule + 5 pp on the sealed holdout (2026-04→06), 95% CI excluding +0; fails if the CI includes 0 or the gain is < 5 pp.
- AC-02: expected margin saved per 1,000 accounts ≥ rule's, using the costs in `AGENTS.md`; fails if lower.
- AC-03: one command regenerates every reported number from raw data; fails if any number differs.

## Tasks
- T-01 Rebuild the current rule as baseline and reproduce its reported precision (→ AC-01)
- T-02 Leakage audit of the feature set (→ AC-01)
- T-03 Gradient-boosting model vs baseline, pre-registered (→ AC-01, AC-02)
- T-04 Results pipeline `make results` (→ AC-03)

## Open questions
- Are reactivated accounts the same population? (A-02)
