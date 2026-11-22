# {{PROJECT}}
<!-- Agent instructions for this project. Keep ≤ 30 lines, hand-written, only what an agent cannot discover itself (no repo overview). The method is pinned in `.urutau/` by urutau's install.sh --project. -->
Purpose: <one line: what this project is for and who uses the result>

## Commands
<!-- Copy-pasteable. Agents will run what is listed here. Python env is managed by uv. -->
- Setup: `uv sync`
- Tests / lint: `uv run pytest -q` · `uv run ruff check .`
- Reproduce all reported numbers: `<command>`

## Data
<!-- Location, version or hash, how it was produced; where the sealed holdout lives and who may open it. -->
- Raw: `<path>` (version: <hash or date>) — read-only
- Holdout: `<path>` — sealed; every access is logged in `sdd/log.md`

## Domain constraints
<!-- Non-obvious rules: privacy, costs of errors, deployment conditions, definitions that must not change. -->
- <constraint>

## Method
- Scientific SDD (urutau {{VERSION}}). Records live in `sdd/`; start every session with `sdd/spec.md` (current task first).
- One task at a time, on its own branch; merge or push only when the owner asks.
- The method, urutau applied to this project (pinned copy; read it first): @.urutau/AGENTS.md
- Active modules: {{MODULES}}
