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
status: REVIEW
---

# Six-class never-evict policy

Canonical T009b/ADR009R4/BR131-133/C4.4/F4.4.1/FL4.4.1 reviewgate, harddepT009aDONE acceptedmainacf2809df8e0c1a41caada3fe55388e212ec3181/PR70 actuallymerged2026-10-02T18:12:35Z after independently reviewed source/finalmetadataPASS/exactfinal12CIactualT3. AcceptedT005sixclassconstants and T009aordering reused within E4/privatelegal, not modified/newpublicseam/privatecrossimport. Acceptedremoteplanmainfa914f013fdcd032faed876689092da245989459/localstaleplanmain7d705a69/localpendingbranch e3c2e3f/planPR4unmerged/directmandate distinguished. E3R1REVIEW/E5-003IN_PROGRESS/unmergedPR47/57/59unchanged.

StorageClassification freezes objectID/plain unique class tuple; malformed/mutable/hostile/emptylabel/duplicatelabel rejects. Six protected labels imported unchanged: ACTIVE_TASK_COMPLETE_PACKAGE, REQUIRED_SAFETY_MEDIA, DURABLE_USER_DATA, PENDING_OR_ACCEPTED_OPERATION_TRUTH, PROTECTED_AUDIT_OR_AUTHORITY, NEGATIVE_FLOOR. Durableclass covers history/notes/photos/safety-critical evidence/corrections; operations covers pending/accepted identities/results/conflicts; negativefloors recalls/suspensions/deletions/security blocks. These are semantic policy mappings, not proof actualobjectwriter/classification exists.

assess_protection anyprotectedlabel yields NEVER_EVICT_PROTECTED_CLASS even alongside disposable/unknownlabels. Empty/unknown labels HELD_STORAGE_CLASSIFICATION_UNKNOWN; multipleknown-disposable labels HELD_STORAGE_CLASSIFICATION_CONFLICT; exactsingletondisposable DECLARED_DISPOSABLE_ONLY/NONE, never deletionpermission. guard_eviction requires plainunique classifications; validates acceptedT009a entire candidateorder/protectedIDs then eachcandidate sameIDfact, nonprotected/unheld singleton exactdata_class. Missing/mismatched/duplicate/mutable/hostilefacts reject; relabeledcandidate cannot override suppliedprotectedinventoryfact. Extra protected inventoryfacts permitted/not candidate; explicitprotectedIDs still reject. No actualdelete/OScapacity/reclaimedbytes/cachelimit/provider/wireformat or classification producer.

Eleven new+accepted107 full118PASS0.242s/compile. Tests exactsix/allprotectedcandidate relabel/mixedlabelsprotectiondominance/unknownempty/conflict/missingmismatch/duplicate/type/hostile/immutability/preservedfourclassorder/extra protectedinventory/explicitIDs/coherentforgery/constantHELD. No unitfailure or independentverdict before sourcefreeze. PreviousT009a initial107FAILexpectation-onlycorrection remains preserved in priorEDEV068, not this task failure or source rejection.

AlloutputsNONE/productionconstantHELD_CANONICAL_PROTECTED_STORAGE_SOURCE_AND_ENCRYPTED_RUNTIME_MISSING ignoresflags/callback. Coherently falsifieddisposableclassification canpassmodel but never authorizesactualdeletion. Actualcanonicalclassifier/protectedmembership/activepackageidentity/negativefloors/generation/storagecapacity/OS/encryptedcleanup/transaction/crashrecovery/E1/AndroidiOSdevice/runtime MISSING/HELD; no productready/UIpreservation/physicalstorageproof. T005completeverification/peak/atomicstore unchanged; T010staginghold separate notclosedhere. No plaintextfallback/numericquota selected.

## Trace

ADR009R4 -> C4.4 -> F4.4.1 -> FL4.4.1 -> T-E4-009b -> M-E4-001 -> E-DEV-069. Clientlogic/E1screenHELD/no renderer/data no persistence/releaseNONE/internalreviewtask/product physicalgates above. Source `modules/e04-offline/internal/never_evict.py`; tests `modules/e04-offline/tests/test_never_evict.py`; acceptedvalidator `modules/e04-offline/internal/stage_verify_promote.py`; workflow `.github/workflows/e4-tests.yml`; pack `vault/PACKS/P-E4-009b.md`; task `vault/REGISTRY/T-E4-009b.md`; proof `vault/EVIDENCE/E-DEV-069.md`. FULLcanonicaltask review/exactheadCI required before internalruleDONE; no selfPASS.
