---
record_id: V-E9-DISCIPLINE-001
version: 1
purpose: Apply existing independent roles and plain external-action notice to project AI work
domain: assistant-project-discipline
module: e09-ai
owner: E9
implements: [ADR-014, ADR-001, C9.7, F9.7.1, C10.7, F10.7.1, R-001, R-003, R-004, R-007, R-009, R-013]
public_contracts: []
internal_scope: project-role-notice-reference
tasks: [T-E9-011]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-03
depends_on: [M-E9-001, V-E10-REVIEW-001, V-E10-PARALLEL-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E9-011, T-E9-011, E-DEV-085]
evidence: [E-DEV-085]
supersedes: []
status: ACTIVE
---

# Project AI discipline: separated roles and plain external notice

Canonical T-E9-011/C9.7/F9.7.1/FL9.7.1 is a discipline reference to F10.7.1/C10.7. The ACTIVE E10 protocol below owns the rules and notice; this E9 application does not create a parallel protocol, automated review mechanism or qualified human authority. No hard task dependency. Actual independent FULL and source CI acceptance are recorded in E-DEV-085. Final metadata audit and exact final-head CI remain required before merge.

## Governing direction and owning protocol

ADR014 Decision7 says project/company AI work follows DEC-0028/DEC-0029: separate implementer/reviewer/validator roles, evidence and independent review; AI never impersonates legal identity, store ownership or qualified attestation. [Exact Decision7 source](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-014__AI_LLM_ASSISTANCE_AND_DECISION_LAYER.md#L87-L88).

The existing [V-E10-REVIEW-001v1 protocol](https://github.com/xpike-dgm/kavriva-app/blob/386d6e110eab48b056dfe2538984dc047b39fcc5/modules/e10-graph/INDEPENDENT_REVIEW_AND_EXTERNAL_NOTICE.md) controls bounded context, exact source/head, independent judgment, actual actions, findings and re-review, owner authority, current CI and the external-action notice. [V-E10-PARALLEL-001v1](https://github.com/xpike-dgm/kavriva-app/blob/386d6e110eab48b056dfe2538984dc047b39fcc5/modules/e10-graph/PARALLEL_OUTPUT_GUARDS.md) separately controls shared frozen brief, separated outputs, no overwrite, disagreement preservation and agreement not approval. E10 serves the tooling plane one way; E9 does not own or modify either source.

## E9 role application

| Role | Required responsibility | Cannot substitute for |
|---|---|---|
| Implementer | Work inside saved pack; supply actual outcome/diff/tests/proof/limitations and exact head | Independent reviewer or qualified external actor |
| Independent reviewer | Separate bounded assignment/context and initial judgment; inspect canonical acceptance and exact head; findings and verdict plus actual actions | Implementer self-PASS, agreement vote or automatic CI |
| Consequence validator | Separate validation where current source/consequence demands it; record performed checks and missing external proof | Fictional quorum, unperformed production/device/custody validation |
| Nontechnical owner | Product/result/permission decisions in plain language; existing standing authorization honored | Hidden developer, debugger, legal/store/qualified attestation supplied by AI |

Using the same model does not merge the roles, and renaming one conversation is not independence. The human currently accepts delegated independent second-eye under accepted DEC-0069 and requests gpt-6-luna/max; configured spawn provenance is recorded honestly. This is the current owner's preference, not a universal model guarantee, numeric quorum or runtime self-attestation. Actual independent verdict is required: checker agreement or the implementer's green tests cannot provide it.

Freeze task acceptance, minimum sources, base/head and allowed paths. Preserve findings and rejected heads; repair within authority and get corrected-head re-review. State what the reviewer inspected versus tests/CI supplied by the implementer; never claim reviewer execution from copied logs. DEC-0068 batches task slices in one PR, review at task end before accepted DONE. Source acceptance/current CI and final metadata/current-head CI precede normal merge; no main push/bypass/admin override. A PASS never creates missing production authority or upper-layer closure.

## Nontechnical external-action notice

Use the exact existing [owner notice template](https://github.com/xpike-dgm/kavriva-app/blob/386d6e110eab48b056dfe2538984dc047b39fcc5/modules/e10-graph/INDEPENDENT_REVIEW_AND_EXTERNAL_NOTICE.md#notice-template-for-the-owner), including all six fields:

1. **Ne bekliyor:** State the unavailable user outcome.
2. **Neden senden/dışarıdan bir işlem gerekiyor:** Cite the actual external source/rule and missing account, ownership, approval or qualified proof; do not invent a requirement.
3. **Yapılması gereken:** Name the actual person, exact link/place and short steps. Do not ask for code, debugging or an unexplained architecture choice.
4. **Seçenekler:** Give feasible wait/independent-work/alternative options, known cost/delay, risk and reversibility. Unknown price or time stays unknown.
5. **Önerim:** Recommend an authorized option based on real evidence.
6. **Benim sürdüreceğim iş:** Name concrete independent work that can continue. The waiting external action is not assumed completed.

Determine existing human authorization and available capability first. Do not repeatedly request already granted permissions. For a truly missing action or authority, prepare the concrete reviewable result, explain why input is needed and which source demands it, then request only the missing information/action. Do not turn the owner into a technical repair worker. Keep dependent activation held while authorized independent work proceeds. This reference enacts no account, store, legal, recovery or device action; the template is not proof that one occurred.

## Negative cases and limits

Reject self-PASS, one context relabeled as three roles, agreement-as-approval, stale head approval, checker output as reviewer judgment, CI logs claimed as reviewer-run tests, missing rejection/finding history, silent scope change or product readiness inferred from specification approval. Reject AI impersonation of legal identity/store ownership/qualified attestation, notices asking owner debugging or guessing costs/delays, fabricated missing obligations and repeated granted-permission questions. Current unknown or absent external qualification/custody/device proof remains visible and held; no automatic chats/API/tools or new reason schema/quorum selected.

E9 proposes, E3 verifies, E1 renders; this protocol reference introduces no public contract, private import or E1–E9 cycle. No provider/model/tool binding/account/key/paid choice/runtime/code/tests/workflows/E1 UI/native/device or physical action. Actual E3/E5/E1/provider/runtime/device/physical and universal operational handoff proof remains MISSING/HELD. T006 unfinished actual tool-authority/binding/retry-configuration/trustworthy cost evidence; T007 dependency006DONE unmet. T-E3-001-R1 REVIEW/T-E5-003 IN_PROGRESS and held PR47/57/59 unchanged. Complete discipline-reference acceptance is not full product/feature/flow/real external qualification.

Bounded P-E9-011v1 handoff follows approved D-APP-DOC-004v1/P-E10-007; missing universal operational handoff ID remains MISSING/BLOCKED for affected real handoff. No live state changed; revert own reference preserving evidence and E10 ownership.

## Trace and task addresses

C9.7 -> F9.7.1 -> FL9.7.1 -> T-E9-011 -> M-E9-001 -> E-DEV-085; F10.7.1/C10.7 remains E10 tooling reference, not a new runtime edge. [Canonical task/acceptance](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/TASK_INDEX.md). Profile `vault/PROFILES/project-ai-role-notice.md`; pack `vault/PACKS/P-E9-011.md`; task `vault/REGISTRY/T-E9-011.md`; proof `vault/EVIDENCE/E-DEV-085.md`.

## Actual complete discipline-reference FULL acceptance and source CI / bounded closure
Independent /root/e9011_project_role_notice_full_review configured via actual successful spawn gpt-6-luna/max under direct human preference/acceptedDEC0069 returned FULL PASS nofindings atd87a159ba0ca7e933d708ba5ef82d61cc96e5dca vsacceptedmain386d6e110eab48b056dfe2538984dc047b39fcc5/planfa914f013fdcd032faed876689092da245989459. FullcanonicalT011disciplinereference acceptance reviewed against ADR014Decision7/task-feature-flow/DEC0028-29-68-69 and owningE10review/parallelprotocol: fourrole responsibilities/independentjudgment/findinghistory, sixexactnoticeheadings and all requiredoutcome-source-personlinksteps-options-knowncostdelay-riskreversibility-recommendation-continuingwork, nonimpersonation/no ownerdebugging/fabricatedcosts-obligations/repeatedgrantquestions, E10protocolownership/E9proposesE3verifiesE1renders. Read-only exact11scope/14fieldpackcheckpoint5cc1a766c026265ed2c9f9983df0b8ec3f04ebb1/cleanancestor/rawv52byteequal/profilehash/E10sourcesunchanged checked. Reviewer no tests/build/CI/network; actual configuredspawn model not runtime attestation. No actualindependentrejection or findingclosure invented.
Review clarification history: reviewer initially checked FL9.7.1 different-chat phrase versus boundedseparatereviewercontext/currentdelegation. Root pointed to actual accepted TASK_EXECUTION_PROTOCOL DEC0069 and directowneracceptance, demandedretainingfindingifinsufficient/no waiver. Reviewer independently compared pinnedamendment/E10source and found DEC0069expresslyamendsdifferentchatforowneracceptedsubagent; profile separatecontext/initialjudgment/no conversationrenaming preservesit. Clarification resolved with no sourceedits/no CHANGES_REQUESTED verdict. Sharedblindspotnot erased.
Actual source all15CI SUCCESS: PRarch37130077084(opened)/37130108708(labeled)/E337130077081/live37130077075/E437130077101/E537130077079/E637130077069/E937130077112; pusharch37130002058/E337130002085/live37130002111/E437130002086/E537130002123/E637130002135/E937130002092. OpenedT3job111223271582skipped0steps; labeledactualexecutedT3job111223364161fiveSUCCESS/checks111223364364sevenSUCCESS/E4PR170PASS0.149s/E9PRninePASS0.001s. Rootsource12checks+42regressionsPASS0.489s/worst0/build78/routingREVIEW/manualroles-sixexactnoticefields-negativecases/9pins/hash/rawv52/exact11/priorprimary/E10-code-tests-workflowspreserved/diffPASS. No roothelperfailure/unitCI/indepRET invented; sourceCI separatefromjudgment/no reviewerexecutionclaimed.
Standingowner accepts fullcanonicalstaticreference; profileREVIEW->ACTIVE/packIN_PROGRESS->DONE/taskREVIEW->DONE. Sixclosurepaths profile/pack/task/proof/two views only; rolemapping/noticefields/negativecontrols/currentpins/E10sources/rawinventory/inventoryadmission/manifestCI/priorproof/acceptedcode-tests-workflows unchanged. Final six-file independentmetaaudit and exactfinalhead allactualsevenfamilyruns nominal14+extras/executedPRT3/E4/E9 stillrequired before normalmatchedPR87merge, no admin/bypass/mainpush.
Actual account/legal/store/qualifiedattestation/automaticreviewactuation/provider/tool/cost/retry/runtime/E3canonicalverification/E5identity/E1UI/native/device/physical/universaloperationalhandoffproof MISSING/HELD. T006unfinished actualtoolauthority-binding-retryconfig-trustworthycostproducer absentunselected/T007dep006DONEunmet/productE3R1REVIEW/E5-003IN_PROGRESS/held47-57-59unchanged. Fullstaticreference acceptance not fullproduct/feature/flow/externalqualification. E10owningprotocol unchanged, no new runtime seam.
