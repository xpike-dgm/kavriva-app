---
test_id: E-DEV-069
contract_id_version: "ADR009 R4; never-evict policy v1"
subject_file: vault/PROFILES/never-evict-policy.md
subject_digest: 0df8ba7a09d4fc2af12b25c585225f503942bf9e7010e2f0510cb7b0be5bc730
result: "RECORDED six-class protection fixtures; independent full task review required"
evidence_links:
  - "vault/PROFILES/never-evict-policy.md"
  - "vault/PACKS/P-E4-009b.md"
  - "vault/REGISTRY/T-E4-009b.md"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-068-E10-GOVERNED-PATHS.md.snapshot"
  - "modules/e04-offline/internal/never_evict.py"
  - "modules/e04-offline/tests/test_never_evict.py"
  - ".github/workflows/e4-tests.yml"
gate_verdict: RECORDED
reviewer: none
timestamp: 2026-10-02
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
depends_on: [V-E4-PROTECTED-001]
used_by: [V-E4-PROTECTED-001, P-E4-009b, T-E4-009b]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-069 six-class never-evict policy

Thirteenpath/fourteenfield pack saved before code. Canonical task/deps/reviewmatrix138/ADR009R2/R4/R7/R8/DEBATE017manager/BR131-133/C4.4/F4.4.1/FL4.4.1/E1screenHELD/acceptedT005/proofs/inventory/E4manifest/packagecontract/boundaries/protocol/pack/rules/validation/closure/ownerstatus/custody/CI read. Fulltask independentreview/current12CI/actualPRT3 required; no authorPASS/DONE or partialtaskverdict.

Canonical T009b/ADR009R4/BR131-133/C4.4/F4.4.1/FL4.4.1 reviewgate, harddepT009aDONE acceptedmainacf2809df8e0c1a41caada3fe55388e212ec3181/PR70 actuallymerged2026-10-02T18:12:35Z after independently reviewed source/finalmetadataPASS/exactfinal12CIactualT3. AcceptedT005sixclassconstants and T009aordering reused within E4/privatelegal, not modified/newpublicseam/privatecrossimport. Acceptedremoteplanmainfa914f013fdcd032faed876689092da245989459/localstaleplanmain7d705a69/localpendingbranch e3c2e3f/planPR4unmerged/directmandate distinguished. E3R1REVIEW/E5-003IN_PROGRESS/unmergedPR47/57/59unchanged.

StorageClassification freezes objectID/plain unique class tuple; malformed/mutable/hostile/emptylabel/duplicatelabel rejects. Six protected labels imported unchanged: ACTIVE_TASK_COMPLETE_PACKAGE, REQUIRED_SAFETY_MEDIA, DURABLE_USER_DATA, PENDING_OR_ACCEPTED_OPERATION_TRUTH, PROTECTED_AUDIT_OR_AUTHORITY, NEGATIVE_FLOOR. Durableclass covers history/notes/photos/safety-critical evidence/corrections; operations covers pending/accepted identities/results/conflicts; negativefloors recalls/suspensions/deletions/security blocks. These are semantic policy mappings, not proof actualobjectwriter/classification exists.

assess_protection anyprotectedlabel yields NEVER_EVICT_PROTECTED_CLASS even alongside disposable/unknownlabels. Empty/unknown labels HELD_STORAGE_CLASSIFICATION_UNKNOWN; multipleknown-disposable labels HELD_STORAGE_CLASSIFICATION_CONFLICT; exactsingletondisposable DECLARED_DISPOSABLE_ONLY/NONE, never deletionpermission. guard_eviction requires plainunique classifications; validates acceptedT009a entire candidateorder/protectedIDs then eachcandidate sameIDfact, nonprotected/unheld singleton exactdata_class. Missing/mismatched/duplicate/mutable/hostilefacts reject; relabeledcandidate cannot override suppliedprotectedinventoryfact. Extra protected inventoryfacts permitted/not candidate; explicitprotectedIDs still reject. No actualdelete/OScapacity/reclaimedbytes/cachelimit/provider/wireformat or classification producer.

Eleven new+accepted107 full118PASS0.242s/compile. Tests exactsix/allprotectedcandidate relabel/mixedlabelsprotectiondominance/unknownempty/conflict/missingmismatch/duplicate/type/hostile/immutability/preservedfourclassorder/extra protectedinventory/explicitIDs/coherentforgery/constantHELD. No unitfailure or independentverdict before sourcefreeze. PreviousT009a initial107FAILexpectation-onlycorrection remains preserved in priorEDEV068, not this task failure or source rejection.

AlloutputsNONE/productionconstantHELD_CANONICAL_PROTECTED_STORAGE_SOURCE_AND_ENCRYPTED_RUNTIME_MISSING ignoresflags/callback. Coherently falsifieddisposableclassification canpassmodel but never authorizesactualdeletion. Actualcanonicalclassifier/protectedmembership/activepackageidentity/negativefloors/generation/storagecapacity/OS/encryptedcleanup/transaction/crashrecovery/E1/AndroidiOSdevice/runtime MISSING/HELD; no productready/UIpreservation/physicalstorageproof. T005completeverification/peak/atomicstore unchanged; T010staginghold separate notclosedhere. No plaintextfallback/numericquota selected.

Source-review normalizedSHA256:
- vault/PROFILES/never-evict-policy.md: 0df8ba7a09d4fc2af12b25c585225f503942bf9e7010e2f0510cb7b0be5bc730
- modules/e04-offline/internal/never_evict.py: 66c21b3b953aec2e72b38276910d727835d146de88fbd624b77ed18be2630c8e
- modules/e04-offline/tests/test_never_evict.py: e27edaec4c33b5a4837d172f60d5cb343cf6e1b40be585cfc41a26e04c024e0b
- modules/e04-offline/internal/stage_verify_promote.py: 926f3aa440b999ab6f8ffeba87b755f5638a03882a4352cfce16020a0d4fdd0f
- .github/workflows/e4-tests.yml: 1bc5e117dcba3d37d1620bf789890d95034b1699049b51da26b98abaa0174f62
- vault/EVIDENCE/SNAPSHOTS/E-DEV-068-E10-GOVERNED-PATHS.md.snapshot: a82edc70dce2f9d63a8b35a12987dd872b622b54616535e297c271ce8b4a1068

Acceptedv36rawarchiveequal; successorv37original401/79/alladmissions/pendingv13/v23/v25 retained. PriorEDEV068 onlyconsumer/secondaryPR70receipt, oldsourcePASS/primary/digests/reviewer/failurehistory preserved. Actual cleanup/source/classification/device/runtimeHELD; gap anchors `vault/PROFILES/never-evict-policy.md` / `vault/PACKS/P-E4-009b.md` / `vault/REGISTRY/T-E4-009b.md`.

Accepted ordering helper normalizedSHA256: modules/e04-offline/internal/eviction_order.py: cc7924377f2c8db94147a74e584c63cb4e8118cc01babc63acffb368bac218b8
Root build_index62/routingT009bREVIEW/eligible[]; run_all12checksPASS+42regressionsPASS0.541s/worstexit0; diffcheckPASS/exact13paths/rawarchiveequal. OriginalP-PROOF001warning unchanged.

Root post-review documentary correction: prior-proof prose name EDEV067 corrected to actual preserved EDEV068; manifest protection-policy heading clarified. Source/tests/digests unchanged; FULLtask re-review at corrected exacthead required. Earlier c24faf5 FULLtaskPASS preserved, no independent rejection or testfailure inferred.
