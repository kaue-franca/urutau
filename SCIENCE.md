# Ciência por trás do urutau
Por que cada regra existe, de onde ela vem e qual falha do uso de IA ela fecha. Substitui `references/sources.md` (v0), que fica em `history/` com a análise original.
Profundidade de leitura: **full** = texto completo · **main** = texto principal · **partial** · **abstract** · **unread**.

## O problema
Um agente de IA escreve código e explicações fluentes muito mais rápido do que alguém consegue checar. Sem método, ele: relata números que não viu; testa a ideia nos mesmos dados que a geraram; troca a métrica ou afrouxa o teste até "passar"; concorda com o dono em vez de discordar com evidência; e acumula código sem motivo conhecido. O urutau transforma práticas da ciência que combatem exatamente isso em poucas regras que o agente segue e que dá para verificar nos arquivos.

## Mecanismos
| ID | Mecanismo | Fontes |
|---|---|---|
| M1 | **Afirmações testáveis**: o resultado esperado e o que o refutaria são escritos antes. | S02, S04, S06, S07, S35 |
| M2 | **Hipóteses rivais**: sempre um baseline simples e as rivais mundanas (bug, vazamento, artefato, acaso). | S05, S06, S11, S22, S23 |
| M3 | **Explorar ≠ confirmar**: tentativa não prova nada; afirmação exige teste pré-registrado em dados não usados para formar a ideia. | S12, S13, S16, S23, S35, S37, S38 |
| M4 | **Reportar tudo**: todas as execuções, desvios e becos sem saída; resultado bom é tão escrutinado quanto ruim. | S07, S11, S12, S14, S19, S25 |
| M5 | **Estimar, não limiarizar**: efeito ± incerteza contra o baseline; "sem efeito" só com teste de equivalência. | S14, S15, S26, S27, S37 |
| M6 | **Rastreabilidade**: todo resultado aponta para commit, dados, config, seed e comando; caderno datado e só acrescentado. | S18, S19, S21, S24 |
| M7 | **Iterar e checar o modelo** contra os dados; o mais simples que resolve. | S03, S04, S08, S09, S10 |
| M8 | **Registrar decisões**, dizendo se resultados já tinham sido vistos; superar, nunca apagar. | S02, S16, S19, S20 |
| M9 | **Disciplina de contexto**: arquivo curto, escrito à mão, regras críticas primeiro, checagens mecânicas. | S28–S34 |
| M10 | **Escrutínio independente** antes de confiar numa afirmação. | S01, S03, S17, S24 |
| M11 | **Alvo fixo e testes íntegros**: o critério de sucesso não muda depois de ver o resultado; o teste não é editado para passar. | S02, S16, S50 |
| M12 | **Resistir à pressão social**: o modelo tende a concordar com o usuário; só evidência muda a conclusão. | S51, S10 |
| M13 | **Intenção explícita**: saber por que algo existe antes de mantê-lo ou removê-lo. | S53, S25 |

## Regras → mecanismos → fontes
| Regra | Fecha a lacuna da IA | Mecanismos | Fontes |
|---|---|---|---|
| U1 Evidência | relatar número ou fato não observado | M6, M1 | S07, S18, S25, S35 |
| U2 Prever, depois checar | explicação plausível nunca testada; resultado bom demais aceito | M1, M4 | S02, S04, S06, S07, S11 |
| U3 Alvo fixo | trocar meta/métrica/split em silêncio; afrouxar teste para passar | M11, M8 | S02, S16, S20, S50 |
| U4 Discordar com evidência | concordar com o dono (sycophancy); afirmação sem revisão | M12, M10 | S51, S01, S17, S24 |
| U5 Uma task, no ritmo do dono | autonomia demais; plano longo detalhado que envelhece | M7, M9 | `owner-preference`; S04, S08 (ciclo iterativo), S34 |
| U6 Tudo tem um porquê | código gerado e acumulado sem motivo | M13 | S53, S25; `owner-preference` |
| U7 Rivais e baseline justo | ganho que é artefato; baseline fraco | M2, M3 | S05, S06, S07, S09, S21, S22, S38 |
| U8 Tentativas e testes | ajustar no conjunto de teste; HARKing | M3 | S12, S13, S16, S23, S35, S37 |
| U9 Reportar tudo | escolher só a melhor execução; esconder falhas | M4, M5 | S07, S11, S12, S14, S15, S19, S26, S27 |
| Convenções (git, uv) | trabalho não rastreável ou não reproduzível | M6 | S18; `owner-preference` |

## Formatos e skills → fontes
| O quê | Onde | Fontes |
|---|---|---|
| Cartão da task: porquê, previsão, checagem com "falha se", passos | `sdd/spec.md` | S02, S04, S06 |
| Critérios de sucesso que nomeiam o resultado que os reprova | `sdd/spec.md` | S02, S06 |
| Cartão de teste: rivais, "refutado se", plano, já visto, orçamento, menor efeito relevante, commit de pré-registro, revisão | `sdd/log.md` | S06, S12, S15, S16, S38, S17 |
| Caderno datado, só acrescentado, `by:` | `sdd/log.md` | S19, S20 |
| Sabido · Suposto · Inexplicado | `sdd/knowledge.md` | S02, S03, S08, S18, S25 |
| Becos sem saída com "revive se" | `sdd/knowledge.md` | S06, S07, S25 |
| Mapa do porquê; `Why:` no código | `knowledge.md`, código | S53 |
| `AGENTS.md` autocontido, curto, sem visão geral | projeto e global | S28–S33, S54 |
| `urutau-grill`: uma pergunta por vez, resposta do agente escrita antes, "o que te faria abandonar", rivais, pre-mortem | skill | S02, S05, S51, S52 |
| `urutau-audit`: cerca de Chesterton; apagar como hipótese falseável ("nada muda") checada pelos testes | skill | S53, S02, S18 |

## Fontes
URL = link canônico; "read at" = cópia efetivamente lida. Acesso em 2026-10-26 (S01–S38) e 2026-11-22 (S50–S54).

| ID | Fonte | URL | Profundidade | Princípios usados |
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
| S50 | Zhong, Raghunathan & Carlini, *ImpossibleBench: Measuring LLMs' Propensity of Exploiting Test Cases*, arXiv 2025 / ICLR 2026 | https://arxiv.org/abs/2510.20270 | abstract | agentes "passam" tarefas impossíveis alterando ou contornando testes; modelos mais fortes trapaceiam mais |
| S51 | Sharma et al., *Towards Understanding Sycophancy in Language Models*, arXiv 2023 (v4 2025) | https://arxiv.org/abs/2310.13548 | abstract | assistentes RLHF favorecem respostas que concordam com o usuário em vez das verdadeiras |
| S52 | Klein, *Performing a Project Premortem*, HBR 85(9) 2007 | https://www.Wikipedia.org/wiki/Premortem (secundária; texto original não lido) | abstract | supor que o projeto já falhou e listar por quê revela dúvidas caladas |
| S53 | Chesterton, *The Thing* (1929), cap. "The Drift from Domesticity" — a "cerca de Chesterton" | https://www.chesterton.org/taking-a-fence-down/ | partial | não remover uma instituição sem saber por que foi posta; a frase popular é paráfrase |
| S54 | Devin CLI docs: rules, configuration, skills | https://docs.devin.ai/cli/extensibility/rules.md · https://docs.devin.ai/cli/extensibility/configuration.md · https://docs.devin.ai/cli/extensibility/skills/overview.md | partial (lidas pelo crítico B) | lê `AGENTS.md`/`CLAUDE.md` do projeto; global em `~/.config/devin/AGENTS.md`; skills em `~/.agents/skills`; sem imports |

### Registradas, ainda não lidas
| ID | Fonte | URL | Por que pode importar |
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

## Lacunas de evidência
- Nenhum estudo testou fluxos baseados no método científico para agentes de código; o efeito do urutau é desconhecido até o piloto (SC-05).
- A evidência sobre arquivos de contexto é mista e vem de tarefas de software (S31, S32).
- Pré-registro e checklists têm pouco suporte experimental direto (S16, S24).
- U5 e parte de U6 são preferência do dono, não derivadas de fonte.
- S50–S53 lidas no resumo ou em fonte secundária.
