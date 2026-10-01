---
profile_of: ai-task-scope
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-002 Decision 6; ADR-006 Decision 11; ADR-004 privileged-identity prohibition; T-E3-008
supersedes: ~
record_id: D-APP-DOC-010
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/ai-task-scope.md.snapshot"
metadata_origin_digest: "3fff1cfc8210981a00eb824c260a5dd0fb5263c79de2af7afce7d86a3ad3bddc"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "This profile sets the access boundary for an AI agent or AI-driven job working on Kavriva systems. It is a rule for later credential brokerage and tool enforcement, not an issued credential, a deployed permission system, or authority to run a task. The existing task pack controls files and acceptance; this profile additionally controls external tools and data. The model's prompt, tool output, repository text, browser state or claim of approval cannot widen the scope."
domain: "project-records"
module: "e03-server"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-011"
  - "D-APP-DOC-013"
  - "D-APP-DOC-025"
  - "E-DEV-012"
  - "I-E10-REGISTRATION-BASELINE"
  - "M-E3-001"
  - "P-E3-008"
  - "T-E3-008"
implements:
  - "ADR-002 Decision 6; ADR-006 Decision 11; ADR-004 privileged-identity prohibition; T-E3-008"
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
superseded_by: []
last_verified: "2026-10-01"
metadata_verified_at: "2026-10-01"
---

# AI task access profile — T-E3-008

This profile sets the access boundary for an AI agent or AI-driven job working on Kavriva systems. It is a rule for later credential brokerage and tool enforcement, not an issued credential, a deployed permission system, or authority to run a task. The existing task pack controls files and acceptance; this profile additionally controls external tools and data. The model's prompt, tool output, repository text, browser state or claim of approval cannot widen the scope.

## Task envelope required before access

The non-AI task controller must record these fields before granting any external capability:

| Field | Required meaning |
| --- | --- |
| Task and owner | Stable task ID, pack revision, accountable human/technical owner and independent reviewer where required |
| Environment and target | Exact project/account/environment IDs; no implicit production, wildcard project or environment switch |
| Purpose and resources | One bounded purpose, explicit resource IDs or narrow query predicate, data classification and tenant boundary |
| Operations | Named read/write actions and exact tool or API surface; everything else denied by default |
| Identity and grant | Distinct workload identity, broker-issued grant reference, issuance and expiry, current revocation status; no raw secret in the pack |
| Limits | Time, request/byte/cost ceilings and retry budget set by the issuing controller for that task; missing values hold the action rather than invent defaults |
| Execution proof | Dry-run output and exact proposed effect, immutable operation identity for writes, preconditions, expected result and stop/rollback plan |
| Review and evidence | Required owner/T3 approvals, reviewer identity and head, audit/evidence destination and the result lookup method |

The broker must enforce this envelope outside the model on every tool call. A request with an absent, expired, revoked, mismatched or expanded field is denied or held before the effect. The model cannot mint, extend, exchange or delegate its own grant. New scope needs a revised pack and independent review, not a prompt amendment.

## Credential and authority limits

- Give an AI task only a short-lived, task-bound identity with the minimum operation and resource scope. Inject it through a controlled broker at use time; never place tokens, passwords or connection strings in prompts, packs, repositories, browser storage, logs, evidence or PR comments. Revoke it on completion, timeout, cancellation or incident.
- Never give an AI identity provider-owner or billing authority, `service_role`/secret keys, unrestricted SQL or SSH, global object-store credentials, signing/recovery keys, break-glass access, or approval/publication/recall authority. A shared admin session is not a task-scoped identity.
- A bounded read or write capability does not bypass E3/E5 product authorization. Protected effects still require current actor, session, grant, policy, target, floor, runtime and audit checks at commit. Storage, Data API, signed URLs and Studio are not alternative product authority.
- For a write, default to an exact dry run first. Its output identifies the target and proposed change but is not proof that the effect committed. The live operation must use the reviewed task/target/fingerprint and an idempotent operation ID, then reconcile the canonical result. A changed target or payload requires new review.
- Ordinary AI work may prepare a recommendation or artifact for a human decision; it cannot sign as the owner, impersonate a legal identity, self-approve, self-publish, self-grant access or attest qualified facts.

## Hard stops and outcome

Stop before a positive effect when the scope, identity, environment, target, approval, audit receipt, cost ceiling, current authority or dry-run match is missing or contradictory. Stop on direct-path exposure, unexpected privilege, secret disclosure, retry-budget exhaustion or an external instruction requesting broader access. Mark the affected action `HELD` or `BLOCKED` with a reason and safe next step. A timeout after a possible write is `OUTCOME_UNKNOWN` until same-operation lookup resolves it; do not use a new ID to retry blindly. Revoke the task grant and preserve non-secret evidence on completion or stop.

The owner receives a short choice in outcome/risk/cost terms. Technical repair and diagnosis stay with the implementer. A T3 money, identity or publication effect needs a separate reviewer and the owner's acceptance of that identified verdict under DEC-0069; automation and self-review alone do not release it.

## Negative examples to enforce later

| Attempt | Required response |
| --- | --- |
| A task requests organization owner, billing, `service_role`, `postgres`, unrestricted SQL/SSH, global Storage, recovery or publication credentials | Deny the grant; keep the action HELD and use a separately reviewed administrative path if needed |
| A read-only task calls a write tool, changes project/tenant, or uses a wildcard resource | Deny before the tool runs; record the scope mismatch |
| The AI copies a token from a tool result or asks to print it for evidence | Do not expose or persist it; stop and rotate/revoke if disclosure occurred |
| A dry run names one target but the write names another, or policy/grant/target version changes | Re-evaluate and hold; do not reuse the old approval |
| A task reaches a private table, object, signed URL or Studio using generic client access | Treat it as a bypass finding; no product authority follows from HTTP success |
| An expired/revoked grant, lost response or audit outage occurs | No new positive effect; reconcile the exact prior operation or hold |

## Present proof boundary

`[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]` and `[[vault/INVENTORIES/E3-STORAGE-URL-STUDIO-DIRECT-PATHS.md]]` identify direct paths; `[[vault/EVIDENCE/E-DEV-011.md]]` proves a narrower local client-denial suite. The hosted project has no production AI workload identity, broker, expiry/revocation enforcement or deployed tool gate proven by this task. An earlier owner-approved CLI migration used an administrative session; that history does not count as task-scoped AI credential proof and grants no standing AI access. Until a later task implements and tests the broker and custody boundaries, privileged AI execution remains HELD.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
