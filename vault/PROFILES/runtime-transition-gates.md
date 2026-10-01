---
profile_of: runtime-transition-gates
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-006 Decision 10 and DEBATE-011 judge synthesis sections 6 and 10; T-E3-036
supersedes: ~
---

# Equal-evidence runtime transition gate package

## Document versus operational decision

T-E3-036 supplies a gate package; all actual candidate and migration gates remain HELD. It chooses no runtime, language, framework, queue/worker, provider, region, plan, account, credentials, purchase or deployment. ADR-002 remains the approved reversible platform direction; ADR-006 keeps short DB-near Supabase Edge Functions (A) and managed container API plus bounded worker (B) as equal-evidence hypotheses, without a production winner. A failure does not auto-promote B. Current local maintenance/Auth/Storage regression proof is not a complete operational fixture for either candidate or a comparison of them. T-E3-001-R1 remains REVIEW and physical activation HELD.

An A-to-B proposal requires A failing a mandatory gate on real fixtures AND B passing the same complete applicable gate package with proof. B-to-A or a challenger proposal uses the same scope and proof discipline; no intuition, headline price, runtime health or new provider feature can crown a candidate. If neither passes or comparison is incomplete, hold the affected capability and reopen challengers on equal terms. Existing ADR/change and E6 release/promotion/suspension authority retain the actual decision; this profile invents no new seam, release authority or permission to migrate.

## Freeze an equal comparison before execution

Each later candidate worksheet must freeze exact artifact/source/dependency/tool/provider/runtime/schema/config/message versions and dates; route/capability and tenant/classification scope; workload/scale and retained-data assumptions; initial canonical/identity/policy/audit/object/floor/operation manifests; support/account/custody failure domains; environment/trust-root references; matched fault injection and expected states/effects; comparable positive/negative/recovery/exit assertions; normalized cost scenarios and allocations; independently authorized credential scope and dry-run/hard stops; technical implementer/resolver and verifier; candidate-independent pass/reject criteria; independent verdict, findings/closure and owner/E6 gate references. All actual worksheet fields are currently UNFILLED/HELD.

Use identical consumer paths, workload inputs, fault sequences and assurance budgets for both candidates. Provider-specific adaptation is recorded, not hidden; inability to execute the same semantic gate remains HELD or evidenced failure, never an easier substitute test. Missing inventory, unmeasured limits or excluded services must be explicit. Numeric limits, fault durations, budgets and thresholds stay HELD until separately evidenced; this document supplies no invented values.

For every fixture, record expected semantic state, attempted and actual side effects, protected audit evidence/receipt, retained canonical/uncertain work, recovery owner and owner-readable next action, and cost/exit impact. Bind evidence to exact candidate/artifact/head/environment/date and current manifestations/generations. An effect receipt is distinct from audit/DB/queue/worker receipts. Proof must show current tuple, identity/floors/epochs/audit/runtime and all consuming edges, not merely a successful startup or happy request. Use references/digests; no secrets, raw private data or reusable tokens in evidence.

## Mandatory package: all sixteen judge-synthesis gates

These rows preserve the sixteen-item acceptance package in the [planning judge synthesis](https://github.com/xpike-dgm/motobakim-plan/blob/main/04_TECH_STRATEGY/DEBATES/DEBATE-011__JUDGE_SYNTHESIS.md) section 10, referenced by ADR-006. They are not a replacement for API-AC-001..024 in the requirements synthesis or the eighteen failure classes in the failure/TCO research: later worksheets must map every applicable criterion and failure class into these rows with an evidence-backed scope explanation. Current operational verdict is HELD for A and B on every row.

| Gate | Required matching positive/negative/failure/recovery coverage | A | B |
|---|---|---|---|
| 1. Direct-path/cross-tenant/provider-console bypass | All exposed tables/views/functions/RPC/Storage/handles/Studio and leaked/overbroad material paths; only current mediated authority permits sensitive effects/read/export | HELD | HELD |
| 2. Current session/role/epoch and two-issuer/privileged step-up | Stale/revoked/expired actors, grants/delegation/competence/independence/policy; in-flight current commit and issuer/assurance mismatch, no cached ALLOW | HELD | HELD |
| 3. Timeout/retry/fingerprint/status disclosure | Before/after commit response loss, same semantic replay read-only, different actor/scope/payload CONFLICT/HELD, current authorized cross-tenant-safe lookup | HELD | HELD |
| 4. DB/outbox/object/notification partial failure | Deterministic core acceptance/intent versus separate idempotent effects, interrupted dispatch, canonical uncertainty and coherent reconciliation | HELD | HELD |
| 5. Queue lease/worker kill/poison/retry/DLQ/backpressure/drain | Durable job families, lease expiry OUTCOME_UNKNOWN/PARTIAL/RECONCILING, bounded replay budgets/resolver, cancel and generation-fenced deploy drain | HELD | HELD |
| 6. Protected audit primary/fallback outage and gap/fork/replay | Effect-before-audit rejected; independent protected readiness/receipt, outage hold, replay/gap integrity and audit recovery continuity | HELD | HELD |
| 7. Publish versus recall/suspension and invalid rollback | New/equal negative dominates positive generation, exact manifests/release gate, old binary/config/backup cannot reopen suspended or recalled scope | HELD | HELD |
| 8. Object quarantine/SSRF/archive/digest/lineage/classification/handle revoke | Exact bytes/versions/parents, transitive negatives/classification, unsafe inputs and all disclosure paths, downloaded-copy limits honest | HELD | HELD |
| 9. Offline package/ledger/device restore/tombstone/conflict/account migration | Interrupted/mixed/wrong-digest packages, process death/storage pressure, local-versus-canonical acceptance, conflict/reconciliation, no resurrected deletes | HELD | HELD |
| 10. End-to-end epoch | Current revocation across in-flight operation, worker lease, object handle, cache/service-worker, package/export, retry and restored state | HELD | HELD |
| 11. Cross-plane restore/anti-resurrection/source preservation | Coherent DB/object/audit/current-floor and identity/config/schema/package/operation manifests; quarantine; no negative rollback or silent valid-data loss; source intact until proven acceptance | HELD | HELD |
| 12. Provider/DNS/account/billing/quota partial outage and negative availability | Partial/common-mode failures, independent negative availability, safe funded stop/retention/recovery and explicit technical account/support actors | HELD | HELD |
| 13. Deploy/schema/message/secret compatibility and forward recovery | Exact verified artifact promotion, consumer/lease drain, mixed generations/key consumers, data-preserving correction and no simplistic DB rollback | HELD | HELD |
| 14. No-owner-debug/AI forbidden credentials/support handoff | Owner-readable outcomes/support, narrow task/credential audience/expiry/dry-run/hard stop, denied owner/billing/unrestricted/service-role authority | HELD | HELD |
| 15. Normal/incident/restore/exit normalized BOM and spend stop | Same minimum-safe capabilities and workload, mandatory/conditional classification, current price/tax/FX/overage evidence, verified authorized envelope, funded drain versus hold | HELD | HELD |
| 16. Clean-room runtime/provider replacement | Logical identities/versions/relationships/history/objects/audit/operations/floors preserved in isolated replacement; independent verifier, custody/recovery/support and no assumed portability | HELD | HELD |

No row is a live PASS or executable test result. Actual fixtures for two-issuer/privileged paths, offline clients, workers/queues, independent custody/restore and actual target environments are not supplied by this document. Existing CI exclusions and isolated local test boundaries must not be hidden when filling later rows.

## Failure disposition and transition/recovery gates

Missing/stale/conflicting evidence preserves HELD. An actual violated mandatory invariant is rejected until mitigated; record attempted/actual scope and retained work rather than broadening a narrow failure to the whole provider or treating an untested alternate as passing. Remediate the exact candidate and independently re-review the same gates. A convenience callback or `waitUntil` cannot replace durable long-job execution; container uptime or queue “exactly once” cannot prove product effect.

Before any later authorized transition, close the equal gate package and current support/custody/safe-cost boundaries; identify compatible source/target manifests, exact verified artifact and data migration/forward recovery, current negative/epoch rechecks, retained operation identities, bounded old-consumer drain, quarantined restore, reconciliation and independent actual-target verification. Retain source valid data and custody until accepted verified replacement; no premature deletion/cutover or rollback of current negatives. Release/activation still needs its applicable E6/owner authority; a merged document PR is not deployment. If a service/security incident forces containment first, use authorized safe stop and current negative paths, never automatic positive promotion to an unproved candidate.

The owner receives the affected feature, proven failure and candidate result, what is retained/uncertain, risk/cost/reversibility, technical resolver/support and approve/hold/stop/payment/legal-support choices. The technical actor performs investigation, SQL/SSH/queue recovery/cutover/secret work within reviewed scope; the owner is not the debugger. Standing acceptance of reviewed documents does not fund a new service or close operational migration.

## Dated source and evidence limits

Supabase skill guidance, changelog index and official background-task documentation were checked on 2026-10-01. [Current background-task guidance](https://supabase.com/docs/guides/functions/background-tasks) describes request-adjacent tasks subject to runtime shutdown limits; that capability does not satisfy Kavriva's durable long-job gate by itself. [Changelog index](https://supabase.com/changelog.md) is a drift input, not measured target inventory or candidate PASS. No current prices, fixed runtime limits, newest-version claim, provider recommendation, hosted query or change is supplied. Candidate evidence needs current official guidance and measured exact targets when actually executed.

Task acceptance checks the evidence-gated package and preserved operational HELD status, no migration. Reject automatic fallback, unequal tests/workload/BOM, missing gates/criteria, unmeasured defaults called safe, health/CI-only activation, weakened standards, unsafe source deletion/negative resurrection or owner debugging.

Inputs: `[[vault/PROFILES/backend-reversibility.md]]`, `[[vault/PROFILES/platform-bom-inputs.md]]`, `[[vault/PROFILES/classified-cost-bom.md]]`, `[[vault/PROFILES/cost-hold-behavior.md]]`, `[[vault/PROFILES/compatibility-hold.md]]`. Pack: `[[vault/PACKS/P-E3-036.md]]`; task: `[[vault/REGISTRY/T-E3-036.md]]`; evidence: `[[vault/EVIDENCE/E-DEV-026.md]]`.
