---
test_id: E-DEV-007
contract_id_version: "ADR-006 Decision 9; T-E3-006c browser boundary v1"
subject_file: vault/PROFILES/authorization-tuple-browser.md
subject_digest: 48CEF1BBF03316D4B27B3F7C0164D571972B4C90124C106C38E6EA00BB73B578
result: "RECORDED (E10 and PR #9 CI passed on code head 05dc052; independent review not yet recorded)"
evidence_links:
  - "[[vault/PROFILES/authorization-tuple-browser.md]]"
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

This is a specification task. The proposed browser profile of the existing authorization-tuple contract states how a future browser must handle private storage and signed URLs, exact origins and cookie CSRF, PKCE callback binding, high-consequence step-up, operation lookup disclosure, lost responses and browser cache revocation. Its negative examples are future implementation fixtures. It adds no tenth catalog contract or new E2/E3 seam. No browser runtime or hosted Supabase behavior is proven by this record.

E10 `run_all.py` and strict planning-link validation passed locally on 2026-10-01; `git diff --check` was clean. On PR #9 code head `05dc052`, [architecture checks](https://github.com/xpike-dgm/kavriva-app/actions/runs/36795973886/job/110159378611), [E3 tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36795973869/job/110159378182), [E5 tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36795974047/job/110159378852) and [local Supabase Auth proof](https://github.com/xpike-dgm/kavriva-app/actions/runs/36795973918/job/110159378350) succeeded. The automatic T3 gate was skipped; it is not a separate review. Independent review is not yet recorded.

T-E3-006b hosted Storage/URL/Studio inventory and T-E3-007 bypass tests remain separate. T-E3-001-R1 and T-E3-006a remain REVIEW; this contract does not promote either to DONE.
