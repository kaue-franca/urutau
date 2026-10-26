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

## DEC-005 · 2026-10-26 · by: agent (Claude Code) · Finish v0 without the Phase 2/5/6 checkpoints
Context: owner asked to "finish a first v0, don't go beyond now" and to compile all references. Options: stop at each checkpoint · deliver v0 for one combined review. Decision: deliver Phases 2–6 as v0 for one review; no Phase 7 pilot; no new research beyond S35–S38. Results seen: n/a. Consequences: (+) usable v0 now; (−) owner validates rules, guide cards and structure afterwards (guide has a checkbox per card). Supersedes: —

## DEC-006 · 2026-10-26 · by: agent (Claude Code) · Final v0 rules R1–R14 (changes from PLAN.md §3.2)
Merged draft 1+9 (evidence) into R1 and 7+12 (report all + cemetery) into R7; added expected-before-actual (R3), mundane rivals (R4), holdout access log (R5), equal tuning budget (R6), too-good audit (R7), equivalence before "no effect" (R8), ablation (R11), "results seen" in DEC (R12); new R13 independent review. Reasons and sources: `references/sources.md` §2, `references/comparison.md` §4. Results seen: n/a.

## DEC-007 · 2026-10-26 · by: agent (Claude Code) · Add mechanism M10 Independent scrutiny (S01, S03, S04, S17, S24) for R13.

## DEC-008 · 2026-10-26 · by: agent (Claude Code) · Template changes
Goal type adds "description" (S36); EXPL carries an expected result (S04); EXP card adds artifact rivals, search budget, already seen, reviewed by (S12, S16, S17, S38); DEC adds "results seen" (S16, S20); every entry has `by:` (S19); `[established]` = replicated and reviewed, not rerun (S24).

## DEC-009 · 2026-10-26 · by: agent (Claude Code) · check.py also lints a project's sdd/ (`--project`): E2 pre-registration timing from git history, E3 tags, EXP fields (S29, S30, S33). Still three scripts.

## DEC-010 · 2026-10-26 · by: agent (Claude Code) · Modules are referenced by absolute path in the project AGENTS.md (filled by new-project.sh), because the global file cannot know where the repo was cloned.

## DEC-011 · 2026-10-26 · by: agent (Claude Code) · Add S35–S38 to the corpus; record S39–S49 as unread Phase 8 candidates.
