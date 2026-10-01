---
test_id: E-DEV-030
contract_id_version: "ADR-015 Decision3; governance specification v1"
subject_file: modules/e10-graph/GOVERNANCE_DETECTOR_SPEC.md
subject_digest: 38a02fd7f3871b92b0337f0e2a3763e4d0c439ab11dd25e2787f410f50d710eb
result: "PASS: independent review accepted three governance detector specifications"
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
gate_verdict: "PASS (three specifications only; semantic implementation and production unproved)"
reviewer: "independent gpt-6-luna max; /root/pr32_independent_review"
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

Independent acceptance: /root/pr32_independent_review, bounded independent context/forknone, gpt-6-luna max, PASS at d1097e3c739f2d22a5f2f08b559c06817c5e2b3c againstbase92c6a28, no actionable findings. Source/conformance/actual-consumer/ownership/critical-proof/freshness countercases and current implementation-limit audit passed. Source spec digest 1df6f58944c2f0915c785ca24c5c7be524ad2588f2f91999bcb0645da9837493; final status/receipt digest 38a02fd7f3871b92b0337f0e2a3763e4d0c439ab11dd25e2787f410f50d710eb. Required run_all12checks+20unittest regressions/index/diff succeeded; separately attempted optionalpytest unavailable (not a required runner/gate; no dependency installed). Preserved EDEV029 raw snapshot equals exactbase Git blob; original digest/verdict/head/date and126origincatalog retained. NewartifactIDs have zero canonical collision. No author self-PASS or undocumented reviewer.

Actual source-head applicable CI allSUCCESS: PR architecture36940450977/E336940450968/E536940450983/Auth36940450957; push architecture36940413515/E336940413443/E536940413523/Auth36940413580. Expected T3 label-gated skips verified: no t3-privileged label, documentary E10 T2 scope; mandatory independent review still obtained. Owner direct standing mandate2026-10-01 accepts actual bounded independent PASS/greenCI before normal exact-head merge.

Spec ACTIVE/task DONE/evidence PASS for three rules specified only. Final metadata/status/evidence/index audit and new-head applicable CI required before merge; immutable exact finalhead/verdict/runs in PR32 avoid recursive proof updates. E3R1 REVIEW/E5 IN_PROGRESS/production/release/activation holds unchanged; no semantic corpus coverage claim.
