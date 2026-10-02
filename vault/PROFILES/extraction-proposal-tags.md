---
record_id: V-E5-PROPOSAL-001
version: 1
purpose: Tag AI and OCR extraction results as provenance-linked proposals only
domain: untrusted-extraction
module: e05-identity
owner: E5
implements: [ADR-004, ADR-014, C5.6, F5.6.3, R-003, R-004, R-007, R-009, R-012, R-013, R-014]
public_contracts: []
internal_scope: untrusted-extraction-proposal-tags
tasks: [T-E5-020]
tests: [modules/e05-identity/tests/test_proposal_tags.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E5-INGEST-001, M-E5-001, I-E10-PATHS-001]
used_by: [P-E5-020, T-E5-020, E-DEV-051]
evidence: [E-DEV-051]
supersedes: []
status: REVIEW
---

# AI/OCR proposal-only tagging v1

T-E5-020 acceptance is **Provenance-linked; never approval; hostile inert**, canonical validation **review**. Prerequisite T-E5-017 DONE is the accepted internal processing policy through PR52merge50aade7f5c606c30dd56068d93cd9edf49d32706; its full product scanner/preview/enforcement proof remains MISSING. Planmainfa914f013fdcd032faed876689092da245989459. This code tags already-supplied fixture extraction results. It calls no AI/OCR/provider, parses no document, selects no provider/model/configuration and starts no tool/workflow.

## Exact input and transformation linkage

`modules/e05-identity/internal/proposal_tags.py` consumes its own E5 internal processing Record and checks its complete structural history. No cross-capsule private import exists and no E5↔E9 runtime seam is introduced. E9 assistance is a source boundary reference only; E5 tagging remains internal with no product caller.

The transformation binds exact full input Subject (object identity/generation/byte digest/manifest fingerprint/classification/processing policy) and latest processing receipt, attributable run and producer, AI versus OCR kind, provider-or-local-engine reference, model/engine and version, configuration fingerprint, and distinct result reference. A stale or different subject/receipt is rejected. Required references are nonempty and the fingerprint is a SHA256-shaped value; this structural shape is not authenticated actual run/provider/configuration evidence.

For CANDIDATE, exact UTF-8 text is stored unchanged and its digest computed, never borrowed from model output. Invalid UTF-8/surrogate data, blank/nontext candidate, unsupported transformation kind or invalid outcome-matched reason code or missing context fails. No whitespace normalization, JSON parsing, classification inference, confidence score, command decoding, rendering, network or callback occurs. The raw text and full input record are omitted from ordinary dataclass representation; this is not proof of runtime log/export/storage confidentiality. Future writers and renderers must satisfy separate classification/privacy/isolation requirements.

## Tags never gain authority

Every result has intrinsic `content_status=UNTRUSTED_PROPOSAL`, `authority=NONE`, `requires_human_review=True`. Classification is inherited from the exact input Subject, never from model text. No approved/verified/published/accessgrant state exists, and immutable tag properties cannot be supplied through ordinary replacement arguments. A plausible extraction, perfect-confidence claim, passkey/role/provider label or processing SAFE_FOR_HUMAN_REVIEW cannot become correctness, sufficiency or approval.

Human domain/safety review remains distinct, attributable, competent and independent as required by consequence; no human judgment is recorded or auto-approved by this tagging factory. Future technical/canonical validation and effect authorization stay in their existing owners. Tagging does not advance the input processing state, create canonical evidence, mutate classification or grant source/preview/original access.

## Explicit non-success outcomes

| Outcome | Record meaning |
|---|---|
| CANDIDATE | Opaque proposed text only, with derived digest and explicit human-review boundary |
| FAILED | Attributed failed transformation, bounded EXTRACTION_FAILED reason code, no candidate value/digest |
| UNSUPPORTED | Explicit unsupported extraction/source family, bounded SOURCE_UNSUPPORTED reason code, no fabricated candidate value/digest |
| UNKNOWN | Uncertain/outage/inconclusive result, bounded EXTRACTION_UNKNOWN/PROVIDER_UNAVAILABLE/INPUT_PROCESSING_HELD reason code, no candidate value/digest |

No failed/unsupported/unknown result may carry candidate text, even a plausible placeholder. The reason field accepts only a typed finite Reason code matching the outcome; free-form text, raw code strings and candidate/payload-as-reason are rejected. CANDIDATE requires REVIEW_REQUIRED; there is no diagnostic text field in the tag. Reason codes do not indicate actual provider failure proof or permit embedding a value elsewhere. No received/unquarantined, expired or deleted source may create a new tag. CANDIDATE requires structurally SCANNED or a later processing stage; rejected/scanunknown/scanfailed/parsefailed/malicious/suspicious/unscanned sources remain blocked for candidates. FAILED/UNSUPPORTED/UNKNOWN may record a blocked quarantined source without producing a value or starting extraction. These checks do not prove that real scanning or observation occurred; markers remain trusted-input fixtures.

Changes in model/engine/version/configuration or source context create distinct attributable transformation context and must trigger future re-evaluation where meaning changes. This module has no run de-duplication, idempotency store, revocation, retention or current-head lookup; old tags are historical data, never permission to reuse stale private sources or accepted facts.

## Hostile document instructions and missing integration

Text such as JSON requesting `approved`, `official`, `publish`, secret extraction or an external URL remains opaque candidate data. Tests install failing tool/network sentinels around the hostile case; no calls occur. This proves the deterministic factory boundary, not a live model's resistance to prompt injection, a browser sandbox, SQL writer or provider tool safety. Sensitive material is never sent anywhere by this code. Future external extraction requires an approved data boundary/issuer/configuration/privacy/cost/provenance policy and exact canonical verification, not the presence of a producer string.

Records, receipts, source fingerprints and provider/model/version labels in tests are fixtures. A structurally coherent caller-forged record remains unauthenticated; the future guarded E3 writer must resolve actual current source/producer/receipt, allowed action/data scope, audit/floor/concurrency and applicable human review. No client can use this internal factory as authority. Existing E3/E5 consumer runtime and T-E3-001-R1 REVIEW/T-E5-003 IN_PROGRESS are unchanged. Actual extraction/preview/human/current-authority/product proof and privileged production remain MISSING/HELD.

## Ten-layer closure and return trace

ADR004 R9 and ADR014 R4/R6 → C5.6 → F5.6.3 → FL5.6.3 → T-E5-020 (T017 prerequisite) → M-E5-001/internal tags → E-DEV-051 actual unit/source/review evidence. Each proposal/provenance/failure/hostile-data rule returns to those authorities; no candidate source is promoted to truth. Canonical review row covers proposal tagging, never all feature/flow/product implementation.

| Layer | Actual boundary |
|---|---|
| task | Provenance-linked proposal-only tagging; independent review/currentCI required |
| feature | Proposal-tag boundary only, actual AI/OCR integrations MISSING |
| flow | Extraction-produced handoff shape; real provider/serving flow unperformed |
| requirement | ADR004 R9/ADR014 content-never-policy and no AI authority preserved |
| design | API surface/no screen; later E2 labels/accessibility/isolation UNVERIFIED |
| architecture | Same E5 internal capsule reuse; E9 proposes/E3 verifies unchanged, no new seam |
| data/migration | Immutable fixture tag and exact outputdigest; no canonical persistence or schema/migration |
| release | No provider/key/account/cost/deployment/activation selected; HELD |
| product-scenario | Thirteen deterministic tests; no actual model/OCR/file/device/human/sandbox experiment |
| gap-audit | Authenticated source/producer/persistence/privacy/isolation/humanreview gaps attributed E3/E5/E2, never owner debugging |

Context `vault/PACKS/P-E5-020.md`; task `vault/REGISTRY/T-E5-020.md`; proof `vault/EVIDENCE/E-DEV-051.md`; tests `modules/e05-identity/tests/test_proposal_tags.py`; prior policy `vault/PROFILES/quarantine-processing-policy.md`; capsule `modules/e05-identity/MANIFEST.md`; addresses `vault/INVENTORIES/E10-GOVERNED-PATHS.md`.

## Pinned source authority

- [ADR004 R9](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-004__IDENTITY_AUTHORIZATION_SESSION_RECOVERY_AND_PRIVILEGED_ACTIVATION.md)
- [ADR014 assistance and tool authority](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-014__AI_LLM_ASSISTANCE_AND_DECISION_LAYER.md)
- [Historical section12 provenance detail](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/04_TECH_STRATEGY/DEBATES/DEBATE-004__IDENTITY_AUTHORIZATION_AUDIT_UNTRUSTED_INGESTION.md)
- [Task acceptance](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/TASK_INDEX.md) and [review validation](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/ACCEPTANCE_MATRIX.md)
