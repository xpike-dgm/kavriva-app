---
record_id: V-E4-RETRY-001
version: 1
purpose: Specify where-supported resumable bounded retry and confirmation-free saver delays
domain: offline-package
module: e04-offline
owner: E4
implements: [ADR-009, CON-005, C4.3, F4.3.1, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: retry-saver-rule
tasks: [T-E4-008]
tests: [modules/e04-offline/tests/test_retry_saver.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [T-E4-007, M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-008, T-E4-008, E-DEV-067]
evidence: [E-DEV-067]
supersedes: []
status: REVIEW
---

# Retry-HELD and saver rule

Canonical T008/ADR009R3/CON005/C4.3/F4.3.1/FL4.3.1 reviewgate, harddepT007DONE in acceptedmain05e739a5276a30a5d128338b8d03211026fd63cd (PR68 merged2026-10-02T17:43:04Z). Acceptedremoteplanmainfa914f013fdcd032faed876689092da245989459/localstaleplanmain7d705a69/localpendingbranch e3c2e3f/pendingplanPR4 unmerged/directstandingmandate distinguished. E4 same-capsule private helpers legal, no new publicseam or cross-private import; E4 consumesE3/E1renders unchanged.

ExecutionPolicy retains validated TransferProposal, supplied saver/resume/interrupted declarations, execution disposition and retry-mode strings. Rebuilds accepted T007plan and validates every member before equality, rejects forged omitted/reordered/extra/mutable/wrong-context/hostile input. Required priority/allparts and only existing explicit optional intent remain unchanged; no implicit optional request or confirmation for any valid transport/state.

NORMAL means DECLARED_OS_ELIGIBLE only, no actual dispatch. DATA_SAVER/LOW_DATA_MODE/CONSTRAINED yield DELAYED_OS_CONSTRAINT without Kavriva confirmation; UNKNOWN yields HELD_OS_STATE_UNKNOWN, never a user gate. Interrupted+SUPPORTED declares RESUMABLE_BOUNDED_WHERE_SUPPORTED_VALUES_HELD; UNSUPPORTED yields RESUME_UNSUPPORTED (no assumed restart/resume), UNKNOWN yields HELD_RESUME_CAPABILITY_UNKNOWN. Uninterrupted means NOT_INTERRUPTED. All retry/backoff/chunk/attempt limits unselected, retry_values=HELD_UNSELECTED. No retry loop, unbounded default, byte-offset or background execution promise; even NORMAL/SUPPORTED cannot dispatch until actual configuration/runtime gates proven. Supplied capability/state can be false.

Policy outputs intrinsicNONE; productiongate constantHELD_CANONICAL_OS_RESUME_RETRY_VALUES_AND_ENCRYPTED_RUNTIME_MISSING ignores callback/flags. No actual interrupted bytes/resume/transport/completion/canonicalauthority/physicalstore proof. Partial download remains staging, T005complete verification/peak-space/atomicencryptedstore still required before current/actionable. Existing T004real optional size/gesture guard and canonical classification/source/currentgeneration/floors/compatibility remain separate. Background availability never correctness authority.

Twelve new+accepted84 full96PASS0.179s/compile. Tests NORMALdeclaredonly/threeOSconstraints/unknownhold/interrupted supportedvaluesheld/unsupportedunknown/no false resume/5transports×5savers×3capabilities×2interruptionflags preserve priority/no confirmation/no newintent; forged/mutable/reordered/extra/context/enum/bool/hostile types; immutability/coherentforgery/constantHELD. Fixtures only, no unitfailure or independentverdict before sourcefreeze. Root fixture import changed to module alias before validation to prevent unittest duplicate discovery; no accepted tests changed.

Actual canonical package/taskneed/classification/currentgeneration/floors/compatibility, authenticated E1gesture+visibleoptionalsize, measured retry/backoff/chunk limits, OSconstraint/capability adapter, actual network/download/resume/cancellation/provenencrypted durable staging/atomicpromotion/crashrecovery/AndroidiOSdevices remain MISSING/HELD. No actual start/resume/background/device/permission/productreadyclaim. No provider/library/version/limits/wireformat selection or plaintextfallback. FULLtask independent review/exactheadCI required before internalruleDONE; product runtime staysHELD.

## Trace

ADR009R3/CON005 -> C4.3 -> F4.3.1 -> FL4.3.1 -> T-E4-008 -> M-E4-001 -> E-DEV-067. Internal rule/feature/flow/E1screenHELD; data no persistence; releaseNONE; architecture unchanged. Source `modules/e04-offline/internal/retry_saver.py`; tests `modules/e04-offline/tests/test_retry_saver.py`; accepted plan `modules/e04-offline/internal/required_auto_transfer.py`; workflow `.github/workflows/e4-tests.yml`; pack `vault/PACKS/P-E4-008.md`; task `vault/REGISTRY/T-E4-008.md`; proof `vault/EVIDENCE/E-DEV-067.md`.
