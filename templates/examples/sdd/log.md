# Log — churn-90d

## DEC-001 · 2026-10-02 · by: owner · Freeze the churn definition
Context: two definitions in use (cancel only; cancel or 30 days unpaid) · Options: either · Decision: cancel or 30 days unpaid (matches finance) · Results seen: no · Consequences: (+) matches revenue; (−) late payers who pay on day 31 count as churn · Supersedes: —

## EXPL-002 · 2026-10-06 · by: agent (Claude Code) · monthly churn rate 2024–2026 → expected: flat ~4% → got: flat except Dec 2025 (−40%) → next: log N-02, ask owner

## EXPL-004 · 2026-10-08 · by: agent (Codex) · add support-ticket features → expected: +1–2 pp → got: +9 pp on validation → next: too good; leakage audit (R7) → `last_ticket_date` written after cancel (N-01); feature dropped

## EXP-001 · 2026-10-10 · by: agent (Claude Code) · Reproduce the rule baseline
Question: does our rebuild of the 21-day rule match the reported 0.21 top-decile precision?
Hypotheses: H1 matches within ±0.02 | H0 differs | artifact: different churn definition or date window
Refuted if: H1 fails if |ours − 0.21| > 0.02 on 2025 data
Smallest meaningful effect & decision rule: ±0.02; outside → find the difference before T-03
Plan: 2025 data (seen before: yes, aggregate rates only) · baseline = rule · 200 bootstrap resamples · no search
Pre-registered at: 9b07d3e
Result: 0.212 ± 0.011 (95% bootstrap CI) vs 0.21 reported
Verdict: supported
Deviations: none
Reviewed by: owner, 2026-10-12
Exploratory notes: rule precision is lower for accounts < 3 months old.

## EXP-002 · 2026-10-20 · by: agent (Claude Code) · GBM vs rule on the sealed holdout
Question: does a GBM on pre-scoring-date features beat the rule in top-decile precision?
Hypotheses: H1 gain ≥ 5 pp | H2 gain 0–5 pp | H0 no gain | artifact: leakage via ticket or billing timestamps
Refuted if: H1 fails if the 95% CI of the gain lies below 5 pp; H0 fails if the CI excludes 0
Smallest meaningful effect & decision rule: 5 pp (cost break-even, `AGENTS.md`); ship only if H1 supported and AC-02 met
Plan: train 2024-01→2025-12, holdout 2026-04→06 (never opened) · seen: validation 2026-01→03 during EXPL-005/006 · baseline reproduced: EXP-001 · 5 seeds · 60 random-search trials for GBM; rule has no parameters · paired bootstrap of the gain
Pre-registered at: 4e1c9a2
Result:
Verdict:
Deviations:
Reviewed by:
Exploratory notes:
