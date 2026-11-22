# urutau — development instructions

Purpose: build and version a personal, portable, science-grounded spec-driven development (SDD) method — generic global layer, per-project method, templates, skills, pt-BR guide. `PLAN.md` is the original plan; DEC entries record departures from it.

## Session protocol (dogfooding — this repo uses its own method via `sdd/`)
- The method, working copy (this repo is its source): @project/method.md
- Start: read `sdd/spec.md` (current task first) → latest entries of `sdd/log.md`; check the branch; restate the current task, mode and next step in one line.
- End: update the current task card in `sdd/spec.md`, append to `sdd/log.md`, update `sdd/knowledge.md`, commit on the task branch. Merge into `master` or push only when the owner asks.
- Work phase by phase (`PLAN.md` §6). At each CHECKPOINT, summarize in ≤ 10 bullets and wait for the owner's approval.
- Do not open `REFERENCES.md` before Phase 1, step 3 (see DEC-002 in `sdd/log.md`).

## Conventions
- Agent-facing files in English; the human guide (`guide/index.html`) in Brazilian Portuguese; identical rule IDs in both.
- Paraphrase sources and link them; no long quotations. Mark anything unverified as `UNVERIFIED`.
- Budgets in `PLAN.md` §4.1 are acceptance criteria: when over budget, merge or delete before adding.
- No tool-specific features in core files (`global/`, `method/`, `modules/`, `templates/`); tool-specific helpers go in `skills/`.
- A change to `global/`, `method/`, `modules/` or `templates/` bumps `VERSION` and gets a `CHANGELOG.md` entry.
- A difference from `PLAN.md`, or a conflict with current tool docs, becomes a DEC entry in `sdd/log.md`.
- Ask the owner before scope changes or irreversible actions.

## Layout
`global/` generic layer · `method/` full method (pinned into projects) · `modules/` domain checklists · `skills/` Claude Code skills · `templates/` project files and filled examples · `references/` source analysis · `guide/` pt-BR guide · `scripts/` install, scaffold, checks · `sdd/` this repo's own records.

## Commands
- Checks: `python3 scripts/check.py` and `python3 scripts/check.py --project .`
- Install: `scripts/install.sh` (global layer + skills) · `scripts/install.sh --project <path>` (pin the method) · `--status`.
