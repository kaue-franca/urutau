# Installing urutau
Instructions for the AI agent asked to install, set up, update or remove urutau, working from this repository. The owner does not do this by hand. urutau is plain Markdown read through `AGENTS.md`; nothing here depends on a specific agent tool. Ask the owner before changing any file outside the target project or this repo, and report each change (file, what was added).

## On a machine: the global rules
1. Find the user-level instruction file that your own tool loads in every session. Read your tool's documentation for this; do not guess the path, and say where you found it.
2. Make that file load `global/AGENTS.md` from this repo, keeping everything else in it untouched, in the first way the tool supports: an import by path; a symbolic link (only if the file is empty or missing); or a copy of the text between `<!-- urutau:begin -->` and `<!-- urutau:end -->`. An import or link follows `git pull` in this repo; a copy must be redone after each update.
3. Check: in a new session, ask the agent to state the Evidence rule of its global instructions. It must quote it. If not, report what failed.

## On a machine: optional skills
The folders in `skills/` are self-contained skills in the open SKILL.md format; they are not part of the method. Install only the ones the owner asks for.
1. Find the user-level skills folder that your own tool reads in every session. Read your tool's documentation for this; do not guess the path, and say where you found it. Some tools also read the shared `~/.agents/skills/`.
2. For each skill, link its folder there: `ln -s <this repo>/skills/<name> <skills folder>/<name>`. A link follows `git pull` in this repo; if the tool does not follow links, copy the folder and copy it again after each update.
3. Check what the skills need and report what is missing, without installing system packages unless the owner asks: `which lualatex latexmk biber uv` and `kpsewhich beamerthememoloch.sty biblatex.sty brazil.ldf`.
4. Check: in a new session, ask the agent to list its skills. Each installed skill must appear by name. If not, report what failed.

## In a project: set up
1. Work on a branch `task-0-setup`. Read the project's README and tree; report what already exists (`AGENTS.md`, `sdd/`, other record files, `pyproject.toml`).
2. `AGENTS.md` at the project root: first the text of `project/method.md` between `<!-- urutau:begin v<VERSION> -->` and `<!-- urutau:end -->`, with `{{VERSION}}` replaced by the content of `VERSION`; then the project section from `project/AGENTS.md`. Fill the project section only with what the repo or the owner tells you; leave `<…>` placeholders for the rest. If the project already had an `AGENTS.md`, keep its content in the project section.
3. If the tool in use reads another file name instead of `AGENTS.md`, add that file with only a pointer to `AGENTS.md` (an import if the tool supports it).
4. Copy `project/sdd/` to `sdd/`, replacing `{{PROJECT}}`; never overwrite an existing file. If the project keeps its own records elsewhere, propose to the owner how to move them into the three files.
5. Python projects: set up with uv (`uv init`, `uv add`); if `pyproject.toml` exists, only `uv sync`.
6. With the owner: the question and success criteria in `sdd/spec.md`, Task 1 in detail, later tasks one line each. Record the setup choices as Decision 1 in `sdd/log.md`.
7. Commit on the branch. Merge only when the owner asks.

## In a project: update
Replace only the text between the urutau markers with the current `project/method.md` and version, show the owner the difference, and record a Decision in the project's `sdd/log.md`.

## Remove
Undo step 2 of the machine install (the import, link or marked block) and remove the skill links or copies. In a project, remove the marked block from `AGENTS.md`; the `sdd/` records stay unless the owner asks otherwise.
