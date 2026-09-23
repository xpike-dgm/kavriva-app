# PROOF TASK PACK — P-PROOF-001 (DRAFT run — Phase-8 Step 7)

Status: PROOF RUN (authored 2026-09-22; this pack IS the controlled example task; must not become product-code development)
Record: `P-PROOF-001` (proof-only ID; never enters the product registry as a product task)

Binding sources: `TASK_REGISTRY.md` + `ROUTING_AND_TRACEABILITY.md` (Step 5); Step-3 suite; `PACK_STANDARD.md`
(14 fields — this pack demonstrates them); planning row `T-E3-001` (`06_DELIVERY_PLANNING/TASK_INDEX.md`).

## The 14 fields (demonstrated, not described)

1. objective: Migrate exactly ONE planning row (`T-E3-001`) to a physical registry record + evidence, proving the machine end-to-end.
2. outcome-link: Bootstrap proof (Gate 8 criterion: registry proven by example task).
3. preconditions + completed dependencies: Steps 1–6 installed (skeleton, manifests, validation specs, CI plan, registry specs, migration matrix); planning row `T-E3-001` exists with no Depends-On.
4. mandatory reads (with paths — pack-alone must resolve, no whole-project search):
   planning `08_REPOSITORY_BOOTSTRAP/REGISTRY_DRAFT/TASK_REGISTRY.md`,
   `08_REPOSITORY_BOOTSTRAP/REGISTRY_DRAFT/ROUTING_AND_TRACEABILITY.md`,
   `08_REPOSITORY_BOOTSTRAP/VALIDATION_DRAFT/ARCHITECTURE_TEST_SUITE.md`,
   `07_AI_ARCHITECTURE/ARCHITECTURE_TESTS.md` (conformance 8-field shape authority),
   `07_AI_ARCHITECTURE/CONTEXT_PACKS/PACK_STANDARD.md`,
   planning `06_DELIVERY_PLANNING/TASK_INDEX.md` (row T-E3-001 only),
   `kavriva-app/modules/e03-server/MANIFEST.md` (M-E3-001 installed copy),
   `kavriva-app/modules/e10-graph/MANIFEST.md` (M-E10-001 installed copy).
5. allowed paths: `kavriva-app/vault/REGISTRY/T-E3-001.md`, `kavriva-app/vault/PACKS/P-PROOF-001.md`, `kavriva-app/vault/EVIDENCE/E-PR-001.md`. Nothing else.
6. forbidden areas: every other path in both repos; product feature code; planning-truth edits.
7. expected artifact changes: 3 new files (registry record, pack copy, evidence record). No modifications.
8. acceptance + negative cases: record carries 8 columns + `supersedes` planning row; pack copy identical to this pack; evidence carries 8 conformance fields. NEGATIVE: any 4th file touched, any planning edit, any product code → FAIL.
9. validation / architecture / integration checks to run: check-identity (ID stable/reused, no collision), check-packs (14 fields present), check-links (all references resolve), check-orphans (3 files owned+linked).
10. migration / rollback needs: rollback = delete the 3 files (fully reversible, no residue). Reason: proof-only artifacts.
11. responsive / accessibility rules: N/A (no user surface; machine records only).
12. evidence + handoff format: `E-PR-001` conformance record (8 fields) + this report section.
13. graph-update records the task must write: `vault/INDEX/` regeneration note (deferred: no index builder yet — recorded as gap, not hidden).
14. escalation rules: any BLOCKED → change-request per R-009; proof failure blocks Gate 8 (no waiver).

## Proof report (filled during the run)

- [x] registry record created with `supersedes` link (prefix corrected after fresh-session test)
- [x] pack copy identical (byte-compared, SHA256 match after every pack edit)
- [x] evidence record with 8 fields created (digest computed, result filled, verdict/reviewer pending verification)
- [x] 4 checks run: identity single-claimant / packs 14-14 / links resolve / orphans 0
- [x] fresh-session test completed: INSUFFICIENT first round → 5 issues (manifest paths missing, evidence-shape
  authority missing, repo prefix wrong, evidence pre-filled, digest placeholder) → ALL FIXED in this run;
  round 2 re-test SUFFICIENT + MATCH (hashes verified by separate context)
- [x] rollback rehearsal completed: 3 files deleted → git status clean, only .gitkeeps remain → all 3
  re-created byte-identical (registry digest 4CBF0133…B23A match, pack copy SHA256 match)
- [x] Gate 8 readiness audit round 1: BLOCKED on 3 procedural items only (uncommitted evidence) → closed:
  E-PR-001 VERIFIED committed+pushed (`732fa9e`), PROOF_PACK tracked here, checklist flipped with evidence;
  round 2 re-audit PASS (all items CLOSED on committed SHAs, CI green, deferrals recorded) — Gate 8 approval pending owner
