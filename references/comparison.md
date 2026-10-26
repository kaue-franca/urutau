# Comparison: blind analysis (Phase 1) vs `REFERENCES.md` v0.2

`PLAN.md` Phase 1, steps 3–4. "Blind" = `references/analysis.md` (five fresh readers, 2026-10-26). "v0.2" = `REFERENCES.md`. Mechanism IDs M1–M9 are v0.2's.

## 1. Reading depth

| | full | partial / main text only | abstract |
|---|---|---|---|
| v0.2 | 9 (S04–S08, S16, S19, S28, S34) | 4 (S14, S23, S29, S30) | 21 |
| Blind | 31 | 3 (S26, S27 main text only; S29 fallback article via a secondary source) | 0 |

Every source v0.2 read only by abstract has now been read in full (except S29's DevOps article, which no reader could open). Several conclusions below exist only because of that extra depth.

## 2. Agreements
All nine v0.2 mechanisms reappear independently in the blind reading, usually from the same sources:

| Mechanism | Blind support (sources) |
|---|---|
| M1 Testable claims | refutation criteria fixed before results (S02); "The Question" (S06); goal-type "question card" (S09) |
| M2 Rival hypotheses | family of hypotheses (S05); ≥ 2 written alternatives before a run (S06); simple baseline (S09, S22, S23) |
| M3 Explore vs confirm | label every result (S13); sealed holdout, early runs exploratory (S16); test on data not used to form the idea (S07); lock the test set (S23); reproduce the baseline first (S07, S26) |
| M4 Report everything | all runs and contrary data (S07); disclosure of all choices (S12); count all tests (S14 principle 4); negative results (S25) |
| M5 Estimate, don't threshold | effect ± interval, no "significant" alone (S14); SESOI (S15); interval estimates, many runs (S26, S27) |
| M6 Traceability | provenance per result, seeds, claim → result pointer (S18); dated append-only notebook (S19); reproducibility bundle (S21) |
| M7 Iterate and check | discrepancy-driven loop, sponsor → critic (S08); posterior predictive checks (S10); revise assumptions as an outcome (S04); anomaly ledger (S03) |
| M8 Record decisions | ADRs, superseded not deleted (S20); ad hoc changes logged (S02) |
| M9 Context discipline | few rules, critical first (S33); hand-written, no overviews (S31); light track for small work (S34); self-contained, < 200 lines (S29, S30) |

## 3. Disagreements and corrections to v0.2

| Source | v0.2 says | Blind finds | Consequence |
|---|---|---|---|
| S01 | latest revision 2021 | revised 8 Aug 2026, new §5.2 on computers and AI | cite the 2026 revision |
| S02 | revised 2021 | substantive revision 31 Jul 2026 | cite the 2026 revision |
| S14 | plan URL = the statement | plan URL is the 2-page press release; statement is Wasserstein & Lazar 2016 | fix URL in `sources.md` |
| S24 | checklist and code policy "improved reporting practice" | code submission rose to ~75%, but the authors say they have **no conclusive evidence** the program improved quality | v0.2 overstates; S24 supports *what* to record, not that checklists work |
| S29 | AGENTS.md read only when no CLAUDE.md exists | only when no `CLAUDE.md`, `.claude/CLAUDE.md` or `CLAUDE.local.md` in the working directory **or above**; the user file `~/.claude/CLAUDE.md` does not count; default setting `claude-md-or-agents-md` | projects keep `CLAUDE.md` = `@AGENTS.md` (unchanged); do not rely on the fallback |
| S31 | developer-written files helped "about 4%" | v3 (29 Sep 2026): +2.4% on average, **not significant** (p = 0.21); cost up to +19%; for Claude Code + Sonnet 4.5 the developer file *lowered* success; the paper's own intro says "7%", inconsistent with its results | quote §4.2 numbers; evidence for context files improving success is weaker than v0.2 states |
| S21 | "verify the exact module list" | confirmed: 32 items, 8 modules (3/5/7/3/6/3/3/2); template still "beta"; scope **excludes** pure predictive analytics | `modules/ml.md` adapts REFORMS, it cannot claim compliance |
| S23 / S21 | treated as independent supports | Lones is a REFORMS co-author | count them as one line of evidence |
| S12 | "later estimates below the worst case" | blind reader also could not verify this | stays `UNVERIFIED` |

## 4. What v0.2 missed (found by the blind reading)
Candidates for Phase 2; each must still earn a rule, a file field or a module line.
1. **Mundane rivals.** The default rival in data science is often an artifact — pipeline bug, leakage, duplicates, selection, logging change, seasonality, chance — not a statistical null (S05, S11, S22). v0.2's "simple baseline or null" is narrower.
2. **Too good to be true.** An unexpectedly large effect triggers a leakage/bug audit before reporting (S11, S12, S22). Sharpens v0.2's symmetric scrutiny.
3. **Equal tuning budget.** Baselines get the same tuning and search effort as the challenger; report the budget (S09 Efron, S21 5f, S23; S38 Dodge).
4. **Test-set access is a logged, rare event**; count peeks (S09 Hoadley, S23; S37 Cawley & Talbot).
5. **Fixed stopping rule / search budget** before outcomes (S12).
6. **Expected result written before actual result** (S04) — a cheap pre-registration for explore mode.
7. **Never "no effect" without an equivalence test**; otherwise "inconclusive" (S15). Four outcomes: equivalent, different, both, undetermined.
8. **Verification vs validation** — does the code compute what was intended vs does the inference hold (S01).
9. **Reproducible ≠ replicable ≠ robust ≠ generalisable** (S24 Fig. 1); an agent rerun shows only the first.
10. **Independent reviewer** — a fresh agent or the owner reviews the plan before and the claims after (S17, S24, S04).
11. **Outcome-blind data preparation** — clean and choose exclusions with labels masked (S16, S17).
12. **"What was already seen"** recorded when pre-registering on existing data (S16).
13. **Parsimony needs a named discrepancy** — added complexity must fix a recorded misfit (S08).
14. **Stability before "X is important"** (Rashomon; S09) and ablation before attributing a gain (S25).
15. **Exemplars** — judgment runs on worked examples (S03); supports `templates/examples/`.
16. **Attribution and rationale per log entry** — who (owner/agent, which tool) and why (S19).
17. **Decision timing** — DEC entries say whether results had been seen (S20 caveat, S16).
18. **Enforce critical rules mechanically**; prose rules fail silently by omission (S29, S30, S33). Supports `check.py` and a later hooks decision (§7.5).
19. **Tool facts for Phase 6:** Claude Code strips block HTML comments before injection, so template guidance in comments is free there (S29; Codex `UNVERIFIED`); user-scope `@` imports load without an approval prompt (S29); Codex has no import syntax, `AGENTS.override.md` silently masks `AGENTS.md`, and the 32 KiB limit is ambiguous (S30).
20. **Automation amplifies false discovery** (S17): an agent workflow needs stronger constraints than a manual one — a direct argument for the method.

## 5. What the blind reading missed (present in v0.2)
- A cross-source synthesis: each reader saw one group, so no mechanism list or evidence-gap section was produced. v0.2's §Synthesis and §Evidence gaps remain the only integration; the blind notes support both.
- v0.2's framing of the global file and modules as **SOPs** (S16) is only implicit in the blind reading (group B mentions SOPs for recurring project types).
- v0.2 links S02 "rescue = new hypothesis" to a DEC entry (M8); the blind reading proposes a separate ad hoc modification log. Same idea, different home — Phase 2 picks one.

## 6. Anchoring and blinding limits (step 4)
- **Main session is not blind.** `PLAN.md` and `REFERENCES.md` were read before Phase 1 (DEC-002). This comparison and the merge were written by that session; selection of "what matters" in §4 may favour items that fit the v0.2 frame.
- **Prompt leaks to the readers.** The purpose line named "AI coding agents", "data science" and "scientific method"; group B was told "e.g. consider Kerr 1998" (from `PLAN.md` step 2); group C was asked to list REFORMS modules and item count (prompted by v0.2's "verify"); group D was asked for install-relevant facts (prompted by `PLAN.md` §4.3). None revealed v0.2 conclusions, but each steered attention.
- **Repository context.** The readers may have auto-loaded this repo's root `AGENTS.md` (names the goal and "spec-driven development", no conclusions). All reported not reading repository files.
- **Correlated readers.** All five readers and the main session are instances of the same model family; agreement with v0.2 is weaker evidence than agreement between independent people would be.
- **Uneven depth.** Some sources were read from substitute copies (see the access table in `analysis.md`); S04's graphic, S26/S27 appendices, S17 Table 1 and S10's journal discussion were not read.
