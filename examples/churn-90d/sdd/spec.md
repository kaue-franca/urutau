# Spec — churn-90d
Question: Can we rank accounts by 90-day churn risk well enough that targeting the top decile beats the current rule ("no login in 21 days")?
Goal type: prediction
Scope and non-goals: accounts active on the scoring date, monthly plans only · not explaining why customers churn; no annual plans; no pricing changes.
Constraints: features available at scoring time only; scored weekly in < 10 min.

## Success criteria
- Criterion 1: top-decile precision ≥ rule + 5 pp on the holdout (2026-04→06), 95% CI above 0; fails if the CI includes 0 or the gain is < 5 pp.
- Criterion 2: expected margin saved per 1,000 accounts ≥ the rule's, with the costs in `AGENTS.md`; fails if lower.
- Criterion 3: one command regenerates every reported number from raw data; fails if any number differs.

## Current task
### Task 3 GBM vs rule on the holdout (serves Criteria 1 and 2) · branch: task-3-gbm-vs-rule
Why: Criterion 1 needs one honest comparison on data nobody has tuned on.
Prediction: the 5–8 pp validation gain (Try 5) holds on the holdout, 95% CI above 0 (Experiment 2).
Check: the Experiment 2 card is committed before the run (`git log` shows the card commit first) — fails if the result lands in the same commit as the card
Steps:
1. [x] Leakage audit of the 41 features; drop the post-cancel ones — check: Try 4 and the open question on `last_ticket_date` (commit 3f2a8d1)
2. [x] Write and commit the Experiment 2 card — check: committed at 4e1c9a2
3. [ ] Owner approves one look at the holdout — check: approval quoted in `log.md`
4. [ ] Run 5 seeds and a paired bootstrap of the gain — check: all runs in `results/experiment-2/`
5. [ ] Fill Result and Verdict of Experiment 2 in a new commit; owner review
Result:
Closing: · Learned:

## Next tasks
- Task 4 Results pipeline `make results` (serves Criterion 3)
- Task 5 Calibration and cost curve, if Experiment 2 supports the gain (serves Criterion 2)

## Done
- Task 1 Rebuild the rule as baseline — reproduced 0.212 ± 0.011 vs 0.21 reported (Experiment 1)
- Task 2 Leakage audit of the feature set — 3 features dropped (Try 4)

## Open questions
- Are reactivated accounts the same population as new ones? (assumed, not checked)
- Blocker: owner approval to look at the holdout once for Experiment 2.
- `last_ticket_date` is filled after cancellation for 18% of churners — seen in: Try 4 (feature dropped); why does the ticket system write it late?
- Churn rate drops 40% in December 2025 only — seen in: Try 2; asked the owner
