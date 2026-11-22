---
name: urutau-setup
description: Set up a repository with the urutau scientific SDD method — a setup branch, Python env with uv (venv + basic libs + lock), the method pinned in .urutau/, sdd/ with only spec.md, knowledge.md and log.md, and ONE carefully defined first task (later tasks kept generic). Use when the owner asks to set up, start, bootstrap or prepare a project or repo ("setup do projeto", "configura o repo", "prepara o projeto", "inicia o sdd", "aplica o urutau aqui"), or to update a project's pinned urutau version.
---

# urutau project setup

Talk to the owner in Brazilian Portuguese. Never overwrite existing files; never merge or push.

## 0. Locate urutau and load the method
```sh
URUTAU="$(dirname "$(dirname "$(readlink -f ~/.claude/skills/urutau-setup)")")"
"$URUTAU/scripts/install.sh" --status "$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
git -C "$URUTAU" fetch -q && git -C "$URUTAU" status -sb | head -1
```
Read `$URUTAU/method/AGENTS.md` in full: it defines R1–R15, the task card and the `sdd/` files you are about to write. Warn the owner if the urutau clone is behind its remote or has uncommitted changes (the pin would record them).

## 1. Inspect the target (read-only)
Target = the git root of the current directory, or the path the owner gave. Report in ≤ 6 lines: default branch, current branch, uncommitted changes, remote, and which of `pyproject.toml`, `uv.lock`, `AGENTS.md`, `CLAUDE.md`, `sdd/`, `.urutau/` already exist. Read `README*` and skim the tree to understand the project.
- Not a git repo → ask before `git init`.
- Uncommitted changes → ask (commit them first, stash, or continue).
- `sdd/status.md` exists (urutau v0) → propose moving its current task into `spec.md` and its cemetery into `knowledge.md`.
- `.urutau/` exists → this is an update: run only `install.sh --project <root>`, show the old → new version, commit on a branch, stop.

## 2. One round of questions
Ask at most once, together (use AskUserQuestion when available); skip what the README already answers:
- Domain modules: `ml` (adds scikit-learn) · `rl` (adds gymnasium) · none.
- Libraries: defaults are numpy, pandas, matplotlib, scipy + dev pytest, ruff, ipykernel — any extras (e.g. torch, polars, statsmodels)?
- Python version (default 3.12).
- If unclear: the project's question in one line, and what result would count as success.

## 3. Branch
Do not work on the default branch. Create `t-00-setup` without asking: from the default branch, or from the current branch if it holds unmerged work.

## 4. Scaffold, pin and environment
```sh
"$URUTAU/scripts/new-project.sh" <root> [--ml] [--rl] [--python VER] [--with PKG ...] [--dev-with PKG ...]
```
It creates `AGENTS.md`, `CLAUDE.md`, `sdd/{spec,knowledge,log}.md` (only these three), pins `method/AGENTS.md` + `modules/` into `.urutau/`, runs `uv init --bare` / `uv python pin` / `uv venv` / `uv add` (or only `uv sync` when `pyproject.toml` exists — then add libraries with `uv add` only if the owner asked), and updates `.gitignore`. If any step fails, stop and report the error; do not improvise around it.

## 5. Verify (G2: say what you expect first)
- the script printed `ok: python <ver> + <imports>`;
- `uv run ruff --version` and `uv run pytest -q` run (exit code 5 = no tests yet, fine);
- `python3 "$URUTAU/scripts/check.py" --project <root>` passes.

## 6. Fill the project files with the owner
- `AGENTS.md`: purpose, commands, data, constraints — only what you know from the repo or the owner. Leave `<…>` placeholders for the rest and list them under open questions. Never invent data paths, numbers or deadlines.
- `sdd/spec.md`: question, goal type, scope, non-goals, constraints, and draft acceptance criteria, each with the result that fails it. Show the drafts and ask for corrections.
- **Tasks (R15)** — the core of the setup:
  - Agree with the owner on the first real task and write ONE full task card for `T-01`: goal, hypothesis and rival, prediction (written now, before any work), acceptance test with its failing result, mode, branch `t-01-<slug>`, and 3–7 small numbered steps, each with its own check.
  - Later tasks: one generic line each (`- T-02 <rough idea> (→ AC-nn)`). Do not detail them now: they will be reshaped by what T-01 teaches.
  - `## Done`: `- T-00 urutau setup — uv env (Python <ver>, <libs>), method pinned at <version> (<commit>)`.
- `sdd/log.md`: append `DEC-001` with the setup choices (Python version, libraries, modules, pinned urutau version; results seen: no; by: agent (Claude Code)).

## 7. Commit and stop
Stage only the setup files (`AGENTS.md CLAUDE.md sdd .urutau pyproject.toml uv.lock .python-version .gitignore`) and commit on `t-00-setup`: `T-00: urutau setup (uv env, method <version>, sdd/)`. Do not merge or push.

Final report (pt-BR, short): what was created and the versions; current branch; the T-01 card in 3 lines; placeholders still open; and the next move — once the owner approves T-01, create `t-01-<slug>` from `t-00-setup` and do step 1 only. Mention that "sobe pra prod" merges the task branches into the default branch and pushes. If `install.sh --status` showed the global layer not installed, offer `"$URUTAU/scripts/install.sh"`; do not run it yourself.

Do not start T-01 in this skill.
