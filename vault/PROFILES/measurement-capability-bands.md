---
record_id: V-E8-MEASUREMENT-BANDS-001
version: 1
purpose: Ölçüm kabiliyetlerini tam kaynak nitelikleriyle dört sınıfa ayırmak
domain: measurement-capability-bands
module: e08-content
owner: E8
implements: [ADR-012, ADR-001, ADR-005, ADR-010, C8.5, F8.5.1, R-001, R-003, R-004, R-007, R-011, R-013, R-014]
public_contracts: []
internal_scope: measurement-capability-bands
tasks: [T-E8-009]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [M-E8-001, M-E3-001, M-E5-001, M-E6-001, M-E2-001, D-APP-DOC-017, V-E6-AUTHORITY-001, release-promotion, I-E10-PATHS-001, V-CI-001]
used_by: [P-E8-009, T-E8-009, E-DEV-096]
evidence: [E-DEV-096]
supersedes: []
status: ACTIVE
---

# Ölçüm kabiliyetlerinin dört sınıfı

## Kanonik kabul ve kaynak

T-E8-009 kabulü **Exact-qualifier bands incl. 9th outage item**; review; hard dependency yok. C8.5/F8.5.1/FL8.5.1/ADR012R4 kaynak nitelikleri dört sınıfta tutulur. Bu sınıflandırma bir SDK, sağlayıcı, hesap, olay şeması, KPI, saklama süresi, hukuki rıza kararı veya ürün uygulaması değildir.

Kabul edilmiş [ADR012 Decision4](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-012__MEASUREMENT_SPLIT_ANALYTICS_OBSERVABILITY.md):

> First-release capability: mandatory at direction level — plane separation; canonical-derived Internal Operations coverage/quality visibility; minimal purpose-limited usage measurement where permitted and useful; crash/ANR/performance signals; consent/opt-out enforcement; telemetry health (late/drop/duplicate visibility); old-client semantic compatibility; retention/delete/export path; outage independence. Deferrable: identified profiles, anonymous-to-profile merge, cross-device identity, advanced funnels/cohorts, warehouse streaming, rich segmentation. Optional (each needs separate purpose/privacy justification): session replay, heatmaps, broad autocapture, surveys, detailed device/location enrichment. Scale-triggered: collector tiers, warehouse/lake export, long raw retention, sampling/cardinality controls, multi-region analytics, paid SLA/support, automated spend controls.

## Zorunlu — yalnız yön düzeyinde (9)

Bu sınıf **mandatory at direction level** anlamını taşır; dokuz özelliğin uygulanmış veya gerçek testinin geçmiş olduğunu söylemez. Özellikle kullanım ölçümü hem izin verilen **hem** yararlı olanla sınırlıdır. Her fiziksel kanıt MISSING/HELD.

| No | Tam kaynak kalemi | Korunan anlam / gerçek durum |
|---|---|---|
| 1 | plane separation | Kanonik ölçüm, analitik, korumalı denetim, gözlem ve destek sinyalleri karıştırılmaz. Gerçek uygulama HELD |
| 2 | canonical-derived Internal Operations coverage/quality visibility | İç operasyon kapsam/kalite görünürlüğü kanonik kayıtlardan türetilir; cihaz sinyali kanonik kayıt yerine geçmez. Gerçek üretici/ekran HELD |
| 3 | minimal purpose-limited usage measurement where permitted and useful | En az, amaçla sınırlı; hem izinli hem yararlı kullanım ölçümü. Güncel amaç/izin/ölçüm kanıtı HELD |
| 4 | crash/ANR/performance signals | Çökme/ANR/performans sinyalleri gözlem düzlemidir; teknik doğruluk veya onay değildir. Gerçek sinyal yolu HELD |
| 5 | consent/opt-out enforcement | Rıza/opt-out uygulanması güvenli çekirdek ve negatif güvenlik/recall yolunu bozamaz. Gerçek uygulama HELD |
| 6 | telemetry health (late/drop/duplicate visibility) | Geç/düşen/tekrarlı sinyaller görünür; eksik telemetri gerçek olayın yokluğu demek değildir. Gerçek sağlık kanıtı HELD |
| 7 | old-client semantic compatibility | Eski istemci anlam uyumu gerçek sürümlerle kanıtlanmalı. Gerçek uyum kanıtı HELD |
| 8 | retention/delete/export path | Saklama/silme/export yolu; sayı veya export başarı iddiası yok. Gerçek amaç/süre/yol kanıtı HELD |
| 9 | outage independence | Ayrı analitik kesintisi güvenli çekirdeği ve kritik negatif güvenlik/recall davranışını engellememeli. **T-E8-010 ayrı gerçek PASS/HELD kontrolü; burada HELD** |

Dokuzuncu kalem gizlenmez, diğer sekizinin içinde eritilmez. Bu task onun sınıfını tutar; T-E8-010 kesinti deneyini bu kayıtla DONE yapmaz.

## Ertelenebilir (6)

Bütün liste kaynakla aynı nitelikleri taşır; şu anda etkinleştirilmez. Erteleme mevcut koruma/saklama/geri çağırma yükümlülüklerini silmez.

| No | Tam kaynak kalemi | Durum |
|---|---|---|
| 1 | identified profiles | Gerçek etkinleştirme HELD |
| 2 | anonymous-to-profile merge | Gerçek kimlik birleştirme HELD |
| 3 | cross-device identity | Gerçek cihazlar arası kimlik HELD |
| 4 | advanced funnels/cohorts | Gerçek ileri huni/kohort yeteneği HELD |
| 5 | warehouse streaming | Gerçek warehouse aktarımı HELD |
| 6 | rich segmentation | Gerçek zengin segmentasyon HELD |

## İsteğe bağlı — her birine ayrı amaç/gizlilik gerekçesi (5)

**Each needs separate purpose/privacy justification** bütün satırlara uygulanır. “İsteğe bağlı” sınıfı kendi başına toplama izni veya sağlayıcı seçimi değildir.

| No | Tam kaynak kalemi | Durum |
|---|---|---|
| 1 | session replay | Ayrı amaç/gizlilik kanıtı MISSING; HELD |
| 2 | heatmaps | Ayrı amaç/gizlilik kanıtı MISSING; HELD |
| 3 | broad autocapture | Ayrı amaç/gizlilik kanıtı MISSING; HELD |
| 4 | surveys | Ayrı amaç/gizlilik kanıtı MISSING; HELD |
| 5 | detailed device/location enrichment | Ayrı amaç/gizlilik kanıtı MISSING; HELD |

## Ölçekle tetiklenen (7)

Ölçülmüş ihtiyaç ve güvenli asgari kapsam kanıtı yok; hiçbir satır mevcut öneri veya ücretli seçim değildir. Sayısal ölçek eşiği icat edilmez.

| No | Tam kaynak kalemi | Durum |
|---|---|---|
| 1 | collector tiers | Gerçek ihtiyaç/plan seçimi HELD |
| 2 | warehouse/lake export | Gerçek ihtiyaç/aktarılabilirlik HELD |
| 3 | long raw retention | Gerçek ihtiyaç/amaç/saklama sınırı HELD |
| 4 | sampling/cardinality controls | Gerçek ihtiyaç/kapsam kanıtı HELD |
| 5 | multi-region analytics | Gerçek ihtiyaç/yetki/yerleşim kanıtı HELD |
| 6 | paid SLA/support | Gerçek ihtiyaç/destek/gider yetkisi HELD |
| 7 | automated spend controls | Gerçek sayaç/otorite/eşik ve gider kararı HELD |

## Düzlem ve sahiplik sınırları

ADR012R1–3/R5–6 yürürlükte kalır: kanonik operasyon kapsam/kalite sayaçlarının kayıt/şeması E3'tedir, E8 türetir, E2 yalnız gösterir. Korumalı privileged-action audit/security evidence analitik dışında kalır. Reliability/crash/performance observability ayrı düzlemdir, mümkün olduğunda provider-neutral; store/platform vitals yalnız destek sinyalidir. Analitik hiçbir teknik gerçek, insan onayı, güvenlik/onarım kanıtı, entitlement, recall, canonical state veya korumalı audit otoritesi değildir. Sağlayıcı değişiminde kanonik kayıt, korumalı denetim veya owned metrics taşınmaz.

İzin reddi, SDK/sağlayıcı kesintisi, kota/fatura engeli, geç upload veya silme isteği güvenli çekirdeği ve kritik negatif güvenlik/recall davranışını durduramaz. Gerçek bağımsızlık kanıtı yok: HELD. Dedicated analytics privacy/owner-operability/safe-TCO/offline/clean-exit gate'lerini geçmezse daha küçük Kavriva-owned baseline gerekir; gate zayıflatılmaz. Bu kayıt o baseline'ı kurmaz. Raw export tek başına clean-exit proof değildir; kimlik/silme durumu, türemiş nesne, geç geliş ve mobil instrumentation taşınabilirliği gerçek kanıtı HELD.

Veri azaltma/amaç/saklama/access koşulları ADR012R3'ten değişmeden devralınır; SDK varsayılanı toplama yetkisi değildir. T-E8-007/008 gerçek sınıf başına amaç/saklama işi bu listeyle kapanmaz; yeni sayısal süre veya hukuki sonuç seçilmez. T-E8-006 gerçek kayıt-türevi üretici ve E2 ekranı burada uygulanmaz. E3/E5/E6 kimlik/yayın/audit/floor sınırları korunur, yeni seam veya private import yok.

## Olumsuz durumlar

| Eksik veya yanlış durum | Gereken sonuç |
|---|---|
| Dokuzuncu kesinti bağımsızlığı kalemini listeden çıkarmak | Reddet; tam dokuz zorunlu yön kalemi gerekli |
| “Where permitted and useful” veya “mandatory at direction level” niteliğini silmek | Reddet; koşulsuz toplama veya uygulanmışlık çıkarımı yapılamaz |
| Optional beş kalem için ortak genel gerekçeyi yeterli saymak | Reddet; her satıra ayrı purpose/privacy kanıtı gerekir |
| Geç/düşen/tekrarlı görünürlüğü veya eski istemci semantic uyumunu sadeleştirip kaldırmak | Reddet; bileşik anlam korunmalı |
| Scale listesini mevcut plan/purchase önerisi yapmak | Reddet; gerçek tetik/kanıt/yetki yok |
| Sınıf veya CI başarısını gerçek analytics/outage/privacy/exit PASS saymak | Reddet; farklı gerçek kanıt gerekir |
| Telemetriyi kanonik kayıt, korumalı audit veya yayın izni saymak | Reddet; kanonik otorite ayrı |

## Kayıt ve değişim

Kabul edilmiş plan `fa914f013fdcd032faed876689092da245989459`, uygulama `a43f47c558b7e6ccadd483e1eca4a25675893172`, kaynak pinleri pack alan4. Kaynak/policy/sürüm/ihtiyaç değişirse sınıf/nitelik yeniden karşılaştırılır; eski pin güncel activation kararı değildir. Pack `vault/PACKS/P-E8-009.md`; görev `vault/REGISTRY/T-E8-009.md`; kanıt `vault/EVIDENCE/E-DEV-096.md`. Retli T005a PR97 ayrı dalda korunur, T005b önkoşulu karşılanmadı; bu sınıflandırma bunları kapatmaz. Boş public_contracts yeni runtime sözleşmesi eklenmediğini, supersedes boşluğu mevcut kaynak veya yetkinin yerini almadığını belirtir. Yeni açıklamalar Türkçe, sabit kanonik terimler ve eski metinler korunur.

## Gerçek kaynak kabulü ve kapanış sınırı

Bağımsız `/root/e8009_measurement_bands_full_review`, sahip kabulü ve DEC-0069 kapsamında ayrı GPT-6 Luna / max ajan bağlamında `37c18cf2eff1c927a5cfc014bf2d09faf56ecb43` kaynağına **FULL PASS** verdi; bulgu yok. Bütün kanonik T-E8-009 kabulü değerlendirildi. Kabul satırı sınıflandırmayı ister; gerçek ürün uygulaması bu görevin kabul koşulu değildir. Dokuz zorunlu yön kalemi, altı ertelenebilir, her biri ayrı amaç/gizlilik gerekçesi gerektiren beş isteğe bağlı, yedi ölçekle tetiklenen kalem tüm bileşik nitelikleriyle korunur. Dokuzuncu kesinti bağımsızlığı ayrı; gerçek T-E8-010 deneyi HELD.

İncelemeci sabit plan fa914f013fdcd032faed876689092da245989459, kaynak ve taban başlıklarını, temiz çalışma alanını, 14 pack alanını, 12 kaynak özetini, tam 11 izinli yolu, kaynak uyumunu ve kayıt durumlarını bağımsız okuma/özet hesaplama ile doğruladı. Profil LF özeti 9fc973918a0f31ada8d04cd7e1598a13564c7b8325faa5850a0bd575f56b6983. Ham v62 arşivi 188857 bayt, SHA256 a7cfe8e0543f46eb79d59ed8aaca09f6985ba1df9c03f00b8a00a9a7d8b4c1e6; taban Git blobuyla bayt eşit. Önceki E-DEV-094 birincil alanları korunmuş, PR96 ikincil makbuzu ayrı. Yeni runtime sözleşmesi veya yetki bağlantısı yok. İncelemeci dosya değiştirmedi; test, CI veya ağ işlemi yapmadı. Yazar kontrolleri ayrı kanıttır: 12 kontrol + 42 regresyon (0.407 s), build 88 REVIEW, tam kaynak cümlesi ve 9/6/5/7 satır karşılaştırması başarılı.

Ana ajan aynı kaynak başlığında gerçek **15/15 SUCCESS** GitHub CI sonucunu doğruladı. Etiketli mimari çalışması 37168845301: T3 işi 111337441371 beş başarılı adım, checks işi 111337441547 yedi başarılı adım. İlk opened çalışması 37168838676: checks 111337420966 başarılı; T3 111337421504 atlanmış ve adım yok; bu atlama kabul yerine kullanılmadı. E4 çalışması 37168838744 gerçek logunda 170 test 0.168 s; E9 çalışması 37168838700 gerçek logunda 9 test 0.001 s başarılı. İlk sonuç okumasında giriş testi sürüyordu; sonraki okumada 15 çalışma tamamlanmış ve başarılıydı. Bu bekleme test başarısızlığı değildir.

Kaynak çalışmalar:
- 37168845301 architecture-checks pull_request SUCCESS
- 37168838700 e9-bounded-proposal-tests pull_request SUCCESS
- 37168838744 e4-offline-composition-tests pull_request SUCCESS
- 37168838669 e6-release-policy-tests pull_request SUCCESS
- 37168838673 e5-current-authority-tests pull_request SUCCESS
- 37168838676 architecture-checks pull_request SUCCESS
- 37168838662 e3-commit-authorization-tests pull_request SUCCESS
- 37168838721 e3-live-auth-tests pull_request SUCCESS
- 37168817722 e6-release-policy-tests push SUCCESS
- 37168817743 architecture-checks push SUCCESS
- 37168817693 e5-current-authority-tests push SUCCESS
- 37168817726 e3-commit-authorization-tests push SUCCESS
- 37168817679 e4-offline-composition-tests push SUCCESS
- 37168817691 e9-bounded-proposal-tests push SUCCESS
- 37168817673 e3-live-auth-tests push SUCCESS

Kaynak pack IN_PROGRESS, görev/profil REVIEW durumundaydı. Bu sınırlı kapanış bağımsız kaynak kabulünü kaydeder: profil ACTIVE, pack/görev DONE, türetilmiş graph DONE. **Son kapanış başlığının bağımsız kayıt incelemesi ve aynı başlık CI/T3 sonucu henüz bekleniyor; bunlar tamamlanmadan birleştirme yok.** Kaynak CI son CI yerine kullanılmaz. Geçmişteki bekleniyor ifadeleri yazıldıkları anı anlatır.

Gerçek analitik uygulaması, SDK, sağlayıcı, olay şeması, gizlilik gerekçeleri, sınıf başına amaç/saklama yolu, kesinti bağımsızlığı ve temiz geçiş kanıtı HELD. Kanonik kayıt E3 sahipliğinde, E8 türetir, E2 gösterir; korumalı denetim analitik dışında kalır. PR97/T-E8-005a reddi, T005b önkoşulu ve T006–T008 ürün eksikleri kapanmaz. E3R1 REVIEW, E5-003 IN_PROGRESS ve PR47/57/59 engelleri korunur. Hiçbir ücretli seçim, hesap, canlı veri değişikliği veya ürün yayın yetkisi verilmedi.
