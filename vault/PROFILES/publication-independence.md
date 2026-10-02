---
record_id: V-E6-INDEPENDENCE-001
version: 1
purpose: Block self-approval in high-consequence publication metadata and hold actual release
domain: release-governance
module: e06-release
owner: E6
implements: [ADR-007, ADR-003, C6.1, F6.1.1, R-003, R-004, R-007, R-009, R-011, R-013, R-014]
public_contracts: []
internal_scope: publication-independence
tasks: [T-E6-002]
tests: [modules/e06-release/tests/test_publication_independence.py, modules/e06-release/tests/test_release_authority_registry.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E6-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E6-002, T-E6-002, E-DEV-055]
evidence: [E-DEV-055]
supersedes: []
status: IN_PROGRESS
---

# Publication independence: partial implementation

Canonical T-E6-002 requires **Alias/service collapse blocked; per-change independence**, validation gate. Prerequisite T-E6-001 logical registry DONE in accepted PR56 merge a9cb2060f57ab3456c0ce6f226c163380025154e. Plan main fa914f013fdcd032faed876689092da245989459. ADR003R8 fixes four distinct roles for a high-consequence publication packet; ADR007R6 forbids aliases/service/emergency accounts hiding the same controlling human.

This partial internal checker models **technical-content high-consequence publication** only. Required roles are author, domain reviewer, safety approver and publisher. It does not select compatibility rules for other release domains, verifier/signer/promoter roles or the ADR003R5 negative emergency exception. Those require their own approved consequence-specific policy and canonical identity evidence. In particular, the four-role rule does not govern emergency negative action.

`assess_fixture_structure` validates exact immutable operation/source digest/domain/policy/packet context for every binding before comparison. Each binding names a principal kind/reference, complete nonempty controlling-human set, assignment/session/assurance references and observed/expiry instants. Plain reference types reject whitespace and unknown roles/kinds; times must be exact UTC datetime instances, so caller timezone/equality hooks are not executed. Expiry must be after the supplied server time and observation cannot be in the future; no session-duration threshold is selected. Fixture dates are test inputs.

Missing/duplicate/unknown roles, malformed/incomplete/ambiguous human control sets, stale assignment/session markers and changed operation/source/policy context return bounded HELD reasons. A principal reused between roles or any shared controlling human, including a multi-controller service account, yields PER_CHANGE_HUMAN_COLLAPSE. Reused session or assignment references are rejected. Different account labels, service aliases and emergency-access account labels cannot hide a shared fixture controller.

Every reference, human/controller mapping, delegation completeness flag, policy version, assurance and timestamp is supplied fixture metadata. A coherent forged tuple can obtain FIXTURE_STRUCTURE_MATCH; this authenticates no human, delegation, competence, current assignment or session. That result has intrinsic authority NONE. Dataclass labels are not signed E5 decisions. No real identities or credentials are collected or stored.

`publication_gate` preserves every structural HELD and returns CANONICAL_PRIVILEGED_IDENTITY_SOURCE_MISSING even for matching fixtures. It cannot ALLOW, publish, sign, promote, deploy or mutate anything. E5's current public consumer boundary does not provide a privileged human/delegation/competence source. Actual E5 current principal/session/assurance/assignment/revocation, complete human control chain, consequence-specific independent staffing and E3 before-effect protected audit/floor/effect transaction are missing. User acceptance of an AI development reviewer does not fill a physical publisher/signer/custodian role.

## Actual checks and task status

Fourteen new meaningful local tests plus fourteen accepted registry tests: full E6 28 PASS (0.036s), compile PASS. Cases cover ordinary distinct fixtures staying HELD, same-human account/service/emergency collapse, partial multi-controller intersection, incomplete/unknown control chain, duplicate/missing roles, exact changed packet/source/policy/domain, future/stale/boundary expiry, missing assurance/session, reused principal/session/assignment, unsupported other release/negative-emergency profiles, malicious equality/types and immutable no-authority result.

The new e6-release-policy-tests workflow runs the full E6 suite on branch push and PR using the existing reviewed immutable checkout pin, read-only content permission and no persisted checkout credentials. It installs no dependency and uses no product credentials, provider calls or deployment. Current-head hosted CI has not yet been observed. Passing E6 tests would prove fixture behavior only; actual authorization/staffing integration remains unproved.

T-E6-002 remains **IN_PROGRESS**. This one task PR stays draft while canonical privileged binding and the remaining role profiles are absent. Independent task-completion review is deferred until the full gate is ready, following DEC0068. No partial self-PASS, task DONE, completed upper flow or actual release claim. Existing E3R1 REVIEW/E5-003 IN_PROGRESS/PR47 provisioning/privileged activation remain HELD.

## Ten-layer trace

ADR003R8 / ADR007R6 → C6.1 → F6.1.1 → FL6.1.1 → T-E6-002 → M-E6-001 internal publication checker → E-DEV-055.

| Layer | Actual evidence or remaining gap |
|---|---|
| task | Partial checker and tests, IN_PROGRESS; full gate missing |
| feature | No authenticated release permission |
| flow | No E2 invoke, E3 effect or E5 privileged principal resolution |
| requirement | Four publication roles, alias-collapse negatives and missing-role HELD |
| design | No UI; visible independent staffing explanation still missing |
| architecture | Internal E6, no new runtime seam; E5 consumer interface inspected |
| data/migration | Fixture immutable context; no canonical privileged identity/role/audit store |
| release | Actual signing/promotion/publication unavailable; other domain matrices missing |
| product-scenario | 28 local E6 tests; no real identities or publication effects |
| gap-audit | Identity/delegation/competence/current policy/audit/floors/other profiles attributed E5/E3/E6, no owner debugging |

Code `modules/e06-release/internal/publication_independence.py`; tests `modules/e06-release/tests/test_publication_independence.py`; workflow `.github/workflows/e6-tests.yml`; context `vault/PACKS/P-E6-002.md`; task `vault/REGISTRY/T-E6-002.md`; proof `vault/EVIDENCE/E-DEV-055.md`. Source: [canonical task](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/TASK_INDEX.md), [ADR003](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-003__APPROVAL_PUBLICATION_EMERGENCY_SUSPENSION.md), [ADR007](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-007__SUPPLY_CHAIN_AND_RELEASE_GOVERNANCE.md).
