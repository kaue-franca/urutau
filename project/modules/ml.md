## Module: machine learning and statistical models
Read before writing an experiment card that relies on a fitted model. Adapted from REFORMS (Kapoor et al. 2024), Kapoor & Narayanan 2023, Lones 2024, Cawley & Talbot 2010, Dodge et al. 2019, Shmueli 2010 and Breiman 2001; `SCIENCE.md` in the urutau repo links each one. It adapts REFORMS; filling it in is not REFORMS compliance.

## Before building
- [ ] Goal type in `spec.md`: prediction, explanation or description. Predictive claims need out-of-sample evaluation; in-sample fit (R², AIC) is not predictive power.
- [ ] Claim population: who or what the result should hold for, and why the data represent it.
- [ ] Outcome definition and how far it is a proxy for what you care about.
- [ ] Split before exploring. Set the holdout aside, record its hash, and log every evaluation on it in `log.md`.
- [ ] Choose the split to match deployment: grouped (user, patient, site) when rows depend on each other; forward-chaining by time for forecasts.
- [ ] Data cleaning and exclusion rules decided with outcome labels masked where possible.

## Leakage
- [ ] Clean split: every fitted step (scaling, imputation, feature selection, resampling, PCA, target encoding) is fitted inside the training fold, in a pipeline.
- [ ] Clean split: no duplicates or near-duplicates across splits; no shared groups across splits.
- [ ] Features available at prediction time: none is a proxy for the outcome; write a one-line justification per feature group.
- [ ] Test data matches the claim: max(train time) < min(test time) when the claim is about the future; the test distribution matches the claim population.
- [ ] A suspiciously good score triggers this whole section again before it is reported.

## Baselines and comparisons
- [ ] A naive baseline (majority class, mean, persistence) and a simple model (linear/logistic, small tree) are always reported.
- [ ] Same data, splits, seeds and search budget for the baseline and the new method; record trials, search space, search method and selection criterion for each. "A beats B" holds only at the budget tested.
- [ ] All tuning, feature and model selection inside the training folds; report the estimate from an outer loop (nested cross-validation) or from the holdout.
- [ ] Compare "algorithm + selection procedure", not algorithms alone.
- [ ] Many comparisons → correct for multiplicity, or report them all as tries.

## Evaluation and uncertainty
- [ ] Repeat over seeds and/or resamples; report mean ± interval (bootstrap CI or SD over partitions) and the effect vs the baseline.
- [ ] A difference smaller than split-to-split variation is not a finding. "No effect" only after an equivalence test against the smallest effect that matters, fixed in the experiment card.
- [ ] The metric fits the cost of errors and the class balance; state the exact variant (macro/micro F1, AUC type).
- [ ] Save per-sample predictions so paired tests and re-analysis stay possible.
- [ ] Report validation alongside test performance.

## Interpretation
- [ ] Check the model against the data before concluding: residuals or calibration, behaviour on slices, stability across resamples; record what does not fit under Open questions.
- [ ] Before "X is important": check stability across resamples and model families; report correlated features as groups.
- [ ] Credit a gain to a component only after removing it and measuring again (ablation).
- [ ] State where the result is not expected to hold; do not generalize beyond the data used.

## Reproducibility
- [ ] Data version or hash, code commit, environment lockfile, seeds, and one command that regenerates every reported number.
