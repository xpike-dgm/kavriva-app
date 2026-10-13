---
test_id: E-DEV-123
contract_id_version: "SCR014/C1.3/F1.3.2/FL1.3.4 uncertainty/public-wire-v1"
subject_file: modules/e01-app/internal/shell/lib/uncertainty_execution.dart
subject_digest: f0aa62ec130fd824f2c3434d0ef78fb3b65259cc614c0844ac4bb1bd285eda88
result: "Yerel473/E4176 PASS; bağımsız REVIEW bekleniyor"
evidence_links: [vault/PROFILES/uncertainty-execution-render.md, vault/PACKS/P-E1-022b.md, vault/REGISTRY/T-E1-022b.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-122-E10-GOVERNED-PATHS-FOR-T-E1-022b.md.snapshot, modules/e01-app/internal/shell/lib/uncertainty_execution.dart, modules/e01-app/internal/shell/test/uncertainty_execution_test.dart, modules/e01-app/internal/shell/test/fixtures/uncertainty_execution_reading_questions.json, modules/e01-app/internal/shell/lib/offline_safety_status.dart, modules/e04-offline/public/offline_safety_reader.py, modules/e04-offline/tests/test_offline_safety_reader.py, modules/e01-app/internal/shell/test/fixtures/offline_safety_status_wire.json]
gate_verdict: "RECORDED yerel proof; bağımsız REVIEW ve üretim HELD"
reviewer: none
timestamp: 2026-10-14
version: 1
purpose: Güvenlik belirsizliğini kalıcı göstererek doğrulanmamış çevrimdışı ilerlemeyi kapalı tutmak
domain: first-use
module: e01-app
owner: E1
implements: [ADR-008, ADR-009, C1.3, F1.3.2, FL1.3.4, SCR-014, BR-074, CON-004, CON-005, R-001, R-003, R-004, R-007, R-009, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: uncertainty-banner-and-negative-offline-public-seam
tasks: [T-E1-022b]
tests: [modules/e01-app/internal/shell/test/uncertainty_execution_test.dart, modules/e04-offline/tests/test_offline_safety_reader.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-14
depends_on: [V-E1-UNCERTAINTY-001]
used_by: [V-E1-UNCERTAINTY-001, P-E1-022b, T-E1-022b]
evidence: []
supersedes: []
status: RECORDED
---

# Kalıcı belirsizlik — sınırlı ekran ve public negatif E4 bağlantısı

Plan fa914f013fdcd032faed876689092da245989459; BASE a2f9d2d8d71f5d7ffc4b04a601c3a9c10a770a6e; PRECODE 47adf3d645b93bc263eab5a11f1537ef53caac5e; public wire tüketici adresi kod öncesi onarımı f15cbaf60521862a4d56d99dcd580662f8306452. T022a PR124 gerçek normal merge/main8 ile sınırlıDONE, bağımsızSOURCE/FINAL kabulü. Gerçek111/95/206; yeni aday sayaç ilerletmez. `vault/PACKS/P-E1-022b.md`; `vault/REGISTRY/T-E1-022b.md`; `vault/EVIDENCE/E-DEV-123.md`.

## Davranış ve kaynak sınırı

E1 sarıcısı belirsizlik uyarısını kaydırılan gövdenin dışında sabit üst alanda tutar; tam/kısa kullanıcı seçimi ve mevcut ActiveStepView/CondensedExecutionView korunur. E4ün public Python okuyucusu gerçek mevcut production_gate fonksiyonunu aynı sekiz alanlı display-context kopyasıyla çağıran testte JSON wire üretir; E1 yerel codec sadece ilanlı public wireı tüketir, E4 private import etmez. Bu sözleşme sadece authorityNONE/physicalProgressionFalse durumları taşır; eksik/exception/malformed/ALLOW veya bilinmeyen sürüm asla izin olmaz. Gerçek mevcut E4 production_gate zaten HELD döner; kanonik risk/süre/uygunluk/şifreli runtime/recovery producer binding HELD. Bu public kanal pozitif yetki veya offline fiziksel başlatma sağlamaz.

Bekleyen/mismatch kaynak durumu korunur; önceki holdReason korunup E4 nedeni eklenir. Kaynak/görsel/safety/proof/adım alanları ve recovery callbackleri aynı kalır. Normal adım bildirimi eski ActiveStepView guardı üzerinden kapalıdır; E4 doğrulanmamışken eski renderer kullanılabilir teknik talimat/görseli eylem talimatı olarak göstermez. Bu bilinçli fail-closed davranıştır, yeni aktif talimat veya yeni roadside ekranı değildir. Tam/kısa seçimi normal ilerleme/sonuç/izin üretmez. Parent aynı kaynağı tazelediğinde seçim korunur; farklı wire/bağlam/adım eski seçimi sıfırlar. Reader yalnız sunum bağlamı alır; bu kimlik, kanonik durum veya kriptografik onay kanıtı değildir. Hiçbir DB/hesap/ağ/depolama/gerçek fiziksel etki yoktur.

## Gerçek yerel doğrulama

473normal =464korunan+9yeni; ayrı native10=9+isteğe bağlıcapture, normal toplama eklenmez. E4 176=170korunan+6yeni public producer/integration negatif. Yeni wire codec tam8tuple/immutable snapshot/UNKNOWNschema/ALLOW/true/int0/eksik recovery/primitive/throwingMap reddi; Python provider exception/private hata metni sızmaması/yanlış authority/pozitif progression/yanlış context ve mutasyon sınırı. Gerçek existing E4 production_gate aynı context kopyasını aldı; public çıktı JSON-roundtrip ile E1 wire fixture tüketimine bağlandı. E1 fixture byte eşliği context-forwarding onarımından sonra yeniden gerçekcall ile doğrulandı; bu üretim veri/feed kanıtı değildir. 54formatdosyası0değişiklik/analyze0. KlavyeTabEnterSpace/liveRegionflags/52kontrol;9genişlik-yazı kombinasyonu×4durum×2form=72tamkaydırma, normal gönderim0, recoveryrequestctx ve güvenli sonuç kaydetmeme.

Native-r2:22örnekdurum96PNG63özgün33tam byte eşi;390×844, scale1ve3, doğal başlangıç/orta/son kapsama. Root tüm63ü kapsadı:önceden gerçekten açılan r1 ilk20PNGyle tam byteeş20 ve gerçekten açılan43yeni. İlk r1 diğer30unique için fullRootokuma iddiası yok; r1 kabulkanıtı değildir. Her96byteSHA/IHDR/fullalias ve fixedbandRect/offset/usable-body gap doğrulandı. Ayrı read-onlyRGBA üstband pixel karşılaştırmasında herdurumun bütün kareleri ilk gerçek kareyle aynı; pixelmismatch0. Görüntüler düzenlenmedi/birleştirilmedi. Gerçek cihaz/insan/ekran okuyucu ve üretim/roadside/yayın HELD.

## Özgün denemeler ve onarımlar

İlk helper nonexistent external workdir yüzünden hiç başlamadı; repo değişmedi. PRECODE helper gitdiffin untracked dosyaları saymadığı assertionda durdu; aynı3yol doğru untracked/staged doğrulamasıyla koddanönce commit edildi. Native helperJS item interpolation ReferenceError hiç çalışmadı; repo değişmedi. İlk Dart dış-package bağıl import target-r1 compileFAIL; test-only fileURI/absolute path ya da dependency değişimi yapılmadı, publicwire tüketici codec E1e kod öncesi adres onarımıyla taşındı. İlk kopya codecaslı external first-unimportable-public-codec.dart korunur. target-r2 8PASS1FAIL immutable liste container identitysi gereksiz bekleniyordu; öğelerin aynı ve sıralı kaldığı gerçek semantic predicate düzeltildi, target-r3 9PASS. analyze-r1 null-aware/deprecated/unnecessary import uyarıları; yeni capture eklenince analyze-r2 eksik RenderRepaintBoundary import compileerror; SDK gerçek flagsCollection ve gerekli rendering show import ile analyze-r3/r4 sıfır. native-r1/full-r1 10/473PASS ancak uzun instruction güvenlik nedeniyle zaten gizlendiği için görünür uzunmetin kapsamı sayılmadı; Root görünür longholdReason ve scale3 senaryosunu düzeltti, native-r2/full-r2 güncel10/473PASS. Public callbackin tamdisplaytuplesı ile gerçek E4 okuyucu çağrısı güçlendirildi; wirefixture baytları aynı, yalnız E4r4 hedef176 yeniden geçti. Önceki tümRAWlog ve native/fixtureorigin makbuzları korunur; başarısız/eksik deneme kabul gibi sunulmaz.

## Yedi tasarım karşılaştırması

| Karşılaştırma | Yapılan çalışma | Kalan sınır |
|---|---|---|
| Tam ekran | 22durum96doğalviewport, sabitwarning ve eski guardedbody/fallback/safety/recovery | Yeniaktif talimat/roadsideSCR yok |
| Komşu ekran | SCR014/015/018 eski kod/test pinleri; aynıcallback/safety/öğrenme/kapanış anlamı | Gerçekrouter/provider/komşu fizikselakış HELD |
| Durum | Missing/forged/foreign/restriction/floor/untrusted/stale/unknown/error/busy/nohandler/largeheld | Üretim source/trust/encryption yok |
| Responsive |72tamkaydırma320390768×1/2/3×4durum×2form; uzun görünen Türkçe; scale3 doğalPNG | Gerçek cihaz/windowmatrix/nihai sayısal değerler HELD |
| Erişilebilirlik | GerçekTabEnterSpace/52control/focus/liveRegionflags; inherited16type ve mevcut w600notice | Gerçekassistivetechnology/screenreader HELD |
| Kaynak | Aynı E01/U04/FAM03/V10 workingrefs; safety belirsizliği taskhierarchy önüne çıkabilir; sabitnotice boundedadaptation | Finaltoken/pixel/brand/roadside yeniSCR HELD |
| Regresyon | 464E1/170E4 korunur;161BASEpin; publicwire8tuple/bodydata/callbackprojections; eski subject rehash edilmez | Üstürün/activation/release kabulü değil |

## On kapanış katmanı

1. görev: T022b sınırlı sunum/publicnegatifkanal REVIEW adayı, bağımsız kabul yok.
2. feature: F1.3.2 bütün üretimkabulü HELD.
3. flow: FL1.3.4PROPOSED ve yeniSCR-TBD HELD; mevcutSCR014 içsarıcı.
4. requirement: BR074 kalıcı uyarı/publicfailclosed; üretimuygunluk/binding HELD.
5. design: yedi boundedcomparison/doğalPNG/72case; finaltokens/insan/cihazHELD.
6. architecture: mevcutE4←E3/E1 tüketir, sadecepublicwire/E1localdecode; noprivateimport/newruntimeedge.
7. data: wire displayfixture/projection; kanonik kimlik/risk/floor/SQL/encryptedstorage yok; önceki veriler korunur.
8. release: henüz yeniPR/CI/T3/FINAL/merge/main8 yok; yayınHELD.
9. product scenario: realE4 HELDmodelcall→publicwire→E1fixturedecode→closedrenderer gerçek test; fizikselmotosiklet/human yok.
10. gaps: üretimE4trust/crypto/risk/classification/windows/recovery/sourceprovider/route/device/store boşlukları açık; E3R1REVIEW/E5IN_PROGRESS.

## Konu LF özetleri

- `modules/e01-app/internal/shell/lib/uncertainty_execution.dart` SHA256 f0aa62ec130fd824f2c3434d0ef78fb3b65259cc614c0844ac4bb1bd285eda88
- `modules/e01-app/internal/shell/test/uncertainty_execution_test.dart` SHA256 4834811789739e90a1a7ef74a2917d342ad4b2f7820501295e8b01d1bd284dba
- `modules/e01-app/internal/shell/test/fixtures/uncertainty_execution_reading_questions.json` SHA256 be7af426e52de1cf5c51f71f2032530a108bca8e4b8ae576053a3a480f6c920f
- `modules/e01-app/internal/shell/lib/offline_safety_status.dart` SHA256 f86f7ab8fd6a0a3a35b95b1b1f788245c7bb63f773f50be8fd54170035222286
- `modules/e04-offline/public/offline_safety_reader.py` SHA256 b03ebad5e332f5a87a21b42ee610a2552da77f179fff884d7bd603e0b191de8b
- `modules/e04-offline/tests/test_offline_safety_reader.py` SHA256 c481a774a3032c74f2e1511eec7b572c32d2265aa8b84ec767766e1e9df33862
- `modules/e01-app/internal/shell/test/fixtures/offline_safety_status_wire.json` SHA256 64ed27522abf12e7674db4576b465d50a9824d216da06842aaded683c03e0b5a

## Gerçek RAW komut kayıtları

- target-r1.log 3945 bayt SHA256 79af1b43b179e85f7c7eca64ca3dcecc3ef05174eb0f70b1386d476a60d14270
- target-r2.log 3073 bayt SHA256 648214dfec6b21bc32d5dd34c0dcdf1a512fcb3e956efeeea328fae2c337a6a0
- target-r3.log 1055 bayt SHA256 63f6ba03fc4455935bf62f803a37089902a1657f9ca695b9a80255408aa0cded
- analyze-r1.log 838 bayt SHA256 28f0adcc5e83f8f3793a9e22c370b52ddf590ea60d5adc7b794082dcee034029
- analyze-r2.log 373 bayt SHA256 9b828bef0e80bbe6e360589f82ff0a5fef6f04b48d4853f32ac8db641c4ec33b
- analyze-r3.log 96 bayt SHA256 c5d6c27eddb3dafbc66fd7937cb95b3e5151d6ac13c4ee2c328e43aed372d206
- analyze-r4.log 96 bayt SHA256 9fded4258e74ef9ac6347d1c3a859a430ccf8cc1b12dbd48d214d46dfb155dc3
- format-r1.log 48 bayt SHA256 b2dcc7a1f8e12397e63638fa1c7cec0ef995c0031f25aa5e1bfe5ada1031cccf
- format-r2.log 48 bayt SHA256 8ea2b4ed2ee8d61fac0e3446d00189fca282e71ff4312a04fb695b5d75a9b082
- format-r3.log 48 bayt SHA256 028fb28d89b4467001e66e7d204eacc0e016489fcbe9648151b04ecc381af4c4
- native-r1.log 1137 bayt SHA256 8669fc2504aebcd9932b49a63a622c6b561e501e0148be61b4a9811463834306
- native-r2.log 1137 bayt SHA256 a4b75dfffb9ed5a86d68eb35879b11c30a7bb84f2d62b98f0aa903968955be6c
- full-r1.log 110904 bayt SHA256 1fd188e1faf5f5d8033ca288b103717ba6021891d6e7a51ba8769c2f37ba814d
- full-r2.log 110797 bayt SHA256 919a8646939b0560599b6d53ddb262e8c959fbed9449c23ba1bc3d0cae90592c
- e4-r1.log 30068 bayt SHA256 3c52bece17757d66d24250a080a0a0dd2205567a7b7b31731ef9e1d4d3f04770
- e4-r2.log 30068 bayt SHA256 9087090f89e2191436a2c09b2bf9c60d99c665a58112a17ac3e6854ef6d6c85f
- e4-r3.log 30068 bayt SHA256 44bab44dc69ca07049d390c844dca7199d7baa12f4a9f7c73fe39f2b2e1619df
- e4-r4.log 30068 bayt SHA256 d3d0a308351d70efc601bbb8443635faf1b20aeae0a4901e3d9364f71aa044b5

wire-fixture-origin.json 803 bayt SHA256 04f68818ed368a643ae77b26d6e78975969aba8d2f448454d2cb04d53ca68a95

<pre>{
  &quot;producer&quot;: &quot;modules/e04-offline/public/offline_safety_reader.py&quot;,
  &quot;producerSHA256&quot;: &quot;b03ebad5e332f5a87a21b42ee610a2552da77f179fff884d7bd603e0b191de8b&quot;,
  &quot;upstream&quot;: &quot;modules/e04-offline/internal/offline_eligibility.py production_gate&quot;,
  &quot;upstreamLFsha256&quot;: &quot;b382c2f1cffb42a7c507c3a0c301bb1af8e0e25e744092b9bd281d7e1413801b&quot;,
  &quot;fixture&quot;: &quot;C:\\Users\\Xpike\\.codex\\worktrees\\e4-required-auto-transfer\\kavriva-app\\modules\\e01-app\\internal\\shell\\test\\fixtures\\offline_safety_status_wire.json&quot;,
  &quot;fixtureSHA256&quot;: &quot;64ed27522abf12e7674db4576b465d50a9824d216da06842aaded683c03e0b5a&quot;,
  &quot;actualCallExecuted&quot;: true,
  &quot;canonicalAuthority&quot;: &quot;NONE&quot;,
  &quot;productionData&quot;: false,
  &quot;currentCompleteDisplayContextForwarded&quot;: true,
  &quot;fixtureBytesUnchangedAfterContextForwarding&quot;: true
}</pre>

root-native-r2-read.json 6077 bayt SHA256 243d288de087464053c81713daa44fbe33f7e84731b494cc04f6d29ce88680c3

<pre>{
  &quot;allCurrentUniqueCovered&quot;: true,
  &quot;cases&quot;: 22,
  &quot;files&quot;: 96,
  &quot;unique&quot;: 63,
  &quot;aliases&quot;: 33,
  &quot;newUniqueActuallyOpened&quot;: 43,
  &quot;oldUniqueActuallyOpenedAndFullByteEqual&quot;: 20,
  &quot;fullByteAliasComparisons&quot;: true,
  &quot;bandRectFixedAndActualHeaderPixelsUnchanged&quot;: true,
  &quot;newFilesOpened&quot;: [
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-error-short-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-no-handler-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-no-handler-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-long-full-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-long-full-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-long-short-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-3.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-4.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-5.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-6.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-7.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-8.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-9.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-10.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-11.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-12.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-13.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-14.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-15.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-16.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-17.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-full-18.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-3.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-4.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-5.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-6.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-7.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-8.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-9.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-10.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-11.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-12.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-13.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-14.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-15.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-16.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-large-short-17.png&quot;
  ],
  &quot;oldCovered&quot;: [
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-full-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-full-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-full-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-short-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-missing-reader-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-foreign-tuple-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-foreign-tuple-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-cached-restriction-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-untrusted-package-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-untrusted-package-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-stale-dependency-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-missing-step-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-missing-step-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-original-held-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-original-held-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-missing-safety-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-busy-short-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-busy-short-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-busy-short-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1022b\\native-r2-error-short-0.png&quot;
  ],
  &quot;visibleLongHeldTextUsed&quot;: true,
  &quot;productionDeviceProof&quot;: false
}</pre>

native-r2-header-pixel-audit.json 207 bayt SHA256 684636c7be5921698f95a9dc366655dac41a0dba9210520e7c1af662f6bd65ef

<pre>{
  &quot;perCaseSameExpectedHeader&quot;: true,
  &quot;headerPixelMismatches&quot;: [],
  &quot;method&quot;: &quot;Read-only RGBA top fixed-band pixels compared with each case first actualPNG; excludes lower two raster boundary rows&quot;
}</pre>

|Durum|Parça/Ölçek|Offset/End|Sabit band|Bayt|SHA256|RAW dosya|
|---|---|---|---|---|---|---|
|full|0/1.0|0.0/683.0|0.0/35.0|83816|04a4148a396c0574cf9768db155deaa8582dbdc219a6aa389b19bd7ec519ebc3|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-full-0.png|
|full|1/1.0|600.0/683.0|0.0/35.0|62040|79dd9337e85ea379ba8b68dcfb72a179db0168f98d63362b61feaad7b35f68e5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-full-1.png|
|full|2/1.0|683.0/683.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-full-2.png|
|short|0/1.0|0.0/683.0|0.0/35.0|83987|5526bc99013db050c0834829543cad48b1434e44ebe450c724639cc48dc10ebe|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-short-0.png|
|short|1/1.0|600.0/683.0|0.0/35.0|62040|79dd9337e85ea379ba8b68dcfb72a179db0168f98d63362b61feaad7b35f68e5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-short-1.png|
|short|2/1.0|683.0/683.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-short-2.png|
|missing-reader|0/1.0|0.0/683.0|0.0/35.0|84544|8165c554d5859e7e3f4d865b21451c3fd09d1f99213618684d62040544fdea86|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-missing-reader-0.png|
|missing-reader|1/1.0|600.0/683.0|0.0/35.0|62040|79dd9337e85ea379ba8b68dcfb72a179db0168f98d63362b61feaad7b35f68e5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-missing-reader-1.png|
|missing-reader|2/1.0|683.0/683.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-missing-reader-2.png|
|forged-allow|0/1.0|0.0/683.0|0.0/35.0|84544|8165c554d5859e7e3f4d865b21451c3fd09d1f99213618684d62040544fdea86|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-forged-allow-0.png|
|forged-allow|1/1.0|600.0/683.0|0.0/35.0|62040|79dd9337e85ea379ba8b68dcfb72a179db0168f98d63362b61feaad7b35f68e5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-forged-allow-1.png|
|forged-allow|2/1.0|683.0/683.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-forged-allow-2.png|
|foreign-tuple|0/1.0|0.0/683.0|0.0/35.0|84843|b983e3415f022e917aef68ad4f0b0b22b28616501d52e831e0fed40af9351b96|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-foreign-tuple-0.png|
|foreign-tuple|1/1.0|600.0/683.0|0.0/35.0|63747|44fdf697c279582b783b8d2867e041007c45e63247d7dee98ae2f1392d392ea5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-foreign-tuple-1.png|
|foreign-tuple|2/1.0|683.0/683.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-foreign-tuple-2.png|
|cached-restriction|0/1.0|0.0/683.0|0.0/35.0|86420|98ddc1c2d1db621fa10f261af604fdca9c1b0bd54e31e491d2a38a605eeec5a1|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-cached-restriction-0.png|
|cached-restriction|1/1.0|600.0/683.0|0.0/35.0|63747|44fdf697c279582b783b8d2867e041007c45e63247d7dee98ae2f1392d392ea5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-cached-restriction-1.png|
|cached-restriction|2/1.0|683.0/683.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-cached-restriction-2.png|
|cached-generation|0/1.0|0.0/683.0|0.0/35.0|86420|98ddc1c2d1db621fa10f261af604fdca9c1b0bd54e31e491d2a38a605eeec5a1|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-cached-generation-0.png|
|cached-generation|1/1.0|600.0/683.0|0.0/35.0|63747|44fdf697c279582b783b8d2867e041007c45e63247d7dee98ae2f1392d392ea5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-cached-generation-1.png|
|cached-generation|2/1.0|683.0/683.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-cached-generation-2.png|
|untrusted-package|0/1.0|0.0/683.0|0.0/35.0|85304|f6f167b3e1320cad625167611e8ba05e6a429ddd37ad9c965eb14cf429802ce7|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-untrusted-package-0.png|
|untrusted-package|1/1.0|600.0/683.0|0.0/35.0|62646|954617a9b5b7eb57db68ce2e372b08312730ac325ec3c84c3ed9472db179f1c5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-untrusted-package-1.png|
|untrusted-package|2/1.0|683.0/683.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-untrusted-package-2.png|
|stale-dependency|0/1.0|0.0/683.0|0.0/35.0|85122|85532f5a27ed6561145a0334f714ad390382b09e9d2b6047d930875d9410d703|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-stale-dependency-0.png|
|stale-dependency|1/1.0|600.0/683.0|0.0/35.0|62040|79dd9337e85ea379ba8b68dcfb72a179db0168f98d63362b61feaad7b35f68e5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-stale-dependency-1.png|
|stale-dependency|2/1.0|683.0/683.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-stale-dependency-2.png|
|unknown-risk|0/1.0|0.0/683.0|0.0/35.0|85122|85532f5a27ed6561145a0334f714ad390382b09e9d2b6047d930875d9410d703|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-unknown-risk-0.png|
|unknown-risk|1/1.0|600.0/683.0|0.0/35.0|62040|79dd9337e85ea379ba8b68dcfb72a179db0168f98d63362b61feaad7b35f68e5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-unknown-risk-1.png|
|unknown-risk|2/1.0|683.0/683.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-unknown-risk-2.png|
|reader-error|0/1.0|0.0/683.0|0.0/35.0|83987|5526bc99013db050c0834829543cad48b1434e44ebe450c724639cc48dc10ebe|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-reader-error-0.png|
|reader-error|1/1.0|600.0/683.0|0.0/35.0|62040|79dd9337e85ea379ba8b68dcfb72a179db0168f98d63362b61feaad7b35f68e5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-reader-error-1.png|
|reader-error|2/1.0|683.0/683.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-reader-error-2.png|
|missing-step|0/1.0|0.0/326.0|0.0/35.0|59653|2473ebed8bdf662d3e060d26454e33076b9e33cb1a292338b7259c6e158b7b28|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-missing-step-0.png|
|missing-step|1/1.0|326.0/326.0|0.0/35.0|70266|603443249c8fb4066034a5337bd70acb5213e686c0ba9a3a6fe293a5d863352a|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-missing-step-1.png|
|original-held|0/1.0|0.0/702.0|0.0/35.0|89109|1411b5be2f0202c40833e8759dfd70b17664fefc5ded45b956b075233c60381b|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-original-held-0.png|
|original-held|1/1.0|600.0/702.0|0.0/35.0|64647|d3cdb741c759b6e063da602f89d4c8c5173bdaef798f6d921c9dc54cc0c7a527|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-original-held-1.png|
|original-held|2/1.0|702.0/702.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-original-held-2.png|
|missing-safety|0/1.0|0.0/452.0|0.0/35.0|68077|eb8e63d1c22e9ec40fb19cf5842b75a21fccf285695123fcd9acb3afb6133661|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-missing-safety-0.png|
|missing-safety|1/1.0|452.0/452.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-missing-safety-1.png|
|missing-visual|0/1.0|0.0/683.0|0.0/35.0|83987|5526bc99013db050c0834829543cad48b1434e44ebe450c724639cc48dc10ebe|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-missing-visual-0.png|
|missing-visual|1/1.0|600.0/683.0|0.0/35.0|62040|79dd9337e85ea379ba8b68dcfb72a179db0168f98d63362b61feaad7b35f68e5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-missing-visual-1.png|
|missing-visual|2/1.0|683.0/683.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-missing-visual-2.png|
|busy-short|0/1.0|0.0/779.0|0.0/35.0|86039|d419150be92f72bf54121578862f60c38f7d886e1dbdaf481a7b679d711490c5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-busy-short-0.png|
|busy-short|1/1.0|600.0/779.0|0.0/35.0|63070|f5f25f0a34b0831a9fddfeac777291b7fe973d28266ce4ac4bbf85c507115168|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-busy-short-1.png|
|busy-short|2/1.0|779.0/779.0|0.0/35.0|66874|1ca797fbb6e0393c338439ec8c5e6306828a6ea55ad6689974e5003f51719b25|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-busy-short-2.png|
|error-short|0/1.0|0.0/779.0|0.0/35.0|89145|76c97fb876a3a9af6290a6786fac3c9b89ad396b72531155be1791e06f40f817|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-error-short-0.png|
|error-short|1/1.0|600.0/779.0|0.0/35.0|66149|311f23c01c51fcb6caa943c06fa167b0e5428ae1381811b8c56cf536b0ea90fd|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-error-short-1.png|
|error-short|2/1.0|779.0/779.0|0.0/35.0|66874|1ca797fbb6e0393c338439ec8c5e6306828a6ea55ad6689974e5003f51719b25|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-error-short-2.png|
|no-handler|0/1.0|0.0/733.0|0.0/35.0|83987|5526bc99013db050c0834829543cad48b1434e44ebe450c724639cc48dc10ebe|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-no-handler-0.png|
|no-handler|1/1.0|600.0/733.0|0.0/35.0|61892|e0ec06b6b2f55eac648a4c37cd7c2b352ef3db47f006f49eae08414f51fd3aad|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-no-handler-1.png|
|no-handler|2/1.0|733.0/733.0|0.0/35.0|67661|9bdf096fbd58b4289fe6d0788954f0db4d35415be13c0e11f9fab7c5298122c8|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-no-handler-2.png|
|long-full|0/1.0|0.0/987.0|0.0/35.0|122647|3094855c43dc2a2aae0243579a35227e201dbf4ffdccfc5ce88874e8d7b6f3b0|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-long-full-0.png|
|long-full|1/1.0|600.0/987.0|0.0/35.0|104226|0f3e7cbba4c3768911b37b30f8bd663eaaac2d37e212865c83ba96b776061ffa|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-long-full-1.png|
|long-full|2/1.0|987.0/987.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-long-full-2.png|
|long-short|0/1.0|0.0/987.0|0.0/35.0|122821|949342d735bc4f371df71dca8a63e1e79d21ae5e4405783bc36835e09045743a|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-long-short-0.png|
|long-short|1/1.0|600.0/987.0|0.0/35.0|104226|0f3e7cbba4c3768911b37b30f8bd663eaaac2d37e212865c83ba96b776061ffa|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-long-short-1.png|
|long-short|2/1.0|987.0/987.0|0.0/35.0|65917|366251d41dafe4ea725bb86e7b1ce58d88b4dac8a6940091e405a3bf18d41888|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-long-short-2.png|
|large-full|0/3.0|0.0/10730.0|0.0/190.0|56686|387b24b52f4591cb4fb827791a4e84395016bc83f9c4b99a100f348f8ae93124|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-0.png|
|large-full|1/3.0|600.0/10730.0|0.0/190.0|57928|7106602d1873cd2a28914aeb8d3f8a2f228f319042a8d271fb26971ec19c7cce|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-1.png|
|large-full|2/3.0|1200.0/10730.0|0.0/190.0|63361|bf72c562e56920ee6dad1333e2581729ca1b6a153beff740850b1fbafb97fde6|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-2.png|
|large-full|3/3.0|1800.0/10730.0|0.0/190.0|70100|6562fa660c3041802d71411db07c2ab3d1e58a3f027aebd20a613af6b807b38a|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-3.png|
|large-full|4/3.0|2400.0/10730.0|0.0/190.0|68209|d9c643eb9794df94aa494257b51e1f30097ff877484e0af39926e872e0460569|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-4.png|
|large-full|5/3.0|3000.0/10730.0|0.0/190.0|88108|e4eee643a07824c3f07023f78ae1f3251ca34843d76efc0832468e0eabdf0786|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-5.png|
|large-full|6/3.0|3600.0/10730.0|0.0/190.0|85429|1665bac37d5c1b4f1e7640c1ffc7178f0c7803204cbe6e6fc7f1d09cf7480bd9|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-6.png|
|large-full|7/3.0|4200.0/10730.0|0.0/190.0|88162|8e6a1c1b428531751e61ffff9d0ac7467d358173a473ef9bb9ee1fbd70dec6f1|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-7.png|
|large-full|8/3.0|4800.0/10730.0|0.0/190.0|84780|20c11e9de8066277e37e98554084605143b672d2c30702aca0977bd0d626588c|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-8.png|
|large-full|9/3.0|5400.0/10730.0|0.0/190.0|82614|9e452c8b1b9c5792e1f786fb8b42f05a076df631e202cfb53f697a9c44c9ee9c|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-9.png|
|large-full|10/3.0|6000.0/10730.0|0.0/190.0|82795|58b14c844e1a181bf000029de9aef43009287f4d93da56dfc8c5569f69f585bd|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-10.png|
|large-full|11/3.0|6600.0/10730.0|0.0/190.0|57098|9e6e9781812e3a039e12d169a808006b5a7f22cb27b6899dcbe6f88bf96cccba|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-11.png|
|large-full|12/3.0|7200.0/10730.0|0.0/190.0|51617|a4922c34a72ee9d5092a2d6930e1da226546106747e0826d77bab7601923cdd2|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-12.png|
|large-full|13/3.0|7800.0/10730.0|0.0/190.0|55641|4d396b043cbe3d51dbaa35dea255874c806634cb04192f9b59b762729b41af5f|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-13.png|
|large-full|14/3.0|8400.0/10730.0|0.0/190.0|49854|e2c2db2c2d8c3dc8eee04240104890f93cdb78db903624af75ad58962957c103|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-14.png|
|large-full|15/3.0|9000.0/10730.0|0.0/190.0|56666|df4c928ecfdb194baf88762644ee45763c4ab76c62d88c997eeb177472902db9|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-15.png|
|large-full|16/3.0|9600.0/10730.0|0.0/190.0|60893|b7618235faa4119c70a15b9eae454a72a7cd2ab3c392ae15209abaf39425d2e7|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-16.png|
|large-full|17/3.0|10200.0/10730.0|0.0/190.0|57292|3f236dbd1c1730c31e7b8ca047025e621b791ef1ddad0ec01dbc976f558db7d8|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-17.png|
|large-full|18/3.0|10730.0/10730.0|0.0/190.0|56405|c4663b9e6f39a3c54f35bb6d2c97c683f4e1865b25498ccc295df51cecdf5499|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-full-18.png|
|large-short|0/3.0|0.0/10788.0|0.0/190.0|53516|a7b6f6e69726b2879b6325e0503bf65cb0819d9b8da2e39521678c4912747616|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-0.png|
|large-short|1/3.0|600.0/10788.0|0.0/190.0|59345|45724d2fb33877e4998918b24d6307faa07def625876c5837f53db8990a4e3a4|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-1.png|
|large-short|2/3.0|1200.0/10788.0|0.0/190.0|63067|ce0c4d6d33f21c1904f909162102fb6405e309808d6ca49e7826b48f7339fdcb|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-2.png|
|large-short|3/3.0|1800.0/10788.0|0.0/190.0|70185|a5b09df353259624b00dd8e63208bd0657624ce07b3e5bd40def1f8f4e0d16d7|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-3.png|
|large-short|4/3.0|2400.0/10788.0|0.0/190.0|67906|317ffef86d708b6069478c6e359484b1d61a7e0e7bc639dad1231afd5dba6e51|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-4.png|
|large-short|5/3.0|3000.0/10788.0|0.0/190.0|88585|9663803bc0a152416737104d9193c08fa5fc4089f040d6598172082376e5e3af|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-5.png|
|large-short|6/3.0|3600.0/10788.0|0.0/190.0|85324|27f8b3680b3b17e4555fbde20823f8cd136e38a0e1fc4aa387c046838f692aea|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-6.png|
|large-short|7/3.0|4200.0/10788.0|0.0/190.0|88118|62c3506a7f9cb61e689e877ada228a3fe3709fed28be49ae85620df83500b8aa|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-7.png|
|large-short|8/3.0|4800.0/10788.0|0.0/190.0|88710|7affb6e96b4708edb21913cade55e53cd462ca498bb68b066ce9cdee52016684|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-8.png|
|large-short|9/3.0|5400.0/10788.0|0.0/190.0|85065|7c54d3354e314b6a1e11624251546848d7aa13552dce606f14ca50d4f79e8afc|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-9.png|
|large-short|10/3.0|6000.0/10788.0|0.0/190.0|81684|650d5f8867836c7190942687253a8f26a74f6e4ba6e2551292b458a5a7ab2dba|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-10.png|
|large-short|11/3.0|6600.0/10788.0|0.0/190.0|59930|464b10ac9f699ab84f3c3e3dab1ef114286bac5f09c3d52641645647352dc7d5|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-11.png|
|large-short|12/3.0|7200.0/10788.0|0.0/190.0|50748|a54d8d902c56640e25bbdbede9936558938c21c3dabfcafc4750ec24336419eb|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-12.png|
|large-short|13/3.0|7800.0/10788.0|0.0/190.0|53333|645c124dd835ee36be0d67527a1b9bf1298bf9e7b701982af3c10424e12ef1d0|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-13.png|
|large-short|14/3.0|8400.0/10788.0|0.0/190.0|51136|bfbd67421bebfa659753cfcdb81cdb236531577fdc5d181679459ee9d9090985|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-14.png|
|large-short|15/3.0|9000.0/10788.0|0.0/190.0|56214|ed0e97c28220c0a45580e2ab9c4b3976fb9df53cd3df45a632cba7aeb0ab23d0|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-15.png|
|large-short|16/3.0|9600.0/10788.0|0.0/190.0|60290|872efb8cd9a95508629f7c126b0b0bc9277db2955ddddaefa4c69835e086acb9|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-16.png|
|large-short|17/3.0|10200.0/10788.0|0.0/190.0|57478|58156bcc6300b4878d78f52c75e498b7bfea6ac24b3b571e56c8d5474748e1ea|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-17.png|
|large-short|18/3.0|10788.0/10788.0|0.0/190.0|56405|c4663b9e6f39a3c54f35bb6d2c97c683f4e1865b25498ccc295df51cecdf5499|C:\Users\Xpike\.codex\task-state\kavriva-e1022b\native-r2-large-short-18.png|

## CODE dondurma öncesi güncel kapılar

Yerel473/E4176/native10/54format0/analiz0 ve graph-r2 42testworst0/index115/390ID499Markdown122evidence gerçek sonuçları Root okundu.19izinliyol/161BASEpin/sabit20 veRAWv89 doğrulandı. İlk graph-r1 task evidence listesindeki parser hatası worst1 idi; yalnız yeni task scalar alanı mevcut standarda düzeltildi, checker değişmedi. Tam snapshot 1d8c076c2890fbe182e60a82ba4801f4db75bda98b2add35f8b5e3ed866a914c. Yeni geçmişsiz kör ilk-okuma, bütün SOURCE/aynıCI-T3/FINAL/main8 henüzbeklenir. Gerçek111/95/206; taskREVIEW/üstkapılarHELD. Python okuyucu tam display-context kopyasıyla actual E4 production_gate çağırır; E1wirefixture baytları önceki aynı outputla eş, production/trust binding kanıtı değildir.

RAW graph-r1.log 8277 bayt SHA256 4de00435c053581a3a399c37e99e3186f0ceee9be6bcff9fd66c40485475ce62

RAW graph-r2.log 7960 bayt SHA256 177d0b90eeb0cc8162ebd1eb6d0ca3458d8aafbe7c1960243a49d9011b6dd4cd

RAW e4-r4.log 30068 bayt SHA256 d3d0a308351d70efc601bbb8443635faf1b20aeae0a4901e3d9364f71aa044b5

## Yeni bağımsız kör ilk okuma

CODE 3a726b7a331c08c741ee08dce92ea840b45313a3 üzerinde geçmişsiz gpt-6-luna/max okuyucu, yalnız gerçek doğal ekranlardan sabit20 soruya PASS verdi. Root özgün tam raporu okudu/baytSHA doğruladı; çalışanmodelattestation unavailable. Bu ilk-okuma insan/cihaz/üretim veya bütünSOURCE kabulü değildir. Yerel473/E4176/native10/54format0/analyze0/graph42worst0/index115;22durum96PNG63unique33tamalias,72responsive. Yeni bütünSOURCE/aynıCI-T3/FINAL/main8 beklenir; gerçek111/95/206, üstkapılarHELD.

Özgün 4608 bayt/SHA256 3ff4693ee7b40c0dacf61c547777625d3e85d46cde9adf51fcc186b76b3b7810.

<pre>İlk arayüz okuması — E1-022b / R1
Genel hüküm: PASS — sabit 20 sorunun tümüne ekrandaki içerikten açık yanıt bulundu.

Kapsam ve yöntem
Atanan kapsam kimliği: CODE3a726b7a331c08c741ee08dce92ea840b45313a3 (git üzerinden doğrulanmadı).
İstenen runtime gpt-6-luna/max; doğrulanabilir runtime attestation yok: unavailable.
Yalnızca sabit soru dosyası, üç izinli kanıt JSON’u ve listelenen PNG’ler kullanıldı. Kaynak kod, paket, git/PR veya önceki rapor okunmadı; test çalıştırılmadı. 63 özgün PNG’nin tamamı view_image ile original boyutta açıldı.

Görsel bütünlük ve kadraj
96/96 manifest kaydında gerçek bayt uzunluğu, SHA-256 ve PNG IHDR boyutu (390×844) manifestle eşleşti. 33 alias’ın tamamı hedef PNG ile tam byte-byte aynı; 63 özgün dosya listesi manifestten ayrıca eşleşti.
22 durumun her biri offset 0’dan başlıyor; son kare ilan edilen maxScrollExtent değerinde. Normal yazı ölçeğinde sabit üst bant 0–35 px, yazı ölçeği 3 olan büyük yazı karelerinde 0–190 px. Her durumdaki üst bant pikselleri tüm kaydırma karelerinde aynı; izinli pixel-audit JSON’u da sıfır uyuşmazlık bildiriyor.
Bant altındaki ilk koyu gövde pikseliyle bant altı aralığı normal ölçekte 0–20 px, büyük yazıda 0–24 px. Sıfır aralıklı karelerde gövde bandın alt sınırından hemen sonra başlıyor; üst uyarı bandının içine taşma yok. Son kaydırma karelerinde içerik devamı görülebiliyor.

Sabit 20 soru ve yanıtlar

1. PASS — Gerçek marka/model gösterilmiyor: “Örnek ekran · gerçek motosiklet kararı değildir”; rehber “Örnek konum kontrolü · guide-v2”, adım 4/9. [native-r2-full-0.png]
2. PASS — “Tam anlatım” ile “Kısa anlatımı aç”tan; kısa görünümde “Tam anlatıma dön” seçiliyor. [native-r2-full-0.png, native-r2-short-0.png]
3. PASS — “Güvenlik belirsizliği var. İlerleme kapalı.” uyarısı üst bantta. [native-r2-full-0.png]
4. PASS — Son kaydırma karesinde de üst uyarı kalıyor. [native-r2-full-2.png]
5. PASS — Tam ve kısa anlatımda aynı güvenlik uyarısı görünüyor. [native-r2-full-0.png, native-r2-short-0.png]
6. PASS — Çevrimdışı güvenlik doğrulanmadı; indirme, bağlantının gelmesi veya anlatımı değiştirme izin vermiyor. [native-r2-full-0.png]
7. PASS — Başka motosiklet/adıma ait güvenlik durumu seçili bağlam için geçerli değil; ilerleme kapalı. [native-r2-foreign-tuple-0.png]
8. PASS — Güncel ve tutarlı paket doğrulanmadığında ya da kısa adım içeriği yoksa bakım adımı güvenilir biçimde uygulanmış sayılmıyor; ilerleme kapalı. [native-r2-untrusted-package-0.png, native-r2-missing-step-0.png]
9. PASS — İçeriği indirmek güvenlik doğrulaması veya izin sayılmıyor. [native-r2-full-0.png]
10. PASS — Bağlantının gelmesi veya kısa anlatıma geçiş tek başına ilerleme açmıyor. [native-r2-full-0.png, native-r2-short-0.png]
11. PASS — Düğme adım bildirimi gönderir; sonraki adıma kendiliğinden geçirmez ve bütün işi tamamlanmış saymaz. [native-r2-full-0.png]
12. PASS — “Sorun var” bağlantısı var. [native-r2-full-1.png]
13. PASS — Güvenli durdurma yolu sonucu “güvenli” diye kaydetmiyor ve motosikletin güvenli olduğunu doğrulamıyor. [native-r2-full-2.png]
14. PASS — “Güncel durumu yeniden kontrol et” ve “Yalnız öğrenme bilgisine dön” yolları var. [native-r2-full-1.png]
15. PASS — Zorunlu güvenlik, risk, önleme ve durma koşulları adlarıyla sunuluyor. [native-r2-full-0.png]
16. PASS — Büyük yazı ve uzun açıklamada metin kaydırılabiliyor; uyarı sabit üst bantta kalıyor ve son içerik karelerde erişilebilir. Bazı kaydırma karelerinde bant altı boşluk 0 px’e düşüyor; metin bant sınırının altında kalıyor. [native-r2-large-full-0.png, native-r2-large-full-18.png, native-r2-long-full-0.png, native-r2-long-full-1.png]
17. PASS — İşlem sürerken veya hata giderilmemişken yeni adım bildirimi gönderilemiyor. [native-r2-busy-short-1.png, native-r2-error-short-0.png]
18. PASS — İstek işleyicisi yoksa düğme kapalı; iş yapılmış varsayılmıyor. [native-r2-no-handler-1.png]
19. PASS — Örnek içerik gerçek motosiklet bakım kararı değil. [native-r2-full-0.png]
20. PASS — Ekran motosikletin sürüşe güvenli olduğunu doğrulamıyor. [native-r2-full-2.png]

Sınır
Bu, verilen PNG’lerin ilk arayüz okumasıdır. Fiziksel uygulama/cihaz, gerçek soğuk açılış, hız veya üretim davranışı hakkında kanıt değildir.
</pre>

RAW Base64: xLBsayBhcmF5w7x6IG9rdW1hc8SxIOKAlCBFMS0wMjJiIC8gUjEKR2VuZWwgaMO8a8O8bTogUEFTUyDigJQgc2FiaXQgMjAgc29ydW51biB0w7xtw7xuZSBla3JhbmRha2kgacOnZXJpa3RlbiBhw6fEsWsgeWFuxLF0IGJ1bHVuZHUuCgpLYXBzYW0gdmUgecO2bnRlbQpBdGFuYW4ga2Fwc2FtIGtpbWxpxJ9pOiBDT0RFM2E3MjZiN2EzMzFjMDhjNzQxZWUwOGRjZTkyZWE4NDBiNDUzMTNhMyAoZ2l0IMO8emVyaW5kZW4gZG/En3J1bGFubWFkxLEpLgrEsHN0ZW5lbiBydW50aW1lIGdwdC02LWx1bmEvbWF4OyBkb8SfcnVsYW5hYmlsaXIgcnVudGltZSBhdHRlc3RhdGlvbiB5b2s6IHVuYXZhaWxhYmxlLgpZYWxuxLF6Y2Egc2FiaXQgc29ydSBkb3N5YXPEsSwgw7zDpyBpemlubGkga2FuxLF0IEpTT07igJl1IHZlIGxpc3RlbGVuZW4gUE5H4oCZbGVyIGt1bGxhbsSxbGTEsS4gS2F5bmFrIGtvZCwgcGFrZXQsIGdpdC9QUiB2ZXlhIMO2bmNla2kgcmFwb3Igb2t1bm1hZMSxOyB0ZXN0IMOnYWzEscWfdMSxcsSxbG1hZMSxLiA2MyDDtnpnw7xuIFBOR+KAmW5pbiB0YW1hbcSxIHZpZXdfaW1hZ2UgaWxlIG9yaWdpbmFsIGJveXV0dGEgYcOnxLFsZMSxLgoKR8O2cnNlbCBiw7x0w7xubMO8ayB2ZSBrYWRyYWoKOTYvOTYgbWFuaWZlc3Qga2F5ZMSxbmRhIGdlcsOnZWsgYmF5dCB1enVubHXEn3UsIFNIQS0yNTYgdmUgUE5HIElIRFIgYm95dXR1ICgzOTDDlzg0NCkgbWFuaWZlc3RsZSBlxZ9sZcWfdGkuIDMzIGFsaWFz4oCZxLFuIHRhbWFtxLEgaGVkZWYgUE5HIGlsZSB0YW0gYnl0ZS1ieXRlIGF5bsSxOyA2MyDDtnpnw7xuIGRvc3lhIGxpc3Rlc2kgbWFuaWZlc3R0ZW4gYXlyxLFjYSBlxZ9sZcWfdGkuCjIyIGR1cnVtdW4gaGVyIGJpcmkgb2Zmc2V0IDDigJlkYW4gYmHFn2zEsXlvcjsgc29uIGthcmUgaWxhbiBlZGlsZW4gbWF4U2Nyb2xsRXh0ZW50IGRlxJ9lcmluZGUuIE5vcm1hbCB5YXrEsSDDtmzDp2XEn2luZGUgc2FiaXQgw7xzdCBiYW50IDDigJMzNSBweCwgeWF6xLEgw7Zsw6dlxJ9pIDMgb2xhbiBiw7x5w7xrIHlhesSxIGthcmVsZXJpbmRlIDDigJMxOTAgcHguIEhlciBkdXJ1bWRha2kgw7xzdCBiYW50IHBpa3NlbGxlcmkgdMO8bSBrYXlkxLFybWEga2FyZWxlcmluZGUgYXluxLE7IGl6aW5saSBwaXhlbC1hdWRpdCBKU09O4oCZdSBkYSBzxLFmxLFyIHV5dcWfbWF6bMSxayBiaWxkaXJpeW9yLgpCYW50IGFsdMSxbmRha2kgaWxrIGtveXUgZ8O2dmRlIHBpa3NlbGl5bGUgYmFudCBhbHTEsSBhcmFsxLHEn8SxIG5vcm1hbCDDtmzDp2VrdGUgMOKAkzIwIHB4LCBiw7x5w7xrIHlhesSxZGEgMOKAkzI0IHB4LiBTxLFmxLFyIGFyYWzEsWtsxLEga2FyZWxlcmRlIGfDtnZkZSBiYW5kxLFuIGFsdCBzxLFuxLFyxLFuZGFuIGhlbWVuIHNvbnJhIGJhxZ9sxLF5b3I7IMO8c3QgdXlhcsSxIGJhbmTEsW7EsW4gacOnaW5lIHRhxZ9tYSB5b2suIFNvbiBrYXlkxLFybWEga2FyZWxlcmluZGUgacOnZXJpayBkZXZhbcSxIGfDtnLDvGxlYmlsaXlvci4KClNhYml0IDIwIHNvcnUgdmUgeWFuxLF0bGFyCgoxLiBQQVNTIOKAlCBHZXLDp2VrIG1hcmthL21vZGVsIGfDtnN0ZXJpbG1peW9yOiDigJzDlnJuZWsgZWtyYW4gwrcgZ2Vyw6dlayBtb3Rvc2lrbGV0IGthcmFyxLEgZGXEn2lsZGly4oCdOyByZWhiZXIg4oCcw5ZybmVrIGtvbnVtIGtvbnRyb2zDvCDCtyBndWlkZS12MuKAnSwgYWTEsW0gNC85LiBbbmF0aXZlLXIyLWZ1bGwtMC5wbmddCjIuIFBBU1Mg4oCUIOKAnFRhbSBhbmxhdMSxbeKAnSBpbGUg4oCcS8Sxc2EgYW5sYXTEsW3EsSBhw6figJ10YW47IGvEsXNhIGfDtnLDvG7DvG1kZSDigJxUYW0gYW5sYXTEsW1hIGTDtm7igJ0gc2XDp2lsaXlvci4gW25hdGl2ZS1yMi1mdWxsLTAucG5nLCBuYXRpdmUtcjItc2hvcnQtMC5wbmddCjMuIFBBU1Mg4oCUIOKAnEfDvHZlbmxpayBiZWxpcnNpemxpxJ9pIHZhci4gxLBsZXJsZW1lIGthcGFsxLEu4oCdIHV5YXLEsXPEsSDDvHN0IGJhbnR0YS4gW25hdGl2ZS1yMi1mdWxsLTAucG5nXQo0LiBQQVNTIOKAlCBTb24ga2F5ZMSxcm1hIGthcmVzaW5kZSBkZSDDvHN0IHV5YXLEsSBrYWzEsXlvci4gW25hdGl2ZS1yMi1mdWxsLTIucG5nXQo1LiBQQVNTIOKAlCBUYW0gdmUga8Sxc2EgYW5sYXTEsW1kYSBheW7EsSBnw7x2ZW5saWsgdXlhcsSxc8SxIGfDtnLDvG7DvHlvci4gW25hdGl2ZS1yMi1mdWxsLTAucG5nLCBuYXRpdmUtcjItc2hvcnQtMC5wbmddCjYuIFBBU1Mg4oCUIMOHZXZyaW1kxLHFn8SxIGfDvHZlbmxpayBkb8SfcnVsYW5tYWTEsTsgaW5kaXJtZSwgYmHEn2xhbnTEsW7EsW4gZ2VsbWVzaSB2ZXlhIGFubGF0xLFtxLEgZGXEn2nFn3Rpcm1lIGl6aW4gdmVybWl5b3IuIFtuYXRpdmUtcjItZnVsbC0wLnBuZ10KNy4gUEFTUyDigJQgQmHFn2thIG1vdG9zaWtsZXQvYWTEsW1hIGFpdCBnw7x2ZW5saWsgZHVydW11IHNlw6dpbGkgYmHEn2xhbSBpw6dpbiBnZcOnZXJsaSBkZcSfaWw7IGlsZXJsZW1lIGthcGFsxLEuIFtuYXRpdmUtcjItZm9yZWlnbi10dXBsZS0wLnBuZ10KOC4gUEFTUyDigJQgR8O8bmNlbCB2ZSB0dXRhcmzEsSBwYWtldCBkb8SfcnVsYW5tYWTEscSfxLFuZGEgeWEgZGEga8Sxc2EgYWTEsW0gacOnZXJpxJ9pIHlva3NhIGJha8SxbSBhZMSxbcSxIGfDvHZlbmlsaXIgYmnDp2ltZGUgdXlndWxhbm3EscWfIHNhecSxbG3EsXlvcjsgaWxlcmxlbWUga2FwYWzEsS4gW25hdGl2ZS1yMi11bnRydXN0ZWQtcGFja2FnZS0wLnBuZywgbmF0aXZlLXIyLW1pc3Npbmctc3RlcC0wLnBuZ10KOS4gUEFTUyDigJQgxLDDp2VyacSfaSBpbmRpcm1layBnw7x2ZW5saWsgZG/En3J1bGFtYXPEsSB2ZXlhIGl6aW4gc2F5xLFsbcSxeW9yLiBbbmF0aXZlLXIyLWZ1bGwtMC5wbmddCjEwLiBQQVNTIOKAlCBCYcSfbGFudMSxbsSxbiBnZWxtZXNpIHZleWEga8Sxc2EgYW5sYXTEsW1hIGdlw6dpxZ8gdGVrIGJhxZ/EsW5hIGlsZXJsZW1lIGHDp23EsXlvci4gW25hdGl2ZS1yMi1mdWxsLTAucG5nLCBuYXRpdmUtcjItc2hvcnQtMC5wbmddCjExLiBQQVNTIOKAlCBEw7zEn21lIGFkxLFtIGJpbGRpcmltaSBnw7ZuZGVyaXI7IHNvbnJha2kgYWTEsW1hIGtlbmRpbGnEn2luZGVuIGdlw6dpcm1leiB2ZSBiw7x0w7xuIGnFn2kgdGFtYW1sYW5txLHFnyBzYXltYXouIFtuYXRpdmUtcjItZnVsbC0wLnBuZ10KMTIuIFBBU1Mg4oCUIOKAnFNvcnVuIHZhcuKAnSBiYcSfbGFudMSxc8SxIHZhci4gW25hdGl2ZS1yMi1mdWxsLTEucG5nXQoxMy4gUEFTUyDigJQgR8O8dmVubGkgZHVyZHVybWEgeW9sdSBzb251Y3Ug4oCcZ8O8dmVubGnigJ0gZGl5ZSBrYXlkZXRtaXlvciB2ZSBtb3Rvc2lrbGV0aW4gZ8O8dmVubGkgb2xkdcSfdW51IGRvxJ9ydWxhbcSxeW9yLiBbbmF0aXZlLXIyLWZ1bGwtMi5wbmddCjE0LiBQQVNTIOKAlCDigJxHw7xuY2VsIGR1cnVtdSB5ZW5pZGVuIGtvbnRyb2wgZXTigJ0gdmUg4oCcWWFsbsSxeiDDtsSfcmVubWUgYmlsZ2lzaW5lIGTDtm7igJ0geW9sbGFyxLEgdmFyLiBbbmF0aXZlLXIyLWZ1bGwtMS5wbmddCjE1LiBQQVNTIOKAlCBab3J1bmx1IGfDvHZlbmxpaywgcmlzaywgw7ZubGVtZSB2ZSBkdXJtYSBrb8WfdWxsYXLEsSBhZGxhcsSxeWxhIHN1bnVsdXlvci4gW25hdGl2ZS1yMi1mdWxsLTAucG5nXQoxNi4gUEFTUyDigJQgQsO8ecO8ayB5YXrEsSB2ZSB1enVuIGHDp8Sxa2xhbWFkYSBtZXRpbiBrYXlkxLFyxLFsYWJpbGl5b3I7IHV5YXLEsSBzYWJpdCDDvHN0IGJhbnR0YSBrYWzEsXlvciB2ZSBzb24gacOnZXJpayBrYXJlbGVyZGUgZXJpxZ9pbGViaWxpci4gQmF6xLEga2F5ZMSxcm1hIGthcmVsZXJpbmRlIGJhbnQgYWx0xLEgYm/Fn2x1ayAwIHB44oCZZSBkw7zFn8O8eW9yOyBtZXRpbiBiYW50IHPEsW7EsXLEsW7EsW4gYWx0xLFuZGEga2FsxLF5b3IuIFtuYXRpdmUtcjItbGFyZ2UtZnVsbC0wLnBuZywgbmF0aXZlLXIyLWxhcmdlLWZ1bGwtMTgucG5nLCBuYXRpdmUtcjItbG9uZy1mdWxsLTAucG5nLCBuYXRpdmUtcjItbG9uZy1mdWxsLTEucG5nXQoxNy4gUEFTUyDigJQgxLDFn2xlbSBzw7xyZXJrZW4gdmV5YSBoYXRhIGdpZGVyaWxtZW1pxZ9rZW4geWVuaSBhZMSxbSBiaWxkaXJpbWkgZ8O2bmRlcmlsZW1peW9yLiBbbmF0aXZlLXIyLWJ1c3ktc2hvcnQtMS5wbmcsIG5hdGl2ZS1yMi1lcnJvci1zaG9ydC0wLnBuZ10KMTguIFBBU1Mg4oCUIMSwc3RlayBpxZ9sZXlpY2lzaSB5b2tzYSBkw7zEn21lIGthcGFsxLE7IGnFnyB5YXDEsWxtxLHFnyB2YXJzYXnEsWxtxLF5b3IuIFtuYXRpdmUtcjItbm8taGFuZGxlci0xLnBuZ10KMTkuIFBBU1Mg4oCUIMOWcm5layBpw6dlcmlrIGdlcsOnZWsgbW90b3Npa2xldCBiYWvEsW0ga2FyYXLEsSBkZcSfaWwuIFtuYXRpdmUtcjItZnVsbC0wLnBuZ10KMjAuIFBBU1Mg4oCUIEVrcmFuIG1vdG9zaWtsZXRpbiBzw7xyw7zFn2UgZ8O8dmVubGkgb2xkdcSfdW51IGRvxJ9ydWxhbcSxeW9yLiBbbmF0aXZlLXIyLWZ1bGwtMi5wbmddCgpTxLFuxLFyCkJ1LCB2ZXJpbGVuIFBOR+KAmWxlcmluIGlsayBhcmF5w7x6IG9rdW1hc8SxZMSxci4gRml6aWtzZWwgdXlndWxhbWEvY2loYXosIGdlcsOnZWsgc2/En3VrIGHDp8SxbMSxxZ8sIGjEsXogdmV5YSDDvHJldGltIGRhdnJhbsSxxZ/EsSBoYWtrxLFuZGEga2FuxLF0IGRlxJ9pbGRpci4K
