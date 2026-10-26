# urutau — development instructions

Purpose: build a personal, portable, science-grounded spec-driven development (SDD) method: global `AGENTS.md`, project templates, pt-BR guide. `PLAN.md` is the plan.

## Session protocol (dogfooding — this repo uses its own method via `sdd/`)
- Start: read `sdd/status.md` → `sdd/spec.md` → latest entries of `sdd/log.md`; restate the current task and mode in one line.
- End: update `sdd/status.md`, append to `sdd/log.md`, update `sdd/knowledge.md`, commit.
- Work phase by phase (`PLAN.md` §6). At each CHECKPOINT, summarize in ≤ 10 bullets and wait for the owner's approval.
- Do not open `REFERENCES.md` before Phase 1, step 3 (see DEC-002 in `sdd/log.md`).

## Conventions
- Agent-facing files in English; the human guide (`guide/index.html`) in Brazilian Portuguese; identical rule IDs in both.
- Paraphrase sources and link them; no long quotations. Mark anything unverified as `UNVERIFIED`.
- Budgets in `PLAN.md` §4.1 are acceptance criteria: when over budget, merge or delete before adding.
- No tool-specific features in core files (`global/`, `modules/`, `templates/`).
- A difference from `PLAN.md`, or a conflict with current tool docs, becomes a DEC entry in `sdd/log.md`.
- Ask the owner before scope changes or irreversible actions.

## Layout
`global/` method · `modules/` domain checklists · `templates/` project files and filled examples · `references/` source analysis · `guide/` pt-BR guide · `scripts/` install, scaffold, checks · `sdd/` this repo's own records.

## Commands
- Checks: `python3 scripts/check.py` (from Phase 5; not yet written).
