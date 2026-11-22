## Module: reinforcement learning
Read before writing an experiment card on reinforcement-learning agents. From Henderson et al. 2018 and Agarwal et al. 2021 (`SCIENCE.md` in the urutau repo links both); use with `ml.md` for general comparison rules.

## Before running
- [ ] Fix the number of seeds and the seed list in the experiment card; the baseline and the new method use the same seeds. Size runs by subsampling or a power simulation, not habit.
- [ ] Reproduce the baseline's originally reported numbers under its original settings before comparing; record codebase and version for each baseline.
- [ ] Fix and record environment versions, reward scaling, normalization, network architecture and every hyperparameter for every method compared.
- [ ] Choose environments/tasks in advance, not after seeing which look favourable.
- [ ] Fix the evaluation protocol: final policy, N evaluation episodes; never max-over-training; identical for every method.
- [ ] Choose aggregate metrics before seeing results: interquartile mean (IQM), optimality gap, probability of improvement, performance profiles.

## Reporting
- [ ] Report every run, including failures; never best-of-N or top-N.
- [ ] Interval estimates with stratified bootstrap over runs; avoid significant/not-significant verdicts.
- [ ] Save per-run, per-task raw scores so intervals and profiles can be recomputed.
- [ ] Inspect behaviour (rollouts, videos), not only returns: high scores can hide degenerate policies.
- [ ] With ~3 runs, say that bootstrap intervals under-cover; treat results as tries.
