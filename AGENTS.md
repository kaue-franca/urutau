# urutau — development instructions

Purpose: build and version urutau, a short, tool-agnostic method for working with AI agents on any project, based on the scientific method. This repo uses its own method: the working copy is loaded below and its records are in `sdd/`.

- The method: @project/method.md

## Conventions
- Paraphrase sources and link them in `SCIENCE.md`; every rule maps to sources there or is marked owner-preference.
- The limits in the success criteria of `sdd/spec.md` are hard limits: when over, merge or delete before adding.
- No tool-specific features in `global/` or `project/`; tool-specific helpers go in `skills/`.
- A change to `global/` or `project/` bumps `VERSION` and gets a Decision in `sdd/log.md`. So does a conflict with current tool docs.

## Layout
`global/` rules for every session · `project/` what a project receives · `examples/` a filled project · `SCIENCE.md` sources · `skills/` agent skills · `scripts/` install and setup · `sdd/` this repo's own records.

## Commands
- Install the global rules: `scripts/install.sh` (`--status`, `--uninstall`).
- `scripts/check.py`, `scripts/new-project.sh` and `install.sh --project` are out of date since v0.2 (they look for `method/`, `modules/`, `templates/`); a planned task replaces them.
