---
record_id: V-E6-CONFIG-001
version: 1
purpose: Type meaning-changing configuration as immutable reviewed release context
domain: release-governance
module: e06-release
owner: E6
implements: [ADR-007, ADR-003, ADR-001, C6.5, F6.5.1, R-003, R-004, R-007, R-009, R-011, R-013, R-014]
public_contracts: []
internal_scope: config-as-release-typing
tasks: [T-E6-011]
tests: [modules/e06-release/tests/test_config_release.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E6-001, V-E6-SNAPSHOT-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E6-011, T-E6-011, E-DEV-058]
evidence: [E-DEV-058]
supersedes: []
status: ACTIVE
---

# Config-as-release typing v1

T-E6-011 acceptance Typed/versioned/reviewed config; no numerics, validation review; harddeps none. Accepted base PR58 a2798024bda445cec4b11bdab43e98ff9576ba7c / plan main fa914f013fdcd032faed876689092da245989459. ADR007R7 requires config, flags, templates, migrations and transforms treated as attributed, consequence-classified releases inside complete release-meaning graph; no expansion outside current client capability or suspension clearing. Shared config/migration acceptance also needs T012 and actual runtime sources, not closed by typing review.

## Internal declarations and exact review

Frozen ConfigRelease declares stable ID/positive revision, closed kind configuration/feature_flag/template/migration/transform, nonempty opaque immutable bytes, nonempty unique symbolic declared semantics, immutable version/digest author reference, declared consequence, complete ordered graph, immutable capability reference and supported-semantic tuple, explicit clears_suspension false. All eight graph slots required: binary, api_contract, content_manifest, effective_config, schema_migration, external_models, offline_packages, generations. Each reference binds ID/revision/digest; missing/duplicate/unknown/reordered context rejects. Reference labels cannot hide mutable latest lookups. Positive revisions are identity metadata, not invented numeric policy thresholds.

config_envelope deterministically serializes exact supplied typed metadata and Base64 payload into an internal review envelope. No product value, configuration syntax/format, schema/tool/provider/threshold, semantic parser/compiler or deployed config is chosen. Exact plain types validate before callbacks/comparisons. Declared semantics must be a subset of declared supported capability semantics; true or non-boolean suspension-clear flags reject. This checks supplied declarations only, not actual meaning or current client capabilities.

bind_typed_config revalidates the accepted same-capsule ReviewBinding and demands exact internal envelope bytes in snapshot content. Full snapshot/reviewer/scope/rationale/policy/expiry context remains bound through T003. Frozen returned TypedBinding has intrinsic authority NONE; require_exact_config revalidates original binding and exact candidate envelope. Payload/whitespace/kind/ID/revision/author/consequence/semantics/graph/reference/capability/reviewer changes invalidate old review; original objects remain unchanged. No API writes effective configuration or releases execution.

Coherent fixture claims can bind without authenticating author/reviewer/complete canonical graph/semantic extraction/classification/current capability/current authority or protected audit. A payload may hide semantics despite false caller declaration; this library cannot inspect it and grants no permission. Real producer must extract/validate actual meanings, authenticate current capability/graph/policy/attribution, reject negative-control effects and execute through current authorized E3/E5/E6 gate before runtime use. No literal symbolic label is claimed to identify every forbidden behavior.

## Performed tests and bounds

Twelve new meaningful tests + accepted30 E6 =42 PASS0.084s/compile PASS. Tests exercise all five kinds requiring exact review, every identity/payload/meaning/author/consequence field, every graph slot ID/revision/digest, capability revision/digest/supported-set changes, outside-envelope declaration, true/boolean-negative clear, missing/duplicate/unknown/reordered graph, missing/duplicate/mutable semantic/payload fields, old/new candidate preservation, stale/bare/mutated review and hostile comparison callbacks. Fixtures only; no actual config/client/provider/human/transaction/migration application.

Existing E6 workflow discovers actual accepted registry/snapshot plus config tests in this branch; absent unmerged PR59 guarded transition and PR57 independence tests are not counted. E6 source current CI and independent gpt-6-luna/max review required. No per-slice review, one task PR. Actual semantic producer/current envelope/canonical meaning graph/E3+E5 authority/role independence/protected audit/floors/T004 guarded transition/T012 migration/custody/E7 lanes/E2UI/consumer/production remain MISSING/HELD. Independent review of internal typing cannot close those gates.

## Ten-layer trace

ADR007R7 -> C6.5 -> F6.5.1 -> FL6.5.1 -> T-E6-011 -> M-E6-001 internal config typing -> E-DEV-058.

| Layer | Actual scope |
|---|---|
| task | Review internal typed/versioned/exact-review declaration rules |
| feature | No effective configuration or publication authority |
| flow | No E2 UI/canonical writer or runtime config consumption |
| requirement | Declared complete release graph/capability/negative-control context bound |
| design | No visual/device/accessibility proof |
| architecture | Same-capsule snapshot policy, no new seam/private cross-import |
| data/migration | Opaque immutable fixtures, no schema or migration application |
| release | Actual config/migration gate/physical provider/keys/lane execution held |
| product-scenario | 42 actual local internal units, no deployed consumer scenario |
| gap-audit | Actual semantic extraction/authentication/current graph/capability/permission/floors/audit/transaction absent |

Code `modules/e06-release/internal/config_release.py`; tests `modules/e06-release/tests/test_config_release.py`; profile `vault/PROFILES/config-as-release-typing.md`; pack `vault/PACKS/P-E6-011.md`; task `vault/REGISTRY/T-E6-011.md`; proof `vault/EVIDENCE/E-DEV-058.md`; capsule `modules/e06-release/MANIFEST.md`. E3R1 REVIEW/E5-003 IN_PROGRESS and all unmerged physical/role/transition drafts unchanged.

Bounded internal typing closure: separate /root/pr58_snapshot_binding_review gpt-6-luna/max PASS/no actionable findings at source821d4d3d42a286fe3c848df49408b5d4f75560e4, actual sourceall10CIgreen/actualT3SUCCESS. Inner config and outer packet consequence labels both bound; no equality/classification ranking invented by ADR007R7. Direct owner standing DEC0069/0070 scoped acceptance, pendingplanPR4unmerged. Internal declarations only; actual semantic extraction/canonical/current graph/capability/authenticated author-review/current E3/E5 permission/audit/floors/T004/T012/config deployment and production remain MISSING/HELD. Final metadata audit/latest-head CI required before merge.
