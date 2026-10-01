---
record_id: V-E10-GOV-001
version: 1
purpose: Specify ownerless-public-contract, untested-critical-behavior and stale-pack detection
domain: project-execution
module: e10-graph
owner: E10
depends_on: [V-E10-STRUCT-001, V-E10-REL-001, V-TST-001, V-CMD-001, M-E10-001]
used_by: [P-E10-003b, T-E10-003b, E-DEV-030]
implements: [ADR-015, C10.1, F10.1.1, R-005, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: governance-detector-specification
tasks: [T-E10-003b]
tests: [modules/e10-graph/checks/check_contracts.py, modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_packs.py, modules/e10-graph/checks/check_conformance.py, modules/e10-graph/checks/check_registration.py]
evidence: [E-DEV-030]
supersedes: []
superseded_by: []
status: REVIEW
last_verified: 2026-10-02
---

# Three governance detectors — specification v1

Record: `V-E10-GOV-001`

## Authority and completion boundary

Frozen T-E10-003b acceptance: **Ownerless/untested/stale specified**. Prerequisite T-E10-003a accepted and merged PR31 as92c6a28e8a1e68861019561a7fd30b2637f6f260. Task selection follows the owner's requested TASK_INDEX sequence among eligible dependencies. This specification adds the three governance families to the four structural specifications; it does not implement complete semantic detectors or certify the current corpus/product. The installed suite's T3-task inventory is a critical-behavior minimum, not permission to omit an untested critical contract outside that lane.

Source comparison pin: canonical planning fa914f013fdcd032faed876689092da245989459 and application base92c6a28e8a1e68861019561a7fd30b2637f6f260. Navigation links are not immutable proof. Sources: [ADR-015 Decision3](https://github.com/xpike-dgm/motobakim-plan/blob/main/05_ADR/RECORDS/ADR-015__AI_SAFE_MODULE_CONTRACT_TOPOLOGY_AND_GRAPH.md), `planning 07_AI_ARCHITECTURE/ARCHITECTURE_TESTS.md`, `planning 07_AI_ARCHITECTURE/CONTRACTS/CONTRACT_TEMPLATE.md`, `planning 07_AI_ARCHITECTURE/CONTEXT_PACKS/PACK_STANDARD.md`, `planning 07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md`, `planning 07_AI_ARCHITECTURE/VALIDATION_STRATEGY.md`, `planning 07_AI_ARCHITECTURE/RULES/README.md`. Installed source rules: `modules/e10-graph/STRUCTURAL_DETECTOR_SPEC.md`, `modules/e10-graph/GRAPH_RELATION_CONVENTION.md`, `modules/e10-graph/checks/ARCHITECTURE_TEST_SUITE.md`, `modules/e10-graph/checks/VALIDATION_COMMANDS.md`, `modules/e10-graph/MANIFEST.md`.

## Common inventory, evidence and gate treatment

Freeze repository/planning revisions and enumerate actual public functions/data/events plus declared surfaces/contracts, critical requirements/behaviors/tasks/tests/evidence, and packs with their own task_ref and declared source versions. Generated indexes are reproducible views; the authoritative record/contract/manifest/source declarations govern. Reuse structural typed-ID/link resolution, without importing documentary/invoke/tooling references as runtime edges. Record exclusions and unresolved inventory explicitly; none of the three detectors may pass from an incomplete universe.

Each finding carries detector/version, subject revision/digest, affected record/surface/behavior/pack and source location, applicable rule, expected/observed condition, proof or missing prerequisite, and corrective boundary. Publish the existing conformance eight-field shape by reference: test ID, contract ID+version, subject digest, result, evidence links, gate verdict, reviewer, timestamp. No replacement schema or new task lifecycle state. Retain MISSING/UNOWNED/BLOCKED/CONFLICT/UNVERIFIED; a format PASS cannot erase a nonpassing semantic finding. PASS is scoped to complete verified inputs and zero unresolved violations/gaps at the specific revision. Existing rule-to-gate ownership remains with RULES/README; implementer runs, independent reviewer verifies, applicable gate enforces.

## 1. Ownerless public-contract detector (R-011/R-012)

**Input:** actual externally consumed/declared public functions, data and events (not just a public directory), capsule manifests with public/internal boundaries, stable contract/version records, provider owner/module, governed surface/party/source links and classification/authority propagation.

**Decision:** Reconcile both directions: every actual public surface must resolve to its contract and accountable provider capsule; every contract's declared provider/surface must resolve to that capsule's actual declaration. A directory existing, an owner word being nonempty or generic E10 documentary custody is insufficient for product ownership. Compare exact surface/scope and provider identity; missing owner/provider/contract is UNOWNED/MISSING, competing owners or mismatched provider declarations is CONFLICT. Missing inventory or unresolved source linkage is UNVERIFIED. A consumed contract does not transfer provider ownership to its consumer; an internal helper does not become public because imported. Genuine private-only interior is not an ownerless public contract, but cross-boundary exposure remains a structural forbidden-dependency failure. Contract lifecycle/version and its required fields must be valid, without promoting PROPOSED to an approved callable capability.

**Signal:** FAIL for ownerless or contractless public surfaces/contracts, conflict/missing linkage; nonpassing explicit gap for unverifiable inventory/provider authority. A real ownerless public contract fails even when it has purpose/task anchors and therefore is not a structural orphan.

| Case | Required decision |
|---|---|
| Actual public function/data/event maps to its declared contract and accountable provider capsule | Ownership resolved for that scope; does not prove implementation/test/readiness |
| public directory exists, but an exported function has no contract/provider mapping | FAIL with actual surface and missing mapping |
| Record has E10 custody metadata, while original product source lacks an accountable provider | UNOWNED/UNVERIFIED, no invented product owner |
| Consumer lists a contract as used but declares itself the owner without governed transfer | CONFLICT; preserve actual provider ownership |
| Truly private helper has no public contract | No ownerless-public finding solely for that absence; actual cross-boundary use is checked structurally |

## 2. Untested critical-behavior detector (R-013; contract gate R-011/R-012)

**Input:** authoritative critical requirements/contracts/negative cases and their actual implementations/consumers; task classification from validation sources (including all T3 privileged/release/data-migration tasks); applicable named tests/conformance IDs, executions and immutable subject/contract/version/environment evidence; independent review where required. Never infer criticality from filename alone or omit unresolved critical classification.

**Decision:** Enumerate each critical behavior and its governed acceptance/negative cases, not merely task/evidence counts. Resolve its actual test and execution evidence. Require all eight conformance fields with real nonempty values, matching contract/version and relevant subject digest; inspect linked execution/results and their coverage of that behavior at the claimed environment/head. A tests pointer, existing test file, unrelated green CI, reviewer:none, old contract/version, fixture-only result claimed as production, or evidence whose subject changed does not establish successful current critical-behavior testing. Preserve exact older subjects and older verdicts; they only prove their original scope. Each required independent second eye must be real, separate from author, scoped to the reviewed head and owner-accepted where delegated (DEC0069/direct mandate), never merely an automated T3 check. Review cannot substitute for an unexecuted behavior test.

Absent tests/execution/negative-case coverage or failing required test is FAIL for the affected critical behavior/gate. Unverifiable head/environment, criticality, evidence provenance or incomplete input is explicit UNVERIFIED/BLOCKED and nonpassing. Before work is complete these are honest open findings, not proof that implementation is authorized or DONE. Documentary specification tasks may prove their own specified-rule acceptance through source/countercase review; that documentary evidence cannot be reused as test proof for a product critical behavior.

**Signal:** FAIL/nonpassing gap by behavior, contract/version, uncovered case and evidence reason. The detector requires meaningful proof, not arbitrary new coverage percentages/test counts/timeouts or a new runner. Successful scoped tests do not imply the ten closure layers/product activation; those gates remain separate.

| Case | Required decision |
|---|---|
| Applicable test execution proves required behavior/negative cases at the claimed subject, contract version and environment, with required independent review | Tested in that bounded scope; no broader production/release promotion |
| All eight evidence fields exist but reviewer is none/result is BLOCKED or the test never ran | Nonpassing, not evidence-shape success as behavior PASS |
| Test uses temporary fixtures but claim is real production identity/authority | UNVERIFIED claimed production scope; retain actual fixture success separately |
| Old reviewed payload is archived exactly but current implementation changed | Old proof remains valid historically; current changed behavior requires relevant new proof |
| A critical public contract is not attached to a T3 row | Still included from authoritative critical contract/requirement scope; no T3-only exemption |

## 3. Stale-context-pack detector (R-005)

**Input:** each pack's own task_ref, actual last_verified and task last_verified, the pack's mandatory source IDs/versions/sections, governed source changes, and evidence of which task actually consumes the pack. Lifecycle/consumption stays explicit; documentary custody dates do not refresh product/source verification.

**Decision:** Resolve the pack to its own task, never the newest unrelated task. Validate both dates before comparison; missing/unparseable dates or task_ref are unresolved freshness, not a guessed comparison. A pack last_verified earlier than its task last_verified is stale. Inspect declared source-version pins and scoped source changes as well: equal dates alone do not prove fresh context if its required contract/rule/version changed or cannot be verified. Unknown versions/changes are UNVERIFIED, never assumed current. Reverification requires actual bounded source comparison/evidence, not editing a date to silence the finding.

Emit WARN for a verified stale historical/inactive pack, preserving its history. If an active task consumes that stale pack, FAIL and prevent that stale context from authorizing continued execution/review/acceptance. Identify the actual consuming task/pack/relation, including a pack reused by another active task, without comparing freshness to arbitrary unrelated task dates. CLAIMED, IN_PROGRESS, REVIEW and CHANGES_REQUESTED are not historical terminal states: consumption while work proceeds/reviews/retries needs current context. READY alone is not evidence of execution, but must pass freshness before claim/use. DONE/CANCELLED archived context is historical unless an active consumer actually reuses it. BLOCKED cannot execute; resumption requires resolving applicable context gaps. Missing/unverified context is a nonpassing gap at use, never a WARN treated as accepted freshness.

**Signal:** WARN-then-FAIL-on-active-use per suite; source/date/task gaps remain visible. Output own task/pack, actual consumer state/use, both dates, source mismatch/gap and revalidation boundary. No elapsed-age threshold, auto timestamp rewrite, lifecycle skip or task actuation.

| Case | Required decision |
|---|---|
| Pack verified against its own task and declared current sources, with resolvable valid dates/pins | Fresh for that scoped use |
| An unrelated newer task exists | No stale finding from that unrelated date |
| Pack older than own task, task IN_PROGRESS or actually used in REVIEW | FAIL active stale context |
| Archived pack is old and unconsumed | WARN historical staleness, no history rewrite |
| Historical pack reused by a different active task | FAIL actual stale use, without replacing the pack's own task comparison |
| Same-day verification, but a required contract/version changed afterward | Revalidation gap/stale source; date equality cannot waive it |
| Missing dates/task_ref or empty/guessed source pins | UNVERIFIED/MISSING; do not invent freshness or a valid date |

## Existing executable checks and explicit limits

| Existing check | What its success actually establishes | Semantic coverage not established |
|---|---|---|
| check_contracts.py | Nine catalog filenames/required fields/status and module public-directory existence | Every exported function/data/event mapped to an actual contract/provider/authority |
| check_trace.py | Task evidence IDs resolve and owner module exists; contract owner maps to module directory | Full semantic ownership, bidirectional critical-behavior/test/closure coverage |
| check_conformance.py | Nonempty eight-field shape, primary subject digest, evidence links/date format, preserved proof binding | Real independent reviewer, successful applicable executions/negative cases, contract version/environment or all critical behavior coverage |
| check_packs.py | Fourteen numbered fields, comparison to pack's own task; older own IN_PROGRESS task fails, otherwise warns | Every active consumer/review/retry state, source-version freshness or valid semantic date/provenance; unresolved task/dates currently WARN |
| check_registration.py | Required metadata/identity/origin serialization/preservation | Product ownership, successful critical tests or verified current context |

These missing semantic coverage areas stay UNVERIFIED. T003b specifies stronger truthful oracles; it does not modify the existing heuristic implementations or claim they satisfy the full specification. Any future implementation needs recorded authorized scope and meaningful adversarial tests. No harness/workflow/code/account/vendor/threshold/simulation is selected here. Source/countercase comparison and independent review prove only this task's three specifications; existing run_all regressions verify artifact admission/preservation.

## Change, registry impact and evidence

Specification v1 introduces no renamed ID, new gate owner, runtime seam, privilege or task status. Explicit current consumer/maintenance links and a task/pack/evidence/specification are added, with rebuilt generated views. Prior accepted source payloads and verdicts/digests are preserved before consumer maintenance; no historical corpus ownership/test/freshness rewrite. Empty public_contracts means no newly owned runtime surface; empty supersede lineage means no identity replacement. Later rule/schema changes require a version, scoped registry impact, independent review and applicable exact-head CI; rollback preserves identity/proof history.

Task: `vault/REGISTRY/T-E10-003b.md`; pack: `vault/PACKS/P-E10-003b.md`; proof: `vault/EVIDENCE/E-DEV-030.md`. Production E3/E5 authority and release/activation completion remain unproved. No all-tasks-DONE inference of product completion.
