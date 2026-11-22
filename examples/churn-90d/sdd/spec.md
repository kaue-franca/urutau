# Spec — churn-90d
Question: Can we rank accounts by 90-day churn risk well enough that targeting the top decile beats the current rule ("no login in 21 days")?
Goal type: prediction
Scope and non-goals: accounts active on the scoring date, monthly plans only · not explaining why customers churn; no annual plans; no pricing changes.
Constraints: features available at scoring time only; scored weekly in < 10 min.

## Success criteria
- SC-01: top-decile precision ≥ rule + 5 pp on the sealed holdout (2026-04→06), 95% CI above 0; fails if the CI includes 0 or the gain is < 5 pp.
- SC-02: expected margin saved per 1,000 accounts ≥ the rule's, with the costs in `AGENTS.md`; fails if lower.
- SC-03: one command regenerates every reported number from raw data; fails if any number differs.

## Current task
### T-03 GBM vs rule on the sealed holdout (→ SC-01, SC-02) · branch: t-03-gbm-vs-rule
Why: SC-01 needs one honest comparison on data nobody has tuned on.
Prediction: the 5–8 pp validation gain holds on the holdout, 95% CI above 0 (TEST-002).
Check: TEST-002 card committed before the run (`urutau check` shows the timing) — fails if the result lands in the same commit as the card
Steps:
1. [x] Leakage audit of the 41 features; drop the post-cancel ones — check: TRY-004 and Unexplained entry (commit 3f2a8d1)
2. [x] Write and commit the TEST-002 card — check: committed at 4e1c9a2
3. [ ] Owner approves one look at the holdout — check: approval quoted in `log.md`
4. [ ] Run 5 seeds and a paired bootstrap of the gain — check: all runs in `results/test-002/`
5. [ ] Fill Result and Verdict of TEST-002 in a new commit; owner review (U4)
Result:
Closing: · Learned:

## Next tasks
- T-04 Results pipeline `make results` (→ SC-03)
- T-05 Calibration and cost curve, if TEST-002 supports the gain (→ SC-02)

## Done
- T-01 Rebuild the rule as baseline — reproduced 0.212 ± 0.011 vs 0.21 reported (TEST-001)
- T-02 Leakage audit of the feature set — 3 features dropped (TRY-004)

## Open questions
- Are reactivated accounts the same population as new ones? (Assumed, not checked)
- Blocker: owner approval to look at the holdout once for TEST-002 (U8).
