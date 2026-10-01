---
test_id: E-DEV-012
contract_id_version: "ADR-002 Decision 6; ADR-006 Decision 11; T-E3-008 AI task-scope rules"
subject_file: vault/PROFILES/ai-task-scope.md
subject_digest: 3FFF1CFC8210981A00EB824C260A5DD0FB5263C79DE2AF7AFCE7D86A3AD3BDDC
result: "RECORDED (E10 run_all.py: 11 checks passed; git diff --check passed; independent review pending)"
evidence_links:
  - "[[vault/PROFILES/ai-task-scope.md]]"
  - "[[vault/PACKS/P-E3-008.md]]"
  - "[[vault/REGISTRY/T-E3-008.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
  - "[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]"
gate_verdict: "RECORDED (rule specification only; no credential or production activation)"
reviewer: none
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-012 — AI task-scope rule

The profile names required task, environment, target, operation, grant, limit, dry-run, review and evidence fields. It forbids owner/billing credentials, `service_role`, unrestricted SQL/SSH, global object access, recovery/signing keys and AI self-approval. Negative examples require fail-closed behavior for absent/revoked scope, environment drift, cross-tenant target, leaked credentials and mismatched writes. The E3 manifest references this rule. On 2026-10-01, `python modules/e10-graph/checks/run_all.py` passed all 11 checks and `git diff --check` passed. Independent review and PR CI are still required.

This is a document rule. No broker, scoped AI credential, live provider role, secret rotation, production tool gate or hosted access was created or proved. Earlier administrative migration access is preserved as history, not as compliance evidence. T-E3-001-R1 remains REVIEW.
