---
test_id: E-DEV-063
contract_id_version: "ADR009 R1b; optional size presentation rule v1"
subject_file: vault/PROFILES/optional-size-shown.md
subject_digest: f0d8bc6b124f515f878c52e64f9891ff198e0f9f72c329fc6fcb6e258432074b
result: "PASS full internal size-before-request task; actual display and runtime HELD"
evidence_links:
  - "vault/PROFILES/optional-size-shown.md"
  - "vault/PACKS/P-E4-004.md"
  - "vault/REGISTRY/T-E4-004.md"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-062-E10-GOVERNED-PATHS.md.snapshot"
  - "modules/e04-offline/internal/size_shown.py"
  - "modules/e04-offline/tests/test_size_shown.py"
  - ".github/workflows/e4-tests.yml"
gate_verdict: "PASS internal size-before-request task only; production HELD"
reviewer: "/root/pr58_snapshot_binding_review; gpt-6-luna/max; full task PASS at9360a924524a10155f423ee7224aee0d71718c64"
timestamp: 2026-10-02
purpose: Bind optional request to exact current declared size presentation
domain: offline-package
module: e04-offline
owner: E4
implements: [ADR-009, CON-005, C4.1, F4.1.2, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: optional-size-shown-rule
tasks: [T-E4-004]
tests: [modules/e04-offline/tests/test_size_shown.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E4-SIZE-001]
used_by: [V-E4-SIZE-001, P-E4-004, T-E4-004, P-E4-005, E-DEV-064]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-063 size presentation rule

Source-freeze sections below are historical at9360a92; current full-task acceptance and separate product holds are recorded in the completion receipt below.

Thirteen-path/fourteen-field pack saved before code. Canonical task/dependency/review matrix/T003 dependency closure/DEC0023/CON005/ADR009R1/R3/R7/R8/C4.1/F4.1.2/FL4.1.2/E1 screenHELD/E4 manifest/package contract/E3 quarantine boundary/accepted E4 source/proofs/protocol/boundaries/rules/validation/closure/ownerstatus/custody/CI inspected. Acceptedbase d0b5b06778b8a2789c96f1454607e5de8140c6fc; planmain fa914f013fdcd032faed876689092da245989459, pendingplanPR4/unresolvedPR47/57/59 unmerged/direct standing human mandate. T003 harddependency actually DONE internal rules only, not product runtime.

Pure exact size text/spec/request presentation binding before unchanged optional request model; no screen/network/storage/auth effect. Supplied coherent forged receipt can pass model and never opens constant productionHELD/intrinsicNONE. Twelve new+accepted35 full47PASS0.064s/compile, no unit failure or independent review before freeze. No actual size display/user saw-size/transfer/authentication/semantic classification/product readiness claim.

Historical source-review normalizedSHA256:
- vault/PROFILES/optional-size-shown.md: 76abdb715c298a51c86f6a395cff09b2820a48a47246945481eb099fe27b3dc4
- modules/e04-offline/internal/size_shown.py: c55f10c15e053d2bcd4aca127d6631d00cdadfb977ff41f0557eb6b2cc70bd89
- modules/e04-offline/tests/test_size_shown.py: 6ddf6ec07f92fd8c7186f019f0a0b0a2f75beae65e45244bf4eadc99c2dd6965
- modules/e04-offline/internal/optional_media.py: dc8bcc95e27b9fc7a71faac9e7fa5cfbacfdbd03c44079fbc6902508097be842
- modules/e04-offline/internal/core_composition.py: a894a6d6695badf7917804a29152f026f752c48f23a3db759bd17def800c0249
- modules/e04-offline/internal/safety_media_nesting.py: d622a9af5b13c4e67949b6c4179ec2a38563ca32143fc98c74f8671305a48e15
- .github/workflows/e4-tests.yml: 1bc5e117dcba3d37d1620bf789890d95034b1699049b51da26b98abaa0174f62
- vault/EVIDENCE/SNAPSHOTS/E-DEV-062-E10-GOVERNED-PATHS.md.snapshot: 6acf3766dbfd7f8f432264db718e296cca92a7c643e0a59993dd16bb8b422df1

Acceptedv30 raw archive equal; successorv31 original401/79catalog/alladmissions/pendingv13/v23/v25 reservations retained. PriorEDEV062 original sourcePASS/rootactualerror/fix/metadataCHANGES_REQUESTED/PASS/digests/history preserved with documentaryconsumer/secondaryfinalreceipt only. Actual E1 renderer/visibility/accessibility/gesture/receipt provenance, trusted source/classification/currentcontext, physical fetch/cancellation/eviction/encrypted durable storage/mobile runtime MISSING/HELD; gap anchors `vault/PROFILES/optional-size-shown.md` / `vault/PACKS/P-E4-004.md` / `vault/REGISTRY/T-E4-004.md`. At historical source freeze no authorPASS/DONE; full task independent review/exact source twelve CI/actualT3 were required. Current acceptance recorded below.

Root graph12checks+42regressionsPASS0.776s/worstexit0/build_index56/routingT004REVIEW/eligible[]/diff/exact13paths/archive rawbyteequal. Original P-PROOF001warning unchanged. At historical source freeze full task independent review/exact twelve CI/actualPRT3 were still required; no authorPASS/DONE. Current acceptance recorded below.

## Independent full task completion receipt

Separate configured owner-selected gpt-6-luna/max /root/pr58_snapshot_binding_review FULL T-E4-004 internal size-before-request task PASS/no actionable source findings at9360a924524a10155f423ee7224aee0d71718c64 against acceptedbase d0b5b06778b8a2789c96f1454607e5de8140c6fc. Canonical review-gate/taskdependency T003DONE and E4 client logic/E1 screenHELD inspected; exact byte label/spec/request receipt guards accepted with no thresholds/core prompt/effect/new seam. Reviewer checked full13paths/digests/byteequalarchive/dependency; no tests/CI/provider/writes. No source rejection or failure in this task history.

Exact source all12CI SUCCESS: PRarchitecture37034309627 actualT3SUCCESS (earlier unlabeled duplicate37034288919), E4 37034288961 actual47PASS0.035s, E3commit37034288922/E5 37034288873/E6 37034288941/live37034288958; pusharchitecture37034238976/E4 37034238942/E3commit37034239078/E5 37034239125/E6 37034239041/live37034238873. Root47PASS0.064s/compile, graph12checks+42regressionsPASS0.776s/worstexit0/index56/routing/diff/exact13paths/rawarchive. Original P-PROOF001warning unchanged.

Owner direct standing DEC0069/0070 accepts full delegated task PASS/normal matchedheadmerge after current applicable greenCI until revoked; pendingplanPR4 remainsunmerged, not claimed governing main. Profile/packACTIVE/taskDONE only internal size-before-request rule. This does not prove a person saw size: real E1 screen/presentation provenance/visibility/accessibility/authenticated intent, trusted source/semantic classification/currentcontext and physical transfer/cancellation/eviction/encrypted durable storage/device/mobile runtime remain MISSING/HELD. Future live E1 entrypoint must route through this rule and establish real presentation before transfer; caller fixture receipt alone never suffices. Coherent forged receipt can pass model, all outputsNONE/productionconstantHELD. Required core CON005 unchanged. No actual UI/display/permission/approvedpackage/productready claim. E3R1REVIEW/E5-003IN_PROGRESS/unresolvedPR47/57/59 unchanged. Final six metadata/view files only; source/tests/acceptedcheckers/workflow/archive/inventory/manifest/CIplan/priorproof unchanged. Final independent metadata audit/latesthead12CI required before normal merge.

Reviewed source primary 76abdb715c298a51c86f6a395cff09b2820a48a47246945481eb099fe27b3dc4 preserved as historical review digest; current ACTIVE primary f0d8bc6b124f515f878c52e64f9891ff198e0f9f72c329fc6fcb6e258432074b. No previous source rejection or unit failure in this task; no actual screen or runtime proof inferred.

Final root metadata preparation graph12checks+42regressionsPASS0.607s/worstexit0/build_index56/routingT004DONE/eligible[]/diff, exact six closeout paths. Original P-PROOF001warning unchanged. Independent final metadata audit and latest-head12CI remain required before normal merge.

## Secondary accepted custody receipt / T-E4-005 consumption

PR65finalde2672989df2af9dee93b76119b7ef2af19cc883 separate configured gpt-6-luna/max final metadata PASS/no findings, exactfinalall12CIgreen/actualPRT3SUCCESS37035231920/E4CI47PASS0.027s. Normal matchedheadmerge d862e2f0cfb7a8b8e02ab0e2df7f4c17fef082b7 verified2026-10-02T16:41:08Z. Original reviewedsource9360a92/primary/digests/reviewer/no-rejection/history retained. Inventoryv31 rawarchive `vault/EVIDENCE/SNAPSHOTS/E-DEV-063-E10-GOVERNED-PATHS.md.snapshot`; documentary consumers `vault/PACKS/P-E4-005.md` / `vault/EVIDENCE/E-DEV-064.md`. Internal size rule DONE, actual E1 displayed/user/transfer/runtime proof stillHELD.
