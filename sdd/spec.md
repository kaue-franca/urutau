# Spec — urutau
<!-- Entries before Decision 16 in log.md use the old vocabulary: AC/SC = success criterion, EXP/TEST = experiment, EXPL/TRY = try, R1–R15/G1–G6/U1–U9 = rules now named, M1–M13 = scientific practices (now named in SCIENCE.md), E1–E4 = the four pilot criteria in Criterion 5, DEC-nnn = Decision n, T-nn = Task n, "s2" = step 2, Phase n = v0 build phase (PLAN.md, in tag v0.1.0). -->
Question: Can a short, hand-written method, independent of the agent tool, based on the scientific method make work with AI agents on any of the owner's projects traceable, resistant to self-deception and clear to read, at an upkeep cost the owner accepts, in every tool the owner uses?
Goal type: build
Scope and non-goals: global and project `AGENTS.md` text, project skeletons and example, `INSTALL.md` for the agent that installs it, README, SCIENCE.md; an optional `skills/` catalog in the open Agent Skills format (SKILL.md), outside the method, starting with presentation and paper skills (Decision 21) · no domain-specific modules inside the method: `global/` and `project/` never name a skill; no install scripts or tool-specific setup (an agent installs it from `INSTALL.md`); not a tool that generates code from the spec; no copy of other spec-driven tools (Spec Kit, Kiro); no Windows/macOS; no proxy/mirror auto-config.
Constraints: everything in files in English, replies in the owner's language; sources paraphrased and linked; Linux with Python ≥ 3.11 on both machines (Ubuntu personal, Red Hat at work); works in any agent tool that reads `AGENTS.md`; no AI attribution anywhere.

## Success criteria
- Criterion 1: global file ≤ 20 lines; ≤ 9 rules; the project method + a filled project section < 14 KiB (owner-chosen, well under the 32 KiB Codex reads, S30). Fails if any limit is exceeded.
- Criterion 2: every rule maps to a scientific practice and sources in `SCIENCE.md`, or is marked owner-preference. Fails if any rule has neither.
- Criterion 3: given only the README and `INSTALL.md`, an agent with no prior context correctly states the project files and the session routine, and sets up a project. Fails on any wrong or missing item.
- Criterion 4: after an agent installs urutau from `INSTALL.md` on a machine, a new session in each agent tool the owner uses there states the Evidence rule outside a project and the Tries and experiments rule inside one. Fails if any tool on any machine does not load it.
- Criterion 5: the pilot meets four criteria, fixed before it starts — cold start (in a fresh session the agent states the current task, last result, open ideas and the last dead end from the files alone, fully correct in ≥ 4 of 5 sessions); cards first (≥ 90% of experiment cards committed before their results, by git history); tagged claims (100% of Known lines in `knowledge.md` carry an evidence tag); upkeep (the owner rates it acceptable in ≥ 4 of 5 sessions). Fails if any misses its threshold.
- Criterion 6: each skill in `skills/` is self-contained (no file outside its folder), its SKILL.md is under 500 lines, and it is found and used in every agent tool the owner uses; a deck or paper it produces passes its `check.py` (no errors, no overfull boxes, no broken references, fonts embedded), traces every number to the script or query that made it, and, for an executive deck, lets the owner state the recommendation and the ask from the slide titles alone; the owner rates the output "would use without redoing" in ≥ 2 of 3 test cases. Fails if any part fails.

## Current task
### Task 18 Presentation and paper skills (serves Criterion 6) · branch: task-18-presentation-skills
Why: the owner wants to build executive and academic presentations and papers in LaTeX with an agent, following sourced good practice (data storytelling; paper and talk structure), from the same repo as the method.
Prediction: two self-contained skills, `exec-deck` and `academic-writing`, each with a SKILL.md under 500 lines, pass Criterion 6 on the test cases of steps 5 and 6.
Check: Criterion 6 on the outputs of steps 5 and 6 — fails if any part fails.
Steps:
1. [x] Record the scope change (Decision 21), Criterion 6 and this card — check: `sdd/spec.md` and `sdd/log.md` on this branch
2. [x] Skill text before templates (owner's request, 2026-11-23): `skills/exec-deck/` and `skills/academic-writing/`, each a SKILL.md plus `references/` — check: SKILL.md 58 lines each (< 500); the rule lists of Mensh & Kording, Gopen & Swan and Peyton Jones checked against the original texts
3. [x] Templates in each skill's `assets/`: `exec-deck/assets/deck/` and `academic-writing/assets/project/` (paper and talk sharing one `make_figures.py` and `numbers.tex`); Beamer + Moloch, LuaLaTeX, `latexmkrc`, figure styles; shared files are identical copies — check: in this workspace (TeX Live 2023) deck, talk and paper build with exit 0, no undefined references, every font Latin Modern and embedded, pages rendered and looked at; the only Overfull is Moloch v0.1.0's own title page (a one-line document shows it too). Not checked here: biber (could not be installed; the paper was built with `backend=bibtex` in a test copy) and the owner's TeX Live
4. [ ] `check.py` in each skill, after step 7 (owner's order, 2026-11-23: templates, then install) — check: it flags a document with a planted overfull box and a broken reference
5. [ ] Test `exec-deck` on `examples/churn-90d`: an agent with no prior context builds the deck from the skill alone — check: Criterion 6, owner's rating
6. [ ] Test `academic-writing` on a real case of the owner's (MBA work or thesis project) — check: Criterion 6, owner's rating
7. [ ] Skills section in `INSTALL.md`, `VERSION` 0.4.0, README; install on the notebook and the work PC — check: a new session in each tool lists both skills
8. [ ] Independent review by an agent that reads only the files — check: findings answered or recorded
Result:
Closing: · Learned:

## Next tasks
- Task 17 A second example outside data work (for instance a software or writing project), to show the method fits any project (serves the Question)
- Task 12 Procedures `audit` and `grill` as plain Markdown any agent can follow (serves the Question)
- Task 13 Newcomer test of README + `INSTALL.md` (serves Criterion 3)
- Task 14 Field tests: the owner's master's thesis repo, a repo with code, install on the work PC by an agent (serves Criterion 4)
- Task 7 Pilot with the four criteria fixed before it starts; the master's thesis repo is a candidate (serves Criterion 5)
- Task 8 Second consolidation, tag `v1.0` (serves all)

## Done
- Task 16 Domain-neutral wording: rules and skeletons speak of cases, measures, inputs and effort instead of data splits, seeds, metrics and the holdout; the project section's commands and inputs are placeholders, not Python tools — Decision 19
- Task 15 Clear communication and fewer codes, independent of the agent tool — commits on branch task-15-clear-communication; Decisions 16–18
- Task 10 Method v0.2: nine named rules, simple vocabulary, sdd skeletons, example, SCIENCE.md — merged in PR #2; its independent review is folded into Task 15 step 6
- Task 9 v0.1 (two layers, 3-file sdd/, setup skill) — commits eb4a983, 304055c; superseded by v0.2 (Decision 13)
- Tasks 0–6 Phases 0–6 — v0 delivered 2026-10-26 (Decision 5)

## Open questions
- Loading of the global rules is checked only in Claude Code; other tools wait for Task 14.
- Context files did not clearly improve coding-task success in one study (S31); does urutau's file change agent behaviour enough to matter? Only the pilot will tell.
- S31's introduction reports a 7% developer-vs-generated gap that its results (+2.4% vs −2%) do not show — seen in: the Phase 1 comparison (`references/comparison.md`, tag v0.1.0).
- With the project inside the session scratchpad (`/tmp/claude-1000/…`), Claude Code loaded no project CLAUDE.md at all — seen in: EXPL-001 in log.md.
