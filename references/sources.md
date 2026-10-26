# Sources → principles → mechanisms → rules (v0 · 2026-10-26)

`PLAN.md` Phase 2, step 1. One place to check every rule against its evidence. Built from `references/analysis.md` (blind reading of S01–S34 plus S35–S38) and `REFERENCES.md` v0.2, reconciled through `references/comparison.md`. Decisions that changed `PLAN.md` are DEC-005…DEC-011 in `sdd/log.md`.

Depth: **full** = full text read · **main** = full main text, appendices not read · **partial** · **abstract** · **unread** = existence checked only.

## 1. Mechanisms

| ID | Mechanism | Main sources |
|---|---|---|
| M1 | **Testable claims.** Each hypothesis and acceptance criterion names the result that would refute it; the expected result is written before the actual one; the spec states the goal type. | S02, S04, S06, S07, S09, S35, S36 |
| M2 | **Rival hypotheses.** ≥ 2 explanations per question, including a simple baseline or null and the mundane rivals (bug, leakage, artifact, chance). | S05, S06, S11, S16, S22, S23 |
| M3 | **Explore vs confirm.** Exploration is cheap and labelled; a claim needs a pre-registered test on data not used to form it, after the baseline is reproduced with equal budget. | S07, S12, S13, S16, S17, S21–S23, S26, S35, S37, S38 |
| M4 | **Report everything.** All runs, deviations, dead ends and disconfirming results; symmetric scrutiny of good and bad results. | S07, S11, S12, S14, S16, S19, S25 |
| M5 | **Estimate, don't threshold.** Effect ± uncertainty vs baseline over repeated runs; smallest meaningful effect fixed in advance; "no effect" needs an equivalence test. | S11, S14, S15, S23, S26, S27, S37 |
| M6 | **Traceability.** Every result → commit, data version, config, seed, command; every claim → its evidence; dated append-only notebook. | S06, S18, S19, S21, S24 |
| M7 | **Iterate and check.** Re-enter the loop anywhere; check the model before concluding; simplest adequate model; track assumptions and anomalies. | S03, S04, S08, S09, S10, S25 |
| M8 | **Record decisions.** Context, options, decision, consequences, and whether results had been seen; superseded, never deleted. | S02, S16, S19, S20 |
| M9 | **Context discipline.** Short, hand-written, critical rules first, detail on demand, one path per problem size, critical rules checked mechanically; the method itself is evaluated. | S01, S08, S28–S34 |
| M10 | **Independent scrutiny.** A claim is exposed to criticism by someone without a stake before it is relied on. | S01, S03, S04, S17, S24 |

M10 is new relative to v0.2 (DEC-007).

## 2. Rules (final for v0)

Order = priority (S33: early instructions are followed more). IDs are identical in `global/AGENTS.md` and `guide/index.html`.

| ID | Rule (short) | Mechanisms | Sources | From v0.2 §3.2 |
|---|---|---|---|---|
| R1 | Never state an untested claim as fact; every claim cites its evidence or is tagged assumption/speculation. | M1, M4, M6 | S07, S18, S25, S35 | 1 + part of 9 |
| R2 | Label all work light, explore or confirm; only a confirm test makes a claim; ask if unsure. | M3 | S01, S13, S16, S34 | 3 |
| R3 | Write the expected result before any run; commit the EXP card before a confirm test. | M1, M3, M5 | S02, S04, S06, S12, S15, S16, S35, S38 | 4 + new "expected" |
| R4 | Keep ≥ 2 rivals: a simple baseline or null, and the mundane rivals. | M2 | S05, S06, S11, S22 | 2, broadened |
| R5 | Confirm on data not used to form the hypothesis; log every look at the holdout. | M3 | S07, S13, S16, S23, S37 | 5 + access log |
| R6 | Reproduce the baseline first; give baseline and challenger the same data, seeds and tuning budget. | M3, M5 | S07, S09, S21, S26, S38 | 6 + equal budget |
| R7 | Log every run, deviation and dead end; audit good results as hard as bad; cemetery with revive-if. | M4 | S07, S11, S12, S14, S19, S22, S25 | 7 + 12 merged |
| R8 | Report effect ± uncertainty vs baseline over repeated runs; "no effect" only after an equivalence test. | M5 | S14, S15, S26, S27, S37 | 8 + equivalence |
| R9 | Every result records commit, data version, config, seed and command; no manual data edits. | M6 | S18, S19, S21, S24 | 9 |
| R10 | Check the model against the data before concluding; record anomalies and assumptions. | M7 | S03, S04, S08, S09, S10 | 10 |
| R11 | Simplest adequate approach; complexity only for a named discrepancy; ablate before crediting a gain; biggest threat first. | M7 | S08, S25, S36, S37 | 11 + ablation |
| R12 | Change plans, criteria or decisions only by a DEC entry that says whether results were seen. | M8 | S02, S16, S19, S20 | 13 + timing |
| R13 | Before a claim is marked established or acted on, have it reviewed by the owner or a fresh-context agent. | M10 | S01, S04, S17, S24 | new |
| R14 | Ask the owner before scope changes or irreversible actions. | — | `owner-preference` | 14 |

14 rules (budget 15). M9 shapes the files rather than adding a rule: budgets, ordering, modules on demand, `scripts/check.py`.

## 3. Artifact fields traced to sources

| Field / feature | File | Sources |
|---|---|---|
| Goal type: prediction · explanation · description · build | `spec.md` | S09, S36 (DEC-008) |
| Acceptance criteria name the failing result | `spec.md` | S02, S06 |
| Cemetery with revive-if | `status.md` | S06, S07, S25 |
| Evidence tags; `[established]` = replicated on independent data **and** reviewed, not merely rerun | `knowledge.md` | S11, S18, S24, S25 |
| Assumptions and anomalies lists | `knowledge.md` | S02, S03, S04, S08 |
| Dated, append-only, strikethrough corrections; `by:` attribution | `log.md` | S19 |
| EXPL entry carries an expected result | `log.md` | S04 |
| EXP card: rivals, refuted-if, smallest meaningful effect, decision rule, budget/stopping, already seen, review | `log.md` | S06, S12, S15, S16, S35, S38, S17 |
| DEC entry: results seen yes/no | `log.md` | S16, S20 |
| Project file without overviews; commands, data, constraints, modules | project `AGENTS.md` | S28, S31, S32 |
| `CLAUDE.md` = `@AGENTS.md`, real file not symlink | project `CLAUDE.md` | S29 |
| Global file self-contained (no imports) | `global/AGENTS.md` | S30 |
| Guidance as HTML comments | templates | S29 (stripped in Claude Code; Codex `UNVERIFIED`) |
| Mechanical checks: budgets, tags, pre-registration timing | `scripts/check.py` | S29, S30, S33 (DEC-009) |

## 4. Source table

URL = canonical link; "read at" = the copy actually read when the canonical one failed (DEC-004). Accessed 2026-10-26 unless noted.

| ID | Source | URL (read at) | Depth | Principles used | M | Rules / artifacts |
|---|---|---|---|---|---|---|
| S01 | Hepburn & Andersen, *Scientific Method*, SEP (rev. 8 Aug 2026) | https://plato.stanford.edu/entries/scientific-method/ | full | no single method; modes; systematic exclusion of alternatives; open claims to criticism | M9, M10 | R2, R13 |
| S02 | Thornton, *Karl Popper*, SEP (rev. 31 Jul 2026) | https://plato.stanford.edu/entries/popper/ | full | refutation criteria fixed in advance; no ad hoc rescue; background assumptions held provisionally | M1, M8 | R3, R12; spec AC |
| S03 | Bird, *Thomas Kuhn*, SEP (rev. 2 Sep 2025) | https://plato.stanford.edu/entries/thomas-kuhn/ | full | anomalies accumulate; exemplars; diverse evaluators | M7, M10 | R10; examples; anomalies |
| S04 | UC Berkeley, *Understanding Science flowchart* (text) | https://undsci.berkeley.edu/the-understanding-science-flowchart-text-description/ | full (text) | non-linear loop; expected vs actual; revise assumptions; community feedback | M1, M7, M10 | R3, R10, R13; verdicts |
| S05 | Chamberlin, *Multiple Working Hypotheses* (1897; 1995 reprint) | https://www.eps.mcgill.ca/~courses/c590/Chamberlain%201897.pdf | full | family of hypotheses; ruling theory; joint causes | M2 | R4 |
| S06 | Platt, *Strong Inference*, Science 1964 | https://www.whoi.edu/cms/files/platt64sci_72743.pdf (read at https://pages.cs.wisc.edu/~markhill/science64_strong_inference.pdf) | full | alternatives → crucial test → recycle; "The Question"; notebook | M1, M2, M6 | R3, R4; EXP card |
| S07 | Feynman, *Cargo Cult Science*, 1974 | https://calteches.library.caltech.edu/51/2/CargoCult.htm | full | report everything; reproduce before changing; symmetric scrutiny; predict beyond the data | M3, M4 | R1, R5, R6, R7 |
| S08 | Box, *Science and Statistics*, JASA 1976 | https://www.gwern.net/doc/statistics/decision/1976-box.pdf | full | iterate on discrepancy; sponsor then critic; parsimony; worry about tigers | M7, M9 | R10, R11 |
| S09 | Breiman, *Two Cultures*, Stat Sci 2001 (+ comments) | https://doi.org/10.1214/ss/1009213726 (read at https://www.stat.cmu.edu/~ryantibs/journalclub/breiman_2001.pdf) | full | goal type; beat a trivial baseline; Rashomon stability; equal tuning effort (Efron) | M1, M7 | R6, R10; spec goal |
| S10 | Gelman & Shalizi, *Philosophy and the practice of Bayesian statistics*, BJMSP 2013 | https://arxiv.org/abs/1006.3868 | full (arXiv v4) | fit–check–expand; posterior predictive checks; severity | M7 | R10 |
| S11 | Ioannidis, *Why Most Published Research Findings Are False*, PLoS Med 2005 | https://doi.org/10.1371/journal.pmed.0020124 | full | flexibility and many tests lower PPV; too-good effects suspect | M2, M4, M5 | R4, R7; `[established]` |
| S12 | Simmons, Nelson & Simonsohn, *False-Positive Psychology*, Psych Sci 2011 | https://papers.ssrn.com/abstract=1850704 (read at https://www2.psych.ubc.ca/~schaller/528Readings/SimmonsNelsonSimonsohn2011.pdf) | full | disclose all choices; fixed stopping rule; with/without exclusions | M3, M4 | R3, R7 |
| S13 | Gelman & Loken, *Garden of Forking Paths*, 2013 | https://www.stat.columbia.edu/~gelman/research/unpublished/p_hacking.pdf | full | data-contingent choices; label exploratory; confirm on new data | M3 | R2, R5 |
| S14 | Wasserstein & Lazar, *ASA Statement on p-values*, Am Stat 2016 | https://doi.org/10.1080/00031305.2016.1154108 (read at https://www.stat.berkeley.edu/~aldous/Real_World/ASA_statement.pdf; plan URL is the press release) | full | no threshold-only conclusions; full reporting; p ≠ effect size | M4, M5 | R7, R8 |
| S15 | Lakens 2017; Lakens, Scheel & Isager 2018, *Equivalence testing* | https://pmc.ncbi.nlm.nih.gov/articles/PMC5502906 · https://doi.org/10.1177/2515245918770963 (read at https://osf.io/download/5a0f36936c613b026c4a1848) | full | SESOI fixed in advance; equivalence before "no effect"; four outcomes | M5 | R3, R8 |
| S16 | Nosek et al., *The Preregistration Revolution*, PNAS 2018 | https://doi.org/10.1073/pnas.1708274114 (read at https://pmc.ncbi.nlm.nih.gov/articles/PMC5856500/) | full | prediction vs postdiction; deviations reported; sealed holdout; SOPs; what was already seen | M3, M8 | R2, R3, R5, R12 |
| S17 | Munafò et al., *A Manifesto for Reproducible Science*, Nat Hum Behav 2017 | https://doi.org/10.1038/s41562-016-0021 | full (Table 1 not rendered) | blinding; independent oversight; automation amplifies false discovery | M3, M10 | R13; ml module |
| S18 | Sandve et al., *Ten Simple Rules for Reproducible Computational Research*, PLoS CB 2013 | https://doi.org/10.1371/journal.pcbi.1003285 | full | track provenance; no manual edits; seeds; link text to results | M6 | R1, R9 |
| S19 | Schnell, *Ten Simple Rules for a Lab Notebook*, PLoS CB 2015 | https://pmc.ncbi.nlm.nih.gov/articles/PMC4565690 | full | dated, chronological, strike-through; rationale; who did what | M4, M6, M8 | R7, R9, R12; log format |
| S20 | Nygard, *Documenting Architecture Decisions*, 2011 | https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions | full | short numbered decision records; superseded not deleted | M8 | R12; DEC |
| S21 | Kapoor et al., *REFORMS*, Sci Adv 2024 | https://reforms.cs.princeton.edu/ (read at arXiv 2308.07832v2 + checklist beta) | full | 32 items / 8 modules; reproducibility bundle; equal tuning of baselines | M3, M6 | R6, R9; ml module |
| S22 | Kapoor & Narayanan, *Leakage and the reproducibility crisis*, Patterns 2023 | https://pmc.ncbi.nlm.nih.gov/articles/PMC10499856 | full | 8 leakage types (L1–L3); model info sheet; simple baselines win after fixes | M2, M3 | R4, R7; ml module |
| S23 | Lones, *How to avoid ML pitfalls*, arXiv v5 2024 | https://arxiv.org/abs/2108.02497 | full | lock test set; pipeline is training; naive baselines; multiple comparisons | M3, M5 | R5; ml module |
| S24 | Pineau et al., *Improving reproducibility in ML research*, JMLR 2021 | https://jmlr.org/papers/v22/20-303.html | full | reproducible ≠ replicable ≠ robust ≠ generalisable; run record; no proof checklists work | M6, M10 | R9, R13; `[established]` |
| S25 | Lipton & Steinhardt, *Troubling Trends in ML Scholarship*, 2018 | https://arxiv.org/abs/1807.03341 | full | speculation vs explanation; ablations; negative results | M4, M7 | R1, R7, R11 |
| S26 | Henderson et al., *Deep RL that Matters*, AAAI 2018 | https://arxiv.org/abs/1709.06560 | main | seeds, hyperparameters, implementations change results; all runs | M3, M5 | R6, R8; rl module |
| S27 | Agarwal et al., *Statistical Precipice*, NeurIPS 2021 | https://arxiv.org/abs/2108.13264 | main | interval estimates; IQM; profiles; locked protocol | M5 | R8; rl module |
| S28 | agents.md | https://agents.md/ | full | plain Markdown; nearest file; list runnable checks | M9 | project `AGENTS.md` |
| S29 | Claude Code memory docs; AGENTS.md fallback; issue #66559 | https://code.claude.com/docs/en/memory · https://devops.com/claude-code-adds-agents-md-fallback-cutting-instruction-file-sprawl (unreadable; secondary used) · https://github.com/anthropics/claude-code/issues/66559 | full / partial | `@` imports; user scope no prompt; < 200 lines; HTML comments stripped; no symlinked CLAUDE.md | M9 | install; `CLAUDE.md` |
| S30 | Codex customization and AGENTS.md docs | https://developers.openai.com/codex/concepts/customization.md (now learn.chatgpt.com) | full | `~/.codex/AGENTS.md`; override masks; 32 KiB; no imports | M9 | install; self-contained global |
| S31 | Gloaguen et al., *Evaluating AGENTS.md*, arXiv v3 2026 | https://arxiv.org/abs/2602.11988 | full | no significant success gain; +cost; no overviews; rules are followed literally | M9 | budgets; no overviews |
| S32 | Lulla et al., *AGENTS.md and agent efficiency*, 2026 | https://arxiv.org/abs/2601.20404 | full | −28.6% median runtime, −16.6% output tokens; correctness not measured | M9 | keep a project file |
| S33 | Jaroslawicz et al., *IFScale*, 2025 | https://arxiv.org/abs/2507.11538 | full | accuracy falls with instruction count; primacy; omission errors | M9 | ≤ 15 rules; order; check.py |
| S34 | Böckeler, *Understanding SDD: Kiro, spec-kit, Tessl*, 2025 | https://www.martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html | full | spec-first/anchored; one size does not fit; reviewable files | M9 | light mode; short templates |
| S35 | Kerr, *HARKing*, PSPR 1998 | https://doi.org/10.1207/s15327957pspr0203_4 | abstract | post hoc hypotheses presented as a priori | M1, M3 | R1, R3 |
| S36 | Shmueli, *To Explain or to Predict?*, Stat Sci 2010 | https://arxiv.org/abs/1101.0891 | full | explain/predict/describe; ex-ante feature availability; fit ≠ predictive power | M1, M7 | R11; spec goal; ml module |
| S37 | Cawley & Talbot, *Over-fitting in model selection*, JMLR 2010 | https://www.jmlr.org/papers/volume11/cawley10a/cawley10a.pdf | main | selection inside folds; nested CV; multiple partitions | M3, M5 | R5, R8, R11; ml module |
| S38 | Dodge et al., *Show Your Work*, EMNLP 2019 | https://arxiv.org/abs/1909.03004 | main | results depend on search budget; report trials | M3, M5 | R3, R6; ml module |

### Recorded, not yet read (candidates for Phase 8)

| ID | Source | URL | Why it may matter |
|---|---|---|---|
| S39 | Steegen et al. 2016, Multiverse analysis | https://doi.org/10.1177/1745691616658637 | automatable remedy for forking paths |
| S40 | Bouthillier et al. 2021, Variance in ML benchmarks | https://arxiv.org/abs/2103.03098 | sources of variance when deciding A > B |
| S41 | Patterson et al. 2023, Empirical Design in RL | https://arxiv.org/abs/2304.01315 | RL experiment design |
| S42 | Gelman et al. 2020, Bayesian Workflow | https://arxiv.org/abs/2011.01808 | concrete modelling loop |
| S43 | SEP, Imre Lakatos | https://plato.stanford.edu/entries/lakatos/ | when patching assumptions is legitimate |
| S44 | Wilson et al. 2017, Good enough practices | https://doi.org/10.1371/journal.pcbi.1005510 | solo project hygiene |
| S45 | Claude Code skills docs | https://code.claude.com/docs/en/skills | modules as skills (partly read) |
| S46 | Chatlatanagulchai et al. 2025, Agent READMEs | https://arxiv.org/abs/2511.12884 | what real context files contain |
| S47 | Mohsenimofidi et al. 2026, Context engineering in OSS | https://arxiv.org/abs/2510.21413 | taxonomy of AGENTS.md content |
| S48 | SEP, Reproducibility of Scientific Results | https://plato.stanford.edu/entries/scientific-reproducibility/ | reproducibility concepts |
| S49 | Anthropic, Effective context engineering for AI agents | https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents | small context, just-in-time loading |

## 5. Considered and not adopted as rules (v0)

| Idea | Source | Where it went instead |
|---|---|---|
| Verification vs validation | S01 | light-mode acceptance test (verification) + R10 (validation) |
| Outcome-blind data preparation | S16, S17 | `modules/ml.md` |
| Disclosure statement | S12, S17 | R7 (report all) |
| Multiverse analysis | S39 (unread) | Phase 8 candidate |
| Kuhn's five-value rubric for model choice | S03 | dropped: overhead without evidence of use |
| Exemplars | S03 | `templates/examples/` |
| Attribution per entry | S19 | `by:` field in `log.md` |
| Hooks / permissions to enforce rules | S29, S30, S33 | deferred after v1.0 (`PLAN.md` §7.5); `check.py` instead |
| Codex `## Code Review Rules` block | S30 | non-goal (tool-specific) |
| Methods as skills | S29, S30, S45 | Phase 8 candidate |

## 6. Evidence gaps

- No study tests science-based workflows for coding agents; the method's effect is unknown → Phase 7 pilot (EXP-001).
- Context-file evidence is mixed and from software tasks (S31: no significant success gain; S32: efficiency gain, correctness unmeasured).
- Preregistration and checklists have limited experimental support (S16, S24 say so themselves).
- S35 (Kerr) read at abstract level only; several caveats in `analysis.md` remain `UNVERIFIED`.
