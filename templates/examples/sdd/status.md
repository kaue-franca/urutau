# Status — updated 2026-10-20
Current: T-03 GBM vs rule baseline (mode: confirm) — EXP-002 card committed at 4e1c9a2, not yet run
Last result: EXP-001 → baseline reproduced: top-decile precision 0.212 ± 0.011 vs 0.21 reported
Next step: run EXP-002 on the sealed holdout (one access, logged)
Active hypotheses: H1 GBM beats rule by ≥ 5 pp; H0 no gain ≥ 5 pp; artifact: gain comes from `last_ticket_date` leakage (EXP-002)
Blockers / questions for the owner:
- Approve opening the holdout once for EXP-002 (R5).

## Cemetery
| ID | Idea | Verdict | Why (1 line) | Evidence | Revive if |
|---|---|---|---|---|---|
| EXPL-004 | Add `days_to_renewal` | abandoned | value is set after the cancel request (L2 leakage) | EXPL-004, N-01 | renewal date becomes available before the request |
| EXPL-006 | Deep tabular net | refuted (explore) | 3 seeds: −1.1 pp ± 0.9 vs GBM at equal budget | EXPL-006 | > 5× more training data |
