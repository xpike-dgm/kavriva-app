---
test_id: E-DEV-012
contract_id_version: "ADR-002 Decision 6; ADR-006 Decision 11; T-E3-008 AI task-scope rules"
subject_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/ai-task-scope.md.snapshot"
subject_digest: 3FFF1CFC8210981A00EB824C260A5DD0FB5263C79DE2AF7AFCE7D86A3AD3BDDC
result: "PASS for rule-only scope at efdce08; E10 11 checks, PR CI and independent review passed; owner accepted identified verdict on 2026-10-01"
evidence_links:
  - "[[vault/PROFILES/ai-task-scope.md]]"
  - "[[vault/PACKS/P-E3-008.md]]"
  - "[[vault/REGISTRY/T-E3-008.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
  - "[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]"
gate_verdict: "PASS (rule-only scope; owner accepted identified independent verdict under DEC-0069)"
reviewer: "independent gpt-5.6-luna max subagent, PR #14 head efdce08ce8854767b41189e938b66ba10f2551a7"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-012.md.snapshot"
metadata_origin_digest: "1095d62c3686f3d7fdd1405a1333c389b2360288b4b22b665b6d50726c6b785e"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for vault/PROFILES/ai-task-scope.md"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-008"
  - "T-E3-008"
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
subject_original_path: "vault/PROFILES/ai-task-scope.md"
historical_source_payloads:
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e03-server/MANIFEST.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-008.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/ai-task-scope.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-008.md.snapshot"
---

# E-DEV-012 — AI task-scope rule

The profile names required task, environment, target, operation, grant, limit, dry-run, review and evidence fields. It forbids owner/billing credentials, `service_role`, unrestricted SQL/SSH, global object access, recovery/signing keys and AI self-approval. Negative examples require fail-closed behavior for absent/revoked scope, environment drift, cross-tenant target, leaked credentials and mismatched writes. The E3 manifest references this rule. On 2026-10-01, `python modules/e10-graph/checks/run_all.py` passed all 11 checks and `git diff --check` passed. PR #14 head `efdce08ce8854767b41189e938b66ba10f2551a7` had green architecture, T3, E3, E5 and live-auth CI. An independent `gpt-5.6-luna` subagent at max reasoning reviewed that exact head and returned PASS with no blocking findings for the rule-only task. The reviewer also returned PASS for the final record delta at a1e329abb02cd74f0520af9170496a7aa59151f3. On 2026-10-01 the owner explicitly accepted that identified verdict under DEC-0069. T-E3-008 is DONE for the rule specification scope only.

This is a document rule. No broker, scoped AI credential, live provider role, secret rotation, production tool gate or hosted access was created or proved. Earlier administrative migration access is preserved as history, not as compliance evidence. T-E3-001-R1 remains REVIEW.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
