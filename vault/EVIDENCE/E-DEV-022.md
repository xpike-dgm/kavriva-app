---
test_id: E-DEV-022
contract_id_version: "ADR-002 Decision 7; ADR-006 compatibility rules; T-E3-018 procedure v1"
subject_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/compatibility-hold.md.snapshot"
subject_digest: 2026af03133163820875b3a85e81896174cdcd170d05434099c78a6cca6d1421
result: "PASS for procedure and dated journal at 06e23f4: E10, exact-head CI and independent T3 re-review passed"
evidence_links:
  - "[[vault/PROFILES/compatibility-hold.md]]"
  - "[[vault/INVENTORIES/E3-COMPATIBILITY-CHANGELOG.md]]"
  - "[[vault/PACKS/P-E3-018.md]]"
  - "[[vault/REGISTRY/T-E3-018.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
gate_verdict: "PASS (procedure and dated journal only; owner accepted identified independent verdict)"
reviewer: "independent gpt-6-luna max subagent, PR #24 corrected document head 06e23f48824b7564e1efa61415a01f8d7e2c4b7d"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-022.md.snapshot"
metadata_origin_digest: "20640d7958d1e829967a0bd99a1b2a9ed84081b32dc887592975c8f4b14b621d"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for vault/PROFILES/compatibility-hold.md"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-015"
  - "E3-COMPATIBILITY-CHANGELOG"
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-018"
  - "T-E3-018"
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
subject_original_path: "vault/PROFILES/compatibility-hold.md"
historical_source_payloads:
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e03-server/MANIFEST.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/INVENTORIES/E3-COMPATIBILITY-CHANGELOG.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-018.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/compatibility-hold.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-018.md.snapshot"
---

# E-DEV-022 — Compatibility hold and dated journal

The procedure covers official advisories and observed drift, provider/runtime/dependency/security/default/schema/config/custody/object/recovery/message changes, dated record fields and complete consumer impact, hold-before-use, exact candidate/testing, independent/owner/E6 gates, controlled transition and scoped closure. Forced updates, known vulnerable software, in-flight uncertain effects, safe stop/support, monotonic negatives and rollback/reconciliation boundaries are explicit; no owner debugging or weakened safeguard is an escape.

The dated journal separates publication dates from observation dates and repository declarations from measured target inventory. It records the current pinned CI/config/dependencies and excluded services without claiming hosted versions. Three observations cover Storage schema/policy compatibility with PR #22's limited failure/remediation evidence, the 2026-09-25 PostgreSQL advisory observed on 2026-10-01, and API-key-family distinctions observed on 2026-10-01. Source pages/index were checked directly; no hosted applicability query or detection command ran. Every operational observation remains HELD. Initial Storage startup failure is not assigned an uncaptured SQL error.

Normalized CRLF-to-LF raw-byte digests: procedure 2026af03133163820875b3a85e81896174cdcd170d05434099c78a6cca6d1421; dated journal 584b24b9db9d21ddfe3ac83c0bd36978079d9e4c29b81921c3edc4a48cd9731f.

This is document-only work: no runtime/test/schema/workflow change, hosted inventory/query/credential access, service upgrade, release, deployment, watcher, automation, purchases or numeric polling/compatibility gates. Applicable E6 authority remains by existing reference, no new seam; T-E3-001-R1 REVIEW and physical activation HELD. Existing regression CI does not prove operational compatibility, target versions, untested services, monitoring or release readiness.

Baseline and post-change all 11 E10 checks passed; registry/routing indexes were regenerated and git diff --check passed. Exact initial document head e72458424c7b4b41c61b5197576a50f94f6fa21f passed applicable architecture/T3/E3/E5 and both isolated local Auth/Storage runs 36904048898 and 36904062276; E3 run 36904062535 passed 107 unchanged tests. On 2026-10-01 the owner explicitly accepted the identified independent verdict; T-E3-018 is DONE for the procedure and dated journal only.

Independent reviewer /root/pr24_independent_review (gpt-6-luna max) returned CHANGES_REQUESTED for e72458424c7b4b41c61b5197576a50f94f6fa21f: one P2 omission of the announced end-of-2026 legacy API-key deprecation deadline. The official guide was rechecked on 2026-10-01 and the deadline added, without asserting project migration or retirement. The same independent reviewer returned PASS with no findings for corrected head 06e23f48824b7564e1efa61415a01f8d7e2c4b7d. Owner acceptance is recorded; operational scope remains HELD.

The independent delegated gpt-6-luna max reviewer inspected the eight declared document/index files, canonical task/dependency/ADR/AI/boundary constraints, official provider sources and current repository pins/exclusions; checked dated facts, declared versus measured inventory, hold-before-change, security safe-stop, retained operations/reconciliation, floors and existing E6 gates. It independently ran all 11 E10 checks and diff --check, verified both normalized digests and applicable full-SHA CI. Its one P2 finding was corrected and re-reviewed with no remaining findings. Corrected head 06e23f48824b7564e1efa61415a01f8d7e2c4b7d passed architecture/T3/E3/E5 and isolated local Auth/Storage runs 36904915647 and 36904921827; the PR-event T3 passed and push-event T3 skipped by label condition. These unchanged regression checks prove no hosted compatibility or monitoring. The reviewer made no edits, GitHub approval, merge or hosted/credential operation. T-E3-018 is DONE for the procedure and dated journal only; physical activation and all operational compatibility closure remain HELD.

The same independent reviewer returned PASS with no findings for final review-record head f0f7acff68176bda1f77465f770eac437dec05e1 and its applicable green CI, including local Auth/Storage runs 36905419786 and 36905424178. On 2026-10-01 the owner accepted all identified verdicts and authorized continued work and subsequent merges after green CI and independent review, until revoked. This standing authorization does not turn failed reviews into acceptance or close unproven operational scope. No subject document changed in this acceptance record.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
