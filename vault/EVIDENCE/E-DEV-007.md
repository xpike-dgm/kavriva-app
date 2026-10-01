---
test_id: E-DEV-007
contract_id_version: "ADR-006 Decision 9; T-E3-006c authorization-tuple browser profile v1"
subject_file: vault/PROFILES/authorization-tuple-browser.md
subject_digest: 48CEF1BBF03316D4B27B3F7C0164D571972B4C90124C106C38E6EA00BB73B578
result: "RECORDED (PR #9 final code head 07d84b7 CI green; independent browser-profile review PASS; owner acceptance pending)"
evidence_links:
  - "[[vault/PROFILES/authorization-tuple-browser.md]]"
  - "[[vault/PACKS/P-E3-006c.md]]"
  - "[[vault/REGISTRY/T-E3-006c.md]]"
  - "modules/e02-panel/MANIFEST.md"
  - "modules/e03-server/MANIFEST.md"
gate_verdict: "RECORDED (independent scope PASS; owner acceptance pending; no browser runtime or hosted proof)"
reviewer: "independent gpt-6-luna max sub-agent /root/pr9_independent_review; corrected code head 07d84b7304f7599b83078ad33056ddd4290bf48e; owner acceptance pending under DEC-0069"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-007 — Browser boundary rules

This is a specification task. The proposed browser profile of the existing authorization-tuple contract states how a future browser must handle private storage and signed URLs, exact origins and cookie CSRF, PKCE callback binding, high-consequence step-up, operation lookup disclosure, lost responses and browser cache revocation. Its negative examples are future implementation fixtures. It adds no tenth catalog contract or new E2/E3 seam. No browser runtime or hosted Supabase behavior is proven by this record.

E10 `run_all.py` and strict planning-link validation passed locally on 2026-10-01; `git diff --check` was clean. On PR #9's corrected code head `07d84b7`, [architecture checks](https://github.com/xpike-dgm/kavriva-app/actions/runs/36796887535/job/110162264088), [E3 tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36796887507/job/110162264069), [E5 tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36796887566/job/110162264114) and [local Supabase Auth proof](https://github.com/xpike-dgm/kavriva-app/actions/runs/36796887556/job/110162263987) succeeded. The automatic T3 gate was skipped; it is not a separate review.

The independent Luna Max sub-agent `/root/pr9_independent_review` found one architecture issue in the initial formal tenth-contract presentation. The corrected head `07d84b7` moves the rules into a profile of the existing authorization-tuple contract and updates E2/E3 manifests, pack and registry. The reviewer rechecked the corrected profile SHA-256, required storage/origin/CSRF/PKCE/step-up/lookup rules, Supabase signed-URL limits, and final code-head CI, then returned **PASS for T-E3-006c's specification scope** with no open finding. Under DEC-0069, this identified sub-agent verdict can count as the T3 second eye only if the owner explicitly accepts it. That acceptance has not been given for PR #9. No DONE or merge approval is claimed.

T-E3-006b hosted Storage/URL/Studio inventory and T-E3-007 bypass tests remain separate. T-E3-001-R1 and T-E3-006a remain REVIEW; this contract does not promote either to DONE.
