# {{PROJECT}}
<!-- Project section: hand-written, ≤ 30 lines, only what an agent cannot find out by itself (no repo overview). The urutau block above it is generated: do not edit it here. -->
Purpose: <one line: what this project is for and who uses the result>
Pace: step
<!-- step: wait for the owner after each step · task: after each task · free: only when a decision is needed -->

## Commands
- Setup: `uv sync`
- Code tests / lint: `uv run pytest -q` · `uv run ruff check .`
- Reproduce every reported number: `<command>`

## Data
- Raw: `<path>` (version: <hash or date>) — read-only
- Holdout: `<path>` — kept untouched for the final check; every look is logged in `sdd/log.md`

## Constraints
- <non-obvious rule: privacy, cost of errors, definitions that must not change>
