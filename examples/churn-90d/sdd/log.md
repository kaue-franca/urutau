# Log — churn-90d

## Decision 1 · 2026-10-02 · by: owner · Fix the churn definition
Context: two definitions in use (cancel only; cancel or 30 days unpaid) · Options: either · Decision: cancel or 30 days unpaid (matches finance) · Results seen: no · Consequences: (+) matches revenue; (−) late payers who pay on day 31 count as churn · Supersedes: —

## Try 1 · 2026-10-05 · by: agent (Claude Code) · load the raw extract and count accounts per month → expected: 40–45k active per month → got: 41–44k → next: churn rate per month

## Try 2 · 2026-10-06 · by: agent (Claude Code) · monthly churn rate 2024–2026 → expected: flat ~4% → got: flat except Dec 2025 (−40%) → next: add to Open questions, ask owner

## Try 3 · 2026-10-07 · by: agent (Claude Code) · daily `events.login` counts in 2025, to rule out a logging change → expected: flat → got: flat (no step change) → next: use login features

## Try 4 · 2026-10-08 · by: agent (Devin) · add support-ticket features → expected: +1–2 pp → got: +9 pp on validation → next: too good, so hunt for leakage → `last_ticket_date` written after cancel; feature dropped

## Experiment 1 · 2026-10-10 · by: agent (Claude Code) · Reproduce the rule baseline
Question: does our rebuild of the 21-day rule match the reported 0.21 top-decile precision?
Rival explanations: ours matches within ±0.02 | ours differs | boring ones: different churn definition or date window
Fails if: "matches" fails if |ours − 0.21| > 0.02 on 2025 data
Plan: 2025 data (already seen: aggregate rates only) · baseline = the rule · 200 bootstrap resamples · no search · decision: outside ±0.02 → find the difference before Task 3
Card committed at: 9b07d3e
Result: 0.212 ± 0.011 (95% bootstrap CI) vs 0.21 reported
Verdict: supported
Reviewed by: owner, 2026-10-12

## Try 5 · 2026-10-14 · by: agent (Claude Code) · GBM vs rule on validation 2026-01→03, 3 seeds → expected: +3–6 pp → got: +5 to +8 pp → next: Experiment 2 on the holdout

## Try 6 · 2026-10-16 · by: agent (Claude Code) · deep tabular net vs GBM on validation, same budget, 3 seeds → expected: within ±1 pp → got: −1.1 pp ± 0.9 → next: drop it (Dead ends)

## Experiment 2 · 2026-10-20 · by: agent (Claude Code) · GBM vs rule on the holdout
Question: does a GBM on pre-scoring-date features beat the rule in top-decile precision?
Rival explanations: our idea: gain ≥ 5 pp | a smaller gain, 0–5 pp | no gain | boring ones: leakage via ticket or billing timestamps
Fails if: "gain ≥ 5 pp" fails if the 95% CI of the gain lies below 5 pp; "no gain" fails if the CI excludes 0
Plan: train 2024-01→2025-12, holdout 2026-04→06 (never opened) · already seen: validation 2026-01→03 in Tries 5 and 6 · baseline reproduced: Experiment 1 · 5 seeds · 60 random-search trials for the GBM, the rule has no parameters · paired bootstrap of the gain · smallest effect that matters: 5 pp (cost break-even); ship only if the gain is ≥ 5 pp and Criterion 2 is met
Card committed at: 4e1c9a2
Result:
Verdict:
Reviewed by:

## Decision 2 · 2026-10-21 · by: owner · Delete one-off notebooks found in an audit
Context: an audit mapped 14 files; 3 notebooks had no importer, no code test and a "scratch" commit message · Options: keep · archive · delete · Decision: delete; code tests and `make results` outputs identical before and after (commit 7c1d0e4) · Results seen: n/a · Consequences: (+) smaller repo, every file has a why; (−) recoverable only via git · Supersedes: —
