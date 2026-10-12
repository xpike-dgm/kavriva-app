---
test_id: E-DEV-120
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
depends_on: [V-E1-SPONSOR-001]
used_by: [V-E1-SPONSOR-001, P-E1-020, T-E1-020]
evidence: []
supersedes: []
status: RECORDED

contract_id_version: "C1.9 F1.9.2 FL1.9.2 BR070071073 v1 REVIEW validation method"
subject_file: modules/e01-app/internal/shell/lib/sponsored_marking.dart
subject_digest: 9971fe5564ef3522a257c289fd0c53b7315b756288c083369eff0b530547df56
result: "Bağımsız bütün SOURCE PASS; ayrı FINAL kabulü bekleniyor"
gate_verdict: "PASS sınırlı sponsor sunumu; üretim kapıları HELD"
reviewer: "/root/e1020_source_whole_review; requested gpt-6-luna/max"
timestamp: 2026-10-12
evidence_links: [vault/PROFILES/sponsored-marking-render.md, vault/PACKS/P-E1-020.md, vault/REGISTRY/T-E1-020.md, vault/EVIDENCE/E-DEV-120.md, vault/EVIDENCE/E-DEV-119.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-119-E10-GOVERNED-PATHS-FOR-T-E1-020.md.snapshot, modules/e01-app/internal/shell/lib/guide_discovery.dart, modules/e01-app/internal/shell/lib/sponsored_marking.dart, modules/e01-app/internal/shell/test/sponsored_marking_test.dart, modules/e01-app/internal/shell/test/fixtures/sponsored_marking_reading_questions.json]
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

## RAW makbuzlar

modules/e01-app/internal/shell/lib/guide_discovery.dart LF SHA256 4b5f681a939aa850f44093e351807840c1efd17c6e6fb9b6bb71454fd46b4d1f.

modules/e01-app/internal/shell/lib/sponsored_marking.dart LF SHA256 9971fe5564ef3522a257c289fd0c53b7315b756288c083369eff0b530547df56.

modules/e01-app/internal/shell/test/sponsored_marking_test.dart LF SHA256 7fe04ba2d2070d23befc5806f6cb465c97aeede9c7ccc8bca1b94e21452568f3.

modules/e01-app/internal/shell/test/fixtures/sponsored_marking_reading_questions.json LF SHA256 8e635f2acff46b1af68c9bfb04d6f34656691e65447b9de8c663c401c4c7d7af.

C:\Users\Xpike\.codex\task-state\kavriva-e1020\target-r1.log RAW 1129 SHA256 ed783d13ba0d42e03cf99db5574a43dbeffed4e9f9ca39d88439076ce493c3fc.

C:\Users\Xpike\.codex\task-state\kavriva-e1020\full-r1.log RAW 105627 SHA256 05949779a5ecdfb4ac34b88bcce37708a6f7cf76d568d877fe8541a8112ab070.

C:\Users\Xpike\.codex\task-state\kavriva-e1020\format-r1.log RAW 49 SHA256 7e3d7ade979176a43ab8255959d0ec8910c4ad49989f691b0b951ceaec6ec4db.

C:\Users\Xpike\.codex\task-state\kavriva-e1020\analyze-r1.log RAW 98 SHA256 17e48529e24b3dff9fc17902c8296adbd87f196e206379785c3631b15ac5b495.

C:\Users\Xpike\.codex\task-state\kavriva-e1020\native-r1.log RAW 3394 SHA256 86925a8420e30165251d49269cf2271eaaf89fa53dcf494dd3f7f4f310da423b.

C:\Users\Xpike\.codex\task-state\kavriva-e1020\native-r2.log RAW 1197 SHA256 31fd273b4d59d25075742eed49ed26ef03eacd89836df0a06f5e27a4b7558b01.

C:\Users\Xpike\.codex\task-state\kavriva-e1020\native-r2-manifest.txt RAW 4248 SHA256 15b5be6a57b3020d6d091c4fd9b857fe9220cdf2e1159ac9bec71d5241760ccd.

|durum|parça|offset/end|bayt|SHA256|RAWdosya|
|---|---|---|---|---|---|
|mixed|0|0.0/618.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-mixed-0.png|
|mixed|1|600.0/618.0|77336|5b0fa6583f842e0e06f18492c9c34718fca600735a6fb95f6090e8f0437db5ae|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-mixed-1.png|
|mixed|2|618.0/618.0|75705|2503bf51305788154c080c697543e6639757f4bcecfee94bb8c205262016291c|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-mixed-2.png|
|only-sponsored|0|0.0/572.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-only-sponsored-0.png|
|only-sponsored|1|572.0/572.0|71939|ea9a8ddfecc987afd22f0fcc08313fd6eb6773334fb86d9041430a9d3cf964c4|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-only-sponsored-1.png|
|unknown-disclosure|0|0.0/591.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-unknown-disclosure-0.png|
|unknown-disclosure|1|591.0/591.0|73540|a3c2c4add51ef2081a92b88d94a2fac2017d5487d2b1290fabd2b24099909ee2|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-unknown-disclosure-1.png|
|mixed-unknown|0|0.0/683.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-mixed-unknown-0.png|
|mixed-unknown|1|600.0/683.0|78934|43c6d5a2a9b431b56dda2faba9f5d356052c898d4bd1970976beabc7817c5cbc|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-mixed-unknown-1.png|
|mixed-unknown|2|683.0/683.0|78330|f3e862581a186deef021b9dc6577957a15f15f43dd87238636ceebc6791d7861|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-mixed-unknown-2.png|
|missing-alternatives|0|0.0/572.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-missing-alternatives-0.png|
|missing-alternatives|1|572.0/572.0|71928|2ef580b8a6200468f9fb550bc26e12891b3e8ec388e9adb081cfaed0db1dca2b|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-missing-alternatives-1.png|
|empty|0|0.0/572.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-empty-0.png|
|empty|1|572.0/572.0|71926|33f49df120f329cda367b5fb57c37d0886fb8ed5fdad71e9cec8ca3352a08845|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-empty-1.png|
|loading|0|0.0/407.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-loading-0.png|
|loading|1|407.0/407.0|70057|58282a980215fcc2e6b5d5643b1186987f40e29d75d115f603a3485b768fcd82|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-loading-1.png|
|failed|0|0.0/426.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-failed-0.png|
|failed|1|426.0/426.0|70058|3124c935b57b67f7b334571fc3caca8f82e1f164fd2915bc3dc29e76388e597f|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-failed-1.png|
|held|0|0.0/407.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-held-0.png|
|held|1|407.0/407.0|71241|1302418376e0069b5ac4b73579b98c87a12fa5c737a5964d5eb2423de9667f0c|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-held-1.png|
|missing-source|0|0.0/445.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-missing-source-0.png|
|missing-source|1|445.0/445.0|71292|c6418a6e2a0a4e1722852d438f60127a77a6784f21c646343fe885e31b593430|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-missing-source-1.png|
|offline|0|0.0/407.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-offline-0.png|
|offline|1|407.0/407.0|71652|2a85b18e9dd44560c25136835063d7e135e332101013dedbf7abc4d1e1ea4583|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-offline-1.png|
|stale|0|0.0/445.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-stale-0.png|
|stale|1|445.0/445.0|71292|c6418a6e2a0a4e1722852d438f60127a77a6784f21c646343fe885e31b593430|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-stale-1.png|
|unconfirmed|0|0.0/445.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-unconfirmed-0.png|
|unconfirmed|1|445.0/445.0|71292|c6418a6e2a0a4e1722852d438f60127a77a6784f21c646343fe885e31b593430|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-unconfirmed-1.png|
|wrong-motorcycle|0|0.0/445.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-wrong-motorcycle-0.png|
|wrong-motorcycle|1|445.0/445.0|71292|c6418a6e2a0a4e1722852d438f60127a77a6784f21c646343fe885e31b593430|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-wrong-motorcycle-1.png|
|wrong-guide|0|0.0/445.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-wrong-guide-0.png|
|wrong-guide|1|445.0/445.0|71292|c6418a6e2a0a4e1722852d438f60127a77a6784f21c646343fe885e31b593430|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-wrong-guide-1.png|
|new-revision|0|0.0/445.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-new-revision-0.png|
|new-revision|1|445.0/445.0|71292|c6418a6e2a0a4e1722852d438f60127a77a6784f21c646343fe885e31b593430|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-new-revision-1.png|
|stale-scope|0|0.0/491.0|69394|2631815c59e5677970338e4b833e9030fcc20a169e8f9713afef0daa5424ffb8|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-stale-scope-0.png|
|stale-scope|1|491.0/491.0|71292|c6418a6e2a0a4e1722852d438f60127a77a6784f21c646343fe885e31b593430|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-stale-scope-1.png|
|missing-scope|0|0.0/373.0|69453|d34e966051b683cb46edda6b3f984250b9acf084197fc79ae21cf35ccf410764|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-missing-scope-0.png|
|missing-scope|1|373.0/373.0|71292|c6418a6e2a0a4e1722852d438f60127a77a6784f21c646343fe885e31b593430|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-missing-scope-1.png|
|long|0|0.0/732.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-long-0.png|
|long|1|600.0/732.0|78032|dde8b178ece3181d11ecd11a87c4bb07155aa8a9bb4c8bb1e34634cf13b39282|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-long-1.png|
|long|2|732.0/732.0|81763|11f38de0801d574803aec6eebad71e319f2f3a965d6750bc9bd0d7dbb2f639f5|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-long-2.png|
|previous-default|0|0.0/153.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-previous-default-0.png|
|previous-default|1|153.0/153.0|63384|644e1d68c45857c5c4514e40d95c05ecc5f5dda5e0a1f3c9154b90caacd03c9b|C:/Users/Xpike/.codex/task-state/kavriva-e1020/native-r2-previous-default-1.png|

## İlk mimari komut denemesi

code-graph-r1, desteklenmeyen --ci argümanı check_links tarafından reddedildi (exit2); kod bulgusu değildir. Komut doğru --plan-root ile tekrar çalıştırılacak. Özgün RAW 7996 bayt / SHA256 2dd16c93c9acb3267f6326a80727859369383597eb575f32e4fad64c28cde2b3.

## Gerçek mimari tekrar kontrolü

Doğru --plan-root ile code-graph-r2:42 test başarılı, bütün12kontrol worst exit0; gerçek index112 ve routingT020REVIEW. İlk desteklenmeyen --ci komutFAIL özgün olarak korunur. Bu yerel kontrol bağımsız kabul değildir.

## Root gerçek görsel kontrolü ve bağımsız ilk okuma

Root19benzersiz doğalPNG ve approvedD02 gerçekten açtı;43RAW/24bayteşalias/20durum tamkaydırma. Fit önce, yardımcı reklam bilgisi sonra; bütün metinler ve kabuk5 okunur. Kenarda kısmen görünen satırlar komşu kaydırma parçasında tam okunur; kalıcı taşma gözlenmedi. D02 bu yardımcı kaynak metnini çizmez, tam pixel/order/device kabulü iddia edilmez.

Geçmişsiz /root/e1020_blind_r1, istenen gpt-6-luna/max, yalnız sabit20soru ve doğal43PNG/20durum makbuzu aldı. Tam özgün rapor Root tarafından okundu ve byte/SHA doğrulandı;20anlam için dar PASS. Kod 8911f7ba6bd5bfe193aa77f245a3de10d6c682d7; özgün6217bayt/SHA256 3359b530aedf11e925067c4596fa0766316dc31389b4c99f0afd6ff505f36be2. Gerçek insan/cihaz/üretim kabulü değildir. Yerel447/47format0/analyze0/42graphworst0/180tamkaydırma/native11; tam15/113BASEpin/RAWv86snapshot/index112 korunur. İlk native font yolu FAIL ve desteklenmeyen --ci komutFAIL saklanmıştır. Bütün SOURCE ve aynı gerçek CI-T3/FINAL6 taze review-CI/olağanmerge-main8 gerekir; gerçek108/98/206 değişmez.

## Tam özgün ilk okuma raporu

HTML yalnız okunabilir normalize gösterimdir; tam byte/SHA eşliği yalnız özgün TXT/RAWBase64 arasındadır.

<pre># Kavriva T-E1-020 ilk ekran okuması — r1

## Hüküm

**PASS — dar kapsam.** Sabit 20 sorunun tamamı, yardım almadan, doğal Flutter ekranlarında açıkça yanıtlanabiliyor. Görünür çelişki veya yanıtsız kalan bir soru bulmadım.

## Kapsam ve doğrulama

- Yalnızca native-r2-proof.json, unique-images.json, bu ikisinin işaret ettiği PNG’ler ve sponsored_marking_reading_questions.json kullanıldı. Kod, pack, plan, önceki konuşma veya cevap anahtarı okunmadı; Flutter çalıştırılmadı.
- 19 benzersiz PNG’nin tamamı view_image ile açılarak incelendi. İlk görünen ekran ile alt kaydırma parçalarını birlikte değerlendirdim.
- 43 PNG’nin her birinde gerçek bayt uzunluğu, SHA-256 ve PNG başlığındaki 390×844 boyutu kanıt kaydıyla eşleşti. 43 dosyada 19 benzersiz içerik ve 24 alias doğrulandı; alias dosyaları içerik baytları düzeyinde eşleşti.
- 20 vakanın her birinde kaydırma başlangıcı 0, son görüntü kaydırma sonu değerinde; görüntü sıraları eksiksiz. Kapsam kontrolünde sorun yok.
- Bunlar fixture için üretilmiş doğal Flutter ekranlarıdır. Gerçek kullanıcı, cihaz, satıcı, teklif veya üretim gözlemi sayılmaz.

## Sabit sorular ve ekranlardan yanıtlar

1. **Hangi seçenek reklam veya sponsor desteği içeriyor?**
   “Sponsorlu · ücretli reklam” olarak işaretlenen, kaynakta geçen sponsorlu seçenektir. Örnek görünümde adı “Örnek sponsorlu seçenek”tir.

2. **Sponsor bilgisini her seçeneğin yanında görebiliyor musun?**
   Ekranda seçeneklerin durumu seçenek bilgisiyle birlikte veriliyor: sponsorlu, kaynağa göre sponsor desteği yok veya bilinmiyor. Bilinmeyen durumda ad ve ticari ayrıntı, bilgi açıklanana kadar gösterilmiyor.

3. **Sponsor desteği olmayan seçenek nasıl belirtiliyor?**
   “Kaynağa göre sponsor desteği yok” etiketiyle belirtiliyor.

4. **Sponsor durumu bilinmiyorsa seçenek reklamsız sayılıyor mu?**
   Hayır. Ekran açıkça “Reklamsız sayılmaz” diyor; bilgi açıklanana kadar adı ve ticari ayrıntısı gösterilmiyor.

5. **Reklam bilgisinin eksik olduğu bir seçenek normal öneri gibi sunuluyor mu?**
   Hayır. Sponsor bilgisinin bilinmediği açıkça belirtiliyor; seçenek reklamsız sayılmıyor ve ticari ayrıntıları gizli tutuluyor.

6. **Diğer seçenekler nerede; yalnız sponsorlu olan mı gösteriliyor?**
   Liste “Diğer seçenekler ve reklam bilgisi” bölümünde. Ekran, kaynağın verdiği diğer seçeneklerin gizlenmediğini söylüyor. Bununla birlikte liste bütün satıcıları veya bütün alternatifleri kapsadığını iddia etmiyor; yalnız bir seçenek görünmesi başka alternatif olmadığını kanıtlamıyor.

7. **Kaynak alternatifleri vermediyse alternatif olmadığı kesin mi?**
   Hayır. “Kaynak seçenek ve alternatif bilgisini vermemiş” ifadesi, alternatif olmadığı sonucuna varılamayacağını belirtiyor.

8. **Boş seçenek listesi ne anlama geliyor?**
   Bu kaynakta kayıtlı seçenek olmadığını gösteriyor; başka alternatiflerin bulunmadığı anlamına gelmiyor.

9. **Seçeneklere bakmadan önce teknik uygunluk bilgisi nerede?**
   Seçenekler bölümünün üstündeki “Motosiklete uygunluk” bölümünde. Görünen örnekte güncel kaynak bilgisi bulunmadığı ve ayrımın henüz yeterli olmadığı da yazıyor.

10. **Sponsor desteği motosiklete uygunluğu veya bakım iznini değiştiriyor mu?**
    Hayır. Ekran sponsor desteğinin motosiklet uygunluğunu veya bakım iznini değiştirmediğini belirtiyor.

11. **Bu liste rehberin yerini alıyor mu?**
    Hayır. Önce uygunluk bilgisinin okunması isteniyor; listenin rehberin yerini almadığı açıkça yazıyor.

12. **Bir seçeneğin gösterilmesi teknik olarak en iyi olduğunu kanıtlıyor mu?**
    Hayır. Görünmesi teknik olarak en iyi olduğunu kanıtlamıyor; uzun seçenek örneği ayrıca görünmenin doğrulanmış teknik öneri veya motosiklete uygunluk anlamına gelmediğini belirtiyor.

13. **Motosiklet veya rehber değişince eski liste kullanılabilir mi?**
    Hayır. Motosiklet, rehber veya kapsam değişirse eski liste kullanılmamalı; kaynak yeniden kontrol edilmeli.

14. **Kaynak eski veya doğrulanmamışsa ne oluyor?**
    Bilgi yetersiz ya da güncelliği doğrulanmamış olarak belirtiliyor. Motosiklete özel uygulama kapalı kalıyor; gözlenebilir ayrım yeniden kontrol edilmeli ve yakın yılın adımları kullanılmamalı. Kapsam güncel değilse yeniden kontrolden önce hazırlığa geçilmemesi söyleniyor.

15. **Yükleme, hata veya çevrimdışı durumda eski liste güncelmiş gibi mi gösteriliyor?**
    Hayır. Yüklemede eski liste güncelmiş gibi gösterilmiyor; hata halinde kaynak yeniden kontrol edilmeli; kontrol beklerken güncel liste gösterilmiyor; çevrimdışıyken eski liste güncel teklif sayılmıyor.

16. **Kaynak adı, sürümü ve kontrol zamanı nerede?**
    Seçeneklerin bulunduğu durumda “Diğer seçenekler ve reklam bilgisi” bölümünde birlikte gösteriliyor: seçenek kaynağı, kaynak sürümü ve kaynak kontrol zamanı. Örnek değerler “Örnek gösterim”, “ticari-kaynak-r1” ve “2026-10-12”.

17. **Bu örnekler gerçek satıcı, teklif veya doğrulanmış fiyat mı?**
    Hayır. Kaynak satırı bunun örnek gösterim olduğunu ve gerçek satıcı veya teklif olmadığını söylüyor. Ekranlarda fiyat yer almıyor.

18. **Bu alanda satın alma, ödeme veya servis rezervasyonu başlatılıyor mu?**
    Hayır. Ekran bu alanda satın alma, ödeme veya servis rezervasyonu başlatılmadığını belirtiyor.

19. **Okumak hesap açmanı veya satın almanı gerektiriyor mu?**
    Hayır. Okumanın hesap veya satın alma gerektirmediği açıkça yazıyor.

20. **Alt çubukta hangi bölümler var; yeni alışveriş sekmesi var mı?**
    “Garaj”, “Bakım”, “AI Usta”, “Geçmiş” ve “Topluluk” bölümleri var. Alışveriş sekmesi görünmüyor.

## Bulgular

Bulgu yok. Sponsorlu, sponsorluk yok ve bilinmiyor durumları; eksik veya boş alternatif bilgisi; kapsam/güncellik; yükleme, hata ve çevrimdışı durumları ekranlarda ayırt edilebiliyor.</pre>

RAWBase64: IyBLYXZyaXZhIFQtRTEtMDIwIGlsayBla3JhbiBva3VtYXPEsSDigJQgcjEKCiMjIEjDvGvDvG0KCioqUEFTUyDigJQgZGFyIGthcHNhbS4qKiBTYWJpdCAyMCBzb3J1bnVuIHRhbWFtxLEsIHlhcmTEsW0gYWxtYWRhbiwgZG/En2FsIEZsdXR0ZXIgZWtyYW5sYXLEsW5kYSBhw6fEsWvDp2EgeWFuxLF0bGFuYWJpbGl5b3IuIEfDtnLDvG7DvHIgw6dlbGnFn2tpIHZleWEgeWFuxLF0c8SxeiBrYWxhbiBiaXIgc29ydSBidWxtYWTEsW0uCgojIyBLYXBzYW0gdmUgZG/En3J1bGFtYQoKLSBZYWxuxLF6Y2EgbmF0aXZlLXIyLXByb29mLmpzb24sIHVuaXF1ZS1pbWFnZXMuanNvbiwgYnUgaWtpc2luaW4gacWfYXJldCBldHRpxJ9pIFBOR+KAmWxlciB2ZSBzcG9uc29yZWRfbWFya2luZ19yZWFkaW5nX3F1ZXN0aW9ucy5qc29uIGt1bGxhbsSxbGTEsS4gS29kLCBwYWNrLCBwbGFuLCDDtm5jZWtpIGtvbnXFn21hIHZleWEgY2V2YXAgYW5haHRhcsSxIG9rdW5tYWTEsTsgRmx1dHRlciDDp2FsxLHFn3TEsXLEsWxtYWTEsS4KLSAxOSBiZW56ZXJzaXogUE5H4oCZbmluIHRhbWFtxLEgdmlld19pbWFnZSBpbGUgYcOnxLFsYXJhayBpbmNlbGVuZGkuIMSwbGsgZ8O2csO8bmVuIGVrcmFuIGlsZSBhbHQga2F5ZMSxcm1hIHBhcsOnYWxhcsSxbsSxIGJpcmxpa3RlIGRlxJ9lcmxlbmRpcmRpbS4KLSA0MyBQTkfigJluaW4gaGVyIGJpcmluZGUgZ2Vyw6dlayBiYXl0IHV6dW5sdcSfdSwgU0hBLTI1NiB2ZSBQTkcgYmHFn2zEscSfxLFuZGFraSAzOTDDlzg0NCBib3l1dHUga2FuxLF0IGtheWTEsXlsYSBlxZ9sZcWfdGkuIDQzIGRvc3lhZGEgMTkgYmVuemVyc2l6IGnDp2VyaWsgdmUgMjQgYWxpYXMgZG/En3J1bGFuZMSxOyBhbGlhcyBkb3N5YWxhcsSxIGnDp2VyaWsgYmF5dGxhcsSxIGTDvHpleWluZGUgZcWfbGXFn3RpLgotIDIwIHZha2FuxLFuIGhlciBiaXJpbmRlIGtheWTEsXJtYSBiYcWfbGFuZ8SxY8SxIDAsIHNvbiBnw7Zyw7xudMO8IGtheWTEsXJtYSBzb251IGRlxJ9lcmluZGU7IGfDtnLDvG50w7wgc8SxcmFsYXLEsSBla3Npa3Npei4gS2Fwc2FtIGtvbnRyb2zDvG5kZSBzb3J1biB5b2suCi0gQnVubGFyIGZpeHR1cmUgacOnaW4gw7xyZXRpbG1pxZ8gZG/En2FsIEZsdXR0ZXIgZWtyYW5sYXLEsWTEsXIuIEdlcsOnZWsga3VsbGFuxLFjxLEsIGNpaGF6LCBzYXTEsWPEsSwgdGVrbGlmIHZleWEgw7xyZXRpbSBnw7Z6bGVtaSBzYXnEsWxtYXouCgojIyBTYWJpdCBzb3J1bGFyIHZlIGVrcmFubGFyZGFuIHlhbsSxdGxhcgoKMS4gKipIYW5naSBzZcOnZW5layByZWtsYW0gdmV5YSBzcG9uc29yIGRlc3RlxJ9pIGnDp2VyaXlvcj8qKgogICDigJxTcG9uc29ybHUgwrcgw7xjcmV0bGkgcmVrbGFt4oCdIG9sYXJhayBpxZ9hcmV0bGVuZW4sIGtheW5ha3RhIGdlw6dlbiBzcG9uc29ybHUgc2XDp2VuZWt0aXIuIMOWcm5layBnw7Zyw7xuw7xtZGUgYWTEsSDigJzDlnJuZWsgc3BvbnNvcmx1IHNlw6dlbmVr4oCddGlyLgoKMi4gKipTcG9uc29yIGJpbGdpc2luaSBoZXIgc2XDp2VuZcSfaW4geWFuxLFuZGEgZ8O2cmViaWxpeW9yIG11c3VuPyoqCiAgIEVrcmFuZGEgc2XDp2VuZWtsZXJpbiBkdXJ1bXUgc2XDp2VuZWsgYmlsZ2lzaXlsZSBiaXJsaWt0ZSB2ZXJpbGl5b3I6IHNwb25zb3JsdSwga2F5bmHEn2EgZ8O2cmUgc3BvbnNvciBkZXN0ZcSfaSB5b2sgdmV5YSBiaWxpbm1peW9yLiBCaWxpbm1leWVuIGR1cnVtZGEgYWQgdmUgdGljYXJpIGF5csSxbnTEsSwgYmlsZ2kgYcOnxLFrbGFuYW5hIGthZGFyIGfDtnN0ZXJpbG1peW9yLgoKMy4gKipTcG9uc29yIGRlc3RlxJ9pIG9sbWF5YW4gc2XDp2VuZWsgbmFzxLFsIGJlbGlydGlsaXlvcj8qKgogICDigJxLYXluYcSfYSBnw7ZyZSBzcG9uc29yIGRlc3RlxJ9pIHlva+KAnSBldGlrZXRpeWxlIGJlbGlydGlsaXlvci4KCjQuICoqU3BvbnNvciBkdXJ1bXUgYmlsaW5taXlvcnNhIHNlw6dlbmVrIHJla2xhbXPEsXogc2F5xLFsxLF5b3IgbXU/KioKICAgSGF5xLFyLiBFa3JhbiBhw6fEsWvDp2Eg4oCcUmVrbGFtc8SxeiBzYXnEsWxtYXrigJ0gZGl5b3I7IGJpbGdpIGHDp8Sxa2xhbmFuYSBrYWRhciBhZMSxIHZlIHRpY2FyaSBheXLEsW50xLFzxLEgZ8O2c3RlcmlsbWl5b3IuCgo1LiAqKlJla2xhbSBiaWxnaXNpbmluIGVrc2lrIG9sZHXEn3UgYmlyIHNlw6dlbmVrIG5vcm1hbCDDtm5lcmkgZ2liaSBzdW51bHV5b3IgbXU/KioKICAgSGF5xLFyLiBTcG9uc29yIGJpbGdpc2luaW4gYmlsaW5tZWRpxJ9pIGHDp8Sxa8OnYSBiZWxpcnRpbGl5b3I7IHNlw6dlbmVrIHJla2xhbXPEsXogc2F5xLFsbcSxeW9yIHZlIHRpY2FyaSBheXLEsW50xLFsYXLEsSBnaXpsaSB0dXR1bHV5b3IuCgo2LiAqKkRpxJ9lciBzZcOnZW5la2xlciBuZXJlZGU7IHlhbG7EsXogc3BvbnNvcmx1IG9sYW4gbcSxIGfDtnN0ZXJpbGl5b3I/KioKICAgTGlzdGUg4oCcRGnEn2VyIHNlw6dlbmVrbGVyIHZlIHJla2xhbSBiaWxnaXNp4oCdIGLDtmzDvG3DvG5kZS4gRWtyYW4sIGtheW5hxJ/EsW4gdmVyZGnEn2kgZGnEn2VyIHNlw6dlbmVrbGVyaW4gZ2l6bGVubWVkacSfaW5pIHPDtnlsw7x5b3IuIEJ1bnVubGEgYmlybGlrdGUgbGlzdGUgYsO8dMO8biBzYXTEsWPEsWxhcsSxIHZleWEgYsO8dMO8biBhbHRlcm5hdGlmbGVyaSBrYXBzYWTEscSfxLFuxLEgaWRkaWEgZXRtaXlvcjsgeWFsbsSxeiBiaXIgc2XDp2VuZWsgZ8O2csO8bm1lc2kgYmHFn2thIGFsdGVybmF0aWYgb2xtYWTEscSfxLFuxLEga2FuxLF0bGFtxLF5b3IuCgo3LiAqKktheW5hayBhbHRlcm5hdGlmbGVyaSB2ZXJtZWRpeXNlIGFsdGVybmF0aWYgb2xtYWTEscSfxLEga2VzaW4gbWk/KioKICAgSGF5xLFyLiDigJxLYXluYWsgc2XDp2VuZWsgdmUgYWx0ZXJuYXRpZiBiaWxnaXNpbmkgdmVybWVtacWf4oCdIGlmYWRlc2ksIGFsdGVybmF0aWYgb2xtYWTEscSfxLEgc29udWN1bmEgdmFyxLFsYW1heWFjYcSfxLFuxLEgYmVsaXJ0aXlvci4KCjguICoqQm/FnyBzZcOnZW5layBsaXN0ZXNpIG5lIGFubGFtYSBnZWxpeW9yPyoqCiAgIEJ1IGtheW5ha3RhIGthecSxdGzEsSBzZcOnZW5layBvbG1hZMSxxJ/EsW7EsSBnw7ZzdGVyaXlvcjsgYmHFn2thIGFsdGVybmF0aWZsZXJpbiBidWx1bm1hZMSxxJ/EsSBhbmxhbcSxbmEgZ2VsbWl5b3IuCgo5LiAqKlNlw6dlbmVrbGVyZSBiYWttYWRhbiDDtm5jZSB0ZWtuaWsgdXlndW5sdWsgYmlsZ2lzaSBuZXJlZGU/KioKICAgU2XDp2VuZWtsZXIgYsO2bMO8bcO8bsO8biDDvHN0w7xuZGVraSDigJxNb3Rvc2lrbGV0ZSB1eWd1bmx1a+KAnSBiw7Zsw7xtw7xuZGUuIEfDtnLDvG5lbiDDtnJuZWt0ZSBnw7xuY2VsIGtheW5hayBiaWxnaXNpIGJ1bHVubWFkxLHEn8SxIHZlIGF5csSxbcSxbiBoZW7DvHogeWV0ZXJsaSBvbG1hZMSxxJ/EsSBkYSB5YXrEsXlvci4KCjEwLiAqKlNwb25zb3IgZGVzdGXEn2kgbW90b3Npa2xldGUgdXlndW5sdcSfdSB2ZXlhIGJha8SxbSBpem5pbmkgZGXEn2nFn3Rpcml5b3IgbXU/KioKICAgIEhhecSxci4gRWtyYW4gc3BvbnNvciBkZXN0ZcSfaW5pbiBtb3Rvc2lrbGV0IHV5Z3VubHXEn3VudSB2ZXlhIGJha8SxbSBpem5pbmkgZGXEn2nFn3Rpcm1lZGnEn2luaSBiZWxpcnRpeW9yLgoKMTEuICoqQnUgbGlzdGUgcmVoYmVyaW4geWVyaW5pIGFsxLF5b3IgbXU/KioKICAgIEhhecSxci4gw5ZuY2UgdXlndW5sdWsgYmlsZ2lzaW5pbiBva3VubWFzxLEgaXN0ZW5peW9yOyBsaXN0ZW5pbiByZWhiZXJpbiB5ZXJpbmkgYWxtYWTEscSfxLEgYcOnxLFrw6dhIHlhesSxeW9yLgoKMTIuICoqQmlyIHNlw6dlbmXEn2luIGfDtnN0ZXJpbG1lc2kgdGVrbmlrIG9sYXJhayBlbiBpeWkgb2xkdcSfdW51IGthbsSxdGzEsXlvciBtdT8qKgogICAgSGF5xLFyLiBHw7Zyw7xubWVzaSB0ZWtuaWsgb2xhcmFrIGVuIGl5aSBvbGR1xJ91bnUga2FuxLF0bGFtxLF5b3I7IHV6dW4gc2XDp2VuZWsgw7ZybmXEn2kgYXlyxLFjYSBnw7Zyw7xubWVuaW4gZG/En3J1bGFubcSxxZ8gdGVrbmlrIMO2bmVyaSB2ZXlhIG1vdG9zaWtsZXRlIHV5Z3VubHVrIGFubGFtxLFuYSBnZWxtZWRpxJ9pbmkgYmVsaXJ0aXlvci4KCjEzLiAqKk1vdG9zaWtsZXQgdmV5YSByZWhiZXIgZGXEn2nFn2luY2UgZXNraSBsaXN0ZSBrdWxsYW7EsWxhYmlsaXIgbWk/KioKICAgIEhhecSxci4gTW90b3Npa2xldCwgcmVoYmVyIHZleWEga2Fwc2FtIGRlxJ9pxZ9pcnNlIGVza2kgbGlzdGUga3VsbGFuxLFsbWFtYWzEsTsga2F5bmFrIHllbmlkZW4ga29udHJvbCBlZGlsbWVsaS4KCjE0LiAqKktheW5hayBlc2tpIHZleWEgZG/En3J1bGFubWFtxLHFn3NhIG5lIG9sdXlvcj8qKgogICAgQmlsZ2kgeWV0ZXJzaXogeWEgZGEgZ8O8bmNlbGxpxJ9pIGRvxJ9ydWxhbm1hbcSxxZ8gb2xhcmFrIGJlbGlydGlsaXlvci4gTW90b3Npa2xldGUgw7Z6ZWwgdXlndWxhbWEga2FwYWzEsSBrYWzEsXlvcjsgZ8O2emxlbmViaWxpciBheXLEsW0geWVuaWRlbiBrb250cm9sIGVkaWxtZWxpIHZlIHlha8SxbiB5xLFsxLFuIGFkxLFtbGFyxLEga3VsbGFuxLFsbWFtYWzEsS4gS2Fwc2FtIGfDvG5jZWwgZGXEn2lsc2UgeWVuaWRlbiBrb250cm9sZGVuIMO2bmNlIGhhesSxcmzEscSfYSBnZcOnaWxtZW1lc2kgc8O2eWxlbml5b3IuCgoxNS4gKipZw7xrbGVtZSwgaGF0YSB2ZXlhIMOnZXZyaW1kxLHFn8SxIGR1cnVtZGEgZXNraSBsaXN0ZSBnw7xuY2VsbWnFnyBnaWJpIG1pIGfDtnN0ZXJpbGl5b3I/KioKICAgIEhhecSxci4gWcO8a2xlbWVkZSBlc2tpIGxpc3RlIGfDvG5jZWxtacWfIGdpYmkgZ8O2c3RlcmlsbWl5b3I7IGhhdGEgaGFsaW5kZSBrYXluYWsgeWVuaWRlbiBrb250cm9sIGVkaWxtZWxpOyBrb250cm9sIGJla2xlcmtlbiBnw7xuY2VsIGxpc3RlIGfDtnN0ZXJpbG1peW9yOyDDp2V2cmltZMSxxZ/EsXlrZW4gZXNraSBsaXN0ZSBnw7xuY2VsIHRla2xpZiBzYXnEsWxtxLF5b3IuCgoxNi4gKipLYXluYWsgYWTEsSwgc8O8csO8bcO8IHZlIGtvbnRyb2wgemFtYW7EsSBuZXJlZGU/KioKICAgIFNlw6dlbmVrbGVyaW4gYnVsdW5kdcSfdSBkdXJ1bWRhIOKAnERpxJ9lciBzZcOnZW5la2xlciB2ZSByZWtsYW0gYmlsZ2lzaeKAnSBiw7Zsw7xtw7xuZGUgYmlybGlrdGUgZ8O2c3RlcmlsaXlvcjogc2XDp2VuZWsga2F5bmHEn8SxLCBrYXluYWsgc8O8csO8bcO8IHZlIGtheW5hayBrb250cm9sIHphbWFuxLEuIMOWcm5layBkZcSfZXJsZXIg4oCcw5ZybmVrIGfDtnN0ZXJpbeKAnSwg4oCcdGljYXJpLWtheW5hay1yMeKAnSB2ZSDigJwyMDI2LTEwLTEy4oCdLgoKMTcuICoqQnUgw7ZybmVrbGVyIGdlcsOnZWsgc2F0xLFjxLEsIHRla2xpZiB2ZXlhIGRvxJ9ydWxhbm3EscWfIGZpeWF0IG3EsT8qKgogICAgSGF5xLFyLiBLYXluYWsgc2F0xLFyxLEgYnVudW4gw7ZybmVrIGfDtnN0ZXJpbSBvbGR1xJ91bnUgdmUgZ2Vyw6dlayBzYXTEsWPEsSB2ZXlhIHRla2xpZiBvbG1hZMSxxJ/EsW7EsSBzw7Z5bMO8eW9yLiBFa3JhbmxhcmRhIGZpeWF0IHllciBhbG3EsXlvci4KCjE4LiAqKkJ1IGFsYW5kYSBzYXTEsW4gYWxtYSwgw7ZkZW1lIHZleWEgc2VydmlzIHJlemVydmFzeW9udSBiYcWfbGF0xLFsxLF5b3IgbXU/KioKICAgIEhhecSxci4gRWtyYW4gYnUgYWxhbmRhIHNhdMSxbiBhbG1hLCDDtmRlbWUgdmV5YSBzZXJ2aXMgcmV6ZXJ2YXN5b251IGJhxZ9sYXTEsWxtYWTEscSfxLFuxLEgYmVsaXJ0aXlvci4KCjE5LiAqKk9rdW1hayBoZXNhcCBhw6dtYW7EsSB2ZXlhIHNhdMSxbiBhbG1hbsSxIGdlcmVrdGlyaXlvciBtdT8qKgogICAgSGF5xLFyLiBPa3VtYW7EsW4gaGVzYXAgdmV5YSBzYXTEsW4gYWxtYSBnZXJla3Rpcm1lZGnEn2kgYcOnxLFrw6dhIHlhesSxeW9yLgoKMjAuICoqQWx0IMOndWJ1a3RhIGhhbmdpIGLDtmzDvG1sZXIgdmFyOyB5ZW5pIGFsxLHFn3ZlcmnFnyBzZWttZXNpIHZhciBtxLE/KioKICAgIOKAnEdhcmFq4oCdLCDigJxCYWvEsW3igJ0sIOKAnEFJIFVzdGHigJ0sIOKAnEdlw6dtacWf4oCdIHZlIOKAnFRvcGx1bHVr4oCdIGLDtmzDvG1sZXJpIHZhci4gQWzEscWfdmVyacWfIHNla21lc2kgZ8O2csO8bm3DvHlvci4KCiMjIEJ1bGd1bGFyCgpCdWxndSB5b2suIFNwb25zb3JsdSwgc3BvbnNvcmx1ayB5b2sgdmUgYmlsaW5taXlvciBkdXJ1bWxhcsSxOyBla3NpayB2ZXlhIGJvxZ8gYWx0ZXJuYXRpZiBiaWxnaXNpOyBrYXBzYW0vZ8O8bmNlbGxpazsgecO8a2xlbWUsIGhhdGEgdmUgw6dldnJpbWTEscWfxLEgZHVydW1sYXLEsSBla3JhbmxhcmRhIGF5xLFydCBlZGlsZWJpbGl5b3IuCg==

## Bağımsız bütün SOURCE kabulü — sınırlı FINAL adayı

SOURCE 2ea14dbb51a3019c83daf2940d866f40598de54d; BASE dce9dddfb4eeaf4b434a1f909d4fd3b59a29adeb. Sahip tarafından kabul edilen geçmişsiz /root/e1020_source_whole_review, istenen gpt-6-luna/max (reviewer model etiketi görünmediğini kaydeder), bütün15/113BASEpin/RAWv86snapshot, kod/test/sabit20/ilk okuma/native/tasarım/kapanış kapsamına PASS verdi. Root özgün tam raporu okudu ve byte/SHA doğruladı. Aynı SOURCE gerçekCI sekiz ailesi ve gerçekPRT3 başarılı; pushT3skip0 ayrı. Yerel447=437korunan+10yeni;47format0/analyze0/42graphworst0/index112;20durum180tamkaydırma/43PNG19benzersiz24alias. Native11 ayrı koşu, normal toplamına eklenmez. İlk font yolu FAIL ve --ci argümanFAIL özgün saklanır; dar komut düzeltmesi sonrası gerçekPASS.

FINAL yalnız dört kayıt ve registry/routing olmak üzere altı metadata dosyasıdır. Kod/test/sabit20/RAWsnapshot/pin kümesi ve YAML/SDK/deps değişmez. Profil/paketACTIVE, T020DONE yalnız dalın sponsor sunum kabul adayıdır. Ayrı geçmişsiz FINAL review ve sameFINAL gerçekCI/T3/olağanmerge/fetchedmain8 olmadan gerçek108DONE98kalan206 değişmez. Tam feature/flow/designfinal/üretimfeed/SCR-TBD/insan/cihaz/physical/releaseHELD; E3R1REVIEW/E5IN_PROGRESS korunur.

## Tam özgün bütün SOURCE raporu

Özgün13281bayt/SHA256 9f8fedd5a7b40cbd232c1e41bfe95629c16b0bce8f8562830483bf20dcfee1a9. HTML okunabilir normalize gösterimdir; byteeşlik yalnız TXT/Base64.

<pre># Kavriva T-E1-020 bağımsız SOURCE incelemesi

İnceleme tarihi: 2026-10-12
İncelemeci: /root/e1020_source_whole_review (bu görev görünümünde model etiketi doğrulanmıyor)
İnceleme türü: DEC-0069 kapsamında SOURCE için bağımsız ikinci göz
APP: C:\Users\Xpike\.codex\worktrees\e4-required-auto-transfer\kavriva-app

## Hüküm

**PASS — yalnızca T-E1-020’nin exact SOURCE içindeki sınırlı sponsor bilgisi sunum dilimi.** Davranış, ekranlar, kod sınırları, regresyon kanıtı ve aynı SOURCE CI görev paketinin dar kapsamıyla tutarlıdır. Bu hüküm T-E1-020’yi registry’de DONE yapmaz; F1.9.2, FL1.9.2, T-E1-021 veya daha üst ürün katmanlarını kapatmaz.

SOURCE dilimi için blocker, çelişki veya yanıtsız sabit soru bulmadım. Üretim satıcısı/teklifi, feed, gerçek sponsorluk doğrulaması, SCR-TBD, onaylı tam flow, final tasarım, gerçek cihaz/insan erişilebilirlik kabulü ve release kanıtı yoktur; bu konular dar PASS’in dışındadır ve HELD kalır.

Kör ilk ekran okuması ayrı olarak `/root/e1020_blind_r1` tarafından geçmişsiz gpt-6-luna/max ile yapılmıştır. İlk okuyucu yalnız sabit 20 soru, fixture, doğal PNG’ler ve ekran makbuzlarını kullanmış; kod, paket, plan ve cevap anahtarı görmemiştir. İlk okuma PASS’tir. Bu raporun yürütücüsü için model etiketi görünür olmadığından kendime gpt-6-luna/max atfetmiyorum.

## Kimlik, yetkili plan ve diff

- SOURCE `2ea14dbb51a3019c83daf2940d866f40598de54d`; CODE `8911f7ba6bd5bfe193aa77f245a3de10d6c682d7`; PRECODE `c3a12f19678cde3e4c64659103c9c25c66544e7a`; BASE `dce9dddfb4eeaf4b434a1f909d4fd3b59a29adeb`.
- Plan otoritesi `origin/main fa914f013fdcd032faed876689092da245989459`. Yerel plan çalışma HEAD’i kullanılmadı; otorite DEC-0069 ikinci göz iznini içerir ve DEC-0070’ı içermez.
- APP checkout temiz; `codex/e1-sponsored-marking` dalı ve HEAD exact SOURCE.
- BASE→SOURCE diff’i scope.json’daki tam 15 yol ile eşleşir: sponsored-marking-render profili; P-E1-020; T-E1-020 registry kaydı; E-DEV-120, E-DEV-119 ve E-DEV-119 snapshot; E10-GOVERNED-PATHS inventory; E1 MANIFEST; CI_PLAN; registry/routing index’leri; `guide_discovery.dart`, `sponsored_marking.dart`, `sponsored_marking_test.dart`, `sponsored_marking_reading_questions.json`.
- `scope.json` içindeki 113 BASE pinini BASE Git blob’larından karşılaştırdım: 113/113 hash eşleşmesi, LF tutarlı, uyuşmazlık yok. Değişen yollardaki pinler BASE hash’leridir.
- P-E1-020 tam 14 alanlı; T-E1-001 bağımlılığı registry’de DONE; T-E1-020 registry durumu REVIEW. T-E1-021 ayrı ranking firewall görevidir ve tam kabulü bu kaynakla kapanmaz.

## Davranış ve sınırlar

Yeni `SponsoredMarkingView`, kaynaktan türetilen isteğe bağlı salt metin alanıdır; var olan `GuideScopePreview` içinde `MotorcycleFitView` sonrasına eklenir. `commercial == null` eski rehber görünümünü korur. Yeni route/tab/commerce screen/katalog/pattern/token/ikon/public contract/mimari seam yoktur.

- Bilinen her seçeneğin sponsorluk etiketi aynı seçenek metniyle birlikte görünür: sponsorlu `Sponsorlu · ücretli reklam`, sponsor olmadığı belirtilen `Kaynağa göre sponsor desteği yok`.
- Unknown seçenek reklamsız varsayılmaz; unknown durumu açıklanır, adı ve ticari ayrıntısı gizlenir. Bilinen diğer seçenekler korunur.
- Kaynağın verdiği bilinen bütün seçenekler kendi sırasında kalır; ranking/sorting veya teknik üstünlük iddiası üreten algoritma yoktur.
- `options == null`, kaynağın seçenek/alternatif bilgisi vermediğini; boş liste, o kaynakta kayıtlı seçenek bulunmadığını ifade eder. İkisi de başka alternatif yok iddiası değildir.
- Kaynak adı/sürümü/kontrol zamanı yalnız veri olarak verilmişse aynen gösterilir; uygulama bugünün tarihini, sponsor kararını, satıcıyı, fiyatı veya doğrulamayı üretmez.
- Görünür liste için güncel scope, online ve available durum, mevcut/güncel/onaylı source ve eşleşen VariantContext gerekir. Loading, failed, held, offline, stale, unconfirmed; eksik/eski/busy/error scope; eksik source veya motosiklet/rehber/contextRevision değişiminde eski ticari isimler gösterilmez.
- Sponsor bilgisi fit, uygunluk, bakım izni veya callback üretmez. Ekran sponsorluk bilgisinin teknik olarak en iyi olmayı kanıtlamadığını ve listenin rehber yerine geçmediğini söyler.
- Satın alma/ödeme/rezervasyon, analytics, network çağrısı veya provider eylemi yoktur; okumak hesap veya satın alma gerektirmez.

BR-070/071/073 ile uyumlu olarak fit önce gelir; ücretli gösterim teknik kararı/fit’i değiştirmez; sponsorluk gizlenmez ve teknik öneri gibi sunulmaz; kaynakça verilen diğer seçenekler saklanmaz. Kod, kaynak beyanını gösterir; gerçek sponsorluk/feed doğrulayıcısı değildir.

## Test ve korunan kanıt

Sabit 20 soruluk fixture PRECODE’da dondurulmuş, SHA-256 `8e635f2acff46b1af68c9bfb04d6f34656691e65447b9de8c663c401c4c7d7af` olarak doğrulanmıştır. Yerel E1 `full-r1.log`: 447 test = 437 BASE testinin korunması + 10 yeni odak testi; PASS. `format-r1.log`: 47 dosyada biçim değişikliği yok. `analyze-r1.log`: analiz sorunu yok. Testler sponsor/unknown/null-empty, immutable/dedup, source/scope/context, eski listenin sızmaması, defaults, sıra, otorite sınırı ve erişilebilirlik/davranış durumlarını kapsar.

20 durum × 320/390/768 genişlik × 1/2/3 ölçek = 180 tam kaydırma birleşimi; odak, 52px hit alanı, taşma ve son bölüm kontrolleri mevcuttur. Native-r2 20 fixture durumu için 390×844 doğal Flutter görüntüleri: 43 PNG, 19 benzersiz içerik, 24 bayt eş alias. 43 kaydın baytı/SHA/PNG ölçüsü/durum/indeks/offset/end’i proof ile karşılaştırılmıştır; her durum offset 0’dan başlar, sıralama tamdır, son kare end’dedir. 19 benzersiz PNG’nin hepsini `view_image` ile açtım: mixed-0/1/2, only-sponsored-1, unknown-disclosure-1, mixed-unknown-1/2, missing-alternatives-1, empty-1, loading-1, failed-1, held-1, missing-source-1, offline-1, stale-scope-0, missing-scope-0, long-1/2, previous-default-1. Alias eşitliği RAW bayt düzeyinde doğrulandı.

İlk native-r1 font yolu eksik olduğu için FAIL; `native-r1.log` ve hatalı görüntü korundu ve kabul sayılmadı. Doğru Flutter engine kaynak fontuyla native-r2 ayrı 11 kontrolü (10 görünüm + 1 capture) PASS; 447 normal teste eklenmedi. İlk code-graph komutu desteklenmeyen `--ci` argümanıyla exit 2 FAIL; `code-graph-r1.log` korunur. Doğru `--plan-root` tekrarında 42 mimari test, 12 kontrol, worst exit 0, index 112 ve T-E1-020 routing REVIEW; ilk FAIL gizlenmedi.

## RAW, append-only ve indeks

- E-DEV-119 BASE RAW SHA-256 `d04aaf17c3c0adf99fd2c0e64958090f54ac095a5fccbcfff7a4472b772ff137` pinle eşleşir. T020 snapshot, BASE inventory v86 ile birebir: 226304 bayt, SHA-256 `5cee715605173037c437b894aa899a4588a3b2f3068b5a3d0f34fbd6e613e0b3`.
- Inventory v87; generated graph index 112 satır. E-DEV-119’un eski body/verdict/digest/RAW/history’si korunmuş; yalnız `used_by` frontmatter referansı güncellenmiş ve 209 satır append edilmiştir.
- E-DEV-120 içindeki ilk okuma RAWBase64’i `first-reading-r1.txt` ile birebir: 6217 bayt, SHA-256 `3359b530aedf11e925067c4596fa0766316dc31389b4c99f0afd6ff505f36be2`.
- Ana dosya SHA’ları scope ile eşleşir: `guide_discovery.dart` `4b5f681a939aa850f44093e351807840c1efd17c6e6fb9b6bb71454fd46b4d1f`; `sponsored_marking.dart` `9971fe5564ef3522a257c289fd0c53b7315b756288c083369eff0b530547df56`; test `7fe04ba2d2070d23befc5806f6cb465c97aeede9c7ccc8bca1b94e21452568f3`; fixture yukarıdaki SHA.

## Gerçek görüntü ve yedi tasarım karşılaştırması

Doğal ekranlarda fit alanı sponsor açıklamasından önce; alt kabuk beş mevcut sekmeden oluşuyor: Garaj, Bakım, AI Usta, Geçmiş, Topluluk. Alışveriş sekmesi yok. D02 onaylı görselini açıp SCR-010 ve SCREEN_COVERAGE J-012 ile karşılaştırdım: D02 scope/fit ile kaynak derinlik bağlantısını gösterir, sponsor yardımcı alanını çizmez. Bu kaynak türevi salt metin alanı fit sonrasındadır; bu fark yeni ekran veya pixel/order/device kabulü değildir.

| Karşılaştırma | Sonuç ve sınır |
|---|---|
| Tam ekran | Rehber kabuğu, komşu kaydırma parçaları, fit önceliği ve beş mevcut sekme okundu. |
| Komşu/önceki alan | Null varsayılanı önceki rehberi korur; yeni route/katalog yok. |
| Durum | 20 sponsor/unknown/null-empty/source-scope-context/error/offline/loading/held hali karşılaştırıldı. |
| Duyarlı düzen | 180 tam kaydırma birleşimi ve 390×844 görüntü var; fiziksel cihaz/breakpoint kabulü yok. |
| Erişilebilirlik | Headless semantics/klavye/focus/hit alanı/metin kontrastı; metin ≥4.5, odak ≥3. İnsan, gerçek ekran okuyucu veya cihaz kabulü yok. |
| Kanonik tasarım | SCR-010, D02, FAM-02, J-012, DP-01/02/06/13/14; D02 sponsor alanını çizmez. Tam token/piksel/order/final tasarım kabulü yok. |
| Regresyon/kaynak | 437 korunan + 10 yeni test, 113 pin, 15 yol, v86 snapshot, v87/index112, RAW ve CI kontrol edildi. |

## On ürün kapanış katmanı

E-DEV-120 yedi karşılaştırma ve on kapanış katmanı kaydını; `E10-CLOSURE-AUDIT.md` gerçek audit tablosunu okudum. Ürün audit’i on katmanın tamamını nonpassing kaydeder; bu SOURCE incelemesi onu değiştirmez.

| Katman | Bu incelemedeki disposition |
|---|---|
| Task | T020 dar SOURCE PASS; registry REVIEW, task DONE veya 206 ürün ihtiyacı kapanışı değil. |
| Feature | F1.9.2 yalnız sunum dilimi; T021 ve üretim feed’i HELD. |
| Flow | FL1.9.2 PROPOSED; SCR-TBD onaysız, gerçek E2E flow kabulü yok. |
| Requirement | BR070/071/073 ekran davranışı doğrulandı; sponsorluk doğruluğu değil. |
| Design | Yedi bounded karşılaştırma; tam görsel/token/device kabulü yok. |
| Architecture | E1 render ve graph kapıları; backend/provider/seam/public contract kabulü yok. |
| Data/migration | Schema/migration yok, immutable liste; ürün migration/rollback/restore kanıtı yok. |
| Release | SOURCE CI PASS; production authorization, merge/yayın/main8 kabulü yok. |
| Product scenario | Fixture 20 örnek; gerçek satıcı/teklif/ödeme/servis senaryosu yok. |
| Gap audit | T021/feed/SCR-TBD/production/router/physical/human/device/release açık; sıfır gap iddiası yok. |

E10-CLOSURE-AUDIT’te ürün çapındaki eksik fiziksel kayıtlar ve bütün üst katmanların nonpassing durumu korunur. E3R1 REVIEW/E5 IN_PROGRESS ile 108 DONE / 98 kalan / 206 toplam sayacı değişmez.

## Exact SOURCE CI ve canlı PR

`source-ci.json` exact SOURCE HEAD `2ea14dbb51a3019c83daf2940d866f40598de54d` için 17 tamamlanmış başarılı koşu içerir: 8 push, 9 pull_request ve 8 aile (ek architecture PR koşusu dahil). `source-&lt;run-id&gt;.log` RAW boyut/SHA değerleri manifestle eşleşir; tüm head/job/step/result kayıtları okundu. `source-ci-root-read.json`: rawHashVerified, allHeadJobStepResultsRead, actualPRT3StepsRead, authResultMarkersRead true; indexRows 112.

| Aile | Push | PR |
|---|---:|---:|
| architecture-checks | 38288588919 | 38288597668, 38288599509 |
| E1 shell/widget | 38288588868 | 38288597661 |
| E3 commit authorization | 38288588967 | 38288597818 |
| E3 live auth | 38288589042 | 38288597730 |
| E5 current authority | 38288588931 | 38288597594 |
| E4 offline composition | 38288589077 | 38288597743 |
| E6 release policy | 38288588870 | 38288597533 |
| E9 bounded proposal | 38288588880 | 38288597923 |

Her iki gerçek PR T3 gate job’ında beş adım da success: Set up job; Checkout Kavriva app; T3 conformance + identity gate; Post checkout; Complete job. Push architecture run’ında T3 `skipped` ve step listesi boştur; push T3 başarı sayılmamıştır. Aynı SOURCE E1 CI 447 test PASS; mimari CI 42 test/worst exit 0, secret-pattern scan ve index rebuild PASS. Diğer aile sayıları E3 107, E5 59, E4 170, E6 50, E9 9. Auth job’ı signup/session/guard/logout ve private Storage/Data API/client-role bypass ret testlerini izole ortamda PASS göstermiştir; bu production Auth veya E1 feature kabulü değildir.

İnceleme anında [PR #122](https://github.com/xpike-dgm/kavriva-app/pull/122) OPEN, draft, base `main`, branch `codex/e1-sponsored-marking`, live head exact SOURCE ve merge edilmemiştir. Canlı PR body’nin üst eski özeti samehead CI/T3 bekleniyor derken alttaki güncel CI bölümü 17 başarılı koşu yazmaktadır. Bu nonblocking body-only metinsel tutarsızlıktır; RAW CI ve head makbuzları günceldir, SOURCE davranışını değiştirmez. PR body’yi Root güncelleyecektir. Zorunlu artifact attach 100 kimlik kapasitesi nedeniyle önce reddedilmiş, eski ekler korunmuştur.

## Son sınır ve disposition

Yalnız `C:\Users\Xpike\.codex\task-state\kavriva-e1020\source-whole-review.txt` yazıldı. Repository, PR, plan, test koşuları ve diğer task-state kayıtları değiştirilmedi. Sonuç exact SOURCE içindir; sonraki commit’e, üretim verisine, satıcıya, kullanıcı cihazına veya ürün/release kabulüne genellenmez.

Kaynak hükmü: PASS — T-E1-020 exact SOURCE sınırında.
PR metadata gözlemi: 1 nonblocking, body-only eski özet tutarsızlığı.</pre>

RAWBase64: IyBLYXZyaXZhIFQtRTEtMDIwIGJhxJ/EsW1zxLF6IFNPVVJDRSBpbmNlbGVtZXNpCgrEsG5jZWxlbWUgdGFyaWhpOiAyMDI2LTEwLTEyCsSwbmNlbGVtZWNpOiAvcm9vdC9lMTAyMF9zb3VyY2Vfd2hvbGVfcmV2aWV3IChidSBnw7ZyZXYgZ8O2csO8bsO8bcO8bmRlIG1vZGVsIGV0aWtldGkgZG/En3J1bGFubcSxeW9yKQrEsG5jZWxlbWUgdMO8csO8OiBERUMtMDA2OSBrYXBzYW3EsW5kYSBTT1VSQ0UgacOnaW4gYmHEn8SxbXPEsXogaWtpbmNpIGfDtnoKQVBQOiBDOlxVc2Vyc1xYcGlrZVwuY29kZXhcd29ya3RyZWVzXGU0LXJlcXVpcmVkLWF1dG8tdHJhbnNmZXJca2F2cml2YS1hcHAKCiMjIEjDvGvDvG0KCioqUEFTUyDigJQgeWFsbsSxemNhIFQtRTEtMDIw4oCZbmluIGV4YWN0IFNPVVJDRSBpw6dpbmRla2kgc8SxbsSxcmzEsSBzcG9uc29yIGJpbGdpc2kgc3VudW0gZGlsaW1pLioqIERhdnJhbsSxxZ8sIGVrcmFubGFyLCBrb2Qgc8SxbsSxcmxhcsSxLCByZWdyZXN5b24ga2FuxLF0xLEgdmUgYXluxLEgU09VUkNFIENJIGfDtnJldiBwYWtldGluaW4gZGFyIGthcHNhbcSxeWxhIHR1dGFybMSxZMSxci4gQnUgaMO8a8O8bSBULUUxLTAyMOKAmXlpIHJlZ2lzdHJ54oCZZGUgRE9ORSB5YXBtYXo7IEYxLjkuMiwgRkwxLjkuMiwgVC1FMS0wMjEgdmV5YSBkYWhhIMO8c3Qgw7xyw7xuIGthdG1hbmxhcsSxbsSxIGthcGF0bWF6LgoKU09VUkNFIGRpbGltaSBpw6dpbiBibG9ja2VyLCDDp2VsacWfa2kgdmV5YSB5YW7EsXRzxLF6IHNhYml0IHNvcnUgYnVsbWFkxLFtLiDDnHJldGltIHNhdMSxY8Sxc8SxL3Rla2xpZmksIGZlZWQsIGdlcsOnZWsgc3BvbnNvcmx1ayBkb8SfcnVsYW1hc8SxLCBTQ1ItVEJELCBvbmF5bMSxIHRhbSBmbG93LCBmaW5hbCB0YXNhcsSxbSwgZ2Vyw6dlayBjaWhhei9pbnNhbiBlcmnFn2lsZWJpbGlybGlrIGthYnVsw7wgdmUgcmVsZWFzZSBrYW7EsXTEsSB5b2t0dXI7IGJ1IGtvbnVsYXIgZGFyIFBBU1PigJlpbiBkxLHFn8SxbmRhZMSxciB2ZSBIRUxEIGthbMSxci4KCkvDtnIgaWxrIGVrcmFuIG9rdW1hc8SxIGF5csSxIG9sYXJhayBgL3Jvb3QvZTEwMjBfYmxpbmRfcjFgIHRhcmFmxLFuZGFuIGdlw6dtacWfc2l6IGdwdC02LWx1bmEvbWF4IGlsZSB5YXDEsWxtxLHFn3TEsXIuIMSwbGsgb2t1eXVjdSB5YWxuxLF6IHNhYml0IDIwIHNvcnUsIGZpeHR1cmUsIGRvxJ9hbCBQTkfigJlsZXIgdmUgZWtyYW4gbWFrYnV6bGFyxLFuxLEga3VsbGFubcSxxZ87IGtvZCwgcGFrZXQsIHBsYW4gdmUgY2V2YXAgYW5haHRhcsSxIGfDtnJtZW1pxZ90aXIuIMSwbGsgb2t1bWEgUEFTU+KAmXRpci4gQnUgcmFwb3J1biB5w7xyw7x0w7xjw7xzw7wgacOnaW4gbW9kZWwgZXRpa2V0aSBnw7Zyw7xuw7xyIG9sbWFkxLHEn8SxbmRhbiBrZW5kaW1lIGdwdC02LWx1bmEvbWF4IGF0ZmV0bWl5b3J1bS4KCiMjIEtpbWxpaywgeWV0a2lsaSBwbGFuIHZlIGRpZmYKCi0gU09VUkNFIGAyZWExNGRiYjUxYTMwMTljODNkYWYyOTQwZDg2NmY0MDU5OGRlNTRkYDsgQ09ERSBgODkxMWY3YmE2YmQ1YmZlMTkzYWE3N2YyNDVhM2RlMTBkNmM2ODJkN2A7IFBSRUNPREUgYGMzYTEyZjE5Njc4Y2RlM2U0YzY0NjU5MTAzYzljMjVjNjY1NDRlN2FgOyBCQVNFIGBkY2U5ZGRkZmI0ZWVhZjRiNDM0YTFmOTA5ZDRmZDNiNTlhMjlhZGViYC4KLSBQbGFuIG90b3JpdGVzaSBgb3JpZ2luL21haW4gZmE5MTRmMDEzZmRjZDAzMmZhZWQ4NzY2ODkwOTJkYTI0NTk4OTQ1OWAuIFllcmVsIHBsYW4gw6dhbMSxxZ9tYSBIRUFE4oCZaSBrdWxsYW7EsWxtYWTEsTsgb3Rvcml0ZSBERUMtMDA2OSBpa2luY2kgZ8O2eiBpem5pbmkgacOnZXJpciB2ZSBERUMtMDA3MOKAmcSxIGnDp2VybWV6LgotIEFQUCBjaGVja291dCB0ZW1pejsgYGNvZGV4L2UxLXNwb25zb3JlZC1tYXJraW5nYCBkYWzEsSB2ZSBIRUFEIGV4YWN0IFNPVVJDRS4KLSBCQVNF4oaSU09VUkNFIGRpZmbigJlpIHNjb3BlLmpzb27igJlkYWtpIHRhbSAxNSB5b2wgaWxlIGXFn2xlxZ9pcjogc3BvbnNvcmVkLW1hcmtpbmctcmVuZGVyIHByb2ZpbGk7IFAtRTEtMDIwOyBULUUxLTAyMCByZWdpc3RyeSBrYXlkxLE7IEUtREVWLTEyMCwgRS1ERVYtMTE5IHZlIEUtREVWLTExOSBzbmFwc2hvdDsgRTEwLUdPVkVSTkVELVBBVEhTIGludmVudG9yeTsgRTEgTUFOSUZFU1Q7IENJX1BMQU47IHJlZ2lzdHJ5L3JvdXRpbmcgaW5kZXjigJlsZXJpOyBgZ3VpZGVfZGlzY292ZXJ5LmRhcnRgLCBgc3BvbnNvcmVkX21hcmtpbmcuZGFydGAsIGBzcG9uc29yZWRfbWFya2luZ190ZXN0LmRhcnRgLCBgc3BvbnNvcmVkX21hcmtpbmdfcmVhZGluZ19xdWVzdGlvbnMuanNvbmAuCi0gYHNjb3BlLmpzb25gIGnDp2luZGVraSAxMTMgQkFTRSBwaW5pbmkgQkFTRSBHaXQgYmxvYuKAmWxhcsSxbmRhbiBrYXLFn8SxbGHFn3TEsXJkxLFtOiAxMTMvMTEzIGhhc2ggZcWfbGXFn21lc2ksIExGIHR1dGFybMSxLCB1eXXFn21hemzEsWsgeW9rLiBEZcSfacWfZW4geW9sbGFyZGFraSBwaW5sZXIgQkFTRSBoYXNo4oCZbGVyaWRpci4KLSBQLUUxLTAyMCB0YW0gMTQgYWxhbmzEsTsgVC1FMS0wMDEgYmHEn8SxbWzEsWzEscSfxLEgcmVnaXN0cnnigJlkZSBET05FOyBULUUxLTAyMCByZWdpc3RyeSBkdXJ1bXUgUkVWSUVXLiBULUUxLTAyMSBheXLEsSByYW5raW5nIGZpcmV3YWxsIGfDtnJldmlkaXIgdmUgdGFtIGthYnVsw7wgYnUga2F5bmFrbGEga2FwYW5tYXouCgojIyBEYXZyYW7EscWfIHZlIHPEsW7EsXJsYXIKClllbmkgYFNwb25zb3JlZE1hcmtpbmdWaWV3YCwga2F5bmFrdGFuIHTDvHJldGlsZW4gaXN0ZcSfZSBiYcSfbMSxIHNhbHQgbWV0aW4gYWxhbsSxZMSxcjsgdmFyIG9sYW4gYEd1aWRlU2NvcGVQcmV2aWV3YCBpw6dpbmRlIGBNb3RvcmN5Y2xlRml0Vmlld2Agc29ucmFzxLFuYSBla2xlbmlyLiBgY29tbWVyY2lhbCA9PSBudWxsYCBlc2tpIHJlaGJlciBnw7Zyw7xuw7xtw7xuw7wga29ydXIuIFllbmkgcm91dGUvdGFiL2NvbW1lcmNlIHNjcmVlbi9rYXRhbG9nL3BhdHRlcm4vdG9rZW4vaWtvbi9wdWJsaWMgY29udHJhY3QvbWltYXJpIHNlYW0geW9rdHVyLgoKLSBCaWxpbmVuIGhlciBzZcOnZW5lxJ9pbiBzcG9uc29ybHVrIGV0aWtldGkgYXluxLEgc2XDp2VuZWsgbWV0bml5bGUgYmlybGlrdGUgZ8O2csO8bsO8cjogc3BvbnNvcmx1IGBTcG9uc29ybHUgwrcgw7xjcmV0bGkgcmVrbGFtYCwgc3BvbnNvciBvbG1hZMSxxJ/EsSBiZWxpcnRpbGVuIGBLYXluYcSfYSBnw7ZyZSBzcG9uc29yIGRlc3RlxJ9pIHlva2AuCi0gVW5rbm93biBzZcOnZW5layByZWtsYW1zxLF6IHZhcnNhecSxbG1hejsgdW5rbm93biBkdXJ1bXUgYcOnxLFrbGFuxLFyLCBhZMSxIHZlIHRpY2FyaSBheXLEsW50xLFzxLEgZ2l6bGVuaXIuIEJpbGluZW4gZGnEn2VyIHNlw6dlbmVrbGVyIGtvcnVudXIuCi0gS2F5bmHEn8SxbiB2ZXJkacSfaSBiaWxpbmVuIGLDvHTDvG4gc2XDp2VuZWtsZXIga2VuZGkgc8SxcmFzxLFuZGEga2FsxLFyOyByYW5raW5nL3NvcnRpbmcgdmV5YSB0ZWtuaWsgw7xzdMO8bmzDvGsgaWRkaWFzxLEgw7xyZXRlbiBhbGdvcml0bWEgeW9rdHVyLgotIGBvcHRpb25zID09IG51bGxgLCBrYXluYcSfxLFuIHNlw6dlbmVrL2FsdGVybmF0aWYgYmlsZ2lzaSB2ZXJtZWRpxJ9pbmk7IGJvxZ8gbGlzdGUsIG8ga2F5bmFrdGEga2F5xLF0bMSxIHNlw6dlbmVrIGJ1bHVubWFkxLHEn8SxbsSxIGlmYWRlIGVkZXIuIMSwa2lzaSBkZSBiYcWfa2EgYWx0ZXJuYXRpZiB5b2sgaWRkaWFzxLEgZGXEn2lsZGlyLgotIEtheW5hayBhZMSxL3PDvHLDvG3DvC9rb250cm9sIHphbWFuxLEgeWFsbsSxeiB2ZXJpIG9sYXJhayB2ZXJpbG1pxZ9zZSBheW5lbiBnw7ZzdGVyaWxpcjsgdXlndWxhbWEgYnVnw7xuw7xuIHRhcmloaW5pLCBzcG9uc29yIGthcmFyxLFuxLEsIHNhdMSxY8SxecSxLCBmaXlhdMSxIHZleWEgZG/En3J1bGFtYXnEsSDDvHJldG1lei4KLSBHw7Zyw7xuw7xyIGxpc3RlIGnDp2luIGfDvG5jZWwgc2NvcGUsIG9ubGluZSB2ZSBhdmFpbGFibGUgZHVydW0sIG1ldmN1dC9nw7xuY2VsL29uYXlsxLEgc291cmNlIHZlIGXFn2xlxZ9lbiBWYXJpYW50Q29udGV4dCBnZXJla2lyLiBMb2FkaW5nLCBmYWlsZWQsIGhlbGQsIG9mZmxpbmUsIHN0YWxlLCB1bmNvbmZpcm1lZDsgZWtzaWsvZXNraS9idXN5L2Vycm9yIHNjb3BlOyBla3NpayBzb3VyY2UgdmV5YSBtb3Rvc2lrbGV0L3JlaGJlci9jb250ZXh0UmV2aXNpb24gZGXEn2nFn2ltaW5kZSBlc2tpIHRpY2FyaSBpc2ltbGVyIGfDtnN0ZXJpbG1lei4KLSBTcG9uc29yIGJpbGdpc2kgZml0LCB1eWd1bmx1aywgYmFrxLFtIGl6bmkgdmV5YSBjYWxsYmFjayDDvHJldG1lei4gRWtyYW4gc3BvbnNvcmx1ayBiaWxnaXNpbmluIHRla25payBvbGFyYWsgZW4gaXlpIG9sbWF5xLEga2FuxLF0bGFtYWTEscSfxLFuxLEgdmUgbGlzdGVuaW4gcmVoYmVyIHllcmluZSBnZcOnbWVkacSfaW5pIHPDtnlsZXIuCi0gU2F0xLFuIGFsbWEvw7ZkZW1lL3JlemVydmFzeW9uLCBhbmFseXRpY3MsIG5ldHdvcmsgw6dhxJ9yxLFzxLEgdmV5YSBwcm92aWRlciBleWxlbWkgeW9rdHVyOyBva3VtYWsgaGVzYXAgdmV5YSBzYXTEsW4gYWxtYSBnZXJla3Rpcm1lei4KCkJSLTA3MC8wNzEvMDczIGlsZSB1eXVtbHUgb2xhcmFrIGZpdCDDtm5jZSBnZWxpcjsgw7xjcmV0bGkgZ8O2c3RlcmltIHRla25payBrYXJhcsSxL2ZpdOKAmWkgZGXEn2nFn3Rpcm1lejsgc3BvbnNvcmx1ayBnaXpsZW5tZXogdmUgdGVrbmlrIMO2bmVyaSBnaWJpIHN1bnVsbWF6OyBrYXluYWvDp2EgdmVyaWxlbiBkacSfZXIgc2XDp2VuZWtsZXIgc2FrbGFubWF6LiBLb2QsIGtheW5hayBiZXlhbsSxbsSxIGfDtnN0ZXJpcjsgZ2Vyw6dlayBzcG9uc29ybHVrL2ZlZWQgZG/En3J1bGF5xLFjxLFzxLEgZGXEn2lsZGlyLgoKIyMgVGVzdCB2ZSBrb3J1bmFuIGthbsSxdAoKU2FiaXQgMjAgc29ydWx1ayBmaXh0dXJlIFBSRUNPREXigJlkYSBkb25kdXJ1bG11xZ8sIFNIQS0yNTYgYDhlNjM1ZjJhY2ZmNDZiMWFmNjhjOWJmYjA0ZDZmMzQ2NTY2OTFlNjU0NDdiOWRlOGM2NjNjNDAxYzRjN2Q3YWZgIG9sYXJhayBkb8SfcnVsYW5txLHFn3TEsXIuIFllcmVsIEUxIGBmdWxsLXIxLmxvZ2A6IDQ0NyB0ZXN0ID0gNDM3IEJBU0UgdGVzdGluaW4ga29ydW5tYXPEsSArIDEwIHllbmkgb2RhayB0ZXN0aTsgUEFTUy4gYGZvcm1hdC1yMS5sb2dgOiA0NyBkb3N5YWRhIGJpw6dpbSBkZcSfacWfaWtsacSfaSB5b2suIGBhbmFseXplLXIxLmxvZ2A6IGFuYWxpeiBzb3J1bnUgeW9rLiBUZXN0bGVyIHNwb25zb3IvdW5rbm93bi9udWxsLWVtcHR5LCBpbW11dGFibGUvZGVkdXAsIHNvdXJjZS9zY29wZS9jb250ZXh0LCBlc2tpIGxpc3RlbmluIHPEsXptYW1hc8SxLCBkZWZhdWx0cywgc8SxcmEsIG90b3JpdGUgc8SxbsSxcsSxIHZlIGVyacWfaWxlYmlsaXJsaWsvZGF2cmFuxLHFnyBkdXJ1bWxhcsSxbsSxIGthcHNhci4KCjIwIGR1cnVtIMOXIDMyMC8zOTAvNzY4IGdlbmnFn2xpayDDlyAxLzIvMyDDtmzDp2VrID0gMTgwIHRhbSBrYXlkxLFybWEgYmlybGXFn2ltaTsgb2RhaywgNTJweCBoaXQgYWxhbsSxLCB0YcWfbWEgdmUgc29uIGLDtmzDvG0ga29udHJvbGxlcmkgbWV2Y3V0dHVyLiBOYXRpdmUtcjIgMjAgZml4dHVyZSBkdXJ1bXUgacOnaW4gMzkww5c4NDQgZG/En2FsIEZsdXR0ZXIgZ8O2csO8bnTDvGxlcmk6IDQzIFBORywgMTkgYmVuemVyc2l6IGnDp2VyaWssIDI0IGJheXQgZcWfIGFsaWFzLiA0MyBrYXlkxLFuIGJheXTEsS9TSEEvUE5HIMO2bMOnw7xzw7wvZHVydW0vaW5kZWtzL29mZnNldC9lbmTigJlpIHByb29mIGlsZSBrYXLFn8SxbGHFn3TEsXLEsWxtxLHFn3TEsXI7IGhlciBkdXJ1bSBvZmZzZXQgMOKAmWRhbiBiYcWfbGFyLCBzxLFyYWxhbWEgdGFtZMSxciwgc29uIGthcmUgZW5k4oCZZGVkaXIuIDE5IGJlbnplcnNpeiBQTkfigJluaW4gaGVwc2luaSBgdmlld19pbWFnZWAgaWxlIGHDp3TEsW06IG1peGVkLTAvMS8yLCBvbmx5LXNwb25zb3JlZC0xLCB1bmtub3duLWRpc2Nsb3N1cmUtMSwgbWl4ZWQtdW5rbm93bi0xLzIsIG1pc3NpbmctYWx0ZXJuYXRpdmVzLTEsIGVtcHR5LTEsIGxvYWRpbmctMSwgZmFpbGVkLTEsIGhlbGQtMSwgbWlzc2luZy1zb3VyY2UtMSwgb2ZmbGluZS0xLCBzdGFsZS1zY29wZS0wLCBtaXNzaW5nLXNjb3BlLTAsIGxvbmctMS8yLCBwcmV2aW91cy1kZWZhdWx0LTEuIEFsaWFzIGXFn2l0bGnEn2kgUkFXIGJheXQgZMO8emV5aW5kZSBkb8SfcnVsYW5kxLEuCgrEsGxrIG5hdGl2ZS1yMSBmb250IHlvbHUgZWtzaWsgb2xkdcSfdSBpw6dpbiBGQUlMOyBgbmF0aXZlLXIxLmxvZ2AgdmUgaGF0YWzEsSBnw7Zyw7xudMO8IGtvcnVuZHUgdmUga2FidWwgc2F5xLFsbWFkxLEuIERvxJ9ydSBGbHV0dGVyIGVuZ2luZSBrYXluYWsgZm9udHV5bGEgbmF0aXZlLXIyIGF5csSxIDExIGtvbnRyb2zDvCAoMTAgZ8O2csO8bsO8bSArIDEgY2FwdHVyZSkgUEFTUzsgNDQ3IG5vcm1hbCB0ZXN0ZSBla2xlbm1lZGkuIMSwbGsgY29kZS1ncmFwaCBrb211dHUgZGVzdGVrbGVubWV5ZW4gYC0tY2lgIGFyZ8O8bWFuxLF5bGEgZXhpdCAyIEZBSUw7IGBjb2RlLWdyYXBoLXIxLmxvZ2Aga29ydW51ci4gRG/En3J1IGAtLXBsYW4tcm9vdGAgdGVrcmFyxLFuZGEgNDIgbWltYXJpIHRlc3QsIDEyIGtvbnRyb2wsIHdvcnN0IGV4aXQgMCwgaW5kZXggMTEyIHZlIFQtRTEtMDIwIHJvdXRpbmcgUkVWSUVXOyBpbGsgRkFJTCBnaXpsZW5tZWRpLgoKIyMgUkFXLCBhcHBlbmQtb25seSB2ZSBpbmRla3MKCi0gRS1ERVYtMTE5IEJBU0UgUkFXIFNIQS0yNTYgYGQwNGFhZjE3YzNjMGFkZjk5ZmQyYzBlNjQ5NTgwOTBmNTRhYzA5NWE1ZmNjYmNmZmY3YTQ0NzJiNzcyZmYxMzdgIHBpbmxlIGXFn2xlxZ9pci4gVDAyMCBzbmFwc2hvdCwgQkFTRSBpbnZlbnRvcnkgdjg2IGlsZSBiaXJlYmlyOiAyMjYzMDQgYmF5dCwgU0hBLTI1NiBgNWNlZTcxNTYwNTE3MzAzN2M0MzdiODk0YWE4OTlhNDU4OGEzYjJmMzA2OGI1YTNkMGYzNGZiZDZlNjEzZTBiM2AuCi0gSW52ZW50b3J5IHY4NzsgZ2VuZXJhdGVkIGdyYXBoIGluZGV4IDExMiBzYXTEsXIuIEUtREVWLTExOeKAmXVuIGVza2kgYm9keS92ZXJkaWN0L2RpZ2VzdC9SQVcvaGlzdG9yeeKAmXNpIGtvcnVubXXFnzsgeWFsbsSxeiBgdXNlZF9ieWAgZnJvbnRtYXR0ZXIgcmVmZXJhbnPEsSBnw7xuY2VsbGVubWnFnyB2ZSAyMDkgc2F0xLFyIGFwcGVuZCBlZGlsbWnFn3Rpci4KLSBFLURFVi0xMjAgacOnaW5kZWtpIGlsayBva3VtYSBSQVdCYXNlNjTigJlpIGBmaXJzdC1yZWFkaW5nLXIxLnR4dGAgaWxlIGJpcmViaXI6IDYyMTcgYmF5dCwgU0hBLTI1NiBgMzM1OWI1MzBhZWRmMTFlOTI1MDY3YzQ1OTZmYTA3NjYzMTZkYzMxMzg5YjRjOTlmMGFmZDZmZjUwNWYzNmJlMmAuCi0gQW5hIGRvc3lhIFNIQeKAmWxhcsSxIHNjb3BlIGlsZSBlxZ9sZcWfaXI6IGBndWlkZV9kaXNjb3ZlcnkuZGFydGAgYDRiNWY2ODFhOTM5YWE4NTBmNDQwOTNlMzUxODA3ODQwYzFlZmQxN2M2ZTZmYjliNmJiNzE0NTRmZDQ2YjRkMWZgOyBgc3BvbnNvcmVkX21hcmtpbmcuZGFydGAgYDk5NzFmZTU1NjRlZjM1MjJhMjU3YzI4OWZkMGM1M2I3MzE1Yjc1NjI4OGMwODMzNjllZmYwYjUzMDU0N2RmNTZgOyB0ZXN0IGA3ZmUwNGJhMmQyMDcwZDIzYmVmYzU4MDZmNmNiNDY1Yzk3YWVlZGU5YzdjY2M4YmNhMWI5NGUyMTQ1MjU2OGYzYDsgZml4dHVyZSB5dWthcsSxZGFraSBTSEEuCgojIyBHZXLDp2VrIGfDtnLDvG50w7wgdmUgeWVkaSB0YXNhcsSxbSBrYXLFn8SxbGHFn3TEsXJtYXPEsQoKRG/En2FsIGVrcmFubGFyZGEgZml0IGFsYW7EsSBzcG9uc29yIGHDp8Sxa2xhbWFzxLFuZGFuIMO2bmNlOyBhbHQga2FidWsgYmXFnyBtZXZjdXQgc2VrbWVkZW4gb2x1xZ91eW9yOiBHYXJhaiwgQmFrxLFtLCBBSSBVc3RhLCBHZcOnbWnFnywgVG9wbHVsdWsuIEFsxLHFn3ZlcmnFnyBzZWttZXNpIHlvay4gRDAyIG9uYXlsxLEgZ8O2cnNlbGluaSBhw6fEsXAgU0NSLTAxMCB2ZSBTQ1JFRU5fQ09WRVJBR0UgSi0wMTIgaWxlIGthcsWfxLFsYcWfdMSxcmTEsW06IEQwMiBzY29wZS9maXQgaWxlIGtheW5hayBkZXJpbmxpayBiYcSfbGFudMSxc8SxbsSxIGfDtnN0ZXJpciwgc3BvbnNvciB5YXJkxLFtY8SxIGFsYW7EsW7EsSDDp2l6bWV6LiBCdSBrYXluYWsgdMO8cmV2aSBzYWx0IG1ldGluIGFsYW7EsSBmaXQgc29ucmFzxLFuZGFkxLFyOyBidSBmYXJrIHllbmkgZWtyYW4gdmV5YSBwaXhlbC9vcmRlci9kZXZpY2Uga2FidWzDvCBkZcSfaWxkaXIuCgp8IEthcsWfxLFsYcWfdMSxcm1hIHwgU29udcOnIHZlIHPEsW7EsXIgfAp8LS0tfC0tLXwKfCBUYW0gZWtyYW4gfCBSZWhiZXIga2FidcSfdSwga29txZ91IGtheWTEsXJtYSBwYXLDp2FsYXLEsSwgZml0IMO2bmNlbGnEn2kgdmUgYmXFnyBtZXZjdXQgc2VrbWUgb2t1bmR1LiB8CnwgS29txZ91L8O2bmNla2kgYWxhbiB8IE51bGwgdmFyc2F5xLFsYW7EsSDDtm5jZWtpIHJlaGJlcmkga29ydXI7IHllbmkgcm91dGUva2F0YWxvZyB5b2suIHwKfCBEdXJ1bSB8IDIwIHNwb25zb3IvdW5rbm93bi9udWxsLWVtcHR5L3NvdXJjZS1zY29wZS1jb250ZXh0L2Vycm9yL29mZmxpbmUvbG9hZGluZy9oZWxkIGhhbGkga2FyxZ/EsWxhxZ90xLFyxLFsZMSxLiB8CnwgRHV5YXJsxLEgZMO8emVuIHwgMTgwIHRhbSBrYXlkxLFybWEgYmlybGXFn2ltaSB2ZSAzOTDDlzg0NCBnw7Zyw7xudMO8IHZhcjsgZml6aWtzZWwgY2loYXovYnJlYWtwb2ludCBrYWJ1bMO8IHlvay4gfAp8IEVyacWfaWxlYmlsaXJsaWsgfCBIZWFkbGVzcyBzZW1hbnRpY3Mva2xhdnllL2ZvY3VzL2hpdCBhbGFuxLEvbWV0aW4ga29udHJhc3TEsTsgbWV0aW4g4omlNC41LCBvZGFrIOKJpTMuIMSwbnNhbiwgZ2Vyw6dlayBla3JhbiBva3V5dWN1IHZleWEgY2loYXoga2FidWzDvCB5b2suIHwKfCBLYW5vbmlrIHRhc2FyxLFtIHwgU0NSLTAxMCwgRDAyLCBGQU0tMDIsIEotMDEyLCBEUC0wMS8wMi8wNi8xMy8xNDsgRDAyIHNwb25zb3IgYWxhbsSxbsSxIMOnaXptZXouIFRhbSB0b2tlbi9waWtzZWwvb3JkZXIvZmluYWwgdGFzYXLEsW0ga2FidWzDvCB5b2suIHwKfCBSZWdyZXN5b24va2F5bmFrIHwgNDM3IGtvcnVuYW4gKyAxMCB5ZW5pIHRlc3QsIDExMyBwaW4sIDE1IHlvbCwgdjg2IHNuYXBzaG90LCB2ODcvaW5kZXgxMTIsIFJBVyB2ZSBDSSBrb250cm9sIGVkaWxkaS4gfAoKIyMgT24gw7xyw7xuIGthcGFuxLHFnyBrYXRtYW7EsQoKRS1ERVYtMTIwIHllZGkga2FyxZ/EsWxhxZ90xLFybWEgdmUgb24ga2FwYW7EscWfIGthdG1hbsSxIGtheWTEsW7EsTsgYEUxMC1DTE9TVVJFLUFVRElULm1kYCBnZXLDp2VrIGF1ZGl0IHRhYmxvc3VudSBva3VkdW0uIMOccsO8biBhdWRpdOKAmWkgb24ga2F0bWFuxLFuIHRhbWFtxLFuxLEgbm9ucGFzc2luZyBrYXlkZWRlcjsgYnUgU09VUkNFIGluY2VsZW1lc2kgb251IGRlxJ9pxZ90aXJtZXouCgp8IEthdG1hbiB8IEJ1IGluY2VsZW1lZGVraSBkaXNwb3NpdGlvbiB8CnwtLS18LS0tfAp8IFRhc2sgfCBUMDIwIGRhciBTT1VSQ0UgUEFTUzsgcmVnaXN0cnkgUkVWSUVXLCB0YXNrIERPTkUgdmV5YSAyMDYgw7xyw7xuIGlodGl5YWPEsSBrYXBhbsSxxZ/EsSBkZcSfaWwuIHwKfCBGZWF0dXJlIHwgRjEuOS4yIHlhbG7EsXogc3VudW0gZGlsaW1pOyBUMDIxIHZlIMO8cmV0aW0gZmVlZOKAmWkgSEVMRC4gfAp8IEZsb3cgfCBGTDEuOS4yIFBST1BPU0VEOyBTQ1ItVEJEIG9uYXlzxLF6LCBnZXLDp2VrIEUyRSBmbG93IGthYnVsw7wgeW9rLiB8CnwgUmVxdWlyZW1lbnQgfCBCUjA3MC8wNzEvMDczIGVrcmFuIGRhdnJhbsSxxZ/EsSBkb8SfcnVsYW5kxLE7IHNwb25zb3JsdWsgZG/En3J1bHXEn3UgZGXEn2lsLiB8CnwgRGVzaWduIHwgWWVkaSBib3VuZGVkIGthcsWfxLFsYcWfdMSxcm1hOyB0YW0gZ8O2cnNlbC90b2tlbi9kZXZpY2Uga2FidWzDvCB5b2suIHwKfCBBcmNoaXRlY3R1cmUgfCBFMSByZW5kZXIgdmUgZ3JhcGgga2FwxLFsYXLEsTsgYmFja2VuZC9wcm92aWRlci9zZWFtL3B1YmxpYyBjb250cmFjdCBrYWJ1bMO8IHlvay4gfAp8IERhdGEvbWlncmF0aW9uIHwgU2NoZW1hL21pZ3JhdGlvbiB5b2ssIGltbXV0YWJsZSBsaXN0ZTsgw7xyw7xuIG1pZ3JhdGlvbi9yb2xsYmFjay9yZXN0b3JlIGthbsSxdMSxIHlvay4gfAp8IFJlbGVhc2UgfCBTT1VSQ0UgQ0kgUEFTUzsgcHJvZHVjdGlvbiBhdXRob3JpemF0aW9uLCBtZXJnZS95YXnEsW4vbWFpbjgga2FidWzDvCB5b2suIHwKfCBQcm9kdWN0IHNjZW5hcmlvIHwgRml4dHVyZSAyMCDDtnJuZWs7IGdlcsOnZWsgc2F0xLFjxLEvdGVrbGlmL8O2ZGVtZS9zZXJ2aXMgc2VuYXJ5b3N1IHlvay4gfAp8IEdhcCBhdWRpdCB8IFQwMjEvZmVlZC9TQ1ItVEJEL3Byb2R1Y3Rpb24vcm91dGVyL3BoeXNpY2FsL2h1bWFuL2RldmljZS9yZWxlYXNlIGHDp8Sxazsgc8SxZsSxciBnYXAgaWRkaWFzxLEgeW9rLiB8CgpFMTAtQ0xPU1VSRS1BVURJVOKAmXRlIMO8csO8biDDp2FwxLFuZGFraSBla3NpayBmaXppa3NlbCBrYXnEsXRsYXIgdmUgYsO8dMO8biDDvHN0IGthdG1hbmxhcsSxbiBub25wYXNzaW5nIGR1cnVtdSBrb3J1bnVyLiBFM1IxIFJFVklFVy9FNSBJTl9QUk9HUkVTUyBpbGUgMTA4IERPTkUgLyA5OCBrYWxhbiAvIDIwNiB0b3BsYW0gc2F5YWPEsSBkZcSfacWfbWV6LgoKIyMgRXhhY3QgU09VUkNFIENJIHZlIGNhbmzEsSBQUgoKYHNvdXJjZS1jaS5qc29uYCBleGFjdCBTT1VSQ0UgSEVBRCBgMmVhMTRkYmI1MWEzMDE5YzgzZGFmMjk0MGQ4NjZmNDA1OThkZTU0ZGAgacOnaW4gMTcgdGFtYW1sYW5txLHFnyBiYcWfYXLEsWzEsSBrb8WfdSBpw6dlcmlyOiA4IHB1c2gsIDkgcHVsbF9yZXF1ZXN0IHZlIDggYWlsZSAoZWsgYXJjaGl0ZWN0dXJlIFBSIGtvxZ91c3UgZGFoaWwpLiBgc291cmNlLTxydW4taWQ+LmxvZ2AgUkFXIGJveXV0L1NIQSBkZcSfZXJsZXJpIG1hbmlmZXN0bGUgZcWfbGXFn2lyOyB0w7xtIGhlYWQvam9iL3N0ZXAvcmVzdWx0IGthecSxdGxhcsSxIG9rdW5kdS4gYHNvdXJjZS1jaS1yb290LXJlYWQuanNvbmA6IHJhd0hhc2hWZXJpZmllZCwgYWxsSGVhZEpvYlN0ZXBSZXN1bHRzUmVhZCwgYWN0dWFsUFJUM1N0ZXBzUmVhZCwgYXV0aFJlc3VsdE1hcmtlcnNSZWFkIHRydWU7IGluZGV4Um93cyAxMTIuCgp8IEFpbGUgfCBQdXNoIHwgUFIgfAp8LS0tfC0tLTp8LS0tOnwKfCBhcmNoaXRlY3R1cmUtY2hlY2tzIHwgMzgyODg1ODg5MTkgfCAzODI4ODU5NzY2OCwgMzgyODg1OTk1MDkgfAp8IEUxIHNoZWxsL3dpZGdldCB8IDM4Mjg4NTg4ODY4IHwgMzgyODg1OTc2NjEgfAp8IEUzIGNvbW1pdCBhdXRob3JpemF0aW9uIHwgMzgyODg1ODg5NjcgfCAzODI4ODU5NzgxOCB8CnwgRTMgbGl2ZSBhdXRoIHwgMzgyODg1ODkwNDIgfCAzODI4ODU5NzczMCB8CnwgRTUgY3VycmVudCBhdXRob3JpdHkgfCAzODI4ODU4ODkzMSB8IDM4Mjg4NTk3NTk0IHwKfCBFNCBvZmZsaW5lIGNvbXBvc2l0aW9uIHwgMzgyODg1ODkwNzcgfCAzODI4ODU5Nzc0MyB8CnwgRTYgcmVsZWFzZSBwb2xpY3kgfCAzODI4ODU4ODg3MCB8IDM4Mjg4NTk3NTMzIHwKfCBFOSBib3VuZGVkIHByb3Bvc2FsIHwgMzgyODg1ODg4ODAgfCAzODI4ODU5NzkyMyB8CgpIZXIgaWtpIGdlcsOnZWsgUFIgVDMgZ2F0ZSBqb2LigJnEsW5kYSBiZcWfIGFkxLFtIGRhIHN1Y2Nlc3M6IFNldCB1cCBqb2I7IENoZWNrb3V0IEthdnJpdmEgYXBwOyBUMyBjb25mb3JtYW5jZSArIGlkZW50aXR5IGdhdGU7IFBvc3QgY2hlY2tvdXQ7IENvbXBsZXRlIGpvYi4gUHVzaCBhcmNoaXRlY3R1cmUgcnVu4oCZxLFuZGEgVDMgYHNraXBwZWRgIHZlIHN0ZXAgbGlzdGVzaSBib8WfdHVyOyBwdXNoIFQzIGJhxZ9hcsSxIHNhecSxbG1hbcSxxZ90xLFyLiBBeW7EsSBTT1VSQ0UgRTEgQ0kgNDQ3IHRlc3QgUEFTUzsgbWltYXJpIENJIDQyIHRlc3Qvd29yc3QgZXhpdCAwLCBzZWNyZXQtcGF0dGVybiBzY2FuIHZlIGluZGV4IHJlYnVpbGQgUEFTUy4gRGnEn2VyIGFpbGUgc2F5xLFsYXLEsSBFMyAxMDcsIEU1IDU5LCBFNCAxNzAsIEU2IDUwLCBFOSA5LiBBdXRoIGpvYuKAmcSxIHNpZ251cC9zZXNzaW9uL2d1YXJkL2xvZ291dCB2ZSBwcml2YXRlIFN0b3JhZ2UvRGF0YSBBUEkvY2xpZW50LXJvbGUgYnlwYXNzIHJldCB0ZXN0bGVyaW5pIGl6b2xlIG9ydGFtZGEgUEFTUyBnw7ZzdGVybWnFn3RpcjsgYnUgcHJvZHVjdGlvbiBBdXRoIHZleWEgRTEgZmVhdHVyZSBrYWJ1bMO8IGRlxJ9pbGRpci4KCsSwbmNlbGVtZSBhbsSxbmRhIFtQUiAjMTIyXShodHRwczovL2dpdGh1Yi5jb20veHBpa2UtZGdtL2thdnJpdmEtYXBwL3B1bGwvMTIyKSBPUEVOLCBkcmFmdCwgYmFzZSBgbWFpbmAsIGJyYW5jaCBgY29kZXgvZTEtc3BvbnNvcmVkLW1hcmtpbmdgLCBsaXZlIGhlYWQgZXhhY3QgU09VUkNFIHZlIG1lcmdlIGVkaWxtZW1pxZ90aXIuIENhbmzEsSBQUiBib2R54oCZbmluIMO8c3QgZXNraSDDtnpldGkgc2FtZWhlYWQgQ0kvVDMgYmVrbGVuaXlvciBkZXJrZW4gYWx0dGFraSBnw7xuY2VsIENJIGLDtmzDvG3DvCAxNyBiYcWfYXLEsWzEsSBrb8WfdSB5YXptYWt0YWTEsXIuIEJ1IG5vbmJsb2NraW5nIGJvZHktb25seSBtZXRpbnNlbCB0dXRhcnPEsXpsxLFrdMSxcjsgUkFXIENJIHZlIGhlYWQgbWFrYnV6bGFyxLEgZ8O8bmNlbGRpciwgU09VUkNFIGRhdnJhbsSxxZ/EsW7EsSBkZcSfacWfdGlybWV6LiBQUiBib2R54oCZeWkgUm9vdCBnw7xuY2VsbGV5ZWNla3Rpci4gWm9ydW5sdSBhcnRpZmFjdCBhdHRhY2ggMTAwIGtpbWxpayBrYXBhc2l0ZXNpIG5lZGVuaXlsZSDDtm5jZSByZWRkZWRpbG1pxZ8sIGVza2kgZWtsZXIga29ydW5tdcWfdHVyLgoKIyMgU29uIHPEsW7EsXIgdmUgZGlzcG9zaXRpb24KCllhbG7EsXogYEM6XFVzZXJzXFhwaWtlXC5jb2RleFx0YXNrLXN0YXRlXGthdnJpdmEtZTEwMjBcc291cmNlLXdob2xlLXJldmlldy50eHRgIHlhesSxbGTEsS4gUmVwb3NpdG9yeSwgUFIsIHBsYW4sIHRlc3Qga2/Fn3VsYXLEsSB2ZSBkacSfZXIgdGFzay1zdGF0ZSBrYXnEsXRsYXLEsSBkZcSfacWfdGlyaWxtZWRpLiBTb251w6cgZXhhY3QgU09VUkNFIGnDp2luZGlyOyBzb25yYWtpIGNvbW1pdOKAmWUsIMO8cmV0aW0gdmVyaXNpbmUsIHNhdMSxY8SxeWEsIGt1bGxhbsSxY8SxIGNpaGF6xLFuYSB2ZXlhIMO8csO8bi9yZWxlYXNlIGthYnVsw7xuZSBnZW5lbGxlbm1lei4KCktheW5hayBow7xrbcO8OiBQQVNTIOKAlCBULUUxLTAyMCBleGFjdCBTT1VSQ0Ugc8SxbsSxcsSxbmRhLgpQUiBtZXRhZGF0YSBnw7Z6bGVtaTogMSBub25ibG9ja2luZywgYm9keS1vbmx5IGVza2kgw7Z6ZXQgdHV0YXJzxLF6bMSxxJ/EsS4K

## Aynı SOURCE gerçek CI makbuzu

38288599509 architecture-checks pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38288599509 RAW 47562 SHA256 4ace04d2131a18302025453d152d1e8798f3b463f855caa571554180d85000f2
- 114942872128 checks success; Set up job=success, Checkout kavriva-app=success, Run architecture suite (CI mode)=success, Secret-pattern scan (OUT-3 B-23; no keys/secrets may land in the tree)=success, Rebuild generated index (proof that generation is reproducible)=success, Post Checkout kavriva-app=success, Complete job=success
- 114942872648 t3-gate success; Set up job=success, Checkout kavriva-app=success, T3 conformance + identity gate=success, Post Checkout kavriva-app=success, Complete job=success

38288597923 e9-bounded-proposal-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38288597923 RAW 18384 SHA256 d708faeec69f0a861e6bcbef8fb8720b85221c1464a24efafcdd6d428dbed93d
- 114942866046 e9-tests success; Set up job=success, Checkout Kavriva=success, Test E9 internal proposals=success, Post Checkout Kavriva=success, Complete job=success

38288597533 e6-release-policy-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38288597533 RAW 28050 SHA256 32820c1377d245f40589d12bbbf6acecb7101b4e821f2c292625f90e935d2aa8
- 114942864154 e6-tests success; Set up job=success, Checkout Kavriva=success, Test E6 release policies=success, Post Checkout Kavriva=success, Complete job=success

38288597743 e4-offline-composition-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38288597743 RAW 56249 SHA256 7774f17705eacd76e47c5fe91078bd4ba6afd634e306ad64a9462c6161cfd849
- 114942865462 e4-tests success; Set up job=success, Checkout Kavriva=success, Test E4 internal composition=success, Post Checkout Kavriva=success, Complete job=success

38288597668 architecture-checks pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38288597668 RAW 47571 SHA256 85cc69d4919257819179c3b3e00fdae6b03941644293a1ceafc023a8ea225199
- 114942864955 checks success; Set up job=success, Checkout kavriva-app=success, Run architecture suite (CI mode)=success, Secret-pattern scan (OUT-3 B-23; no keys/secrets may land in the tree)=success, Rebuild generated index (proof that generation is reproducible)=success, Post Checkout kavriva-app=success, Complete job=success
- 114942865315 t3-gate success; Set up job=success, Checkout kavriva-app=success, T3 conformance + identity gate=success, Post Checkout kavriva-app=success, Complete job=success

38288597594 e5-current-authority-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38288597594 RAW 35655 SHA256 918c8db26599d340bd153b107f3eaa4cca6a96a088d6663d80e8a86aa39f93fd
- 114942864434 e5-tests success; Set up job=success, Checkout kavriva-app=success, Install pinned PostgreSQL test dependencies=success, Test E5 current authority decision=success, Post Checkout kavriva-app=success, Complete job=success

38288597818 e3-commit-authorization-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38288597818 RAW 67127 SHA256 3577c2261c8f72906d0c3e078874f8bc71ae0166ae3c894518f5d8496e898d7c
- 114942865700 e3-tests success; Set up job=success, Checkout kavriva-app=success, Install pinned PostgreSQL test dependencies=success, Test E3 commit authorization gate=success, Post Checkout kavriva-app=success, Complete job=success

38288597730 e3-live-auth-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38288597730 RAW 25640 SHA256 e5d66146786bd1af91eac271a33bc54f62d5c6ff5220e03f4fa700630468764d
- 114942865369 live-auth success; Set up job=success, Checkout Kavriva=success, Install pinned PostgreSQL test dependencies=success, Start isolated local Supabase Auth and apply migrations=success, Verify real Auth signup, current session, guarded effect and logout=success, Reject direct database and private Storage bypasses=success, Post Checkout Kavriva=success, Complete job=success

38288597661 e1-shell-widget-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38288597661 RAW 161527 SHA256 b42872b62e45fc1b60611ce03aa9c2b05b07dff89e36969e9b39e1ed4224d6b8
- 114942865246 e1-shell-tests success; Set up job=success, Checkout kavriva-app=success, Install exact Flutter source and verify effective SDK=success, Resolve only locked widget dependencies=success, Verify Dart format and analyze presentation=success, Run headless shell behavior and accessibility checks=success, Post Checkout kavriva-app=success, Complete job=success

38288589077 e4-offline-composition-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38288589077 RAW 54916 SHA256 88ae646a77975585acc39821ef1aef108a5c66f2efb9871ac38da018d28eb7d6
- 114942835768 e4-tests success; Set up job=success, Checkout Kavriva=success, Test E4 internal composition=success, Post Checkout Kavriva=success, Complete job=success

38288588880 e9-bounded-proposal-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38288588880 RAW 17051 SHA256 886b446b352f0dd57f18f9692a83664f1f6a79ff62ad05d91e6c88cd0e1009a8
- 114942835181 e9-tests success; Set up job=success, Checkout Kavriva=success, Test E9 internal proposals=success, Post Checkout Kavriva=success, Complete job=success

38288588870 e6-release-policy-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38288588870 RAW 26712 SHA256 9daa711cba7e2392da17276edbebcc35924b50615ae40c2508cef6fd3f2a85a7
- 114942834974 e6-tests success; Set up job=success, Checkout Kavriva=success, Test E6 release policies=success, Post Checkout Kavriva=success, Complete job=success

38288588919 architecture-checks push https://github.com/xpike-dgm/kavriva-app/actions/runs/38288588919 RAW 31019 SHA256 3eb8b098db5203e5cfa722e422ceccbd77c86dc6cad2bbbe06d21b53f80fd81f
- 114942835014 checks success; Set up job=success, Checkout kavriva-app=success, Run architecture suite (CI mode)=success, Secret-pattern scan (OUT-3 B-23; no keys/secrets may land in the tree)=success, Rebuild generated index (proof that generation is reproducible)=success, Post Checkout kavriva-app=success, Complete job=success
- 114942837423 t3-gate skipped

38288588967 e3-commit-authorization-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38288588967 RAW 64590 SHA256 8ea9606bf22c9b404303ce8ba9db2e88f3ce9eda991f16864cd31183aa04cd65
- 114942835448 e3-tests success; Set up job=success, Checkout kavriva-app=success, Install pinned PostgreSQL test dependencies=success, Test E3 commit authorization gate=success, Post Checkout kavriva-app=success, Complete job=success

38288588931 e5-current-authority-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38288588931 RAW 34258 SHA256 eddf806b70498aca26047bad12d495878398ab2af8105e6d2d98f6cb83ca0a58
- 114942835033 e5-tests success; Set up job=success, Checkout kavriva-app=success, Install pinned PostgreSQL test dependencies=success, Test E5 current authority decision=success, Post Checkout kavriva-app=success, Complete job=success

38288589042 e3-live-auth-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38288589042 RAW 24296 SHA256 6b2c1f475f1d3951d51fac93a1a545ba2e20ca338df180a347efc1fdb16d3b62
- 114942835771 live-auth success; Set up job=success, Checkout Kavriva=success, Install pinned PostgreSQL test dependencies=success, Start isolated local Supabase Auth and apply migrations=success, Verify real Auth signup, current session, guarded effect and logout=success, Reject direct database and private Storage bypasses=success, Post Checkout Kavriva=success, Complete job=success

38288588868 e1-shell-widget-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38288588868 RAW 162152 SHA256 5c725210ec893b9869670f1459c4c7cfdbc8051e36bf4584a94c93dd11208c61
- 114942835404 e1-shell-tests success; Set up job=success, Checkout kavriva-app=success, Install exact Flutter source and verify effective SDK=success, Resolve only locked widget dependencies=success, Verify Dart format and analyze presentation=success, Run headless shell behavior and accessibility checks=success, Post Checkout kavriva-app=success, Complete job=success
