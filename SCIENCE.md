# The science behind urutau
Why each rule exists, where it comes from and which AI failure it closes. Sources are numbered only here (S01…); the method files do not cite them, this file traces each rule to them.
Reading depth: **full** = whole text · **main** = main text · **partial** · **abstract** · **unread**. "Research agent" or "reviewer agent" = read by a sub-agent for this repo, not by the owner.

## The problem
An AI agent writes fluent code and explanations much faster than anyone can check them. Without a method it reports numbers it never saw; tests an idea on the same data that suggested it; changes the metric or loosens a test until it "passes"; agrees with the owner instead of disagreeing with evidence; keeps code nobody knows the reason for; and explains itself in labels it made up. urutau turns scientific practices that counter exactly these failures into a few rules the agent follows and that can be checked in the files.

## Rules → practice → sources
| Rule | AI failure it closes | Scientific practice behind it | Sources |
|---|---|---|---|
| Evidence | reporting a number or fact never observed | traceability: every result points to commit, data, config, seed and command; claims stated so they can be checked | S07, S18, S25, S35 |
| Predict, then check | a plausible explanation never tested; a too-good result accepted | testable claims: the expected result and what would refute it are written first; good results get the same scrutiny as bad ones | S02, S04, S06, S07, S11 |
| Fixed target | silently changing goal, metric or split; weakening a test to make it pass | success criteria fixed before results; decision records saying whether results had been seen; tests never edited to pass | S02, S16, S20, S50 |
| Push back with evidence | agreeing with the owner (sycophancy); claims nobody reviewed | only evidence changes a conclusion; independent review before relying on a claim | S51, S01, S17, S24 |
| One task, the owner's pace | too much autonomy; a long detailed plan that goes stale | iterate and check the model against the data; short, hand-written context | owner-preference; S04, S08 (iterative cycle), S34 |
| Everything has a why | code generated and kept without a reason | know why something exists before keeping or removing it (Chesterton's fence) | S53, S25; owner-preference |
| Rivals and a fair baseline | a gain that is an artifact; a weak baseline | multiple working hypotheses, always including a simple baseline and the boring explanations (bug, leakage, artifact, chance) | S05, S06, S07, S09, S21, S22, S38 |
| Tries and experiments | tuning on the test set; making up the hypothesis after seeing the results | exploring is not confirming: a claim needs a pre-registered experiment on data not used to form the idea | S12, S13, S16, S23, S35, S37 |
| Report every run | showing only the best run; hiding failures | report all runs, deviations and dead ends; estimate effect ± uncertainty instead of a pass/fail threshold; "no effect" only after an equivalence test | S07, S11, S12, S14, S15, S19, S26, S27 |
| Communication: language and plain words | labels and jargon the owner cannot follow | plain language; few acronyms; writers forget what readers do not know | S59, S60, S61, S62, S63; owner-preference (language) |
| Communication: reports | burying the result; long confident text that inflates trust; misreading the task | main point first; facts apart from assumptions; restate the task before acting; first-person, calibrated uncertainty; no play-by-play of what was done | S55, S56, S57, S58, S64, S65, S66, S67, S68, S69 |
| Conventions: git, uv | work that cannot be traced or reproduced | track provenance; one command regenerates results | S18; owner-preference |
| Conventions: no AI attribution | — | — | owner-preference |

## Formats and skills → sources
| What | Where | Sources |
|---|---|---|
| Task card: why, prediction, check with "fails if", steps | `sdd/spec.md` | S02, S04, S06 |
| Success criteria that name the result that fails them | `sdd/spec.md` | S02, S06 |
| Experiment card: rival explanations, "fails if", plan, already seen, search budget, smallest effect that matters, card commit, review | `sdd/log.md` | S06, S12, S15, S16, S38, S17 |
| Dated, append-only log with `by:`; numbered decisions, superseded and never deleted | `sdd/log.md` | S19, S20 |
| Known · Assumed; observations nothing explains yet kept as open questions | `sdd/knowledge.md`, `sdd/spec.md` | S02, S03, S08, S18, S25 |
| Dead ends with "worth retrying if" | `sdd/knowledge.md` | S06, S07, S25 |
| Why each file exists; `Why:` line in code | `sdd/knowledge.md`, code | S53 |
| Self-contained, short `AGENTS.md`, no repo overview, critical rules first | project and global | S28–S34, S54 |
| Planned skill `urutau-grill`: one question at a time, the agent's own answer written first, "what would make you drop it", rivals, pre-mortem | skill | S02, S05, S51, S52 |
| Planned skill `urutau-audit`: Chesterton's fence; deleting as a testable claim ("nothing changes") checked by the code tests | skill | S53, S02, S18 |

## Sources
URL = canonical link; "read at" = the copy actually read. Accessed 2026-10-26 (S01–S38) and 2026-11-22 (S50–S69).

| ID | Source | URL | Depth | Principles used |
|---|---|---|---|---|
| S01 | Hepburn & Andersen, *Scientific Method*, SEP (rev. 8 Aug 2026) | https://plato.stanford.edu/entries/scientific-method/ | full | no single method; modes; systematic exclusion of alternatives; open claims to criticism |
| S02 | Thornton, *Karl Popper*, SEP (rev. 31 Jul 2026) | https://plato.stanford.edu/entries/popper/ | full | refutation criteria fixed in advance; no ad hoc rescue; background assumptions held provisionally |
| S03 | Bird, *Thomas Kuhn*, SEP (rev. 2 Sep 2025) | https://plato.stanford.edu/entries/thomas-kuhn/ | full | anomalies accumulate; exemplars; diverse evaluators |
| S04 | UC Berkeley, *Understanding Science flowchart* (text) | https://undsci.berkeley.edu/the-understanding-science-flowchart-text-description/ | full (text) | non-linear loop; expected vs actual; revise assumptions; community feedback |
| S05 | Chamberlin, *Multiple Working Hypotheses* (1897; 1995 reprint) | https://www.eps.mcgill.ca/~courses/c590/Chamberlain%201897.pdf | full | family of hypotheses; ruling theory; joint causes |
| S06 | Platt, *Strong Inference*, Science 1964 | https://www.whoi.edu/cms/files/platt64sci_72743.pdf (read at https://pages.cs.wisc.edu/~markhill/science64_strong_inference.pdf) | full | alternatives → crucial test → recycle; "The Question"; notebook |
| S07 | Feynman, *Cargo Cult Science*, 1974 | https://calteches.library.caltech.edu/51/2/CargoCult.htm | full | report everything; reproduce before changing; symmetric scrutiny; predict beyond the data |
| S08 | Box, *Science and Statistics*, JASA 1976 | https://www.gwern.net/doc/statistics/decision/1976-box.pdf | full | iterate on discrepancy; sponsor then critic; parsimony; worry about tigers |
| S09 | Breiman, *Two Cultures*, Stat Sci 2001 (+ comments) | https://doi.org/10.1214/ss/1009213726 (read at https://www.stat.cmu.edu/~ryantibs/journalclub/breiman_2001.pdf) | full | goal type; beat a trivial baseline; Rashomon stability; equal tuning effort (Efron) |
| S10 | Gelman & Shalizi, *Philosophy and the practice of Bayesian statistics*, BJMSP 2013 | https://arxiv.org/abs/1006.3868 | full (arXiv v4) | fit–check–expand; posterior predictive checks; severity |
| S11 | Ioannidis, *Why Most Published Research Findings Are False*, PLoS Med 2005 | https://doi.org/10.1371/journal.pmed.0020124 | full | flexibility and many tests lower PPV; too-good effects suspect |
| S12 | Simmons, Nelson & Simonsohn, *False-Positive Psychology*, Psych Sci 2011 | https://papers.ssrn.com/abstract=1850704 (read at https://www2.psych.ubc.ca/~schaller/528Readings/SimmonsNelsonSimonsohn2011.pdf) | full | disclose all choices; fixed stopping rule; with/without exclusions |
| S13 | Gelman & Loken, *Garden of Forking Paths*, 2013 | https://www.stat.columbia.edu/~gelman/research/unpublished/p_hacking.pdf | full | data-contingent choices; label exploratory; confirm on new data |
| S14 | Wasserstein & Lazar, *ASA Statement on p-values*, Am Stat 2016 | https://doi.org/10.1080/00031305.2016.1154108 (read at https://www.stat.berkeley.edu/~aldous/Real_World/ASA_statement.pdf; plan URL is the press release) | full | no threshold-only conclusions; full reporting; p ≠ effect size |
| S15 | Lakens 2017; Lakens, Scheel & Isager 2018, *Equivalence testing* | https://pmc.ncbi.nlm.nih.gov/articles/PMC5502906 · https://doi.org/10.1177/2515245918770963 (read at https://osf.io/download/5a0f36936c613b026c4a1848) | full | SESOI fixed in advance; equivalence before "no effect"; four outcomes |
| S16 | Nosek et al., *The Preregistration Revolution*, PNAS 2018 | https://doi.org/10.1073/pnas.1708274114 (read at https://pmc.ncbi.nlm.nih.gov/articles/PMC5856500/) | full | prediction vs postdiction; deviations reported; sealed holdout; SOPs; what was already seen |
| S17 | Munafò et al., *A Manifesto for Reproducible Science*, Nat Hum Behav 2017 | https://doi.org/10.1038/s41562-016-0021 | full (Table 1 not rendered) | blinding; independent oversight; automation amplifies false discovery |
| S18 | Sandve et al., *Ten Simple Rules for Reproducible Computational Research*, PLoS CB 2013 | https://doi.org/10.1371/journal.pcbi.1003285 | full | track provenance; no manual edits; seeds; link text to results |
| S19 | Schnell, *Ten Simple Rules for a Lab Notebook*, PLoS CB 2015 | https://pmc.ncbi.nlm.nih.gov/articles/PMC4565690 | full | dated, chronological, strike-through; rationale; who did what |
| S20 | Nygard, *Documenting Architecture Decisions*, 2011 | https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions | full | short numbered decision records; superseded not deleted |
| S21 | Kapoor et al., *REFORMS*, Sci Adv 2024 | https://reforms.cs.princeton.edu/ (read at arXiv 2308.07832v2 + checklist beta) | full | 32 items / 8 modules; reproducibility bundle; equal tuning of baselines |
| S22 | Kapoor & Narayanan, *Leakage and the reproducibility crisis*, Patterns 2023 | https://pmc.ncbi.nlm.nih.gov/articles/PMC10499856 | full | 8 leakage types (L1–L3); model info sheet; simple baselines win after fixes |
| S23 | Lones, *How to avoid ML pitfalls*, arXiv v5 2024 | https://arxiv.org/abs/2108.02497 | full | lock test set; pipeline is training; naive baselines; multiple comparisons |
| S24 | Pineau et al., *Improving reproducibility in ML research*, JMLR 2021 | https://jmlr.org/papers/v22/20-303.html | full | reproducible ≠ replicable ≠ robust ≠ generalisable; run record; no proof checklists work |
| S25 | Lipton & Steinhardt, *Troubling Trends in ML Scholarship*, 2018 | https://arxiv.org/abs/1807.03341 | full | speculation vs explanation; ablations; negative results |
| S26 | Henderson et al., *Deep RL that Matters*, AAAI 2018 | https://arxiv.org/abs/1709.06560 | main | seeds, hyperparameters, implementations change results; all runs |
| S27 | Agarwal et al., *Statistical Precipice*, NeurIPS 2021 | https://arxiv.org/abs/2108.13264 | main | interval estimates; IQM; profiles; locked protocol |
| S28 | agents.md | https://agents.md/ | full | plain Markdown; nearest file; list runnable checks |
| S29 | Claude Code memory docs; AGENTS.md fallback; issue #66559 | https://code.claude.com/docs/en/memory · https://devops.com/claude-code-adds-agents-md-fallback-cutting-instruction-file-sprawl (unreadable; secondary used) · https://github.com/anthropics/claude-code/issues/66559 | full / partial | `@` imports; user scope no prompt; < 200 lines; HTML comments stripped; no symlinked CLAUDE.md |
| S30 | Codex customization and AGENTS.md docs | https://developers.openai.com/codex/concepts/customization.md (now learn.chatgpt.com) | full | `~/.codex/AGENTS.md`; override masks; 32 KiB; no imports |
| S31 | Gloaguen et al., *Evaluating AGENTS.md*, arXiv v3 2026 | https://arxiv.org/abs/2602.11988 | full | no significant success gain; +cost; no overviews; rules are followed literally |
| S32 | Lulla et al., *AGENTS.md and agent efficiency*, 2026 | https://arxiv.org/abs/2601.20404 | full | −28.6% median runtime, −16.6% output tokens; correctness not measured |
| S33 | Jaroslawicz et al., *IFScale*, 2025 | https://arxiv.org/abs/2507.11538 | full | accuracy falls with instruction count; primacy; omission errors |
| S34 | Böckeler, *Understanding SDD: Kiro, spec-kit, Tessl*, 2025 | https://www.martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html | full | spec-first/anchored; one size does not fit; reviewable files |
| S35 | Kerr, *HARKing*, PSPR 1998 | https://doi.org/10.1207/s15327957pspr0203_4 | abstract | post hoc hypotheses presented as a priori |
| S36 | Shmueli, *To Explain or to Predict?*, Stat Sci 2010 | https://arxiv.org/abs/1101.0891 | full | explain/predict/describe; ex-ante feature availability; fit ≠ predictive power |
| S37 | Cawley & Talbot, *Over-fitting in model selection*, JMLR 2010 | https://www.jmlr.org/papers/volume11/cawley10a/cawley10a.pdf | main | selection inside folds; nested CV; multiple partitions |
| S38 | Dodge et al., *Show Your Work*, EMNLP 2019 | https://arxiv.org/abs/1909.03004 | main | results depend on search budget; report trials |
| S50 | Zhong, Raghunathan & Carlini, *ImpossibleBench: Measuring LLMs' Propensity of Exploiting Test Cases*, arXiv 2025 / ICLR 2026 | https://arxiv.org/abs/2510.20270 | abstract | agents "pass" impossible tasks by editing or bypassing tests; stronger models cheat more |
| S51 | Sharma et al., *Towards Understanding Sycophancy in Language Models*, arXiv 2023 (v4 2025) | https://arxiv.org/abs/2310.13548 | abstract | RLHF assistants favour answers that agree with the user over true ones |
| S52 | Klein, *Performing a Project Premortem*, HBR 85(9) 2007 | https://www.Wikipedia.org/wiki/Premortem (secondary; original not read) | abstract | assume the project has already failed and list why; surfaces unspoken doubts |
| S53 | Chesterton, *The Thing* (1929), ch. "The Drift from Domesticity" ("Chesterton's fence") | https://www.chesterton.org/taking-a-fence-down/ | partial | do not remove an institution without knowing why it was put there; the popular phrasing is a paraphrase |
| S54 | Devin CLI docs: rules, configuration, skills | https://docs.devin.ai/cli/extensibility/rules.md · https://docs.devin.ai/cli/extensibility/configuration.md · https://docs.devin.ai/cli/extensibility/skills/overview.md | partial (read by a reviewer agent) | reads the project `AGENTS.md`/`CLAUDE.md`; global at `~/.config/devin/AGENTS.md`; skills in `~/.agents/skills`; no imports |
| S55 | ODNI, *Intelligence Community Directive 203: Analytic Standards*, 2015 | https://archive.dni.gov/files/documents/ICD/ICD-203.pdf | full (research agent) | main message up front; describe source quality; separate information from assumptions and judgments; express uncertainty |
| S56 | Steyvers et al., Nature Machine Intelligence 2025 | https://arxiv.org/abs/2401.13835 | abstract (research agent) | users overestimate LLM accuracy; longer explanations raise confidence without raising accuracy; wording matched to the model's confidence narrows the gap |
| S57 | Zhou et al., ACL 2024 | https://arxiv.org/abs/2401.06730 | abstract (research agent) | models rarely express uncertainty and are overconfident; users rely on answers whether or not they are marked as certain |
| S58 | Kim et al., FAccT 2024 | https://arxiv.org/abs/2405.00623 | main (research agent) | pre-registered, 404 people: first-person uncertainty ("I'm not sure") lowered over-reliance and raised accuracy |
| S59 | Shulman & Bullock, PLOS ONE 2020 | https://pmc.ncbi.nlm.nih.gov/articles/PMC7540871 | main (research agent) | jargon makes reading harder and reduces persuasion; definitions do not fully undo it |
| S60 | Barnett & Doubleday, eLife 2020 | https://pmc.ncbi.nlm.nih.gov/articles/PMC7556863 | main (research agent) | ~1 million acronyms: most are rarely used and rarely reused; use fewer acronyms |
| S61 | Camerer, Loewenstein & Weber, *The curse of knowledge*, J Political Economy 1989 | https://www.cmu.edu/dietrich/sds/docs/loewenstein/CurseknowledgeEconSet.pdf | full (research agent) | better-informed people cannot ignore what they know when writing for others |
| S62 | US federal plain language guidelines, *Avoid jargon* | https://digital.gov/guides/plain-language/principles/avoid-jargon | full (research agent) | keep only necessary technical terms, and define them |
| S63 | ISO 24495-1:2023, *Plain language — Part 1* | https://www.din.de/de/mitwirken/normenausschuesse/nat/veroeffentlichungen/wdc-beuth:din21:370015899/toc-3456451/download | partial (table of contents) | readers get what they need, find it, understand it and can use it |
| S64 | Read-back of orders on ICU rounds, Can J Hosp Pharm | https://cjhp-online.ca/index.php/cjhp/article/download/1702/2656?inline=1 | main (research agent) | rounds with at least one error fell from 76% to 21% with read-back; not randomized |
| S65 | I-PASS handoff study (Starmer et al., NEJM 2014), Harvard Medical School news | https://hms.harvard.edu/news/safer-patient-handoffs | partial (secondary) | handoff ending with the receiver's own summary: medical errors −23%, preventable adverse events −30%; before-and-after design |
| S66 | Stray et al., daily stand-up meetings, 2018 | https://arxiv.org/pdf/1808.07650.pdf | full (research agent) | "what I did" turns into status reporting; first recommendation: omit it |
| S67 | Anthropic, *Prompting Claude Fable 5.2* | https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5-2 | full (research agent) | say first what you will do; close with what was found, done and next; low-context reader; no terms made up during the work |
| S68 | OpenAI, *GPT-5 prompting guide* | https://developers.openai.com/cookbook/examples/gpt-5/gpt-5_prompting_guide.md | full (research agent) | restate the user's goal before acting; summarize completed work |
| S69 | Budescu et al. 2009, interpretation of IPCC probability words | https://research.library.fordham.edu/psych_facultypubs/87 | abstract (research agent) | readers' reading of probability words departs from the official meaning even with the guide in hand |

### Recorded, not yet read
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

## Evidence gaps
- No study has tested science-based workflows for coding agents; urutau's effect is unknown until the pilot (success criterion on the pilot in `sdd/spec.md`).
- Evidence on context files is mixed and comes from software tasks (S31, S32).
- Pre-registration and checklists have little direct experimental support (S16, S24).
- "One task, the owner's pace", part of "Everything has a why", the reply language and "no AI attribution" are owner preferences, not derived from a source.
- No study tests the exact report shape "what I understood / result / how I know / next"; it follows a standard (S55) and vendor guidance (S67, S68), with study support only for its parts (S56, S58, S64–S66).
- S50–S53, S56, S57, S63, S65 and S69 were read only as abstract, table of contents or secondary source.
