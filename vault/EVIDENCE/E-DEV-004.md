---
test_id: E-DEV-004
contract_id_version: authorization-tuple v1 + ADR-004 Decision 1 + ADR-006 Decisions 2 and 3; T-E3-001-R1 maintenance slice
subject_digest: 73E6DA06B8384C417CE7223E99BDA768901FC704B30B7D68A3840E711D319372
subject_file: vault/EVIDENCE/SNAPSHOTS/E-DEV-004-maintenance_store.py
adapter_digest: 9150EABDC24B5D47C72A3BCDFA4A0563C8D7F12FAB3DDB511CFD909E142646D1
gate_digest: 41DB48BBEDAEE594B922050AC13EB5A39AE2EB2EDD7BDE61A1E017DE8EB84EC7
schema_digest: 66BFAA43A7322FD24E906AAEEA1355A956910C6FC931A3D93190512898EBA509
result: "RECORDED (27 E3 and 9 E5 tests passed locally; 11 maintenance PostgreSQL tests)"
evidence_links:
  - "[[vault/PACKS/P-E3-001-R2.md]]"
  - "[[vault/REGISTRY/T-E3-001-R1.md]]"
  - "modules/e03-server/public/commit_authorization.py"
  - "modules/e03-server/internal/postgres_commit_authorization.py"
  - "modules/e03-server/internal/maintenance_store.py"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-004-maintenance_store.py"
  - "modules/e03-server/tests/test_maintenance_store.py"
  - "supabase/migrations/20260924131747_e3_maintenance_records.sql"
  - "[[vault/EVIDENCE/E-DEV-002.md]]"
gate_verdict: "PASS for PR #6 maintenance slice only; product DONE awaits production bindings"
reviewer: "Codex separate-chat context 01a0e8c9-7f86-7a43-9ab4-bd7978e0da26, owner-relayed scoped approval for code head 20e7c5b on 2026-09-28"
timestamp: 2026-09-24
status: RECORDED
last_verified: 2026-09-30
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-004.md.snapshot"
metadata_origin_digest: "2a2063f7374cd36d069165ff12ee926055152292d61cd61a28e7fba1778634c9"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for vault/EVIDENCE/SNAPSHOTS/E-DEV-004-maintenance_store.py"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-001-R2"
  - "P-E3-001-R3"
  - "T-E3-001-R1"
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
historical_source_payloads:
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-002.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-005.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-001-R2.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-001-R1.md.snapshot"
---

# E-DEV-004 — Maintenance integration slice

The owner selected maintenance record create/edit as the first effect to protect. This slice adds private motorcycle and versioned maintenance record tables. A write appends a new revision while retaining prior values, actor, time, operation and correction reason. A user-entered entry is fixed to `USER_REPORTED`; it does not claim that work was verified or reset a maintenance schedule.

The PostgreSQL adapter now accepts a caller-supplied current reader on its own transaction connection. Without that reader it returns HELD; the old precomputed authorization row can be read only with an explicit test-fixture flag. A bare ALLOW result from a reader is also held. The maintenance test composes a locked E3 motorcycle or record read with E5's real locked session, grant, epoch and policy reader, then performs an actual maintenance record create or edit on that same connection. The test denies a revoked session despite cached ALLOW, denies a changed resource classification, and proves an in-flight E5 revocation waits for the record transaction. It also verifies append-only correction history, stale generation rejection, rollback, and denied client-role access. The migration was created with Supabase CLI v2.117.0 and applied only to an isolated native PostgreSQL test server.

The integration's remaining tuple fields for operation intent, protected audit, negative floors and runtime compatibility are explicit **test fixtures**. The test also supplies identity lookup hints; there is no production authentication ingress or E5 session/grant writer. These facts prevent a production ALLOW claim. No account, remote database, live user, deployed API or privileged capability was touched. T-E3-001-R1 stays CHANGES_REQUESTED and T-E5-003 stays IN_PROGRESS. A separate T3 reviewer must inspect this slice before it can be merged or any task verdict can advance.

For PR #6 code head `951d45f`, [E3 native PostgreSQL tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36006471381), [E5 native PostgreSQL tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36006471327), and [architecture checks](https://github.com/xpike-dgm/kavriva-app/actions/runs/36006471362) passed. At that point the automatic T3 job was skipped and no human second-eye verdict had been recorded.

On 2026-09-28 a separate reviewer examined PR #5 as the latest merged PR and **rejected a T-E3-001 completion claim**. PR #5 only corrected two evidence/registry sentences and cannot satisfy product acceptance. It was merged after the owner's approval without the required different-chat T3 review; that process gap is acknowledged, not counted as a task approval. This verdict did not review PR #6's implementation. PR #6 remains draft pending its own independent T3 review, and both product tasks retain their blocked/in-progress states.

On 2026-09-28 the owner relayed a **rejection of PR #6 merge approval** in this same chat. The verdict accepts the narrow maintenance slice's test evidence but identifies no recorded review from a different chat. This same-chat verdict is feedback, not the required independent T3 approval. The reviewer also confirmed that test fixtures and absent production identity/E5 writers, operation intent, protected audit, negative floors and runtime binding prevent T-E3-001-R1 from being DONE. PR #6 stays open and draft; no merge or task completion is authorized by this verdict.

The owner subsequently relayed a different-chat review of PR #6 code head `20e7c5b` on 2026-09-28. Its separate Codex context is `01a0e8c9-7f86-7a43-9ab4-bd7978e0da26` (model not exposed). Its verdict **approved the maintenance slice only**: same-transaction target locking and write, retained correction revisions, `USER_REPORTED` status, HELD without a production reader, explicit fixture mode and rejection of bare ALLOW. The reviewer confirmed green E3/E5/architecture checks but observed the T3 job was skipped, the PR was draft, and GitHub had no submitted review. The scoped verdict supersedes the earlier same-chat merge rejection only as an independent code assessment. The PR is now ready and its T3 automation passed; the separate-chat verdict is recorded here and in the planning repository's [review log](https://github.com/xpike-dgm/motobakim-plan/blob/main/08_REPOSITORY_BOOTSTRAP/EVIDENCE/REVIEW_LOG.md) through merged plan PR #1 (`47c5f90`). The reviewer expressly withholds T-E3-001-R1 DONE because production identity, E5 writers, operation intent, protected audit, negative floors and runtime binding remain absent.

A separately delegated Luna Max sub-agent then reviewed PR head `a26aac3` read-only. It also approved the narrow maintenance code and withheld merge and DONE for the documented review and production gaps. This supplementary sub-agent result is not used as the mandatory non-subagent T3 review leg under DEC-0064. The T3 automation passed on `a26aac3` after the `t3-privileged` label was applied, but it runs conformance and identity checks, not the human review.

The owner confirmed on 2026-09-28 that they are the project's only human. GitHub accounts `xpike-dgm` and `glix-dgm` must not be represented as two independent people. The review request sent to `glix-dgm` was withdrawn. The active `main-gates` ruleset requires a PR and green checks but sets required GitHub approving reviews to zero; the project's separate-chat review and evidence rules remain in force. No second human or alternate-account self-approval is required or claimed.

Historical closure: PR #6 merged on 2026-09-30 as `310994165909b1208b8607a4349b208cd8ef8fdf`. Its limited proof and independent scoped review are unchanged. The later consumer login and authority integration is recorded together in `[[vault/EVIDENCE/E-DEV-005.md]]`, not retroactively attributed to PR #6.

The original PR #6 maintenance writer is preserved byte-for-byte at `vault/EVIDENCE/SNAPSHOTS/E-DEV-004-maintenance_store.py` so this evidence's subject digest continues to identify the reviewed code after later task-level changes to the live writer.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
