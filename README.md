# urutau

A personal, portable spec-driven development (SDD) method grounded in the scientific method, for agent-assisted data-science work.

It ships:
- `global/AGENTS.md` — the method, loaded in every session (Claude Code and Codex);
- `modules/` — on-demand checklists (ML, RL);
- `templates/` — project files (`AGENTS.md`, `CLAUDE.md`, `sdd/{spec,status,knowledge,log}.md`) and filled examples;
- `guide/index.html` — guia em português para validar cada regra;
- `scripts/` — `install.sh`, `new-project.sh`, `check.py`.

Status: v0 (Phases 0–6 of `PLAN.md`); the Phase 7 pilot has not started. This repository manages its own development with the method, in `sdd/`.

Quick start:
```sh
scripts/install.sh                      # Claude Code + Codex, idempotent; --uninstall to undo
scripts/new-project.sh ~/code/my-proj --ml
python3 scripts/check.py                # this repo; add --project <path> to lint a project
```
References: `references/sources.md` (every source, its URL and the rules it supports).
