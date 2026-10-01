---
record: E-PR-002-TRANSCRIPT
status: RECORDED
record_id: D-APP-DOC-005
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-PR-002-TRANSCRIPT.md.snapshot"
metadata_origin_digest: "6dbd1d60e445f490a1523b42614070f758954205763b754d14b6255825e446ca"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Ruleset creation (app): {\"enforcement\":\"active\",\"id\":23876055,\"name\":\"main-gates\"} Ruleset creation (plan): {\"enforcement\":\"active\",\"id\":23876098,\"name\":\"main-gates\"} Rules: PR + 1 approval + dismiss-stale + required check \"checks\" (app only) + no-FF + no-deletion; bypass = owner role."
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "E-PR-002"
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
last_verified: "2026-10-01"
metadata_verified_at: "2026-10-01"
---

# E-PR-002 transcript — branch-protection probe (machine record, not prose)

Ruleset creation (app):
`{"enforcement":"active","id":23876055,"name":"main-gates"}`
Ruleset creation (plan):
`{"enforcement":"active","id":23876098,"name":"main-gates"}`
Rules: PR + 1 approval + dismiss-stale + required check "checks" (app only) + no-FF + no-deletion; bypass = owner role.

Rejection probe (bypass removed, empty commit 9b3ea0e pushed):
`remote: error: GH013: Repository rule violations found for refs/heads/main.`
`remote: - Changes must be made through a pull request.`
`remote: - Required status check "checks" is expected.`
Probe reset locally (`git reset --hard HEAD~1`); HEAD back at 4d11ed6; bypass restored; no residue.

Owner-bypass push confirmation (E-PR-002 commit push):
`remote: Bypassed rule violations for refs/heads/main:`
`remote: - Changes must be made through a pull request.`

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
