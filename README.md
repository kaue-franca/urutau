# urutau
A short, tool-agnostic method for working with AI agents on any project, based on the scientific method. The agent keeps what was checked apart from what is assumed, predicts before it acts, tests an idea before relying on it, explains itself in plain words, and leaves records the next session can trust.

It is plain Markdown read through `AGENTS.md`, so it works with any agent that reads that file (Codex, Devin CLI; Claude Code through a `CLAUDE.md` containing `@AGENTS.md`).

## What is here
| Path | What it is |
|---|---|
| `global/AGENTS.md` | Rules for every session on a machine: six rules, conventions, communication. |
| `project/` | What a project receives: `method.md` (all nine rules, communication, the `sdd/` routine), the project section `AGENTS.md`, `CLAUDE.md`, and the three `sdd/` files. |
| `examples/churn-90d/` | A filled, fictional project to learn the format from. |
| `SCIENCE.md` | Why each rule exists and the sources behind it. |
| `skills/urutau-setup/` | Setup skill. Out of date since v0.2; a planned task rewrites it. |
| `scripts/` | `install.sh` installs the global rules. The project setup and check scripts are out of date since v0.2; a planned task replaces them. |
| `sdd/` | This repository's own records: urutau is built with its own method. |

## Use
- Global rules on this machine: `scripts/install.sh` (`--status` shows what is installed, `--uninstall` undoes it).
- In a project, until the setup is rewritten: copy `project/method.md` into the top of the project's `AGENTS.md`, add the project section from `project/AGENTS.md`, and copy `project/sdd/` and `project/CLAUDE.md`.

## A project's records (`sdd/`)
- `spec.md`: the question, the success criteria, the one current task in detail, the next tasks in one line each, open questions.
- `knowledge.md`: what is known (with evidence), what is assumed, dead ends, why each file exists.
- `log.md`: append-only record of tries, experiments and decisions.

Version: `VERSION`. History: git tags and the decisions in `sdd/log.md`.
