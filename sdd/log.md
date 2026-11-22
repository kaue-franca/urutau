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

## DEC-012 · 2026-11-22 · by: owner (request) + agent (Claude Code) · v0.1: two layers, 3-file sdd/, R15, git workflow, uv setup skill
Context: owner asked (2026-11-22) for a project-setup skill; `sdd/` with only `spec.md`, `knowledge.md`, `log.md`; the scientific method built into each task; one task detailed at a time and done step by step, later ones generic; uv setup (venv, basic libs) in every project; a branch per piece of work, merged to prod only on request; urutau as the single versioned source, installable globally AND per project — the global layer generic and broad, the project layer the method applied to the project.
Options: (a) keep one method file and add an "or" per-project copy; (b) split into a generic global layer + pinned full method per project.
Decision: (b). `global/AGENTS.md` → generic G1–G6 + git + uv (≤ 40 lines); full method → `method/AGENTS.md`, pinned into `<project>/.urutau/` by `install.sh --project` with `VERSION`; module paths relative (supersedes DEC-010). `status.md` removed (task card → `spec.md`, cemetery → `knowledge.md`); new R15 (owner-preference) and task card; uv setup folded into `new-project.sh` (still three scripts); `skills/urutau-setup` for Claude Code (outside core folders, linked by `install.sh`). `global/AGENTS.md` names the skill as one of two setup routes (a pointer, not a feature). Budget changes vs `PLAN.md` §4.1: `status.md` gone; global layer ≤ 40 lines; method keeps ≤ 100 lines / ≤ 15 rules.
Results seen: no (no pilot yet).
Consequences: (+) projects carry the method version they used and can be updated deliberately; one skill sets up a repo end to end; (−) in Claude Code both layers load in a urutau project (~80 lines, some overlap: G1–G6 restate R-rules generically); E1 cold start now depends on `spec.md` (watch in the pilot); `@.urutau/AGENTS.md` loading from a project `AGENTS.md` not yet verified in a live session (`UNVERIFIED`).
Supersedes: DEC-010; the `status.md` part of DEC-001.

## EXPL-001 · 2026-11-22 · by: agent (Claude Code) · does Claude Code load the pinned method via `CLAUDE.md` → `@AGENTS.md` → `@.urutau/AGENTS.md`? → expected: yes (nested imports) → got: yes in `~/urutau-pin-test` (quoted R15, named `.urutau/AGENTS.md`); in this repo via `@method/AGENTS.md` too; NOT loaded when the project sat in the session scratchpad under `/tmp/claude-1000/…` (no project CLAUDE.md loaded at all — environment, not the import) → next: clears the `UNVERIFIED` in DEC-012 for Claude Code; Codex still untested

## DEC-013 · 2026-11-22 · by: owner (approved) + agent (Claude Code) · v0.2: tool-agnostic AGENTS.md, one rule list, simpler vocabulary, three skills
Context: owner uses the method on a personal Ubuntu PC and a work Red Hat PC (Python ≥ 3.11), with Claude Code and, at work, mainly Devin CLI with DeepSeek. Wants everything based on AGENTS.md (CLAUDE.md only `@AGENTS.md`), a generic global AGENTS.md plus a project one, setup for 3 cases (new · own SDD · no method), an intent-audit skill and a grill-me skill, least code. Three fresh-context critics (minimalist, tools/setup, scientist/newcomer) reviewed v0.1; their synthesis was approved by the owner.
Decision: (1) project `AGENTS.md` self-contained — a versioned urutau block (method + active modules) plus a hand-written project section; no `@` imports, no `.urutau/` (Devin and Codex do not follow imports; v0.1 never reached them). (2) One rule list U1–U9: global = U1–U6, project = U1–U9; replaces R1–R15 and G1–G6; new: U3 fixed target / never weaken a test (ImpossibleBench), U4 disagree on evidence (sycophancy), U6 everything has a why. (3) Vocabulary: try / test card / decision; knowledge as Known · Assumed · Unexplained · Dead ends · Map; tags `[checked]` `[source]` `[assumed]`; success criteria `SC-nn`; pace `step|task|free`. (4) One stdlib script `urutau.py` replaces three; skills are tool-neutral SKILL.md playbooks copied to `~/.claude/skills` and `~/.agents/skills`. (5) Repo: `project/`, `examples/`, `CIENCIA.md`, `GUIA.md`, `history/`. Not handled: Windows/macOS, monorepos, proxy/mirror auto-config, Cursor/Copilot rules, cloud Devin.
Results seen: no (no pilot yet).
Consequences: (+) the method reaches every tool the owner uses; less to read and maintain; (−) v0 projects need conversion (setup case b); E1–E4 pilot criteria must be restated in the new vocabulary; Devin's global file location is UNVERIFIED (docs conflict) until tested on the work PC.
Supersedes: DEC-012 (layer split and pin), R1–R15, G1–G6.

## DEC-014 · 2026-11-22 · by: agent (Claude Code), within owner-approved DEC-013 · Restate success criteria for v0.2
Context: AC-01…AC-05 measured v0 artifacts (15 rules, `guide/index.html` cards, `install.sh`, Codex) that DEC-013 replaced. Options: keep the old ACs · restate them. Decision: SC-01 size limits for Devin (≤ 9 rules, global ≤ 20 lines, block < 14 KiB); SC-02 traceability via `CIENCIA.md`; SC-03 newcomer test of README + GUIA; SC-04 loading in Claude Code and Devin CLI on both machines; SC-05 unchanged (pilot E1–E4, restated in the new vocabulary before it starts). Results seen: no (no pilot yet; only file sizes measured in T-10 s2). Consequences: (+) criteria test what matters now; (−) owner should confirm them. Supersedes: AC-01…AC-05.
