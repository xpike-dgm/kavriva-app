# kavriva-app — Implementation Repository (skeleton)

Status: SKELETON ONLY (installed 2026-09-22 from Step-1 directory blueprint, REVIEWED PASS; no module
contents, records, or CI yet — those arrive in their owning Phase-8 steps).

Planning truth (design, decisions, traceability): `https://github.com/xpike-dgm/motobakim-plan`
(authoritative; nothing here redefines it — this repo holds implementation truth, linked by stable IDs).

## Map

- `.github/workflows/` — address reserved; CI contents HELD for Step 4.
- `vault/` — Obsidian-compatible graph: `REGISTRY/` (physical task registry), `PACKS/` (context packs),
  `CONTRACTS/` (binding contract records, defined-by-reference), `EVIDENCE/` (completion evidence),
  `INDEX/` (generated JSON only). Vault layout decided by Step-1 blueprint.
- `modules/e01-app/` … `modules/e10-graph/` — one capsule per epic (E1 consumer mobile … E10 graph
  infrastructure). Each will carry `MANIFEST.md` + `public/` + `internal/` + `tests/` in Step 2.
- `templates/` — manifest/contract/pack stubs by reference; full authoring in owning steps.

Rule: no file here may contradict planning truth; new cross-module use follows the binding seam table
in planning repo `07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md`.
