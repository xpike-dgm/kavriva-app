---
record_id: V-E5-INGEST-001
version: 1
purpose: Enforce the quarantine processing state chain and explicit failure branches
domain: untrusted-ingestion
module: e05-identity
owner: E5
implements: [ADR-004, ADR-001, C5.6, F5.6.1, R-003, R-004, R-007, R-009, R-012, R-013, R-014]
public_contracts: []
internal_scope: quarantine-processing-state-policy
tasks: [T-E5-017]
tests: [modules/e05-identity/tests/test_quarantine_pipeline.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E5-001, I-E10-PATHS-001]
used_by: [P-E5-017, T-E5-017, E-DEV-050]
evidence: [E-DEV-050]
supersedes: []
status: REVIEW
---

# Quarantine processing policy v1

Canonical T-E5-017: full state chain with branches, no hard task prerequisite. This internal E5 pure policy implements ordered processing transitions, not ingestion services or authorization. Planmainfa914f013fdcd032faed876689092da245989459; accepted appbase671e7de484ec5c190458d98ed9cba0d805c84ec3. E5 owns policy, E3 enforcement/object stores, E2 renders through serving; no new cross-epic seam or exported runtime API. `modules/e05-identity/internal/quarantine_pipeline.py` is internal and currently has no product caller.

## Ordered processing states

RECEIVED_UNTRUSTED → QUARANTINED → IDENTIFIED → VALIDATED → SCANNED → RENDERED_UNTRUSTED_PREVIEW → HUMAN_CLASSIFIED → SAFE_FOR_HUMAN_REVIEW.

`receive` starts only RECEIVED_UNTRUSTED. `advance` accepts only the next stage's distinct observation kind: quarantine, identify, validate, scan, isolated_preview, human_classification, review_readiness. Each must carry the exact subject, unique nonempty receipt, attributable producer and reason. Missing/wrong-stage/replayed/context-mismatched observations fail with stable PipelineError reason. No challenge/parser/document string is executed; kind markers are supplied by the trusted caller, never inferred from untrusted content.

The immutable subject binds object identity, generation, byte digest, full manifest fingerprint, exact classification and processing-policy version. The full fingerprint must bind owner/retention/parents/lineage/derivative meaning through the future verified E3 public object contract; this module does not compute or verify a canonical manifest or its source. Same bytes with different metadata/policy/object cannot borrow a prior receipt. Original and sanitized derived objects are distinct subjects, never silently replaced.

## Explicit branches and re-evaluation

| Branch | Policy meaning |
|---|---|
| REJECTED | Invalid/forbidden intake or later policy failure; no forward processing |
| SCAN_FAILED | Scan failure from VALIDATED; never equivalent to clean |
| SCAN_UNKNOWN | Unavailable/inconclusive scan from VALIDATED; blocked |
| PARSING_FAILED | Failure during quarantined identification/validation or preview parsing; no fabricated extracted value |
| MALICIOUS / SUSPICIOUS | Detected quarantined/processed threat; blocked, never automatically cleared; actual restricted access/incident system unimplemented |
| EXPIRED | Lifecycle closed; retain permitted provenance/audit meaning, may later record governed deletion |
| DELETED_BY_POLICY | Closed, no further transition/re-evaluation; actual data deletion/retention enforcement absent |

`fail` requires the matching branch observation on the exact current subject; arbitrary stages cannot become failure-as-clean. Expiry/deletion preserve prior transition meaning. These state labels do not erase any bytes or issue incident/retention/access authority.

`reevaluate` accepts only the same immutable source with a changed policy version and an attributed policy_reevaluation observation, restarting QUARANTINED and retaining all prior failures/history. It cannot restart RECEIVED/EXPIRED/DELETED, reclassify or replace bytes/lineage/retention/generation, or borrow prior stage receipts. Rescanning after source/tool risk changes requires the future governed producer to advance a processing policy revision. A false-positive dispute is an attributable correction, not a bypass; actual permission/authentication/correction review remains separate.

Records and transitions are frozen dataclasses. History must be contiguous from received, bind each transition's old/new subject and proper observation kind, reject duplicate receipts and match the final state. Structural history validation is not cryptographic custody, current database truth, authentication or tamper-proof persistence; a caller able to forge a coherent in-memory fixture has not proved any real observation.

## Authority and integration limits

Every receipt/producer/human-classification marker in tests is an explicit fixture. This policy does **not** authenticate a scanner, human decision, isolation renderer or canonical receipt. A caller-selected marker alone cannot be used by a future runtime as proof. Trusted producers must independently resolve issuer, permission, exact artifact, tool/policy validity, current version and protected audit before writing canonical state. Product serving/enforcement must use E3 current transactional authorization/audit/floor and concurrency fences; no client may call this internal module to mint authority.

SCANNED, RENDERED_UNTRUSTED_PREVIEW and SAFE_FOR_HUMAN_REVIEW are processing/readiness states only. They never establish technical correctness, applicability, sufficiency, independent safety review, approval, publication, object activation or original/preview access. Existing E3 object activation's distinct full validation/correctness policy is unchanged. This module contains no original bytes, file opening, network, URL fetch, scanner, parser, sandbox, credential or storage mutation. T-E5-018 owns actual isolated-preview rules; its missing isolation/enforcement proof keeps physical preview HELD. Original objects never become operations-origin/public content from these states.

## Actual checks and still-missing product proof

Eleven meaningful unit tests exercise the full chain, all eight named failure/lifecycle branches, illegal jumps, failure-as-clean, stale subject/policy/metadata/receipt, immutable history, changed-policy reset, terminal non-resurrection and malformed/forged history. Fixtures test deterministic policy only. Existing E5 native PostgreSQL and Auth regressions use isolated local infrastructure and fake provider responses; they are not hosted provider or file-processing acceptance. Exact code/test/subject hashes, root results and independent review are recorded in EDEV050.

Composite F5.6.1/FL5.6.1 acceptance remains physical **test** across E3 object boundary/enforcement and E5 policy/preview. Real upload/URL retrieval, canonical authenticated producers, malware/tool execution, isolated preview, human UI, durable concurrent states, custody/incident/retention/deletion and end-to-end product tests are MISSING. No provider/product/limits/activation selected or deployed. E3R1 REVIEW/E5-003 IN_PROGRESS/live provisioning/privileged production HELD unchanged.

## Ten-layer trace

ADR004 R7 and ADR001 R4 → C5.6 → F5.6.1 → FL5.6.1 → T-E5-017 → M-E5-001/internal policy → unit evidence E-DEV-050; every guarded state/branch returns to those source rules and future E3/E5 implementing owners.

| Layer | Bounded result / unresolved proof |
|---|---|
| task | Full processing state policy and branches; review/currentCI required for bounded acceptance |
| feature | E5 processing policy only; actual pipeline/preview integration MISSING |
| flow | Submission/processing states defined; actual upload/URL/operator flow unperformed |
| requirement | ADR004 R7 processing-never-authority and ADR001 R4 exact object quarantine preserved |
| design | No UI; E2 quarantine view/accessibility UNVERIFIED, hostile content remains inert |
| architecture | Internal E5 policy, no public export/new seam; E3 enforcement still distinct |
| data/migration | Immutable subject/history in memory; no actual durable store/schema/migration or deletion |
| release | No deployment/provider/custody/production activation; HELD |
| product-scenario | Unit fixtures only; actual files/scanner/renderer/human/DB concurrent scenario MISSING |
| gap-audit | Trusted producer/current authority/audit/isolation/persistence gaps attributed to E3/E5/E2, never owner debugging |

Context `vault/PACKS/P-E5-017.md`; task `vault/REGISTRY/T-E5-017.md`; proof `vault/EVIDENCE/E-DEV-050.md`; tests `modules/e05-identity/tests/test_quarantine_pipeline.py`; capsule `modules/e05-identity/MANIFEST.md`; addresses `vault/INVENTORIES/E10-GOVERNED-PATHS.md`.

## Pinned authority

- [ADR004 ingestion and authorization rules](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-004__IDENTITY_AUTHORIZATION_SESSION_RECOVERY_AND_PRIVILEGED_ACTIVATION.md)
- [ADR001 object boundary](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-001__CANONICAL_DATA_AUTHORITY_AND_LOGICAL_BOUNDARIES.md)
- [Historical detailed processing state/branch source, section9](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/04_TECH_STRATEGY/DEBATES/DEBATE-004__IDENTITY_AUTHORIZATION_AUDIT_UNTRUSTED_INGESTION.md)
- [Canonical task](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/TASK_INDEX.md) and [composite tests](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/ACCEPTANCE_MATRIX.md)
