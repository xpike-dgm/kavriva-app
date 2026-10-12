---
record_id: V-E1-SPONSOR-001
version: 1
purpose: Sponsor bilgisini açık göstermek ve diğer seçenekleri gizlememek
domain: commercial-disclosure
module: e01-app
owner: E1
implements: [ADR-001, ADR-008, ADR-014, C1.9, F1.9.2, FL1.9.2, SCR-010, BR-070, BR-071, BR-073, R-001, R-003, R-004, R-007, R-009, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: sponsored-marking-presentation
tasks: [T-E1-020]
tests: [modules/e01-app/internal/shell/test/sponsored_marking_test.dart, modules/e01-app/internal/shell/test/guide_discovery_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-12
depends_on: [M-E1-001, M-E3-001, V-E1-DISCOVERY-001, V-E1-SHELL-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E1-020, T-E1-020, E-DEV-120]
evidence: [E-DEV-120]
supersedes: []
status: REVIEW
---

# Sponsor işaretleme — mevcut rehberde sınırlı sunum

Plan fa914f013fdcd032faed876689092da245989459; BASE dce9dddfb4eeaf4b434a1f909d4fd3b59a29adeb; PRECODE c3a12f19678cde3e4c64659103c9c25c66544e7a. T-E1-020, C1.9/F1.9.2/FL1.9.2 ve BR070071073. T001 gerçek DONE; PR121 olağan merge ve ana sekiz başarılı. Gerçek 108 sınırlı DONE / 98 kalan / 206; bu aday sayacı ilerletmez. `vault/PACKS/P-E1-020.md`; `vault/EVIDENCE/E-DEV-120.md`.

## Kaynak, tasarım ve ürün sınırı

Approved SCREEN_COVERAGE J012/BR070073 ticari tarafsızlığı mevcut görev/destek yüzeylerine bağlar; pazar anasayfası icat etmez. SCR010/REF-GUIDE001D02/FAM02 mevcut rehber kapsamında fit bölümünden sonra isteğe bağlı salt metin açıklaması gelir. Kaynak türevli yardımcı içerik D02 resminde çizilmez; bu onaylı yeni ekran veya piksel eşliği değildir. Mevcut Text/Column/Padding/Semantics düzeni yeniden kullanılır, yeni pattern/catalog/token/ikon/seam yok. Önceki maliyetin fit öncesi konumu D02den farklıdır; bu görev onu değiştirmez. Ayrı SCR-TBD/flow ve tam tasarım kabulü HELD.

Her kaynak seçeneği sponsorlu/ücretli reklam veya kaynağa göre sponsor yok etiketiyle birlikte okunur. Durum bilinmiyorsa reklamsız sayılmaz, adı/ticari ayrıntısı gizlenir; kaynakça bildirilen diğer seçenekler görünür kalır. Listede yer almak en iyi teknik seçim, doğrulama veya garanti değildir. Liste bütün pazarı temsil etmez; null seçenek bilgisi verilmemiş, boş liste o kaynakta kayıt yok anlamındadır; ikisi alternatif yok diye yorumlanmaz. Sponsor bilgisi ödeme/bakım/fit izni değiştirmez; satın alma veya servis rezervasyonu eylemi yok. Okumak hesap gerektirmez.

E1 sadece çağıranın kaynağını sunar. current/confirmed/source/sponsor enum değerleri üretim doğrulayıcı değildir. Kaynağın adı/sürümü/kontrol tarihi aynen girilir; bugün tarihi, sponsor kararı, satıcı veya fiyat üretilmez. Scope eksik/eski/busy/error, kaynak yanlış motor/guide/contextRevision, eski/onaysız/eksik, loading/failed/HELD/offline olduğunda eski ticari adlar gizlenir. Kaynağın verdiği sıra ve bütün bilinen alternatifler korunur; ranking/analytics algoritması yok. T021 tam sıralama duvarı ayrı görevdir.

## Gerçek yerel doğrulama

Target10 PASS; full447 = korunmuş437 + yeni10 PASS. Format47 dosya/0 değişiklik; analyze0 sorun. İlk native-r1 font yolu eksik olduğundan FAIL; özgün log ve başarısız görsel saklanır ve kabul edilen PNG sayılmaz. Doğru mevcut engine/src Roboto fontuyla native-r2 ayrı10+1capture=11 PASS normal447ye eklenmez. Gerçek parent motosiklet değişiminde eski liste gizlenir, yeni kaynak yalnız yeni bağlamda görünür. Immutable list, çift/boş kimlik/kaynak reddi; sponsor/unknown/null/empty ve yanlış kaynak karşı örnekleri doğrulandı. Null opsiyonel alan eski rehberi korur. Sponsor hiçbir fit/izin callback üretmez; mevcut doğrulanmış fit için yalnız aynı hedefe Tab/Enter/Space iki callback, 2px focus, focus kontrast>=3, metin>=4.5 test edildi.

20 durum × 320/390/768 × ölçek1/2/3 =180 gerçek tam kaydırma: fatalpointer,52px hedef, beş kabuk etiketi ve son Topluluk hit kontrolü. Native20durum390×844: 43PNG/19benzersiz/24bayt eş alias. RAWboyut/SHA/IHDR/offset-end ve aliasbyteeşliği doğrulandı. Root doğal görselleri ve bağımsız ilk okumayı henüz tamamlamadı; yerel PASS bağımsız kabul değildir.

## Yedi tasarım karşılaştırması

Tam ekran: scope/fit sonra kaynak destek alanı, beş sekme; crop-only değil. Komşu: önceki null varsayılan ve mevcut fit/rehber; katalog veya yeni route yok. Durum:20 veri/eksik/unknown/error/held/offline/bağlam/uzun/default. Duyarlı:180 tamkaydırma; final breakpoint ve cihaz HELD. Erişilebilirlik: gerçek headless klavye/odak/metin/semantics; insan/assistive/device HELD. Kanonik: SCR010/D02/DP01/02/06/13/14 ve approved J012; yeni ticari yardımcı alan kaynak türevi, tam görsel referans eşliği değil. Regresyon:437 korunmuş test/113BASEpin/15yol/RAWv86 snapshot, inventoryv87 ve index112 için graph kapısı beklenir. Root doğal karşılaştırma ve geçmişsiz sabit20 okuması ayrıca gerekir.

## On kapanış katmanı

|katman|sonuç/sınır|
|---|---|
|task|T020 yerel aday, bağımsız ilk/bütün/FINAL ve CI bekler|
|feature|F1.9.2 sponsor sunum dilimi; T021 ve gerçek feed HELD|
|flow|FL1.9.2 PROPOSED, SCR-TBD onaysız; mevcut SCR010 yardımcı alan dışında flow kabulü yok|
|requirement|BR070071073 negatif sunum testleri; gerçek sponsorluk doğrulaması değil|
|design|yedi bounded karşılaştırma, tam resim/piksel/token/device kabulü HELD|
|architecture|E1 render, E3 serve, E5 authorize değişmez; seam/YAML/public contract yok|
|data/migration|schema yok, list snapshot immutable, eski kayıtlar korunur|
|release|yerel yalnız, samehead SOURCE/FINAL CI ve olağan merge/main8 gerekir; yayın HELD|
|product scenario|20 açık örnek, gerçek satıcı/teklif/ödeme/servis senaryosu değil|
|gap audit|T021/feed/SCR-TBD/production/router/physical/human/device/release açık HELD|

E3R1 REVIEW/E5 IN_PROGRESS ve47/57/59/RET97/productionidentity/feed/analytics/router/physical/finaltokens/releaseHELD korunur. Ortak kör nokta bilinmeyen sponsorun reklamsız, tek sponsorun bütün alternatifler veya etikete teknik doğrulama denmesidir; bağımsız reviewer denetler.

## Gerçek mimari tekrar kontrolü

Doğru --plan-root ile code-graph-r2:42 test başarılı, bütün12kontrol worst exit0; gerçek index112 ve routingT020REVIEW. İlk desteklenmeyen --ci komutFAIL özgün olarak korunur. Bu yerel kontrol bağımsız kabul değildir.

## Root gerçek görsel kontrolü ve bağımsız ilk okuma

Root19benzersiz doğalPNG ve approvedD02 gerçekten açtı;43RAW/24bayteşalias/20durum tamkaydırma. Fit önce, yardımcı reklam bilgisi sonra; bütün metinler ve kabuk5 okunur. Kenarda kısmen görünen satırlar komşu kaydırma parçasında tam okunur; kalıcı taşma gözlenmedi. D02 bu yardımcı kaynak metnini çizmez, tam pixel/order/device kabulü iddia edilmez.

Geçmişsiz /root/e1020_blind_r1, istenen gpt-6-luna/max, yalnız sabit20soru ve doğal43PNG/20durum makbuzu aldı. Tam özgün rapor Root tarafından okundu ve byte/SHA doğrulandı;20anlam için dar PASS. Kod 8911f7ba6bd5bfe193aa77f245a3de10d6c682d7; özgün6217bayt/SHA256 3359b530aedf11e925067c4596fa0766316dc31389b4c99f0afd6ff505f36be2. Gerçek insan/cihaz/üretim kabulü değildir. Yerel447/47format0/analyze0/42graphworst0/180tamkaydırma/native11; tam15/113BASEpin/RAWv86snapshot/index112 korunur. İlk native font yolu FAIL ve desteklenmeyen --ci komutFAIL saklanmıştır. Bütün SOURCE ve aynı gerçek CI-T3/FINAL6 taze review-CI/olağanmerge-main8 gerekir; gerçek108/98/206 değişmez.
