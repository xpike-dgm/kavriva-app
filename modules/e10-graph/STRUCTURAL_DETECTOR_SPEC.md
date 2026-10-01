---
record_id: V-E10-STRUCT-001
version: 1
purpose: Specify orphan, broken-link, cycle and forbidden-dependency detection
domain: project-execution
module: e10-graph
owner: E10
depends_on: [V-E10-REL-001, V-TST-001, V-CMD-001, M-E10-001]
used_by: [P-E10-003a, T-E10-003a, E-DEV-029]
implements: [ADR-015, C10.1, F10.1.1, R-002, R-003, R-014]
public_contracts: []
internal_scope: structural-detector-specification
tasks: [T-E10-003a]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py, modules/e10-graph/checks/check_edges.py, modules/e10-graph/checks/check_orphans.py]
evidence: [E-DEV-029]
supersedes: []
superseded_by: []
status: REVIEW
last_verified: 2026-10-02
---

# Four structural detectors — specification v1

Record: `V-E10-STRUCT-001`

## Authority and acceptance boundary

The frozen T-E10-003a acceptance is **Orphan/broken/cycle/forbidden specified**, prerequisite T-E10-002 (accepted PR30, merge f81ddfd736a3dde9747b32f1794530cf3277967d). This artifact specifies four detectors, their inputs, deterministic decisions, countercases and current implementation limits. It does not claim that those semantic algorithms are all implemented or that the corpus passes them. Ownerless public contracts, untested critical behavior and stale packs belong to T-E10-003b. Identity admission remains with the accepted registration rule.

Source comparison pin: canonical planning origin/main fa914f013fdcd032faed876689092da245989459; application base f81ddfd736a3dde9747b32f1794530cf3277967d. GitHub main links are navigation addresses, not immutable proof; comparisons below use these pinned source revisions.

Binding sources: [ADR-015 Decisions 2–4](https://github.com/xpike-dgm/motobakim-plan/blob/main/05_ADR/RECORDS/ADR-015__AI_SAFE_MODULE_CONTRACT_TOPOLOGY_AND_GRAPH.md), [Phase7 dependency rules](https://github.com/xpike-dgm/motobakim-plan/blob/main/07_AI_ARCHITECTURE/DEPENDENCY_RULES.md), `planning 07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md`, `planning 07_AI_ARCHITECTURE/ARCHITECTURE_TESTS.md` and `planning 07_AI_ARCHITECTURE/RULES/README.md`. Installed companion specifications: `modules/e10-graph/checks/ARCHITECTURE_TEST_SUITE.md` and `modules/e10-graph/checks/VALIDATION_COMMANDS.md`. Relation meanings: `modules/e10-graph/GRAPH_RELATION_CONVENTION.md`. E10 is a tooling foundation, with no incoming epic runtime dependency.

## Shared input, scope and output contract

Use an immutable repository revision and a pinned canonical planning revision. Inventory all tracked records, source files and folders plus governed generated artifacts; preserve explicit inventory exclusions with their source reason. Archive payloads are historical subjects, not active graph nodes. Never treat a directory prefix or basename match as proof of semantic ownership. Small files can resolve through module manifests, path inventories and task evidence; no redundant per-file records are required.

Resolve typed stable identities and governed addresses before constructing edges. Keep each relation's source record/field/location, target, kind, plane and authority. Documentary references, runtime consumption, task prerequisites, tooling provision, identity lineage and invoke/gate references are distinct. Generated indexes are views checked against authoritative records, not replacements for them. Historical custody metadata cannot override original product declarations. Conflicting scopes or unresolved inputs remain CONFLICT/MISSING/UNVERIFIED; never guess, silently discard or turn unknown into an empty list.

Each finding identifies detector/version, subject revision and digest, source address/location, target or affected node, relation plane, governing rule/source, observed condition, expected condition and corrective boundary. A cycle includes its ordered witness; a forbidden edge includes its actual use and permission source. Preserve the source gap labels and failed checks. Publish a conformance-shaped record using the existing eight fields (test ID, contract ID+version, subject digest, result, evidence links, gate verdict, reviewer, timestamp), not a competing evidence schema.

Confirmed violations emit FAIL for their detector scope. Missing or ambiguous necessary input emits a nonpassing gap finding; it cannot produce PASS for that scope. PASS requires complete declared input coverage, successful resolution, and zero violations/gaps for the identified detector, revision and plane. Checks may report partial coverage, but a subset passing cannot stand in for full semantic PASS. Rule-to-gate ownership is invoked from RULES/README, never reassigned here; the implementer runs, independent reviewer verifies and the applicable gate enforces.

## 1. Orphan detector (R-002)

**Input:** inventory, record identity/metadata, module manifests and governed path coverage, registry/task links, purpose/owner/module relations. Inspect every current record/file/folder, not merely Markdown.

**Decision:** For each item resolve at least one meaningful purpose/ownership/module/task anchor, as required by ADR-015 Decision2. A module path declaration must actually cover the item and resolve to a manifest; a task anchor must resolve to an actual task and scoped change/evidence reference. A bare mention, shared filename or generic prefix does not supply an anchor. Report an orphan if no such anchor resolves. If an asserted anchor is unresolved, report the linked broken-reference gap as well; do not infer an orphan's owner. Missing owner on an otherwise anchored public contract is separately the T003b governance detector, not proof that every anchored item is an orphan. A standalone purposeful root/capsule record need not invent a dependency merely to avoid zero degree.

**Output:** affected inventory item, attempted anchors and resolution outcomes; FAIL for confirmed absence, explicit gap for unknown inventory/anchor. No orphan PASS when source files or folders are unexamined.

| Case | Required decision |
|---|---|
| Small source helper covered by its owning module manifest/path inventory and scoped task evidence | Anchored; no artificial per-file registry row |
| Unreferenced file in an otherwise recognized directory | FAIL when no meaningful anchor resolves; the directory prefix alone cannot exempt it |
| Record has a resolvable purpose/module anchor but no depends_on or used_by | Not an orphan solely for zero dependency degree |
| Alleged owner is guessed from basename, or inventory omits a new folder | Nonpassing UNVERIFIED/MISSING coverage; no invented anchor |

The installed suite's old conjunctive shorthand (no owner, no dependency/reference and no registry row) describes a symptom. The binding topology's at-least-one meaningful anchor rule governs files/folders/records; raw field presence is not resolution. This clarification does not weaken ownerless-contract governance.

## 2. Broken-link detector (R-014)

**Input:** references in metadata, governed document links, manifest/contract/task/test/evidence pointers and lineage, plus identity/address indexes and qualified canonical planning sources. Scope excludes illustrative text only where explicitly identified as an example, never because a reference is inconvenient.

**Decision:** Resolve every declared reference to exactly one governed target of the required type/scope. Local paths must stay in their intended repository and exist at the pinned revision; a bare filename is valid only if unique. Stable IDs resolve by their declared identity namespace, without renaming existing slugs. Planning references retain qualified source and revision/section; unavailable external source is UNVERIFIED, not assumed current from an allowlist. Contract references require the specified contract/version; replaced identities follow reviewed lineage with both histories preserved. Target existence does not establish semantic relationship correctness or executed test evidence. Mark nonexistent as MISSING, ambiguous/type/version/lineage mismatch as CONFLICT, and unresolved verification as UNVERIFIED. Any source gap label hidden by successful serialization remains a failure/gap.

**Output:** source field/link, literal target, candidates, required type/version/source revision and reason; FAIL for broken/hidden links, nonpassing gap for unverifiable targets.

| Case | Required decision |
|---|---|
| Qualified local ID/path resolves uniquely at the revision | Resolved in that reference scope; no runtime permission inferred |
| Two matching basenames or an ID absent from authoritative records | CONFLICT or MISSING, never first-match success |
| Referenced test exists but was never executed | Link resolved; no test PASS inferred; governance proof remains separate |
| Planning link is allowlisted but pinned source cannot be verified | UNVERIFIED for semantic source coverage |
| Old proof now addresses changed subject bytes | FAIL evidence binding; preserve original payload or obtain new reviewed proof |

## 3. Cycle detector (R-003)

**Input:** resolved prerequisite edges from canonical task dependencies and runtime consumption/allowed-dependency declarations plus actual source uses. Build a task graph and a runtime graph separately. In a consumer-to-provider graph A depends_on B is A→B; provider-to-consumer drawings may be normalized only with source direction explicitly retained. Reversing all edges preserves acyclicity, mixing conventions does not.

**Decision:** Traverse each graph with visited/active-path sets (or equivalent strongly connected components); report every self-loop and nontrivial cyclic component with an ordered edge witness and source locations. A prerequisite cycle blocks the relevant task order; runtime cycles violate the capsule DAG. Flag E1↔E9-shaped runtime cycles as critical under the seam rule. Expand actual observed dependencies before accepting runtime coverage; incomplete dynamic-use discovery is UNVERIFIED. Do not insert used_by inverses as additional prerequisites, proof/documentary references, identity lineage, tool provision or invoke/gate stanzas into the runtime DAG. These references can be mutual without being runtime cycles. They still need correct resolution and boundary review.

**Output:** graph plane, cycle witness, involved nodes/source edges, affected task/capsule scope; FAIL on cycles, nonpassing gap if edges needed for that graph cannot be established.

| Case | Required decision |
|---|---|
| Tasks A depends_on B and B depends_on A, or A depends_on A | FAIL with exact task witness |
| A depends_on B and B used_by A for that same use | One dependency, no synthetic two-edge cycle |
| E3 gate-references E6 while E6 consumes E3 | Non-runtime gate reference excluded; no fabricated runtime cycle |
| E10 serves E1 tooling needs and E1 references its task pack | Separate tooling/documentary plane, no incoming E10 runtime edge |
| Actual E1/E9 reciprocal runtime consumption is found | Critical FAIL even if prose declarations omit it |

## 4. Forbidden-dependency detector (R-003; ADR-001/ADR-004 propagation)

**Input:** observed cross-boundary uses (imports, calls, data/contract consumption), owning manifests, declared public contracts/interior boundaries, reviewed canonical seams and classification/authority rules. Static source inspection and independent review must identify unresolved dynamic uses explicitly; declarations alone do not prove absence of silent imports.

**Decision:** For each observed use, resolve consumer/provider/plane and referenced surface. Require an explicit allowed edge in the governed source, a declared public surface for cross-capsule consumption, correct toward-stability direction, and compatible classification/authority from ADR-001/ADR-004. An allowed provider name alone cannot authorize its private helpers, storage layout, secrets or a privileged write. Canonical prohibitions prevail over a permissive local statement; conflicting declarations emit CONFLICT and do not authorize use. New seams require the canonical declare-and-independent-review path before use. Invoke/gate/tooling reference declarations do not grant runtime consumption permission. Unresolvable ownership, classification, surface or observed dynamic use emits nonpassing UNVERIFIED/UNOWNED rather than an allowed edge.

**Output:** actual edge/source, provider surface, applicable allowed declaration/prohibition and classification/authority condition; FAIL for silent/forbidden/private/authority-crossing uses, explicit gap for unknown inputs.

| Case | Required decision |
|---|---|
| Consumer uses a declared public contract over an explicit reviewed allowed edge with compatible authority | Allowed for that specific use; no permission to all provider internals |
| Import crosses into another capsule's private helper despite allowed capsule names | FAIL private-boundary violation |
| Local manifest permits an edge forbidden by canonical seam/source | CONFLICT plus nonpassing boundary finding |
| E2 invokes E6 flow through E3 but starts direct E6 consumption | FAIL undeclared runtime use; invocation stanza does not authorize it |
| Dynamic call target or classification is unknown | UNVERIFIED; do not substitute green keyword scan |

## Actual installed-check coverage and unimplemented scope

| Existing check | Actual coverage now | Not demonstrated by its success |
|---|---|---|
| check_orphans.py | Markdown backticked path/basename references and owned-by-directory exemptions | All-source/folder inventory and meaningful semantic anchoring |
| check_links.py | Backticked/wikilink Markdown paths; unique bare names; strict local planning root or CI allowlist; frozen proof exception | All ID/typed/version links, verified canonical pinned sources, all gap semantics/evidence binding |
| check_edges.py | Manifest prose fragments, runtime cycle graph distinct from provision plane, certain forbidden keyword patterns | Actual source imports/calls/private leakage, task DAG cycles, comprehensive classification/authority and dynamic uses |
| check_registration.py / check_conformance.py | Required metadata, identity collision/preservation and evidence shape/primary-subject digest | Semantic closure of all four detector scopes or proof of product correctness |

These are explicit UNVERIFIED implementation/coverage boundaries, not waived violations or a promise of passing the complete specification. No source check, parser, workflow, runtime or schema is added by this task. Existing run_all and its regression suite test artifact admission/preservation only; independent specification review proves this task's bounded acceptance. Any detector implementation must be selected through recorded authorized scope, with genuine adversarial tests and applicable gates; do not invent a follow-up task here.

## Change, registry impact and evidence

Specification v1 adds no identity rename, lifecycle state, new rule/gate ownership, numeric threshold, vendor, simulation or runtime seam. Current records may declare new documentary consumers/maintenance tasks; earlier approved primary subject bytes and verdicts remain preserved. Full-registry impact is limited to these explicit links, new task/pack/evidence/specification and rebuilt views; no semantic corpus rewrite. Empty public_contracts means no new owned runtime contract, and empty lineage means no identity replacement. Later specification/schema changes require version/impact/review; rollback preserves identities and earlier proof/history.

Task: `vault/REGISTRY/T-E10-003a.md`; pack: `vault/PACKS/P-E10-003a.md`; actual validation and independent exact-head review: `vault/EVIDENCE/E-DEV-029.md`. Task completion proves only that these four detectors are specified, never product/release completion or automatic task actuation.
