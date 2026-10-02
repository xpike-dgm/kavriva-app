---
record_id: V-E6-OTA-001
version: 1
purpose: Deny unapproved runtime code updates and record separate future approval requirements
domain: release-governance
module: e06-release
owner: E6
implements: [ADR-007, ADR-013, C6.8, F6.8.1, R-003, R-004, R-007, R-009, R-011, R-013, R-014]
public_contracts: []
internal_scope: ota-default-denial
tasks: [T-E6-017]
tests: [modules/e06-release/tests/test_ota_denial.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E6-001, V-E6-AUTHORITY-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E6-017, T-E6-017, E-DEV-059]
evidence: [E-DEV-059]
supersedes: []
status: REVIEW
---

# OTA default denial

Canonical T-E6-017 acceptance Default deny + future envelope listed, validation gate, harddeps none. ADR007R10/C6.8/F6.8.1/FL6.8.1; accepted base7e014b7ecf7063fe27f8619ba7249056c1986132/planmainfa914f013fdcd032faed876689092da245989459. No runtime code-update channel is approved. Future permission never follows from general Development mandate, valid signature, configuration flag or a prospective checklist.

## Actual internal gate

Internal deny_ota accepts an opaque request and returns frozen OtaDenial without inspecting it. Verdict DENY, reason OTA_NOT_APPROVED, domain future_ota and authority NONE are intrinsic readonly properties, no constructor-supplied overrides. No positive branch, enable flag, URL parsing, code decoding, request serialization, callback or effect. A caller saying approved/signed/current-authority/all-future-requirements-ready cannot enable the guard. It creates no authenticated attempt/audit/server/transaction/device receipt. It does not promise coverage of absent or future client routes, imported third-party updaters or platform channels; any actual OTA consumer must use reviewed gates and prove its runtime path separately.

Accepted logical future_ota registry remains NOT_APPROVED/physicalHELD, no holders/credentials/audit references. Gate tests validate that same accepted registry and deny its metadata; the metadata itself is not current permission. Existing E3/E5/E7 boundaries unchanged, no new public seam/lane action.

## Separate prospective requirements

FUTURE_REQUIREMENTS is an immutable tuple of frozen descriptive requirements, not readiness results. It lists distinct actions/credentials/audit events/consequence checks, explicit bounded mutable envelope, signed versioned artifacts, exact provenance, client/platform/capability compatibility, anti-rollback, staged observation/pause/stop, revocation/negative precedence and platform/store review. It also records forbidden native/security-critical replacement, permission widening and content/software authority merger. No provider, key hierarchy, version threshold, rollout numbers or mobile implementation selected. Completing these declarations cannot open this code; future channel needs separate explicit approval/superseding policy and reviewed implementation with actual proof.

## Actual security probes and remaining gates

Eight new probes + accepted42 E6 =full50 PASS0.180s/compile PASS. Earlier first run failed one integration probe because the test passed a Path to the accepted bytes-only registry API; corrected the test to supply exact raw bytes, no production rule/loader weakened. After test success, separate-authority descriptive catalog wording clarified actions/credentials/audit/consequence; logic/tests unchanged, current CI will check frozen source.

Tests attempt claimed approval/signatures/current authority, all prospective markers true, callback-as-request/effect, hostile attribute/repr/truth/iterator hooks, arbitrary code bytes/URLs/native-replacement/permissions/content approval markers, constructor/frozen denial override, immutable catalog and accepted logical registry consistency. No actual network/download/store/mobile/code execution, keys, provider or customer data. Existing E6 workflow runs registry/snapshot/config/denial present here, not absent draftPR59 transition or PR57 roles.

Actual mobile/device/native route integration, authenticated attempt audit, independent physical signing/custody/revocation/current authority/anti-rollback/rollout/platform channel remain unproved and unapproved. OTA remains denied; that cannot be described as a ready update channel, store approval or product-wide security evidence. Other real release/identity/floor/audit/incident-copy gaps remain MISSING/HELD; PR47/57/59 still incomplete drafts.

## Ten-layer trace

ADR007R10 -> C6.8 -> F6.8.1 -> FL6.8.1 -> T-E6-017 -> M-E6-001 internal denial -> E-DEV-059.

| Layer | Actual boundary |
|---|---|
| task | Default deny guard and prospective envelope, independent final review required |
| feature | No approved runtime code-update channel |
| flow | No client/download/loader/native execution path installed |
| requirement | Denial independent of caller approval and future readiness markers |
| design | No screen/device/accessibility evidence |
| architecture | E6 policy only, no E7 execution/new seam |
| data/migration | Immutable pure denial/catalog, no schema/state effect |
| release | OTA NOT_APPROVED/physicalHELD, all future positive checks missing |
| product-scenario | 50 local units including eight adversarial denial probes, no device OTA experiment |
| gap-audit | Mobile consumer/attempt audit/actual trust/custody/compatibility/floor/platform path not proved |

Code `modules/e06-release/internal/ota_denial.py`; tests `modules/e06-release/tests/test_ota_denial.py`; pack `vault/PACKS/P-E6-017.md`; task `vault/REGISTRY/T-E6-017.md`; evidence `vault/EVIDENCE/E-DEV-059.md`; accepted logical categories `vault/REGISTRY/release-authorities.json`; capsule `modules/e06-release/MANIFEST.md`.
