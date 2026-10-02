---
record_id: V-E6-AUTHORITY-001
version: 1
purpose: Register eight distinct logical release authorities without activation
domain: release-governance
module: e06-release
owner: E6
implements: [ADR-007, ADR-003, C6.1, F6.1.1, R-003, R-004, R-007, R-009, R-011, R-013, R-014]
public_contracts: []
internal_scope: release-authority-registry
tasks: [T-E6-001]
tests: [modules/e06-release/tests/test_release_authority_registry.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E6-001, I-E10-PATHS-001]
used_by: [P-E6-001, T-E6-001, E-DEV-054]
evidence: [E-DEV-054]
supersedes: []
status: REVIEW
---

# Release authority registry v1

Canonical T-E6-001 acceptance is **Distinct registered authorities**, validation **review**, no hard task dependency. Approved ADR007R1 locks eight distinct release domains. Accepted appbasee7c8af8997debb493c55061fcfacec9deb5b7f5c/planmainfa914f013fdcd032faed876689092da245989459. This internal E6 registry registers logical identities, never current permission or physical custody. E6 decides policy, E7 executes lanes, E3 serves, E5 authorizes/audits; no new public seam/private cross-capsule import.

| Domain | Separate consequence boundary |
|---|---|
| consumer_binary | Consumer application binary distribution |
| internal_web | Internal operations web deployment |
| backend_service | Backend/API/service release |
| database_migration | Schema/data migration release |
| technical_content | Technical content release |
| configuration_policy | Configuration/feature policy release |
| emergency_suspension | Restriction-only emergency suspension, no positive replacement |
| future_ota | Explicitly NOT_APPROVED future runtime code update |

Each domain has a different stable `kavriva.release.<domain>` identity and separate declared action, credential-domain, audit-event and consequence-check taxonomy. These names are **categories**, not actual issued credentials, accepted audit events or performed consequence checks. Seven logical policy entries REGISTERED, OTA NOT_APPROVED; every physical_activation HELD, actual custodian/credential/audit custody references null. No release-admin fallback or ordinary positive permission API. Unavailable staff remains unavailable; owner accepted AI development review is not a physical independent signer/recovery custodian.

`load_registry` checks exact byte SHA256 against an externally pinned expected digest and exact version/schema, rejects duplicate JSON keys/extra or missing fields/non-JSON constants/malformed payloads/types, requires the eight reviewed domains in reviewed order and exact distinct identity/action/audit/credential/consequence labels, refuses physical activation or invented custodian/key/audit binding and OTA approval. Bytes are UTF8; digest covers actual bytes, including line endings. A caller computing expected digest over its own bytes does not authenticate those bytes. The registry version is a schema counter, not a policy threshold. This revision1 supports no live policy update, physical credential configuration or release activation.

`resolve_metadata` revalidates the full immutable tuple/types/exact bindings/holds before returning an exact domain's metadata, including denied OTA. Direct dataclass construction/replacement does not bypass structural revalidation. Unknown domains fail with bounded reason codes. Registry and entries have intrinsic authority NONE; no candidate ALLOW, commit, signer, promoter, deployment or OTA executor. Physical holder/credential/audit references cannot be supplied through the v1 schema. Logical uniqueness cannot prove that eventual credentials actually differ or that aliases belong to different humans.

Changing this reviewed taxonomy or introducing successor snapshots needs a separately reviewed controlled revision; caller digest/version expectation is not runtime freshness or non-restorable floor. Existing snapshot remains in Git history. Restoring/reloading metadata never reconciles current suspension, audit or runtime release state. No actual provider/credential/account/key/release/build/signing/promotion/migration/config/content/brake/OTA operation. Named consequence checks are requirements, not evidence of execution.

## Performed checks and actual gaps

Twelve meaningful local testsPASS0.014s/compilePASS: eight distinct categories/noauthority, everyactivationHELD/OTAdenied, byte substitution, stale/wrong/bool versions, missing/additional/duplicated/unknown domains, sharedidentity/action/audit/credential/consequence, invented actualholder/key/auditproof, duplicatekeys/invalidJSON/types, nofallback, immutability/constructedtampering, equalitycallbacks and reorderedentries. There is currently no E6-specific CI job; these are performed **local E6** tests, not green E3/E5 jobs re-labelled as E6 tests. Applicable current-head CI checks remain separate.

T-E6-002 per-change author/reviewer/verifier/signer/promoter alias/service collapse rules remain unimplemented; T-E6-003 exact sealed snapshot binding and later lane/trustroot/credential/audit/artifact/provenance/suspension/floor/rollback/incident controls remain MISSING/HELD. Existing logical publishing_control E3 domain metadata is not this release registry's physical backing. No source/fact/content or permission truth is inferred from this file. Registry review cannot substitute activation evidence or enable any of the eight real release actions.

## Ten-layer trace

ADR007R1/R10 and ADR003 separation → C6.1 → F6.1.1 → FL6.1.1 → T-E6-001 → M-E6-001 internal authority roster → E-DEV-054. Categories preserve source semantics; no current physical authority claim.

| Layer | Actual boundary |
|---|---|
| task | Register exact eight logical authorities, independent review/currentCI required |
| feature | Taxonomy only, real release authority MISSING |
| flow | No E2 invoke/E3 serving/E5 authorize/audit/E7 lane execution |
| requirement | Distinct domains and unapproved OTA preserved |
| design | No UI; visible unstaffed HELD surfacing still missing |
| architecture | E6 policy/E7 execution split, no new seam |
| data/migration | Immutable metadata snapshot; no credentials/audit/runtime store/current floor |
| release | Actual verification/signing/promotion/deploy/migration/content/config/suspension/OTA unopened |
| product-scenario | Twelve local structural negatives; physical custody/lane proof MISSING |
| gap-audit | Staffing/identity/alias independence/auth/audit/provenance/generations attributed E6/E5/E3/E7; no owner debugging |

Data `vault/REGISTRY/release-authorities.json`; code `modules/e06-release/internal/release_authority_registry.py`; tests `modules/e06-release/tests/test_release_authority_registry.py`; pack `vault/PACKS/P-E6-001.md`; task `vault/REGISTRY/T-E6-001.md`; proof `vault/EVIDENCE/E-DEV-054.md`; manifest `modules/e06-release/MANIFEST.md`; addresses `vault/INVENTORIES/E10-GOVERNED-PATHS.md`.

Sources: [Pinned approved ADR007](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-007__SUPPLY_CHAIN_AND_RELEASE_GOVERNANCE.md), [canonical task](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/TASK_INDEX.md), [review acceptance](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/ACCEPTANCE_MATRIX.md).
