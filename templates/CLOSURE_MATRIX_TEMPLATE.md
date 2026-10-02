---
record_id: V-E10-CLOSE-001
version: 1
purpose: Enumerate ten closure layers and bidirectional proof trace shape
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.4, F10.4.1, R-013, R-014]
public_contracts: []
internal_scope: closure-matrix-authoring-shape
tasks: [T-E10-009]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_conformance.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [D-APP-DOC-004, V-E10-NODE-001, V-E10-REL-001, M-E10-001, V-E10-TOPO-001, I-E10-PATHS-001]
used_by: [P-E10-009, T-E10-009, E-DEV-036]
evidence: [E-DEV-036]
supersedes: []
status: REVIEW
---

# Closure matrix template v1

Record: `V-E10-CLOSE-001`. Planning pin fa914f013fdcd032faed876689092da245989459; appbase 2dc52bddf01e55965ac6e69fc690b8bd39986557.

Binding source: ADR-015 Decision6, scope addendumsection5, COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX, frozen ACCEPTANCE_MATRIX/SIMULATION_REPORT inputs and R013/R014. This record enumerates the shape. It is not an instantiated product audit, executable gap checker or proof of any layer PASS. T-E10-010 owns actual traceability/gap/removal/all-DONE tests. Current task acceptance is exactly ten layers plus bidirectional trace shape.

## Exactly ten closure layers

The canonical labels below are Group4 names, with meanings preserved from addendum5. Default values are deliberately UNVERIFIED. An actual future instance must resolve each source/outcome/owner/test/proof/review cell under its real scope. Blank, reserved, hypothetical, earlier planning coverage or a task's documentary acceptance is not a layer PASS. Every layer is required for a product completion claim.

| Canonical layer | Required meaning | Actual scoped source/outcome | Accountable owner | Test/evidence subject and review | Verdict/reason |
|---|---|---|---|---|---|
| task | Every task closes with acceptance and evidence | Resolve actual task/acceptance/source version | UNOWNED until assigned | MISSING until exact subject/proof/reviewer resolves | UNVERIFIED |
| feature | Every behavior, failure, accessibility and data state of a feature is covered | Resolve feature/state coverage | UNOWNED until assigned | MISSING until actual feature coverage proof | UNVERIFIED |
| flow | End-to-end user flow works across modules, including boundaries and failures | Resolve flow/scenario and real module interaction | UNOWNED until assigned | MISSING until cross-module scenario proof | UNVERIFIED |
| requirement | Every approved requirement/business rule traces to feature, flow, task and validation | Resolve canonical approved source and actual coverage | UNOWNED until assigned | MISSING until forward/reverse links and actual validation resolve | UNVERIFIED |
| design | Every screen/state conforms to canonical design and responsive/accessibility contracts | Resolve screen/state/reference/rules | UNOWNED until assigned | MISSING until real design/a11y evidence | UNVERIFIED |
| architecture | No orphan module/contract, forbidden dependency, cycle or boundary breach | Resolve real capsule/public/private/source boundaries | UNOWNED until assigned | MISSING until actual declared/observed edge and gap proof | UNVERIFIED |
| data/migration | Schema, migration, rollback, offline and restore scenarios are proved | Resolve actual data/version/rollback/source scope | UNOWNED until assigned | MISSING until actual scoped migration/offline/restore proof | UNVERIFIED |
| release | Security, performance, observability, packaging, store and operational gates pass | Resolve actual release/version/gates | UNOWNED until assigned | MISSING until real independent/release/operation proof | UNVERIFIED |
| product-scenario | Approved critical real scenarios produce end-to-end outcomes | Resolve approved real scenario and affected sources | UNOWNED until assigned | MISSING until actual scenario proof | UNVERIFIED |
| gap-audit | No known open question, placeholder, TODO, ownerless risk or unproved DONE remains | Resolve known gaps/risk owners/actual closed proof | UNOWNED until assigned | MISSING until actual gap audit source and findings | UNVERIFIED |

UNOWNED/MISSING annotations identify unresolved cells, not accepted assignments or generated active nodes. The table is authoring scaffolding, never an actual product PASS or automatic gate. A future actual matrix preserves unknown conditions explicitly. Layer applicability cannot be waived by an empty row or copied “N/A”; canonical all-ten completion obligations remain.

## Bidirectional trace shape

Canonical forward chain: Requirement/Rule/Screen/State -> Epic -> Capability -> Feature -> Flow -> Task -> Contract/Module -> Test/Evidence.

Canonical reverse chain: Test/Evidence -> Contract/Module -> Task -> Flow -> Feature -> Capability -> Epic -> Requirement/Rule/Screen/State.

The slash groups denote actual applicable source/implementation/proof identities, not permission to discard one kind that applies. Every approved source needs its real downstream work/validation; every task needs a justified upstream need. No orphan work or taskless approved need. Many-to-many coverage is explicit; a display arrow or copied ID is not a resolved edge or accepted evidence. Instantiating the matrix uses actual stable IDs, versions/revisions and qualified source paths, real outcome/state scope, exact subject digest/head/result/reviewer/timestamp and current findings.

| Direction | Need/source IDs and immutable version/path | Epic | Capability | Feature | Flow | Actual task and acceptance scope | Actual contract/module and boundary | Actual test/evidence, exact subject/review | Open-link status/reason |
|---|---|---|---|---|---|---|---|---|---|
| Forward: approved need to proof | MISSING: resolve real Requirement/Rule/Screen/State | MISSING | MISSING | MISSING | MISSING | MISSING | MISSING | MISSING | UNVERIFIED until every required link/proof resolves |
| Reverse: proof/work to approved need | MISSING: resolve actual canonical need | MISSING | MISSING | MISSING | MISSING | MISSING: justify each task | MISSING | MISSING: resolve actual test/proof subject | UNVERIFIED; reject unjustified orphan task |

Record true MISSING, UNOWNED, BLOCKED, CONFLICT and UNVERIFIED with affected ID/path/outcome/source/reason/owner/next step. Never smooth unresolved links into PASS, infer ownership from filenames or count a planning-source validation assignment as a performed test. A green serialization/numbered-field check and “all tasks DONE” cannot prove these ten layers.

## Instance and proof instructions

Create an actual separately identified scoped matrix under reviewed task context; do not copy this template ID, E10 custody owner or review date into product ownership/verification. Use the accepted sixteen-key record metadata/identity/source/consumer/task/evidence standard, preserving source/control history. Supporting explanations are not an eleventh closure layer. Tests and evidence are distinct: a test identifier or declared method alone is not actual result/subject-bound proof. Use the accepted ARCHITECTURE_TESTS conformance fields by reference, not a new proof schema.

Keep actual subject versions/review heads and archived accepted payloads when source consumers change; new bytes must not borrow old approval. Product/current-state/authorization/release owners remain their canonical owners; E10 stores the matrix and documentary custody. Cache/provider logs/planning declarations cannot replace canonical authority or protected proof. No new provider/runtime/public contract/automatic actuation or ownership choice in this template.

## Countercases and narrow acceptance

All tasks DONE with any upper layer UNVERIFIED -> product completion nonpassing. Missing forward task -> MISSING approved-need coverage; reverse task without source -> unjustified orphan work. Unowned public contract -> UNOWNED, not generated ownership. Changed subject with old review -> UNVERIFIED until current proof. Planning matrix declared coverage/hypothetical all-DONE -> not actual test/release/product evidence. Missing screen/state/data/offline/restore/release proof remains visible. Known TODO/placeholder/gap cannot be suppressed by build success. Copied template identity or E10 product owner -> collision/custody drift, nonpassing.

This task manually and independently compares the exact ten names/meanings and both trace directions, unresolved status discipline and reuse/custody scope. It does not execute gap/removal/all-DONE scenarios, instantiate full product closure or claim semantic corpus acceptance. Existing checks cover declared links/metadata/subject serialization, not all ten product layers.


## Governed sources and current task

Pinned canonical [closure evidence source](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX.md) with ADR-015 Decision6/addendum5 and frozen Phase6 inputs. Actual registration/relation/capsule/admission records listed in depends_on govern this new record; `templates/PACK_TEMPLATE.md` supplies current task context schema. Manual lifecycle governance is used by the task pack, not a new dependency of product completion. Task: `vault/REGISTRY/T-E10-009.md`; pack: `vault/PACKS/P-E10-009.md`; proof: `vault/EVIDENCE/E-DEV-036.md`; address admission: `vault/INVENTORIES/E10-GOVERNED-PATHS.md`. Empty runtime/lineage lists mean no new runtime contract/identity replacement.
