---
test_id: E-DEV-068
contract_id_version: "ADR009 R4; eviction order v1"
subject_file: vault/PROFILES/eviction-order-rule.md
subject_digest: 03b82292b99cd08370f16a4b9eb69905164506c44cf5c7ae0d999e298ad2478b
result: "PASS full internal ordering-rule task; actual cleanup and runtime HELD"
evidence_links:
  - "vault/PROFILES/eviction-order-rule.md"
  - "vault/PACKS/P-E4-009a.md"
  - "vault/REGISTRY/T-E4-009a.md"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-067-E10-GOVERNED-PATHS.md.snapshot"
  - "modules/e04-offline/internal/eviction_order.py"
  - "modules/e04-offline/tests/test_eviction_order.py"
  - ".github/workflows/e4-tests.yml"
gate_verdict: "PASS internal ordering-rule only; production HELD"
reviewer: "/root/pr58_snapshot_binding_review; gpt-6-luna/max; full task PASS atd193ab1b3baab3f1bc5acd37dba578ef28ddfd42"
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
used_by: [V-E4-EVICTION-001, P-E4-009a, T-E4-009a, P-E4-009b, E-DEV-069]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-068 ordered disposable eviction

Historical source-freeze sections atd193ab1 below; current FULLtask acceptance and separate product holds in completion receipt.

Thirteenpath/fourteenfield pack saved before code. Canonical task/deps/reviewmatrix138/ADR009R2/R4/R7/R8/DEBATE017manager/BR131-133/C4.4/F4.4.1/FL4.4.1/E1screenHELD/acceptedT005/proofs/inventory/E4manifest/packagecontract/boundaries/protocol/pack/rules/validation/closure/ownerstatus/custody/CI read. At historical source freeze Fulltask independentreview/current12CI/actualPRT3 were required; no authorPASS/DONE or partialtaskverdict. Current acceptance below.

Canonical T009a/ADR009R4/C4.4/F4.4.1/FL4.4.1 reviewgate/harddepsnone. Acceptedmain ec97780020c183a9f5bced3fa2a6302dd435bf41 includes PR69 merged2026-10-02T17:58:58Z and independentlyreviewed T005space validator/constants reused inside E4; no fakeharddep/new publicseam/privatecrossmoduleimports. E4consumesE3/E1renders unchanged. Acceptedremoteplanmainfa914f013fdcd032faed876689092da245989459/localstaleplanmain7d705a69/localpendingbranch e3c2e3f/pendingplanPR4unmerged/directstandingmandate distinguished. E3R1REVIEW/E5-003IN_PROGRESS/unmergedPR47/57/59unchanged.

order_eviction takes plain immutable Disposable tuple and supplied protectedID tuple. Validates IDs/duplicateprotection first; accepted T005 _space(SpaceDeclaration(0,0,candidates),protectedIDs,0) validates entire candidates before sorting, including all existing six protectedlabels/overlappingprotectedIDs/unknownclass/duplicateID/mutable/hostile/bool or nonpositivebytes. Zero is validation-only argument, not diskspace signal/selectedquota/threshold/cleanup permission. No mutation to acceptedvalidator or constants.

Returns all validated candidates in INVALID_OR_ORPHAN_TEMP -> NONESSENTIAL_MEDIA -> OLD_INACTIVE_REFETCHABLE_CACHE -> REBUILDABLE_PROJECTION order, stable inputorder for ties; no inventedage/size/TTL ranking. Emptytuple returns emptyproposal. Does not stop at capacity, choose deletioncount, estimate reclaimedspace, delete bytes or update storage/authority. EvictionOrder frozen/authorityNONE; production constantHELD_CANONICAL_STORAGE_CLASSIFICATION_AND_ENCRYPTED_CLEANUP_RUNTIME_MISSING ignoresflags/callback. Suppliedclassification/protectionIDs maybefalse: coherent hiddenuserhistory relabeledNONESSENTIAL can pass orderingmodel but never actualdeletion gate.

Existing accepted T005six-class safety preserved without claiming T009b done. T009b canonical never-evict policy and T010hold-transfer separate. Actualcanonicalclassifier/storage/protectedmembership/OScapacity/identifiedstaging/encryptedtransactions/atomicpromotion/crashrecovery/E1/device/runtime MISSING/HELD. Active task/core/safety/durableuserhistory/evidence/pendingacceptedop/audit/floors never actualdeleted here; no plaintextfallback/numericMBGBpercentpolicy/provider/wireformatselected. T005completeverification/peak/atomicstore gates unchanged; this proposal cannot authorize actionability or physical cleanup.

Eleven new+accepted96 full107PASS0.169s/compile. Initial full107FAIL one test0.183s: early-stoptest expected same-class rebuildableextra after original even though input placed extra first; implementation stableties correctly retained inputorder. Narrow expectedtuple correction only (no sourcechange), rerun full107PASS0.169s. Actual initial failedtest preserved, not claimed PASS or independentreviewrejection. Tests fourclassorder/stableties/allitems/no threshold/empty/accepted6protectedlabels/suppliedIDsrelabeled/unknownduplicateinvalid/mutable/hostile/immutability/nofreedbytes/coherentforgery/constantHELD. Arbitraryfixturebytecount not productionlimit. No independentverdict before sourcefreeze.

Historical source-review normalizedSHA256:
- vault/PROFILES/eviction-order-rule.md: 3c2486cb3d52ba84812b8e64f64c7b1f4c152e75cddb4a73cd3e1bcd55c4c480
- modules/e04-offline/internal/eviction_order.py: cc7924377f2c8db94147a74e584c63cb4e8118cc01babc63acffb368bac218b8
- modules/e04-offline/tests/test_eviction_order.py: 6a17663c2d313223979f496576ae410674f850f0b9f81546d6d949b0e25b1728
- modules/e04-offline/internal/stage_verify_promote.py: 926f3aa440b999ab6f8ffeba87b755f5638a03882a4352cfce16020a0d4fdd0f
- .github/workflows/e4-tests.yml: 1bc5e117dcba3d37d1620bf789890d95034b1699049b51da26b98abaa0174f62
- vault/EVIDENCE/SNAPSHOTS/E-DEV-067-E10-GOVERNED-PATHS.md.snapshot: 51558f0d1c86314aafd89fc7aa6069df342cbe5a0b2ab7a510f56aa027ab8780

Acceptedv35rawarchiveequal; successorv36original401/79/alladmissions/pendingv13/v23/v25 retained. PriorEDEV067 onlyconsumer/secondaryPR69receipt, oldsourcePASS/primary/digests/reviewer/failurehistory preserved. Actual cleanup/source/classification/device/runtimeHELD; gap anchors `vault/PROFILES/eviction-order-rule.md` / `vault/PACKS/P-E4-009a.md` / `vault/REGISTRY/T-E4-009a.md`.

Root build_index61/routingT009aREVIEW/eligible[]; run_all12checksPASS+42regressionsPASS0.457s/worstexit0; diffcheckPASS/exact13paths/rawarchiveequal. OriginalP-PROOF001warning unchanged.

## Independent full task completion receipt

Separate configured owner-selected gpt-6-luna/max /root/pr58_snapshot_binding_review FULL T-E4-009a internal ordering-rule task PASS/no actionable findings atd193ab1b3baab3f1bc5acd37dba578ef28ddfd42 over acceptedbaseec97780020c183a9f5bced3fa2a6302dd435bf41. Canonical reviewgate/harddepsnone/all13paths reviewed; fullcandidates validatedusingacceptedT005, allitems returned canonicalfourclassorder/stableties, no deletioncount/freedspace/deletion. Initial107testFAIL expectedtuple conflict with stableinputties; expectationonly corrected/not implementation/no reviewerrejection. Recordedhashes/rawacceptedarchive verified; no edits/tests/CI/provider/writes by reviewer.

Exactsourceall12CI SUCCESS: PRarchitecture37045048899 actualT3SUCCESS (earlierunlabeledduplicate37045020789), E4 37045020692 actual107PASS0.138s, E3commit37045020671/E5 37045020854/E6 37045020838/live37045020663; pusharchitecture37045003381/E4 37045003112/E3commit37045003211/E5 37045003359/E6 37045003317/live37045003285. Root11new+accepted96full107PASS0.169s/compile/run_all12checks+42PASS0.457s/worstexit0/build_index61/routingREVIEW/eligible[]/diff/exact13paths/rawarchiveequal. Actualinitialfull107FAILone0.183s and expectationonlyfix/PASS retained distinctly. OriginalP-PROOF001warning unchanged.

DirectstandingownerDEC0069/0070 mandate accepts independentFULLdelegatedtaskPASS/normalmatchedmerge after applicablecurrentgreenCIuntilrevoked; pendingplanPR4unmerged/not governingmain distinguished. Profile/packACTIVE/taskDONE only internalorderingrule, not actualcleanup. Suppliedclassification/protectedIDs notcanonicalproof/alloutputsNONE/constantproductionHELD. Actualclassification/protectedmembership/storagecapacity/encryptedcleanup/atomictransactions/crashrecovery/E1/device/runtime MISSING/HELD. Coherent protecteddatarelabel not actualdeletionpermission; no actualfreedbytes/storageeffect/productreadyclaim. ExistingT005safety/coreverification/peak/atomicstore unchanged; T009bneverevictpolicy/T010hold-transfer remainseparate notDONEhere. E3R1REVIEW/E5-003IN_PROGRESS/unmergedPR47/57/59unchanged. Six finaldocumentary/viewpaths only; source/tests/workflow/archive/inventory/manifest/CIplan/priorproof unchanged. Independentfinalmetadataaudit/latesthead12CI remain premergegates.

Historicalreviewedprimary 3c2486cb3d52ba84812b8e64f64c7b1f4c152e75cddb4a73cd3e1bcd55c4c480 preserved; currentACTIVEprimary 03b82292b99cd08370f16a4b9eb69905164506c44cf5c7ae0d999e298ad2478b. ActualinitialtestFAIL/fix/PASS retained; no independentsource rejection or actualcleanup/deviceproof inferred.

Final six-file metadata verification: build_index61/routingT009aDONE/eligible[]; run_all12checksPASS+42regressionsPASS0.435s/worstexit0; diffcheckPASS/exactsixpaths. OriginalP-PROOF001warning unchanged.

## Secondary accepted custody receipt / T-E4-009b consumption

PR70final6f10ae3c7c88f0f8a83d5b2946f266dc22ca0406 separateconfiguredgpt-6-luna/max finalmetadataPASS/no findings, exactfinalall12CIgreen/actualPRT3SUCCESS37045542209/E4CI107PASS0.161s. Normalmatchedmergeacf2809df8e0c1a41caada3fe55388e212ec3181 verified2026-10-02T18:12:35Z. Sourced193ab1/FULLtaskPASS/primary/digests/reviewer/history retained. Inventoryv36rawarchive `vault/EVIDENCE/SNAPSHOTS/E-DEV-068-E10-GOVERNED-PATHS.md.snapshot`; consumers `vault/PACKS/P-E4-009b.md` / `vault/EVIDENCE/E-DEV-069.md`. InternalorderingruleDONE/actualclassificationstoragecleanup/deviceHELD.
