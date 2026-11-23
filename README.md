# urutau
A short method for working with AI agents on any project, based on the scientific method and independent of the agent tool. The agent keeps what was checked apart from what is assumed, predicts before it acts, tests an idea before relying on it, explains itself in plain words, and leaves records the next session can trust.

The method is plain Markdown read through `AGENTS.md`. To install or set it up, ask an agent to follow `INSTALL.md` from this repository.

## What is here
| Path | What it is |
|---|---|
| `global/AGENTS.md` | Rules for every session on a machine: six rules, conventions, communication. |
| `project/` | What a project receives: `method.md` (all nine rules, communication, the `sdd/` routine), the project section `AGENTS.md`, and the three `sdd/` files. |
| `INSTALL.md` | Steps for the agent that installs urutau on a machine, or sets it up, updates or removes it in a project. |
| `examples/churn-90d/` | A filled, fictional project to learn the format from. |
| `SCIENCE.md` | Why each rule exists and the sources behind it. |
| `skills/` | Optional skills outside the method, in the open SKILL.md format: `exec-deck` (executive decks with data storytelling) and `academic-writing` (papers and academic talks), both in LaTeX. Templates and install steps are still to come. |
| `sdd/` | This repository's own records: urutau is built with its own method. |

## A project's records (`sdd/`)
- `spec.md`: the question, the success criteria, the one current task in detail, the next tasks in one line each, open questions.
- `knowledge.md`: what is known (with evidence), what is assumed, dead ends, why each file exists.
- `log.md`: append-only record of tries, experiments and decisions.

Version: `VERSION`. History: git tags and the decisions in `sdd/log.md`.
