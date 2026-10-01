---
test_id: E-DEV-030
contract_id_version: "ADR-015 Decision3; governance specification v1"
subject_file: modules/e10-graph/GOVERNANCE_DETECTOR_SPEC.md
subject_digest: 1df6f58944c2f0915c785ca24c5c7be524ad2588f2f91999bcb0645da9837493
result: "UNVERIFIED: independent task review and exact-head CI outstanding"
evidence_links:
  - "[[modules/e10-graph/GOVERNANCE_DETECTOR_SPEC.md]]"
  - "[[vault/PACKS/P-E10-003b.md]]"
  - "[[vault/REGISTRY/T-E10-003b.md]]"
  - "[[vault/EVIDENCE/E-DEV-029.md]]"
  - "[[modules/e10-graph/STRUCTURAL_DETECTOR_SPEC.md]]"
  - "[[modules/e10-graph/GRAPH_RELATION_CONVENTION.md]]"
  - "[[modules/e10-graph/MANIFEST.md]]"
  - "[[modules/e10-graph/checks/ARCHITECTURE_TEST_SUITE.md]]"
  - "[[modules/e10-graph/checks/VALIDATION_COMMANDS.md]]"
gate_verdict: "BLOCKED (independent review and exact-head CI outstanding)"
reviewer: none
timestamp: 2026-10-02
purpose: Record bounded governance detector source and countercase verification
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.1, F10.1.1]
public_contracts: []
internal_scope: governance-detector-specification
tasks: [T-E10-003b]
tests: [modules/e10-graph/checks/check_contracts.py, modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_packs.py, modules/e10-graph/checks/check_conformance.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E10-GOV-001]
used_by: [V-E10-GOV-001, P-E10-003b, T-E10-003b]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-030 — three governance detector specifications

Author comparison pin: canonical fa914f013fdcd032faed876689092da245989459; app base92c6a28e8a1e68861019561a7fd30b2637f6f260. Frozen acceptance Ownerless/untested/stale specified. Ownerless maps actual surface/provider/contract reconciliation to R011/R012; critical proof maps actual applicable execution/negative-case/head/environment plus required review to R013, not just shape/T3 rows; stale maps own-task/source verification and actual active use to R005, not arbitrary unrelated dates. Every family specifies positive/negative/gap oracles and existing implementation limits. Suite T3 inventory is a minimum, not a non-T3 critical-contract exemption; active stale consumption includes review/retry and cross-task reuse while own-task comparison stays fixed.

Actual check source compared: contracts fixed catalog/field/directory checks; trace resolvable IDs/module; conformance eight fields/digests/links; packs own-task IN_PROGRESS-only fail and missing-date/task WARN; registration serialization preservation. These do not prove semantic behavior, owners or freshness. No code/workflow/runtime/schema or production actuation. T003a final approved primary subject is preserved byte-exact before consumer edits; EDEV029 digest/head/verdict unchanged. Documentary consumers/maintenance traces only; frozen126-origin catalog remains.

Actual validation and independent reviewer/model/context/head/finding/CI receipts will follow. REVIEW is nonpassing pending actual independent acceptance, no implementer self-PASS.

Actual local validation2026-10-02: run_all exit0,12checks/20preservation-identity-freshness regression tests;143Markdown records,994document links,33evidence records,28packs,10manifests with12runtime/8provision edges. Existing frozen P-PROOF-001 unresolved own-task freshness remains WARN. build_index rebuilt26rows; routing retains T003b REVIEW/E3R1 REVIEW/E5 IN_PROGRESS. Exact EDEV029 snapshot equality/digest asserted before source consumer edits. No complete semantic detector or production claim. Source evidence/pack/spec consumer traces are explicit in the maintained records.
