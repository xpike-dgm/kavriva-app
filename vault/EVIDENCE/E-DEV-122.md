---
test_id: E-DEV-122
contract_id_version: "SCR014/C1.3/F1.3.2/FL1.3.4 condensed v1"
subject_file: modules/e01-app/internal/shell/lib/condensed_execution.dart
subject_digest: 13ca157c307b8bdcbd6bdad150fd3c529a4b734889403c9d3ad59517ad03daaa
result: "Yerel463 PASS; bağımsız REVIEW bekleniyor"
evidence_links: [vault/PROFILES/condensed-execution-render.md, vault/PACKS/P-E1-022a.md, vault/REGISTRY/T-E1-022a.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-121-E10-GOVERNED-PATHS-FOR-T-E1-022a.md.snapshot, modules/e01-app/internal/shell/lib/condensed_execution.dart, modules/e01-app/internal/shell/test/condensed_execution_test.dart, modules/e01-app/internal/shell/test/fixtures/condensed_execution_reading_questions.json]
gate_verdict: "RECORDED yerel test; bağımsız REVIEW ve üretim HELD"
reviewer: none
timestamp: 2026-10-13
version: 1
purpose: Kısa anlatımda zorunlu adımları ve güvenliği korumak
domain: first-use
module: e01-app
owner: E1
implements: [ADR-008, C1.3, F1.3.2, FL1.3.4, SCR-014, BR-074, CON-004, R-001, R-003, R-004, R-007, R-009, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: condensed-execution-presentation
tasks: [T-E1-022a]
tests: [modules/e01-app/internal/shell/test/condensed_execution_test.dart, modules/e01-app/internal/shell/test/active_execution_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-13
depends_on: [V-E1-CONDENSED-001]
used_by: [V-E1-CONDENSED-001, P-E1-022a, T-E1-022a]
evidence: []
supersedes: []
status: RECORDED
---

# Kısa anlatım — aynı fiziksel adımın sınırlı sunumu

Plan fa914f013fdcd032faed876689092da245989459; BASE 439d9aa9ad38d7f72fc3e9a403a4a178b81c0242; PRECODE 3e7cc1a085ec94901711ca3d1dfef2d1526d9297; M-CONDENSED-01 v2 açıklama başı 478b1be97fdda5f65ff25270493b10f6bde46f76. T006 sınırlıDONE; PR123 normal merge/main8 bağımsızSource/Final kabulü. Gerçek110DONE96kalan206; yeni aday bu sayacı ilerletmez.

`vault/PACKS/P-E1-022a.md`; `vault/REGISTRY/T-E1-022a.md`; `vault/EVIDENCE/E-DEV-122.md`.

## Uygulama ve kaynak sınırı

SCR014/E01/U04 tek fiziksel adımın mevcut ActiveStepView sunumu korunur. Yeni CondensedExecutionView yalnız E1 iç sarıcıdır; tam varsayılan, kısa kullanıcı isteğiyle açılır ve tam geri döner. Sağlayıcının sameScope/step/currentcontent proof referansı olan, tamdan gerçekten daha kısa instruction girdisini kabul eder; teknik özet üretmez. Aynı physical step number/count, görsel, safetyChecks, full detail, proof ve callback nesneleri korunur. İç ActiveStepView guardları değişmez; short proof yetki değildir. Scope/adım/full source/short source nesnesi değişiminde seçim sıfırlanır. Busy/error/nullhandler rapor veya yeni izin üretmez. Canonical current/data/operation provider, auth/E4runtime/roadside router/üretim giriş bağları burada kurulmaz. T022b ayrı banner/E4seam görevidir; bu metin o görevi DONE yapmaz.

## Gerçek yerel doğrulama

150 BASE pin dış kapsamda aynı; eski ActiveStepView/EDEV104 subject ve bütün454 önceki test kodu korunur. Yeni9 anlamlı test; normal463. Native10 ayrı koşu (9normal+1isteğe bağlıcapture), normal toplama eklenmez. Boş kimlik/metin reddi; actualshorttoggle full/short stepcount9/number4, visual/safety/proof kimlikleri ve aynıcallbackscope; shortmissing/stale/wrongpurpose/all foreign context axes/nullproof/equal-or-longertext negatifleri; active guard/safety/fit/readiness/current/visual/busy/error/nullhandler; scope/replacement reset; realTabEnterSpace/52hit/semantics;4durum×3genişlik×3scale×2form=72tamkaydırma/uzunTürkçe; gözlenen header-reset açıklaması dar metin düzeltmesi. Yerel analyze0;51format dosyası. Capture21durum/55PNG/25benzersiz/30bytealias,390×844/fullscroll≤600step; Root tüm25 gerçekgörüntüyü veE01 kaynağını açtı, sonraki r4 görüntülerinin tamamının açılmışr3byteeşliğini doğruladı. Gerçek insan/cihaz/screenreader kabulü yok.

## Ölçüm yöntemi ve yorum sınırı

M-CONDENSED-01 v1 PRECODE içinde durur; kısa kullanıcı seçimi ile açıldığından v2 test kodundan önce açıklama commitinde donduruldu. Aynıinput/headless390×844/scale1/sabitSDK ve testharness varsayılan font, herform1ısınma; sonra3eşli full→short/short→full tester.tap→tester.pump pointer/build/layout/paint/harness gerçekWall mikro saniye samples. ensureVisible ve ilk mount zaman dışıdır. Nativecapture ayrıcaRoboto yükler; bu ölçüm onu yüklemeden çalışır. Kaynak ve mevcut step number/count/instructionchar gerçektir. Hız veya başarı eşiği yok, boundsHELD. Bu cihaz/GPU/fizikselhız veya gerçekroadsideperformans kabulü değildir; samplerunlar birbirinin aynısıymış gibi yazılmaz.

## Özgün denemeler korunur

Başlangıç helperJS literalbacktick SyntaxError hiç çalışmadı, repo değiştirmedi. İlk target-r1 constSemantics derlemeFAIL; darconst düzeltmesi. target-r2 8PASS1FAIL semanticsHandle kaynak kapanmadı; stdout cp1254 log basımı ayrıca FAIL fakat gerçek hamtestlog kaydedilmişti. Tester test sonunda try/finally disposal; target-r3 9PASS. analyze-r1 beşunused fixturelabelwarnFAIL; yalnız yeni kopyalanmış kullanılmayan labels temizlendi. analyze-r2/3/4/5/6 gerçek0. İlk capture20/52/22/30; uzun tam metin coverage için21/55/25/30; helperprefix AssertionError dosya yazmadan bitti. Root R2görüntülerde scope-reset açıklamasını yetersiz gördü, fixed20 korunup dar metin eklendi. Native-r3 gerçek25tamgörüntü açıldı. Native stale-safety ilk fixture ayrıca yanlışsubject taşıyordu; r4 ve yeni targeted stale negatif doğru safety-a kimliği/currentfalse ile tekbaşına eskimeyi denetler. Önceki güncel r1/r2/r3 test ve resim makbuzları korunur; current r4/full-r3 ayrı gerçek sonuçlar. Hiçbir eskiFAIL yeniPASS olarak değiştirilmez.

## Tasarım — yedi gerçek karşılaştırma

| Kapsam | Yapılan karşılaştırma | Sınır |
|---|---|---|
| Tam ekran | Gerçek21durum/55scrollparça, sameSCR014 active body ve mode header | E01 mevcut canonicalheader görüntüsünde mode alanı yok; finalpixelHELD |
| Komşu ekran | Eski SCR014/015/018 kod/test150pin korunur; yeni wrapper full ve short aynı childguards | Router/roadsideSCR-TBD ve diğer yeni ekran yok |
| Durum | Missing/stale/foreign/held/safety/busy/error/handler/long, açık reason/closedprogress | Gerçek provider/data yok |
| Responsive |72tamkaydırma320390768×1/2/3×fullshort/uzunTürkçe | Gerçekcihaz/window matrix yok |
| Erişilebilirlik | RealTabEnterSpace/semantics/52control/inheritedactive focus; mevcutbluefocus/secondary font | Gerçekscreenreader ve finaltokens yok |
| Kaynak | Root E01 gerçekPNG/origin-mainbyteeşliği, U04tekphysicalamaç/activevisual/safety/detail/recovery | Yeni header mevcut kısıtlı adaptation; fullrefpixel/sourceheldflow kabulü değil |
| Regresyon |454eski+9yeni/150BASEpin; EDEV104subjectsame; oldcode/noYAML/sdk/deps | Üst bütünfeature/releaseHELD |

## On kapanış katmanı

1. görev: T022a yalnız sunum, bağımsızreviewbekler.
2. feature: F1.3.2 üretim acceptanceHELD.
3. flow: FL1.3.4PROPOSED/SCR-TBDHELD.
4. requirement: BR074sunum/stepcount/gerçekmethodsamples; prodproviderHELD.
5. design:7headlessboundedcomparison; finaltokens/insan/cihazHELD.
6. architecture: E1render; no new publicseam/E4private/auth/provider; E3R1REVIEW/E5IN_PROGRESS.
7. data: veri veya şema göçü yok, source/oldhistories korunur.
8. release: henüz bu görevinPR/CI/T3/final/main8 yok; ürün yayınıHELD.
9. product scenario: sentetik step/media/proof/callback, gerçek fizikselbakım yok.
10. gaps: gerçekcontent/identity/authority/E4current/roadside/router/device/qualified/human/release boşlukları açık.

## Konu özetleri

`modules/e01-app/internal/shell/lib/condensed_execution.dart` LF SHA256 13ca157c307b8bdcbd6bdad150fd3c529a4b734889403c9d3ad59517ad03daaa
`modules/e01-app/internal/shell/test/condensed_execution_test.dart` LF SHA256 34f965f894e9404c601e06b52584cc4e058fd307c9c3f7a3742af41c0c2077e2
`modules/e01-app/internal/shell/test/fixtures/condensed_execution_reading_questions.json` LF SHA256 630543577a2dd9620b1998391370e27d4341b85665a7fe9d33a52921e40d3b3f

## Gerçek komut makbuzları
- baseline-graph.log RAW 7960 SHA256 f616836768b8dcacb7ec5316ba3277fa2199a62051ea26c4580ab65c5e93a97b
- target-r1.log RAW 1461 SHA256 02cc6da34048bd66fed9852b2d2977790ae6ff71f918b4895b8d405d82de9c12
- target-r2.log RAW 3665 SHA256 e4e5535e21dc7c2fe9a773bd486c9e374853ab61e541859a24de6da02a289de8
- target-r3.log RAW 1915 SHA256 ba9a820fe8bdc6126b763e40701c2037c0ad486d1de5d97cf81f66bd8351ab77
- full-r1.log RAW 110097 SHA256 4018382170e621be23c44f6b0aed73b378d011cf9d6b2ed24182ed7a822cb241
- full-r2.log RAW 110248 SHA256 03f34d7df7938007cfe448edc7b63f8216e0b41d975f9710a89f5a9e17c67dc6
- full-r3.log RAW 110037 SHA256 c1779fde3141ec32b2c7b30b37e7847370c4de996bab67d55a615512290b94ec
- analyze-r1.log RAW 924 SHA256 0e2896f9f4073439d9dce97e417778552a913ddf350da470b03efb91f652ab70
- analyze-r2.log RAW 97 SHA256 7f9782c441e00837893c3cf3c8a0ee273951343a9f9e8f95ae33a903100278c0
- analyze-r3.log RAW 97 SHA256 d344e82bdc3f6111773775f6fda77d16b0f311a7cea69dfdcab217652ee8670c
- analyze-r4.log RAW 96 SHA256 cc784b255d8769cb8be81a2ac567ecddd06444d1c7ef27d1517305a10d813f85
- analyze-r5.log RAW 96 SHA256 add34965f879d4635657455b62dfbf3271384e45583090026a8552ff2cd0fcdf
- analyze-r6.log RAW 96 SHA256 30aefdd21a51fb3576f6c632d55083fc3c90293feb05652fe4e4bb42caf32b24
- format-r2.log RAW 48 SHA256 aafd69079abea40ed623b519d38b13034f195096da57b505ddd8feea5e496a5a
- format-r5.log RAW 48 SHA256 3015ce9addcfaeb4139e6c978305278f7305830c1e9ae295e4ca934f1d06d880
- native-r1.log RAW 2001 SHA256 49c4b0434f3559e73016838b57b08113f0fdd22f7e10a8c3a2179e14a625fbe4
- native-r2.log RAW 2002 SHA256 d737504afbdd97deb6213a120b863b446bb4d3742df3570bfcf3db0a291e7f49
- native-r3.log RAW 2002 SHA256 802de5e9891c557134fb2755ad7504f3095c94f9411546006bbc3edcaf7f807f
- native-r4.log RAW 2004 SHA256 41b1df5bb1818a2dbc3078c32f0bde680435d4bd813189e324b70051f1d79b0e

measurement-native-r1.json RAW 885 SHA256 c06bda5943626675466830856bbbce16e17743d823207e000cee6c498fde5ca0

{"method":"M-CONDENSED-01 v2","viewport":[390,844],"scale":1,"interval":"tester.tap through tester.pump; excludes ensureVisible; includes pointer/build/layout/paint/harness","warmupPairs":1,"pairs":3,"deviceProof":false,"bounds":"HELD","samples":[{"pair":0,"mode":"short","wallMicroseconds":10045,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":0,"mode":"full","wallMicroseconds":9150,"stepNumber":4,"stepCount":9,"instructionCharacters":50},{"pair":1,"mode":"short","wallMicroseconds":9236,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":1,"mode":"full","wallMicroseconds":9436,"stepNumber":4,"stepCount":9,"instructionCharacters":50},{"pair":2,"mode":"short","wallMicroseconds":10768,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":2,"mode":"full","wallMicroseconds":11122,"stepNumber":4,"stepCount":9,"instructionCharacters":50}]}


measurement-native-r2.json RAW 886 SHA256 2fbfa135caa587be1d61e3262d204de5f179e2e1c05c4d80e9dbaf0c08d976a3

{"method":"M-CONDENSED-01 v2","viewport":[390,844],"scale":1,"interval":"tester.tap through tester.pump; excludes ensureVisible; includes pointer/build/layout/paint/harness","warmupPairs":1,"pairs":3,"deviceProof":false,"bounds":"HELD","samples":[{"pair":0,"mode":"short","wallMicroseconds":11954,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":0,"mode":"full","wallMicroseconds":9206,"stepNumber":4,"stepCount":9,"instructionCharacters":50},{"pair":1,"mode":"short","wallMicroseconds":10362,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":1,"mode":"full","wallMicroseconds":13438,"stepNumber":4,"stepCount":9,"instructionCharacters":50},{"pair":2,"mode":"short","wallMicroseconds":10818,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":2,"mode":"full","wallMicroseconds":9452,"stepNumber":4,"stepCount":9,"instructionCharacters":50}]}


measurement-native-r3.json RAW 886 SHA256 b3d8409d8a04b6aad16d98fd7d65b4576b4ab11f03db5427fee98e2d7f973444

{"method":"M-CONDENSED-01 v2","viewport":[390,844],"scale":1,"interval":"tester.tap through tester.pump; excludes ensureVisible; includes pointer/build/layout/paint/harness","warmupPairs":1,"pairs":3,"deviceProof":false,"bounds":"HELD","samples":[{"pair":0,"mode":"short","wallMicroseconds":10075,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":0,"mode":"full","wallMicroseconds":11913,"stepNumber":4,"stepCount":9,"instructionCharacters":50},{"pair":1,"mode":"short","wallMicroseconds":9869,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":1,"mode":"full","wallMicroseconds":10925,"stepNumber":4,"stepCount":9,"instructionCharacters":50},{"pair":2,"mode":"short","wallMicroseconds":9656,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":2,"mode":"full","wallMicroseconds":14244,"stepNumber":4,"stepCount":9,"instructionCharacters":50}]}


measurement-native-r4.json RAW 888 SHA256 05055c3b71de5cffb82de0f2c33dfa198616c1c184854b3c0120e02562c5b749

{"method":"M-CONDENSED-01 v2","viewport":[390,844],"scale":1,"interval":"tester.tap through tester.pump; excludes ensureVisible; includes pointer/build/layout/paint/harness","warmupPairs":1,"pairs":3,"deviceProof":false,"bounds":"HELD","samples":[{"pair":0,"mode":"short","wallMicroseconds":14806,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":0,"mode":"full","wallMicroseconds":11945,"stepNumber":4,"stepCount":9,"instructionCharacters":50},{"pair":1,"mode":"short","wallMicroseconds":13810,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":1,"mode":"full","wallMicroseconds":12424,"stepNumber":4,"stepCount":9,"instructionCharacters":50},{"pair":2,"mode":"short","wallMicroseconds":11335,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":2,"mode":"full","wallMicroseconds":16310,"stepNumber":4,"stepCount":9,"instructionCharacters":50}]}


measurement-full-r3.json RAW 888 SHA256 c9254dc3abb00a9114f693aa3c72ad1e86e1df1dffac5c114e8533409cdf7ade

{"method":"M-CONDENSED-01 v2","viewport":[390,844],"scale":1,"interval":"tester.tap through tester.pump; excludes ensureVisible; includes pointer/build/layout/paint/harness","warmupPairs":1,"pairs":3,"deviceProof":false,"bounds":"HELD","samples":[{"pair":0,"mode":"short","wallMicroseconds":30752,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":0,"mode":"full","wallMicroseconds":19983,"stepNumber":4,"stepCount":9,"instructionCharacters":50},{"pair":1,"mode":"short","wallMicroseconds":20820,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":1,"mode":"full","wallMicroseconds":26899,"stepNumber":4,"stepCount":9,"instructionCharacters":50},{"pair":2,"mode":"short","wallMicroseconds":18956,"stepNumber":4,"stepCount":9,"instructionCharacters":39},{"pair":2,"mode":"full","wallMicroseconds":24129,"stepNumber":4,"stepCount":9,"instructionCharacters":50}]}


|Durum|Parça|Offset/End|Byte|SHA256|RAW dosya|
|---|---|---|---|---|---|
|full|0|0.0/675.875|58819|5f0c9ee2cc314393bc6491756bbc16c62e349e183be7a3d0805debb283f72006|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-full-0.png|
|full|1|600.0/675.875|60439|94ee41e914688ac2f569b69a63a273c13996561e40e3ff62d1e33391a831aa1e|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-full-1.png|
|full|2|675.875/675.875|63639|5907a6822c453f593715bc9b5acead289dc38f3ca4d4b5368043f3242e9fa02a|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-full-2.png|
|short|0|0.0/675.875|58873|eae4337213e091046d3dd760bc229e69f861922592846510dfb0b722ce06edc6|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-short-0.png|
|short|1|600.0/675.875|59363|5de052a2eb865d9d7ed10a68e6bf6db32334df02e669fa5a23ff8174fe83b2cd|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-short-1.png|
|short|2|675.875/675.875|62551|de901ea3f2eaafcea4f0a3f18a4a25012d108c30a2d822986137bfc3fb17054b|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-short-2.png|
|missing-short|0|0.0/751.875|58831|49abbacfdeba6508b3adfe2dc1c66b6bc4bc736dafdb23b49f648561c20e6989|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-short-0.png|
|missing-short|1|600.0/751.875|60124|7a5256051c09a1e92baea35a453c8c5abb89c4aae36835866dfa7ac76fe5d369|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-short-1.png|
|missing-short|2|751.875/751.875|63639|5907a6822c453f593715bc9b5acead289dc38f3ca4d4b5368043f3242e9fa02a|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-short-2.png|
|stale-short|0|0.0/751.875|58831|49abbacfdeba6508b3adfe2dc1c66b6bc4bc736dafdb23b49f648561c20e6989|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-stale-short-0.png|
|stale-short|1|600.0/751.875|60124|7a5256051c09a1e92baea35a453c8c5abb89c4aae36835866dfa7ac76fe5d369|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-stale-short-1.png|
|stale-short|2|751.875/751.875|63639|5907a6822c453f593715bc9b5acead289dc38f3ca4d4b5368043f3242e9fa02a|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-stale-short-2.png|
|foreign-bike|0|0.0/751.875|58831|49abbacfdeba6508b3adfe2dc1c66b6bc4bc736dafdb23b49f648561c20e6989|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-foreign-bike-0.png|
|foreign-bike|1|600.0/751.875|60124|7a5256051c09a1e92baea35a453c8c5abb89c4aae36835866dfa7ac76fe5d369|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-foreign-bike-1.png|
|foreign-bike|2|751.875/751.875|63639|5907a6822c453f593715bc9b5acead289dc38f3ca4d4b5368043f3242e9fa02a|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-foreign-bike-2.png|
|foreign-step|0|0.0/751.875|58831|49abbacfdeba6508b3adfe2dc1c66b6bc4bc736dafdb23b49f648561c20e6989|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-foreign-step-0.png|
|foreign-step|1|600.0/751.875|60124|7a5256051c09a1e92baea35a453c8c5abb89c4aae36835866dfa7ac76fe5d369|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-foreign-step-1.png|
|foreign-step|2|751.875/751.875|63639|5907a6822c453f593715bc9b5acead289dc38f3ca4d4b5368043f3242e9fa02a|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-foreign-step-2.png|
|wrong-purpose|0|0.0/751.875|58831|49abbacfdeba6508b3adfe2dc1c66b6bc4bc736dafdb23b49f648561c20e6989|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-wrong-purpose-0.png|
|wrong-purpose|1|600.0/751.875|60124|7a5256051c09a1e92baea35a453c8c5abb89c4aae36835866dfa7ac76fe5d369|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-wrong-purpose-1.png|
|wrong-purpose|2|751.875/751.875|63639|5907a6822c453f593715bc9b5acead289dc38f3ca4d4b5368043f3242e9fa02a|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-wrong-purpose-2.png|
|missing-short-proof|0|0.0/751.875|58831|49abbacfdeba6508b3adfe2dc1c66b6bc4bc736dafdb23b49f648561c20e6989|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-short-proof-0.png|
|missing-short-proof|1|600.0/751.875|60124|7a5256051c09a1e92baea35a453c8c5abb89c4aae36835866dfa7ac76fe5d369|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-short-proof-1.png|
|missing-short-proof|2|751.875/751.875|63639|5907a6822c453f593715bc9b5acead289dc38f3ca4d4b5368043f3242e9fa02a|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-short-proof-2.png|
|missing-active|0|0.0/199.0|61227|3cc4fd6ebe69d79a03a72d995e35eb8dacdc33ddeb2e80c87908f9e070076909|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-active-0.png|
|missing-active|1|199.0/199.0|56326|ef69ed6d6793dcac9ccc7483797d9b8fff3facdcc48928c8d7d5d47cdb35a3d8|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-active-1.png|
|held-active|0|0.0/499.0|77961|93ce032a18e7b1fefe8fa0df48d5097fb5e585dab6b5e1083754c779347f1cad|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-held-active-0.png|
|held-active|1|499.0/499.0|67958|614d809302f730640b3a97f5508cf2cc07bc757f088702c17cc9c0a3fb3cb090|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-held-active-1.png|
|missing-fit|0|0.0/499.0|77961|93ce032a18e7b1fefe8fa0df48d5097fb5e585dab6b5e1083754c779347f1cad|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-fit-0.png|
|missing-fit|1|499.0/499.0|67958|614d809302f730640b3a97f5508cf2cc07bc757f088702c17cc9c0a3fb3cb090|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-fit-1.png|
|missing-readiness|0|0.0/499.0|77961|93ce032a18e7b1fefe8fa0df48d5097fb5e585dab6b5e1083754c779347f1cad|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-readiness-0.png|
|missing-readiness|1|499.0/499.0|67958|614d809302f730640b3a97f5508cf2cc07bc757f088702c17cc9c0a3fb3cb090|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-readiness-1.png|
|missing-safety|0|0.0/268.0|61960|abb23dbbe0b86a727b99addc1398399834c030bd03ddd501815507ad98b6f140|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-safety-0.png|
|missing-safety|1|268.0/268.0|56783|ae198e2e74b6fa3599de8d5fd9da2f3b2ad1b08f37a3f55f587c7cd86b951437|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-safety-1.png|
|unreviewed-safety|0|0.0/563.0|79944|c3d348cd138bd0231f52b0195042432a2cc060b56306e9edbc9bcf52c1475d0c|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-unreviewed-safety-0.png|
|unreviewed-safety|1|563.0/563.0|65007|8b04640bb1886ef8c4f54f54c0cccac31ff50119a4cd457cfda8e2c00a190685|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-unreviewed-safety-1.png|
|stale-safety|0|0.0/563.0|79944|c3d348cd138bd0231f52b0195042432a2cc060b56306e9edbc9bcf52c1475d0c|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-stale-safety-0.png|
|stale-safety|1|563.0/563.0|65007|8b04640bb1886ef8c4f54f54c0cccac31ff50119a4cd457cfda8e2c00a190685|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-stale-safety-1.png|
|missing-visual|0|0.0/499.0|77961|93ce032a18e7b1fefe8fa0df48d5097fb5e585dab6b5e1083754c779347f1cad|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-visual-0.png|
|missing-visual|1|499.0/499.0|67958|614d809302f730640b3a97f5508cf2cc07bc757f088702c17cc9c0a3fb3cb090|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-missing-visual-1.png|
|busy-short|0|0.0/725.875|58873|eae4337213e091046d3dd760bc229e69f861922592846510dfb0b722ce06edc6|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-busy-short-0.png|
|busy-short|1|600.0/725.875|63089|414f39ff3ac0741ef6e354d56fb70b8cf1df38ea125937ecf913a6f2f0e3faab|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-busy-short-1.png|
|busy-short|2|725.875/725.875|68824|676135617ce01df6965edf80cf408c3c71f7d1cf0e7a2dd0481144e01aeaf661|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-busy-short-2.png|
|error-short|0|0.0/725.875|58873|eae4337213e091046d3dd760bc229e69f861922592846510dfb0b722ce06edc6|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-error-short-0.png|
|error-short|1|600.0/725.875|66383|b74168960d238d740230edd39515373a91b847ec4a2672cca66f2359316cfd8b|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-error-short-1.png|
|error-short|2|725.875/725.875|71989|fc1124307306e73600dc37ad44a12de9f3896b11cf9c0c4dfc5aa9e174ab042c|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-error-short-2.png|
|no-handler-short|0|0.0/725.875|58873|eae4337213e091046d3dd760bc229e69f861922592846510dfb0b722ce06edc6|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-no-handler-short-0.png|
|no-handler-short|1|600.0/725.875|59468|402bb6461cec20da94b68a25296cf53ae1f5acfcd728330d78a282b7c2e835a3|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-no-handler-short-1.png|
|no-handler-short|2|725.875/725.875|66848|48d9bdd2eeae1c3a090d1072fcfff434c66e58317b0bf76e14e7e7bdfdf73a7d|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-no-handler-short-2.png|
|long-full|0|0.0/1039.875|59422|9f9993df50cb11bb9ca604654097d0f3b647bd3ae26075b68377dbeb919fe269|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-long-full-0.png|
|long-full|1|600.0/1039.875|92379|059986d525473b6966386e841dd439c70fd56ad8a6078f851839eaa8be4b3c04|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-long-full-1.png|
|long-full|2|1039.875/1039.875|76442|e609dafb3990046edaa634a83f3e8b1e8a6f5a346e2276f14aef2bc710b71149|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-long-full-2.png|
|long-short|0|0.0/675.875|58873|eae4337213e091046d3dd760bc229e69f861922592846510dfb0b722ce06edc6|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-long-short-0.png|
|long-short|1|600.0/675.875|59363|5de052a2eb865d9d7ed10a68e6bf6db32334df02e669fa5a23ff8174fe83b2cd|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-long-short-1.png|
|long-short|2|675.875/675.875|62551|de901ea3f2eaafcea4f0a3f18a4a25012d108c30a2d822986137bfc3fb17054b|C:\Users\Xpike\.codex\task-state\kavriva-e1022a\native-r4-long-short-2.png|

## Dondurma öncesi açık doğrulama sınırı

Kod/test/fixture tam paket14yolu içinde. Mevcut ikincil eylemin yazısı çağıranın DefaultTextStyle değerini devralır; paketteki20type ifadesi yeni sabit font seçimi değildir. Testharness16gövde, aktifbaşlık28/talimat22 korunur; wrapper kendi font/token seçmez. Mode ve belirsizlik açıklaması iki formda ve scroll ağacında bulunur; sabit viewport/sticky T022b kapsamı ve E4seam burada kapatılmaz. Son strict format-r7 51zero, analyze-r6 0, full-r3 463PASS, native-r4 10PASS, graph-r1 42/worst0/index114. r4 bütün55PNG açılmışr3baytlarıyla aynı; Root25benzersiz/güncel21durum tamokuma. Yeni PR/bağımsızfirstread/wholeSOURCE/actualCI/T3/FINAL/main8 henüz yok. EskiPR123arkivediki yeni skippedCIreceipt satırındaki whitespace yalnız appendtailde düzeltildi; eski gövde korunur.110DONE96kalan206 değişmez.
