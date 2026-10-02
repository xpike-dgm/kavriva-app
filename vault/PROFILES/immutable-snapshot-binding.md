---
record_id: V-E6-SNAPSHOT-001
version: 1
purpose: Bind review metadata to an exact immutable content snapshot
domain: release-governance
module: e06-release
owner: E6
implements: [ADR-003, ADR-001, C6.2, F6.2.1, R-003, R-004, R-007, R-009, R-011, R-013, R-014]
public_contracts: []
internal_scope: immutable-snapshot-binding
tasks: [T-E6-003]
tests: [modules/e06-release/tests/test_snapshot_binding.py, modules/e06-release/tests/test_release_authority_registry.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E6-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E6-003, T-E6-003, E-DEV-056]
evidence: [E-DEV-056]
supersedes: []
status: REVIEW
---

# Immutable snapshot binding v1

T-E6-003 acceptance is **Exact immutable snapshot bound**, validation review. Dependency T-E6-001 logical authority registry DONE at accepted PR56 merge a9cb2060f57ab3456c0ce6f226c163380025154e. Plan main fa914f013fdcd032faed876689092da245989459. Independent incomplete role task PR57 is not a hard dependency or accepted source. The shared ADR001R3 fenced publishing-control acceptance remains MISSING: T-E6-004 guarded transition and actual E3 floors/current E5 authorization/audit are still required.

ADR003R1 binds immutable snapshot identity/integrity, exact claims/content/media/dependencies/applicability, considered evidence/provenance, validation findings/open uncertainty, review identity/role/scope/time/rationale, conditions/expiry/consequence and all rendered/derived/transformation context. This internal policy represents those supplied fields explicitly and preserves exact bytes; it does not fetch canonical product data or authenticate a human review.

## Exact supplied packet

Frozen Snapshot contains ID/revision, six mandatory ordered byte sections (claims, content, applicability, findings, uncertainty, conditions), explicit source/dependency/evidence references, media and derived artifact bytes, transformation-input references, policy identity/revision/digest, expiry and consequence class. Sections and artifact payloads must be nonempty immutable bytes, not bytearray/list or omitted fields. An empty collection is explicit metadata claiming no members; the factory cannot prove that claim against real data. Source context is required. Derived artifacts require transformation-input references.

Reference and artifact identities bind exact revision; duplicate identity/revision within a collection is rejected. Multiple explicitly declared revisions of one reference remain distinguishable, with no implicit latest-version selection. Unknown or malformed context/types/order/digest/revision/time are rejected before comparison; exact plain types prevent equality/timezone callbacks. This chooses no content format, classification ranking, provider, production schema or generation pipeline.

snapshot_fingerprint hashes a deterministic internal envelope of every supplied field, preserving section/artifact bytes through Base64, UTC instants and reference/version/digest context. Bytes are not parsed or normalized: whitespace or rendering/media changes alter the fingerprint. This internal JSON envelope is not a product export/publication format. A digest binds supplied bytes, not their truth, actual classification, completeness, canonical origin or transform correctness.

## Review linkage

Review carries exact snapshot ID/revision/fingerprint, reviewer identity, domain_reviewer or safety_approver role, immutable scope and rationale identity/revision/digest references, review/expiry instants and policy context. bind_review validates both structures before comparison, requires exact policy/snapshot linkage and rejects future review, expired review or expired snapshot at supplied server time. No duration policy is invented. Binding fingerprint covers exact snapshot and every review field, and the returned frozen record has intrinsic authority NONE.

require_exact_binding revalidates the original bound snapshot/review and fingerprint, then compares the candidate's complete fingerprint. Changing any packet section, source/dependency/evidence, media/derived bytes/transformation input, scope/condition/expiry/consequence, ID/revision/policy or bound review metadata invalidates the old binding. Editing creates a new candidate; the original immutable object and review remain unchanged. A new attributed fixture review can bind the new candidate, but the old review cannot be reused. There is no method to mutate or erase past review history.

Every source/reference/reviewer/role/scope/rationale/condition/policy and completeness claim is fixture metadata. Coherent forged metadata can form a matching binding without proving human approval, competence, independence, current permission or real canonical content. Fingerprints are unsigned; no authenticated review producer, canonical writer, durable snapshot/history store, transaction/concurrency/currentness/idempotency/security floor or protected audit is implemented. Successful require_exact_binding returns no permission or publication result.

## Performed checks and integration limits

Original source: fifteen new snapshot tests plus fourteen registry tests, 29 PASS0.034s. Corrected source adds same-ID scope/rationale revision/digest changes and malformed reference negatives; full corrected E6 30 PASS0.036s/compile PASS. Tests cover all six section mutations, exact whitespace bytes, source/dependency/evidence/transformation changes, media/rendered input changes, ID/revision/policy/expiry/consequence, immutability and preserving old/new candidates, every reviewer context field, expiry/future review, missing/duplicate/unknown sections/sources, duplicate reference/artifact revisions, explicit multiple evidence revisions, omitted derivation inputs, mutable/boolean/type/timezone inputs, bare ALLOW and malicious comparison callbacks. No actual product content/human/credential/provider/release operation.

The E6 test workflow is installed independently in this task from accepted main, using existing reviewed immutable checkout pin, read-only content and no persisted checkout credential/dependency installation. It runs the actual accepted registry and new snapshot suites. Unmerged PR57 publication checker is absent and is not claimed as tested or merged. This generic E6 family will need normal reconciliation with that draft's pending workflow/CI-plan/inventory changes when the role task is actually ready. Current-head CI and independent source review remain separate gates.

E3 canonical source completeness, authenticated E5 reviewer competence/independence/current policy/session/permission, protected audit and E6 actual guarded publication/suspension/floors/E7 byte-identical artifacts remain MISSING/HELD. UI must never present structural linkage as live eligibility. Task-level review may assess internal byte-binding rules; it cannot close actual fenced publishing control, consumer delivery, privileged staffing or production activation. PR57 remains incomplete, no hidden prerequisite promoted to DONE.

## Ten-layer trace

ADR003R1 / ADR001 canonical authority Ã¢â€ â€™ C6.2 Ã¢â€ â€™ F6.2.1 Ã¢â€ â€™ FL6.2.1 Ã¢â€ â€™ T-E6-003 Ã¢â€ â€™ M-E6-001 internal snapshot binding Ã¢â€ â€™ E-DEV-056.

| Layer | Actual boundary |
|---|---|
| task | Internal exact-byte linkage, independent review/current CI required |
| feature | No authenticated approval or publication eligibility |
| flow | No E2 review UI/E3 canonical write/E5 actual reviewer resolution |
| requirement | All declared meaning/review fields and changed-candidate semantics bound |
| design | No product screen/device/accessibility evidence |
| architecture | E6 internal policy, existing E3/E5/E7 split, no new seam |
| data/migration | Immutable fixtures and deterministic fingerprints, no durable canonical history or migration |
| release | Shared publishing-control gate and actual release execution/floors missing |
| product-scenario | Structural fixture tests, no physical publication/consumer experiment |
| gap-audit | Canonical completeness/authenticated review/current authority/audit/transaction/floors attributed E3/E5/E6/E7, no owner debugging |

Code `modules/e06-release/internal/snapshot_binding.py`; tests `modules/e06-release/tests/test_snapshot_binding.py`; pack `vault/PACKS/P-E6-003.md`; task `vault/REGISTRY/T-E6-003.md`; proof `vault/EVIDENCE/E-DEV-056.md`; capsule `modules/e06-release/MANIFEST.md`; address inventory `vault/INVENTORIES/E10-GOVERNED-PATHS.md`. Sources: [ADR003](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-003__APPROVAL_PUBLICATION_EMERGENCY_SUSPENSION.md), [canonical task](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/TASK_INDEX.md), [acceptance matrix](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/ACCEPTANCE_MATRIX.md).
