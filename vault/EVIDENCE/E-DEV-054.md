---
test_id: E-DEV-054
contract_id_version: "ADR007 R1/R10; internal logical release registry v1"
subject_file: vault/PROFILES/release-authority-registry.md
subject_digest: 1516891b209f47d0cecee1c7e393848536e7d75b032eb71491edc687b22f9d51
result: "RECORDED: logical registry; independent review/currentCI pending"
evidence_links:
  - "[[vault/PROFILES/release-authority-registry.md]]"
  - "[[vault/PACKS/P-E6-001.md]]"
  - "[[vault/REGISTRY/T-E6-001.md]]"
  - "[[vault/EVIDENCE/SNAPSHOTS/E-DEV-053-E10-GOVERNED-PATHS.md.snapshot]]"
  - vault/REGISTRY/release-authorities.json
  - modules/e06-release/internal/release_authority_registry.py
  - modules/e06-release/tests/test_release_authority_registry.py
gate_verdict: "BLOCKED (independent review/currentCI missing; actual release HELD)"
reviewer: none (separate gpt-6-luna/max T3 required)
timestamp: 2026-10-02
purpose: Register eight distinct logical release authorities without activation
domain: release-governance
module: e06-release
owner: E6
implements: [ADR-007, ADR-003, C6.1, F6.1.1, R-003, R-004, R-007, R-009, R-011, R-013, R-014]
public_contracts: []
internal_scope: release-authority-registry
tasks: [T-E6-001]
tests: [modules/e06-release/tests/test_release_authority_registry.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E6-AUTHORITY-001]
used_by: [V-E6-AUTHORITY-001, P-E6-001, T-E6-001]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-054 — logical release authority registration

Root compared approved ADR007R1/R5/R6/R10/ADR003, canonical task/review matrix/noharddep graph/E6manifest/existing release-promotion/logical domain registry/packstandard/module boundaries/protocol/validation/closure/owner-status. Thirteen-path fourteen-field pack prepared before code; initial PR54base then actual acceptedPR55mergee7c8af8997debb493c55061fcfacec9deb5b7f5c fast-forward before source/archive freeze. Planmainfa914f013fdcd032faed876689092da245989459/direct standing ownerDEC0070/pendingplanPR4notmerged.

Pure E6 metadata registry of eight distinct domains/identity/action/credential-domain/audit/consequence taxonomy; all physicalactivationHELD, actualholder/key/auditcustody null, OTA NOT_APPROVED. Loader checks exact rawbytes digest/expected version/JSON duplicates/strict shapes/types/taxonomy/holds. Resolver structurally revalidates whole tuple before metadata return. Intrinsic NONE; no live current authority/authentication, issuer/key/lane/sign/promotion/deploy/migration/content/config/brake/OTA/audit operation or cross-capsule private import/newseam. Caller-computed expected digest is not authenticated source. Category names do not prove physical separation/staffing/audit/consequence checks. T-E6-002 independence and exactsnapshot/lane/currentgeneration/trustroot/production remain MISSING/HELD.

Twelve meaningful E6local testsPASS0.014s/compilePASS; cases described in profile. Existing CI has no E6-specific job; no E3/E5/graph pass is represented as E6 semantic testing. No provider/browser/customer/key/account/credential/deployment operation. Source/canonical lifecycle/status/checks separate from independent acceptance.

Normalized SHA256 primarydf1ca75691870d4e67e898242bb709b09b87d35a95f569b5294a150721b86bcd; datade8f94578919cf22661af393aa476a5122fe7129412d6c8504eaa4966043bd66; codec07d480119eb963106873d2a4ae2af5e95a80f420f8bcc0549bffb931161e25f; unit67b24ead69ef7d769ce747c81f6512a95e5e5008c2546edd43ad081dd5c613d7. AcceptedPR55inventoryv21 rawarchive byteequal normalizedffbbf0f33b4605192434248ccda2ddfb9e5f0c197b288fabd30c7029e71452e6. PriorEDEV053 primary/core/code/test/digest/reviewer/verdict/head history unchanged except actualconsumer/secondarycustody append. Original401/79catalog/prioradmissions/unmergedPR47v13/E045reservation preserved in successorv22. Architecture/graph/diff/sourcefreeze/currentCI/separateindependentreview outstanding; no authorPASS.

Ten-layer source/gap audit in profile; actual staffed separate credentials/current E5authorization/protected audit/immutable verified artifacts/E7execution/E2UI/current suspension and rollback/incident/floor/OTA activation remain MISSING/HELD. E3R1REVIEW/E5-003IN_PROGRESS/physicalprovisioning/privilegedproductionHELD unchanged. Logical registration cannot open any real release.

Performed architecture preparation: run_all.py12checks/42regressionsPASS0.577s/worstexit0; buildindex49rows/routingeligibleempty/T-E6-001REVIEW/E3R1REVIEW/E5-003IN_PROGRESS; historical P-PROOF-001 warning unchanged. gitdiffcheckPASS, thirteen-path source scope. Source review/exactheadCI remain required.

## Actual initial independent rejection and narrow remediation

Separate /root/pr53_proposal_tag_review gpt-6-luna/max actual CHANGES_REQUESTED P2 at exact9dd5ed55a0b553b69849fa8bac594227e4540b30 over acceptedbasee7c8af8997debb493c55061fcfacec9deb5b7f5c: json.loads excessive nesting may raise RecursionError outside the UnicodeError/ValueError handler, escaping promised bounded malformed-input reason. Otherwise taxonomy/holds/digest/schema align with bounded ADR scope. Reviewer read-only, no tests/CI/provider/edits. This finding does not grant permission or imply release opening; no source PASS claimed.

All eight initial exact9dd source workflows SUCCESS: PRarchitecture37007534949 actualT3SUCCESS (duplicate37007532363 green), E537007532254,E3commit37007532284,liveAuth37007532232; pusharchitecture37007476639,E537007476722,E3commit37007476667,liveAuth37007476705. Green initialCI never overrides the independent rejection. Local12tests/sourcehashes above belong to original reviewed head.

Root changed only parser boundary to catch RecursionError and added actual excessive-nesting and controlled parser-failure regressions. First thirteen-test attempt failed because Python3.14.3 parsed the deeply nested root array and rejected schema with REGISTRY_VERSION_OR_SHAPE_INVALID rather than the assumed parser FORMAT error. Root corrected the test's cross-runtime expectation without weakening schema or parser rejection, and added explicit RecursionError fault injection for the translation path. Fourteen updated testsPASS0.026s on Python3.14.3 and PASS0.028s on existing bundledPython3.12.14; compilePASS. No installation/provider/actual lane operation; deep fixture size is a test probe, not an invented production size limit.

Current normalized primary1516891b209f47d0cecee1c7e393848536e7d75b032eb71491edc687b22f9d51; code81c90df121d2069096c5acdad052a57a96ac05827a74b02e748843667fc236b3; unitb3ce5e89811dcd97290345577e30ed694afd114db1818a29c25a08ded8a4c7f4. Data/archive/priorproof/inventory/manifest/pack remain unchanged by this five-path correction. Task moved CHANGES_REQUESTED→narrowremediation→REVIEW; actual updated exacthead independent re-review and CI required, original rejection retained, no authorPASS/DONE or physical activation.

Updated source preparation architecture12checks/42regressionsPASS0.594s/diffcheck; unchanged49-row views/taskREVIEW. Exactly five correction paths, no actual source/prior custody/registry data/inventory/manifest/pack change. Updated source must be frozen/re-reviewed and all applicable updatedheadCI green.
