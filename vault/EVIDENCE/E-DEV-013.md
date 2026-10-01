---
test_id: E-DEV-013
contract_id_version: "ADR-001 Decision 1; T-E3-009 logical domain authority registry v1"
subject_file: vault/REGISTRY/domain-authorities.json
subject_digest: 422D96C8F95D5A083357B11525D6F277F2678B9701728556607352CBD88A378B
result: "PASS for logical registry scope at 0b9a459; 13 registry tests, 11 E10 checks and PR CI pass; owner accepted identified verdict on 2026-10-01"
evidence_links:
  - "[[vault/PROFILES/domain-authority-registry.md]]"
  - "[[vault/PACKS/P-E3-009.md]]"
  - "[[vault/REGISTRY/T-E3-009.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
gate_verdict: "PASS (logical registry scope only; owner accepted identified independent verdict under DEC-0069)"
reviewer: "independent gpt-5.6-luna max subagent, PR #15 head 0b9a459bb32a43cbc7ec028d71beaa1d2d20100b"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-013.md.snapshot"
metadata_origin_digest: "62129ee90fcc5c7174f014e348f6bbaa588d33e74e94072ee77d00c27b13a936"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for vault/REGISTRY/domain-authorities.json"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-017"
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-009"
  - "T-E3-009"
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
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e03-server/MANIFEST.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-009.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/domain-authority-registry.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-009.md.snapshot"
---

# E-DEV-013 — Domain authority registry

The registry maps eight ADR-001 data domains to one stable logical authority identity each. The loader rejects duplicates, unknown/missing domains, identity/owner substitution, malformed versions and unproven activation. Resolution checks expected registry/revision and rejects held domains and convenience-copy kinds. Successor validation checks predecessor byte digest, version step and per-domain revision without changing identities. Thirteen unit tests pass locally, including negative paths and fixture-based successor validation. E3 CI checks out full history to wire the predecessor gate for future snapshots. The committed initial v1 has no predecessor: its history test exercises only the initial-version check, not a real historical transition. All 11 E10 checks and git diff --check pass.

An independent gpt-5.6-luna max subagent reviewed exact head 0b9a459bb32a43cbc7ec028d71beaa1d2d20100b and returned PASS for this logical registry implementation. It separately verified a valid v2 HELD snapshot using temporary v1-to-v2 Git history. PR-head architecture, E3, E5, live-auth and applicable T3 checks are green; GitHub E3 CI ran 55 tests successfully. Its non-blocking evidence note about the initial-version history branch is clarified above. No blocking findings remain. Future runtime integration must consume the reviewed loader output; direct dataclass construction is not proof of a valid binding.

This is governed logical metadata with executable validation, not a product data store. Create/update/retire operations publish reviewed snapshots via PR; there is no dynamic registry API, concurrent publication transaction, hosted source switch-over, production freshness/floor guarantee or account/key change. All physical activation values remain HELD. E5/E6 authority is named through existing boundaries, not implemented or expanded by this task. T-E3-001-R1 remains REVIEW. The same independent reviewer returned PASS for final metadata head 83fc67812b6d46af64cdbbabce002ce9b2a4997d. On 2026-10-01 the owner explicitly accepted the identified verdict under DEC-0069. T-E3-009 is DONE for the logical registry implementation scope only.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
