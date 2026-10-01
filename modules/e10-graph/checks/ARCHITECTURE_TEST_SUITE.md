---
record_id: V-TST-001
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e10-graph/checks/ARCHITECTURE_TEST_SUITE.md.snapshot"
metadata_origin_digest: "c2bb8c4824eeeab62ef21200ab6121eecf2df718ae8228d4c2506d1df9577bab"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Binding sources: `planning 07_AI_ARCHITECTURE/ARCHITECTURE_TESTS.md` (families + detection map + conformance shape); `planning 07_AI_ARCHITECTURE/COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX.md` (10 layers); `planning 07_AI_ARCHITECTURE/RULES/README.md` (rule→gate mapping). Companion: `VALIDATION_COMMANDS.md` (this step; command addresses + tiers). Install address: `modules/e10-graph/checks/` (suite spec alongside command specs)."
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "I-E10-REGISTRATION-BASELINE"
  - "V-E10-STRUCT-001"
  - "P-E10-003a"
implements:
  - "ADR-015 Decision3 record registration"
public_contracts: []
internal_scope: "Original document declarations and record custody; no new runtime authority"
tasks:
  - "T-E10-001"
  - "T-E10-003a"
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
metadata_verified_at: "2026-10-02"
---

# ARCHITECTURE TEST SUITE (INSTALLED — Phase-8 Step 3 REVIEWED PASS; OUT-3 B-19 header fix 2026-09-23)

Status: INSTALLED (round 1: independent review PASS, no open findings, 2026-09-22; installed to `modules/e10-graph/checks/ARCHITECTURE_TEST_SUITE.md`)
Record: `V-TST-001` (first claim in this draft; collisions rejected per identity standard)

Binding sources: `planning 07_AI_ARCHITECTURE/ARCHITECTURE_TESTS.md` (families + detection map + conformance shape);
`planning 07_AI_ARCHITECTURE/COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX.md` (10 layers); `planning 07_AI_ARCHITECTURE/RULES/README.md` (rule→gate mapping).
Companion: `VALIDATION_COMMANDS.md` (this step; command addresses + tiers). Install address:
`modules/e10-graph/checks/` (suite spec alongside command specs).

## Families: detection (verbatim) → algorithm in words → gate signal

1. Orphans → walk all records/files; flag any node with no owner, no `depends_on`/`used_by`, and no registry
   row → signal FAIL (R-002) with node list.
2. Broken links → resolve every reference (IDs, paths, contract pointers); flag dangling targets and any
   open-link label (MISSING/UNOWNED/BLOCKED/CONFLICT/UNVERIFIED) that a record hides → signal FAIL (R-014).
3. Forbidden dependencies → parse cross-module uses from manifests/code; flag any use without a declared
   allowed edge, and any use of a forbidden path → signal FAIL (R-003) with edge list.
4. Cycles → build dependency DAG from declared edges; flag any cycle → signal FAIL (R-003); E1↔E9-shaped
   cycles flagged as critical (seam table).
5. Ownerless public contracts → list every `public/` surface and contract record; flag surfaces with no
   owning capsule or no contract record → signal FAIL (R-011/R-012).
6. Untested critical behavior → list T3-class tasks; flag any without conformance record in `vault/EVIDENCE/`
   carrying all 8 shape fields → signal FAIL (R-013).
7. Stale context packs → compare each pack's `last_verified` against its task's; flag older packs →
   signal WARN-then-FAIL if used by an active task (R-005).
8. Identity collisions → index all slugs by (type, slug); flag duplicates (cross-type included) → signal
   REJECT, never merge (R-004/R-010; rename only via `supersedes` chain).

## Evidence + gating

- Every family writes conformance-shaped records (8 fields per `planning 07_AI_ARCHITECTURE/ARCHITECTURE_TESTS.md`) to `vault/EVIDENCE/`.
- Gate signals consumed by Step-4 CI (events/fail/merge) and by per-task review (R-006/R-007 manual gates);
  this suite defines signals, never CI wiring (Step 4 owns it).

## Non-goals

- No harness/CI implementation, no runner/vendor, no numeric thresholds (Phase-7 guardrail, repeated here
  so Step-4 scope stays honest). Simulation design excluded (Group-4 boundary).

## Acceptance of THIS draft

1. All 8 Phase-7 families present with detection→algorithm→signal unbroken (manual check vs source).
2. Conformance 8-field shape referenced, not redefined (manual check — no field-name drift).
3. No implementation/vendor/number selection (manual check).
4. Reviewer verdict PASS, zero open findings, different context (R-007).

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.

T-E10-003a custody-only maintenance adds actual specification/mandatory-pack consumers V-E10-STRUCT-001 and P-E10-003a, plus maintenance-task provenance. Original installed body, origin payload, last_verified and product/evidence scope remain unchanged; no detector implementation or historical proof refresh.
