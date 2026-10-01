---
test_id: E-DEV-028
contract_id_version: "ADR-015 Decision3; addendum section3; relation convention v1"
subject_file: modules/e10-graph/GRAPH_RELATION_CONVENTION.md
subject_digest: 4fdc912a8318c7a1a2fcd384269dc8c6aba5ace5880dc126e119ee36e99db7bb
result: "RECORDED: canonical source comparison; independent review not yet received"
evidence_links:
  - "[[modules/e10-graph/GRAPH_RELATION_CONVENTION.md]]"
  - "[[modules/e10-graph/GRAPH_NODE_REGISTRATION.md]]"
  - "[[modules/e10-graph/MANIFEST.md]]"
  - "[[vault/PACKS/P-E10-002.md]]"
  - "[[vault/REGISTRY/T-E10-002.md]]"
  - "[[vault/EVIDENCE/E-DEV-027.md]]"
gate_verdict: "RECORDED (source comparison; independent acceptance outstanding)"
reviewer: "none; independent gpt-6-luna max task review required"
timestamp: 2026-10-02
purpose: Record canonical relation comparison and actual bounded validation
domain: project-execution
module: e10-graph
owner: E10
depends_on: [V-E10-REL-001, E-DEV-027]
used_by: [V-E10-REL-001, P-E10-002, T-E10-002, M-E10-001]
implements: [ADR-015, C10.1, F10.1.1]
public_contracts: []
internal_scope: documentary-relation-convention-evidence
tasks: [T-E10-002]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py, modules/e10-graph/checks/check_identity.py]
evidence: []
supersedes: []
superseded_by: []
status: RECORDED
last_verified: 2026-10-02
---

# E-DEV-028 — §3 relation convention

Author source comparison: canonical addendum§3 eight bullet lines are reproduced verbatim, in order, including labels and descriptions. ADR015Decision3/Phase7 standard have the same eight grouped labels, sixteen individual keys. Per-field meaning/direction, explicit absence, custody/product distinction, typed identities and routine contract-version versus ID replacement reflect existing canonical/installed sources. Countercases retain missing/conflicting/untested/history scope; no relation detector or runtime edge introduced. T003a/T003b remain separate tasks, no semantic-corpus closure.

T001 prerequisite: independently accepted PR29 finalhead6a1c004d9a6107e40492bee22fcddfdc20a5089e merged as4fb620c44ac1f3b9ad5d20239053f41d0afbb590. Its originally reviewed rule payload is preserved exactly before adding new documentary consumer references. EDEV027 retains its original accepted digest/verdict and points to that exact payload, keeping subject_original_path; old approval does not approve this task's new metadata. Pinned126-origin catalog and historical product evidence remain unchanged.

Actual checks/CI and independent reviewer context/head/findings/verdict will be recorded after validation. Task REVIEW, not DONE. Existing20 tests remain preservation/identity/freshness regression tests, not proof that the eight relation meanings are enforced by future detectors. Public_contracts empty because no runtime contract is added; evidence empty because this record has no separate supporting evidence record/self-approval. Supersedes/superseded_by empty because this is a new first claim. Direct owner's standing authorization requires independent PASS plus green exact-headCI before accepted closure/merge; planPR4 remains awaiting GitHub approval, no bypass. T-E3-001-R1 REVIEW; production authority/activation/recovery HELD.

Local validation2026-10-02: extracted exactly8 §3 canonical bullet lines from plan origin/main and compared to the convention section: byte-for-text equality and original order. Preserved rule payload bytes equal git show6a1c004:modules/e10-graph/GRAPH_NODE_REGISTRATION.md, normalized39ea70214197c9c7293d9ff2f7581719a5f6bae49ef3ac4f1d3a88845e4308bb. All12 E10 checks and20 existing regression tests passed through run_all across135 current Markdown records; both indexes regenerated; git diff --check passed. Initial authoring run caught missing governed-address declaration for the new convention; added explicit E10 manifest address, corrected run passed. No check/runtime/schema/workflow changed. Independent exact-head review/CI outstanding.

Independent /root/pr30_independent_review, gpt-6-luna max, reviewed ab568cf017579c90d9fb03ecd7dd8f1d1c46a2ac and verified exact8 canonical bullet lines, approved rule blob/digest and green exact-head architecture/E3/E5/bothAuth/PRT3. It found the E10 manifest still called the two T001-era consumers current despite four new consumers, with an old custody verification date. Narrow correction explicitly preserves that statement as historical, lists the actual current six consumers and updates metadata_verified_at only; original last_verified/product proof stays unchanged. Corrected-head re-review required; no author PASS or DONE.

Re-review also found changed current records retained onlyT001 in tasks despite this convention defining actual authoring/change provenance. Added T002 maintenance-task trace to M-E10-001, current registration rule, EDEV027 and T001 record, explicitly scoped to current documentary metadata/consumer maintenance; original approved subject, verdict and proof head remain unchanged. Pack scope explicitly includes these same-path maintenance references. Consumer linkage is not a substitute for change provenance, and maintenance provenance does not refresh old evidence. Independent re-review outstanding.

Exact47af52e architecture CI rejected the stale generated registry after the T001 tasks metadata changed; independent reviewer identified the builder diff. Regenerated both indexes from authoritative records, retaining the new maintenance trace. Previous head CI success does not waive this failed exact-head gate. Corrected index/head must pass independent re-review and all applicable CI before closure.
