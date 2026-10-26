# Module: reinforcement learning (urutau v0)

Read before planning a confirm test on RL agents. From Henderson et al. (S26) and Agarwal et al. (S27); use with `ml.md` for general comparison rules.

## Before running
- [ ] Fix the number of seeds and the seed list in the EXP card; baseline and challenger use the same seeds. Size runs by subsampling or a power simulation, not habit (S26, S27).
- [ ] Reproduce the baseline's originally reported numbers under its original settings before comparing; record codebase and version for each baseline (S26, R6).
- [ ] Fix and record environment versions, reward scaling, normalization, network architecture and every hyperparameter for all arms (S26).
- [ ] Choose environments/tasks in advance, not after seeing which look favourable (S26).
- [ ] Lock the evaluation protocol: final policy, N evaluation episodes; never max-over-training; identical across arms (S27).
- [ ] Choose aggregate metrics before seeing results: IQM, optimality gap, probability of improvement, performance profiles (S27).

## Reporting
- [ ] Report every run, including failures; never best-of-N or top-N (S26, R7).
- [ ] Interval estimates with stratified bootstrap over runs; avoid significant/not-significant verdicts (S27, R8).
- [ ] Save per-run, per-task raw scores so intervals and profiles can be recomputed (S27).
- [ ] Inspect behaviour (rollouts, videos), not only returns: high scores can hide degenerate policies (S26).
- [ ] With ~3 runs, say that bootstrap intervals under-cover; treat results as exploratory (S27).
