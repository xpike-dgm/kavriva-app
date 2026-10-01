---
record_id: V-MIG-001
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e10-graph/MIGRATION_ROLLBACK_APPLICABILITY.md.snapshot"
metadata_origin_digest: "8359a2ca86228b591bf88930cc45498e721b90d9b79aa041a127aae820321979"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Binding sources (single truth, not copied): `planning 07_AI_ARCHITECTURE/MIGRATION_POLICY.md` (migration rules by reference to ADR-007/ADR-003); `planning 07_AI_ARCHITECTURE/ROLLBACK_STRATEGY.md` (rollback-as-new-event, quarantine, floors, task-level safe return); `planning 07_AI_ARCHITECTURE/DESIGN_CONSISTENCY_AND_CHANGE.md` + `planning 07_AI_ARCHITECTURE/CHANGE_CONTROL.md` (change-invoked re-validation); `DEC-0030` (destructive-change owner approval); Step-2 manifests (per-module change/rollback sections, which this file makes applicable — it writes no new module rule). Install address: `kavriva-app/modules/e10-graph/` (applicability matrix; procedures live with owning modules)."
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "I-E10-REGISTRATION-BASELINE"
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

# MIGRATION AND ROLLBACK APPLICABILITY (INSTALLED — Step-6 REVIEWED PASS; OUT-3 B-19 header fix 2026-09-23)

Status: INSTALLED (Step-6 matrix REVIEWED PASS + installed 2026-09-22; coverage mapping added 2026-09-23, OUT-3 B-21)
Record: `V-MIG-001` (first claim in this draft; collisions rejected per identity standard)

Binding sources (single truth, not copied): `planning 07_AI_ARCHITECTURE/MIGRATION_POLICY.md` (migration rules by
reference to ADR-007/ADR-003); `planning 07_AI_ARCHITECTURE/ROLLBACK_STRATEGY.md` (rollback-as-new-event, quarantine, floors, task-level
safe return); `planning 07_AI_ARCHITECTURE/DESIGN_CONSISTENCY_AND_CHANGE.md` + `planning 07_AI_ARCHITECTURE/CHANGE_CONTROL.md` (change-invoked re-validation);
`DEC-0030` (destructive-change owner approval); Step-2 manifests (per-module change/rollback sections, which
this file makes applicable — it writes no new module rule). Install address: `kavriva-app/modules/e10-graph/`
(applicability matrix; procedures live with owning modules).

## Applicability matrix (module → policy → procedure → verified by)

| Module | Policy source | Applicable procedure (owned by module manifest) | Verified by |
|---|---|---|---|
| e01-app | Rollback strategy (epoch honored; no resurrection) | client rollback honors epoch/floors; revoked stays revoked | T2 edge/epoch checks + split tests |
| e02-panel | Change control (decisions never silently edited) | UI rollback only; recorded decisions supersede, never edit | independence + R-010 chain check |
| e03-server | Migration policy + rollback strategy (quarantine, floors, generations never backward) | staged rollout fields; restore lands in quarantine with reconciliations; fenced violations fatal | T3 full set + quarantine drills |
| e04-offline | Rollback strategy (restore-in-quarantine; recovery closure first) | package rollback = staged accept→verify→atomic; restore in quarantine | package negatives + quarantine tests |
| e05-identity | Rollback strategy (no resurrection of revoked authority) | epoch honored edge-wide; sessions/keys cancelled; no quiet re-grant | split + recovery negatives |
| e06-release | Migration policy (same controlled path or suspend + corrected release) | release rollback is lethal-error route only, never routine; recalled → quarantine | seal/promotion + brake tests |
| e07-build-lane | Migration policy via E6 (execution proves compliance) | lane reruns are retries, never release rollbacks; policy-drift rejected | compliance + separation tests |
| e08-content | Migration policy (re-derive, never blind-restore) | plane changes version; fallback = shrunken base, never weakened operation | derivation + boundary tests |
| e09-ai | Rollback strategy via task-level safe return | disable AI path → AI-free continuation; never-list only grows by review | flow + never-list negatives |
| e10-graph | Change control + R-010 (history never rewritten) | tooling rollback keeps supersede chains intact; schema changes carry impact note | closure + R-010 checks |

## Cross-module rules (invoked, not redefined)

- Rollback-as-new-event to still-trusted compatible artifacts only; no binary restore; no silent discard of
  valid data; never erases the intervening record or cancels reach-back.
- Destructive/irreversible changes invoke higher-assurance tier + owner approval per Protocol/`DEC-0030`.
- Task-level safe return = BLOCKED / change-request + R-009 (not a new rollback class).

## Verifier coverage note (2026-09-23, OUT-3 B-21 — honest mapping, no new check invented)

"Verified by" above names manifest-level test families (future product tests), NOT check-script names.
Machine coverage today: check_edges (direction + denylist + DAG), check_identity (R-010 status/collision part),
check_conformance (evidence shape). The rest (quarantine drills, seal/promotion, brake, derivation, flow,
never-list, compliance, separation, split/recovery negatives) are DEFERRED to Development with the product code
they test — recorded here, not hidden. Checklist item 8 is therefore declaration-level until then.

## Non-goals

- No new migration/rollback rule authored here (matrix points at policies + manifests); no tool/vendor/CI
  selection; no numeric windows; no operation — Phase-8 constrains, tasks operate.

## Acceptance of THIS draft

1. Every module owns exactly one matrix row pointing at its manifest + a policy (manual check — no orphan module).
2. No rule redefined or contradicted (manual check vs the three Group-5 sources + DEC-0030).
3. Reviewer verdict PASS, zero open findings, different context (R-007).

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
