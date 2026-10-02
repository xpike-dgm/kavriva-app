---
record_id: V-E4-EVICTION-001
version: 1
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
depends_on: [M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-009a, T-E4-009a, E-DEV-068]
evidence: [E-DEV-068]
supersedes: []
status: ACTIVE
---

# Ordered disposable eviction rule

Historical pre-code/source-freeze sections below preserved; current FULLtask acceptance and separate product holds recorded in completion receipt.

Canonical T009a/ADR009R4/C4.4/F4.4.1/FL4.4.1 reviewgate/harddepsnone. Acceptedmain ec97780020c183a9f5bced3fa2a6302dd435bf41 includes PR69 merged2026-10-02T17:58:58Z and independentlyreviewed T005space validator/constants reused inside E4; no fakeharddep/new publicseam/privatecrossmoduleimports. E4consumesE3/E1renders unchanged. Acceptedremoteplanmainfa914f013fdcd032faed876689092da245989459/localstaleplanmain7d705a69/localpendingbranch e3c2e3f/pendingplanPR4unmerged/directstandingmandate distinguished. E3R1REVIEW/E5-003IN_PROGRESS/unmergedPR47/57/59unchanged.

order_eviction takes plain immutable Disposable tuple and supplied protectedID tuple. Validates IDs/duplicateprotection first; accepted T005 _space(SpaceDeclaration(0,0,candidates),protectedIDs,0) validates entire candidates before sorting, including all existing six protectedlabels/overlappingprotectedIDs/unknownclass/duplicateID/mutable/hostile/bool or nonpositivebytes. Zero is validation-only argument, not diskspace signal/selectedquota/threshold/cleanup permission. No mutation to acceptedvalidator or constants.

Returns all validated candidates in INVALID_OR_ORPHAN_TEMP -> NONESSENTIAL_MEDIA -> OLD_INACTIVE_REFETCHABLE_CACHE -> REBUILDABLE_PROJECTION order, stable inputorder for ties; no inventedage/size/TTL ranking. Emptytuple returns emptyproposal. Does not stop at capacity, choose deletioncount, estimate reclaimedspace, delete bytes or update storage/authority. EvictionOrder frozen/authorityNONE; production constantHELD_CANONICAL_STORAGE_CLASSIFICATION_AND_ENCRYPTED_CLEANUP_RUNTIME_MISSING ignoresflags/callback. Suppliedclassification/protectionIDs maybefalse: coherent hiddenuserhistory relabeledNONESSENTIAL can pass orderingmodel but never actualdeletion gate.

Existing accepted T005six-class safety preserved without claiming T009b done. T009b canonical never-evict policy and T010hold-transfer separate. Actualcanonicalclassifier/storage/protectedmembership/OScapacity/identifiedstaging/encryptedtransactions/atomicpromotion/crashrecovery/E1/device/runtime MISSING/HELD. Active task/core/safety/durableuserhistory/evidence/pendingacceptedop/audit/floors never actualdeleted here; no plaintextfallback/numericMBGBpercentpolicy/provider/wireformatselected. T005completeverification/peak/atomicstore gates unchanged; this proposal cannot authorize actionability or physical cleanup.

Eleven new+accepted96 full107PASS0.169s/compile. Initial full107FAIL one test0.183s: early-stoptest expected same-class rebuildableextra after original even though input placed extra first; implementation stableties correctly retained inputorder. Narrow expectedtuple correction only (no sourcechange), rerun full107PASS0.169s. Actual initial failedtest preserved, not claimed PASS or independentreviewrejection. Tests fourclassorder/stableties/allitems/no threshold/empty/accepted6protectedlabels/suppliedIDsrelabeled/unknownduplicateinvalid/mutable/hostile/immutability/nofreedbytes/coherentforgery/constantHELD. Arbitraryfixturebytecount not productionlimit. No independentverdict before sourcefreeze.

## Trace

ADR009R4 -> C4.4 -> F4.4.1 -> FL4.4.1 -> T-E4-009a -> M-E4-001 -> E-DEV-068. Clientlogic/E1screenHELD/no renderer/data no persistence/releaseNONE/internalreviewtask/product physicalgates above. Source `modules/e04-offline/internal/eviction_order.py`; tests `modules/e04-offline/tests/test_eviction_order.py`; acceptedvalidator `modules/e04-offline/internal/stage_verify_promote.py`; workflow `.github/workflows/e4-tests.yml`; pack `vault/PACKS/P-E4-009a.md`; task `vault/REGISTRY/T-E4-009a.md`; proof `vault/EVIDENCE/E-DEV-068.md`. At historical source freeze FULLcanonicaltask review/exactheadCI were required before internalruleDONE; no selfPASS. Current acceptance below.

## Independent full task completion receipt

Separate configured owner-selected gpt-6-luna/max /root/pr58_snapshot_binding_review FULL T-E4-009a internal ordering-rule task PASS/no actionable findings atd193ab1b3baab3f1bc5acd37dba578ef28ddfd42 over acceptedbaseec97780020c183a9f5bced3fa2a6302dd435bf41. Canonical reviewgate/harddepsnone/all13paths reviewed; fullcandidates validatedusingacceptedT005, allitems returned canonicalfourclassorder/stableties, no deletioncount/freedspace/deletion. Initial107testFAIL expectedtuple conflict with stableinputties; expectationonly corrected/not implementation/no reviewerrejection. Recordedhashes/rawacceptedarchive verified; no edits/tests/CI/provider/writes by reviewer.

Exactsourceall12CI SUCCESS: PRarchitecture37045048899 actualT3SUCCESS (earlierunlabeledduplicate37045020789), E4 37045020692 actual107PASS0.138s, E3commit37045020671/E5 37045020854/E6 37045020838/live37045020663; pusharchitecture37045003381/E4 37045003112/E3commit37045003211/E5 37045003359/E6 37045003317/live37045003285. Root11new+accepted96full107PASS0.169s/compile/run_all12checks+42PASS0.457s/worstexit0/build_index61/routingREVIEW/eligible[]/diff/exact13paths/rawarchiveequal. Actualinitialfull107FAILone0.183s and expectationonlyfix/PASS retained distinctly. OriginalP-PROOF001warning unchanged.

DirectstandingownerDEC0069/0070 mandate accepts independentFULLdelegatedtaskPASS/normalmatchedmerge after applicablecurrentgreenCIuntilrevoked; pendingplanPR4unmerged/not governingmain distinguished. Profile/packACTIVE/taskDONE only internalorderingrule, not actualcleanup. Suppliedclassification/protectedIDs notcanonicalproof/alloutputsNONE/constantproductionHELD. Actualclassification/protectedmembership/storagecapacity/encryptedcleanup/atomictransactions/crashrecovery/E1/device/runtime MISSING/HELD. Coherent protecteddatarelabel not actualdeletionpermission; no actualfreedbytes/storageeffect/productreadyclaim. ExistingT005safety/coreverification/peak/atomicstore unchanged; T009bneverevictpolicy/T010hold-transfer remainseparate notDONEhere. E3R1REVIEW/E5-003IN_PROGRESS/unmergedPR47/57/59unchanged. Six finaldocumentary/viewpaths only; source/tests/workflow/archive/inventory/manifest/CIplan/priorproof unchanged. Independentfinalmetadataaudit/latesthead12CI remain premergegates.
