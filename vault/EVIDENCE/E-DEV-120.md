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
result: "Yerel447 PASS; bağımsız REVIEW bekleniyor"
gate_verdict: "RECORDED yerel test; bağımsız REVIEW ve üretim HELD"
reviewer: none
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
