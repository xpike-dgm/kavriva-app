---
test_id: E-DEV-106
version: 1
contract_id_version: "SCR-017; C1.3/F1.3.1/FL1.3.3 remap v1"
subject_file: modules/e01-app/internal/shell/lib/guide_change_remap.dart
subject_digest: 0d479c92d1327ccca0ab70f9883237c838bee96895d26073be77ec2081b3b633
result: "RECORDED rehber değişiminde yeniden eşleme sunumu; bağımsız kabul bekleniyor"
evidence_links: [vault/PROFILES/guide-change-remap-render.md, vault/PACKS/P-E1-008.md, vault/REGISTRY/T-E1-008.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-105-E10-GOVERNED-PATHS-FOR-T-E1-008.md.snapshot, modules/e01-app/internal/shell/lib/guide_change_remap.dart, modules/e01-app/internal/shell/test/guide_change_remap_test.dart, modules/e01-app/internal/shell/test/fixtures/remap_reading_questions.json]
gate_verdict: "RECORDED kaynak REVIEW; üretim/cihaz/yayın HELD"
reviewer: none
timestamp: 2026-10-04
purpose: Materyal rehber değişiminde fiziksel durumun yeniden eşlenmesini sunmak
domain: first-use
module: e01-app
owner: E1
implements: [ADR-008, C1.3, F1.3.1, SCR-017, BR-018, BR-019, BR-020, BR-021, BR-022, BR-028, BR-039, BR-048, BR-059, BR-075, BR-084, BR-104, BR-124, BR-125, BR-126, BR-127, BR-148, BR-149, CON-001, CON-002, CON-003, CON-004, R-001, R-003, R-004, R-007, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: material-guide-change-remap-presentation
tasks: [T-E1-008]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [V-E1-REMAP-001]
used_by: [V-E1-REMAP-001, P-E1-008, T-E1-008]
evidence: []
supersedes: []
status: RECORDED
---

# Rehber değişiminde güncel durumun yeniden eşlenmesi

T-E1-008; C1.3/F1.3.1/FL1.3.3/SCR-017. Bu değişiklik yalnız E1 sunumunu kapsar. Güncel fiziksel durumun yeni rehbere eşlenmesi, teknik değerlendirme ve karar üretimi dış sağlayıcıların sorumluluğudur. E1 yalnız bunların güncel, doğru bağlamlı ve açıkça olumlu sonuçlarını gösterir; referans varlığı olumlu sonuç değildir.

GuideRemapEvidence eski tam kapsamı, yeni tam kapsamı, changeId, amaç, konu, kaynak/sürüm/konum/tarih ve güncelliği taşır. ExecutionScope içindeki motosiklet, rehber, bağlam revizyonu, çalışma, rehber sürümü, değerlendirme ve fiziksel revizyonun tümü eşleşmelidir. Rehber değişikliği bildirimi de aynı eski/yeni kapsama ve yeni değişim kimliğine bağlıdır. Bildirim eksik, eski veya yabancıysa özel metin gösterilmez; değişim henüz doğrulanmadı denir ve eski devam kapalı kalır.

GuideRemapReference için unknown, held ve confirmed ayrıdır; olumlu varsayılan yoktur. Fiziksel durum, motosiklete uygunluk, hazırlık ve kararın her biri confirmed ve aynı değişim/kapsam/amaç/konu/güncellik ile doğrulanmalıdır. GuideMappingResult da unknown, held, mapped, unmappable ayrımı taşır. Olumlu eşleme hem eski hem yeni kapsamı ve yeni hedef adım kimliği/etiketini doğrulamalıdır. Eksik kaynak gerçek eşlenemedi sonucu sayılmaz. Olumsuz eşlenemedi sonucu ancak kendi güncel kanıtıyla gösterilir.

Normal yeni rehber adımı; geçerli değişim bildirimi, geçerli güncel değerlendirme, olumlu yeni adım eşlemesi, dört olumlu referans ve boş olmayan bütün yeni değişime ait açıkça gözden geçirilmiş olumlu zorunlu kontrollerle açılır. Eksik/eski/yabancı/yanlış amaç veya konu/önceki değişim/unknown/held/boş liste/yalnız beyan açmaz. Kontrollerin risk, önleme ve durma koşulları görünürdür; renge veya kapalı ayrıntıya bırakılmaz.

InterruptedWorkSnapshot aynı motosiklet ve çalışma geçmişini hatırlatır. Son kesin adım, kayıtlı adım ve tarih üstte; sökülen/gevşetilen parçalar, ölçüm, fotoğraf/not, önceki güvenlik/hazırlık ve kaynak ayrıntıları tek açılır alandadır. Eski kayıt güncel fiziksel kanıt veya uygulama talimatı değildir. Eksik bilgi Bilinmiyor olarak kalır; başka motosiklet/çalışma içeriği gizlenir. Kapsam/değişim/geçmiş/bildirim değiştiğinde açık ayrıntı sıfırlanır.

Gözlem, tek kontrol, yeniden eşleme ve yeni adım düğmeleri yalnız güncel kapsam ve değişim kimliğiyle istek gönderir. Hedef adım yalnız doğrulanmış yeni hedef olabilir; eski adım tahmini, otomatik geri işlem, uygulama, kalıcı yazım veya tamamlandı üretimi yoktur. Fotoğraf/not eklemek kendi başına eşlemeyi doğrulamaz. Busy yazım/kontrol niyetlerini kapatır; hata normal yolu kapatır, tekrar deneme ayrı kalır. İşleyici yoksa eylem kapalıdır. Güvenli durdurma bilgisine ulaşma yolu normal devamdan, busy/hata ve ödemeden bağımsızdır; güvenli sonuç kaydı üretmez.

Dokuz ekran durumu ve açılmış geçmiş gerçek test kabuğunda gösterilir. Çağıranın marka alanındaki Kavriva metni nihai L05A varlığı değildir. Yeni logo, token, font, altbar veya routing politikası seçilmedi. Kabuk altbarı görüntü yakalama için kapalı tutar; ürün kararı HELD. Gerçek teknik kaynak, eşleme/fiziksel değerlendirme/kimlik/yetki sağlayıcısı, kalıcılık, medya, E3R1/E5-003/Supabase47-57-59/RET97, telefon/OS/yardımcı teknoloji, fiziksel uygulama ve yayın HELD. Sunum kabulü bunları kapatmaz.

## Gerçek yerel sonuçlar ve düzeltilen sorunlar

Paket ve dokuz soru 8e4f2d4 kaynağında koddan önce sabitlendi. İlk kod a842151b641cf28873ee4f23a42ed66fbe956ffb; son yerel yakalama düzeltmesi b833f1728c070b446f72e0168bdc98e53f49d8e9. Başlangıçta yeni paket henüz oluşturulmamış profil/görev/kanıta bağlandığı için run_all üç eksik bağlantı bildirdi. Bu ilk komut PASS değildir; kayıtlar tamamlandıktan sonraki komut ayrıca kaydedilir. Kabul edilmiş önceki ana dalın gerçek sekiz kontrolü başarılıdır.

İlk analiz gereksiz ! ve yanlış Semantics getter kullanımı nedeniyle iki sorun verdi; ikisi düzeltildi. İlk bütün testte 139 PASS / 1 FAIL oldu: kontrast testinin bir önceki ekran odağını taşıması 3 yerine 0 kenarlık beklentisi verdi. Her karşılaştırma yeni sahneyle başlatıldı; aynı kontrast beklentisi korundu ve test geçti. Daha sonra gerçek sağlayıcı sonucu değişirken klavye odağının kaybolduğu yeni test 0 PASS / 1 FAIL verdi. Eylem ve dış Padding için kararlı anahtarlar eklenerek odak korundu; aynı test 1 PASS oldu. Önceki başarısız taslak için dondurulmuş Git kaynağı veya ham dosya özeti yoktur; böyle bir kanıt iddia edilmez. Gerçek komut logları Temp altında korunur.

R3 bütün 141 test başarılıydı, fakat görsel kontrol notice-unknown ekran yakalamasında yanlışlıkla olumlu bildirim kullanıldığını buldu. Önceki R2/R3 görüntüleri kabul kanıtı değildir ve ayrı adlarla korunur. R4 yakalaması bilinmeyen bildirimi gerçekten null kullanır ve görünür bilinmeyen metin/özel değişim metninin yokluğu ayrıca doğrulanır. Patch bağlamı bulunamayan bir deneme dosya değiştirmedi. Bu sorun bağımsız ret diye sunulmaz; henüz okuyucuya gönderilmeden root görsel kontrolünde bulundu.

Son yerel R4: locked pub get başarılı; strict formatter 20 dosya / 0 değişiklik; analyze 0 sorun; bütün 141 test başarılı. Bunlar önceki 122 + yeni 18 + yalnız yerel PNG yakalama 1 testidir. Normal CI görüntü yakalama kapalı olduğundan 140 test beklenir; henüz CI sonucu iddia edilmez. Gerçek Roboto/native PNG yakalamaları tester.runAsync ile yapıldı, sonradan düzenlenmedi. Toplam 31 görüntü 390×844, tam ekranı örten kaydırma serileridir. Root bütün 31 güncel görüntüyü açtı.

## On sekiz anlamlı test

1. Gerekli kimlikler, değişmez listeler ve çift kontrol kimliği reddi.
2. Başlangıçta doğrulanmamış sonuçlar ve istek ile sonuç ayrımı.
3. Değişen konu, önem, güvenlik/durma, geçmiş ve kaynak ayrıntıları.
4. Tam olumlu güncel sonuçta yalnız doğrulanmış yeni hedef isteği.
5. Dört referansın unknown/held durumlarının her biri yolu kapatır.
6. Değerlendirmede yedi kapsam alanının her biri ve değişim uyuşmazlığı.
7. Referansların amaç/kapsam/güncellik/değişim/konu/eksik kaynak reddi.
8. Bildirimin eski/yeni kapsamı, amacı, değişimi ve güncelliği.
9. Eşlemenin eski/yeni kapsamı, hedefi, amaç/güncellik/unknown/held/eksik kanıtı.
10. Güncel zorunlu kontrolün olumlu/gözden geçirilmiş olması; boş/eski/yabancı/yanlış konu reddi.
11. Eksik/yabancı geçmiş ve değişmeyen rehberin özel içeriği açmaması.
12. Kanıtlı eşlenemedi ile bilinmeyen sonucu ayırma.
13. Busy/hata/işleyici yokluğu ve ücretsiz güvenli durdurma yolu.
14. Bağlam/değişim/geçmiş/bildirim değiştiğinde açık ayrıntıyı sıfırlama.
15. Gerçek Tab/Enter/Space sırası ve disabled Semantics.
16. Dokuz durum için 320/390/768 genişlik × 1/2/3 yazı ölçeği, gerçek kaydırma ve en az 52 hedef.
17. Boyanmış metin kontrastı en az 4.5, odak en az 3, canlı durum alanı.
18. Sağlayıcı sonucu değişirken odaklanan yeniden eşleme eyleminin kimliği korunur.

## Yedi tasarım karşılaştırması

| Kapı | Gerçek karşılaştırma ve sınır |
| --- | --- |
| Bütün ekran | Dokuz durumun üçer kaydırması ve geçmişin dört kaydırması açıldı. Üstte değişim/önem/güvenlik/durma, küçük eski adım, güncel sonuç, bir baskın sonraki eylem ve sakin güvenli durdurma bulunur. |
| Ekranlar arası | Önceki kabul edilmiş SCR016 ve SCR014 ile aynı açık zemin, koyu metin, çağıran marka ve en az 52 hedef yaklaşımı; SCR017 değişim/eşleme hiyerarşisi ayrı korunur. U04 bütün aileye kopyalanmadı. |
| Durum | Bilinmeyen bildirim, başlangıç, sağlayıcı held/unknown, eşleme held/unknown, eksik kontrol, hazır ve kanıtlı eşlenemedi ayrı gösterildi. Kaynak varlığından olumlu sonuç çıkarılmaz. |
| Duyarlı düzen | Dokuz durum × üç genişlik × üç yazı ölçeği gerçek kaydırma/ölçüm testinde geçti. 31 native görüntü 390×844. Fiziksel telefon kanıtı değildir. |
| Erişilebilirlik | Gerçek klavye, disabled Semantics, canlı durum alanı, gerçek boyanmış kontrast ve sağlayıcı güncellemesinde odak korunması. Odak kaybı gerçek FAIL → anahtar düzeltmesi → aynı test PASS olarak korunur. |
| Regresyon | Önceki 122 test aynı bütün çalışmada geçti. Önceki kaynak/test/SDK/lock/YAML ve dokuz soru değişmedi. Ham v72 envanter byte eşit arşivlenir; E-DEV-105 esas gövdesi korunur. |
| Referans | Root gerçek kanonik E04-SCR-017-Material-Guide-Change-Remap-v2-L05A görselini açtı. SHA256 b0c050ee2b2e414a5d11cbdc1d62914fd11463237f7054efdad9e66fa4cb6620 plan Git blobu ile byte eşit. Değişim/önem/güvenlik-stop, fiziksel durum, remap, eski devamın durması, eşlenemedi ve güvenli kapatma korunur. Nihai varlık/token/font/altbar ve gerçek teknik içerik HELD; piksel eşleşmesi iddiası yok. |

## Kaynak kimliği

Base 499a6a43bcffe6ae203c3f38b313ee1cfe8374dc, PR107; plan fa914f013fdcd032faed876689092da245989459. Kod b833f1728c070b446f72e0168bdc98e53f49d8e9; code LF SHA256 0d479c92d1327ccca0ab70f9883237c838bee96895d26073be77ec2081b3b633; test LF SHA256 f37ee75ea56ba27d4ffd9bad6f59a807688c9acd589962d74c93e50150226223; dokuz soru LF SHA256 c30d01059c04b1d993a46f3c8e567711052529c0b0645762e61e9e770d3ab6cd. Ham v72 202549 byte / SHA256 816a2f295f453deca8018df350ee9cfa0dd216800bb8ae69e2a3ab22e7ea2ee8; Git blobuyla byte eşit. v73 / 98 kayıt yalnız adaydır; kabul 94 / kalan 112 / 206 değişmedi.

- Temp kavriva_e1008_r4-history-0.png SHA256 b50cb43109d711bd225bb01e9276cb1502b263a080de13516626b320272df521
- Temp kavriva_e1008_r4-history-1.png SHA256 18a83da82797309c62089a18bc66f2651067025501eec4f58c6de0520e3a3c4c
- Temp kavriva_e1008_r4-history-2.png SHA256 02c598b369a8abfa981ff03680420f7651b962ff352ba4e625c82c94224d2c60
- Temp kavriva_e1008_r4-history-3.png SHA256 feb845b9254420ebfc58fbcfbe146e7e7cde0d622d9ccce18ece63b541e952e2
- Temp kavriva_e1008_r4-initial-0.png SHA256 b50cb43109d711bd225bb01e9276cb1502b263a080de13516626b320272df521
- Temp kavriva_e1008_r4-initial-1.png SHA256 18a83da82797309c62089a18bc66f2651067025501eec4f58c6de0520e3a3c4c
- Temp kavriva_e1008_r4-initial-2.png SHA256 9aabb2db6b8364dd8622bd029dc405dd9d1389a36f01b53c4cb9c92985c94f26
- Temp kavriva_e1008_r4-mapping-held-0.png SHA256 1519fad20099f2742548f65613bf3363bdc066c502799774c23d7f7c6ef799b0
- Temp kavriva_e1008_r4-mapping-held-1.png SHA256 3920d328fab9f0edf26d517065541d4ca0f8a228dd56f3e2db778284b47d5c1b
- Temp kavriva_e1008_r4-mapping-held-2.png SHA256 f0e45e874b2b4f6c60d138d3660ee1e664051b7be6e6400d1859c5527251c00b
- Temp kavriva_e1008_r4-mapping-unknown-0.png SHA256 1519fad20099f2742548f65613bf3363bdc066c502799774c23d7f7c6ef799b0
- Temp kavriva_e1008_r4-mapping-unknown-1.png SHA256 e7136521f575dc744a0d9e4d82fa073c8909fe5b9e32b67b873c9cc372a04ca3
- Temp kavriva_e1008_r4-mapping-unknown-2.png SHA256 807677cd4fd42fed8dc2dab76e8493aeec346f2c27d3dc195935a841fe9dd76b
- Temp kavriva_e1008_r4-notice-unknown-0.png SHA256 3a9b957bdd0bec57025e4cd74b703285f16314feb7b2cb0b642ee6572dad42ce
- Temp kavriva_e1008_r4-notice-unknown-1.png SHA256 0a46b5865baf62bfbe42c59da7a6c8e3460a1271e2a0a43f4d5e2697b1c56b25
- Temp kavriva_e1008_r4-notice-unknown-2.png SHA256 9aabb2db6b8364dd8622bd029dc405dd9d1389a36f01b53c4cb9c92985c94f26
- Temp kavriva_e1008_r4-pending-check-0.png SHA256 1c1401dc12df9dd106626a2949092c30a84944c9303a034c92fe0928b31b52ae
- Temp kavriva_e1008_r4-pending-check-1.png SHA256 e7450d3c7c5aac3a156b4cac560701d1345b45f0c5f102402ff9c349ade5669f
- Temp kavriva_e1008_r4-pending-check-2.png SHA256 bb54216d7b19b8e9b14b9f838acaa35ba3cd07b238197dfa82d8c7937c382f42
- Temp kavriva_e1008_r4-provider-held-0.png SHA256 0520490358bd066b977b5f6982a029e6e0b1c076f4a0baccd9f9afedb7de4f64
- Temp kavriva_e1008_r4-provider-held-1.png SHA256 7d2060467fd7c625f9d08492fd7c07d50df778713eaaeaac9ec91a4935824168
- Temp kavriva_e1008_r4-provider-held-2.png SHA256 8a23baa5947b5b716414bc0d65c14a90d91871c3983c30ebe95766d85f33872c
- Temp kavriva_e1008_r4-provider-unknown-0.png SHA256 95c997d217037557a73038f5498be0a19719d84d4e6fe9effbcc8f66ad1179b0
- Temp kavriva_e1008_r4-provider-unknown-1.png SHA256 76904f87e05f388b0235de6deb1832939c4b44209b42d91e4875327599b068b9
- Temp kavriva_e1008_r4-provider-unknown-2.png SHA256 73ecfcce54143d8ceddecbc640538db6f59987a2c33ac4486d3e1c1f1b1a1806
- Temp kavriva_e1008_r4-ready-0.png SHA256 dcd55271ca0e1595b413ea3d2f2f2487caab1dd043e30592d522b438bc000c9f
- Temp kavriva_e1008_r4-ready-1.png SHA256 d9214c5ffeebaedfbc10d7048f24963950eb647713cbdb972f5993e9eaf44fbd
- Temp kavriva_e1008_r4-ready-2.png SHA256 2ac9e1e8c31c3d2bd45d082e56578fc38b0bee25187b3bf1c69335a7aa92d28e
- Temp kavriva_e1008_r4-unmappable-0.png SHA256 83eb820cb6f8cd910fbfb8c4d4c75ba962c30d4982f9889921f9cd4f8a32bd2c
- Temp kavriva_e1008_r4-unmappable-1.png SHA256 e630fad9ec5335c63d60e01e9127738e63852d03dd951e51a0140335bb7f9e36
- Temp kavriva_e1008_r4-unmappable-2.png SHA256 a33ce95a4f039b65c5a4d4537118f56c36437efae601f1619d5e989aec6cc98c

## Bağımsız ilk okuma — değiştirilmemiş rapor

Kavriva E1008 — bağımsız ilk okuma

Kapsam ve yöntem
Önceden hazırlanmış dokuz soruyu ve belirtilen 31 gerçek ekran görüntüsünün tamamını inceledim. Yanıtlar yalnızca sorulara ve görüntülerde okunabilen metinlere dayanır.

Önemli sınır
Bu, bir yapay zekânın statik ekran görüntülerini okumasıdır. Bir insanın ekranı aynı şekilde anlayabildiğini, gerçek bir telefonda kullanılabilirliği veya motosikletin fiziksel olarak güvenli/uygun olduğunu kanıtlamaz. Ekrandaki örnek doğrulama durumları da gerçek fiziksel kanıt sayılmaz.

1. Rehber değiştiğinde eski kaldığın adımdan devam edebilir misin?
Hayır. Ekran, eski devam onayının yeni rehberde geçerli olmadığını ve güncel fiziksel durum yeni rehberle eşlenmeden eski devam yolunun kapalı kaldığını söylüyor. Görüntüde son kesin adım 3/9, kayıtlı eski adım 4/9 olarak ayrılmış; yeni rehberde doğrulanan adım açılana kadar eski kayıt veya tahmini adım kullanılmıyor.

Belirsizlik: Bu konuda belirgin bir belirsizlik yok; devamın kapalı olduğu açıkça yazıyor.

2. Bu değişikliğin neden önemli olduğunu nereden anlarsın?
Ekran “Örnek rehberin sürümü değişti; eski adımın geçerliliği yeniden değerlendirilmeli” diyor. Önceki devam kararı yeni sürümü kapsamıyor. Güvenlik ve hazırlık koşulları yeniden kontrol edilmeli; değişiklik ve fiziksel durum yeni rehbere göre doğrulanmalı. Eski onay, güncel durumun veya yeni rehberin koşullarının kanıtı değil.

Belirsizlik: Ekran bunun yeni sürüm ve güvenlik kontrolleri nedeniyle önemli olduğunu doğrudan açıklıyor. Gerçek motosiklette hangi fiziksel tehlikenin bulunduğunu ise ekran görüntüleri göstermiyor.

3. Kaydedilmiş eski adım ve notlar şu anki fiziksel durumu doğrular mı?
Hayır. Ekran bunların önceki bağlamı, sökülen parçaların ve notların nerede kaldığını hatırlamak için saklandığını; güncel fiziksel kanıt, yeni adım veya devam izni olmadığını söylüyor. Geçmiş notlar eksiksiz ya da tamamlanmış da sayılmıyor.

Belirsizlik: Yok. Geçmiş bölümü, eski ölçümün gerçek teknik değer olmadığını ve eski güvenlik onayının güncel kanıt sayılamayacağını ayrıca belirtiyor.

4. Devam etmeden önce motosikletin hangi bilgisi yeniden ele alınmalı?
En az iki ayrı şey: motosikletin şu anki fiziksel durumu yeni rehbere göre yeniden eşlenmeli ve motosikletin yeni rehbere uygunluğu olumlu olarak doğrulanmalı. Ekranda bunlar ayrı satırlar halinde gösteriliyor; hazırlık koşulları ve zorunlu kontrol de devam kapıları arasında.

Belirsizlik: Soru tek bir bilgi soruyor gibi görünse de ekran tek bir öğe göstermiyor. Fiziksel durum ile rehberin bu motosiklete uygunluğu ayrı doğrulamalar; birinin geçmesi diğerinin geçtiği anlamına gelmiyor.

5. Fotoğraf veya not eklemek eşlemenin doğrulandığı anlamına gelir mi?
Hayır. Ekran önce güncel fiziksel durumun ele alınmasını istiyor ve fotoğraf/not eklemenin tek başına eşlemeyi veya kritik kontrolü doğrulayamayacağını açıkça söylüyor. Fotoğraf/not ekleme yolu kanıt kapısını kendi başına geçirmiyor.

Belirsizlik: Yok; bu sınır ekranda açıkça yazıyor.

6. “Mevcut durumu yeniden eşle” düğmesi kendi başına devam izni veya tamamlandı sonucu üretir mi?
Hayır. Düğme yalnızca güncel durumun yeni rehberle eşlenmesini ister; istek tek başına eşleme sonucu, devam izni veya tamamlanma değildir. Bir eşleme ve gerekli kontroller olumlu doğrulansa bile “Yeni rehberdeki doğrulanmış adımı aç” yalnızca kaynağın işaret ettiği yeni rehber adımına geçer; adımı uygulamaz ve işi tamamlamaz.

Belirsizlik / sonraki eylem: Eşleme düğmesinin amacı ve sınırı açık. Görüntüler eşleme isteğinin nasıl sonuçlanacağını garanti etmiyor. “Bu kontrolü yeniden iste” de kontrolü talep eder; tamamlandı veya olumlu sonucu değil.

7. Güncel eşleme veya zorunlu güvenlik kontrolü eksikse ilerlenebilir mi?
Hayır. Normal devam, güncel eşleme ve gerekli kontroller olumlu doğrulanana kadar kapalı. Zorunlu kontrol için ekran “Henüz doğrulanmadı” diyorsa eski onay veya fotoğraf/not yeterli değil. Boş kontrol listesi de bütün koşullar tamamlandı demek değil. Eksik/başarısız eşlemede normal devam durur; ekrandaki ilgili sonraki yol yeniden eşleme/kontrol istemek veya güvenli durdurma bilgisini açmaktır.

Belirsizlik: Yok; ekranda “Koşul eksik veya belirsizse normal devam durur” deniyor. Hangi koşulların eksik olduğu örnek durumlara göre değişiyor; bunu her durumda ekrandaki ayrı durum satırları belirtiyor.

8. Ekran sökülen parçayı otomatik geri takmayı veya bir sonraki adımı tahmin etmeyi söylüyor mu?
Hayır. Ekran bir sonraki adımı tahmin etmeyeceğini, eski işi otomatik tersine çevirmeyeceğini ve sökülen parçaları geri takma talimatı üretmeyeceğini açıkça söylüyor. Eşleme başarılıysa yalnızca kaynağın eşlediği yeni rehber adımını açabilir; fiziksel işi yapmaz.

Belirsizlik: Yok. Ekran, parçaların nasıl geri takılacağına dair fiziksel talimat vermiyor.

9. Eşleme yapılamazsa güvenli durdurma bilgisine erişim ücret veya devam onayı gerektirir mi?
Ekrana göre hayır. Eşleme yapılamasa da güvenli durdurma bilgisi ücret veya devam onayı gerektirmeden açılabilir. Bu yol güvenli durdurma bilgisine erişim sağlar; işi güvenli biçimde durdurduğunu veya tamamlandığını kaydetmez.

Belirsizlik / sonraki eylem: Ekran erişimin ücret ve devam onayı gerektirmediğini açıkça söylüyor. Açılan güvenli durdurma içeriğinin ayrıntıları bu görüntülerde görünmüyor.

Ekranlardaki kapalı durumlar ve eylem anlamları
- Güncel fiziksel durum, yeni rehbere eşleme, motosiklete uygunluk, hazırlık koşulları ve zorunlu kontrol ayrı koşullardır. Ekranlardan bazılarında bunlardan biri veya birkaçı henüz doğrulanmamış; normal devam bu durumda kapalı.
- Tüm gerekli satırlar olumlu gösterilen örnekte bile ekran başarı garantisi vermiyor. Kaynak kararı yeni adım yolunu açıyor; işin uygulanması ve sonucu ayrı.
- “Güncel fotoğraf veya not ekleme yolunu aç” ekleme akışını açar; doğrulama yapmaz.
- “Mevcut durumu yeniden eşle” eşleme isteği gönderir; sonuç veya izin vermez.
- “Bu kontrolü yeniden iste” kontrol talebidir; olumlu sonuç değildir.
- “Yeni rehberdeki doğrulanmış adımı aç” kaynakta belirtilen adımı açar; adımı uygulamaz veya işi tamamlamaz.
- “Güvenli şekilde durdurma yolunu aç” güvenli durdurma bilgisini açar; durdurmanın yapıldığını ya da işin tamamlandığını kaydetmez.

İlk okuyucu yalnız 31 gerçek R4 görüntüsü ve koddan önce sabit dokuz soruyla çalıştı. Kod/plan/anahtar verilmedi. Yöntem ve bütün yanıtların yeterliliğini bütün görev incelemecisi ayrıca değerlendirir. AI okuması insan/telefon veya model çalışma zamanı tasdiki değildir. Bütün bağımsız kaynak hükmü, aynı kaynak CI/T3, ayrı son metadata hükmü ve son CI henüz bekleniyor.


`vault/PROFILES/guide-change-remap-render.md`; `vault/PACKS/P-E1-008.md`; `vault/REGISTRY/T-E1-008.md`; `vault/EVIDENCE/E-DEV-106.md`.

## Kayıt bağlantısı denetimi

Kayıtlar oluşturulduktan sonraki ilk run_all, T-E1-008 görevinin HELD açıklamasında dosya bağlantısı bulunmadığı için check_links hatası verdi; diğer 11 kontrol ve 42 test geçti. Göreve paket/profil/kanıt bağlantıları eklendi; ilk başarısız log kavriva_e1008_source_run_all.txt adıyla korunur. Yeniden denetim ayrı loga yazılır.

Gerçek yeniden denetim: kavriva_e1008_source_run_all_fixed.txt, bütün 12 kontrol ve 42 test PASS (0.688s), worst exit 0. Gerçek plan köküyle strict check_links ayrıca PASS. Görev REVIEW; bu sonuç bağımsız kaynak kabulü veya CI sonucu değildir.
