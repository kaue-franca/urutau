# Spec — urutau
<!-- Entries before Decision 16 in log.md use the old vocabulary: AC/SC = success criterion, EXP/TEST = experiment, EXPL/TRY = try, R1–R15/G1–G6/U1–U9 = rules now named, DEC-nnn = Decision n, T-nn = Task n. -->
Question: Can a short, hand-written, tool-agnostic method based on the scientific method make work with AI agents on any of the owner's projects traceable, resistant to self-deception and clear to read, at an upkeep cost the owner accepts, in every tool the owner uses?
Goal type: build
Scope and non-goals: global and project `AGENTS.md` text, project skeletons and example, skills, one stdlib script, README, SCIENCE.md · no domain-specific modules (the owner adds skills when a project needs them); not a product CLI; not spec-as-source; no copy of Spec Kit or Kiro; no Windows/macOS; no proxy/mirror auto-config.
Constraints: everything in files in English, replies in the owner's language; sources paraphrased and linked; Linux with Python ≥ 3.11 on both machines (Ubuntu personal, Red Hat at work); tools: Claude Code and Devin CLI (DeepSeek); no AI attribution anywhere.

## Success criteria
- Criterion 1: global file ≤ 20 lines; ≤ 9 rules; the project method + a filled project section < 14 KiB (Devin cloud reads 16 KiB). Fails if any limit is exceeded.
- Criterion 2: every rule maps to a scientific practice and sources in `SCIENCE.md`, or is marked owner-preference. Fails if any rule has neither.
- Criterion 3: given only the README, an agent with no prior context correctly states the project files, the session routine and how to set up a project. Fails on any wrong or missing item.
- Criterion 4: after install on each machine, a session states the Evidence rule outside a project and the Tries and experiments rule inside one, in Claude Code and in Devin CLI. Fails if any tool/machine pair does not load it.
- Criterion 5: the pilot meets four criteria, fixed before it starts — cold start (in a fresh session the agent states the current task, last result, open ideas and the last dead end from the files alone, fully correct in ≥ 4 of 5 sessions); cards first (≥ 90% of experiment cards committed before their results, by git history); tagged claims (100% of Known lines in `knowledge.md` carry an evidence tag); upkeep (the owner rates it acceptable in ≥ 4 of 5 sessions). Fails if any misses its threshold.

## Current task
### Task 15 Clear communication and fewer codes (serves Criteria 1 and 2) · branch: task-15-clear-communication
Why: the owner could not follow replies full of codes and coined terms, and wants every statement sourced, replies in their language, files in English, and only what is needed in the repo.
Prediction: a Communication section fits the global file within 20 lines; the method needs only five numbered names (Task, Criterion, Try, Experiment, Decision); removing the v0 build files and the ml/rl modules breaks nothing that works today (the scripts were already out of date).
Check: grep finds no old codes in `global/`, `project/`, `examples/`; global file ≤ 20 lines; an agent with no prior context reviewing the files finds no code or coined term without need — fails if it finds one
Steps:
1. [x] Communication section in global and project method — check: global file 20 lines (commit 110ba21)
2. [x] Plain vocabulary in method, skeletons and example; example's missing tries added; no-AI-attribution rule — check: grep clean (commit 3afaa0a)
3. [x] `SCIENCE.md` in English, mechanisms by name, communication sources — check: no rule or mechanism codes left (commit 255ac81)
4. [x] Remove v0 build files, changelog and ml/rl modules (tag v0.1.0); README and dev `AGENTS.md` — check: 25 tracked files (commit 98083f8)
5. [x] This repo's own records in the new vocabulary — check: this card, Decisions 16 and 17
6. [ ] Review by an agent with no prior context — check: no gap found, or gaps fixed
Result:
Closing: · Learned:

## Next tasks
- Task 16 Domain-neutral wording: some rules still use data-science words (holdout, seeds, leakage); make them fit any project without losing rigor (serves the Question)
- Task 11 One stdlib script `urutau.py` (install, set up, update, check) replacing the three out-of-date scripts + loading tests (serves Criterion 4)
- Task 12 Skills: urutau-setup (new project · project with its own records · project with no method), urutau-audit, urutau-grill (serves Criterion 4)
- Task 13 README as the newcomer path (serves Criterion 3)
- Task 14 Field tests: mestrado, a repo with code, work PC with Devin CLI (serves Criterion 4)
- Task 7 Pilot with the four criteria fixed before it starts; the mestrado repo is a candidate (serves Criterion 5)
- Task 8 Second consolidation, tag `v1.0` (serves all)

## Done
- Task 10 Method v0.2: nine named rules, simple vocabulary, sdd skeletons, example, SCIENCE.md — merged in PR #2; its independent review is folded into Task 15 step 6
- Task 9 v0.1 (two layers, 3-file sdd/, setup skill) — commits 842bac1, 3ad83b6; superseded by v0.2 (Decision 13)
- Tasks 0–6 Phases 0–6 — v0 delivered 2026-10-26 (Decision 5)

## Open questions
- Codex install untested; Devin CLI's global file location unverified (docs conflict).
- 11 commits already on `master` carry an AI co-author line; removing it means rewriting published history (force-push) — owner's call.
- Context files did not clearly improve coding-task success in one study (S31); does urutau's file change agent behaviour enough to matter? Only the pilot will tell.
- S31's introduction reports a 7% developer-vs-generated gap that its results (+2.4% vs −2%) do not show — seen in: Phase 1 comparison.
- With the project inside the session scratchpad (`/tmp/claude-1000/…`), Claude Code loaded no project CLAUDE.md at all — seen in: Try EXPL-001.
