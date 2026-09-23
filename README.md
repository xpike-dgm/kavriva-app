# kavriva-app — Implementation Repository (bootstrap installed)

Status: BOOTSTRAP INSTALLED (Steps 1–7 + proof row + runnable CI with 11 checks green 2026-09-23; full row
migration (205/206) + product feature code arrive with Development).

Planning truth (design, decisions, traceability): `https://github.com/xpike-dgm/motobakim-plan`
(authoritative; nothing here redefines it — this repo holds implementation truth, linked by stable IDs).

## Map

- `.github/workflows/` — CI plan spec + runnable `checks.yml` (Step 4 installed; T3 human gates stay outside automation).
- `vault/` — Obsidian-compatible graph: `REGISTRY/` (physical task registry), `PACKS/` (context packs),
  `CONTRACTS/` (binding contract records, defined-by-reference), `EVIDENCE/` (completion evidence),
  `INDEX/` (generated JSON only). Vault layout decided by Step-1 blueprint.
- `modules/e01-app/` … `modules/e10-graph/` — one capsule per epic (E1 consumer mobile … E10 graph
  infrastructure). Each carries its own manifest (e.g. `modules/e01-app/MANIFEST.md`) + `public/` + `internal/` + `tests/` (Step 2 installed).
  `modules/e10-graph/` additionally holds `checks/` (validation suite), registry specs, and
  `MIGRATION_ROLLBACK_APPLICABILITY.md` (which undo rule binds which room).
- `templates/` — manifest/contract/pack stubs by reference; full authoring in owning steps.

Rule: no file here may contradict planning truth; new cross-module use follows the binding seam table
in planning repo `planning 07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md`.
