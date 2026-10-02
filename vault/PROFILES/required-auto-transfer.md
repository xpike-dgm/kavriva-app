---
record_id: V-E4-AUTO-001
version: 1
purpose: Specify required-only automatic transfer priority without network or byte confirmation
domain: offline-package
module: e04-offline
owner: E4
implements: [ADR-009, CON-005, C4.3, F4.3.1, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: required-auto-transfer-rule
tasks: [T-E4-007]
tests: [modules/e04-offline/tests/test_required_auto_transfer.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-007, T-E4-007, E-DEV-066]
evidence: [E-DEV-066]
supersedes: []
status: REVIEW
---

# Required-only automatic transfer scheduling rule

Canonical T007 ONLY required core/no dialog/priority/completion not authority; harddepsnone/reviewgate ADR009R3/CON005/C4.3/F4.3.1/FL4.3.1 client logic surfaced via E1 screenHELD. Acceptedmain2340378b27b06d04cf0f585415ca4a88c2fd9293; acceptedremoteplanmainfa914f013fdcd032faed876689092da245989459/localstaleplanmain7d705a69/localpendingbranch e3c2e3f/planPR4unmerged/directstandingmandate distinguished. No fabricated harddeps, samecapsule accepted target/optional checks reused. Generation/classification sourced via E3/E6, E4consumesE3 only; no new publicseam/privatecrossimport.

## Actual policy

RequiredNeed freezes selectedscope/PackageTarget/classification REQUIRED_CORE/plain task_requires_content boolean. Selectedscope/pinned complete metadata validated, unknown/nonessential/unclassified required labels or wrong scope/pin reject. Needed core yields one required transfer item without UserRequest; not-needed core yields none. Classification/taskneed remain supplied declarations, not actual E1 task need or canonical semantics.

plan_transfers validates tuple OptionalRecord entries only already REQUESTED with same core scope/digest and unique media ID. It never creates optional intent, auto-fetches ABSENT/cancelled media, trims requiredparts or expands catalog. A needed requiredtarget always precedes existing explicit optional requests. Existing T003 intent state is a model only; actual E1 optional entrypoint must still establish real visible T004 size/gesture before any actual queue. No schedule is executed here, so this does not bypass the size guard or confer physical request permission.

Transport WIFI/CELLULAR/ROAMING/UNKNOWN/OFFLINE is descriptive only: same schedule and confirmation_required=False for every valid transport, without byte threshold/limit or new dialog. OFFLINE does not promise connection/start. Requiredtarget includes every declared essential including safety/recovery; no payloadsize condition. Optional remains supplied explicit-only. T008 retry/saver constraints are separate, no retryvalues/OS implementation selected.

completion_notice rebuilds and validates the proposal/order and member types, rejects omitted/reordered required member or unknown outcome, and returns SUPPLIED_TRANSFER_OUTCOME_ONLY/NONE. It does not receive/check byte payloads, persist a receipt or prove completion. Local transport claim never implies ALLOW/approval/recall/freshness/technicaltruth/actionability. All plan/items/notices intrinsicNONE; productiongate constant HELD_CANONICAL_REQUIRED_SOURCE_AND_TRANSFER_RUNTIME_MISSING ignores flags/callbacks. Coherent false need/classification/source/optionalintent/completion can pass model but cannot open runtime. Actual fetched bytes still require T005completeverification/peak/atomicencryptedstore before product use.

## Validation and remaining gates

Twelve new+accepted72 full84PASS0.102s/compile. Tests requiredneeded no userintent/optionalnotcreated; alltransports no dialog/samepriority; arbitraryfixturepayloadlengths no bytepolicy; requiredfirst/explicitoptional/corecontext/duplicate/ABSENTcancelled rejection; notneededcore none; unknownclassification/selectedscope/pin/types/hostilecallbacks; completionNONE/unknownmember/forgedorderedqueue rejection; immutability/coherentforgery/productionHELD. Memory fixtures only, no unit failure or independent verdict before sourcefreeze.

Real canonicalsource/semanticclassification/currentgeneration/floors/compatibility, actual E1 taskneed/visibleoptional size/gesture/queue provenance, network/OS scheduler/download/resume/cancellation/encrypted durable storage/atomicpromotion/crashrecovery/mobile/device runtime remain MISSING/HELD. No actualauto-start/transfercompletion/authorization/productready claim. No plaintextfallback/provider/version/limits/new wireformat. Full task independent review/currentCI required, no authorPASS/DONE.

## Trace

ADR009R3/CON005 -> C4.3 -> F4.3.1 -> FL4.3.1 -> T-E4-007 -> M-E4-001 -> E-DEV-066. Internal policy task/feature/flow/requirement, E1screenheld/no newUI, architecture E4-only/no seam, data no persistence/migration, releaseNONE/held, scenarios/gaps above. Source `modules/e04-offline/internal/required_auto_transfer.py`; tests `modules/e04-offline/tests/test_required_auto_transfer.py`; accepted target `modules/e04-offline/internal/full_package_fallback.py`; optionalmodel `modules/e04-offline/internal/optional_media.py`; workflow `.github/workflows/e4-tests.yml`; pack `vault/PACKS/P-E4-007.md`; task `vault/REGISTRY/T-E4-007.md`; proof `vault/EVIDENCE/E-DEV-066.md`.
