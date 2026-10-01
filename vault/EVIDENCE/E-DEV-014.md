---
test_id: E-DEV-014
contract_id_version: "ADR-001 Decisions 2 and 6; T-E3-010 maintenance history/copy representation v1"
subject_file: modules/e03-server/public/maintenance_provenance.py
subject_digest: d63c169d557d16ce3050702c2784936eb549d142bce2c888e12c5433c875a6b3
result: "PASS for separation/private-reader scope at fc3639b; E3 68 tests, E10 11 checks, PR CI and independent review passed"
evidence_links:
  - "[[vault/PROFILES/history-provenance.md]]"
  - "[[vault/PACKS/P-E3-010.md]]"
  - "[[vault/REGISTRY/T-E3-010.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
  - "[[vault/CONTRACTS/audit-event.md]]"
gate_verdict: "PASS (separation/private-reader scope only; owner accepted identified independent verdict under DEC-0069)"
reviewer: "independent gpt-5.6-luna max subagent, PR #16 head fc3639b20966226c3ee6bbf4a1eac9cf0f0b2b21"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-014 — History and convenience copies

Nine local unit tests verify head/history separation, all six copy kinds, no history/audit/copy substitution, missing/mixed generation rejection, required correction/operation/actor/time provenance, truthful USER_REPORTED evidence and immutable copies. Four new native PostgreSQL cases in the existing E3 suite verify real current/prior revision provenance, tenant scope/transaction requirement, stale-copy rejection after correction and parent locking against a mixed head. Existing tests prove append-only UPDATE/DELETE rejection. PR #16 head fc3639b20966226c3ee6bbf4a1eac9cf0f0b2b21 passed all 68 E3 tests in GitHub CI, including these native database cases, and all applicable E5, live-auth, architecture and T3 checks. All 11 local E10 checks and git diff --check pass.

An independent gpt-5.6-luna max subagent reviewed that exact head and returned PASS with no blocking or substantive findings. It independently ran all 68 E3 tests, including native PostgreSQL cases, in a temporary pinned-dependency environment and confirmed E10 and PR checks. Its bookkeeping request to replace the initial pending-results/reviewer-none text is closed by this record update. The same reviewer returned PASS for final metadata head 4da64e456ff5b6704bda19ed52466e166d202b83. On 2026-10-01 the owner explicitly accepted that identified verdict under DEC-0069. T-E3-010 is DONE for the separation contract and private maintenance reader scope only.

The profile covers all domain meanings; executable data-store coverage is maintenance only. The private reader requires already authorized trusted tenant context and is not exposed as an HTTP route. It does not authorize the caller, implement history pagination, authenticate a client-supplied snapshot, prove independent E5 audit custody, implement cross-domain source/dispute stores or activate hosted sources. Dataclass checks do not prevent trusted code from constructing new instances; future API consumers must obtain history through the canonical reader after current authorization. Registry physical activations remain HELD and T-E3-001-R1 remains REVIEW.
