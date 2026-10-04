---
test_id: E-DEV-107
version: 1
contract_id_version: "SCR-019..021; C1.4/F1.4.1/FL1.4.1 diagnosis v1"
subject_file: modules/e01-app/internal/shell/lib/diagnosis.dart
subject_digest: 53e4357ecc33fdb3e4383d22ee45e790f44004c2fb1b8518db3cf1b97ae3f44e
result: "RECORDED ikinci kaynak; önceki ret korunur, yeni bağımsız kabul bekleniyor"
evidence_links: [vault/PROFILES/diagnosis-render.md, vault/PACKS/P-E1-009.md, vault/REGISTRY/T-E1-009.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-106-E10-GOVERNED-PATHS-FOR-T-E1-009.md.snapshot, modules/e01-app/internal/shell/lib/diagnosis.dart, modules/e01-app/internal/shell/test/diagnosis_test.dart, modules/e01-app/internal/shell/test/fixtures/diagnosis_reading_questions.json]
gate_verdict: "RECORDED R2 kaynak REVIEW; yeni CI ve bağımsız hüküm bekleniyor"
reviewer: "/root/e1009_diagnosis_full_review; önceki R1 ret, R2 kabul bekleniyor"
timestamp: 2026-10-05
purpose: Belirti, tek gözlem ve desteklenmiş veya belirsiz tanı sonucunu sunmak
domain: diagnosis
module: e01-app
owner: E1
implements: [ADR-008, ADR-014, C1.4, F1.4.1, SCR-019, SCR-020, SCR-021, BR-014, BR-015, BR-016, BR-017, BR-019, BR-028, BR-040, BR-041, BR-042, CON-001, CON-002, CON-003, CON-004, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: diagnosis-presentation
tasks: [T-E1-009]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-05
depends_on: [V-E1-DIAG-001]
used_by: [V-E1-DIAG-001, P-E1-009, T-E1-009]
evidence: []
supersedes: []
status: RECORDED
---

# Belirti, tek gözlem ve tanı sonucunun sunumu

T-E1-009; C1.4/F1.4.1/FL1.4.1/SCR-019..021; ADR-014 R1/R5/R6. E9 önerir, E1 gösterir, E3 doğrular. Bu kaynak E1 sunumudur: gerçek E9/E3 üreticisi, model, API, kalıcı veri, fiziksel doğrulama veya ürün içi kimlik bağlantısı oluşturmaz. Kabul edilmiş tanı üreticisi yoksa normal yol kapalı kalır. E1 ile E9 arasında özel kod importu veya çalışma zamanı döngüsü yoktur.

DiagnosisScope motosiklet kimliği, bağlam revizyonu, tanı akışı kimliği ve gözlem revizyonunu taşır. Güncel soru, öneri, sonuç, güvenlik beyanı ve istekler bu kapsamı açıkça taşır. DiagnosisReference ayrıca istek kimliği, amaç, konu, kaynak/sürüm/konum/kontrol tarihi, güncellik, unknown/held/confirmed ve gerekçeyi taşır. Kaynak varlığı veya güncellik bayrağı tek başına olumlu otorite değildir; eksik, eski, yabancı, yanlış amaç/konu/istek veya olumlu doğrulanmamış kaynak normal yolu açmaz. Listeler değişmezdir; yinelenen veya ayrılmış emin-değilim seçenek kimlikleri reddedilir.

SCR-019 teknik terim istemeden belirtiyi alır. Boş belirti, güvenlik yanıtı yok, hayır veya emin değilim durumlarında tanıya devam kapalıdır. Evet seçimi yalnız kullanıcı beyanıdır; fiziksel güvenlik kanıtı veya sürüş izni değildir. SCR-020 yalnız tek güncel ayırt edici soruyu gösterir. Emin değilim geçerli gözlem yanıtıdır; fotoğraf isteğe bağlı ayrı niyettir. Gözlem/fotoğraf kesin arıza veya fiziksel doğrulama oluşturmaz. Bağlam, istek, soru revizyonu, anlamı veya seçenekleri değişirse yerel seçim sıfırlanır. Eski/yabancı soru ve özel gerekçe metinleri gösterilmez.

SCR-021 bilinenler, bilinmeyenler ve diğer olasılıkları korur. Beş sınırlı AI öneri türü yalnız açıklama olarak gösterilir; öneri sonuç otoritesi veya rehber önizleme izni değildir. Desteklenen sonuçta önizleme yalnız güncel doğru kapsam/istekli olumlu sonuç, boş olmayan destekleyici gözlem, açık hedef rehber ve altı ayrı olumlu güncel kontrol ile açılır: motosiklet, uygunluk, onay, önkoşullar, hazırlık ve kaynak geçmişi. Her kontrol aynı sonuç konusu/amaç/kapsam/isteğe bağlıdır. Önizleme tamire başlama değildir; gerçek uygulamadan önce uygunluk ve hazırlık ayrıca değerlendirilir. Netleşmemiş sonuç kesin neden tahmin etmez; rastgele parça değişimini reddeder ve ek gözlem/özet/güvenli destek yollarını gösterir. Held sonuç normal yolu kapatır. Özet bilgiyi görüntüleme niyetidir; tamir edilmiş veya iş tamamlanmış kaydı değildir.

OUTCOME_UNKNOWN başarı veya başarısızlık sayılmaz ve işlem tekrar uygulanmaz. Kritik istek durumu ilk ekranda önce gösterilir; önceden olumlu kaynak değerlendirmesi isteğin sonucu diye sunulmaz. Aynı kapsam ve aynı istek kimliğiyle, özgün istek türünü koruyan reconcile niyeti ayrı gönderilir. Yabancı bilinmeyen veya hata bilgisinin özel metni ve kimliği yeniden kullanılmaz. Busy, bilinmeyen sonuç veya hata normal ilerlemeyi kapatır. İşleyici yoksa düğme kapalıdır ve metinde şu anda kapalı denir. Güvenli destek ve çıkış bilgisi normal ilerleme, ücret ve bu durumlara bağlı değildir; fiziksel güvenli duruş/iş tamamlandı üretmez. Gerçek E3 uzlaştırma bağlantıları T-E4-011b/T-E3-004 bu kaynakta yoktur ve HELD kalır; callback yalnız niyettir.

Çağıranın marka/font alanı korunur. Test kabuğu Kavriva · test örneği ve örnek motosiklet kullanıcı beyanını açıkça gösterir. Nihai varlık/font/token/dark mode/altbar/routing seçimi yapılmaz. Üretim kaynak/kimlik/yetki/medya/kalıcılık, fiziksel telefon/OS/yardımcı teknoloji, gerçek arıza/tamir/sürüş güvenliği ve yayın HELD. E3R1, E5-003, Supabase47/57/59 ve RET97 sınırları kapanmaz. AI ilk okuması insan kullanıcı, fiziksel cihaz veya model çalışma zamanı tasdiki değildir.

## Gerçek yerel doğrulama ve hata geçmişi

Başlangıç kabul edilmiş main303 üzerinde run_all 12 kontrol +42 test PASS / worst0. Paket ve 12 soru cf6216f5ed8f3373f0ec943f62e2215be05e9a52 kaynağında koddan önce sabitlendi. İlk kod commit146aa3f23c5f6d56892c911b38ded161391b0156; önceki taslaklar yanlışlıkla kabul edilmiş kaynak sayılmaz.

İlk analiz 0 sorun; R1 analiz 0 sorun. İlk hedef test 28 PASS/1 FAIL: test native Semantics ui.Tristate.isFalse yerine boolfalse bekledi. Beklenti gerçek API değerine düzeltildi; disabled olma şartı korunur. Aynı taslakta büyük yazıda bekleyen EditableText caret kaydırması nedeniyle fatal olmayan pointer uyarıları oluştu. _tap önce pumpAndSettle ile bekleyen kaydırmayı bitirir, sonra ensureVisible yapar. Uyarılar kapatılmadı: hitTestWarningShouldBeFatal=true eklendi. Gerçek seçili güvenlik ve emin-değilim durumları ayrıca doğrulanır.

Root kritik bilinmeyen istek durumunun olumlu eski kaynak başlığından sonra y1226 konumunda olduğunu buldu. Önce gerçek sıralama regresyonu yazıldı; 0 PASS/1 FAIL, eski olumlu başlık y95. Ardından kritik blok en üste taşındı ve ayrı kaynak değerlendirmesi açıklaması eklendi; aynı test 1 PASS. Önceki ham kod ve RED test taslağı Temp altında özetleriyle korunur. İlk taşıma helper denemesi indent assertion yüzünden kaynak yazmadan durdu; düzeltilen deneme kaynak bloğunu taşıdı. Bu root yerel bulgusudur, bağımsız ret değildir.

R2 hedef test 29 PASS/1 FAIL; hit uyarısı yok, kritik sıra regresyonu geçti. Başarısızlık testin SemanticsHandle addTearDown ile framework doğrulamasından geç bırakmasıydı. try/finally açık dispose eklendi; Semantics beklentileri gevşetilmedi. Son R3: locked pub get PASS, strict format22 dosya/0 değişiklik, analyze0 sorun, bütün173 test PASS. Önceki142 +yeni30 normal=172; yalnız yerel native yakalama1 ile173. Normal CI sonucu bu yerel sonuçlardan türetilmez; gerçek aynı kaynak CI/T3 ayrıca beklenir.

30 yeni normal test kapsamı: geçersiz kimlik/seçenek ve değişmezlik; RED→GREEN kritik sıralama; boş belirti ve güvenlik beyanı; hayır/emin-değilim; tek soru/emin-değilim/fotoğraf; doğru istek payload; 11 geçersiz soru kaynağı; yabancı güvenlik; bağlam/istek/soru-anlam/revizyon seçim sıfırlama; desteklenen doğru hedef; altı boyutun her birinde11 olumsuz kaynak; 15 sonuç yetkisi uyuşmazlığı; beş öneri yalnız başına; eksik bilinen/hedef/beyan; netleşmemiş ve held; opsiyonel fotoğraf; aynı kimlik/orijinal tür uzlaştırma; yabancı bilinmeyen; busy/bilinmeyen seçim kapatma; güncel/yabancı hata; işleyici/busy/ücretsiz bilgi; gerçek Tab/Space/Enter; değişen etikette odak; disabled Semantics/liveRegion; boyanmış metin4.5/odak3; 20 durum×320/390/768×1/2/3 gerçek tam kaydırma/52 hedef/gerçek durum hazırlığı.

## Yedi E10 tasarım karşılaştırması

| Kapı | Gerçek karşılaştırma ve sınır |
| --- | --- |
| Bütün ekran | 20 durumun38 native390×844 görüntüsü, kaydırılmış devamlarıyla root tarafından açıldı. Kritik bilinmeyen/hata ve eksik güvenlik üstte; tek soru, bilinen/bilinmeyen/alternatif ve ayrı kaynak kontrolü görünür. |
| Ekranlar arası | Önceki kabul edilmiş SCR017 remap38 görüntüsü açılarak karşılaştırıldı. Ortak açık zemin/koyu metin/çağıran marka/52 hedef korunur; G01..04 tanı hiyerarşisi ayrı kalır. Altbar veya bütün aileyi tek şablona çevirme yoktur. |
| Durum | Belirti, evet/hayır/belirsiz güvenlik, olumlu/held/yabancı soru, emin-değilim gözlemi, desteklenen/eksik hazırlık/netleşmemiş/held/yalnız öneri, busy/bilinmeyen/hata ve yabancı durumlar ayrıdır. Aynı görünen failclosed görüntüler ayrı teknik girişlerdir; benzersiz piksel iddiası yok. |
| Duyarlı düzen | 20 durum×9 genişlik/ölçek bileşimi gerçek kaydırma/52 ölçümüyle geçti;38 native390×844. Gerçek telefon kanıtı değildir. |
| Erişilebilirlik | Gerçek Tab/Space/Enter, disabled Semantics/liveRegion, değişen etiketle sabit eylem odağı, boyanmış kontrast; pointer uyarıları fatal. Fiziksel yardımcı teknoloji sınanmamıştır. |
| Regresyon | Önceki142 test aynı173 çalışmada geçti; eski shell/SDK/lock/YAML/sorular korunur. Ham v73 byte eşit arşiv; E-DEV-106 eski esas gövdesi korunur. |
| Referans | G01..G04 gerçek kanonik PNGleri açıldı ve planpin Git bloblarıyla byte eşitliği doğrulandı. G01 gündelik belirti/güvenlik; G02 tek ayırt edici soru/emin-değilim/fotoğraf; G03 desteklenen yön/önizleme/ayrı uygunluk-hazırlık; G04 bilinen-bilinmeyen/ek gözlem/özet/güvenli destek korunur. Nihai varlık/font/token/teknik içerik ve piksel eşitliği iddiası yok. |

## Gerçek kaynak kimliği

Base 303f0de2beb0ec4933bb6d4f1302085ba2092c3b/PR108; plan fa914f013fdcd032faed876689092da245989459; precodecf6216f5ed8f3373f0ec943f62e2215be05e9a52; ilk kod146aa3f23c5f6d56892c911b38ded161391b0156. Kod LF SHA256 8b1d2ac77088a2bf497dfc5dd739cd0a12eac1f297241c105caac04342eb1417; test LF SHA256 3dc8e56e0e65aec845c1dacabac8343186a617b36505c84946cc622e1ff876c2; 12 soru LF SHA256 08a990f13fe51cc7b705d4a9511eb7fbb826153d627605269f8e392f4a77e6e3. Ham v73 203973 byte / RAW SHA256 57ab29768bae93e655bca44fef11588ebd4f0759722733a439aa75c97d513c19. v74/99 yalnız aday; main95/111/206 kabul sayımı artmadı.

- kavriva_e1009_r3-busy-supported-0.png RAW SHA256 3370cf05c1e8509bfb8db1e5e75832a731a28447f1b0464a3a26a37a81c0830f / 88817 byte /390×844
- kavriva_e1009_r3-busy-supported-1.png RAW SHA256 b67e02609a442d33d200a30345f7aea04bffeb4b3ead2e2fe42331cbe8d63540 / 84937 byte /390×844
- kavriva_e1009_r3-busy-supported-2.png RAW SHA256 3437453de58c241c2333756f6adbcea7e833166ea551ddfe3423a877d86ea6ab / 82010 byte /390×844
- kavriva_e1009_r3-check-0.png RAW SHA256 584812e9c45a019aeb0ac3cf6366b2c2ab69f85d3574ae9a9375bcd352829d58 / 67607 byte /390×844
- kavriva_e1009_r3-check-foreign-0.png RAW SHA256 f0cb4831345ab4d542b519173b889f5e1ae043c91649e9b56f865b6a88c9d0a5 / 39445 byte /390×844
- kavriva_e1009_r3-check-held-0.png RAW SHA256 f0cb4831345ab4d542b519173b889f5e1ae043c91649e9b56f865b6a88c9d0a5 / 39445 byte /390×844
- kavriva_e1009_r3-check-unsure-0.png RAW SHA256 638cbc61445024e5a5af221dd19c2758f0dd054f325cf40a783026a44527e2f2 / 66416 byte /390×844
- kavriva_e1009_r3-danger-no-0.png RAW SHA256 5ec3fb8f61cf035bb9453d84f7671b10ab7996edf63608b6e3990e9088786025 / 62999 byte /390×844
- kavriva_e1009_r3-danger-no-1.png RAW SHA256 b56d4516bc6c046539c6f108fcd1f93a05b8dcb780ed7dd268c77fe206718666 / 63003 byte /390×844
- kavriva_e1009_r3-danger-unsure-0.png RAW SHA256 b2a79fa6149b921d53ce6404415b28738ea2866e53986e5086a31f99d35d1b1c / 63086 byte /390×844
- kavriva_e1009_r3-danger-unsure-1.png RAW SHA256 189c24d31fff411399ac2a3adb5898da9b42f8853ded4461181982234aad6c86 / 63085 byte /390×844
- kavriva_e1009_r3-error-foreign-0.png RAW SHA256 7154307cf92ea8d838696de496e75621ff61c3b3f7e83a948edcf9f28e5c86a3 / 94506 byte /390×844
- kavriva_e1009_r3-error-foreign-1.png RAW SHA256 c74623b35fcce64ce16f821e31909d47bf8f7f9f4e08bc67eb74d17669c1ea96 / 81865 byte /390×844
- kavriva_e1009_r3-error-foreign-2.png RAW SHA256 3437453de58c241c2333756f6adbcea7e833166ea551ddfe3423a877d86ea6ab / 82010 byte /390×844
- kavriva_e1009_r3-error-supported-0.png RAW SHA256 d60447f2dd4b32b6028c7363d202353e8acc56c92a43bffae161ca9549f5587a / 93145 byte /390×844
- kavriva_e1009_r3-error-supported-1.png RAW SHA256 14f7e5ca735ca5d4a7c548880f89f9ff7f8ea25efd2c958e8493c08de3a50ff9 / 84864 byte /390×844
- kavriva_e1009_r3-error-supported-2.png RAW SHA256 3437453de58c241c2333756f6adbcea7e833166ea551ddfe3423a877d86ea6ab / 82010 byte /390×844
- kavriva_e1009_r3-outcome-unknown-0.png RAW SHA256 5b2b853b688d25710a586406decaeb8dbb5c42b6fbb6c95ab0485aca21fd0224 / 92648 byte /390×844
- kavriva_e1009_r3-outcome-unknown-1.png RAW SHA256 14f7e5ca735ca5d4a7c548880f89f9ff7f8ea25efd2c958e8493c08de3a50ff9 / 84864 byte /390×844
- kavriva_e1009_r3-outcome-unknown-2.png RAW SHA256 3437453de58c241c2333756f6adbcea7e833166ea551ddfe3423a877d86ea6ab / 82010 byte /390×844
- kavriva_e1009_r3-proposal-only-0.png RAW SHA256 8dc32bcab8b64d2fee3b8313b66403c116f16035ba5c72f86a79c314b85ebd9b / 53336 byte /390×844
- kavriva_e1009_r3-provider-held-0.png RAW SHA256 825679bc81ee750cd7528a46aeab93bf2b738a2fef2d6c1b2727ecce43fbd0d5 / 37694 byte /390×844
- kavriva_e1009_r3-safety-no-check-0.png RAW SHA256 ca0b5d41dccc4ca1296b5500ebd0d78e0ab8614df9fae9a225a077992b0c66ae / 79182 byte /390×844
- kavriva_e1009_r3-safety-no-check-1.png RAW SHA256 7d99a752e688855136a40a235828848fd0cbd9ece25fab40aa69caa2bf93073a / 79152 byte /390×844
- kavriva_e1009_r3-safety-unknown-result-0.png RAW SHA256 78a3a24d710fc1e737124e566beb0fe1f6f98fc07e74a2b945910057d26821b1 / 88737 byte /390×844
- kavriva_e1009_r3-safety-unknown-result-1.png RAW SHA256 b966bbb32d0a7df734054415dc990c0eb77696a83f46d708a2ecd69f3020ecb1 / 80994 byte /390×844
- kavriva_e1009_r3-supported-0.png RAW SHA256 585c65afac083f08c945c1e49b9e453c5ebbe5c5ebf553d0caee75c3b3645861 / 88411 byte /390×844
- kavriva_e1009_r3-supported-1.png RAW SHA256 c1789970f7a04f6a5bf1d7b869479db88c6b4d6d5d5694419fb6022e258925c9 / 81779 byte /390×844
- kavriva_e1009_r3-supported-held-0.png RAW SHA256 afd26ea73b1ae5882ea35f5f05777a703c090f0d62ee176b7c3418ccc939f644 / 88935 byte /390×844
- kavriva_e1009_r3-supported-held-1.png RAW SHA256 95573936a4a34fb0ef6c52abd51fb8cbeafcefea16cd7a03d87d8970a0eeba36 / 81388 byte /390×844
- kavriva_e1009_r3-symptom-0.png RAW SHA256 a58e8b41fe544425b86f194272eecb6b9df9b58c2822e698598d4110dba0939c / 58693 byte /390×844
- kavriva_e1009_r3-symptom-1.png RAW SHA256 849d33c3bc0b2ca226867df92f722150ef15b1bcb34106fbf6d8f5b38bedbbd2 / 58695 byte /390×844
- kavriva_e1009_r3-symptom-yes-0.png RAW SHA256 a3c419d442c8e235f56827854915ac8fc579dab9533380e92a5a7cf91fb461e7 / 60959 byte /390×844
- kavriva_e1009_r3-unknown-foreign-0.png RAW SHA256 516888b1b146ce0ce8e88a237b92a93a11e978b219401c8d6b9875b0952a0f6f / 95743 byte /390×844
- kavriva_e1009_r3-unknown-foreign-1.png RAW SHA256 636432d2cee5af4a9fc9e59985adcafb915246e8e9d6109863f7c9e0ccc4e763 / 83479 byte /390×844
- kavriva_e1009_r3-unknown-foreign-2.png RAW SHA256 3437453de58c241c2333756f6adbcea7e833166ea551ddfe3423a877d86ea6ab / 82010 byte /390×844
- kavriva_e1009_r3-unresolved-0.png RAW SHA256 6e31e303e115598685eb38181c138fdca94f462af85edb35dec782257c571478 / 88398 byte /390×844
- kavriva_e1009_r3-unresolved-1.png RAW SHA256 8f588fd075a10f0c985246789676842d9ed16d6b4ab69e12fd3bf13668ea69cb / 78327 byte /390×844

## Referans kimlikleri

[
  {
    "path": "refernces/G01-SCR-019-Symptom-Capture.png",
    "sha256": "31f864a269e70622b31a6369e26ee5b85ff2dcc9bc8957c48801d6b16a1deedc",
    "bytes": 1924227,
    "rootActualView": true
  },
  {
    "path": "refernces/G02-SCR-020-One-Diagnosis-Check.png",
    "sha256": "6fc7d07a33265cbe20520a7965eb32bb0596dc2994488098ca479eb88ba906d8",
    "bytes": 1025720,
    "rootActualView": true
  },
  {
    "path": "refernces/G03-SCR-021-Supported-Outcome.png",
    "sha256": "d91450a59eb5f4d6ea26a129c23b20302de3413398bcd85298bee1884f528168",
    "bytes": 1994548,
    "rootActualView": true
  },
  {
    "path": "refernces/G04-SCR-021-Unresolved-Outcome-Handoff.png",
    "sha256": "43cf5faf04bbfb9c6eca8c9e3f9aa75bd67acd091ed0c5734b9a5931f1fb3d70",
    "bytes": 1999617,
    "rootActualView": true
  }
]


## Korunmuş başarısız yerel kimlikler

kavriva_e1009_r1_failed_identity.json
{
  "rawHashes": {
    "code": "69cc49f79baa11b6c59db12b2569e1bb2d9309dfc57a2e52789e62d01035fea9",
    "test": "1c6c2088a7b29cb5587c4c554a82b71718e17ec72cd80a0e16ebd4d52a49efbd"
  },
  "result": "28PASS1FAIL: bool vs Tristate assertion; also nonfatal offscreen tap warnings; not acceptance"
}

kavriva_e1009_status_order_red_identity.json
{
  "codeRaw": "69cc49f79baa11b6c59db12b2569e1bb2d9309dfc57a2e52789e62d01035fea9",
  "scaffoldRaw": "dd10175bd4e7ad989af85e9896b4998ee6070212e6e0a6b9ee738d76f858f27e",
  "result": "0PASS1FAIL: unknown request heading below positive result"
}

kavriva_e1009_r2_failed_identity.json
{
  "rawHashes": {
    "code": "8b1d2ac77088a2bf497dfc5dd739cd0a12eac1f297241c105caac04342eb1417",
    "test": "2df75e0506a359f096f4e3292fae7550ebb3c9a21054e24066286ae85b7b0eb2"
  },
  "result": "29PASS1FAIL active SemanticsHandle after test; actual order regression passed; no offscreen warnings with fatal hit tests"
}


## Bağımsız ilk okuma — değiştirilmemiş rapor

RAW SHA256 e09aa7a08258ddb4e1cbc066a09a38424470e12e15b6c2d4bb34048fa65580bf

Kavriva E1-009 — bağımsız ilk ekran okuması
Tarih: 2026-10-04

Kapsam ve yöntem
Yalnızca verilen 12 soruyu ve manifestteki 38 PNG görüntüyü inceledim. Manifestteki 38 dosyanın her birini view_image ile açtım; kaydırılmış parçaları aynı ekranın devamı olarak okudum. Kod, plan, cevap anahtarı, önceki rapor veya dış kaynak kullanmadım. Aşağıdaki yanıtlar görüntülerden kendi anladıklarımdır.

Sorulara yanıtlar

1. Hayır. “Teknik terim kullanmadan anlatabilirsin” deniyor; kullanıcı sorunu günlük diliyle tarif edebilir.

2. Hayır. “Hayır” veya “Emin değilim” seçilirse tanı/gözlem sorusuna devam kapalı görünüyor. Metin güvenli bir yerde durmayı, emin olunmayan koşulu olumlu saymamayı söylüyor. Güvenli destek veya tanıdan çıkış yolları açık kalıyor. Ayrıca güvenli olduğuna dair kullanıcı beyanının güvenliği kanıtlamadığı ve motosikleti kullanma izni vermediği belirtiliyor.

3. Evet. “Emin değilim” açık bir gözlem seçeneği ve geçerli yanıt olarak tanıtılıyor. Bu seçeneği seçili gösteren ekranda yanıtı gönderme düğmesi de etkin.

4. Hayır. Gözlem olasılıkları ayırmaya yardım eder; kesin arızayı, tamiri veya güncel fiziksel durumu doğrulamaz. Sonuç ekranları da kesin arıza, yapılmış tamir ya da güvenli sürüş garantisi vermediğini söylüyor.

5. Doğrudan tamire başlanamaz. Bulgular yalnızca bir yönü destekliyor. Sıradaki yol gözlem rehberinin önizlemesi; ekrandaki açıklama bunun tamire başlama olmadığını özellikle belirtiyor. Rehber uygulanmadan önce motosiklete uygunluk ve hazırlık ayrıca ele alınmalı. Bazı görüntülerde önizleme kapalı görünüyor; bu durumda tamir izni verilmiş değil.

6. Evet. Motosiklet/variant, rehber uygunluğu, onay ve güncellik, önkoşullar, güvenlik ve hazırlık ile kaynak geçmişi ayrı başlıklar halinde kontrol ediliyor. Uygunluk ve hazırlığın rehber uygulanmadan önce ayrıca değerlendirilmesi gerektiği yazıyor. Olumlu kaynak kontrolü de motosikletin gerçek fiziksel güvenliğinin kanıtı olarak sunulmuyor.

7. Hayır. Netleşmemiş sonuçta rastgele parça değiştirmeyin deniyor. Ekran kesin sonuç tahmin etmiyor; ek gözlem yolu öneriyor.

8. Bilinenler (ör. sesin yalnızca fren yaparken duyulmuş olması), bilinmeyenler (sesin kesin nedeni) ve diğer olasılıklar ayrı başlıklarda gösteriliyor. Önceki gözlem kaydı sonuç ekranında korunmuş; ayrıca bilinen ve bilinmeyen bilgilerin korunduğu yazıyor. Bu kayıt güncel fiziksel durumun doğrulanması sayılmıyor.

9. Hayır. Fotoğraf ekleme isteğe bağlı bir yol. Fotoğraf eklemek otomatik teşhis, fiziksel doğrulama veya devam izni değil.

10. Hayır. Çevrimdışı kalmış veya yanıtı ulaşmamış istek başarı ya da başarısızlık sayılmıyor. Ekran önce aynı isteğin sonucunu kontrol etmeyi söylüyor; işlem tekrar uygulanmıyor, yeni yanıt ve olağan ilerleme kapalı tutuluyor. Bunu “başarılı” sayıp yeniden işlem başlatma yönünde bir mesaj okumadım.

11. Hayır. “AI önerisi tek başına onay veya güvenli kullanım izni vermez” açıkça yazıyor. Kaynak değerlendirmesi de ayrıca gerekli.

12. Hayır. Özet yolu bilgileri görüntülemek için; motosikletin tamir edilmiş veya işin tamamlanmış olarak kaydedilmediği açıkça belirtiliyor.

Anlam, fiziksel sonuç ve devam izni değerlendirmesi
Görüntülerde gözleme dayalı kesin arıza veya tamir sonucu iddia edildiğini görmedim. Güvenli kullanım izni ya da güvensiz/emin olunmayan durumda tanıya devam izni verildiği izlenimi de almadım. Rehber önizlemesinin açıklaması doğrudan tamir olmadığını söylüyor; güvenlik/hazırlık olumlu doğrulanmamış durumunda önizlemenin kapalı olduğu gösteriliyor. Sonuçların kullanıcı beyanı ve örnek kaynak bağlamı olduğu, fiziksel doğrulama olmadığı farklı noktalarda açıklanıyor.

“Bulgular bir yönü destekliyor” ifadesi tek başına hızlı okunduğunda güçlü bir teşhis izlenimi verebilir; hemen altındaki “kesin arıza değil” ve garanti vermediği açıklamaları bu anlamı daraltıyor. “Güncel kaynak kontrolü” altındaki olumlu doğrulama maddeleri motosikletin kendisinin fiziksel olarak incelendiği sanılabilir; motosikletin kullanıcı beyanı olduğu ve gözlemlerin güncel fiziksel durumu doğrulamadığı notları bu riski azaltıyor. Bunları doğrudan birbiriyle çelişen mesajlar olarak okumadım. Bazı ekran parçalarında düğmeler “şu anda kapalı” durumunda; bu, aynı akışın başka durumlarda görünen aktif düğmelerinden farklı bir durum gibi görünüyor. Statik ekranlardan etkileşimin gerçekten nasıl çalıştığını doğrulayamam.

Ne/niçin/sonraki adım açıklamalarının anlaşılabilirliği
Sorun anlatma ekranı ne yapılacağını (sorunu gündelik dille tarif etme), neden güvenli beyan gerektiğini ve güvensiz/emin olunmayan durumda tanıyı durdurup güvenli destek/çıkış yolunu anlaşılır biçimde veriyor. Gözlem ekranı geçerli yanıtları, “emin değilim” seçeneğini, gözlemin neyi sağlayıp neyi kanıtlamadığını ve isteğe bağlı fotoğrafı açıklıyor. Desteklenen sonuçta neden bunun kesin teşhis olmadığı ve sonraki adımın rehber önizlemesi olduğu anlaşılıyor. Sonuç net değilse rastgele parça değiştirmeme, bilinen/bilinmeyeni koruma ve ek gözlem seçeneği okunabiliyor. İstek sonucu beklemedeyse önce aynı isteği kontrol etme ve ilerlemeyi bekletme mesajı anlaşılır. Özetin tamir/tamamlama kaydı olmadığı da doğrudan ifade edilmiş.

Belirsizlikler ve sınırlamalar
- Bazı PNG’ler bir ekranın yukarı/aşağı kaydırılmış devamı; bu nedenle cümleleri komşu parçalarla birleştirerek okudum.
- Bunlar statik görüntülerdir; düğme davranışını, ekran okuyucu/klavye erişilebilirliğini veya gerçek telefondaki görünümü sınamadım.
- Türkçe metinleri AI olarak okudum. Bu rapor insan kullanıcıların anlayabildiğini ya da gerçek cihaz kullanılabilirliğini kanıtlamaz.


Yalnız38 görüntü ve koddan önce sabit12 soruyla geçmişsiz Luna max okuyucu çalıştı. Root12 yanıtın anlamca doğru olduğunu okudu. Hızlı okumada desteklenen yön/olumlu kaynak kontrolleri hakkındaki iki tavsiye notu korunur; bütün görev incelemecisi yeterliliği ayrıca değerlendirecektir. Statik AI okuması insan/telefon/etkileşim/model çalışma zamanı kanıtı değildir. Bütün kaynak hükmü, aynı kaynak CI/T3, ayrı son metadata hükmü ve son CI/T3 bekleniyor.


`vault/PROFILES/diagnosis-render.md`; `vault/PACKS/P-E1-009.md`; `vault/REGISTRY/T-E1-009.md`; `vault/EVIDENCE/E-DEV-107.md`.

## İlk bağımsız kaynak reddi — değiştirilmemiş rapor

T-E1-009 / PR109 — Bağımsız tam görev incelemesi
Tarih: 2026-10-05

KARAR: CHANGES_REQUESTED

İncelenen kaynak: 3a42930073240a0d73f4f94e7c8da9216616f865
Karşılaştırma tabanı: 303f0de2beb0ec4933bb6d4f1302085ba2092c3b
Plan kanıt sabitlemesi: fa914f013fdcd032faed876689092da245989459
PR: https://github.com/xpike-dgm/kavriva-app/pull/109 — OPEN, DRAFT, base/head eşleşiyor

Bu, performeri yapan kişiden ayrı yürütülmüş kaynak ve tasarım kabul incelemesidir. Kaynak diffi ile plan kısıtları genel olarak kapsamlı ve izlenebilir; gerçek CI ve T3 de başarılıdır. Buna rağmen aşağıdaki P2 bulgusu, onaylı G02 kapsamıyla çeliştiğinden bu HEAD için kaynak kabulünü engelliyor. E-DEV-107 RECORDED ve T-E1-009 REVIEW olarak kalmalı; bu rapor hiçbir kaydı DONE yapmaz.

1. Bulgu — P2: her gözlemde gereksiz fotoğraf yolu açılıyor

Konum: modules/e01-app/internal/shell/lib/diagnosis.dart:631-638

Kontrol ekranında fotoğraf yolu eylemi koşulsuz olarak oluşturuluyor: “İstersen fotoğraf ekleme yolunu aç”. Eylem normal durum ve observationSafe ile etkinleşiyor; aynı kontrol için fotoğrafın isteğe bağlı ve otomatik teşhis olmadığı açıklaması gösteriliyor. Ancak geçerli gözlem örneği “Ses ne zaman oluyor?” olup kullanıcıdan yalnızca sesin ne zaman duyulduğunu ayırması isteniyor. DiagnosisCheck sözleşmesinde bu soru için güncel, kapsam/istek/soruya bağlı bir “fotoğraf belirsizliği anlamlı ölçüde azaltır” kanıtı veya nedeni bulunmuyor. Bu nedenle E1, fotoğraf yolunu soru bazında faydaya göre kapatamıyor.

Planın sabitlenmiş 03_DESIGN/KAVRIVA_DIAGNOSIS_VISUALS_01_HANDOFF.md, J/102-108 bölümü G01 ve G02’de fotoğraf çekiminin varsayılan etkileşim olmadığını, G02’nin basit gözlemle yanıtlandığını ve bu ekranda fotoğraf kontrolü gösterilmediğini açıkça söyler. Gelecekte fotoğraf ancak belirsizliği anlamlı biçimde azaltıyorsa istenmeli; önceki kanıt tekrar yükletilmemelidir. Sabitlenmiş 03_DESIGN/DIAGNOSIS_VISUAL_REFERENCES.md, Required Constraints #5 de fotoğrafı yalnızca anlamlı ölçüde faydalı olduğunda istemeyi şart koşar. Gerçek G02 referans görüntüsü aynı sınırı gösteriyor.

Bu fark yalnızca teorik değil: gerçek 390×844 aday ekranlarından kavriva_e1009_r3-check-0.png ve kavriva_e1009_r3-check-unsure-0.png üzerinde kontrol fotoğraf CTA’sı bulunuyor. “İsteğe bağlı” ve “otomatik teşhis değil” metni zorlayıcılığı azaltıyor; fakat gereksiz veri/medya yolunu standart gözlem akışında sunma ve kabul edilmiş G02 sınırını ihlal etme sorununu gidermiyor. Bu tek başına fiziksel güvenlik ihlali olarak sınıflandırılmadı; kapsam, gereksiz özel medya toplama ve kullanıcı beklentisi riski nedeniyle P2’dir.

Düzeltme ölçütü: mevcut G02 gözleminde fotoğraf eylemini kaldırın. Gelecek bir soru için eylem gerekiyorsa, yalnızca güncel ve aynı kapsam/istek/soruya bağlı, yetkili bir tipli fayda gerekçesi fotoğrafın belirsizliği neden anlamlı azalttığını bildirdiğinde gösterilsin; unknown/stale/foreign durum kapalı kalsın ve daha önce sağlanmış kanıt yeniden istenmesin. Hem mevcut G02’de kapalı durumu hem de gerekçe bulunduğu desteklenen örneği doğrulayan regresyon ve yeni gerçek native durum görüntüleri eklenmeli; ilk okuyucunun soruları bu kararı sınamalı ve düzeltilmiş HEAD aynı PR CI/T3 ile ayrı yeniden incelenmelidir. Bu öneri bir medya sağlayıcısı, yükleme, backend veya gerçek fotoğraf işleme üreticisi gerektirmez.

2. İnceleme kapsamı ve kimlik doğrulaması

• Kaynak checkout tam HEAD 3a42930073240a0d73f4f94e7c8da9216616f865 olarak doğrulandı; git çalışma ağacı temizdi. Base→HEAD diffin tamamı ve diff check okundu. Değişiklikler tam 15 kapsam yolunda: 4.147 ekleme, 12 silme. Scope manifestindeki 16 base pinin blob kimlikleri karşılaştırıldı. Plan dosyaları güncel çalışma kopyasından değil, istenen fa914f013fdcd032faed876689092da245989459 pininden okundu.
• Koddan önce sabitlenmiş pack kaynağı cf6216f5ed8f3373f0ec943f62e2215be05e9a52; ilk kod commit’i 146aa3f23c5f6d56892c911b38ded161391b0156. Kod/test/12 soru dosyalarının konu özeti ve E-DEV-107 hashleri eşleşiyor: diagnosis.dart LF SHA-256 8b1d2ac77088a2bf497dfc5dd739cd0a12eac1f297241c105caac04342eb1417; diagnosis_test.dart 3dc8e56e0e65aec845c1dacabac8343186a617b36505c84946cc622e1ff876c2; frozen questions 08a990f13fe51cc7b705d4a9511eb7fbb826153d627605269f8e392f4a77e6e3.
• 841 satırlık diagnosis.dart, 1.150 satırlık diagnosis_test.dart ve 12 sorunun tamamı incelendi. E-DEV-107, profile, pack, registry, sabit governed-path snapshot, inventory, E-DEV-106 farkı, E1/E9 manifestleri, registry/routing indeksleri ve CI_PLAN da okundu. Yeni snapshot’ın önceki governed-path inventory içeriğini koruduğu; E-DEV-106 ana gövdesinin korunup yalnızca tüketim bağlarının eklendiği; eski M1/M9 sözleşme metinleri, raw v73 kanıtı, shell/SDK/lock/YAML ve önceki 142 testin korunduğu kayıt ve bloblarla karşılaştırıldı. E3R1, E5-003, Supabase 47/57/59 ve RET97 üzerinde değişiklik yok.
• Planın TASK_INDEX, kabul matrisi, dependency graph, TASK_EXECUTION_PROTOCOL, ADR-014, CON-004, MODULE_BOUNDARIES ve diagnosis tasarım/handoff/reference belgeleri sabit plandan incelendi. E9 önerir, E1 sunar, E3 doğrular sınırı ve T-E1-009 için bağımsız reviewer şartı doğrulandı. T-E1-009 kodu yalnızca render/presentation kapsamındadır; üretici veya fiziksel gerçeklik kanıtı değildir.

3. Tasarım ve ekran kanıtının bağımsız değerlendirmesi

Aday manifestteki 38 PNG’nin her biri gerçek view_image ile açıldı; kaydırılmış görüntüler tam ekranın devamı olarak okundu. Ayrıca dört gerçek kanonik G01-G04 plan PNG’si açılıp reference pin metadata’sındaki SHA-256 ve boyutla eşleşti. Önceki kabul edilmiş E1008 R6 remap ailesinden 38 PNG de gerçek görüntü olarak açılıp ortak akış/ekran davranışı karşılaştırıldı. İnceleme böylece 38 aday + 4 kanonik referans + 38 önceki kabul edilmiş ekranı kapsar; görsel kopya/pixel eşitliği veya nihai marka/token onayı iddia edilmez.

Yedi V-E10 tasarım kanıtı karşılaştırması:
1) Full-screen: 20 sunum durumu için 38 native 390×844 görüntü mevcut; tam ekran ve kaydırma devamları okundu. Görüntü kanıtı mevcut; içerik kabulü aşağıdaki G02 bulgusu nedeniyle geçmez.
2) Cross-screen: önceki kabul edilmiş remap ekran ailesi ile G01-G04 karşılaştırıldı. Akış hiyerarşisi ve amaçların büyük bölümü tutarlı; her gözlemde fotoğraf yolu G02 ile çeliştiği için bu kapı geçmez.
3) Cross-state: 20 durumun güvenlik, eksik/eski/yabancı kaynak, supported/unresolved/held, busy/unknown/error ve recovery ayrımları incelendi; tehlikeli veya belirsiz yanıttan normal ilerleme kapalı. Geçer.
4) Responsive/Türkçe: gerçek widget testleri 20 durum × 320/390/768 genişlik × 1/2/3 metin ölçeği, kaydırma ve en az 52 hedef ölçümünü kapsıyor; native çıktılar 390×844. Kanıt geçer; gerçek telefon/OS ölçümü değildir.
5) Accessibility: Tab/Space/Enter, odak korunumu, disabled semantics/liveRegion, boyanmış metin kontrastı ve pointer uyarılarının fatal olması test edilmiş. Kaynak test kanıtı geçer; fiziksel ekran okuyucu veya yardımcı teknoloji sertifikası değildir.
6) Visual regression: eski test kapsamı ile yeni kapsam birlikte korunmuş; görüntü kimlikleri, gerçek state testleri ve önce/sonra kanıtları mevcut. Test/evidence kapsamı geçer; canonical fotoğraf kısıtı ayrıca kalır.
7) Canonical reference: G01/G03/G04’ün genel rolü ve G02’nin tek ayırt edici gözlem rolü korunuyor; fakat G02’de fotoğraf CTA’sı olmadığı halde adayda bulunuyor. Bu nedenle uyum geçmez.

E10 DESIGN_GATE_CHECKLIST ve DESIGN_REGRESSION_EVIDENCE_RULE bunların kaynak bazlı manuel, konuya bağlı karşılaştırmalar olduğunu; tek screenshot, metadata varlığı veya yeşil yapısal CI’nin UI tasarım kabulünü kanıtlamadığını belirtir. Burada görüntü ve state kanıtı gerçekten incelenmiştir; kalan G02 uyumsuzluğu buna rağmen görünür tutulmuştur.

4. 12 soruluk ilk okuma

Önceki görev geçmişine sahip olmayan, kodu/planı/cevap anahtarını/önceki raporu/dış kaynağı görmeyen ayrı Luna Max ilk okuyucu yalnızca sabit 12 soru ve 38 PNG’yi kullanmıştır. Değiştirilmemiş rapor Temp/kavriva_e1009_first_reading.txt, SHA-256 e09aa7a08258ddb4e1cbc066a09a38424470e12e15b6c2d4bb34048fa65580bf. On iki yanıtı bu incelemede görseller ve kaynakla karşılaştırdım; ana anlamları doğru ve makul biçimde gerekçelendirilmiş. Okuyucu belirsizlik/otorite, güvenlik, tamir iddiası, sonuç, tekrar uygulama ve özet konularını ayırt ediyor; desteklenen yön ve olumlu kaynak kontrolleriyle ilgili iki hızlı okuma nüansı da raporlanmış.

9. soruya “fotoğraf isteğe bağlıdır, otomatik teşhis değildir” cevabı görüntü metnini doğru okuyor. Ancak soru, bu spesifik basit gözlemde fotoğrafın anlamlı faydası olup olmadığını sormuyor; böylece okuyucu gerçek plan/kapsam uyumsuzluğunu yakalamıyor. Bu durum ilk okumanın 12 yanıtını yanlış yapmaz, ama G02 fotoğraf kısıtını bağımsız kabul için tek başına yeterli biçimde sınamadığını gösterir. Okuma AI statik ekran okumasıdır; insan kullanıcı, fiziksel cihaz, gerçek etkileşim veya üretim çalışma zamanı kanıtı değildir.

5. Testler, gerçek CI ve PR

Kaynak testleri çalıştırılmadı; kayıt ve CI makbuzları incelendi. Gerçek R3 yerel makbuzları C:/Users/Xpike/AppData/Local/Temp/kavriva_e1009_r3_format.txt, kavriva_e1009_r3_analyze.txt ve kavriva_e1009_r3_all_test.txt: locked pub get PASS; 22 format dosyası / 0 değişiklik; analyzer 0 sorun; toplam 173 test PASS (önceden var olan 142 + 30 yeni normal CI testi + 1 yerel native test). Ayrı 30 test; kapsam/kimlik/değişmezlik, güvenlik ve tek gözlem, 11 invalid source case, durum değişince seçim sıfırlama, 6 boyutun her biri için 11 negatif kaynak, 15 result authority uyuşmazlığı, yalnız öneri, supported/unresolved/held, foreign/busy/unknown/error fail-closed, aynı kimlik ve özgün istek türüyle reconcile intent, klavye/semantics/odak/kontrast ve 20×9 responsive görünüm gruplarını kapsıyor.

GitHub makbuzu C:/Users/Xpike/AppData/Local/Temp/kavriva_e1009_source_ci_receipt.md, source_ci.json, source_jobs.json ve ilgili source_log_*.txt dosyalarından, ayrıca read-only gh run view ile doğrulandı. Exact HEAD’de aynı pull_request run 37233779837 SUCCESS; checks job 111528749986 7/7 adım, t3-gate job 111528750193 5/5 adım SUCCESS. Kaynak makbuzu 17/17 başarıyı (8 push ve 8 PR suite olayı ile son PR T3/label gate) doğruluyor. E1 PR CI: 172 PASS, format 22/0 değişiklik, analyzer 0 sorun; E4 170 PASS; E9 9 PASS. İlk PR mimari çalışmasındaki T3 SKIPPED durumu kabul kanıtı sayılmadı. Yeşil CI bulguyu ortadan kaldırmaz.

E-DEV-107’deki eski yerel hata geçmişi de okundu: native Tristate beklentisi düzeltilmiş; bekleyen kaydırma/tap uyarıları bastırılmak yerine fatal test kapısına alınmış; kritik unknown durumunun olumlu eski kaynak başlığından sonra kalmasına karşı önce RED sonra GREEN sıralama testi eklenmiş; SemanticsHandle try/finally ile kapatılmış. Bunlar mevcut HEAD’e karşı bağımsız bulgu değildir.

6. Görev ve ürün sınırı

E-DEV-107 sonucu RECORDED; bağımsız reviewer alanı boş ve gate verdict REVIEW’dür. T-E1-009 registry REVIEW kalmalı. Inventory’de 95 DONE / 111 remaining / 206 toplam sayımı değişmiyor; v74/99 üretilmiş kayıt bu görev için adaydır, ana kabul değildir. Son altı metadata kabul adımı bu kaynak hükmüne dahil değildir ve tamamlanmış sayılmamalıdır.

PR109 read-only GH görünümünde OPEN ve DRAFT; reviewDecision boş, mergeState CLEAN. Açık/draft PR durumu görev kabulü veya yayın değildir.

Bu kaynak E1 tanı sunumudur. E9 üreticisi/öneri runtime’ı, E3 doğrulaması ve gerçek T-E4-011b/T-E3-004 uzlaştırma entegrasyonu yoktur. OUTCOME_UNKNOWN aynı kimlik ve özgün türle yalnızca reconcile niyetini verir; gerçek request-result proof veya replay yoktur. Üretim API/model/veri tabanı/kimlik/medya, fiziksel motosiklet durumu, tamir veya sürüş kullanımı kanıtı, cihaz/yardımcı teknoloji doğrulaması ve yayın HELD kalır.

Nihai hüküm:
• Kaynak/T-E1-009: CHANGES_REQUESTED (tek P2: her G02 gözleminde fotoğraf CTA’sı).
• Aynı HEAD CI/T3: PASS, gerçek PR T3 ve 17/17 receipt doğrulandı.
• Task: REVIEW; bağımsız kabul verilmedi, DONE değil.
• PR: OPEN/DRAFT; yayımlanmış/merge edilmiş değil.
• Üretim, fiziksel sonuç ve kalan altı metadata kapısı: HELD / ayrı değerlendirme bekliyor.

Bu rapor için kaynak dosyalara, PR’a, git reflerine veya iş akışlarına mutasyon yapılmadı. Yalnızca istenen bağımsız rapor Temp alanına yazıldı.


Rapor RAW SHA256 dde4c9a1eb99114fae4212ae00f5d1fa59f47aa79f1c2a977e12c9f6d2505046. Exact eski kaynak 3a42930073240a0d73f4f94e7c8da9216616f865; aynı kaynak17CI/T3 başarısı P2 bulgusunu kapatmaz. İlk12 okuma doğru fakat fotoğrafın maddi fayda şartını sınamaz. Yeni soru kapsamı koddan önce ayrı sabitlenecek; eski12soru/rapor/PNG/Gitkimliği korunur.

## Gerçek source CI makbuzu

Exact kaynak 3a42930073240a0d73f4f94e7c8da9216616f865; 17/17 gerçek SUCCESS; push8/PR8 ve ilk label architecture varsa ayrı olay. Bütün job ve adımlar tek tek başarıyla doğrulandı.

PR checks job111528749986: 7 başarılı adım/success.

PR t3-gate job111528750193: 5 başarılı adım/success.
- pull_request architecture-checks: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233763925 — SUCCESS.
- pull_request architecture-checks: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233779837 — SUCCESS.
- pull_request e1-shell-widget-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233763967 — SUCCESS.
- pull_request e3-commit-authorization-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233763932 — SUCCESS.
- pull_request e3-live-auth-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233763914 — SUCCESS.
- pull_request e4-offline-composition-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233763910 — SUCCESS.
- pull_request e5-current-authority-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233764015 — SUCCESS.
- pull_request e6-release-policy-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233763919 — SUCCESS.
- pull_request e9-bounded-proposal-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233763904 — SUCCESS.
- push architecture-checks: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233760043 — SUCCESS.
- push e1-shell-widget-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233760046 — SUCCESS.
- push e3-commit-authorization-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233760054 — SUCCESS.
- push e3-live-auth-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233760038 — SUCCESS.
- push e4-offline-composition-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233759962 — SUCCESS.
- push e5-current-authority-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233760034 — SUCCESS.
- push e6-release-policy-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233760037 — SUCCESS.
- push e9-bounded-proposal-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37233759992 — SUCCESS.

PR E1 gerçek log: formatter22zero/analyze0issue/172PASS; E4 170PASS ve E9 9PASS. Push veya ilk opened PR T3 SKIPPED/0 adım bağımsız kabul değildir; yukarıdaki gerçek labelled PR T3 SUCCESS ayrı doğrulandı. CI bağımsız reviewer hükmünün yerine geçmez.

## İkinci kaynak — koşullu fotoğraf ve önceki kanıtın yeniden istenmemesi

Önceki3a42930073240a0d73f4f94e7c8da9216616f865 kaynağı bağımsızCHANGES_REQUESTED/P2; değiştirilmemiş R1raporu ve gerçek17CI/T3makbuzu yukarıda tarihsel kanıt olarak korunur. İlkR3 173yerel/172CI/38PNG/20durum/12soru eski kaynağa aittir, yeni kabul kanıtı değildir. R2onarım kapsamı ve14 soruf4332a305c5d1573d5528deedbde05b540ef571c kaynağında onarım kodundan önce sabitlendi. İlk 12soru değişmedi;13 fotoğrafın maddi fayda gerekçesini,14 önceden sağlanmış fotoğrafın tekrar istenmemesini sınar. R2kod/test commitafb9e09a43d092fab9638dfdb4841e982bec62c8; kod LF SHA25653e4357ecc33fdb3e4383d22ee45e790f44004c2fb1b8518db3cf1b97ae3f44e; test LF SHA2561934deae45085bda8788fa3e336891beeef6728c976e49521f2d3a565990568d;14 soru LF SHA256544bd3b7d21de72e3886e298fadb70f55b61bcac33bcc9dbd346a5d490c47fa9.

DiagnosisPhotoRequest gerekli tam kapsam/istek/kontrol kimliği-revizyonu/maddi yararlılık/önceki kanıt durumu/gerekçe ve nullableauthority taşır. Olumlu varsayılan yoktur. Geçerli güncel soru ve aynı kapsam/istek/kontrolrevi, materyal yararlılık true ve diagnosis-photo amacı/aynıchecksubject ile olumlu güncel referans gerekir. E1 fotoğrafın faydasını veya önceki kanıtın gerçekliğini kendi başına üretmez. Basit G02 gözlemi fotoğraf istemez. Eksik/unknown/held/eski/yabancı/yanlışamaç-konu/yararlıdeğil özel gerekçe ve fotoğraf yolu göstermemektedir. Doğrulanmış kaynak önceki fotoğrafı bildirirse tekrar istemez; bu yalnız güncel kaynak bilgisi olup gerçek medya yükleme/işleme/kullanma kanıtı değildir. Fotoğraf isteği de kontrol kimliği/revizyonunu taşır; gözlemi otomatikseçmez/onaylamaz. Busy/hata/OUTCOME_UNKNOWN/güvenlik/işleyici yokluğu olumlu fotoğraf gerekçesiyle aşılmaz.

Gerçek eski kaynakta G02 fotoğraf CTA bulunmamalı regresyonu0 PASS / 1 FAIL verdi; aynı beklenti onarım sonrasında1 PASS. Eski kod RAW/LF8b1d2ac77088a2bf497dfc5dd739cd0a12eac1f297241c105caac04342eb1417; REDtest scaffold RAWcd9dcbc5d318beef034ea24881a2ed03dfe615c1757e653ff8c359f5309a41bb; precodeR2f4332a305c5d1573d5528deedbde05b540ef571c. REDkomut sonrası logu yazdıran dışPowerShell exit0 döndürdü; buna dışkomutexit1 atfedilmez. Logun gerçek test0 PASS / 1 FAIL sonucu korunur.

R4 bütün test176 PASS / 1 FAIL: bu görevin eski basitG02testi artık gösterilmeyen isteğe bağlı fotoğraf açıklamasını hâlâ bekliyordu. Eski test beklentisi fotoğraf yolu yok olarak düzeltildi; isteğe bağlı/otorite değil açıklamasınınfindsOneWidget beklentisi güncel olumlu fotoğraf örneğine taşındı, kaldırılmadı. Önceki 142kabul edilmiş test değiştirilmedi. R4ham kod53e4357ecc33fdb3e4383d22ee45e790f44004c2fb1b8518db3cf1b97ae3f44e; hamtestfe45a2030308bb85fbe2edd371caa07ab5758591fd822b2479f1a65251044798; log/snapshot/PNGler korunur, R4kabul değildir. Çok satırlı formatter bağlamı uymayan bir patch doğrulama denemesi dosya değiştirmeden durdu; doğru bağlamla patch uygulandı. BunlarR1bağımsızretine ek ikinci bağımsızret diye sunulmaz.

Son R5: lockedpubget gerçekR4 başarılı ve lock değişmedi; strictformat22dosya/0değişiklik, analyze0sorun, bütün177 yerel testPASS. Önceki 142+yeni 34=normalCI176; yalnız yerelnativecapture1 ile177. NormalCIhenüzbeklenir. Yeni 4 normal test: basitG02de fotoğrafCTA yok;20 negatif yararlılık/kapsam/istek/kontrol/rev/amaç/konu/unknown-held-güncellik örneği; önceden sağlanan fotoğrafı tekrar istememe ve gözlemi tamamlamama; olumlu fotoğraf gerekçesinde hata/busy/işleyiciyokluğu. Eski olumlu fotoğraf testi doğru checkpayload ve optional/disclaimer ile genişletildi; güvenlik/bilinmeyen durum testleri gerçekfotoğrafpozitifkaynakta disabled kapısını sınar.

24 durum×320/390/768×1/2/3, gerçek kaydırma/52hedef/fatalhitwarnings, klavye/disabledSemantics/liveRegion/odak/kontrast eski beklentileri korunarak geçti.43 native390×844PNG sonradan düzenlenmedi. Root 9 yeni/değişenR5PNGyi gerçekten açtı; diğer 34 güncel görüntü daha önce rootun gerçekten açtığıR3 görüntüleriyle byteeşitlikleri tek tek doğrulanarak karşılaştırıldı.43 ayrıR5dosya açılışı iddia edilmez;43 güncel görüntü içeriği9yeni+açılmış34byteeşit yöntemle incelendi. Önceki safety-no-check altparçası artıkgerekmiyor, eskiR3dosyası korunur. GeçerliG02, currentphoto/heldphoto/foreignphoto/previousphoto ve güvenlikolumsuzdurum yeni veya değiştirilmiş gerçek sahnelerdir.

YediE10kapısı için güncel ek karşılaştırma: bütün ekran tek soru/hiyerarşi ve yalnız gerekli fotoğraf gerekçesi; crossscreen G02gerçekkanıta uygun varsayılanfotoğrafyok ve öncekiE1remaportakstil; durumyararlılık/held/foreign/reuse ayrımı; responsive24×9/43PNG; accessibility aynıgerçek beklentiler; regression önceki 142test/eskiüretimkaynak-namespace/SDK-lock-YAML/hamv73/EDEV106esasgövde ve14 soruprecode; canonicalG01..04şart5veHANDOFFJ doğrulanarak kaynakfotoğrafisteği belirsizliği anlamlı azaltma şartına bağlandı. Bu sunum E3/E9 gerçeküretici, medya/API/model/DB/identity/E3reconcileT4-011b-T3-004 veya fizikselarıza/tamir/sürüş/cihaz/yayın/nihaiassets-token-font-altbar-routingHELDi kapatmaz.

## İkinci geçmişsiz ilk okuma — değiştirilmemiş rapor

RAW SHA256bb6550ed6e1fe2aceeebaaaabb60f6f0a9294da58cf4f85ffaada1d25ba0dd6a

Kavriva E1-009 — bağımsız ilk ekran okuyucu raporu

Yöntem ve kapsam
- Yalnızca belirtilen görsel manifestini ve içindeki 14 soruluk JSON'u okudum.
- Manifestteki 43 PNG'nin her birini ayrı ayrı tools.view_image ile açıp inceledim; açılan gerçek görsel sayısı: 43/43. Tüm görseller 390×844 boyutunda.
- Parçalı/kaydırılmış görüntüleri aynı ekranın devamı olarak değerlendirdim. Ekranlardaki etiket ve uyarıları okuyarak yanıtladım; kaynak kod, plan, cevap anahtarı, önceki rapor veya dış kaynak kullanmadım.
- Bu, statik AI okumasıdır; insanın veya gerçek cihazdaki kullanılabilirliği kanıtlamaz.

Sorulara yanıtlar

1. Hayır. Sorunu serbest metinle gündelik dille anlatabileceğim söyleniyor; teknik terim kullanmadan yazmak mümkün.

2. Hayır. “Hayır” veya “Emin değilim” durumunda tanıya devam edilmemesi, güvenli bir yerde durulması ve emin olunmayan koşulun olumlu sayılmaması isteniyor. Gözlem sorusuna geçiş kapalı görünüyor; güvenli destek veya tanıdan çıkış yolu ayrıca sunuluyor.

3. Evet. “Emin değilim” gözlem sorusunda açıkça geçerli yanıt olarak belirtilmiş ve seçili hali de gösterilmiş.

4. Hayır. Bir gözlem seçmek yalnızca olasılıkları ayırmaya yardımcı oluyor. Metin bunun kesin arıza, tamir sonucu veya fiziksel test talimatı olmadığını açıkça söylüyor.

5. Hayır, doğrudan tamire başlanacağı anlamına gelmiyor. Sonraki yol rehber önizlemesi. Uygulamadan önce motosiklete uygunluk ve hazırlık koşullarının güncel kontrollerle ayrıca ele alınması gerektiği yazıyor.

6. Evet. Motosiklet/varyant, rehberin uygunluğu, onay ve güncellik, önkoşullar, güvenlik/hazırlık ve kaynak geçmişi ayrı ayrı kontrol edilmiş olarak listeleniyor. Diğer bir durumda güvenlik/hazırlık olumlu doğrulanmamış ve devam izni sayılmamış; bu nedenle her durumda olumlu sonuç varsaymıyorum.

7. Hayır. Sonuç netleşmediyse rastgele parça değiştirmemek açıkça belirtiliyor.

8. Bilinenler ve bilinmeyenler ayrı başlıklarla gösteriliyor. Örneğin bilinen gözlem “ses yalnız fren yaparken duyulmuş”; sesin kesin nedeni henüz bilinmiyor ve başka olasılıklar/fiziksel doğrulama gereği belirtiliyor. Önceki gözlemler ekranda kayıtlı bilgi olarak kalıyor; fakat tek başlarına motosikletin şimdiki fiziksel durumunu doğrulamıyor.

9. Hayır, fotoğraf zorunlu değil ve eklemek teşhisi otomatik onaylamıyor. Fotoğraf yolunun açıklaması, görüntünün yararlı olabileceğini ama fiziksel doğrulama veya devam izni olmadığını söylüyor.

10. Hayır. Sonucu bekleyen çevrimdışı istek başarı veya başarısızlık sayılmıyor; fiziksel işlem yeniden uygulanmıyor ve normal akış sonuç doğrulanana kadar kapalı. Aynı isteğin sonucunu kontrol etme seçeneği var. Yabancı/uyuşmayan isteğin yeniden kullanılmayacağı da belirtiliyor.

11. Hayır. AI önerisinin tek başına onay veya güvenli kullanım izni vermediği; güncel kaynak değerlendirmesinin ayrıca gerektiği açıkça yazılmış.

12. Hayır. Özet yolu bilgileri görmeye yarıyor; motosikleti tamir edilmiş veya işi tamamlanmış olarak kaydetmiyor.

13. Hayır, her gözlem sorusunda fotoğraf istenmiyor. Görsel, kaynağın o gözlem için yararlı bulduğu durumda sunuluyor; burada gözlemin hangi bölgeye ait olduğunu ayırt etmeye yardımcı olabileceği söylenmiş. Fotoğraf eklemek isteğe bağlı.

14. Hayır. Önceki fotoğrafın bu gözlem için zaten mevcut olduğu belirtiliyor ve yeniden fotoğraf istenmediği açıkça yazıyor.

Anlam ve çelişki değerlendirmesi

- Kesin ve doğrudan bir olgusal çelişki saptamadım. Kritik akışların çoğu anlaşılır: güvensiz/emin olunmayan durumda tanı duruyor; gözlem kesin arıza veya tamir sonucu sayılmıyor; destek ve çıkış yolları ayrı gösteriliyor; bekleyen istek tekrar uygulanmıyor; fotoğrafın isteğe bağlı olduğu ve sonuç/izin anlamına gelmediği anlatılıyor.
- Güvenlik konusunda küçük ama önemli bir anlam gerilimi var: bazı desteklenen sonuç ekranlarında “Güvenlik ve hazırlık: Bu sonuç için olumlu doğrulandı” yazarken aynı ekranda “güvenli sürüş garantisi vermez” uyarısı bulunuyor. Bunlar teknik olarak farklı şeyler olabilir; yine de ilk ifade tek başına okunduğunda sürüşe izin verildiği sanılabilir. Güvenlik kontrolünün olumlu olmasının sürüş izni olmadığını daha doğrudan söylemek, fiziksel güvenlik açısından daha anlaşılır olur. Sonraki yolun rehber önizlemesi olduğu ve uygulamadan önce ayrıca uygunluk/hazırlık kontrolü gerektiği genel olarak anlaşılabiliyor.
- “Hayır” seçili güvensiz ekranında “Gözlem sorusunu istemek için devam et — şu anda kapalı” ifadesi, hemen üstteki “tanıya devam etme” uyarısıyla birlikte okunmalı. Kapalı durumu yazılı olsa da “devam et” sözü güvensiz kullanıcıyı yanlış yönlendirebilir. Bu noktada kapalı eylemin amacı ve güvenli destek yolunun sonraki adım olduğu daha doğrudan ifade edilebilir.
- Bekleyen istek ekranında aynı isteği kontrol etme, sonucu doğrulanmadan normal akışın kapalı kalması ve işlemin yeniden uygulanmaması anlaşılır. Özetin tamir/tamamlanma kaydı olmadığı da açık.
- Fotoğrafın hangi gözlem için ve neden yararlı olabileceği, isteğe bağlı oluşu ve önceki fotoğraf varsa yeniden istenmemesi anlaşılır.
- Genel olarak “ne biliniyor/ne bilinmiyor” ve öneri ile kesin sonuç arasındaki fark okunabiliyor. Sonraki adım olumlu desteklenen durumda rehber önizlemesi; belirsizlikte ek gözlem; güvenli değil/emin değil durumunda tanıyı sürdürmeyip güvenli destek veya çıkış. Bunun doğrudan tamire başlama ya da motosikleti kullanma izni olmadığı metinlerden anlaşılıyor.



Yalnız43 gerçekR5PNG ve koddan önce sabit14 soru verildi; geçmişrapor/kod/plan/cevapanahtarı/dışyardım yok. Eski12yanıt yeni14 okumanın yerine geçirilmedi. Root 14 yanıtı okudu; anlamca doğru. Okuyucunun olumlu kaynak güvenliği ifadesi ve güvensiz durumdaki kapalı devam düğmesi hakkındaki iki tavsiye notu değiştirilmeden korunur; bütün bağımsız incelemeci yeterliliklerini ayrıca değerlendirecektir. AI okuması insan/cihaz/etkileşim/modelçalışmazamanı tasdiki değildir. Bütün bağımsızR2hükmü ve gerçekyeniCI/T3 beklenir;95/111/206ana kabul sayımı değişmedi.

## R5 görüntü kimlikleri

- Temp kavriva_e1009_r5-busy-supported-0.png RAW SHA256 3370cf05c1e8509bfb8db1e5e75832a731a28447f1b0464a3a26a37a81c0830f /88817byte/390×844
- Temp kavriva_e1009_r5-busy-supported-1.png RAW SHA256 b67e02609a442d33d200a30345f7aea04bffeb4b3ead2e2fe42331cbe8d63540 /84937byte/390×844
- Temp kavriva_e1009_r5-busy-supported-2.png RAW SHA256 3437453de58c241c2333756f6adbcea7e833166ea551ddfe3423a877d86ea6ab /82010byte/390×844
- Temp kavriva_e1009_r5-check-0.png RAW SHA256 9bd7c1d346c2da6d4fe0a3f2772b5f562785c46263fd4eb55ad5b06e18a11ed3 /57807byte/390×844
- Temp kavriva_e1009_r5-check-foreign-0.png RAW SHA256 f0cb4831345ab4d542b519173b889f5e1ae043c91649e9b56f865b6a88c9d0a5 /39445byte/390×844
- Temp kavriva_e1009_r5-check-held-0.png RAW SHA256 f0cb4831345ab4d542b519173b889f5e1ae043c91649e9b56f865b6a88c9d0a5 /39445byte/390×844
- Temp kavriva_e1009_r5-check-unsure-0.png RAW SHA256 59633536dbd1b7959e796315dfb1dd21e67bbd30d6a81df058a0ecfac29a1248 /57008byte/390×844
- Temp kavriva_e1009_r5-danger-no-0.png RAW SHA256 5ec3fb8f61cf035bb9453d84f7671b10ab7996edf63608b6e3990e9088786025 /62999byte/390×844
- Temp kavriva_e1009_r5-danger-no-1.png RAW SHA256 b56d4516bc6c046539c6f108fcd1f93a05b8dcb780ed7dd268c77fe206718666 /63003byte/390×844
- Temp kavriva_e1009_r5-danger-unsure-0.png RAW SHA256 b2a79fa6149b921d53ce6404415b28738ea2866e53986e5086a31f99d35d1b1c /63086byte/390×844
- Temp kavriva_e1009_r5-danger-unsure-1.png RAW SHA256 189c24d31fff411399ac2a3adb5898da9b42f8853ded4461181982234aad6c86 /63085byte/390×844
- Temp kavriva_e1009_r5-error-foreign-0.png RAW SHA256 7154307cf92ea8d838696de496e75621ff61c3b3f7e83a948edcf9f28e5c86a3 /94506byte/390×844
- Temp kavriva_e1009_r5-error-foreign-1.png RAW SHA256 c74623b35fcce64ce16f821e31909d47bf8f7f9f4e08bc67eb74d17669c1ea96 /81865byte/390×844
- Temp kavriva_e1009_r5-error-foreign-2.png RAW SHA256 3437453de58c241c2333756f6adbcea7e833166ea551ddfe3423a877d86ea6ab /82010byte/390×844
- Temp kavriva_e1009_r5-error-supported-0.png RAW SHA256 d60447f2dd4b32b6028c7363d202353e8acc56c92a43bffae161ca9549f5587a /93145byte/390×844
- Temp kavriva_e1009_r5-error-supported-1.png RAW SHA256 14f7e5ca735ca5d4a7c548880f89f9ff7f8ea25efd2c958e8493c08de3a50ff9 /84864byte/390×844
- Temp kavriva_e1009_r5-error-supported-2.png RAW SHA256 3437453de58c241c2333756f6adbcea7e833166ea551ddfe3423a877d86ea6ab /82010byte/390×844
- Temp kavriva_e1009_r5-outcome-unknown-0.png RAW SHA256 5b2b853b688d25710a586406decaeb8dbb5c42b6fbb6c95ab0485aca21fd0224 /92648byte/390×844
- Temp kavriva_e1009_r5-outcome-unknown-1.png RAW SHA256 14f7e5ca735ca5d4a7c548880f89f9ff7f8ea25efd2c958e8493c08de3a50ff9 /84864byte/390×844
- Temp kavriva_e1009_r5-outcome-unknown-2.png RAW SHA256 3437453de58c241c2333756f6adbcea7e833166ea551ddfe3423a877d86ea6ab /82010byte/390×844
- Temp kavriva_e1009_r5-photo-foreign-0.png RAW SHA256 1d4f0e5d86a8ac78a853663658ad99e0f20f074338df5f1844b1395577fff6e4 /62311byte/390×844
- Temp kavriva_e1009_r5-photo-held-0.png RAW SHA256 1d4f0e5d86a8ac78a853663658ad99e0f20f074338df5f1844b1395577fff6e4 /62311byte/390×844
- Temp kavriva_e1009_r5-photo-reuse-0.png RAW SHA256 fdbf26d5ed2547689e38d22d3d55850e1584d97982a9d2826652d96269531d04 /89494byte/390×844
- Temp kavriva_e1009_r5-photo-reuse-1.png RAW SHA256 915f399b212105f449ad3eac55ea34c3ead8d6280ccb4787c995f45858242121 /88702byte/390×844
- Temp kavriva_e1009_r5-photo-useful-0.png RAW SHA256 5fb0f38126922e9140d75cb18f29df2c4786ac38673cfb0aed5fc9f674dbedcb /86603byte/390×844
- Temp kavriva_e1009_r5-photo-useful-1.png RAW SHA256 b69d211542c2c0fd8fb4ea5f997d74eb5cd5aca4b8673d0371130565a7ebc28f /83561byte/390×844
- Temp kavriva_e1009_r5-proposal-only-0.png RAW SHA256 8dc32bcab8b64d2fee3b8313b66403c116f16035ba5c72f86a79c314b85ebd9b /53336byte/390×844
- Temp kavriva_e1009_r5-provider-held-0.png RAW SHA256 825679bc81ee750cd7528a46aeab93bf2b738a2fef2d6c1b2727ecce43fbd0d5 /37694byte/390×844
- Temp kavriva_e1009_r5-safety-no-check-0.png RAW SHA256 ab0809a8bfb189c2075e01268f580ce6aaeef0579b0cf422c75e7cfdde103a77 /69167byte/390×844
- Temp kavriva_e1009_r5-safety-unknown-result-0.png RAW SHA256 78a3a24d710fc1e737124e566beb0fe1f6f98fc07e74a2b945910057d26821b1 /88737byte/390×844
- Temp kavriva_e1009_r5-safety-unknown-result-1.png RAW SHA256 b966bbb32d0a7df734054415dc990c0eb77696a83f46d708a2ecd69f3020ecb1 /80994byte/390×844
- Temp kavriva_e1009_r5-supported-0.png RAW SHA256 585c65afac083f08c945c1e49b9e453c5ebbe5c5ebf553d0caee75c3b3645861 /88411byte/390×844
- Temp kavriva_e1009_r5-supported-1.png RAW SHA256 c1789970f7a04f6a5bf1d7b869479db88c6b4d6d5d5694419fb6022e258925c9 /81779byte/390×844
- Temp kavriva_e1009_r5-supported-held-0.png RAW SHA256 afd26ea73b1ae5882ea35f5f05777a703c090f0d62ee176b7c3418ccc939f644 /88935byte/390×844
- Temp kavriva_e1009_r5-supported-held-1.png RAW SHA256 95573936a4a34fb0ef6c52abd51fb8cbeafcefea16cd7a03d87d8970a0eeba36 /81388byte/390×844
- Temp kavriva_e1009_r5-symptom-0.png RAW SHA256 a58e8b41fe544425b86f194272eecb6b9df9b58c2822e698598d4110dba0939c /58693byte/390×844
- Temp kavriva_e1009_r5-symptom-1.png RAW SHA256 849d33c3bc0b2ca226867df92f722150ef15b1bcb34106fbf6d8f5b38bedbbd2 /58695byte/390×844
- Temp kavriva_e1009_r5-symptom-yes-0.png RAW SHA256 a3c419d442c8e235f56827854915ac8fc579dab9533380e92a5a7cf91fb461e7 /60959byte/390×844
- Temp kavriva_e1009_r5-unknown-foreign-0.png RAW SHA256 516888b1b146ce0ce8e88a237b92a93a11e978b219401c8d6b9875b0952a0f6f /95743byte/390×844
- Temp kavriva_e1009_r5-unknown-foreign-1.png RAW SHA256 636432d2cee5af4a9fc9e59985adcafb915246e8e9d6109863f7c9e0ccc4e763 /83479byte/390×844
- Temp kavriva_e1009_r5-unknown-foreign-2.png RAW SHA256 3437453de58c241c2333756f6adbcea7e833166ea551ddfe3423a877d86ea6ab /82010byte/390×844
- Temp kavriva_e1009_r5-unresolved-0.png RAW SHA256 6e31e303e115598685eb38181c138fdca94f462af85edb35dec782257c571478 /88398byte/390×844
- Temp kavriva_e1009_r5-unresolved-1.png RAW SHA256 8f588fd075a10f0c985246789676842d9ed16d6b4ab69e12fd3bf13668ea69cb /78327byte/390×844
