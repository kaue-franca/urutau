# Module: machine learning and statistical models (urutau v0)

Read before planning a confirm test that relies on a fitted model. Adapted from REFORMS (S21), Kapoor & Narayanan (S22), Lones (S23), Cawley & Talbot (S37), Dodge et al. (S38), Shmueli (S36) and Breiman (S09). It adapts REFORMS; filling it in is not REFORMS compliance.

## Before building
- [ ] Goal type in `spec.md`: prediction, explanation or description. Predictive claims need out-of-sample evaluation; in-sample fit (R², AIC) is not predictive power (S36).
- [ ] Claim population: who or what the result should hold for, and why the data represent it (S21 1a, 3g).
- [ ] Outcome definition and how far it is a proxy for what you care about (S21 3).
- [ ] Split before exploring. Lock the test set; record its hash; log every evaluation on it in `log.md` (S23, R5).
- [ ] Decide the split to match deployment: grouped (user, patient, site) when rows depend on each other; forward-chaining by time for forecasts (S22 L3, S23).
- [ ] Data cleaning and exclusion rules decided with outcome labels masked where possible (S16, S17).

## Leakage (S22 taxonomy)
- [ ] L1 — clean separation: every fitted step (scaling, imputation, feature selection, resampling, PCA, target encoding) is fitted inside the training fold, in a pipeline (S22, S23).
- [ ] L1 — no duplicates or near-duplicates across splits; no shared groups across splits.
- [ ] L2 — every feature is available at prediction time and is not a proxy for the outcome; write a one-line justification per feature group (S22, S36).
- [ ] L3 — max(train time) < min(test time) when the claim is about the future; test distribution matches the claim population.
- [ ] A suspiciously good score triggers this whole section again before it is reported (R7).

## Baselines and comparisons
- [ ] Naive baseline (majority class, mean, persistence) and a simple model (linear/logistic, small tree) are always reported (S09, S22, S23).
- [ ] Same data, splits, seeds and search budget for every arm; record trials, search space, search method and selection criterion per arm. "A beats B" holds only at the budget tested (S38, R6).
- [ ] All tuning, feature and model selection inside the training folds; report the estimate from an outer loop (nested CV) or the sealed test set (S37).
- [ ] Compare "algorithm + selection procedure", not algorithms alone (S37).
- [ ] Many comparisons → correct for multiplicity or report them all as exploratory (S23, S13).

## Evaluation and uncertainty
- [ ] Repeat over seeds and/or resamples; report mean ± interval (bootstrap CI or SD over partitions) and the effect vs baseline (R8).
- [ ] A difference smaller than split-to-split variation is not a finding (S37).
- [ ] Metric fits the cost of errors and class balance; state the exact variant (macro/micro F1, AUC type) (S23, S09).
- [ ] Save per-sample predictions so paired tests and re-analysis remain possible (S23).
- [ ] Report validation alongside test performance (S38).

## Interpretation
- [ ] Before "X is important": check stability across resamples and model families; report correlated features as groups (S09).
- [ ] Credit a gain to a component only after an ablation (S25, R11).
- [ ] State where the result is not expected to hold (S21 8b); do not generalize beyond the data used (S23).

## Reproducibility bundle (S21 module 2, S18)
- [ ] Data version or hash, code commit, environment lockfile, seeds, and one command that regenerates every reported number (R9).
