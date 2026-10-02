---
test_id: E-DEV-048
contract_id_version: "ADR-004 Decision3; C5.3/F5.3.1/FL5.3.1; method specification v1"
subject_file: vault/PROFILES/privileged-login-method.md
subject_digest: c5037bb7f654df7e689172f42f2d254fe0dd3a7fc7be8c8d6bd52cc502ec68d4
result: "PASS: independently reviewed method specification only; product proof missing"
evidence_links:
  - "[[vault/PROFILES/privileged-login-method.md]]"
  - "[[vault/PACKS/P-E5-007a.md]]"
  - "[[vault/REGISTRY/T-E5-007a.md]]"
  - "[[vault/EVIDENCE/SNAPSHOTS/E-DEV-047-E10-GOVERNED-PATHS.md.snapshot]]"
gate_verdict: "PASS (bounded specification; final audit/current-head CI required; privileged activation held)"
reviewer: /root/pr50_privileged_method_review (gpt-6-luna/max)
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
used_by: [V-E5-AUTHMETHOD-001, P-E5-007a, T-E5-007a, P-E5-021, E-DEV-049]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-048 — privileged login method specification

Root compared exact canonical T007a/no-hard-dependency/no-numerics/no-implementation acceptance against composite FL5.3.1 test row, ADR004 identity composition and Decisions1/3/5/10, declared seams and ADR010 browser authority, E5 existing consumer principal surface. Public source checks2026-10-02: W3C WebAuthn Level2 Recommendation published2021-04-08 registration/assertion verification; NIST SP800-63B-4 verifier-name binding. Method is a required asymmetric origin-bound class, no provider/product/domain/account selection or assurance/activation claim. Eight negatives are source walkthroughs, not actual authenticator/browser/provider tests. No implementation/numerics or credential/session/recovery activation.

Main plan pinfa914f013fdcd032faed876689092da245989459; local standing-mandate records e3c2e3fe336c046f9e93c0474c133e805ccdc5ba belong to open planPR4 (not merged). Latest direct human instruction remains authority; source TASK_INDEX/ADRs/design/boundaries are unchanged between pins. Exact pack tenpaths before work; v16/EDEV048 preserve prior401/79catalog/admissions/pendingPR47reservation. EDEV047 original primary/digest/reviewer/heads/core unchanged; exact acceptedPR49 inventoryv15 raw archive vault/EVIDENCE/SNAPSHOTS/E-DEV-047-E10-GOVERNED-PATHS.md.snapshot normalized 287f1d17820f4990a4094fe08fbb0dfa556fd4f3f29cc933d2e3c169c3d80d52. Root checks/independent review/currentCI pending; E3R1 REVIEW/E5-003 IN_PROGRESS/provisioningproductionprivilegedactivationHELD.


## Performed preparation checks

Root run_all12 architecture checks/42 existing record-preservation/identity/trace regressions PASS0.996s, exit0; regenerated43 actual task rows, T007aREVIEW/E3R1REVIEW/E5-003IN_PROGRESS, no eligible state invented. Exact acceptedPR49 inventoryv15 archive matches raw git show0a901089:inventory byte-for-byte. Source walkthroughs compare method/class/authority/lifecycle/heldcomposition/stepup-session-recoveryhandoff; no authenticator/browser/IdP/session/credential experiment. Official W3C/NIST URLs in primary were checked2026-10-02; only primary technical sources used. Independent source review and latestCI pending; no authorPASS/productactivation.


Root pre-review scope clarification: require an authenticated protected channel and controlled secure origins, reject client-selected verifier/insecure transport downgrade. Dated NIST verifier-name-binding source explicitly requires protected channel; no concrete TLS/domain/provider/configuration or numeric policy selected. Sourcecfd5a88 all8 workflows SUCCESS includinglabelledT3, but narrower new-head CI and actual independent review required. Current primary normalized digest c4608a892d511f520f8612b388c8137523e338d4ab3027d64c9165f27166bfeb. No previous independent verdict is claimed; taskREVIEW and operationalholds remain.

## Actual independent source acceptance

Independent /root/pr50_privileged_method_review, gpt-6-luna/max, returned bounded source PASS at d5d2a4e6e8b1694cf882b9e6cb6ad2925bb3ea68 over accepted base0a90108921be46319fc20fc4992e999964491677, no findings. Reviewer inspected exactly ten scoped paths and fourteen pack fields, canonical no-implementation/no-numerics acceptance, composite physical-test row, ADR004 identity/session/recovery/activation and ADR010 browser authority, existing public principal boundary, protected-channel requirements and manual countercases. Reviewer verified original EDEV047 proof core preserved, byte-identical accepted inventory snapshot and normalized source digest c4608a892d511f520f8612b388c8137523e338d4ab3027d64c9165f27166bfeb. Reviewer ran no tests or CI, contacted no provider, read no secret and changed no files.

Nonblocking citation freshness note: W3C WebAuthn Level3 Recommendation2026-08-25 succeeds Level2. Level2 remains a valid pinned reference and the reviewer found the stated method checks consistent with current verification requirements. Root verified the official successor https://www.w3.org/TR/2026/REC-webauthn-3-20260825/ on2026-10-02. This closure preserves the reviewed primary body and does not claim Level3 implementation or conformance; future implementing work must review the applicable current specification.

Root d5 source run_all.py PASS12 architecture checks/42 regressions0.471s and diff check. All eight d5 workflows SUCCESS: PRarchitecture36991035313, E336991035444, E536991035314, Auth36991035312; pusharchitecture36991030272, E336991030304, E536991030243, Auth36991030161. Labelled PR T3 check PASS; independent human-authorized second eye recorded separately. Direct standing owner mandate, recorded DEC0070 in pending planPR4, accepts this bounded source verdict after green CI. No planPR4 merge is claimed.

Primary status-only ACTIVE, pack ACTIVE, T007a DONE and generated views retain43 actual tasks. Current normalized primary digest c5037bb7f654df7e689172f42f2d254fe0dd3a7fc7be8c8d6bd52cc502ec68d4. Earlier provisional reviewer-none/BLOCKED receipts remain in Git history. Final six-path metadata/evidence/view audit and latest-head CI remain separate merge gates; immutable final receipt belongs in PR body. No runtime/code/device/browser/provider/credential/session change or physical product acceptance. E3R1 REVIEW/E5-003 IN_PROGRESS/live provisioning/privileged production HELD remain.

## T-E5-021 secondary inventory custody

Accepted PR50 merge 4347d3ce80a88b1e35accbeafc65f5e4757ad388 inventoryv16 exact raw payload preserved at `vault/EVIDENCE/SNAPSHOTS/E-DEV-048-E10-GOVERNED-PATHS.md.snapshot`, normalizedSHA256 903abac6f029e2148805c4d791d7f2be45e51314fbbad8032f871bca9e877efb. Original primary subject/digest/verdict/reviewer/heads/date/core unchanged; this is secondary documentary custody only, not currentinventory or privileged activation proof. Context `vault/PACKS/P-E5-021.md`; proof `vault/EVIDENCE/E-DEV-049.md`.
