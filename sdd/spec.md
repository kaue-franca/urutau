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

## Tasks
- T-00 Phase 0 — bootstrap layout and `sdd/` (→ all)
- T-01 Phase 1 — blind re-analysis of sources; `references/analysis.md`, `comparison.md` (→ AC-02)
- T-02 Phase 2 — consolidate into `references/sources.md`; finalize rules and artifacts (→ AC-01, AC-02)
- T-03 Phase 3 — `global/AGENTS.md`, `modules/` within budget (→ AC-01)
- T-04 Phase 4 — `templates/project/*` and `templates/examples/` (→ AC-03)
- T-05 Phase 5 — `guide/index.html`, `scripts/check.py` (→ AC-01, AC-03)
- T-06 Phase 6 — `install.sh`, `new-project.sh`; re-check loading against current docs (→ AC-04)
- T-07 Phase 7 — pre-registered pilot, EXP-001 (→ AC-05)
- T-08 Phase 8 — second consolidation, `CHANGELOG.md`, tag `v1.0` (→ all)

## Open questions
- `PLAN.md` §7 defaults adopted (DEC-001, approved at Phase 0); owner may override at any checkpoint.
