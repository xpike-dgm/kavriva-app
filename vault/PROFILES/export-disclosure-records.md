---
record_id: V-E5-EXPORT-001
version: 1
purpose: Model minimized export manifests and non-retractable disclosure records
domain: export-disclosure
module: e05-identity
owner: E5
implements: [ADR-004, ADR-001, C5.6, F5.6.2, R-003, R-004, R-007, R-009, R-012, R-013, R-014]
public_contracts: []
internal_scope: export-disclosure-policy
tasks: [T-E5-019]
tests: [modules/e05-identity/tests/test_export_disclosure.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E5-001, I-E10-PATHS-001]
used_by: [P-E5-019, T-E5-019, E-DEV-053]
evidence: [E-DEV-053]
supersedes: []
status: REVIEW
---

# Export disclosure records v1

Canonical T-E5-019 acceptance: **Minimization + non-retractable record + warnings**, validation **review**, no hard task dependency. Approved ADR004R8 treats export as a separately authorized disclosure. Accepted appbase893e3eb63c12c888cd9be014c3a67e2f6bd14f68; planmainfa914f013fdcd032faed876689092da245989459. Pure E5 internal data/policy only: no product caller, new public seam, E3 private import, export generation, download/link/storage/audit write or access effect.

## Minimized field manifest

`minimize_manifest` takes a full supplied source identity/generation/byte digest/manifest fingerprint/classification/processing policy, typed field universe and explicit field-inclusion decisions. Every field is omitted by default. Selected fields need a distinct explicit inclusion entry with nonempty attributed decision reference; undeclared/duplicate/blank selection and malformed values are rejected. Included and omitted field identities are preserved for a future operator preview. Private notes/sensitive photos never enter by default; no field values are handled, parsed or copied by this code.

Source/fields/inclusions/context types must be exact before comparisons. Unknown/mixed classification or a field classification different from its declared source is HELD pending canonical classification resolution. No classification ranking or silent downgrade is invented. The sensitive flag must be a real boolean, but it cannot prove actual sensitivity or human review. All supplied sources/field universes/decision references remain fixtures: a caller can omit a real private field from the supplied universe or name a fake decision. The future E3 writer must independently resolve complete canonical field coverage, exact classification and permitted inclusion. This factory cannot certify data minimization over actual product data.

## Export context and disclosure record

Context binds immutable generation identity, exact source and ordered selected fields, actor, purpose, recipient, destination-policy reference, distinct export authorization and preview receipts. Action must be exactly export; ordinary view/read/download/ALLOW markers cannot replace the export capability, and a preview receipt cannot double as its authorization receipt. Those checks are structural, not a current authenticated authorization decision. Output observation binds the exact full context, output digest and a distinct event receipt. Stale generation/source/selection/actor/purpose/recipient/destination/receipt or invalid types fail with bounded reason codes.

`record_disclosure` revalidates the supplied manifest and returns a frozen record with generation/manifest/context/output/event linkage. It contains no original field values or export file. Digest shape is checked, not computed from an actual output here. Record context/manifest are omitted from ordinary representation; this is not operational logging/storage/export confidentiality proof. There is no durable writer, uniqueness/idempotency store, signed receipt, actual audit custody or actual event observation. Caller-forged coherent fixtures never prove that a disclosure occurred or was authorized.

Intrinsic record properties preserve `authority=NONE`, `external_copies_retractable=False`, `link_revocation_scope=FUTURE_SYSTEM_ACCESS_ONLY` and the fixed warning: revoking/expiring a link stops future system access only; downloaded, printed, copied, forwarded or captured copies cannot be retracted. Warning and authority properties cannot be supplied/replaced through ordinary constructor/replacement arguments. There is no retracted state or deletion-as-retraction method. This models the consequence of a future real disclosure; it does not operate an online link or assert that physical copies currently exist.

## Actual checks and missing integration

Ten meaningful unit cases verify default omissions, explicit sensitive-field inclusion metadata, included/omitted manifests, missing/duplicate/unknown fields, unknown/mixed classification hold, view/preview-as-export rejection, stale source/selection/full observation context, digest/distinct event receipts, immutable warning/non-retraction/no authority and type/equality-callback negatives. Root local fullE5suite59PASS includes existing native PostgreSQL/fakeAuth fixtures; no actual customer/provider/export/privacy/CSV/PDF/device operation.

Future E2 must show accessible included/excluded scope, classification, purpose/recipient and residual-copy warning before generation. E3 must resolve current capability, step-up/required independence, source/classification/inclusion/data boundary, protected before-effect audit/floor/concurrency and idempotent event lookup. Generation/download/failure/regeneration/revocation remain separate attributable events. Actual audit investigation does not grant authority to modify source audit evidence. Output-format policy must separately handle formula/active-content injection; this task generates no format and chooses no legal basis/retention/watermark/approved destination or thresholds.

E3R1 REVIEW/E5-003 IN_PROGRESS/live provisioning/privileged production HELD unchanged. Actual export/product UI/canonical producer/privacy/destination/output safety/current authority/audit/link enforcement and end-to-end tests remain MISSING/HELD. Development review can accept this record policy without opening export access or claiming source/customer data was disclosed.

## Ten-layer trace

ADR004R8/ADR001 classification → C5.6 → F5.6.2 → FL5.6.2 → T-E5-019 → M-E5-001 internal export policy → E-DEV-053. Every minimization/context/warning/non-retraction requirement returns to those sources; no model/audit marker is promoted to truth.

| Layer | Actual boundary |
|---|---|
| task | Internal minimized manifest/disclosure record/warning; independent review/currentCI required |
| feature | Policy shape only; product export generation/link enforcement MISSING |
| flow | No E2 preview/E3 actual effect/canonical writer implemented |
| requirement | Separate capability, minimal fields, irreversible disclosure warning preserved |
| design | API only; actual accessible operator preview/device evidence MISSING |
| architecture | E5 policy/E2 renders/E3 serves and verifies unchanged, no new seam |
| data/migration | Immutable fixture context/output digest; no actual schema/persistence/idempotency/audit custody |
| release | No customer/provider/domain/destination/format/legal policy/activation selected |
| product-scenario | Ten meaningful unit cases; no actual disclosure or privacy/output-format experiment |
| gap-audit | Complete canonical field coverage/classification/authorization/audit/generation/UI/format gaps attributed E3/E5/E2, no owner debugging |

Code `modules/e05-identity/internal/export_disclosure.py`; tests `modules/e05-identity/tests/test_export_disclosure.py`; context `vault/PACKS/P-E5-019.md`; task `vault/REGISTRY/T-E5-019.md`; proof `vault/EVIDENCE/E-DEV-053.md`; capsule `modules/e05-identity/MANIFEST.md`; addresses `vault/INVENTORIES/E10-GOVERNED-PATHS.md`.

## Source authority

- [Pinned ADR004R8](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-004__IDENTITY_AUTHORIZATION_SESSION_RECOVERY_AND_PRIVILEGED_ACTIVATION.md)
- [Historical section11 export detail](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/04_TECH_STRATEGY/DEBATES/DEBATE-004__IDENTITY_AUTHORIZATION_AUDIT_UNTRUSTED_INGESTION.md)
- [Canonical task](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/TASK_INDEX.md) and [review validation](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/ACCEPTANCE_MATRIX.md)
