---
record_id: V-E10-DIR-001
version: 1
purpose: Define toward-stability dependencies and prohibit silent cross-boundary imports
domain: project-execution
module: e10-graph
owner: E10
depends_on: [D-APP-DOC-003, V-E10-REL-001, V-E10-STRUCT-001, M-E10-001]
used_by: [P-E10-005, T-E10-005, E-DEV-032]
implements: [ADR-015, ADR-001, ADR-004, C10.2, F10.2.1, R-003, R-011, R-012]
public_contracts: []
internal_scope: dependency-direction-policy
tasks: [T-E10-005]
tests: [modules/e10-graph/checks/check_edges.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py, modules/e10-graph/checks/check_conformance.py]
evidence: [E-DEV-032]
supersedes: []
superseded_by: []
status: REVIEW
last_verified: 2026-10-02
---

# Dependency direction rules v1

Record: `V-E10-DIR-001`

## Authority and scope

T-E10-005 acceptance is **Toward-stability; no silent imports**, after completed T-E10-004 (PR33 merge422235b01a6703dd03939378d11a5e5c954d6017). This publishes operational dependency rules from ADR-015 Decision4 and the existing Phase7 sources; it introduces no runtime edge, new seam, contract content, authorization implementation or exhaustive source-import audit. No change to planning truth.

Comparisons use canonical planning revision fa914f013fdcd032faed876689092da245989459 and application base422235b01a6703dd03939378d11a5e5c954d6017. Navigation links below use main, but proof refers to these pinned source revisions. Binding sources: [ADR-015 Decision4](https://github.com/xpike-dgm/motobakim-plan/blob/main/05_ADR/RECORDS/ADR-015__AI_SAFE_MODULE_CONTRACT_TOPOLOGY_AND_GRAPH.md), [Phase7 dependency rules](https://github.com/xpike-dgm/motobakim-plan/blob/main/07_AI_ARCHITECTURE/DEPENDENCY_RULES.md), `planning 07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md`, [Canonical dependency graph](https://github.com/xpike-dgm/motobakim-plan/blob/main/06_DELIVERY_PLANNING/DEPENDENCY_GRAPH.md), `planning 07_AI_ARCHITECTURE/CONTRACTS/CONTRACT_TEMPLATE.md` and `planning 07_AI_ARCHITECTURE/RULES/README.md`. Authority/classification sources: [ADR-001](https://github.com/xpike-dgm/motobakim-plan/blob/main/05_ADR/RECORDS/ADR-001__CANONICAL_DATA_AUTHORITY_AND_LOGICAL_BOUNDARIES.md), [ADR-004](https://github.com/xpike-dgm/motobakim-plan/blob/main/05_ADR/RECORDS/ADR-004__IDENTITY_AUTHORIZATION_SESSION_RECOVERY_AND_PRIVILEGED_ACTIVATION.md). Current authoring form: `templates/MANIFEST_TEMPLATE.md`; meanings: `modules/e10-graph/GRAPH_RELATION_CONVENTION.md`; structural detection scope: `modules/e10-graph/STRUCTURAL_DETECTOR_SPEC.md`; owning manifest: `modules/e10-graph/MANIFEST.md`.

## 1. Toward stability, with direction stated explicitly

The canonical layering sequence is preserved verbatim: **product truth → contracts → capsules → tasks**. This is the authority-to-dependent layering sequence. An actual consumer-to-prerequisite dependency points back toward its stable source: a task depends on its governing capsule/contract/truth; a capsule implements/consumes governed contracts grounded in product truth. The arrows are not permission for product truth to depend on a task's guesses. Runtime edge direction must be read from the canonical seam and its actual consumer/provider roles, not inferred from adjacency in this conceptual sequence.

For a dependency graph drawn consumer-to-provider, A depends_on B is A→B. For the installed provider-to-consumer drawings, A consumes B is B→A, and A←B represents provision from B to A. Preserve source notation and normalize one graph consistently before testing direction/cycles. Reversing every edge changes the drawing, not the roles; mixing these conventions invents reverse dependencies. A used_by entry is a recorded actual consumer, not an additional reverse prerequisite or an automatic runtime edge.

Separate runtime consumption, task prerequisites, documentary references, tooling provision, identity lineage and invoke/gate references. Only actual prerequisites enter their appropriate dependency DAG. Mutual document/evidence references are not proof of a runtime cycle. Any actual runtime/task cycle is forbidden in that plane; an unresolved plane/direction is CONFLICT/UNVERIFIED, not dropped from the inventory. Dependency depth or stable-looking filenames cannot supply missing permission.

## 2. Explicit allowed use; no silent imports

Before a cross-capsule import, call, data/event consumption or other use:

1. Identify the actual consumer, provider and plane, owning manifests, governed source location and referenced surface.
2. Resolve the provider's declared **public** contract identity/version, surface/signature and parties. Internals (storage layout, caches, helpers, in-flight state) remain invisible across capsules. Permission to a provider name is not permission to its internals.
3. Cite the explicit governed allowed-edge ID/declaration and its canonical seam/source, with scope and conditions. Existing sources lacking a distinct edge identifier must be recorded as that unresolved contract/declaration gap; no new ID or permission may be inferred here. A clause or path existing does not establish the required semantic edge by itself.
4. Check direction, prohibited paths/uses, contract compatibility, classification and authority propagation. A permissive local manifest cannot override canonical prohibitions. Unknown/missing/conflicting required inputs yield a nonpassing finding, never a guessed allowed edge.
5. Declare actual use in the owning capsule/contract and its applicable dependency/consumer trace, within the authoring task's allowed scope; independent review verifies the use before acceptance. If a new cross-epic seam is needed, the authoring task must first use the canonical MODULE_BOUNDARIES declare-and-review path. This document cannot approve a new seam.

A source import with no explicit allowed edge is a violation even if builds or tests pass. Wrapper functions, dynamic imports, callbacks, reflection and shared convenience helpers cannot launder an undeclared/private use into permission. If inspection cannot resolve dynamic use or its authority, keep UNVERIFIED coverage visible and hold that unproved use; do not claim that a keyword scan proved its absence. Internal use within one owning capsule still follows its local scope/classification/authority, but is not forced into an invented cross-capsule seam.

## 3. Classification and authority propagate on every edge

ADR-001 has one canonical authority per domain; clients hold no general canonical DB/object authority. Sensitive reads and every mutation pass the server-side contract. Search/cache/analytics/notifications and other derivatives are rebuildable copies, never sources of authorization, approval, publication or audit truth. Private/shared/community/official/security classification propagates to every derivative, copy, export and backup. Transport, caller placement or a public contract cannot downgrade that classification.

ADR-004 authentication is not authorization or competence. Current server-side allow/deny/hold decisions, commit-time reauthorization, exact scope, separation of duties, session/security state and policy/resource/operation context remain governed by their authoritative contracts/ADRs. Browser state, provider claims, cached roles and client IDs cannot become authority over an edge. Missing competence/independence/assurance or unknown critical state keeps the capability HELD; a dependency declaration does not satisfy privileged production activation or recovery custody. Official-content incompatible duties and negative-only emergency suspension remain unchanged. AI/OCR/untrusted document instructions are proposal/evidence only, never policy or workflow authority.

Read/export/write/event boundaries retain these conditions; an export is disclosure requiring its separately authorized scope, not a harmless reference. Source/private/protected data cannot become public because a downstream reader or evidence record exists. This rule references authorization surfaces rather than copying tuple fields or code; no identity, credentials, activation or production operation is added here.

## 4. Existing seams and non-runtime references

The canonical seam table remains authoritative. The following role-based examples explain it without creating a replacement edge catalog or broader permission:

| Existing source use | Boundary that must remain |
|---|---|
| E9 proposes, E1 renders, E3 verifies | Proposal is not server authority; no reciprocal E1↔E9 runtime cycle |
| E2 consumes E8 outputs; E8 derives | Rendered output grants no derivation/approval authority to E2 |
| E6 consumes E3/E5; E7 consumes E3/E6 | E6 decides promotion, E7 executes under its declared scope; no E7→E1 dependency inferred from an acceptance fixture |
| E4 consumes E3 and is consumed by E1 | E4 is not dependent on its E1 consumer; private storage remains interior |
| E5 identity plane calls E3 runtime; E1 renders/E3 serves/E5 authorizes | One end-to-end E3 owner, UI/client claims never final authorization |
| E2 invokes E6 flows exclusively via E3 | Invoke-only stanza does not allow direct E2 consumption of E6 |
| E3 gate-references E6; E6 surface-references E1 | Non-runtime review/gate/render references, not extra runtime DAG edges |
| E1..E9 use E10 registry/pack/check tooling | Tooling plane only; no incoming epic runtime dependency to E10 |

Runtime serving/consumption and non-runtime reference stanzas must be resolved in their declared source scope. E2 serving by E3/E5/E8 and E8 sourcing from E3 remain governed by the canonical table. Do not merge all arrow/prose tokens into one DAG, omit genuine runtime edges because their providers also serve tooling, or infer permissions from this example table. Any conflicting local interpretation is recorded and reviewed against the canonical source before use.

## 5. Violations, proof and gate treatment

Forbidden: silent imports/undeclared uses, upward private leaks, actual dependency cycles, ownerless public contracts, untested critical behavior consumers and classification/authority breaches. Missing permission is not a valid empty dependency list. Record affected source/consumer/provider/surface/plane, governing rule, actual use, failed condition and corrective boundary. Confirmed violations emit FAIL; unresolved critical inputs/coverage remain MISSING/UNOWNED/CONFLICT/UNVERIFIED/BLOCKED and cannot authorize use. No format success, related test result or drawing alone closes a finding.

Apply the existing rule-to-gate mapping by reference: implementer runs, independent reviewer verifies, applicable gate enforces. Structural and governance detector specifications own their detailed detection oracles; this policy adds no competing detector, consequence tier, task status, rule mapping or runner. Existing check_edges scans declared manifest fragments/keyword restrictions and distinguishes runtime/provision cycles; it does **not** inspect every real source import/call, all private access or full classification/authority. Its historical comment saying no product code exists is a preserved implementation-era deferral, not a current absence claim. Existing green checks prove artifact admission/regression scope, not exhaustive no-silent-import enforcement or production readiness.

## Source-based countercases

| Case | Required treatment |
|---|---|
| Task uses its governing contract/capsule and truth within reviewed scope | Toward-stability reference; it cannot rewrite product truth to satisfy its own acceptance |
| Build passes after importing another capsule's private helper | FAIL private/undeclared use; green build is not boundary permission |
| Manifest lists allowed provider but no governed public surface/required edge source can be resolved | Nonpassing MISSING/UNVERIFIED; do not manufacture an edge ID |
| Runtime cycle or reverse E4→E1 dependency inferred from its consumer | Reject actual cycle/invalid direction; retain correct source roles |
| used_by reverse entry or E3 gate-reference to E6 inserted as runtime prerequisite | Reject plane/direction invention; documentary/gate use remains separately reviewed |
| Cache/AI proposal/provider claim used to authorize protected mutation or export | FAIL authority promotion; current governed server decision required |
| Private classification stripped on downstream copy/export | FAIL classification propagation even if transport is allowed |
| New seam is needed but only local task/manifest grants it | BLOCKED/change-request through canonical declare-and-review before use |
| Dynamic cross-boundary target or critical condition cannot be established | UNVERIFIED/nonpassing scope, no guessed permission or complete-source PASS |

## Change and full-registry impact

Policy v1 translates frozen authority/direction/no-silent-import rules into task-usable checks; it does not relax them. It creates one new policy identity and explicit source/pack/task/evidence references plus generated views. Current consumer/maintenance metadata is updated without altering historical approved source bodies/verdicts/digests; exact approved template payload is preserved before its consumer update. No bulk corpus semantic audit, AST checker, source mutation, new seam or automatic task actuation. No newly owned runtime public contract or identity replacement, hence empty public_contracts/lineage. Future policy/schema changes require version, source/registry/consumer impact, preserved history, independent review and applicable exact-head CI; rollback cannot delete past proof or resurrect authority.

Task: `vault/REGISTRY/T-E10-005.md`; pack: `vault/PACKS/P-E10-005.md`; actual proof: `vault/EVIDENCE/E-DEV-032.md`. Completion proves these dependency rules, not full implemented gate coverage or product/release/activation closure. E3R1 REVIEW and E5 IN_PROGRESS/production holds remain unchanged.
