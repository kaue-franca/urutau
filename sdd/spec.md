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
### T-09 v0.1: two layers, 3-file sdd/, R15 task card, git workflow, uv setup skill (→ AC-01, AC-03, AC-04) · mode: light · branch: feat/setup-skill
Goal: the owner can install urutau globally (generic layer + skills) and per project (pinned method), and set up a repo with one skill: branch, uv env, `sdd/{spec,knowledge,log}.md`, one detailed first task.
Hypothesis: owner requests of 2026-11-22 fit the v0 structure with a layer split and no new script · Rival: the split pushes files over budget or breaks the guide/check coverage
Prediction: `check.py` passes with the method ≤ 100 lines and ≤ 15 rules; `new-project.sh` builds a working uv env in a throwaway repo
Acceptance test: `python3 scripts/check.py` and `--project .` pass; scratch-repo run prints `ok: python …` — fails if any check fails or the env does not import
Steps:
1. [x] Split `global/` (generic G1–G6) and `method/` (R1–R15); R15 + task card; git workflow — check: `check.py` rules/budgets
2. [x] Templates: drop `status.md`, task card in `spec.md`, cemetery in `knowledge.md`; examples — check: `check.py` examples
3. [x] `new-project.sh` (uv + pin), `install.sh` (`--project`, `--status`, skills) — check: scratch repo, re-run idempotent
4. [x] `skills/urutau-setup`, `check.py`, `references/sources.md`, guide, README, CHANGELOG, VERSION — check: `check.py` passes
5. [ ] Owner tests the skill on `~/repos/mestrado` — check: `check.py --project` passes there; default branch untouched
Result: steps 1–4 as predicted (`check.py` PASSED; scratch env Python 3.12.13 imported numpy, pandas, matplotlib, scipy, sklearn; pinned method loads in a live session, EXPL-001).
Closing: · Learned:

## Next tasks
- T-07 Phase 7 — pre-registered pilot, EXP-001 (→ AC-05); the mestrado repo is a candidate pilot project
- T-08 Phase 8 — second consolidation, tag `v1.0` (→ all)

## Done
- T-00…T-06 Phases 0–6 — v0 delivered 2026-10-26 (DEC-005); `check.py` passed; Claude Code loaded the method from a fresh HOME.

## Open questions and blockers
- `PLAN.md` §7 defaults adopted (DEC-001); owner may override at any checkpoint.
- Owner review of v0/v0.1 rules, templates and guide cards; Codex install untested (AC-04 half open).
- Install the global layer on this machine (`scripts/install.sh`)? Not done yet: it edits `~/.claude/CLAUDE.md`.
