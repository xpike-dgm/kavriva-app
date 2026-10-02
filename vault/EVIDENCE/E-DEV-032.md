---
test_id: E-DEV-032
contract_id_version: "ADR-015 Decision4; dependency direction policy v1"
subject_file: modules/e10-graph/DEPENDENCY_DIRECTION_RULES.md
subject_digest: d4d2d7a183c996960aecfbad5dabee63fcb600fd19389d4dd03eaca716cb5846
result: "UNVERIFIED: independent task review and exact-head CI outstanding"
evidence_links:
  - "[[modules/e10-graph/DEPENDENCY_DIRECTION_RULES.md]]"
  - "[[vault/PACKS/P-E10-005.md]]"
  - "[[vault/REGISTRY/T-E10-005.md]]"
  - "[[templates/MANIFEST_TEMPLATE.md]]"
  - "[[modules/e10-graph/GRAPH_RELATION_CONVENTION.md]]"
  - "[[modules/e10-graph/STRUCTURAL_DETECTOR_SPEC.md]]"
  - "[[modules/e10-graph/MANIFEST.md]]"
  - "[[vault/EVIDENCE/E-DEV-031.md]]"
gate_verdict: "BLOCKED (independent review and exact-head CI outstanding)"
reviewer: none
timestamp: 2026-10-02
purpose: Record bounded dependency-direction source and boundary verification
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.2, F10.2.1]
public_contracts: []
internal_scope: dependency-direction-policy
tasks: [T-E10-005]
tests: [modules/e10-graph/checks/check_edges.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py, modules/e10-graph/checks/check_conformance.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E10-DIR-001]
used_by: [V-E10-DIR-001, P-E10-005, T-E10-005]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-032 — dependency direction rules

Canonical pin fa914f013fdcd032faed876689092da245989459/appbase422235b01a6703dd03939378d11a5e5c954d6017. Author source comparison retains product truth→contracts→capsules→tasks sequence and distinguishes conceptual authority-to-dependent layering from consumer-to-provider prerequisite graphs and installed provider-to-consumer runtime notation. Actual canonical roles govern, not arrows alone. Explicit allowed edge/public contract/surface/version/source/classification-authority conditions, no silent imports/private leaks/cycles/ownerless or untested critical consumers. Non-runtime invoke/gate/tooling references stay separate. ADR001/004 client/cache/proposal/provider claims cannot become canonical server authorization, disclosure/publication or product/recovery activation authority.

Negative cases map unknown/private/undeclared uses, reverse-inverse/gate cycles, stripped classification, new local-only seam or unverified dynamic target to nonpassing scope. Policy references existing tuple/contracts instead of copying fields/logic; no new rule owner/tier/vendor/threshold/code/runtime seam. Existing check_edges proves manifest fragments/keyword/plane-cycle subset only; preserved no-product-code-era comment not presented as current fact. No exhaustive source import audit or semantic corpus/production PASS.

Prior PR33-approved template subject preserved as exact base raw Git blob, normalized9bee1f4bd936f266f40a158e5b337db0c9193dd8c1bda7be3e7c0eb93652fb47. EDEV031 redirects to that payload retaining original digest/verdict/reviewer/head/date; current source consumer/task traces only. Frozen126origin tree/older subjects untouched.

Actual validation and independent context/model/head/findings/CI will follow. Task REVIEW/evidence nonpassing until actual bounded independent acceptance; no author self-PASS.

Initial run:11checks/20regressions passed, check_links failed because CI planning allowlist lacks DEPENDENCY_GRAPH.md. Corrected navigation address to qualified canonical GitHub link; no allowlist/check-code change or automatic external-source verification claimed. Pinned source manually compared; external semantic coverage remains explicit.

Actual local validation2026-10-02: run_all exit0, all12checks/20unittest regressions;150Markdown records/124indexedIDs/1043resolveddocument links/35evidence/30packs,10manifests with12runtime+8provision edges. Existing frozen P-PROOF-001 own-task freshness WARN retained. Index28rows/routing rebuilt, T005 REVIEW/E3R1 REVIEW/E5 IN_PROGRESS. Newpolicy/pack/evidence IDs zero canonical collisions, exact approved template rawblob/normalizeddigest asserted. git diff --check clean. Existing checks establish serialization/preservation/declared graph subset only, not exhaustive source imports/authority.
