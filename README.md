---
record_id: D-APP-DOC-001
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/README.md.snapshot"
metadata_origin_digest: "338d0bff080a7b38c0dc9cfbb8a4c6d79cf71445128a2e7b6ee21c9086c5d55e"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Planning truth (design, decisions, traceability): `https://github.com/xpike-dgm/motobakim-plan` (authoritative; nothing here redefines it — this repo holds implementation truth, linked by stable IDs)."
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by: [I-E10-REGISTRATION-BASELINE, M-E10-001, V-CI-001, V-CMD-001, V-TST-001, V-E10-TOPO-001, I-E10-PATHS-001, P-E10-006, E-DEV-033]
implements:
  - "ADR-015 Decision3 record registration"
public_contracts: []
internal_scope: "Original document declarations and record custody; no new runtime authority"
tasks: [T-E10-001, T-E10-006]
tests:
  - "modules/e10-graph/checks/check_identity.py"
  - "modules/e10-graph/checks/check_conformance.py"
  - "modules/e10-graph/checks/check_links.py"
evidence:
  - "E-DEV-027"
supersedes: []
superseded_by: []
status: "BOOTSTRAP"
last_verified: "2026-10-01"
metadata_verified_at: "2026-10-01"
---

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

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.


## Current governed repository addresses (T-E10-006)

Current address policy: `modules/e10-graph/REPOSITORY_TOPOLOGY.md`; immutable tracked-base receipt: `vault/INVENTORIES/E10-GOVERNED-PATHS.md`. Earlier bootstrap/reservation statements retain their historical scope; actual installed addresses and individual evidence govern current scope. One planning repository and one application vault remain; existing configuration/profile/inventory/archive addresses are explicitly mapped, with no product authority or production-readiness claim.
