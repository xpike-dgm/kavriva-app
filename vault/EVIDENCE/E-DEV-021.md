---
test_id: E-DEV-021
contract_id_version: "ADR-002 Option A and Decisions 1 and 6; ADR-006 Decision 11; T-E3-017 rules v1"
subject_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/secret-custody-rotation.md.snapshot"
subject_digest: 8e3105ab3bddc98cb14512b1d8c49f5b8963b3cabddcf06d8e410cb244c8e8be
result: "PASS for rules document at ceb2ae4: E10, exact-head CI and independent T3 review passed"
evidence_links:
  - "[[vault/PROFILES/secret-custody-rotation.md]]"
  - "[[vault/PACKS/P-E3-017.md]]"
  - "[[vault/REGISTRY/T-E3-017.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
gate_verdict: "PASS (rules document only; owner accepted identified independent verdict)"
reviewer: "independent gpt-6-luna max subagent, PR #23 document head ceb2ae4babdd019e09bf7a284e9e6a8685227dee"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-021.md.snapshot"
metadata_origin_digest: "4b7cc878b36c7f1a49e6ac4c1b47c3c4f63886ec1ea5e85dd1e28ee1fc15274f"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for vault/PROFILES/secret-custody-rotation.md"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-025"
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-017"
  - "T-E3-017"
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
evidence: []
supersedes: []
superseded_by: []
metadata_verified_at: "2026-10-01"
subject_original_path: "vault/PROFILES/secret-custody-rotation.md"
historical_source_payloads:
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e03-server/MANIFEST.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-017.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/secret-custody-rotation.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-017.md.snapshot"
---

# E-DEV-021 — Secret custody and rotation rules

The document covers bounded database credentials, privileged Supabase API keys/legacy service-role keys, Auth signing material, user tokens, public configuration, administrative/support/recovery access, cross-plane/worker credentials and isolated CI fixture material. It defines a references-only custody record, separate environments/components, protected injection/redaction/artifact handling, narrow technical actors and ordinary AI prohibitions. Current maintenance configuration is named accurately: bounded database DSN plus public URL/issuer/publishable Auth input; cached configured process/connection consumers must be recreated and verified during later cutover.

Planned rotation has prepare/stage/cutover/verify/retire/close steps, each with evidence and stop rules. Replacement creation is not old-key retirement; signing trust/cache, database connections, provider API keys, product grants/sessions and URLs are distinct. Compromise requires containment/revocation rather than graceful overlap of a known compromised key; partial/unknown outcomes reconcile canonical operations; safe rollback never restores compromised/revoked access or lowers floors. Provider outage recovery stays with named technical/external actors, not owner SQL/SSH/debugging. Later privileged execution requires its own scoped T3 review and owner acceptance.

Official Supabase API/signing guidance and changelog were checked on 2026-10-01 and linked in the profile. This task changes no runtime, tests, schemas, workflow, account, provider key/password/role/session or secret store; retrieves no secrets; authorizes no purchases or rotation. No numeric limits/schedules are invented. All operational custody/rotation/recovery proof is HELD; T-E3-001-R1 remains REVIEW and physical activation remains HELD. T-E3-018 compatibility procedure remains separate. Existing regression CI does not prove live custody or rotation.

Baseline and post-change all 11 E10 checks passed; registry/routing indexes were regenerated and git diff --check passed. Exact document head ceb2ae4babdd019e09bf7a284e9e6a8685227dee passed applicable architecture/T3/E3/E5 and both isolated local Supabase Auth/Storage CI runs 36901471368 and 36901480042. E3 run 36901479942 passed all 107 unchanged tests. The PR is labelled t3-privileged; PR-event automated T3 passed, push-event T3 skipped by its label condition. Automated checks and existing runtime tests do not prove live custody/rotation or substitute for independent review.

Independent delegated gpt-6-luna max reviewer /root/pr23_independent_review returned PASS with no findings for exact document head ceb2ae4babdd019e09bf7a284e9e6a8685227dee. It inspected the seven declared document/index files, task/ADR/AI/boundary constraints, current maintenance configuration and official provider key/signing guidance; verified custody and planned/emergency/partial/outage rules, product authority and live HELD limits; independently ran all 11 E10 checks and diff --check; verified normalized profile digest and full-SHA applicable green CI. It performed no edits, GitHub review/approval, merge, secret retrieval or provider operation. The same reviewer returned PASS for metadata head d0581d71da573128ce1816b4af33d15d2198189b and its applicable exact-head green CI, including local Supabase runs 36902173312 and 36902178560. On 2026-10-01 the owner explicitly accepted this identified independent verdict under DEC-0069. T-E3-017 is DONE for the custody/rotation rules document only; actual custody, rotation, recovery and physical activation remain HELD. The subject profile and digest are unchanged by this acceptance record.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
