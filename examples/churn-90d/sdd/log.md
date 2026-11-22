# Log — churn-90d

## DEC-001 · 2026-10-02 · by: owner · Freeze the churn definition
Context: two definitions in use (cancel only; cancel or 30 days unpaid) · Options: either · Decision: cancel or 30 days unpaid (matches finance) · Results seen: no · Consequences: (+) matches revenue; (−) late payers who pay on day 31 count as churn · Supersedes: —

## TRY-002 · 2026-10-06 · by: agent (Claude Code) · monthly churn rate 2024–2026 → expected: flat ~4% → got: flat except Dec 2025 (−40%) → next: note under Unexplained, ask owner

## TRY-004 · 2026-10-08 · by: agent (Devin) · add support-ticket features → expected: +1–2 pp → got: +9 pp on validation → next: too good (U2): leakage hunt → `last_ticket_date` written after cancel; feature dropped

## TEST-001 · 2026-10-10 · by: agent (Claude Code) · Reproduce the rule baseline
Question: does our rebuild of the 21-day rule match the reported 0.21 top-decile precision?
Rivals: H1 matches within ±0.02 | H0 differs | mundane: different churn definition or date window
Refuted if: H1 fails if |ours − 0.21| > 0.02 on 2025 data
Plan: 2025 data (already seen: aggregate rates only) · baseline = the rule · 200 bootstrap resamples · no search · decision: outside ±0.02 → find the difference before T-03
Pre-registered at: 9b07d3e
Result: 0.212 ± 0.011 (95% bootstrap CI) vs 0.21 reported
Verdict: supported
Reviewed by: owner, 2026-10-12

## TEST-002 · 2026-10-20 · by: agent (Claude Code) · GBM vs rule on the sealed holdout
Question: does a GBM on pre-scoring-date features beat the rule in top-decile precision?
Rivals: H1 gain ≥ 5 pp | H2 gain 0–5 pp | H0 no gain | mundane: leakage via ticket or billing timestamps
Refuted if: H1 fails if the 95% CI of the gain lies below 5 pp; H0 fails if the CI excludes 0
Plan: train 2024-01→2025-12, holdout 2026-04→06 (never opened) · already seen: validation 2026-01→03 in TRY-005/006 · baseline reproduced: TEST-001 · 5 seeds · 60 random-search trials for the GBM, the rule has no parameters · paired bootstrap of the gain · smallest effect that matters: 5 pp (cost break-even); ship only if H1 holds and SC-02 is met
Pre-registered at: 4e1c9a2
Result:
Verdict:
Reviewed by:

## DEC-002 · 2026-10-21 · by: owner · Delete one-off notebooks found by urutau-audit
Context: audit mapped 14 files; 3 notebooks had no importer, no test and a "scratch" commit message · Options: keep · archive · delete · Decision: delete; tests and `make results` outputs identical before and after (commit 7c1d0e4) · Results seen: n/a · Consequences: (+) smaller repo, every file has a why; (−) recoverable only via git · Supersedes: —
