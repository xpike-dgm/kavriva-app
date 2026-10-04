---
record_id: M-E1-001
metadata_version: 1
purpose: "Tüketici Flutter uygulaması: 5 sekme + rehber/tanı/bakım/geçmiş/topluluk akışlarını RENDER eder; AI Usta girişi (A1) dahil. E1 renders — never verifies, never authorizes, never publishes."
domain: "module-contract"
module: "e01-app"
owner: "E1"
depends_on: [M-E3-001, M-E5-001, M-E4-001]
used_by: [M-E9-001, I-E10-REGISTRATION-BASELINE, I-E10-PATHS-001, P-E10-006, E-DEV-033, V-E1-SHELL-001, P-E1-001, E-DEV-097, V-E1-GARAGE-001, P-E1-002, E-DEV-098, V-E1-FIRSTUSE-001, P-E1-003, E-DEV-099, V-E1-VARIANT-001, P-E1-004, E-DEV-100, V-E1-DISCOVERY-001, P-E1-005a, E-DEV-101, V-E1-READINESS-001, P-E1-005b, E-DEV-102, V-E1-TEACHING-001, P-E1-005c, E-DEV-103]
implements:
  - "planning 06_DELIVERY_PLANNING/EPIC_CATALOG.md row E1"
public_contracts:
  - "[[modules/e01-app/MANIFEST.md#Public contract surface (only this is usable across boundaries)]]"
internal_scope: "Flutter widget tree, navigation state, caches, offline reads of E4 packages, in-flight UI state. No direct database access; no Supabase service_role; no signing keys; no canonical truth stored here."
tasks: [T-E10-001, T-E10-006, T-E1-001, T-E1-002, T-E1-003, T-E1-004, T-E1-005a, T-E1-005b, T-E1-005c]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_identity.py, modules/e01-app/internal/shell/test/shell_test.dart, modules/e01-app/internal/shell/test/garage_context_test.dart, modules/e01-app/internal/shell/test/first_use_test.dart, modules/e01-app/internal/shell/test/variant_resolution_test.dart, modules/e01-app/internal/shell/test/guide_discovery_test.dart, modules/e01-app/internal/shell/test/preparation_readiness_test.dart, modules/e01-app/internal/shell/test/teaching_only_test.dart]
evidence: [E-DEV-027, E-DEV-097, E-DEV-098, E-DEV-099, E-DEV-100, E-DEV-101, E-DEV-102, E-DEV-103]
supersedes: []
superseded_by: []
status: INSTALLED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e01-app/MANIFEST.md.snapshot"
metadata_origin_digest: "9e2225c1d61c2f98927600e3de96f14e30680f01a54468a60b2c7d981dfe9e1a"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_scope: "record registration; original product/verification scope unchanged"
metadata_verified_at: "2026-10-01"
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

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.

## T-E1-001 iç sunum kabuğu

`modules/e01-app/internal/shell/lib/kavriva_shell.dart` beş çağıran görünümü ve Türkçe bölüm etiketlerini taşır; seçili sekme/görünürlük açık girdi, değişim yalnız istek. SCR-005 ve diğer ürün ekranları ayrı; yeni public contract/seam yok. Kalıcı gerçek E3/E5/E4 dış sınırlarında; bu koda taşınmadı. Headless SDK/widget testi gerçek cihaz/yayın kabulü değildir; aktif-iş alt-bar ve ilk landing HELD. Pack `vault/PACKS/P-E1-001.md`; profil `vault/PROFILES/app-shell-boundary.md`; kanıt `vault/EVIDENCE/E-DEV-097.md`.

## T-E1-002 Garaj sunumu

`modules/e01-app/internal/shell/lib/garage_context.dart` selected motorcycle ve doğru kimlikli selection/lifecycle/history/safety/work isteklerini yalnız sunumda taşır. E3 serves/E5 authorizes/E4 gerçeklik dışarıda; yeni public contract/private import/seam yok. Per-bike ayrım, inactive history ve critical reach-back korunur. Native/cihaz/üretim gerçek kaynakları HELD. Pack `vault/PACKS/P-E1-002.md`; profil `vault/PROFILES/garage-context-render.md`; kanıt `vault/EVIDENCE/E-DEV-098.md`.

## İlk kullanım sunumu

E1 içine `modules/e01-app/internal/shell/lib/first_use.dart` ve anlamlı form/ilkniyet testleri; gerçekmotorcreate/account/fitDB/newseam yok. Pack `vault/PACKS/P-E1-003.md`; kanıt `vault/EVIDENCE/E-DEV-099.md`.

## Motosiklet ayrımı ve uygunluk sunumu

`modules/e01-app/internal/shell/lib/variant_resolution.dart` yalnız çağıran tek soru ve iki uygunluk durumunu sunar; E1 gerçek fit/kaynak/güncellik/kimlik kararı yazmaz. Eksik/eski/yanlış bağlamda olumlu hazırlık yolu kapalı, öğrenme ayrı; gerçek uygulama/API/upload/native yok. Pack `vault/PACKS/P-E1-004.md`; kanıt `vault/EVIDENCE/E-DEV-100.md`.

## İşi bulma ve rehber kapsamı sunumu

`modules/e01-app/internal/shell/lib/guide_discovery.dart` yalnız plain arama ve kapsam önizlemesi istekleri; aynı kapsüldeki fit sunumu kullanılır. Gerçek arama/fit/kimlik/yazım yok; eski ekran/SDK/workflow değişmez.


Profil `vault/PROFILES/guide-discovery-render.md`; pack `vault/PACKS/P-E1-005a.md`; görev `vault/REGISTRY/T-E1-005a.md`; kanıt `vault/EVIDENCE/E-DEV-101.md`.

## Hazırlık sunumu

`modules/e01-app/internal/shell/lib/preparation_readiness.dart` yalnız çağıran currentfit/readiness ve condition/why/remedy/recheck/startintent gösterir. Producer/otorite/yazım/physicalapplication yok.


`vault/PROFILES/preparation-readiness-render.md`; `vault/PACKS/P-E1-005b.md`; `vault/REGISTRY/T-E1-005b.md`; `vault/EVIDENCE/E-DEV-102.md`.

## Yalnız öğrenme sunumu

`modules/e01-app/internal/shell/lib/teaching_only.dart` açıklayıcı konuyu etiketli bilgi olarak sunar, yalnız güncel bağlam yeniden kontrolü/geri dönüş niyeti. Uygunluk/hazırlık/otorite/yazım/fiziksel uygulama üretmez.


`vault/PROFILES/teaching-only-render.md`; `vault/PACKS/P-E1-005c.md`; `vault/REGISTRY/T-E1-005c.md`; `vault/EVIDENCE/E-DEV-103.md`.
