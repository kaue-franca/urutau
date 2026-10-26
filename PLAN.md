# Scientific SDD — Implementation Plan (v0.2)

Owner: Kauê (data scientist). Executor: Claude Code, inside this repository.
Written 2026-10-26. Companion file: `REFERENCES.md` (analysis of every source, v0.2). **Do not open it before Phase 1 tells you to.**

---

## 0. How to execute

- Work phase by phase (§6). At every **CHECKPOINT**, summarize what changed in ≤ 10 bullets and wait for the owner's approval.
- Dogfood: this repo manages its own development with the method it builds (`sdd/` folder) from Phase 0.
- Budgets (§5) are acceptance criteria.
- Agent-facing files in English; the human guide in Brazilian Portuguese; identical rule IDs in both.
- Paraphrase sources, link everything, no long quotations. Mark anything you cannot verify as `UNVERIFIED`.
- If this plan conflicts with current tool documentation, follow the documentation and record a DEC entry.

---

## 1. Goal and success criteria

**Goal.** A personal, portable spec-driven development method grounded in the scientific method: a **global `AGENTS.md`** loaded on every machine, **project templates**, and a **pt-BR HTML guide** the owner uses to validate every rule.

**Success criteria** (evaluated at the end of Phase 7):
- **S1.** `global/AGENTS.md` ≤ 100 lines and ≤ 15 rules (`scripts/check.py`).
- **S2.** Every rule maps to ≥ 1 mechanism and source in `references/sources.md`, or is tagged `owner-preference`.
- **S3.** `guide/index.html` covers 100% of rule IDs, templates and modules (`check.py`).
- **S4.** On a fresh machine, `git clone` + `scripts/install.sh` loads the method in Claude Code and Codex (verified as in §4.3).
- **S5.** The pilot meets its pre-registered criteria E1–E4 (Phase 7).

**Non-goals.** No CLI tool; no spec-as-source; no copy of Spec Kit or Kiro; no tool-specific features in core files; no automation beyond three scripts.

---

## 2. Design derived from the reference analysis

`REFERENCES.md` analyses 34 sources and reduces them to nine mechanisms. Each mechanism becomes rules, file fields, or both:

| ID | Mechanism | Becomes |
|---|---|---|
| M1 | Testable claims | Hypotheses and acceptance criteria name the refuting result; spec states goal type |
| M2 | Rival hypotheses | ≥ 2 hypotheses per question, one a simple baseline or null |
| M3 | Explore vs confirm | Two modes; confirmatory tests pre-registered and run on data not used to form the hypothesis |
| M4 | Report everything | All runs and deviations logged; symmetric scrutiny; cemetery |
| M5 | Estimate, don't threshold | Effect ± uncertainty vs baseline; smallest meaningful effect set in advance |
| M6 | Traceability | Commit, data, config, seed per result; every claim links to evidence; append-only log |
| M7 | Iterate and check | Model check before concluding; assumptions and anomalies tracked |
| M8 | Record decisions | DEC entries; superseded, never deleted |
| M9 | Context discipline | Short hand-written files, critical rules first, modules on demand, method evaluated |

**What the analysis changed relative to v0.1**
- "Commit before every run" → **explore vs confirm** (S16: with many fast experiments, explore freely and confirm by replication or a sealed holdout; S34: one workflow does not fit all sizes).
- `knowledge.md` now tracks **assumptions and anomalies** (S03, S04, S08).
- New: **reproduce the baseline before changing it** (S07, S26) and **symmetric scrutiny** of good and bad results (S07).
- New: Platt's **"The Question"** as the gate for confirmatory tests (S06).
- Global rule budget cut from 25 to 15 (S31, S33).

---

## 3. The method (draft — finalized in Phase 2)

### 3.1 Loop and modes
`Question → Rival hypotheses → Explore → Pre-register → Confirm → Check → Conclude → Record` (re-enter anywhere).

| Mode | When | Record |
|---|---|---|
| **Light** | Deterministic work with no real uncertainty (refactor, wiring, known fix) | Task → acceptance test → `status.md` |
| **Explore** | Cheap tries to generate ideas | One-line `EXPL` entry in `log.md`, labeled exploratory |
| **Confirm** | Any claim that will be relied on | `EXP` card committed **before** the test; data not used to form the hypothesis |

Verdicts: `supported`, `refuted`, `inconclusive`, `revise assumptions`. When unsure of the mode, the agent asks the owner.

### 3.2 Draft rules (≤ 15, most important first)
1. Never state an untested claim as fact; tag evidence; separate observation, inference and speculation. (M1, M4)
2. Keep ≥ 2 rival hypotheses, one a simple baseline or null. (M2)
3. Label all work explore or confirm. A claim needs a confirm test. (M3)
4. Before a confirm test, commit the EXP card: hypotheses, the result that would refute each, smallest meaningful effect, decision rule, analysis plan. (M1, M3, M5)
5. Confirm on data not used to form the hypothesis (sealed holdout or replication). (M3)
6. Reproduce the baseline in your own setup before changing conditions. (M3)
7. Report every run and deviation; scrutinize good results as hard as bad ones. (M4)
8. Report effect ± uncertainty against the baseline; never a single score or a p-value alone. (M5)
9. Make every result traceable (commit, data version, config, seed); link every knowledge claim to its evidence. (M6)
10. Check the model against data before concluding; record anomalies instead of explaining them away. (M7)
11. Prefer the simplest adequate approach; fix the biggest threat to validity first. (M7)
12. Put refuted and abandoned ideas in the cemetery with evidence and a revive-if condition. (M4)
13. Change acceptance criteria only through a DEC entry. (M8)
14. Ask the owner before scope changes or irreversible actions. (owner-preference)

### 3.3 Session protocol
Start: read `sdd/status.md` → `sdd/spec.md` → latest `log.md` entries; restate the current task and mode in one line. End: update status, append to the log, update knowledge, commit.

---

## 4. Artifacts

### 4.1 Files and content

| Artifact | Content | Budget | From |
|---|---|---|---|
| `global/AGENTS.md` | Purpose (≤ 3 lines), rules, modes, session protocol, one-line file contracts, module pointers | ≤ 100 lines, ≤ 15 rules | M1–M9 |
| `modules/ml.md` | REFORMS-based checklist, leakage types, sealed test set, naïve baselines, multiple evaluations, temporal dependence, multiple comparisons | ≤ 60 lines | S21–S24 |
| `modules/rl.md` | Seeds, hyperparameters, implementation effects, bootstrap intervals, IQM, report all runs | ≤ 30 lines | S26, S27 |
| Project `AGENTS.md` | Purpose (1 line), commands, data locations/versions, domain constraints, active modules, pointer to `sdd/` | ≤ 30 lines | S28, S31 |
| Project `CLAUDE.md` | `@AGENTS.md` only | 1 line | S29 |
| `sdd/spec.md` | Question, goal type, scope/non-goals, constraints, acceptance criteria as refutable predictions, tasks → criteria, open questions | ≤ 40 lines empty | M1, M2 |
| `sdd/status.md` | Current task + mode, last result, next step, active hypotheses, blockers, cemetery | ≤ 40 lines empty; ≤ 60 in use | M4, M6 |
| `sdd/knowledge.md` | Claims with evidence tags, assumptions, anomalies, superseded claims | ≤ 30 lines empty | M1, M6, M7 |
| `sdd/log.md` | Dated append-only entries: `EXPL`, `EXP`, `DEC`; corrections by strikethrough | ≤ 40 lines empty | M3, M6, M8 |
| `references/sources.md` | Final source → principles → mechanisms → rule IDs table (built in Phase 2) | — | all |
| `guide/index.html` | pt-BR: loop diagram, file map, one card per rule/template/module (o que diz · por quê + fonte · como verificar), "o que mudou" | readable in ≤ 15 min | M9 |
| `scripts/` | `install.sh`, `new-project.sh`, `check.py` | — | S29, S30 |

Evidence tags in `knowledge.md`: `[established]` (replicated) · `[supported: EXP-n]` · `[literature: S-id]` · `[assumption]` · `[speculation]`.

### 4.2 Repository layout
```
<repo>/
├── AGENTS.md  CLAUDE.md  README.md  CHANGELOG.md   # dev instructions for THIS repo
├── PLAN.md  REFERENCES.md
├── global/AGENTS.md                               # the method, installed globally
├── modules/{ml,rl}.md
├── templates/project/{AGENTS.md,CLAUDE.md,sdd/{spec,status,knowledge,log}.md}
├── templates/examples/                            # one filled example per template
├── references/{analysis,comparison,sources}.md    # built in Phases 1–2
├── guide/index.html
├── scripts/{install.sh,new-project.sh,check.py}
└── sdd/                                           # dogfooding
```

### 4.3 Loading and install (re-check against current docs in Phase 6)
- Claude Code: `install.sh` adds `@<abs-path>/global/AGENTS.md` between markers in `~/.claude/CLAUDE.md` (create if missing, never overwrite, no symlink). Projects use `CLAUDE.md` = `@AGENTS.md`.
- Codex: symlink `~/.codex/AGENTS.md` → `global/AGENTS.md` if absent; otherwise print instructions.
- Modules are referenced by backticked path, not `@`-imported, so they load only when needed.
- Verify: in Claude Code, `/memory` or `/context` lists the global file; in Codex, ask it to quote rule 1.
- `install.sh` is idempotent and supports `--uninstall`; `new-project.sh <path> [--ml] [--rl]` copies templates without overwriting.

---

## 5. Budgets (hard limits)

The limits in §4.1 are enforced by `check.py`. When a file is over budget, merge or delete a rule before adding one.

---

## 6. Phases and checkpoints

**Phase 0 — Bootstrap.** Create the layout, root `AGENTS.md`/`CLAUDE.md`, and this repo's `sdd/`; put S1–S5 in `sdd/spec.md` as acceptance criteria. **CHECKPOINT.**

**Phase 1 — Independent re-analysis of the references (blind).**
1. Using only the list in Appendix B, read each source in full (prioritize sources not fully read in v0.2). For each, write in `references/analysis.md`: core claim, implications for the method, caveats, depth of reading, access date.
2. Add strong missing sources with a one-line justification (e.g. Kerr 1998 on HARKing).
3. Only then open `REFERENCES.md`. Write `references/comparison.md`: agreements, disagreements, and what each analysis missed.
4. Blinding is partial: §2–§3 of this plan already summarize the v0.2 conclusions. In `comparison.md`, say where your reading may have been anchored by them.
**CHECKPOINT.**

**Phase 2 — Consolidate and apply the structure.**
1. Reconcile both analyses into `references/sources.md` (source → principles → mechanisms → rule IDs).
2. Finalize mechanisms, rules (§3.2) and artifacts (§4.1). Every difference from this plan becomes a DEC entry with its reason and sources.
3. Delete any rule without evidence or a clear use; merge overlapping ones.
**CHECKPOINT: the owner approves the final structure.**

**Phase 3 — Global method.** Write `global/AGENTS.md` and the modules within budget.

**Phase 4 — Templates.** Write `templates/project/*` with short guidance as HTML comments, plus one filled example per template in `templates/examples/`. Start from Appendix A.

**Phase 5 — Guide and checks.** Write `guide/index.html` and `scripts/check.py`; make the checks pass. **CHECKPOINT: the owner validates every card.**

**Phase 6 — Install.** Write `install.sh` and `new-project.sh`; re-check §4.3 against current docs; test with a temporary `HOME` and a temporary project. **CHECKPOINT.**

**Phase 7 — Pilot (pre-registered).** Commit EXP-001 in this repo's `sdd/log.md` with the criteria below, then apply the method to one real project for ≥ 5 working sessions.
- **E1 Cold start:** in a fresh session, the agent answers from files alone — current task, last result, active hypotheses, last abandoned idea and why. Pass: fully correct in ≥ 4 of 5 sessions.
- **E2 Pre-registration:** ≥ 90% of `EXP` cards committed before their results (git history).
- **E3 Evidence tags:** 100% of `knowledge.md` claims tagged.
- **E4 Overhead:** the owner rates upkeep as acceptable in ≥ 4 of 5 sessions.

Thresholds may change only before the pilot starts. **CHECKPOINT.**

**Phase 8 — Second consolidation and v1.0.** Re-check every rule against the sources and the pilot evidence; drop what had no evidence or no use; update `CHANGELOG.md` and the guide's "o que mudou"; tag `v1.0`.

---

## 7. Open decisions (defaults in brackets)

1. Project SDD files: [`sdd/` folder] or project root.
2. Knowledge file name: [`knowledge.md`].
3. Cemetery: [inside `status.md`] or `cemetery.md` if it grows.
4. IDs: [EXP-001, EXPL-001, DEC-001, K-001, AC-01, T-01].
5. Claude Code hooks: [deferred to after v1.0].
6. Repository visibility: [private].

---

## Appendix A — Template skeletons

**`sdd/spec.md`**
```markdown
# Spec — <project>
Question:
Goal type: prediction | explanation | build
Scope:            Non-goals:
Constraints:
## Acceptance criteria (each names the result that would fail it)
- AC-01: <metric> <threshold> on <data/split> vs <baseline>
## Tasks
- T-01 … (→ AC-01)
## Open questions
```

**`sdd/status.md`**
```markdown
# Status — updated <date>
Current: T-04 … (mode: light | explore | confirm)
Last result: … (EXP-006 → refuted H1)
Next step: …
Active hypotheses: … (EXP-007)
Blockers / questions for the owner:
## Cemetery
| ID | Idea | Verdict | Why (1 line) | Evidence | Revive if |
```

**`sdd/knowledge.md`**
```markdown
## Claims
- K-012 [supported: EXP-006] <claim> — <date>
- ~~K-004 [assumption] <old claim>~~ → superseded by K-012
## Assumptions
- A-03 <assumption> — checked by: <EXP or "not yet">
## Anomalies
- N-02 <observation that doesn't fit> — seen in: <EXPL/EXP>
```

**`sdd/log.md`**
```markdown
## EXPL-014 · <date> · <what was tried> → <result> → <next>

## EXP-007 · <date> · <title>
Question:
Hypotheses: H1 … | H2 … | H0 baseline/null …
Refuted if (The Question): H1 fails if …; H2 fails if …
Smallest meaningful effect & decision rule:
Plan: data & split (confirmation data not used to form H) · baseline reproduced? · runs/seeds · analysis
Pre-registered at: <commit sha>
Result: effect ± uncertainty vs baseline (all runs)
Verdict: supported | refuted | inconclusive | revise assumptions
Deviations:
Exploratory notes:

## DEC-003 · <date> · <decision>
Context · Options · Decision · Consequences (+/−) · Supersedes
```

---

## Appendix B — Sources (blind list for Phase 1)

Scientific method
- S01 SEP, Scientific Method — https://plato.stanford.edu/entries/scientific-method/
- S02 SEP, Karl Popper — https://plato.stanford.edu/entries/popper/
- S03 SEP, Thomas Kuhn — https://plato.stanford.edu/entries/thomas-kuhn/
- S04 Understanding Science flowchart — https://undsci.berkeley.edu/the-understanding-science-flowchart-text-description/
- S05 Chamberlin, Multiple Working Hypotheses (1897) — https://www.eps.mcgill.ca/~courses/c590/Chamberlain%201897.pdf
- S06 Platt 1964, Strong Inference — https://www.whoi.edu/cms/files/platt64sci_72743.pdf
- S07 Feynman 1974, Cargo Cult Science — https://calteches.library.caltech.edu/51/2/CargoCult.htm
- S08 Box 1976, Science and Statistics — https://www.Gwern.net/doc/statistics/decision/1976-box.pdf
- S09 Breiman 2001, The Two Cultures — https://projecteuclid.org/journals/statistical-science/volume-16/issue-3/Statistical-Modeling--The-Two-Cultures-with-comments-and-a/10.1214/ss/1009213726.full
- S10 Gelman & Shalizi 2013 — https://arxiv.org/abs/1006.3868

Metascience and statistics
- S11 Ioannidis 2005 — https://doi.org/10.1371/journal.pmed.0020124
- S12 Simmons, Nelson & Simonsohn 2011 — https://papers.ssrn.com/abstract=1850704
- S13 Gelman & Loken 2013 — https://www.stat.columbia.edu/~gelman/research/unpublished/p_hacking.pdf
- S14 ASA statement on p-values 2016 — https://www.amstat.org/asa/files/pdfs/p-valuestatement.pdf
- S15 Lakens 2017 — https://pmc.ncbi.nlm.nih.gov/articles/PMC5502906 · Lakens et al. 2018 — https://doi.org/10.1177/2515245918770963
- S16 Nosek et al. 2018 — https://doi.org/10.1073/pnas.1708274114
- S17 Munafò et al. 2017 — https://orca.cardiff.ac.uk/id/eprint/97336/

Research records
- S18 Sandve et al. 2013 — https://doi.org/10.1371/journal.pcbi.1003285
- S19 Schnell 2015 — https://pmc.ncbi.nlm.nih.gov/articles/PMC4565690
- S20 Nygard 2011 — https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions

ML and RL
- S21 REFORMS 2024 — https://reforms.cs.princeton.edu/
- S22 Kapoor & Narayanan 2023 — https://pmc.ncbi.nlm.nih.gov/articles/PMC10499856
- S23 Lones, ML pitfalls (latest) — https://arxiv.org/abs/2108.02497
- S24 Pineau et al. 2021 — https://jmlr.org/papers/v22/20-303.html
- S25 Lipton & Steinhardt 2018 — https://arxiv.org/abs/1807.03341
- S26 Henderson et al. 2018 — https://arxiv.org/abs/1709.06560
- S27 Agarwal et al. 2021 — https://arxiv.org/abs/2108.13264

Agent context files and SDD
- S28 agents.md — https://agents.md/
- S29 Claude Code memory — https://code.claude.com/docs/en/memory · AGENTS.md fallback (v2.1.277) — https://devops.com/claude-code-adds-agents-md-fallback-cutting-instruction-file-sprawl · symlink issue — https://github.com/anthropics/claude-code/issues/66559
- S30 Codex customization — https://developers.openai.com/codex/concepts/customization.md
- S31 Gloaguen et al. 2026 — https://arxiv.org/abs/2602.11988
- S32 Lulla et al. 2026 — https://arxiv.org/abs/2601.20404
- S33 Jaroslawicz et al. 2025 — https://arxiv.org/abs/2507.11538
- S34 Böckeler 2025 — https://www.martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html
