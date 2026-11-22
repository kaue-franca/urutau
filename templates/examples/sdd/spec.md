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

## Current task
### T-03 GBM vs rule baseline on the sealed holdout (→ AC-01, AC-02) · mode: confirm · branch: t-03-gbm-vs-rule
Goal: a verdict on whether a GBM beats the rule by ≥ 5 pp, from one logged holdout access.
Hypothesis: behaviour features carry signal beyond login recency · Rival: the gain is leakage via ticket or billing timestamps (N-01), or chance
Prediction: gain of 5–8 pp on validation carries over to the holdout with a 95% CI above +0
Acceptance test: EXP-002 card committed before the run (`check.py --project .` E2) — fails if the result lands in the same commit as the card
Steps:
1. [x] Leakage audit of the 41 features; drop the post-cancel ones — check: EXPL-004, N-01 (commit 3f2a8d1)
2. [x] Write and commit the EXP-002 card — check: committed at 4e1c9a2
3. [ ] Owner approves one holdout access — check: approval quoted in `log.md`
4. [ ] Run 5 seeds, paired bootstrap of the gain — check: all runs in `results/exp-002/`
5. [ ] Fill Result/Verdict of EXP-002 in a new commit; owner review (R13)
Result:
Closing: · Learned:

## Next tasks
- T-04 Results pipeline `make results` (→ AC-03)
- T-05 Calibration and cost curve, if T-03 is supported (→ AC-02)

## Done
- T-01 Rebuild the rule as baseline — reproduced 0.212 ± 0.011 vs 0.21 reported (EXP-001)
- T-02 Leakage audit of the feature set — 3 features dropped (EXPL-004, N-01)

## Open questions and blockers
- Are reactivated accounts the same population? (A-02)
- Blocker: owner approval to open the holdout once for EXP-002 (R5).
