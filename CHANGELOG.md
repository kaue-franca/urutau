# Changelog
Versions follow `VERSION`. Projects record the version they pinned in `.urutau/VERSION`; update one with `scripts/install.sh --project <path>`.

## 0.1.0 — 2026-11-22 (DEC-012)
- Two layers: `global/AGENTS.md` is now a generic layer (principles G1–G6, git workflow, uv) installed once per machine; the full method moved to `method/AGENTS.md` and is pinned per project into `.urutau/` (with `modules/` and a version stamp).
- `sdd/` holds only `spec.md`, `knowledge.md`, `log.md`: `status.md` removed; the current task lives in `spec.md`, the cemetery in `knowledge.md`.
- R15 One task + task card: one detailed task at a time, framed as a small experiment (hypothesis, rival, prediction, acceptance test, steps with checks), done step by step; later tasks stay generic.
- Git workflow: a branch per task (`t-nn-<slug>`), a commit per step, merge/push only on the owner's request.
- `scripts/new-project.sh` also sets up Python with uv (pyproject, `.python-version`, `.venv`, basic libs, lock) and pins the method; `scripts/install.sh` gains `--project`, `--status`, and links `skills/` into `~/.claude/skills/`.
- New skill `skills/urutau-setup` (Claude Code). `check.py` checks the two layers, skills, version, the pin, the 3-file `sdd/` and R15.
- Module paths in projects are relative (`.urutau/modules/…`), superseding DEC-010.

## v0 — 2026-10-26
- Phase 0: repository layout, development `AGENTS.md`/`CLAUDE.md`, dogfooding `sdd/` with S1–S5 as acceptance criteria AC-01…AC-05; `PLAN.md` v0.2 and `REFERENCES.md` v0.2 added.
- Phase 1: blind re-analysis of 34 sources (`references/analysis.md`, 15 proposed additions) and comparison with v0.2 (`references/comparison.md`); DEC-003, DEC-004.
- v0 (Phases 2–6): `references/sources.md` (all references, mechanisms M1–M10, rules R1–R14); `global/AGENTS.md`; `modules/{ml,rl}.md`; project templates and filled examples; pt-BR `guide/index.html`; `scripts/{install.sh,new-project.sh,check.py}`; DEC-005…DEC-011.
