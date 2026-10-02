---
test_id: E-DEV-048
contract_id_version: "ADR-004 Decision3; C5.3/F5.3.1/FL5.3.1; method specification v1"
subject_file: vault/PROFILES/privileged-login-method.md
subject_digest: e0e8c4b81224cb12e4fab6f826364c959ce6b822f0368fa0ea209152f557ae55
result: "RECORDED: source specification comparison; independent review and current CI outstanding"
evidence_links:
  - "[[vault/PROFILES/privileged-login-method.md]]"
  - "[[vault/PACKS/P-E5-007a.md]]"
  - "[[vault/REGISTRY/T-E5-007a.md]]"
  - "[[vault/EVIDENCE/SNAPSHOTS/E-DEV-047-E10-GOVERNED-PATHS.md.snapshot]]"
gate_verdict: "BLOCKED (source review and CI outstanding; privileged activation held)"
reviewer: none
timestamp: 2026-10-02
purpose: Specify the privileged phishing-resistant login method without implementation
domain: project-execution
module: e05-identity
owner: E5
implements: [ADR-004, C5.3, F5.3.1, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: privileged-login-method-specification
tasks: [T-E5-007a]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_conformance.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E5-AUTHMETHOD-001]
used_by: [V-E5-AUTHMETHOD-001, P-E5-007a, T-E5-007a]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-048 — privileged login method specification

Root compared exact canonical T007a/no-hard-dependency/no-numerics/no-implementation acceptance against composite FL5.3.1 test row, ADR004 identity composition and Decisions1/3/5/10, declared seams and ADR010 browser authority, E5 existing consumer principal surface. Public source checks2026-10-02: W3C WebAuthn Level2 Recommendation published2021-04-08 registration/assertion verification; NIST SP800-63B-4 verifier-name binding. Method is a required asymmetric origin-bound class, no provider/product/domain/account selection or assurance/activation claim. Eight negatives are source walkthroughs, not actual authenticator/browser/provider tests. No implementation/numerics or credential/session/recovery activation.

Main plan pinfa914f013fdcd032faed876689092da245989459; local standing-mandate records e3c2e3fe336c046f9e93c0474c133e805ccdc5ba belong to open planPR4 (not merged). Latest direct human instruction remains authority; source TASK_INDEX/ADRs/design/boundaries are unchanged between pins. Exact pack tenpaths before work; v16/EDEV048 preserve prior401/79catalog/admissions/pendingPR47reservation. EDEV047 original primary/digest/reviewer/heads/core unchanged; exact acceptedPR49 inventoryv15 raw archive vault/EVIDENCE/SNAPSHOTS/E-DEV-047-E10-GOVERNED-PATHS.md.snapshot normalized 287f1d17820f4990a4094fe08fbb0dfa556fd4f3f29cc933d2e3c169c3d80d52. Root checks/independent review/currentCI pending; E3R1 REVIEW/E5-003 IN_PROGRESS/provisioningproductionprivilegedactivationHELD.


## Performed preparation checks

Root run_all12 architecture checks/42 existing record-preservation/identity/trace regressions PASS0.996s, exit0; regenerated43 actual task rows, T007aREVIEW/E3R1REVIEW/E5-003IN_PROGRESS, no eligible state invented. Exact acceptedPR49 inventoryv15 archive matches raw git show0a901089:inventory byte-for-byte. Source walkthroughs compare method/class/authority/lifecycle/heldcomposition/stepup-session-recoveryhandoff; no authenticator/browser/IdP/session/credential experiment. Official W3C/NIST URLs in primary were checked2026-10-02; only primary technical sources used. Independent source review and latestCI pending; no authorPASS/productactivation.
