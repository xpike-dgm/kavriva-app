---
record_id: V-REG-001
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e10-graph/TASK_REGISTRY.md.snapshot"
metadata_origin_digest: "91b2e869a8e7cd9a3a5dae85c861b45f277692fdc7a2de189c6662b14c2976a2"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Binding sources (single truth, not copied): `planning 07_AI_ARCHITECTURE/GRAPH_METADATA_AND_IDENTITY_STANDARD.md` (task-registry section: `planning 06_DELIVERY_PLANNING/TASK_INDEX.md` frozen planning truth, 7 columns; READY-lifecycle only on the physical registry with explicit migration/`supersedes` rule; `Evidence` is a Phase-8 field); `planning 07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md` (lifecycle states + CHANGES_REQUESTED loop + different-chat review); `planning 07_AI_ARCHITECTURE/CONTEXT_PACKS/PACK_STANDARD.md` (14 fields); `planning 07_AI_ARCHITECTURE/COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX.md` (10 layers). Install address: `kavriva-app/vault/REGISTRY/` (per-task records) + `vault/INDEX/` (generated JSON only)."
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "E-PR-001"
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-001-R1"
  - "P-E5-003"
implements:
  - "ADR-015 Decision3 record registration"
public_contracts: []
internal_scope: "Original document declarations and record custody; no new runtime authority"
tasks:
  - "T-E10-001"
tests:
  - "modules/e10-graph/checks/check_identity.py"
  - "modules/e10-graph/checks/check_conformance.py"
  - "modules/e10-graph/checks/check_links.py"
evidence:
  - "E-DEV-027"
supersedes: []
superseded_by: []
status: "INSTALLED"
last_verified: "2026-10-01"
metadata_verified_at: "2026-10-01"
---

# TASK REGISTRY (INSTALLED — Phase-8 Step 5 REVIEWED PASS; OUT-3 B-19 header fix 2026-09-23)

Status: INSTALLED (round 1: independent review PASS, no open findings, 2026-09-22; installed to `modules/e10-graph/TASK_REGISTRY.md`)
Record: `V-REG-001` (first claim in this draft; collisions rejected per identity standard)

Binding sources (single truth, not copied): `planning 07_AI_ARCHITECTURE/GRAPH_METADATA_AND_IDENTITY_STANDARD.md` (task-registry section:
`planning 06_DELIVERY_PLANNING/TASK_INDEX.md` frozen planning truth, 7 columns; READY-lifecycle only on the physical
registry with explicit migration/`supersedes` rule; `Evidence` is a Phase-8 field); `planning 07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md`
(lifecycle states + CHANGES_REQUESTED loop + different-chat review); `planning 07_AI_ARCHITECTURE/CONTEXT_PACKS/PACK_STANDARD.md` (14 fields);
`planning 07_AI_ARCHITECTURE/COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX.md` (10 layers). Install address: `kavriva-app/vault/REGISTRY/`
(per-task records) + `vault/INDEX/` (generated JSON only).

## Physical schema (8 columns = 7 planning + 1 Phase-8)

Task ID | Flow/Feature | Objective | Depends On | Context Pack | Acceptance | Evidence | Status.
`Evidence` (new): conformance-shaped record pointers in `vault/EVIDENCE/` (8 fields per Step-3 suite);
empty until the task produces evidence — never backfilled, never fabricated.

## Record form (Obsidian-native; no registry software selected here)

- One Markdown file per task in `vault/REGISTRY/`, filename = stable task slug (e.g. `vault/REGISTRY/T-E3-001.md`);
  YAML frontmatter carries the 8 columns + identity metadata (`status`/`last_verified`, `supersedes`, owner).
- `vault/INDEX/` JSON is GENERATED from records (never hand-edited); readers consume records or index,
  writers touch records only.

## Migration / `supersedes` rule (binding)

- Planning `planning 06_DELIVERY_PLANNING/TASK_INDEX.md` stays frozen: never edited, never copied-then-diverged.
- Each physical row is a NEW record reusing the stable planning Task ID, with frontmatter `supersedes`
  pointing at the planning row; planning rows keep `PROPOSED` (planned, never executed there).
- READY-lifecycle (READY→CLAIMED→IN_PROGRESS→REVIEW→DONE + BLOCKED/CANCELLED/CHANGES_REQUESTED loop)
  applies ONLY here. First status on migration: READY iff Depends-On all DONE, else BLOCKED-by-dependency
  (declared, not hidden).

## Lifecycle ownership (by reference, not redefined)

- Claim/progress/report per `planning 07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md`; reviewer must be a different chat (R-007);
  CHANGES_REQUESTED→narrow remediation→different-chat re-review→REVIEW; no silent state skips.
- CANCELLED entry/exit per protocol (records archived, dependents re-planned).

## Non-goals

- No registry software/automation selection (templates + GitHub automation only, DEC-0051); no API actuation;
  no numeric SLAs; no editing of planning truth.

## INDEX concurrency + throughput rule (OUT-3 B-35, 2026-09-23)

- `vault/INDEX/*.json` are GENERATED artifacts (builders: `build_index.py`, `routing_run.py`); never hand-edited.
  Concurrent branches each regenerate on merge — hand-merged INDEX content is rejected (CI reproducibility step).
- No CI-time target and no per-owner carry quota by design (Phase-7 guardrail: no numeric gates); observed runs
  9–11s are measurements, not targets.

## Epic-edge migration rule (OUT-3 B-15, 2026-09-23)

At row migration (Development scope), EPIC_CATALOG dependency cells inject into each epic's root tasks'
`depends_on` as epic-gate records: E1 roots gain E3+E5+E4 gates, E2 roots E3+E5+E8-outputs, E4 roots E3,
E5 roots E3, E6 roots E3+E5, E7 roots E3+E6, E8 roots E3, E9 roots E3+E1 (propose/render direction preserved).
A task-level `depends_on` path, where one exists, satisfies its epic gate without duplication (recorded once).

## Acceptance of THIS draft

1. 8th column + record form + migration rule present with planning truth frozen (manual check).
2. Lifecycle states match protocol exactly, no invented state (manual check).
3. No software/vendor/numeric selection (manual check).
4. Reviewer verdict PASS, zero open findings, different context (R-007).

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
