---
test_id: E-DEV-027
contract_id_version: "ADR-015 Decision3; graph node registration rule v1"
subject_file: vault/EVIDENCE/SNAPSHOTS/E-DEV-027-GRAPH_NODE_REGISTRATION.md.snapshot
subject_original_path: modules/e10-graph/GRAPH_NODE_REGISTRATION.md
subject_digest: 39ea70214197c9c7293d9ff2f7581719a5f6bae49ef3ac4f1d3a88845e4308bb
result: "PASS: independent review accepted full current-corpus registration and original proof preservation"
evidence_links:
  - "[[modules/e10-graph/GRAPH_NODE_REGISTRATION.md]]"
  - "[[vault/INVENTORIES/E10-REGISTRATION-BASELINE.md]]"
  - "[[vault/PACKS/P-E10-001.md]]"
  - "[[vault/REGISTRY/T-E10-001.md]]"
gate_verdict: "PASS (registration/preservation only; semantic/production closure unproved)"
reviewer: "independent gpt-6-luna max; /root/pr29_independent_review"
timestamp: 2026-10-02
purpose: Record registration rule and truthful coverage evidence
domain: project-execution
module: e10-graph
owner: E10
depends_on: []
used_by: [V-E10-NODE-001, I-E10-REGISTRATION-BASELINE, P-E10-001, T-E10-001, M-E10-001, E-DEV-028, P-E10-002, P-E10-004, E-DEV-031]
implements: [ADR-015, C10.1, F10.1.1]
public_contracts: []
internal_scope: whole-corpus-registration-and-historical-proof-preservation
tasks: [T-E10-001, T-E10-002, T-E10-004]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/tests/test_record_preservation.py, modules/e10-graph/tests/test_registration_identity.py, modules/e10-graph/checks/check_packs.py, modules/e10-graph/tests/test_pack_freshness.py]
evidence: []
supersedes: []
superseded_by: []
status: RECORDED
last_verified: 2026-10-02
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
metadata_verified_at: "2026-10-02"
---

# E-DEV-027 — Graph registration rule

Universal rule includes immutable stable identity, same/cross-type uniqueness, explicit task migration lineage, every individual minimum metadata field, meaningfulempty/unknown distinction, sourcefile/module governance, history-safe reviewed change, no owner invention, no greenlegacycheck/fullcorpus confusion. T002relations and T003detectors not claimed implemented.

Literal baseline:126 tracked Markdown files at28b3734027d72b8f592b60290c8bf5f8fc0dfe2b;101 parsed frontmatter,25none,0withall16 individually named fields. Absence in frontmatter is NOT proof information absent from body/reference. Empty-present semantic correctness, ID/planning coverage, link resolution and criticaltests were not audited here. Inventory normalized digest: 67107eafee25298bd76ad0aa3223feaac2b8ac01176b968b37c18399c6ba3cff. Rule normalized digest: 082701170a75e381a2386048d3b2b341413f87c62ccc82e0ed897243e7ed4aa9. Historical files unchanged, no runtime/check/workflow/schema/credential action. Complete existing-corpus registration remains UNVERIFIED; scope review must not turn an unmet acceptance into documentary DONE.

Actual local validation: all11 E10 checks passed, both indexes regenerated, git diff --check clean. Frozen baseline independently reproduced from git ls-tree/git show for every126row:101frontmatter/25none and exact missing-field lists match. Initial authoring checks found two missing governed-path references, incompatible list form for installed task evidence parser and verdict punctuation; fixed within bounded authoring before review, existing checks unchanged. Exact-headCI pending. Independent gpt-6-luna max reviewer/context/head/findings/verdict pending; task REVIEW. Direct owner2026-10-01 standing mandate applies only after required independentPASS and greenCI; planDEC0070PR4 reviewedgreen but GitHubapprovalpending, no bypass. T-E3-001-R1 REVIEW; physical activation/operational authority/recovery HELD.

At the initial rule-only stage, tests was empty because no executable behavior was changed. The current remediation changes registration/preservation/freshness behavior and links its actual guards and20 tests in frontmatter; this does not prove product runtime. This record is not its own independent approval.

Author self-inspection corrected implements from an ADR section label to the actual canonical ADR-015 ID; Decision3 remains addressed by the source link/body. This does not substitute for independent review.

Author self-inspection also replaced empty used_by lists with actual current documentary record consumers; absence of runtime consumers is not absence of graph references. No future task consumer was invented. All five new artifacts have all16 individually named metadata fields; presence alone is not whole-corpus conformance.

Independent reviewer identified the self-reference in this evidence record's evidence field. It is now empty: there is no separate supporting evidence record for E-DEV-027; subject/supporting artifacts remain in evidence_links. This is an explicit absence, not self-proving approval. Independent review receipt and actual checks are recorded in the body, never fabricated as another evidence node.

Independent reviewer also found the E10 manifest's explicit T-E10-001 reference absent from that task's used_by list; M-E10-001 is now declared. Both review findings await exact corrected-head re-review.

## Independent acceptance verdict — CHANGES_REQUESTED

Reviewer /root/pr29_independent_review, gpt-6-luna max, exact head0213a1a31fcd0ef85fdefcd191ccf693fccfbf14/base28b3734027d72b8f592b60290c8bf5f8fc0dfe2b. Rule publication and truthful baseline do not satisfy universal frozen T001 acceptance. Existing corpus needs scoped migration or authoritative clarification; the author pack cannot narrow the criterion. Earlier canonical ADR identity, consumer and evidence-self-reference findings are closed. Reviewer independently reproduced126 rows and verified both normalized digests; all five new records have all16 fields. Direct exact-head applicable CI passed: architecture36917777266/36917783288; E3 36917777436/36917783334 (107 existing tests); E5 36917777270/36917783394; isolated Auth/Storage36917777269/36917783312. PR-event T3 passed, push-event skipped. Green tests do not cure unmet acceptance. Task CHANGES_REQUESTED, PR draft, no merge.

Remediation preserves the universal criterion and original corpus baseline. Begin with sourced manifest metadata; future work must protect historical proof bytes/digests and respect approved source changes. No metadata gap is waived by the owner standing mandate.

First scoped remediation adds all16 minimum metadata fields to M-E10-001 from its actual manifest/source declarations and real anatomy/identity checks. Same ID and existing body/history preserved; document verification never proves future runtime behaviors. Remaining historical corpus conformance is unresolved, no task closure.

All ten module manifests now serialize all16 metadata fields under packv2. Remaining nine additions copy purpose/internal_scope verbatim from their existing approved sections, reference their exact public-surface heading, preserve identity/body/semantics, and encode only declared epic DAG dependencies (E2/E8 output and E9/E1 proposal qualifiers preserved). Source bodies and canonical EPIC_CATALOG/DEPENDENCY_GRAPH were read before authoring. Actual anatomy/identity checks are distinguished from future product tests. Existing-corpus acceptance still unmet; no independent re-review requested prematurely.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.

## Remediation for full registration acceptance (2026-10-02)

Packv3 explicitly expands allowed scope for universal corpus registration without changing the criterion. Current131 Markdown records each have full16fields and a single stored identity;126 original baseline Git blobs archived exactly, pinned catalogdigest ba29017ed274f67ffd1314fc42551d6967a04bebdb5ddf979121aac61550283f. All old subject digests, verdicts and verification data remain. Digest targets for historic Markdown sources now point to exact preserved originals; old source path stays explicit. Frozen proof pack remains bound to its originally pinned digest/address choices. New checks reject altered historic bodies/metadata, duplicate keys/identity claims and missing/tampered/rehashed origins. E10 assigned documentary custody never implies product authority; registration does not claim complete semantic/runtime proof.

Thirteen preservation/identity tests passed locally2026-10-02. Full run_all and exact-headCI/re-review results will be recorded after final validation. Initial failed registration run caught unresolved open-label refs, backticks from transcript-purpose extraction, annotated legacy date shape and the new subject digest requiring update; corrected without altering archived historic bytes or semantic bodies. Initial rejection and its scope remain authoritative until independent corrected-head review closes the finding. No merge/DONE yet.

Local validation2026-10-02: all12 architecture/registration commands and13 preservation/identity tests passed through run_all; generated registry/routing regenerated; git diff --check passed. .snapshot files are -text to preserve raw Git-blob bytes across Windows/Linux. Corrected-head independent re-review and CI remain outstanding; initial rejection not yet closed.

Follow-up self-inspection2026-10-02 found optional per-record origin links could evade preservation despite the pinned archive catalog. Registration now requires each baseline record's exact same-address origin link, rejects a new node borrowing another original, and rejects a baseline node disappearing from the current corpus. Three negative tests added; all12 checks and16 tests passed locally. The prior13-test receipt remains history. Independent acceptance is still pending; no DONE or merge.

Independent re-review additionally found stale tests:[] in the active task/pack/evidence metadata from the earlier rule-only stage. These now link actual registration/preservation guards and tests. Packv4 replaces superseded active scope wording with the already explicit whole-corpus amendment and accurate12-check/16-test validation; old rejection/amendment receipts remain. Current task/evidence/rule verification dates cover this metadata correction, not a new product verification. Independent final verdict remains pending.

Accurate2026-10-02 metadata dates exposed a pre-existing pack-checker defect: the newest unrelated task date plus any IN_PROGRESS task falsely expired all historical packs. Corrective scope now includes linked-task freshness comparison and4 regression tests: unrelated newer task passes; truly stale own active context fails; completed history warns; missing task remains explicitly unverified. No historic date was refreshed or product completion granted. Current validation comprises12 checks and20 tests; independent verdict pending.

Independent source review at c3788916c18d304ca4473a929efc51cc11e89150 verified all126 baseline/current-origin blob pairs, all131 current metadata frames, local relation target existence and unique25 D-APP-DOC first claims. It accepted preserved contract:<immutable-slug> as typed identity under existing contract-field semantics and canonical contract sources; no retroactive rename or type-prefix waiver. Reviewer reported no further actionable blocker besides stale16-vs20 prose, now corrected. This is an interim factual receipt, not final PASS. Exact c3788916 CI completed green, including both isolatedAuth runs36928593288/36928597166. Final corrected-head review and CI still required.

## Independent final acceptance — PASS (2026-10-02)

Reviewer /root/pr29_independent_review, separate delegated gpt-6-luna max context, exact2656cc623aeb11766830f0e6f9cddc9fa3f14f3b/base28b3734027d72b8f592b60290c8bf5f8fc0dfe2b. Actual verdict PASS, no remaining actionable T001 finding. The initial universal-coverage rejection is closed by all131 current records having a single stable typed identity and all16 required fields, with independently reproduced126/126 baseline Git blob pairs and no lost baseline paths. Exactly25 D-APP-DOC first claims are unique and absent from canonical plan origin/main. Existing contract-field namespaces preserve immutable slugs without invented renames. The omitted actual test links and stale16-vs20 prose findings are corrected. Twenty preservation/identity/freshness tests and12 checks passed; source/historical verdict/body/digest preservation and custody-only meaning accepted.

Reviewer directly queried exact-head CI head_sha/status/conclusion: PR architecture36930165715, E3 commit-auth36930165764, isolatedAuth36930165798 and E5 36930165735 SUCCESS; push architecture36930161621, E3 36930161786, isolatedAuth36930161734 and E5 36930161754 also SUCCESS. PR T3 PASS; push T3 skipped by event condition. Accepted under direct owner's standing mandate; no separate owner re-prompt or planPR4 bypass. T001 DONE is restricted to actual registration/preservation acceptance, not T002/T003 semantic closure or product activation. T-E3-001-R1 REVIEW and operational authority/recovery HELD. Earlier FAIL/interim receipts remain chronological history. Final status/evidence/index-only audit and exact-headCI are required before merge and recorded against the final head in PR29 to avoid recursive proof commits.

## Approved subject custody for later documentary consumers

T-E10-002 adds consumer references to the current registration-rule frame. The PR29-approved6a1c004 rule blob is preserved byte-identically in vault/EVIDENCE/SNAPSHOTS/E-DEV-027-GRAPH_NODE_REGISTRATION.md.snapshot; subject_file now points to that exact payload, subject_original_path retains the governed live address. Original39ea7021 digest, accepted verdict, head and scope remain unchanged. This receipt preserves old acceptance; it does not approve the new T002 convention or consumer metadata, which require their own independent review/CI.

Task trace note: T-E10-002 maintains this current record's documentary metadata/consumer references. Its tasks entry records that actual maintenance provenance; it does not re-author or refresh the original T-E10-001 product/acceptance evidence. Exact approved subject payloads and original verdict/head/digests remain authoritative for their earlier scope.

T-E10-004 custody maintenance adds actual prerequisite-proof pack/evidence consumers and maintenance trace only. Already preserved PR29-approved subject file/digest/result/reviewer/head/date remain unchanged; no approval of new template scope by old proof.
