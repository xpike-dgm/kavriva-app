---
test_id: E-DEV-007
contract_id_version: "ADR-006 Decision 9; T-E3-006c authorization-tuple browser profile v1"
subject_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/authorization-tuple-browser.md.snapshot"
subject_digest: 48CEF1BBF03316D4B27B3F7C0164D571972B4C90124C106C38E6EA00BB73B578
result: "VERIFIED (T-E3-006c browser-rules specification; corrected code head 07d84b7 CI green; owner accepted independent review)"
evidence_links:
  - "[[vault/PROFILES/authorization-tuple-browser.md]]"
  - "[[vault/PACKS/P-E3-006c.md]]"
  - "[[vault/REGISTRY/T-E3-006c.md]]"
  - "modules/e02-panel/MANIFEST.md"
  - "modules/e03-server/MANIFEST.md"
gate_verdict: "PASS (T-E3-006c specification only; owner accepted independent second eye; browser runtime and hosted proof excluded)"
reviewer: "independent gpt-6-luna max sub-agent /root/pr9_independent_review; corrected code head 07d84b7304f7599b83078ad33056ddd4290bf48e; owner accepted on 2026-10-01 under DEC-0069"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-007.md.snapshot"
metadata_origin_digest: "d044133bba427e407e43054e14c8fec8721bbc8aec1cfb26b77ab74405fc537c"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for vault/PROFILES/authorization-tuple-browser.md"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-006c"
  - "T-E3-006c"
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
subject_original_path: "vault/PROFILES/authorization-tuple-browser.md"
historical_source_payloads:
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e02-panel/MANIFEST.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e03-server/MANIFEST.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-006c.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/authorization-tuple-browser.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-006c.md.snapshot"
---

# E-DEV-007 — Browser boundary rules

This is a specification task. The proposed browser profile of the existing authorization-tuple contract states how a future browser must handle private storage and signed URLs, exact origins and cookie CSRF, PKCE callback binding, high-consequence step-up, operation lookup disclosure, lost responses and browser cache revocation. Its negative examples are future implementation fixtures. It adds no tenth catalog contract or new E2/E3 seam. No browser runtime or hosted Supabase behavior is proven by this record.

E10 `run_all.py` and strict planning-link validation passed locally on 2026-10-01; `git diff --check` was clean. On PR #9's corrected code head `07d84b7`, [architecture checks](https://github.com/xpike-dgm/kavriva-app/actions/runs/36796887535/job/110162264088), [E3 tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36796887507/job/110162264069), [E5 tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36796887566/job/110162264114) and [local Supabase Auth proof](https://github.com/xpike-dgm/kavriva-app/actions/runs/36796887556/job/110162263987) succeeded. The unlabelled automatic T3 job initially skipped; after PR #9 received `t3-privileged`, the [T3 conformance/identity job](https://github.com/xpike-dgm/kavriva-app/actions/runs/36797349800/job/110163720736) passed on an evidence-only head. Automation is not the independent review. Subsequent commits changed only task/evidence records, not the reviewed browser profile or E2/E3 manifests.

The independent Luna Max sub-agent `/root/pr9_independent_review` found one architecture issue in the initial formal tenth-contract presentation. The corrected head `07d84b7` moves the rules into a profile of the existing authorization-tuple contract and updates E2/E3 manifests, pack and registry. The reviewer rechecked the corrected profile SHA-256, required storage/origin/CSRF/PKCE/step-up/lookup rules, Supabase signed-URL limits, and corrected code-head CI, then returned **PASS for T-E3-006c's specification scope** with no open finding. The owner explicitly replied “onaylıyorum” on 2026-10-01 to the question identifying PR #9 and this independent verdict, and authorized its merge. Under DEC-0069 that accepts this identified sub-agent as the T3 second eye. Later commits changed only task/evidence/index records, not the reviewed profile or E2/E3 manifests.

T-E3-006b hosted Storage/URL/Studio inventory and T-E3-007 bypass tests remain separate. T-E3-001-R1 and T-E3-006a remain REVIEW; this specification verdict does not promote either to DONE or activate a browser runtime.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
