# Knowledge — churn-90d

## Claims
- K-001 [supported: EXP-001] The "no login in 21 days" rule reaches 0.212 ± 0.011 top-decile precision on 2025 data — 2026-10-12
- K-002 [literature: Kapoor & Narayanan 2023] Leakage often explains gains of complex models over simple baselines — 2026-10-05
- ~~K-003 [assumption] Support tickets predict churn~~ → superseded by N-01
- K-004 [speculation] Price-sensitive accounts churn after the annual price update — 2026-10-15

## Assumptions
- A-01 2024–2026 behaviour is stable enough to train on (no product change) — checked by: not yet
- A-02 Reactivated accounts behave like new accounts — checked by: not yet (open question in spec)
- A-03 `events.login` logging did not change in 2025 — checked by: EXPL-003 (counts per day flat)

## Anomalies
- N-01 `last_ticket_date` is filled after cancellation for 18% of churners — seen in: EXPL-004
- N-02 Churn rate drops 40% in December 2025 only — seen in: EXPL-002; unexplained

## Cemetery
| ID | Idea | Verdict | Why (1 line) | Evidence | Revive if |
|---|---|---|---|---|---|
| EXPL-004 | Add `days_to_renewal` | abandoned | value is set after the cancel request (L2 leakage) | EXPL-004, N-01 | renewal date becomes available before the request |
| EXPL-006 | Deep tabular net | refuted (explore) | 3 seeds: −1.1 pp ± 0.9 vs GBM at equal budget | EXPL-006 | > 5× more training data |
