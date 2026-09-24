---
test_id: E-DEV-002
contract_id_version: authorization-tuple v1 + ADR-006 Decision 2; T-E3-001-R1 remediation
subject_digest: FEF471475D2B5D3EE8D444943AE605D71CDEC6B453F469A2C6C61B7B6464BE00
subject_file: modules/e03-server/internal/postgres_commit_authorization.py
gate_code_digest: C369E37035BDA35D08AC209DF6328F915824BE4B7635C8495CBD53ABBE8D47CE
result: "RECORDED (14 local tests passed; 7 unit plus 7 native PostgreSQL integration tests)"
evidence_links:
  - "[[vault/REGISTRY/T-E3-001-R1.md]]"
  - "[[vault/PACKS/P-E3-001-R1.md]]"
  - "modules/e03-server/public/commit_authorization.py"
  - "modules/e03-server/tests/test_commit_authorization.py"
  - "modules/e03-server/tests/test_postgres_commit_authorization.py"
  - ".github/workflows/e3-tests.yml"
gate_verdict: "BLOCKED (different-chat T3 re-review and production canonical-source binding required)"
reviewer: "implementer self-check only; independent re-review not yet recorded"
timestamp: 2026-09-24
status: RECORDED
last_verified: 2026-09-24
---

# E-DEV-002 — Review remediation evidence

The independent review rejected PR #2. This remediation adds `workload_id` and `delegation_chain` to required tuple fields and confirms that null values hold without an effect. It adds a psycopg adapter that reads the current tuple with `SELECT ... FOR UPDATE` and invokes a database effect writer on the same connection before commit.

Local integration tests use a temporary native PostgreSQL 17.9 server with a private-schema fixture. They verify that a concurrent authority update is observed after lock wait, a competing update cannot pass the held row lock, a writer error rolls back the effect, a successful effect commits, missing authority denies despite cached ALLOW, and missing workload/delegation holds. This proves the transaction mechanism on a real engine. The fixture does not prove that production E5 policy/session/grant/epoch sources or a product-domain mutation are wired; that remains a release-blocking integration requirement.

The prior PR #2 code and its original digest remain preserved by `[[vault/EVIDENCE/E-DEV-001.md]]` and its subject snapshot. CI and independent review verdicts for this remediation must be appended after they occur; no DONE claim follows from the local result.
