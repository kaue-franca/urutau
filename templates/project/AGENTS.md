# {{PROJECT}}
<!-- Agent instructions for this project. Keep ≤ 30 lines, hand-written, only what an agent cannot discover itself (no repo overview). The method itself is global (urutau). -->
Purpose: <one line: what this project is for and who uses the result>

## Commands
<!-- Copy-pasteable. Agents will run what is listed here. -->
- Setup: `<command>`
- Tests / checks: `<command>`
- Reproduce all reported numbers: `<command>`

## Data
<!-- Location, version or hash, how it was produced; where the sealed holdout lives and who may open it. -->
- Raw: `<path>` (version: <hash or date>) — read-only
- Holdout: `<path>` — sealed; every access is logged in `sdd/log.md`

## Domain constraints
<!-- Non-obvious rules: privacy, costs of errors, deployment conditions, definitions that must not change. -->
- <constraint>

## Method
- Scientific SDD (urutau). Records live in `sdd/`; start every session with `sdd/status.md`.
- Active modules: {{MODULES}}
