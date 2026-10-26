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
