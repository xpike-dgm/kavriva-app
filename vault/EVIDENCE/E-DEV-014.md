---
test_id: E-DEV-014
contract_id_version: "ADR-001 Decisions 2 and 6; T-E3-010 maintenance history/copy representation v1"
subject_file: modules/e03-server/public/maintenance_provenance.py
subject_digest: d63c169d557d16ce3050702c2784936eb549d142bce2c888e12c5433c875a6b3
result: "RECORDED (9 representation tests pass locally; real PostgreSQL and PR checks to follow)"
evidence_links:
  - "[[vault/PROFILES/history-provenance.md]]"
  - "[[vault/PACKS/P-E3-010.md]]"
  - "[[vault/REGISTRY/T-E3-010.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
  - "[[vault/CONTRACTS/audit-event.md]]"
gate_verdict: "RECORDED (separation contract and private reader only; independent review and owner acceptance required)"
reviewer: none
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-014 — History and convenience copies

Nine local unit tests verify head/history separation, all six copy kinds, no history/audit/copy substitution, missing/mixed generation rejection, required correction/operation/actor/time provenance, truthful USER_REPORTED evidence and immutable copies. Four new native PostgreSQL cases in the existing E3 suite verify real current/prior revision provenance, tenant scope/transaction requirement, stale-copy rejection after correction and parent locking against a mixed head. Existing tests prove append-only UPDATE/DELETE rejection. Native database execution and full CI results will be recorded after the PR run; no local pgembed result is claimed.

The profile covers all domain meanings; executable data-store coverage is maintenance only. The private reader requires already authorized trusted tenant context and is not exposed as an HTTP route. It does not authorize the caller, implement history pagination, authenticate a client-supplied snapshot, prove independent E5 audit custody, implement cross-domain source/dispute stores or activate hosted sources. Dataclass checks do not prevent trusted code from constructing new instances; future API consumers must obtain history through the canonical reader after current authorization. Registry physical activations remain HELD and T-E3-001-R1 remains REVIEW.
