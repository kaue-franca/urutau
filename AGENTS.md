# urutau — development instructions

Purpose: build and version urutau, a short method for working with AI agents on any project, based on the scientific method and independent of the agent tool. This repo uses its own method: the working copy is loaded below and its records are in `sdd/`.

- Read `project/method.md` first: it is the method this repo follows. (`@project/method.md` loads it in tools that support imports.)

## Conventions
- Paraphrase sources and link them in `SCIENCE.md`; every rule maps to sources there or is marked owner-preference.
- The limits in the success criteria of `sdd/spec.md` are hard limits: when over, merge or delete before adding.
- Nothing tool-specific in `global/`, `project/` or `INSTALL.md`: every agent tool that reads `AGENTS.md` must be able to use them.
- A change to `global/`, `project/` or `INSTALL.md` bumps `VERSION` and gets a Decision in `sdd/log.md`.

## Layout
`global/` rules for every session · `project/` what a project receives · `INSTALL.md` install and setup steps for an agent · `examples/` a filled project · `SCIENCE.md` sources · `sdd/` this repo's own records.
