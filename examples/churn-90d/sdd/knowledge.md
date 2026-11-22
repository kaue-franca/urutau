# Knowledge — churn-90d

## Known
- The "no login in 21 days" rule reaches 0.212 ± 0.011 top-decile precision on 2025 data [checked: TEST-001] — 2026-10-12
- Leakage often explains gains of complex models over simple baselines [source: Kapoor & Narayanan 2023] — 2026-10-05
- `events.login` logging did not change in 2025 (counts per day flat) [checked: TRY-003] — 2026-10-07
- ~~Support tickets predict churn [assumed]~~ → the signal was leakage (Unexplained, first entry)

## Assumed
- 2024–2026 behaviour is stable enough to train on (no product change) — would be checked by: per-quarter error on validation
- Reactivated accounts behave like new accounts — would be checked by: separate precision for each group in TEST-002

## Unexplained
- `last_ticket_date` is filled after cancellation for 18% of churners — seen in: TRY-004 (feature dropped)
- Churn rate drops 40% in December 2025 only — seen in: TRY-002; asked the owner

## Dead ends
| What | Verdict | Why (1 line) | Evidence | Revive if |
|---|---|---|---|---|
| `days_to_renewal` feature | abandoned | set after the cancel request (leakage) | TRY-004 | renewal date becomes available before the request |
| Deep tabular net | refuted (try) | 3 seeds: −1.1 pp ± 0.9 vs GBM at equal budget | TRY-006 | > 5× more training data |
| `notebooks/scratch_2025.ipynb` | deleted by urutau-audit | one-off EDA, nothing imports it, tests unchanged | DEC-002, commit 7c1d0e4 | `git show 7c1d0e4^:notebooks/scratch_2025.ipynb` |

## Map
| Path | Why it exists | Status: core · support · one-off · legacy · ? |
|---|---|---|
| `data/raw/` | immutable source extracts with hashes | core |
| `data/holdout/` | sealed test period for SC-01 | core |
| `results/` | outputs of `make results`; regenerated, never edited | support |
| `configs/gbm.yaml` | search space and budget of TEST-002 | core |
