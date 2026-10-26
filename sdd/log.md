# Log (append-only; correct by ~~strikethrough~~, never delete)

## DEC-001 · 2026-10-26 · Adopt PLAN.md v0.2 and its §7 defaults provisionally
Context: Phase 0 needs concrete names before the owner reviews §7.
Options: wait for the owner on each item · adopt the bracketed defaults now.
Decision: adopt the defaults — SDD files in `sdd/`; `knowledge.md`; cemetery inside `status.md`; IDs EXP-001, EXPL-001, DEC-001, K-001, AC-01, T-01; Claude Code hooks deferred to after v1.0; repository private. Work happens on branch `feat/v0` (owner's request).
Consequences: (+) work can start; (−) renames are cheap now but get costlier after Phase 4. Supersedes: —

## DEC-002 · 2026-10-26 · Blinding for Phase 1 is broken for the main session
Context: `PLAN.md` and `REFERENCES.md` were both attached to the opening request, so the executing agent read `REFERENCES.md` before Phase 1. `PLAN.md` §6 Phase 1 requires a reading blind to it; §2–§3 already leak its conclusions (partial blinding acknowledged in step 4).
Options: (a) proceed and declare the anchoring in `references/comparison.md`; (b) run Phase 1 steps 1–2 in a fresh agent given only Appendix B (no `PLAN.md`, no `REFERENCES.md`), then compare in the main session; (c) owner does the blind reading.
Decision: pending owner choice at the Phase 0 CHECKPOINT; recommended (b), with (a)'s disclosure in either case.
Consequences: (b) restores blinding to the v0.2 conclusions at the cost of one extra agent run; (a) weakens `comparison.md` as an independent check. Supersedes: —

## DEC-003 · 2026-10-26 · Phase 1 blinding: fresh agents read the sources (resolves DEC-002)
Context: owner approved Phase 0 and chose option (b) of DEC-002.
Decision: Phase 1 steps 1–2 run in fresh sub-agents that receive only the Appendix B list, a neutral one-line purpose, and the analysis fields; they are told not to read `PLAN.md`, `REFERENCES.md`, `references/` or `sdd/`. Sources are split into five groups run in parallel. The main session merges their output into `references/analysis.md` and then writes `references/comparison.md` (step 3).
Consequences: (+) the reading is blind to the v0.2 conclusions; (−) sub-agents may still load the repo's root `AGENTS.md` (which names the goal but no conclusions); five readers may differ in depth — `comparison.md` declares both. Supersedes: the "pending" decision in DEC-002.

## DEC-004 · 2026-10-26 · Cite the copy actually read when a plan URL fails
Context: Phase 1 readers could not open several Appendix B URLs (TLS, 403, bot blocks) and one URL (S14) points to a press release, not the statement (`references/analysis.md`, access table).
Options: keep plan URLs only · replace them · keep both.
Decision: `references/sources.md` lists the canonical DOI/URL and, where it failed, the open copy actually read.
Consequences: (+) every claim is checkable by the owner; (−) some open copies are course pages that may disappear. Supersedes: —
