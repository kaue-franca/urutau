# Knowledge — churn-90d

## Known
- The "no login in 21 days" rule reaches 0.212 ± 0.011 top-decile precision on 2025 data [checked: Experiment 1] — 2026-10-12
- Leakage often explains gains of complex models over simple baselines [source: Kapoor & Narayanan 2023] — 2026-10-05
- `events.login` logging did not change in 2025 (counts per day flat) [checked: Try 3] — 2026-10-07
- ~~Support tickets predict churn [assumed]~~ → the signal was leakage (Open questions, `last_ticket_date`)

## Assumed
- 2024–2026 behaviour is stable enough to train on (no product change) — would be checked by: per-quarter error on validation
- Reactivated accounts behave like new accounts — would be checked by: separate precision for each group in Experiment 2

## Dead ends
| What | Verdict | Why (1 line) | Evidence | Worth retrying if |
|---|---|---|---|---|
| `days_to_renewal` feature | abandoned | set after the cancel request (leakage) | Try 4 | renewal date becomes available before the request |
| Deep tabular net | dropped after a try | 3 seeds: −1.1 pp ± 0.9 vs GBM at equal budget | Try 6 | > 5× more training data |
| `notebooks/scratch_2025.ipynb` | deleted after an audit | one-off exploration, nothing imports it, code tests unchanged | Decision 2, commit 7c1d0e4 | `git show 7c1d0e4^:notebooks/scratch_2025.ipynb` |

## Why each file exists
| Path | Why it exists | Status: core · support · one-off · legacy · ? |
|---|---|---|
| `data/raw/` | immutable source extracts with hashes | core |
| `data/holdout/` | test period kept untouched for Criterion 1 | core |
| `results/` | outputs of `make results`; regenerated, never edited | support |
| `configs/gbm.yaml` | search space and budget of Experiment 2 | core |
