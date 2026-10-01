---
record_id: M-E1-001
metadata_version: 1
purpose: "Tüketici Flutter uygulaması: 5 sekme + rehber/tanı/bakım/geçmiş/topluluk akışlarını RENDER eder; AI Usta girişi (A1) dahil. E1 renders — never verifies, never authorizes, never publishes."
domain: "module-contract"
module: "e01-app"
owner: "E1"
depends_on: [M-E3-001, M-E5-001, M-E4-001]
used_by: [M-E9-001, I-E10-REGISTRATION-BASELINE]
implements:
  - "planning 06_DELIVERY_PLANNING/EPIC_CATALOG.md row E1"
public_contracts:
  - "[[modules/e01-app/MANIFEST.md#Public contract surface (only this is usable across boundaries)]]"
internal_scope: "Flutter widget tree, navigation state, caches, offline reads of E4 packages, in-flight UI state. No direct database access; no Supabase service_role; no signing keys; no canonical truth stored here."
tasks: [T-E10-001]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_identity.py]
evidence: [E-DEV-027]
supersedes: []
superseded_by: []
status: INSTALLED
last_verified: 2026-10-01
---

# MODULE MANIFEST — e01-app (E1 Tüketici mobil uygulaması)

Status: INSTALLED (Step-2 REVIEWED PASS 2026-09-22 + installed to `modules/e01-app/MANIFEST.md`; OUT-3 B-19 header fix 2026-09-23)
Record: `M-E1-001` (first claim in this draft; collisions rejected per identity standard)

## Purpose

Tüketici Flutter uygulaması: 5 sekme + rehber/tanı/bakım/geçmiş/topluluk akışlarını RENDER eder; AI Usta
girişi (A1) dahil. E1 renders — never verifies, never authorizes, never publishes.

## Public contract surface (only this is usable across boundaries)

- Rendered flows SCR-001..038 (consumer screens; presentation only).
- AI entry A1 (1 bağlam + 1 soru + 2 yol; E9 proposes, E1 renders, E3 verifies).
- Consumed contracts (defined-by-reference): authorization-tuple (E3, enforced at commit-time),
  package-manifest + ledger-operation (E4), audit-event (E5, via E3 serving).
- Export SCR-030 (read-only; paid-export forbidden — export can never be paid).

## Internal scope (invisible outside)

Flutter widget tree, navigation state, caches, offline reads of E4 packages, in-flight UI state.
No direct database access; no Supabase service_role; no signing keys; no canonical truth stored here.

## Allowed / forbidden dependencies

- Allowed (consume only): E3 (API/verify/serve), E5 (authorize decisions), E4 (packages, consumed by E1).
- Allowed (propose-flow): E9 → E1 proposals (E1 renders, never executes AI decisions unverified).
- Forbidden: E1↔E9 cycle in any form; direct E8 planes (via E3 only); E6 custody/policy; E7 lane internals;
  bypassing commit-time authorization; fabricated intervals, silent conflict wins, hidden exports.

## Tests

- Flow conformance: SCR-001..038 acceptance (ACCEPTANCE_MATRIX.md, Step-5 findings cited on failure).
- Split tests: render/authorize split (E1 renders, E3 serves, E5 authorizes); unauthorized-action negatives.
- Cross-cutting: Turkish/units/accessibility in every user-facing flow (R-012 propagation).

## Change / rollback rules

- UI-only changes: standard review; any public-surface change re-runs split tests.
- Rollback: client rollback never resurrects revoked capability (epoch honored; E5 rule by reference).
- No silent scope expansion; new cross-module need declares seam + review first.

## Links (defined-by-reference, not copied)

- Requirements/design: `C1.0`..`C1.11`, `F1.*`, flows `SCR-001`..`SCR-038`, `A1`.
- Architecture: `planning 07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md` seam row (E1 renders); `R-001`, `R-003`, `R-004`, `R-011`, `R-012`, `R-013`.
- Tasks/tests: physical registry rows `supersedes` planning `planning 06_DELIVERY_PLANNING/TASK_INDEX.md` E1 rows (Step 5 builds).

## Metadata verification boundary (T-E10-001 remediation)

Same stable manifest identity and original semantic body preserved. Purpose/internal scope are serialized verbatim from the existing sections; public surface is defined by an exact same-record section reference, not a new contract or runtime seam. depends_on/used_by encode the declared epic foundation DAG from the canonical epic/dependency catalog, with E2 consumption of E8 outputs and E9 propose-flow to E1 retaining their existing qualifiers; they are not an assertion of deployed calls. The baseline inventory is an actual documentary consumer. No predecessor/successor record exists for this same-ID addition. Listed tests verify installed anatomy/identity, not all future declared product behavior; E-DEV-027 records scoped metadata validation and outstanding corpus acceptance. Product activation/release/identity gates remain unresolved.
