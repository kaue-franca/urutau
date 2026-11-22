# urutau

A personal, portable spec-driven development (SDD) method grounded in the scientific method, for agent-assisted data-science work. This repository is the single source of every version of the method (`VERSION`, `CHANGELOG.md`).

Two layers, used together:
- **global** — `global/AGENTS.md`: generic working principles (G1–G6), git workflow and uv, for every session on the machine; plus `skills/` for Claude Code. Installed once; linked to this clone, so `git pull` updates it.
- **project** — `method/AGENTS.md` + `modules/`: the full method (R1–R15) applied to one project, pinned with its version into `<project>/.urutau/` and loaded by the project's `AGENTS.md`. Project records live in `sdd/{spec,knowledge,log}.md`.

Also: `templates/` (project files and filled examples), `guide/index.html` (guia em português para validar cada regra), `references/` (sources behind each rule), `scripts/`.

Quick start:
```sh
scripts/install.sh                        # global layer + skills (Claude Code, Codex); --uninstall to undo
scripts/new-project.sh ~/code/my-proj --ml  # files + method pin + uv env; or the urutau-setup skill
scripts/install.sh --project ~/code/my-proj # update a project's pin to this version
scripts/install.sh --status [<project>]   # what is installed where
python3 scripts/check.py [--project <path>]
```
Status: v0.1.0; the Phase 7 pilot has not started. This repository manages its own development with the method, in `sdd/`.
