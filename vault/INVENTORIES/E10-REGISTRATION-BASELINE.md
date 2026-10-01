---
inventory_id: I-E10-REGISTRATION-BASELINE
purpose: Preserve literal historical metadata coverage baseline
domain: project-execution
module: e10-graph
owner: E10
depends_on: []
used_by: []
implements: [ADR-015-Decision-3, C10.1, F10.1.1]
public_contracts: []
internal_scope: documentary-registration-rule
tasks: [T-E10-001]
tests: []
evidence: [E-DEV-027]
supersedes: []
superseded_by: []
status: RECORDED
last_verified: 2026-10-01
---

# Registration baseline — literal field presence

Record: `I-E10-REGISTRATION-BASELINE`

Base commit: `28b3734027d72b8f592b60290c8bf5f8fc0dfe2b`; audited2026-10-01. Scope:126 tracked Markdown files (git ls-files verified), excluding Git/cache paths. Inspect top-level YAML frontmatter with existing _lib.frontmatter_yaml/parse_simple, checking presence (not value semantics) of all16 individual minimum field names. Body text, legacy YAML fences, aliases and reference-defined metadata are intentionally not credited as frontmatter. This is therefore a literal serialization gap list, NOT proof of semantic ownerlessness or absence of information in document bodies. Every missing field below requires controlled inspection before conforming admission under the rule; no historical file was rewritten. Empty-present fields have NOT been validated as meaningful. Identity uniqueness against planning truth, resolved edges, critical-test coverage and staleness are not established by this inventory. No runtime/public surface/executable test applies to this documentary snapshot; task/evidence links carry its source comparison proof.

At this frozen baseline:101 files have parsed frontmatter and25 have none;0 contain all16 individually named fields. The126 base files remain UNVERIFIED for full registration. Green legacy identity/run_all does not close these gaps. New task artifacts are outside this baseline; it is never presented as current full-graph proof.

| Source path at frozen base | Missing literal frontmatter fields |
|---|---|
| `.github/workflows/CI_PLAN.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e01-app/MANIFEST.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e02-panel/MANIFEST.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e03-server/MANIFEST.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e04-offline/MANIFEST.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e05-identity/MANIFEST.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e06-release/MANIFEST.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e07-build-lane/MANIFEST.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e08-content/MANIFEST.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e09-ai/MANIFEST.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e10-graph/checks/ARCHITECTURE_TEST_SUITE.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e10-graph/checks/VALIDATION_COMMANDS.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e10-graph/MANIFEST.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e10-graph/MIGRATION_ROLLBACK_APPLICABILITY.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e10-graph/ROUTING_AND_TRACEABILITY.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `modules/e10-graph/TASK_REGISTRY.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `README.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `templates/CONTRACT_TEMPLATE.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `templates/MANIFEST_TEMPLATE.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `templates/PACK_TEMPLATE.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `vault/CONTRACTS/audit-event.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/CONTRACTS/authorization-tuple.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/CONTRACTS/design-token.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/CONTRACTS/ledger-operation.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/CONTRACTS/operation-identity.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/CONTRACTS/package-manifest.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/CONTRACTS/release-promotion.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/CONTRACTS/state-epoch.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/CONTRACTS/task-pack.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/EVIDENCE/E-DEV-001.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-002.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-003.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-004.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-005.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-006.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-007.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-008.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-009.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-010.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-011.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-012.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-013.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-014.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-015.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-016.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-017.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-018.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-019.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-020.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-021.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-022.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-023.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-024.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-025.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-DEV-026.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-PR-001.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-PR-002-TRANSCRIPT.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, last_verified |
| `vault/EVIDENCE/E-PR-002.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/EVIDENCE/E-PR-003.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/INVENTORIES/E3-COMPATIBILITY-CHANGELOG.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `vault/INVENTORIES/E3-HOSTED-SUPABASE-PREFLIGHT.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `vault/INVENTORIES/E3-HOSTED-SUPABASE-RESULT.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `vault/INVENTORIES/E3-STORAGE-URL-STUDIO-DIRECT-PATHS.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `vault/PACKS/P-E3-001-R1.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by |
| `vault/PACKS/P-E3-001-R2.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by |
| `vault/PACKS/P-E3-001-R3.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by |
| `vault/PACKS/P-E3-006a.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-006b.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-006c.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-007.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-008.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-009.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-010.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-011.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-012.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-013.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-014.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-015.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-016.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-017.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-018.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-030.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-031.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-034.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E3-036.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-E5-003.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by |
| `vault/PACKS/P-PROOF-001.md` | purpose, domain, module, owner, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, supersedes, superseded_by, status, last_verified |
| `vault/PROFILES/ai-task-scope.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/api-enforcement-needs.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/authorization-tuple-browser.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/backend-reversibility.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/classified-cost-bom.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/compatibility-hold.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/cost-hold-behavior.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/domain-authority-registry.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/durable-state-categories.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/history-provenance.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/object-activation.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/object-boundary.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/platform-bom-inputs.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/rls-storage-defense.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/runtime-transition-gates.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/PROFILES/secret-custody-rotation.md` | purpose, domain, module, depends_on, used_by, implements, public_contracts, internal_scope, tasks, tests, evidence, superseded_by, last_verified |
| `vault/REGISTRY/T-E3-001-R1.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, superseded_by |
| `vault/REGISTRY/T-E3-001.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, superseded_by |
| `vault/REGISTRY/T-E3-006a.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-006b.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-006c.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-007.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-008.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-009.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-010.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-011.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-012.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-013.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-014.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-015.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-016.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-017.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-018.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-030.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-031.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-034.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E3-036.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |
| `vault/REGISTRY/T-E5-003.md` | purpose, domain, module, used_by, implements, public_contracts, internal_scope, tasks, tests, supersedes, superseded_by |

Rule: `[[modules/e10-graph/GRAPH_NODE_REGISTRATION.md]]`; evidence: `[[vault/EVIDENCE/E-DEV-027.md]]`.
