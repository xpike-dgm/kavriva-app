---
record_id: V-E4-PROTECTED-001
version: 1
purpose: Protect six declared storage classes from routine automatic eviction
domain: offline-package
module: e04-offline
owner: E4
implements: [ADR-009, C4.4, F4.4.1, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: never-evict-policy
tasks: [T-E4-009b]
tests: [modules/e04-offline/tests/test_never_evict.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [T-E4-009a, M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-009b, T-E4-009b, E-DEV-069]
evidence: [E-DEV-069]
supersedes: []
status: ACTIVE
---

# Six-class never-evict policy

Historical pre-code/source-freeze sections below preserved; current FULLtask acceptance and separate product holds recorded in completion receipt.

Canonical T009b/ADR009R4/BR131-133/C4.4/F4.4.1/FL4.4.1 reviewgate, harddepT009aDONE acceptedmainacf2809df8e0c1a41caada3fe55388e212ec3181/PR70 actuallymerged2026-10-02T18:12:35Z after independently reviewed source/finalmetadataPASS/exactfinal12CIactualT3. AcceptedT005sixclassconstants and T009aordering reused within E4/privatelegal, not modified/newpublicseam/privatecrossimport. Acceptedremoteplanmainfa914f013fdcd032faed876689092da245989459/localstaleplanmain7d705a69/localpendingbranch e3c2e3f/planPR4unmerged/directmandate distinguished. E3R1REVIEW/E5-003IN_PROGRESS/unmergedPR47/57/59unchanged.

StorageClassification freezes objectID/plain unique class tuple; malformed/mutable/hostile/emptylabel/duplicatelabel rejects. Six protected labels imported unchanged: ACTIVE_TASK_COMPLETE_PACKAGE, REQUIRED_SAFETY_MEDIA, DURABLE_USER_DATA, PENDING_OR_ACCEPTED_OPERATION_TRUTH, PROTECTED_AUDIT_OR_AUTHORITY, NEGATIVE_FLOOR. Durableclass covers history/notes/photos/safety-critical evidence/corrections; operations covers pending/accepted identities/results/conflicts; negativefloors recalls/suspensions/deletions/security blocks. These are semantic policy mappings, not proof actualobjectwriter/classification exists.

assess_protection anyprotectedlabel yields NEVER_EVICT_PROTECTED_CLASS even alongside disposable/unknownlabels. Empty/unknown labels HELD_STORAGE_CLASSIFICATION_UNKNOWN; multipleknown-disposable labels HELD_STORAGE_CLASSIFICATION_CONFLICT; exactsingletondisposable DECLARED_DISPOSABLE_ONLY/NONE, never deletionpermission. guard_eviction requires plainunique classifications; validates acceptedT009a entire candidateorder/protectedIDs then eachcandidate sameIDfact, nonprotected/unheld singleton exactdata_class. Missing/mismatched/duplicate/mutable/hostilefacts reject; relabeledcandidate cannot override suppliedprotectedinventoryfact. Extra protected inventoryfacts permitted/not candidate; explicitprotectedIDs still reject. No actualdelete/OScapacity/reclaimedbytes/cachelimit/provider/wireformat or classification producer.

Eleven new+accepted107 full118PASS0.242s/compile. Tests exactsix/allprotectedcandidate relabel/mixedlabelsprotectiondominance/unknownempty/conflict/missingmismatch/duplicate/type/hostile/immutability/preservedfourclassorder/extra protectedinventory/explicitIDs/coherentforgery/constantHELD. No unitfailure or independentverdict before sourcefreeze. PreviousT009a initial107FAILexpectation-onlycorrection remains preserved in priorEDEV068, not this task failure or source rejection.

AlloutputsNONE/productionconstantHELD_CANONICAL_PROTECTED_STORAGE_SOURCE_AND_ENCRYPTED_RUNTIME_MISSING ignoresflags/callback. Coherently falsifieddisposableclassification canpassmodel but never authorizesactualdeletion. Actualcanonicalclassifier/protectedmembership/activepackageidentity/negativefloors/generation/storagecapacity/OS/encryptedcleanup/transaction/crashrecovery/E1/AndroidiOSdevice/runtime MISSING/HELD; no productready/UIpreservation/physicalstorageproof. T005completeverification/peak/atomicstore unchanged; T010staginghold separate notclosedhere. No plaintextfallback/numericquota selected.

## Trace

ADR009R4 -> C4.4 -> F4.4.1 -> FL4.4.1 -> T-E4-009b -> M-E4-001 -> E-DEV-069. Clientlogic/E1screenHELD/no renderer/data no persistence/releaseNONE/internalreviewtask/product physicalgates above. Source `modules/e04-offline/internal/never_evict.py`; tests `modules/e04-offline/tests/test_never_evict.py`; acceptedvalidator `modules/e04-offline/internal/stage_verify_promote.py`; workflow `.github/workflows/e4-tests.yml`; pack `vault/PACKS/P-E4-009b.md`; task `vault/REGISTRY/T-E4-009b.md`; proof `vault/EVIDENCE/E-DEV-069.md`. At historical source freeze FULLcanonicaltask review/exactheadCI were required before internalruleDONE; no selfPASS. Current acceptance below.

## Independent full task completion receipt

Separate configured owner-selected gpt-6-luna/max /root/pr58_snapshot_binding_review FULL T-E4-009b internal protection-policy task PASS/no actionable findings atd273baef10ea56e61570489d0aee230a5960937b over acceptedbaseacf2809df8e0c1a41caada3fe55388e212ec3181. Earlierc24faf53FULLtaskPASS/no findings retained; root spotted prior-proof prose namedEDEV067 despite actualEDEV068 and ambiguousmanifestheading, corrected exactly2documentarypaths/no source/test/profile change, rereviewFULLtaskPASS atd273. No independentrejection/currentunitfailure inferred; previousT009a107FAILexpectationfix remains priorhistory only. All13paths/hash/rawarchive verified, no edits/tests/CI/provider/writes by reviewer. Protectedlabels dominate disposable/unknown, emptyunknown/conflictinghold; eachcandidate matching singletonfact required, relabelrejects; acceptedT009aorder/T005checks unchanged.

Correctedsourceall12CI SUCCESS: PRarchitecture37047001884 actualT3SUCCESS/E4 37047001850 actual118PASS0.164s/E3commit37047001813/E5 37047001797/E6 37047001972/live37047002035; pusharchitecture37046996630/E4 37046996686/E3commit37046996600/E5 37046996674/E6 37046996615/live37046996663. Earlierc24sourceall12SUCCESS: PRarchitecture37046551432actualT3/E4 37046530506actual118PASS0.164s/E3commit37046530324/E5 37046530465/E6 37046530322/live37046530353; pusharchitecture37046523054/E4 37046523254/E3commit37046522977/E5 37046523424/E6 37046523075/live37046523018. Earlierunlabeledduplicate37046530310 not substitute foractualT3. Root11new+107acceptedfull118PASS0.242s/compile/run_all12checks+42PASS0.541s/worstexit0/build_index62/routingREVIEW/eligible[]/diff/exact13paths/rawarchiveequal; originalP-PROOF001warning unchanged.

DirectstandingownerDEC0069/0070 mandate accepts independentFULLdelegatedtaskPASS/normalmatchedmerge after applicablecurrentgreenCIuntilrevoked; pendingplanPR4unmerged/not governingmain distinguished. Profile/packACTIVE/taskDONE only internalprotectionpolicy, not trustedclassifier/physicaldeletion safeguard. AlloutputsNONE/constantproductionHELD. Actualcanonicalclassification/protectedmembership/activepackage/generation/floors/storagecapacity/cleanup/encryptedtransaction/crashrecovery/E1/device/runtime MISSING/HELD. Coherent falseclassification cannot authorize actualdelete/reclaimedspace/physicalUIpreservation/productreadiness. ExistingT005completeverification/peak/atomicstore/T009aorderingunchanged; T010separate/notDONEhere. E3R1REVIEW/E5-003IN_PROGRESS/unmergedPR47/57/59unchanged. Final6documentary/viewpaths only/source/tests/workflow/archive/inventory/manifest/CIplan/priorproofunchanged. Independentfinalmetadataaudit/latesthead12CI remain gates before normalmerge.
