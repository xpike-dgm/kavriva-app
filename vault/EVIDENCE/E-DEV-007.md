---
test_id: E-DEV-007
contract_id_version: "ADR-006 Decision 9; T-E3-006c browser boundary v1"
subject_file: vault/CONTRACTS/browser-boundary.md
subject_digest: B26C740C402431B2B3BEA10490736E04E2356A958EA8DA37340CEF523E634A44
result: "RECORDED (contract drafted; E10 validation passed; PR CI and review not yet recorded)"
evidence_links:
  - "[[vault/CONTRACTS/browser-boundary.md]]"
  - "[[vault/PACKS/P-E3-006c.md]]"
  - "[[vault/REGISTRY/T-E3-006c.md]]"
  - "modules/e02-panel/MANIFEST.md"
  - "modules/e03-server/MANIFEST.md"
gate_verdict: "RECORDED (specification draft only; no implementation verdict)"
reviewer: none
timestamp: 2026-10-01
status: DRAFT
last_verified: 2026-10-01
---

# E-DEV-007 — Browser boundary rules

This is a specification task. The proposed contract states how a future browser must handle private storage and signed URLs, exact origins and cookie CSRF, PKCE callback binding, high-consequence step-up, operation lookup disclosure, lost responses and browser cache revocation. Its negative examples are future implementation fixtures. No browser runtime or hosted Supabase behavior is proven by this record.

E10 validation passed locally on 2026-10-01. PR CI and independent review are not yet recorded. T-E3-006b hosted Storage/URL/Studio inventory and T-E3-007 bypass tests remain separate. T-E3-001-R1 and T-E3-006a remain REVIEW; this contract does not promote either to DONE.
