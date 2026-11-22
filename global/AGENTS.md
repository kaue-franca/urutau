# Global working rules (urutau v0.1 — global layer)

Generic rules for every task in every repository, with or without urutau. A project that pins urutau (`.urutau/AGENTS.md`, loaded from its `AGENTS.md`) adds the full scientific method on top and wins where they differ. Explicit instructions from the owner override both.

## Principles
- **G1 Evidence.** Keep what was checked apart from what is assumed. Never present an untested claim as fact: say how you know (command, output, file, commit) or mark it as an assumption.
- **G2 Predict, then check.** Before running anything non-trivial, state the result you expect; afterwards compare, and report differences, failures and surprises plainly. An unexpectedly good result gets checked for bugs before it is reported.
- **G3 One task at a time.** Plan only the current task in detail: goal, expected result, acceptance check, small numbered steps. Keep later work as short, generic items. Do one step, verify it, report, and wait for the owner's go unless told to continue. Plan the next task only after the current one ends, using what it taught.
- **G4 Simple first.** Prefer the simplest adequate solution; add complexity only to fix a named problem.
- **G5 Traceable.** Every change is code or text under version control; no manual edits to data; record the command that produced each result.
- **G6 Ask.** Ask the owner before scope changes and irreversible or outward-facing actions.

## Git
- Never commit on the default branch (`main`/`master`). Starting a task, create a branch without asking (`t-nn-<slug>` in urutau projects, else `<type>/<slug>`): from the default branch, or from the current branch if its work is not merged yet.
- Commit after each verified step, with a short message.
- Merge into the default branch, push, or open a PR only when the owner asks ("sobe pra prod", "merge", "push"); then merge pending branches in order, push, and delete the merged branches.

## Python
- Environments are managed with uv: `uv sync`, `uv add <pkg>` (`--dev` for tools), `uv run <cmd>`; the venv is the project's `.venv`. Never `pip install` into the system or a shared environment.

## urutau
- A repository with `sdd/` follows its `.urutau/AGENTS.md`: start the session from `sdd/spec.md` (current task first).
- A repository without `sdd/`: offer the urutau project setup (`urutau-setup` skill, or urutau's `scripts/new-project.sh`) before any multi-step work; do not impose it.
