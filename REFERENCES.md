# Reference analysis (v0.2 · 2026-10-26)

Purpose: analyse every source **before** deciding the method's artifacts and content. Each entry gives the source's core claim, what it implies for the method (→ mechanism `M#`, defined at the end), and caveats.

**Read** = depth of reading behind this analysis: **full** (full text), **partial** (substantial excerpts), **abstract** (abstract and secondary summaries). Phase 1 of `PLAN.md` re-reads every source in full, blind to this file, and compares.

---

## A. Scientific method and philosophy of science

**S01 · SEP, "Scientific Method"** (Hepburn & Andersen; latest revision found: 2021) · read: abstract
- Claim: there is no consensus on a single scientific method; the field debates unified vs pluralist, context-sensitive accounts.
- Implication: one ritual for every task is wrong → a light path for routine work and domain modules (M7, M9).

**S02 · SEP, "Karl Popper"** (Thornton; revised 2021) · read: abstract
- Claim: scientific claims must be falsifiable; survivors are kept only provisionally; ad hoc rescues that add no new testable prediction are illegitimate; every test relies on auxiliary assumptions.
- Implication: hypotheses and acceptance criteria name the result that would refute them (M1); a rescue after a failed prediction is logged as a new hypothesis, never a silent edit (M1, M8).

**S03 · SEP, "Thomas Kuhn"** (Bird) · read: abstract
- Claim: normal science solves puzzles inside a framework; anomalies are first blamed on the researcher; accumulated anomalies can force a change of framework.
- Implication: keep explicit lists of assumptions and anomalies; record anomalies instead of explaining them away (M7).

**S04 · Understanding Science — Science Flowchart** (UC Berkeley) · read: full
- Claim: inquiry is non-linear; hypotheses produce expected results that are compared with actual results; data can support or oppose a hypothesis, or inspire a revised hypothesis or revised assumptions; replication and feedback are part of the process.
- Implication: the loop can be re-entered anywhere; "revise assumptions" is a legitimate outcome; owner review plays the role of community feedback (M1, M7).

**S05 · Chamberlin (1890; 1897 revision), Multiple Working Hypotheses** · read: full
- Claim: attachment to one explanation turns it into a "ruling theory" that bends facts; keep a family of hypotheses; establish the facts before interpreting; several causes often act jointly, so estimate each one's share.
- Implication: ≥ 2 rival hypotheses per experiment, joint explanations allowed (M2).
- Caveat: critics consider full impartiality unrealistic (Raup's 1995 introduction).

**S06 · Platt (1964), Strong Inference** · read: full
- Claim: fast-moving fields systematically (1) devise alternative hypotheses, (2) design crucial experiments whose outcomes exclude some, (3) run them cleanly, (4) recycle. A conclusion that is not an exclusion is insecure. Write the alternatives and crucial tests in a permanent notebook. Beware method-oriented busywork. "The Question": what experiment could disprove this hypothesis, and what hypothesis does this experiment disprove?
- Implication: "The Question" as a gate for every confirmatory test (M1, M2); the log is the notebook (M6).
- Caveat: criticized for idealizing some fields; not every problem has a clean crucial experiment.

**S07 · Feynman (1974), Cargo Cult Science** · read: full
- Claim: report everything that could invalidate a result, the alternatives and how they were ruled out, and the data that disagree; a theory must predict something beyond the facts that suggested it; report results whichever way they come out; reproduce the original condition before changing it; scrutinize results that match expectations as hard as those that don't (the Millikan history).
- Implication: report-all and the cemetery (M4); confirmation on data not used to form the hypothesis (M3); reproduce the baseline before modifying it (M3); symmetric scrutiny (M4).

**S08 · Box (1976), Science and Statistics** · read: full
- Claim: science is a motivated iteration between theory and practice, driven by the discrepancy signal; don't fall in love with the model; parsimony; worry selectively about what is importantly wrong; the analyst is first the model's sponsor and then its critic (diagnostics); design before data; avoid forcing problems into routine techniques ("cookbookery") and theory detached from practice.
- Implication: iterative loop; simplest adequate model first; attack the biggest threat to validity first; explicit model-checking step (M7); the method must fit the problem (M9).

**S09 · Breiman (2001), Statistical Modeling: The Two Cultures** · read: abstract
- Claim: data-modeling vs algorithmic-modeling cultures; validation by predictive accuracy; commentators (Cox, Parzen) warn that without a data-generating model scientific explanation is weaker.
- Implication: `spec.md` states the goal type (prediction / explanation / build), because it changes what counts as valid evidence (M1).

**S10 · Gelman & Shalizi (2013), Philosophy and the Practice of Bayesian Statistics** · read: abstract
- Claim: good Bayesian practice is hypothetico-deductive — fit, check the model against data, revise; models are falsifiable.
- Implication: model checking before conclusions applies to Bayesian work too (M7).

## B. Metascience and statistical inference

**S11 · Ioannidis (2005), Why Most Published Research Findings Are False** · read: abstract
- Claim: findings are less likely true with small samples, small effects, many tested relations, flexible designs, bias, and competitive fields; confirmatory work is more credible than exploratory.
- Implication: confidence depends on design; a claim becomes "established" only after replication (M5).
- Caveat: the headline is contested (definitions of "most" and "false").

**S12 · Simmons, Nelson & Simonsohn (2011), False-Positive Psychology** · read: abstract
- Claim: undisclosed flexibility (outcomes, sample size, covariates, conditions) inflates false positives far beyond nominal α; disclosure requirements fix most of it.
- Implication: log every analytic choice; report all conditions and results with and without exclusions (M4).
- Caveat: later estimates suggest real-world false-positive rates below the simulation's worst case.

**S13 · Gelman & Loken (2013), The Garden of Forking Paths** · read: abstract
- Claim: data-contingent analysis choices create multiplicity even without conscious p-hacking.
- Implication: fix the analysis plan before a confirmatory test; label post-hoc paths as exploratory (M3).

**S14 · ASA Statement on p-values (2016)** · read: partial (the six principles)
- Claim: p-values measure incompatibility with a model, not the probability of a hypothesis or the size of an effect; conclusions should not rest on a threshold; full reporting is required.
- Implication: report effect sizes with uncertainty (M5).

**S15 · Lakens (2017); Lakens, Scheel & Isager (2018), Equivalence testing** · read: abstract
- Claim: specify a smallest effect size of interest (SESOI); use equivalence tests to support "no meaningful effect".
- Implication: every confirmatory test defines the minimum meaningful effect and how "no effect" will be concluded (M5).

**S16 · Nosek et al. (2018), The Preregistration Revolution** · read: full
- Claim: preregistration doesn't favor prediction over postdiction; it makes clear which is which. Deviations are acceptable when reported. Practical options: incremental preregistration, blinding, decision trees, standard operating procedures (SOPs). With many fast experiments, treat early runs as exploratory and confirm by replication; a sealed holdout turns postdictions into predictions; report all outcomes of a research program; competing predictions strengthen inference. The paper notes that experimental evidence for preregistration's benefit is still limited.
- Implication: the explore/confirm split (M3); the global file and modules act as SOPs; confirmatory cards only where a claim will be made (M3, M9).

**S17 · Munafò et al. (2017), A Manifesto for Reproducible Science** · read: abstract
- Claim: measures across methods (protection against bias, e.g. blinding), reporting, reproducibility, evaluation and incentives.
- Implication: cheap blinding (a sealed test set) and reproducibility (M3, M6).

## C. Research records

**S18 · Sandve et al. (2013), Ten Simple Rules for Reproducible Computational Research** · read: abstract
- Claim: keep track of how every result was produced; avoid manual steps; version everything; record seeds; connect textual statements to the underlying results.
- Implication: traceability fields in experiment entries; every knowledge claim links to its evidence (M6).

**S19 · Schnell (2015), Ten Simple Rules for a Computational Biologist's Laboratory Notebook** · read: full
- Claim: record all scientific activity chronologically and immediately; each entry has a date, a subject and brief background; never erase — strike through; record how every result was produced; version code; keep a table of contents.
- Implication: `log.md` is dated, titled and append-only, with corrections by strikethrough; `status.md` points to the latest entries (M6).

**S20 · Nygard (2011), Documenting Architecture Decisions (ADRs)** · read: abstract
- Claim: short records of each significant decision — context, decision, status, consequences; superseded, never deleted.
- Implication: DEC entries in the log (M8).

## D. ML and RL validity

**S21 · Kapoor et al. (2024), REFORMS** · read: abstract
- Claim: a 32-item, field-agnostic checklist for ML-based science (modules cover goals, reproducibility, data, preprocessing, modeling, leakage, metrics and uncertainty, generalizability — verify the exact list in Phase 1).
- Implication: backbone of `modules/ml.md` (M3, M5, M6).

**S22 · Kapoor & Narayanan (2023), Leakage and the reproducibility crisis** · read: abstract
- Claim: leakage affected at least 294 papers in 17 fields; taxonomy of eight leakage types; "model info sheets"; once corrected, complex models lost their edge over simple baselines.
- Implication: leakage checks and simple baselines in `modules/ml.md` (M2, M3).

**S23 · Lones (v5, 2024), How to Avoid Machine Learning Pitfalls** · read: full outline
- Claim: five stages (before building, building, evaluating, comparing, reporting). Key items: don't look at test data; avoid leakage and sequential overfitting; keep a final untouched test set; meaningful and naïve baselines; evaluate multiple times; correct for multiple comparisons; respect temporal dependencies; don't generalise beyond the data; look at your models; use a checklist.
- Implication: `modules/ml.md` structure; sealed final test set (M3, M5).

**S24 · Pineau et al. (2021), Improving Reproducibility in ML Research** · read: abstract
- Claim: the NeurIPS code policy and reproducibility checklist improved reporting practice.
- Implication: code, data, hyperparameter and run-count items in `modules/ml.md` (M6).

**S25 · Lipton & Steinhardt (2018), Troubling Trends in ML Scholarship** · read: abstract
- Claim: four trends — explanation confused with speculation, failure to identify the sources of gains, "mathiness", misuse of language.
- Implication: evidence tags; ablations before attributing a gain (M4, M7).

**S26 · Henderson et al. (2018), Deep RL that Matters** · read: abstract
- Claim: deep RL results vary with seeds, hyperparameters and implementations; significance and variance must be reported.
- Implication: `modules/rl.md` (M5).

**S27 · Agarwal et al. (2021), Statistical Precipice** · read: abstract
- Claim: point estimates from few runs mislead; report interval estimates (stratified bootstrap), performance profiles, IQM (`rliable`).
- Implication: `modules/rl.md` (M5).

## E. Agent context files and SDD

**S28 · agents.md** · read: full
- Claim: plain Markdown, no required sections; the nearest file wins; explicit user prompts override; agents run listed checks.
- Implication: one global method file plus a short project file (M9).

**S29 · Claude Code memory docs; AGENTS.md fallback (v2.1.277, announced 2026-09-18); symlink issue** · read: partial
- Claim: `CLAUDE.md` imports (`@path`) load at session start and save no tokens; AGENTS.md is read only when no CLAUDE.md exists; a symlinked CLAUDE.md cannot be edited by the agent.
- Implication: `CLAUDE.md` = `@AGENTS.md`; the global file is imported from `~/.claude/CLAUDE.md`; modules are referenced by path, not imported (M9).

**S30 · Codex customization docs** · read: partial
- Claim: a global `~/.codex/AGENTS.md` plus repository files; closer files take precedence.
- Implication: install script covers Codex too (M9).

**S31 · Gloaguen et al. (2026), Evaluating AGENTS.md** · read: abstract
- Claim: context files did not improve task success and raised cost by more than 20%; LLM-generated files slightly hurt, developer-written ones helped about 4%; instructions are followed literally; repository overviews don't help.
- Implication: hand-written, short, non-standard instructions only; evaluate the method (M9).

**S32 · Lulla et al. (2026), AGENTS.md and agent efficiency** · read: abstract
- Claim: on 124 PRs, AGENTS.md was associated with −28.6% median runtime and −16.6% output tokens at comparable completion.
- Implication: context files can pay off in efficiency; keep them (M9).

**S33 · Jaroslawicz et al. (2025), IFScale** · read: abstract
- Claim: instruction-following accuracy drops as instruction count rises; earlier instructions are favored.
- Implication: few rules, critical ones first (M9).

**S34 · Böckeler (2025), Understanding Spec-Driven Development** · read: full
- Claim: SDD has three levels (spec-first, spec-anchored, spec-as-source); one workflow doesn't fit all problem sizes; verbose markdown is costly to review; agents still ignore or over-apply instructions (false sense of control); small iterative steps keep humans in control.
- Implication: spec-anchored but small; light path for small tasks; artifacts short enough for the owner to review (M9).

---

## Synthesis: nine mechanisms

| ID | Mechanism | Main sources |
|---|---|---|
| M1 | **Testable claims.** Every hypothesis and acceptance criterion names the result that would refute it; the spec states the goal type. | S02, S04, S06, S07, S09 |
| M2 | **Rival hypotheses.** ≥ 2 explanations per question, always including a simple baseline or null. | S05, S06, S16, S22, S23 |
| M3 | **Explore vs confirm.** Exploration is cheap and labeled; a claim is confirmed only by a pre-registered test on data not used to form it (sealed holdout, replication), after the baseline is reproduced. | S07, S12, S13, S16, S17, S21–S23 |
| M4 | **Report everything.** All runs, deviations and disconfirming results; symmetric scrutiny; dead ideas go to the cemetery with evidence. | S07, S12, S16, S19, S25 |
| M5 | **Estimate, don't threshold.** Effect sizes with uncertainty vs baseline; smallest meaningful effect defined in advance; repeated runs; "established" needs replication. | S11, S14, S15, S23, S26, S27 |
| M6 | **Traceability.** Every result → commit, data version, config, seed; every claim → its evidence; dated append-only notebook. | S06, S18, S19, S21, S24 |
| M7 | **Iterate and check.** Re-enter the loop anywhere; check the model before concluding; simplest adequate model; track assumptions and anomalies. | S03, S04, S08, S10, S25 |
| M8 | **Record decisions.** Context, options, decision, consequences; superseded, never deleted. | S02, S16, S20 |
| M9 | **Context discipline.** Short, hand-written, critical rules first, detail on demand, one path per problem size; the method itself is evaluated. | S01, S08, S28–S34 |

## Evidence gaps

- No study has tested science-based workflows for coding agents; the method's effect is unknown → pilot (Phase 7 of the plan).
- Evidence on context files is mixed (S31 vs S32) and comes from software-engineering tasks, not data-science work.
- Preregistration's benefit is strong in theory but still has limited experimental support (S16 says so itself).
