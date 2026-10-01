---
test_id: E-DEV-031
contract_id_version: "ADR-015 Decisions1-2; capsule declaration template v1"
subject_file: templates/MANIFEST_TEMPLATE.md
subject_digest: 1efa8bd5390f8af2d3ad3f74962f97a0287cf1b2e17b06f7f86715a29364323c
result: "UNVERIFIED: independent task review and exact-head CI outstanding"
evidence_links:
  - "[[templates/MANIFEST_TEMPLATE.md]]"
  - "[[vault/PACKS/P-E10-004.md]]"
  - "[[vault/REGISTRY/T-E10-004.md]]"
  - "[[vault/REGISTRY/T-E10-001.md]]"
  - "[[vault/EVIDENCE/E-DEV-027.md]]"
  - "[[modules/e10-graph/GRAPH_NODE_REGISTRATION.md]]"
  - "[[modules/e10-graph/GRAPH_RELATION_CONVENTION.md]]"
  - "[[modules/e10-graph/MANIFEST.md]]"
gate_verdict: "BLOCKED (independent review and exact-head CI outstanding)"
reviewer: none
timestamp: 2026-10-02
purpose: Record bounded capsule template source, anatomy and preservation validation
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.2, F10.2.1]
public_contracts: []
internal_scope: capsule-declaration-template
tasks: [T-E10-004]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py, modules/e10-graph/checks/check_conformance.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [D-APP-DOC-003]
used_by: [D-APP-DOC-003, P-E10-004, T-E10-004]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-031 — capsule declaration template

Source comparison pin planningfa914f013fdcd032faed876689092da245989459/appbased9dc9441620b3255f5ecc6963d9b5c0cb791b23b. Frozen six-group acceptance is retained plus seventh canonical Links field; actual seven headings and16minimummetadata keys have authoring prompts and source/oracle mapping. Full form covers purpose/accountable outcome, owned public contracts/signatures/parties/authority by reference, private interior, explicit scoped allowed/forbidden edges, actual tests/negative cases/evidence, controlled change/rollback/version-vs-lineage and requirement/design/task/test links. Unknown/custody-as-productowner/privatepermission/test-pointer-as-proof/newseam/date-refresh/versionrename countercases stay nonpassing. No new contract contents/tuple logic copied.

D-APP-DOC-003 identity/address retained, original bootstrap stub body/origin exact; current marked v1 extension is governed T004 authoring, not source/history rewrite. Current last_verified covers actual new template verification, original dates/proof payloads remain at preserved subjects. No instantiation/module-body migration/runtime/code/schema/workflow change. Existing heading checks prove only installed anatomy presence, not full semantic correctness of product capsules.

Validation/results/digests/exact-headCI and actual independent reviewer/context/model/head/findings/final audit follow. Task REVIEW/evidence nonpassing pending independent acceptance, no author self-PASS. Prior T001 proof/archived subjects/origin catalog remain.

Actual validation2026-10-02: marked reusable form contains all16required metadata keys/all7exact anatomy headings; all10installed module manifests retain same7headings. Current template body starts with entire unchanged base document body (including stub/custody) before its governed extension; original126blob/catalog and prior approved subject digests preserved. run_all exit0, all12checks/20unittest regression tests;146Markdown records,120indexedIDs,1017resolveddocument links,34evidence records,29packs. Existing frozen P-PROOF-001 own-task freshness WARN retained. build_index rebuilt27rows/routing retains T004 REVIEW/E3R1 REVIEW/E5 IN_PROGRESS; git diff --check clean. No product-body semantic audit, mirrored test or new implementation.
