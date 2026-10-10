---
record_id: V-E1-COST-001
version: 1
purpose: Kaynaklı maliyet ayrımını ve dahil olmayan giderleri karar vermeden sunmak
domain: cost-split
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, ADR-008, ADR-014, C1.2, F1.2.2, FL1.2.2, SCR-010, BR-063, BR-064, BR-007, CON-004, R-001, R-003, R-004, R-007, R-009, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: cost-split-presentation
tasks: [T-E1-019a]
tests: [modules/e01-app/internal/shell/test/cost_split_test.dart, modules/e01-app/internal/shell/test/guide_discovery_test.dart, modules/e01-app/internal/shell/test/duration_range_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-10
depends_on: [M-E1-001, M-E3-001, V-E1-DISCOVERY-001, V-E1-RANGE-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E1-019a, T-E1-019a, E-DEV-118]
evidence: [E-DEV-118]
supersedes: []
status: REVIEW
---

# Kaynaklı maliyet ayrımı — sınırlı SCR010 sunumu

Planfa914f013fdcd032faed876689092da245989459, T-E1-019a/BR063064/C1.2/F1.2.2/FL1.2.2 REVIEW doğrulama yöntemi. T018 gerçekDONE/PR119 normalmerge BASEb9cb56529fece0b84e2901294a79b4d0de3e5f7a; fetched tree=FINAL ve ana8 doğrulandı. Gerçek106 sınırlıDONE/100kalan/206; bu aday sayımı ilerletmez. `vault/PACKS/P-E1-019a.md`; `vault/EVIDENCE/E-DEV-118.md`.

## Kaynak ve ürün sınırı

Approved SCREEN_COVERAGE_TRACEABILITY BR063064→010011. Maliyet mevcut SCR010 rehber kapsamı içinde isteğe bağlı salt bilgi altbölümüdür; D02 scope/bilgi/fit/trust ve DP01/02/06/13/14 hiyerarşisi korunur. Ayrı SCR-TBD onaysız/HELD, fiyat feed/üreticisi HELD. Yeni ekran/route/tab/modal/picker/catalog/token/ikon yok. E1 renders/E3serves/E5authorizes; bu görev kaynağı doğrulamaz, ödeme başlatmaz, maliyet hesaplamaz ve bakım izni vermez. current/confirmed boolları çağıran sunum beyanıdır; üretim otoritesi değildir.

CostSplitSource aynı motosiklet/rehber/contextRevision/docRevision ve çağıranın DurationExperience id/revision/label bağlamındadır. Scope eksik/eski/busy/error; offline veya yanlış/eski/onaysız kaynakta tutarlar ve kaynağın hariç/varsayım/tarih bilgisi gizlenir. Kaynaklı ready durumunda dört kalem Parça/Sarf malzemesi/Alet/İşçilik ayrı görünür. Eksik kalem null ve bilinmiyor; yalnız açık kaynak sıfırı sıfırdır. Kaynak tamsayı alt/üst minor tutarlar negatif/ters olamaz; nokta veya aralık yalnız kaynaktan gelir. Para birimi ve0..6ondalık hassasiyet çağıranın girdisidir; string biçimleme ile korunur, float/kur çevrimi/toplamlama/tahmin hesabı yok. Yeni fiyat hassasiyeti/para standardı otoritesi verilmez; üretim payload doğrulaması ayrı kaynaktır.

Fiyat/kontrol tarihi gerçek YYYY-MM-DD takvim günü ve fiyat tarihi<=kontrol tarihi; kaynağın adı/sürümü/docrev/birim boş olamaz. Bugün damgası eklenmez. Kalem haritası/hariçler/varsayımlar kopyalanır ve değiştirilemez; dış çağıranın sonradan mutasyonu kabul edilmiş görüntüyü değiştirmez. Loading/failed/held/unknown/ready-without-amounts tahmin veya tamamlanmaya dönüştürülmez. Eksik hariçler tüm giderler dahil olmaz; açık boş hariç listesi de kapsama garantisi değildir. Kaynak varsayımları varsa aynen görünür, eksikse bilinmiyor; T019b ayrıntılı varsayım/no-fabrication kabulü ayrı görevdir. BR064 kısıtı şimdiden uygulanır, T019b DONE iddiası yok.

Fixture tutarları açık örnek etiketiyle gösterilir. Kesin fiyat/toplam/ödeme sözü/uygunluk/hazırlık/fiziksel izin yok; okumak hesap gerektirmez. GuideScopePreview yalnız opsiyonel cost/import ekler; duration/null varsayılanı ve mevcut fit/preparation koşulları değişmez. Kaynaklı süre maliyet yokluğunu doldurmaz; maliyet süre/fit kanıtı olmaz. Yeni test mevcut değişmemiş duration_range_test yardımcı harness'ını yeniden kullanır; eski main çağrılmaz, eski415 test gerçekten çalışır, çift sayılmaz.

## Gerçek yerel doğrulama

Koddan önced055111f582e459ef049666940e6378fce5dadc1 tam15/sabit20 ve97BASELFpin sabitlendi. Target-r1 12PASS. Full normal427=415korunan+12yeni PASS;44format0/analyze0. Ayrı native1PASS normal427 toplamına eklenmez.22durum×320390768×scale1/2/3=198 gerçek tamkaydırma; sonTopluluk hit/fatalpointer/52/shell5. Validfit yalnız mevcut gerçek kanıt fixture'ından, güncel ve eksik maliyet için TabEnterSpace/2pxmavi focus/contrast>=3/text>=4.5 gerçek widget ve dörtcontextcallback doğrulandı; maliyet tekbaşına hazırlık alanı açamaz.

Native 65PNG/34benzersiz/31byteeşalias,22durum390×844 tamkaydırma. RAW boyut/SHA/IHDR/offset-end/bayt alias eşliği doğrulandı. Root gerçek görsel açma ve geçmişsiz ilk ekran okuması henüz kaydedilmedi. Bu yerel test bağımsız kabul değildir; bütün SOURCE/aynıCI-T3/FINAL6freshreviewCI/normalmerge/main8 henüz gerekir.

## Yedi tasarım karşılaştırması ve kapanış

Tam ekran: rehber/motor/kapsam/opsiyonel süre/maliyet/fit/shell5; crop-only değil. Komşu: null cost varsayılanı ve süre birlikte, mevcut hiyerarşi ve doğal default karşılaştırması henüz bağımsız okunmadı. Durum:22pozitif/partial/unknown/loading/error/held/missing/offline/stale/long/default. Duyarlı:198 tamkaydırma. Erişilebilirlik: header/liveRegion, mevcut fit gerçek klavye/focus/kontrast/52. Kanonik: approved D02/SCR010 ve mevcut20başlık16metin20pad8gap, workingDNA nonfinaltoken. Regresyon:415korunan/97BASEpin/tam15/RAWv84/index110repro bekleniyor. D02 orijinal RAW941×1672 SHAde9487dbcd342f9c29dfb890560ada92efa6a178193cbc8daf26531552836f2c önceki görevde Root gerçekten açtı; yeni alanla karşılaştırma henüz gerekir.

V-E10-CLOSE001 templates/CLOSURE_MATRIX_TEMPLATE.md10katman task ≠feature/flow/designfinal/production/release. E3R1 REVIEW/E5IN_PROGRESS/PR47/57/59/RET97/kimlik/fiyatfeed/router/physical/human/device/OSassistive/finaltokens/window/release HELD; ayrı genel devir template eksikse MISSING. Ortak körnokta eski kalem/hariç liste bütünlüğü veya price==permission karışması, ayrı incelemede denetlenir. `vault/PACKS/P-E1-019a.md`; `vault/EVIDENCE/E-DEV-118.md`.

## Gerçek Root görsel okuması

Root approved D02 orijinalini ve34farklı doğal Flutter PNG orijinalini gerçekten açtı. Diğer31alias tamRAW boyut/SHA/bayt eşliğiyle kapsandı, ayrı ekran açımı sayılmadı. 65parça22durum/fullscroll;198responsive/427normal PASS. Dört kaynaklı kalem ve kaynak sıfırı ayrı; partial bilinmiyor, unknown/loading/error/held/offline/stale kaynak kapalı. Hariçler null/boş/uzun koşulları görünür, tüm giderler dahil garantisi yok. Süre+maliyet birlikte ve nullcost önceki süre alanı yan yana hiyerarşi karşılaştırıldı; aynı çalışma typography/shell korunur. D02 daha yüksek görsel sadakatli referanstır; bu mevcut görevin semantik kaynak karşılaştırmasıdır, finaltoken/pixel-eşlik/üretim/insan/cihaz/release kabulü değildir. Sabit20 bağımsız ilk okuma ve bütün inceleme henüz gerekir. `vault/PACKS/P-E1-019a.md`; `vault/EVIDENCE/E-DEV-118.md`.

## Gerçek indeks sayımı düzeltmesi

Kod öncesi d055111 kaydındaki113satır beklentisi yanlıştı: registry yalnız görev satırlarını içeriyor, dört yeni kayıt türünün tümünü satır saymıyor. Gerçek build-index110satır üretti (önceki109 + T019a). Önceki tahmin özgün precode Git geçmişinde korunur; güncel113iddiası geri çekilir ve110kullanılır. Ürün kapsamı/tam15/sabit20/97BASEpin değişmez. İlk graph-r1 gerçek12kontrol42test/worst0, indeks üretimi ve routing başarıyla koştu; bu testin eski113öngörüsünü doğruladığı iddia edilmez. Gerçek106DONE100kalan206; bağımsız ilk okuma/bütün inceleme/exactCI henüz gerekir. `vault/PACKS/P-E1-019a.md`; `vault/EVIDENCE/E-DEV-118.md`.
