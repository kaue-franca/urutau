# Scientific SDD — urutau method, applied to this project (v0.1)

Work like a careful scientist: keep what is known apart from what is guessed, test a claim before relying on it, and leave records the next session can trust. This file is the full method for this project; it refines the generic global layer (`~/.claude/CLAUDE.md` / `~/.codex/AGENTS.md`) and wins where they differ. The project's `AGENTS.md` adds commands, data, constraints and active modules. Explicit instructions from the owner override both.

## Rules (most important first)
- **R1 Evidence.** Never state an untested claim as fact. Every claim cites its evidence (EXP/EXPL ID, file, commit) or is tagged `[assumption]` or `[speculation]`. Keep observation, inference and speculation apart.
- **R2 Modes.** Label all work light, explore or confirm. Only a confirm test turns a result into a claim. If unsure of the mode, ask.
- **R3 Predict first.** Before any run, write the result you expect. Before a confirm test, commit the EXP card: rival hypotheses, the result that refutes each, smallest meaningful effect, decision rule, analysis plan, run/search budget, and what data you have already seen.
- **R4 Rivals.** Keep ≥ 2 rival hypotheses per question: always a simple baseline or null, and the mundane rivals — bug, leakage, data or selection artifact, chance.
- **R5 Fresh data.** Confirm on data not used to form the hypothesis: a sealed holdout or a replication. Log every look at the holdout.
- **R6 Fair baseline.** Reproduce the baseline in your own setup before changing anything. Give baseline and challenger the same data, seeds and tuning budget.
- **R7 Report all.** Log every run, deviation and dead end. Scrutinize good results as hard as bad ones: an unexpectedly good result triggers a bug and leakage audit before it is reported. Refuted or abandoned ideas go to the cemetery with evidence and a revive-if condition.
- **R8 Estimate.** Report effect ± uncertainty against the baseline over repeated runs or resamples, never a single score or a p-value alone. Say "no effect" only if an equivalence test against the smallest meaningful effect passes; otherwise say "inconclusive".
- **R9 Traceable.** Every result records commit, data version, config, seed and command. No manual edits to data; every transformation is code.
- **R10 Check.** Check the model against the data (diagnostics, residuals, stability across resamples) before concluding. Record anomalies and assumptions in `knowledge.md` instead of explaining them away.
- **R11 Simple first.** Prefer the simplest adequate approach. Add complexity only to fix a named discrepancy, credit a gain to a component only after an ablation, and work on the biggest threat to validity first.
- **R12 Decisions.** Change a pre-registered plan, an acceptance criterion or an accepted decision only through a new DEC entry that says whether results had been seen. Never rewrite history: supersede, or strike through.
- **R13 Review.** Before a claim is marked `[established]` or acted on, have it reviewed by someone without a stake: the owner, or a fresh-context agent that reads only the files.
- **R14 Ask.** Ask the owner before scope changes or irreversible actions.
- **R15 One task.** Detail only the current task, as a small experiment (task card below); keep later tasks as one generic line each. Do it one step at a time: do the step, compare with the prediction, record, report, and wait for the owner's go unless told to continue. Detail the next task only after the current one closes, using what it taught.

## Modes
| Mode | When | Record |
|---|---|---|
| light | deterministic work with no real uncertainty (refactor, wiring, known fix) | task card in `spec.md` → acceptance test |
| explore | cheap tries to generate ideas | one `EXPL` line in `log.md`: tried → expected → result → next |
| confirm | any claim that will be relied on | `EXP` card committed before the test; fresh data; verdict |

Loop: question → rivals → explore → pre-register → confirm → check → conclude → record; re-enter anywhere.
Verdicts: `supported` · `refuted` · `inconclusive` · `revise assumptions`.

## Session protocol
- Start: if `sdd/` exists, read `sdd/spec.md` (current task first) → the latest `sdd/log.md` entries → `sdd/knowledge.md` as needed; check the git branch; restate the current task, its mode and next step in one line. Read the active modules before planning a confirm test.
- End: update the current task card (ticked steps, result), append to `log.md`, update `knowledge.md`, commit.

## Git workflow
- Never commit on the default branch (`main`/`master`). Starting a task, create `t-nn-<slug>` without asking: from the default branch, or from the current branch if its work is not merged yet.
- Commit after each completed step (`T-nn sK: <what>`).
- Merge into the default branch, push, or open a PR only when the owner asks ("sobe pra prod", "merge", "push"); then merge pending task branches in order, push, and delete the merged branches.

## Project files (`sdd/` holds exactly these three)
- `spec.md` — question; goal type (prediction · explanation · description · build); scope and non-goals; constraints; acceptance criteria `AC-nn`, each naming the result that fails it; current task (one task card); next tasks (`T-nn → AC-nn`, one generic line each); done tasks (one line + evidence); open questions and blockers.
- `knowledge.md` — claims `K-nn` with evidence tags, assumptions `A-nn` (checked by what), anomalies `N-nn` (seen where), superseded claims struck through, cemetery (refuted or abandoned ideas: why, evidence, revive-if).
- `log.md` — dated, append-only entries `EXPL-nnn`, `EXP-nnn`, `DEC-nnn`, each with `by:` (owner or agent/tool). Correct by ~~strikethrough~~ plus a new entry.

Evidence tags: `[established]` (replicated on independent data and reviewed, R13; a rerun is not a replication) · `[supported: EXP-n]` · `[literature: <source>]` · `[assumption]` · `[speculation]`.

## EXP card (confirm mode)
Question · Hypotheses (H1, H2, H0 baseline/null, artifact rivals) · Refuted if (for each: what result rules it out) · Smallest meaningful effect and decision rule · Plan: data and split, already seen, baseline reproduced?, runs/seeds, search budget, analysis · Pre-registered at (commit) · Result: effect ± uncertainty vs baseline, all runs · Verdict · Deviations · Reviewed by · Exploratory notes.

DEC entry: context · options · decision · results seen (yes/no) · consequences (+/−) · supersedes.

## Task card (R15; the current task in `spec.md`)
Title (→ AC, mode, branch) · Goal: what is true when done · Hypothesis: why this approach should work · Rival: the simplest alternative or likeliest failure · Prediction: observable result, written before any work · Acceptance test: command or check, and the result that fails it · Steps: numbered, one commit each, each with its own check · Result: observed vs predicted, with evidence · Closing: done · refuted · abandoned (→ cemetery) · Learned: K/A/N entries and what changes in the next tasks. A confirm task also links its EXP card.

## Modules
Domain checklists are pinned next to this file in `.urutau/modules/` (`ml.md` for machine-learning and statistical models, `rl.md` for reinforcement learning). The project `AGENTS.md` lists the active ones; read them only when the task touches that domain.
