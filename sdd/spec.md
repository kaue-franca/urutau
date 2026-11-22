# Spec — urutau
<!-- Entries before Decision 16 in log.md use the old vocabulary: AC/SC = success criterion, EXP/TEST = experiment, EXPL/TRY = try, R1–R15/G1–G6/U1–U9 = rules now named, M1–M13 = scientific practices (now named in SCIENCE.md), E1–E4 = the four pilot criteria in Criterion 5, DEC-nnn = Decision n, T-nn = Task n, "s2" = step 2, Phase n = v0 build phase (PLAN.md, in tag v0.1.0). -->
Question: Can a short, hand-written method, independent of the agent tool, based on the scientific method make work with AI agents on any of the owner's projects traceable, resistant to self-deception and clear to read, at an upkeep cost the owner accepts, in every tool the owner uses?
Goal type: build
Scope and non-goals: global and project `AGENTS.md` text, project skeletons and example, `INSTALL.md` for the agent that installs it, README, SCIENCE.md · no domain-specific modules (the owner adds skills when a project needs them); no install scripts or tool-specific setup (an agent installs it from `INSTALL.md`); not a tool that generates code from the spec; no copy of other spec-driven tools (Spec Kit, Kiro); no Windows/macOS; no proxy/mirror auto-config.
Constraints: everything in files in English, replies in the owner's language; sources paraphrased and linked; Linux with Python ≥ 3.11 on both machines (Ubuntu personal, Red Hat at work); works in any agent tool that reads `AGENTS.md`; no AI attribution anywhere.

## Success criteria
- Criterion 1: global file ≤ 20 lines; ≤ 9 rules; the project method + a filled project section < 14 KiB (owner-chosen, well under the 32 KiB Codex reads, S30). Fails if any limit is exceeded.
- Criterion 2: every rule maps to a scientific practice and sources in `SCIENCE.md`, or is marked owner-preference. Fails if any rule has neither.
- Criterion 3: given only the README and `INSTALL.md`, an agent with no prior context correctly states the project files and the session routine, and sets up a project. Fails on any wrong or missing item.
- Criterion 4: after an agent installs urutau from `INSTALL.md` on a machine, a new session in each agent tool the owner uses there states the Evidence rule outside a project and the Tries and experiments rule inside one. Fails if any tool on any machine does not load it.
- Criterion 5: the pilot meets four criteria, fixed before it starts — cold start (in a fresh session the agent states the current task, last result, open ideas and the last dead end from the files alone, fully correct in ≥ 4 of 5 sessions); cards first (≥ 90% of experiment cards committed before their results, by git history); tagged claims (100% of Known lines in `knowledge.md` carry an evidence tag); upkeep (the owner rates it acceptable in ≥ 4 of 5 sessions). Fails if any misses its threshold.

## Current task
<!-- None: the next task is detailed with the owner. -->

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
- Task 9 v0.1 (two layers, 3-file sdd/, setup skill) — commits 842bac1, 3ad83b6; superseded by v0.2 (Decision 13)
- Tasks 0–6 Phases 0–6 — v0 delivered 2026-10-26 (Decision 5)

## Open questions
- Loading of the global rules is checked only in Claude Code; other tools wait for Task 14.
- Context files did not clearly improve coding-task success in one study (S31); does urutau's file change agent behaviour enough to matter? Only the pilot will tell.
- S31's introduction reports a 7% developer-vs-generated gap that its results (+2.4% vs −2%) do not show — seen in: the Phase 1 comparison (`references/comparison.md`, tag v0.1.0).
- With the project inside the session scratchpad (`/tmp/claude-1000/…`), Claude Code loaded no project CLAUDE.md at all — seen in: EXPL-001 in log.md.
