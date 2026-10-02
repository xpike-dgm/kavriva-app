---
test_id: E-DEV-047
contract_id_version: "ADR-004 identity composition; C5.1/F5.1.1/FL5.1.1; account-light start procedure v1"
subject_file: vault/PROFILES/account-light-start.md
subject_digest: 77763d255e53a9991f5d39ac4ffdd08e66d5162977348a56dac0ed849ff42c07
result: "PASS: independently reviewed account-light procedure; no physical app or provider proof"
evidence_links:
  - "[[vault/PROFILES/account-light-start.md]]"
  - "[[vault/PACKS/P-E5-001.md]]"
  - "[[vault/REGISTRY/T-E5-001.md]]"
  - "[[vault/EVIDENCE/SNAPSHOTS/E-DEV-046-E10-GOVERNED-PATHS.md.snapshot]]"
gate_verdict: "PASS (bounded procedure only; final metadata audit and latest-head CI required before merge)"
reviewer: "/root/pr49_account_light_review; gpt-6-luna/max; independent bounded context"
timestamp: 2026-10-02
purpose: Specify account-light local start without a mandatory server account
domain: project-execution
module: e05-identity
owner: E5
implements: [ADR-004, C5.1, F5.1.1, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: account-light-start-procedure
tasks: [T-E5-001]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_conformance.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E5-LOCAL-001]
used_by: [V-E5-LOCAL-001, P-E5-001, T-E5-001]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-047 — account-light start procedure

Root compared the pinned canonical T-E5-001 acceptance/review row, ADR-004 identity composition and rules, REF-PROFILE-001/SCR-006/007 optional profile/local continue/language/accessibility/copy constraints, identity synthesis local origin and AC-ID-14/17/19 migration/restore boundaries, declared module seams and existing E5 consumer surface. Eight negative cases are manual source walkthroughs, not executed product scenarios. Local installation is not a server account or authority; no background anonymous signup, automatic profile/history/entitlement link, provider-outage login wall, or no-loss/encryption guarantee. T-E5-002 owns actual migration; E1/E4 rendering/persistence and existing E3/E5 server authorization remain separate. Exactly ten closure layers retain actual missing device/UI/storage/key/restore/provider evidence and resolvers.

Pack was written before implementation; exact ten-path scope, existing folders, no runtime/test/workflow/schema/operator/provider changes. Original inventory catalog/prior admissions retained; v15/evidence047 does not import or approve pending PR47 v13/evidence045. EDEV046 original primary digest/verdict/reviewer/source/final core retained with exact accepted v14 secondary snapshot vault/EVIDENCE/SNAPSHOTS/E-DEV-046-E10-GOVERNED-PATHS.md.snapshot normalized bb95afd27295c726527e2464afb27b2786734458aff81866aa8a3a932fa9da6c. Actual root graph/index/diff checks and independent review/current CI still required. E3R1 REVIEW/E5-003 IN_PROGRESS/physical provisioning and production release HELD remain.


## Performed preparation checks

Root run_all.py passed all12 architecture checks and42 existing preservation/identity/trace tests (0.416s), exit0. build_index/routing_run rebuilt42 actual task rows; T-E5-001 REVIEW remains excluded, E5-003 IN_PROGRESS/E3R1 REVIEW retained. Manual source comparison covers ADR-004 explicit local installation/no anonymous server account, profile design optional skip/language/accessibility/copy, migration source retention, restore quarantine and eight countercases. No local app/SDK/account/network/device test. Exact accepted inventory archive raw bytes equal git show3f016aa:inventoryv14; EDEV046 old primary subject/digest/reviewer/receipt core retained. Primary procedure SHA256361494fb2f346434f41a8f9ef46a5c55e24d2378e567b34ba789f6da2cc05565. Independent source verdict and current-head CI pending; task is REVIEW, no author acceptance.


## Actual independent source acceptance

Actual independent /root/pr49_account_light_review gpt-6-luna/max T3 bounded source PASS frozen ca136d697317a28f61a4eab3bc2ba9bdfd343d38 over3f016aa6cca70ff48cb2837e1da242264a0a073d, no source findings. Reviewer inspected all10paths/all14packfields, pinned ADR004/capability/feature/flow/acceptance-review rows, AC-ID14/17/19, profile design constraints, module boundaries/tenclosurelayers/existingpublicprincipal. No forcedaccount/anonymoussignup, optionalprofile/migrationhandoff/sourcepreservation/quarantine and missinglocalcryptomechanism align; public/internalcode unchanged. Recomputed primary source digest 361494fb2f346434f41a8f9ef46a5c55e24d2378e567b34ba789f6da2cc05565; exact archivedv14 inventory Gitblob matchesbase8accd454 prefix and recordednormalizeddigest, originalEDEV046proofcore/catalog/prioradmissions/PR47reservation retained. Reviewer ran no tests/CI/app/device/provider/account operations; root checks distinct. Earlier reviewer-none/BLOCKED is the source-head provisional receipt, retained in Git history and not erased evidence of selfapproval.

All8 actual ca136 source workflows SUCCESS: PRarchitecture36989010616 (labelledT3 PASS; earlierunlabelledarchitecture36988927948 alsoSUCCESS), E336988928029, E536988928006, Auth36988928011; pusharchitecture36988879084, E336988879129, E536988879112, Auth36988879122. Standing DEC0070 accepts this identified boundedT3verdict aftergreenCI. Primary/packACTIVE/T001DONE/views42rows; no product/device/provider/activationproof. Final status-only subject normalizedSHA256 77763d255e53a9991f5d39ac4ffdd08e66d5162977348a56dac0ed849ff42c07. Final six-path metadata/evidence/views independentaudit and all8 latest-headCI required before normalmerge; final immutable receipt in PRbody. E3R1REVIEW/E5-003IN_PROGRESS/productionrelease/liveprovisioningHELD remain.
