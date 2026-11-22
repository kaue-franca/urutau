# Spec — urutau (Scientific SDD)
Question: Can a short, hand-written method grounded in the scientific method make agent-assisted data-science work traceable and resistant to self-deception, at an upkeep cost the owner accepts?
Goal type: build
Scope: global `AGENTS.md`, `modules/{ml,rl}.md`, project templates + examples, `references/`, pt-BR `guide/index.html`, three scripts.
Non-goals: CLI tool; spec-as-source; copying Spec Kit or Kiro; tool-specific features in core files; automation beyond three scripts.
Constraints: budgets in `PLAN.md` §4.1; agent files in English, guide in pt-BR, identical rule IDs; sources paraphrased and linked.

## Acceptance criteria (each names the result that would fail it)
- AC-01 (S1): `scripts/check.py` reports `global/AGENTS.md` ≤ 100 lines and ≤ 15 rules. Fails if either limit is exceeded.
- AC-02 (S2): every rule maps to ≥ 1 mechanism and source in `references/sources.md`, or is tagged `owner-preference`. Fails if any rule has neither.
- AC-03 (S3): `check.py` finds 100% of rule IDs, templates and modules covered by a card in `guide/index.html`. Fails if any is missing.
- AC-04 (S4): on a fresh machine (temporary `HOME`), `git clone` + `scripts/install.sh` makes Claude Code list the global file (`/memory` or `/context`) and Codex quote rule 1. Fails if either tool does not load it.
- AC-05 (S5): the Phase 7 pilot meets its pre-registered criteria E1–E4 (EXP-001). Fails if any of E1–E4 misses its threshold.

## Current task
### T-10 Method v0.2 content: rules U1–U9, simple vocabulary, sdd/ skeletons, example, CIENCIA.md (→ AC-01, AC-02) · mode: light · branch: t-10-metodo-v02
Goal: the method text that every tool will load (global and project), short enough for Devin's 16 KiB cut and traced to sources.
Hypothesis: 9 rules cover every AI failure mode in the critics' table without losing any verifiable control we have now · Rival: cutting rules loses real rigor (pre-registration, holdout log)
Prediction: global ≤ 20 lines; project block with the ml module < 14 KiB; every failure mode maps to a rule; every rule maps to sources in CIENCIA.md
Acceptance test: a fresh-context reviewer given only the files looks for a failure mode without a rule or a rule without a source — fails if one is found
Steps:
1. [x] `global/AGENTS.md` with U1–U6 + conventions — check: 15 lines, 2.6 KB
2. [ ] `project/method.md` (U1–U9, files, session, tags) + modules trimmed — check: size with ml < 14 KiB
3. [ ] `project/sdd/*` skeletons (task card, test card) + `project/AGENTS.md`; example; this repo's own sdd/ in the new vocabulary — check: diff
4. [ ] `CIENCIA.md`: rule → mechanism → sources, new sources verified — check: every U-rule has a row with sources
5. [ ] Independent review (fresh agent) — check: no gap found, or gaps fixed
Result:
Closing: · Learned:
Note: the old scripts and `check.py` point to removed paths until T-11 replaces them.

## Next tasks
- T-11 `urutau.py` (install, init, update, check, map) + loading tests in Claude Code (→ AC-04)
- T-12 Skills: urutau-setup (3 cases), urutau-audit, urutau-grill (→ AC-04)
- T-13 README, GUIA.md, history/ — newcomer path (→ AC-03)
- T-14 Field tests: mestrado (case a), a repo with code (case c), work PC with Devin CLI (→ AC-04)
- T-07 Phase 7 — pre-registered pilot, EXP-001 (→ AC-05); the mestrado repo is a candidate pilot project
- T-08 Phase 8 — second consolidation, tag `v1.0` (→ all)

## Done
- T-09 v0.1 (two layers, 3-file sdd/, R15, setup skill) — commits 842bac1, 3ad83b6; owner test on mestrado superseded by v0.2 (DEC-013)
- T-00…T-06 Phases 0–6 — v0 delivered 2026-10-26 (DEC-005); `check.py` passed; Claude Code loaded the method from a fresh HOME.

## Open questions and blockers
- `PLAN.md` §7 defaults adopted (DEC-001); owner may override at any checkpoint.
- Owner review of v0/v0.1 rules, templates and guide cards; Codex install untested (AC-04 half open).
- Install the global layer on this machine (`scripts/install.sh`)? Not done yet: it edits `~/.claude/CLAUDE.md`.
