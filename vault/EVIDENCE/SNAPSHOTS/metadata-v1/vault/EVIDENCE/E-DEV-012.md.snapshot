---
test_id: E-DEV-012
contract_id_version: "ADR-002 Decision 6; ADR-006 Decision 11; T-E3-008 AI task-scope rules"
subject_file: vault/PROFILES/ai-task-scope.md
subject_digest: 3FFF1CFC8210981A00EB824C260A5DD0FB5263C79DE2AF7AFCE7D86A3AD3BDDC
result: "PASS for rule-only scope at efdce08; E10 11 checks, PR CI and independent review passed; owner accepted identified verdict on 2026-10-01"
evidence_links:
  - "[[vault/PROFILES/ai-task-scope.md]]"
  - "[[vault/PACKS/P-E3-008.md]]"
  - "[[vault/REGISTRY/T-E3-008.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
  - "[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]"
gate_verdict: "PASS (rule-only scope; owner accepted identified independent verdict under DEC-0069)"
reviewer: "independent gpt-5.6-luna max subagent, PR #14 head efdce08ce8854767b41189e938b66ba10f2551a7"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-012 — AI task-scope rule

The profile names required task, environment, target, operation, grant, limit, dry-run, review and evidence fields. It forbids owner/billing credentials, `service_role`, unrestricted SQL/SSH, global object access, recovery/signing keys and AI self-approval. Negative examples require fail-closed behavior for absent/revoked scope, environment drift, cross-tenant target, leaked credentials and mismatched writes. The E3 manifest references this rule. On 2026-10-01, `python modules/e10-graph/checks/run_all.py` passed all 11 checks and `git diff --check` passed. PR #14 head `efdce08ce8854767b41189e938b66ba10f2551a7` had green architecture, T3, E3, E5 and live-auth CI. An independent `gpt-5.6-luna` subagent at max reasoning reviewed that exact head and returned PASS with no blocking findings for the rule-only task. The reviewer also returned PASS for the final record delta at a1e329abb02cd74f0520af9170496a7aa59151f3. On 2026-10-01 the owner explicitly accepted that identified verdict under DEC-0069. T-E3-008 is DONE for the rule specification scope only.

This is a document rule. No broker, scoped AI credential, live provider role, secret rotation, production tool gate or hosted access was created or proved. Earlier administrative migration access is preserved as history, not as compliance evidence. T-E3-001-R1 remains REVIEW.
