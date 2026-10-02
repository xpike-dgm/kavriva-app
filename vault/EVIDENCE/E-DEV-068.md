---
test_id: E-DEV-068
contract_id_version: "ADR009 R4; eviction order v1"
subject_file: vault/PROFILES/eviction-order-rule.md
subject_digest: 3c2486cb3d52ba84812b8e64f64c7b1f4c152e75cddb4a73cd3e1bcd55c4c480
result: "RECORDED ordered disposable proposal fixtures; independent full task review required"
evidence_links:
  - "vault/PROFILES/eviction-order-rule.md"
  - "vault/PACKS/P-E4-009a.md"
  - "vault/REGISTRY/T-E4-009a.md"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-067-E10-GOVERNED-PATHS.md.snapshot"
  - "modules/e04-offline/internal/eviction_order.py"
  - "modules/e04-offline/tests/test_eviction_order.py"
  - ".github/workflows/e4-tests.yml"
gate_verdict: RECORDED
reviewer: none
timestamp: 2026-10-02
purpose: Specify ordered eviction of declared disposable storage without deleting data
domain: offline-package
module: e04-offline
owner: E4
implements: [ADR-009, C4.4, F4.4.1, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: eviction-order-rule
tasks: [T-E4-009a]
tests: [modules/e04-offline/tests/test_eviction_order.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E4-EVICTION-001]
used_by: [V-E4-EVICTION-001, P-E4-009a, T-E4-009a]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-068 ordered disposable eviction

Thirteenpath/fourteenfield pack saved before code. Canonical task/deps/reviewmatrix138/ADR009R2/R4/R7/R8/DEBATE017manager/BR131-133/C4.4/F4.4.1/FL4.4.1/E1screenHELD/acceptedT005/proofs/inventory/E4manifest/packagecontract/boundaries/protocol/pack/rules/validation/closure/ownerstatus/custody/CI read. Fulltask independentreview/current12CI/actualPRT3 required; no authorPASS/DONE or partialtaskverdict.

Canonical T009a/ADR009R4/C4.4/F4.4.1/FL4.4.1 reviewgate/harddepsnone. Acceptedmain ec97780020c183a9f5bced3fa2a6302dd435bf41 includes PR69 merged2026-10-02T17:58:58Z and independentlyreviewed T005space validator/constants reused inside E4; no fakeharddep/new publicseam/privatecrossmoduleimports. E4consumesE3/E1renders unchanged. Acceptedremoteplanmainfa914f013fdcd032faed876689092da245989459/localstaleplanmain7d705a69/localpendingbranch e3c2e3f/pendingplanPR4unmerged/directstandingmandate distinguished. E3R1REVIEW/E5-003IN_PROGRESS/unmergedPR47/57/59unchanged.

order_eviction takes plain immutable Disposable tuple and supplied protectedID tuple. Validates IDs/duplicateprotection first; accepted T005 _space(SpaceDeclaration(0,0,candidates),protectedIDs,0) validates entire candidates before sorting, including all existing six protectedlabels/overlappingprotectedIDs/unknownclass/duplicateID/mutable/hostile/bool or nonpositivebytes. Zero is validation-only argument, not diskspace signal/selectedquota/threshold/cleanup permission. No mutation to acceptedvalidator or constants.

Returns all validated candidates in INVALID_OR_ORPHAN_TEMP -> NONESSENTIAL_MEDIA -> OLD_INACTIVE_REFETCHABLE_CACHE -> REBUILDABLE_PROJECTION order, stable inputorder for ties; no inventedage/size/TTL ranking. Emptytuple returns emptyproposal. Does not stop at capacity, choose deletioncount, estimate reclaimedspace, delete bytes or update storage/authority. EvictionOrder frozen/authorityNONE; production constantHELD_CANONICAL_STORAGE_CLASSIFICATION_AND_ENCRYPTED_CLEANUP_RUNTIME_MISSING ignoresflags/callback. Suppliedclassification/protectionIDs maybefalse: coherent hiddenuserhistory relabeledNONESSENTIAL can pass orderingmodel but never actualdeletion gate.

Existing accepted T005six-class safety preserved without claiming T009b done. T009b canonical never-evict policy and T010hold-transfer separate. Actualcanonicalclassifier/storage/protectedmembership/OScapacity/identifiedstaging/encryptedtransactions/atomicpromotion/crashrecovery/E1/device/runtime MISSING/HELD. Active task/core/safety/durableuserhistory/evidence/pendingacceptedop/audit/floors never actualdeleted here; no plaintextfallback/numericMBGBpercentpolicy/provider/wireformatselected. T005completeverification/peak/atomicstore gates unchanged; this proposal cannot authorize actionability or physical cleanup.

Eleven new+accepted96 full107PASS0.169s/compile. Initial full107FAIL one test0.183s: early-stoptest expected same-class rebuildableextra after original even though input placed extra first; implementation stableties correctly retained inputorder. Narrow expectedtuple correction only (no sourcechange), rerun full107PASS0.169s. Actual initial failedtest preserved, not claimed PASS or independentreviewrejection. Tests fourclassorder/stableties/allitems/no threshold/empty/accepted6protectedlabels/suppliedIDsrelabeled/unknownduplicateinvalid/mutable/hostile/immutability/nofreedbytes/coherentforgery/constantHELD. Arbitraryfixturebytecount not productionlimit. No independentverdict before sourcefreeze.

Source-review normalizedSHA256:
- vault/PROFILES/eviction-order-rule.md: 3c2486cb3d52ba84812b8e64f64c7b1f4c152e75cddb4a73cd3e1bcd55c4c480
- modules/e04-offline/internal/eviction_order.py: cc7924377f2c8db94147a74e584c63cb4e8118cc01babc63acffb368bac218b8
- modules/e04-offline/tests/test_eviction_order.py: 6a17663c2d313223979f496576ae410674f850f0b9f81546d6d949b0e25b1728
- modules/e04-offline/internal/stage_verify_promote.py: 926f3aa440b999ab6f8ffeba87b755f5638a03882a4352cfce16020a0d4fdd0f
- .github/workflows/e4-tests.yml: 1bc5e117dcba3d37d1620bf789890d95034b1699049b51da26b98abaa0174f62
- vault/EVIDENCE/SNAPSHOTS/E-DEV-067-E10-GOVERNED-PATHS.md.snapshot: 51558f0d1c86314aafd89fc7aa6069df342cbe5a0b2ab7a510f56aa027ab8780

Acceptedv35rawarchiveequal; successorv36original401/79/alladmissions/pendingv13/v23/v25 retained. PriorEDEV067 onlyconsumer/secondaryPR69receipt, oldsourcePASS/primary/digests/reviewer/failurehistory preserved. Actual cleanup/source/classification/device/runtimeHELD; gap anchors `vault/PROFILES/eviction-order-rule.md` / `vault/PACKS/P-E4-009a.md` / `vault/REGISTRY/T-E4-009a.md`.

Root build_index61/routingT009aREVIEW/eligible[]; run_all12checksPASS+42regressionsPASS0.457s/worstexit0; diffcheckPASS/exact13paths/rawarchiveequal. OriginalP-PROOF001warning unchanged.
