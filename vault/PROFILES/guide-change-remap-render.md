---
record_id: V-E1-REMAP-001
version: 1
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
depends_on: [M-E1-001, M-E3-001, M-E5-001, M-E4-001, I-E10-PATHS-001, V-CI-001, V-E1-RESUME-001]
used_by: [P-E1-008, T-E1-008, E-DEV-106]
evidence: [E-DEV-106]
supersedes: []
status: REVIEW
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


`vault/PROFILES/guide-change-remap-render.md`; `vault/PACKS/P-E1-008.md`; `vault/REGISTRY/T-E1-008.md`; `vault/EVIDENCE/E-DEV-106.md`.

## İkinci kaynak: bağımsız P2 bulgusunun onarımı

Önceki 8500b0597324411ab729302c1273dafb993ae04b kaynağı CHANGES_REQUESTED aldı; raporu ve ilk gerçek CI makbuzu yukarıda tarihsel kayıt olarak korunur. 141 yerel / 140 CI / 31 R4 görüntüsü önceki kaynağa aittir. Yeni kod/test kaynağı b1d93e0cbd052e4a9456df4d77aad5132dec962d; kod LF SHA256 c29fe159a30657051f6aa4f735ec7e3b594e66ccac49840a14b0f9c6dafd2105, test LF SHA256 3856bffb29015f2d6d9bdae90b9a1491257bb592f0af2c8da356d20105084bff. Dokuz dondurulmuş soru değişmedi: c30d01059c04b1d993a46f3c8e567711052529c0b0645762e61e9e770d3ab6cd.

GuideRemapRequestError artık tam güncel kapsamı, değişim kimliğini, istek türünü ve mesajını zorunlu taşır. Beş istek türü ayrı etiketlenir. Yabancı/eski hata özel mesajı gösterilmez ve normal adım kapalı kalır. Hata, son isteğin doğrulanmadığını anlatır; mevcut olumlu kaynak değerlendirmesi iptal edilmiş veya fiziksel işlem gerçekleşmemiş diye sunulmaz. Mevcut referans tipinin gerçek adı RemapReference'dır; önceki gövdedeki GuideRemapReference adı bir dokümantasyon yazım hatasıdır.

Gerçek eski kaynakta aynı regresyon beklentisi 0 PASS / 1 FAIL verdi: ayrı istek-sonucu başlığı bulunmadı. Sonraki fiziksel sonuç metni beklentisine ulaşılmadığı için o beklentinin başarısız olduğu iddia edilmez. Eski kod LF 0d479c92d1327ccca0ab70f9883237c838bee96895d26073be77ec2081b3b633; başarısız test scaffold ham SHA256 6d96fbcbab85397922b019724a2cd570c138837a22efd3954d1bf70ff351384b. Onarımdan sonra aynı beklenti 1 PASS oldu. Ek test beş istek türünü, yedi yabancı kapsam alanını ve yabancı değişim kimliğini denetler; boş alan reddi mevcut kurucu testine eklendi. Dinamik odak, boyanmış kontrast ve duyarlı düzen testleri hata durumlarıyla genişletildi; eşleme odağı korunur, yanlış adım isteği üretilmez.

Son gerçek R6: strict formatter 20 dosya / 0 değişiklik; analyze 0 sorun; bütün 143 yerel test başarılı. Önceki 122 + yeni 20 = normal CI 142; yalnız yerel PNG yakalama ile 143. On bir durum 320/390/768 genişlik ve 1/2/3 yazı ölçeğinde test edildi. 38 native 390×844 görüntü sonradan düzenlenmedi. Eski 31 görüntü R4 ile byte eşit; root bunları önceki incelemede ve yedi yeni hata/bekleme görüntüsünü son R6 incelemesinde gerçekten açtı. Önceki R5 yakalaması ayrı tutulur, son kabul görüntüsü değildir.

Hata halinde yeniden eşleme baskın, doğrulanmış yeni adım kapalı; bekleme halinde yeniden eşleme de kapalıdır. Güvenli durdurma bilgisi açık kalır. Sağlayıcı değerlendirmesinin olumlu olması son isteğin başarıyla tamamlandığı anlamına gelmez. Gerçek kaynak üreticileri, fiziksel sonuç, kimlik/yetki, medya/kalıcılık, telefon/yardımcı teknoloji, nihai marka/token/font/altbar ve yayın HELD sınırları değişmedi. Yeni CI ve bütün bağımsız yeniden inceleme henüz beklenir. Kabul sayısı 94 / kalan 112 / 206 değişmedi.

## İkinci bağımsız ilk okuma — değiştirilmemiş rapor

E1008 R2 — Bağımsız ilk ekran okuyucu raporu

Yöntem ve sınır
- Manifestteki 38 PNG'nin tamamını view_image ile açıp inceledim. Aynı ekranın kaydırılmış parçalarını birlikte değerlendirdim.
- Yalnızca görseller ve dondurulmuş dokuz soru kullanıldı.
- Bu, bir AI okuyucunun ekran görüntülerinden yaptığı okumadır; insan incelemesi veya gerçek telefonda/cihazda kullanılabilirlik testi değildir. Ekran görüntülerinden tıklamaların gerçek davranışını doğrulayamam.

Dokuz soruya yanıt

1. Rehber değiştiğinde eski kaldığım adımdan devam edebilir miyim?
Hayır. Eski devam onayı yeni rehber için geçerli değil. Güncel fiziksel durumun yeni rehberle eşlenmesi ve gerekli güncel kontrollerin olumlu doğrulanması gerekiyor. Kayıtlı eski adım veya tahmini adım kullanılamıyor.

2. Değişikliğin neden önemli olduğunu nereden anlarım?
Rehber sürümü değişmiş; önceki devam kararı yeni sürümü kapsamıyor. Yeni rehberdeki güvenlik ve hazırlık koşulları yeniden kontrol edilmeli. Bazı durum ekranlarında değişikliğin/etkisinin henüz doğrulanmadığı da açıkça yazıyor.

3. Kaydedilmiş eski adım ve notlar mevcut fiziksel durumu doğrular mı?
Hayır. Eski adım, sökülmüş parçalar ve notlar nerede kalındığını hatırlatmak için saklanıyor. Ekran bunların güncel fiziksel kanıt, teknik talimat veya devam izni olmadığını söylüyor. Eksik bilgi de tamamlanmış sayılmıyor.

4. Devam etmeden önce motosikletin hangi bilgisi yeniden ele alınmalı?
Motosikletin şu anki gerçek fiziksel durumu: hangi parçaların söküldüğü/gevşetildiği ve güncel ölçüm gibi mevcut bilgiler. Bu durum yeni rehberle eşlenmeli; motosiklet uyumu, hazırlık koşulları ve zorunlu güvenlik kontrolü de yeniden doğrulanmalı.

5. Fotoğraf veya not eklemek eşlemenin doğrulandığı anlamına gelir mi?
Hayır. Önce güncel fiziksel durum belirlenmeli. Fotoğraf veya not eklemek tek başına ne eşlemeyi ne de kritik/zorunlu kontrolü doğruluyor.

6. “Mevcut durumu yeniden eşle” düğmesi tek başına devam izni veya tamamlandı sonucu üretir mi?
Hayır. Düğme eşleme isteği başlatır; isteğin sonucu ayrıca doğrulanmalıdır. İstek düğmesine basmak eşlemenin tamamlandığını, devam iznini veya fiziksel işin tamamlandığını göstermez. Doğrulanmış yeni adımı açma eylemi de yalnızca o adımı gösterir; işi uygulamaz veya tamamlamaz.

7. Güncel eşleme veya zorunlu güvenlik kontrolü eksikse ilerlenebilir mi?
Hayır. Görüntülerde normal devam, güncel eşleme ve gerekli kontroller olumlu doğrulanana kadar kapalı. Eksik, belirsiz veya olumsuz koşul normal devamı durduruyor.

8. Ekran sökülen parçayı otomatik geri takmayı veya sonraki adımı tahmin etmeyi söylüyor mu?
Hayır. Ekran sonraki adımı tahmin etmediğini, önceki işi otomatik tersine çevirmediğini ve sökülen parçaları geri takma talimatı vermediğini açıkça belirtiyor.

9. Eşleme yapılamazsa güvenli durdurma bilgisine erişim ücret veya devam onayı gerektiriyor mu?
Hayır. Güvenli durdurma bilgisine erişim ücret veya devam onayı gerektirmiyor. Ancak bu yolu açmanın işi gerçekten güvenli biçimde durdurduğunu ya da tamamladığını kaydetmediği de yazıyor.

Gözlem ve olası karışıklıklar

- Hata ekranlarında “Kaynağın güncel değerlendirmesi” ile “Son isteğin sonucu” ayrı başlıklar altında sunuluyor. Kaynak değerlendirmesindeki olumlu maddelerin, son eşleme isteğinin sonucu doğrulanamadığı için normal devam izni vermediği açıkça belirtilmiş. Hata, kaynağın değerlendirmesinin iptal edildiği veya fiziksel işin başarılı olduğu anlamına gelmiyor. Bu ayrım genel olarak anlaşılır.
- Bekleme/hata görünümünde “İstek işleniyor; yeni gözlem, eşleme veya devam isteği kapalı” deniyor. Aynı görünümde “Mevcut durumu yeniden eşle” etiketi de var; ekrandan bu öğenin devre dışı mı yoksa kullanılabilir mi olduğu kesin seçilmiyor. Yeni isteklerin engellendiği metinle açık, fakat eylem öğesinin görsel durumu belirsiz.
- “Mevcut fiziksel durum: bu değişim için olumlu olarak doğrulandı” ifadesi, eşleme bekletilmiş veya yapılamamış ekranlarda da görünüyor. Sonraki açıklama yeni rehberle eşlemenin henüz olumlu olmadığını ve devamın kapalı kaldığını söylüyor. Kaynak fiziksel durum değerlendirmesi ile yeni rehber adımına eşleme ayrı kavramlar gibi okunabiliyor; yine de “olumlu doğrulandı” ifadesi tek başına güvenli devam izni sanılabilir. Bu iki durum arasındaki ayrım daha açık adlandırılabilir.
- “Son kesin adım: 3/9” ve “Kayıtlı eski adım: 4/9” birlikte gösteriliyor; aralarındaki fark açıklanmıyor. Eski adımın devamda kullanılamayacağı birkaç kez söylendiğinden sonuç yine net, ancak bu iki numaranın neden farklı olduğu okuyucuyu düşündürebilir.
- Eşleme yapılamayan ekranda başlık “Mevcut durum yeni rehbere eşlenemedi”; açıklama normal devamın durduğunu ve güvenli durdurma bilgisine erişilebildiğini söylüyor. Bu, motosikletin fiziksel olarak kesinlikle güvensiz olduğu iddiası kurmuyor; yalnızca yeni rehberde güvenli bir devam adımı eşlenemediğini aktarıyor. Bu ayrım ekran metninden çıkarılabiliyor.



İlk okuyucu yalnız 38 R6 PNG ve aynı kod öncesi dokuz soruyu gördü. Kod/plan/cevap anahtarı/önceki rapor verilmedi. AI okuması insan veya gerçek cihaz kanıtı değildir. Ham rapor SHA256 973c68e8f0dccfbc67a28cb4aebefc88fc1b99b26590ef6f6d1c39e82219cf07. Bütün görev incelemecisi cevapların yeterliliğini ayrıca değerlendirir.

## R6 görüntü kimlikleri

- Temp kavriva_e1008_r6-busy-error-0.png SHA256 d2fe77c1c4461e64ec782f57b188d92ef2abea359b3287508bd6fac1f98d0f9f
- Temp kavriva_e1008_r6-busy-error-1.png SHA256 39de1562a732c1a59a85ef66589217d28746fee521c837257f0e63895f163792
- Temp kavriva_e1008_r6-busy-error-2.png SHA256 ee35e5781019168f5fbd2177a2c978b4ea655bc2cf4944543d6d7c3cfe7cb6b7
- Temp kavriva_e1008_r6-busy-error-3.png SHA256 e50483a915300a36970aa92ed4ab072d03b781239e5b5eb64a09e950495011aa
- Temp kavriva_e1008_r6-history-0.png SHA256 b50cb43109d711bd225bb01e9276cb1502b263a080de13516626b320272df521
- Temp kavriva_e1008_r6-history-1.png SHA256 18a83da82797309c62089a18bc66f2651067025501eec4f58c6de0520e3a3c4c
- Temp kavriva_e1008_r6-history-2.png SHA256 02c598b369a8abfa981ff03680420f7651b962ff352ba4e625c82c94224d2c60
- Temp kavriva_e1008_r6-history-3.png SHA256 feb845b9254420ebfc58fbcfbe146e7e7cde0d622d9ccce18ece63b541e952e2
- Temp kavriva_e1008_r6-initial-0.png SHA256 b50cb43109d711bd225bb01e9276cb1502b263a080de13516626b320272df521
- Temp kavriva_e1008_r6-initial-1.png SHA256 18a83da82797309c62089a18bc66f2651067025501eec4f58c6de0520e3a3c4c
- Temp kavriva_e1008_r6-initial-2.png SHA256 9aabb2db6b8364dd8622bd029dc405dd9d1389a36f01b53c4cb9c92985c94f26
- Temp kavriva_e1008_r6-mapping-held-0.png SHA256 1519fad20099f2742548f65613bf3363bdc066c502799774c23d7f7c6ef799b0
- Temp kavriva_e1008_r6-mapping-held-1.png SHA256 3920d328fab9f0edf26d517065541d4ca0f8a228dd56f3e2db778284b47d5c1b
- Temp kavriva_e1008_r6-mapping-held-2.png SHA256 f0e45e874b2b4f6c60d138d3660ee1e664051b7be6e6400d1859c5527251c00b
- Temp kavriva_e1008_r6-mapping-unknown-0.png SHA256 1519fad20099f2742548f65613bf3363bdc066c502799774c23d7f7c6ef799b0
- Temp kavriva_e1008_r6-mapping-unknown-1.png SHA256 e7136521f575dc744a0d9e4d82fa073c8909fe5b9e32b67b873c9cc372a04ca3
- Temp kavriva_e1008_r6-mapping-unknown-2.png SHA256 807677cd4fd42fed8dc2dab76e8493aeec346f2c27d3dc195935a841fe9dd76b
- Temp kavriva_e1008_r6-notice-unknown-0.png SHA256 3a9b957bdd0bec57025e4cd74b703285f16314feb7b2cb0b642ee6572dad42ce
- Temp kavriva_e1008_r6-notice-unknown-1.png SHA256 0a46b5865baf62bfbe42c59da7a6c8e3460a1271e2a0a43f4d5e2697b1c56b25
- Temp kavriva_e1008_r6-notice-unknown-2.png SHA256 9aabb2db6b8364dd8622bd029dc405dd9d1389a36f01b53c4cb9c92985c94f26
- Temp kavriva_e1008_r6-pending-check-0.png SHA256 1c1401dc12df9dd106626a2949092c30a84944c9303a034c92fe0928b31b52ae
- Temp kavriva_e1008_r6-pending-check-1.png SHA256 e7450d3c7c5aac3a156b4cac560701d1345b45f0c5f102402ff9c349ade5669f
- Temp kavriva_e1008_r6-pending-check-2.png SHA256 bb54216d7b19b8e9b14b9f838acaa35ba3cd07b238197dfa82d8c7937c382f42
- Temp kavriva_e1008_r6-provider-held-0.png SHA256 0520490358bd066b977b5f6982a029e6e0b1c076f4a0baccd9f9afedb7de4f64
- Temp kavriva_e1008_r6-provider-held-1.png SHA256 7d2060467fd7c625f9d08492fd7c07d50df778713eaaeaac9ec91a4935824168
- Temp kavriva_e1008_r6-provider-held-2.png SHA256 8a23baa5947b5b716414bc0d65c14a90d91871c3983c30ebe95766d85f33872c
- Temp kavriva_e1008_r6-provider-unknown-0.png SHA256 95c997d217037557a73038f5498be0a19719d84d4e6fe9effbcc8f66ad1179b0
- Temp kavriva_e1008_r6-provider-unknown-1.png SHA256 76904f87e05f388b0235de6deb1832939c4b44209b42d91e4875327599b068b9
- Temp kavriva_e1008_r6-provider-unknown-2.png SHA256 73ecfcce54143d8ceddecbc640538db6f59987a2c33ac4486d3e1c1f1b1a1806
- Temp kavriva_e1008_r6-ready-0.png SHA256 dcd55271ca0e1595b413ea3d2f2f2487caab1dd043e30592d522b438bc000c9f
- Temp kavriva_e1008_r6-ready-1.png SHA256 d9214c5ffeebaedfbc10d7048f24963950eb647713cbdb972f5993e9eaf44fbd
- Temp kavriva_e1008_r6-ready-2.png SHA256 2ac9e1e8c31c3d2bd45d082e56578fc38b0bee25187b3bf1c69335a7aa92d28e
- Temp kavriva_e1008_r6-request-error-0.png SHA256 d2fe77c1c4461e64ec782f57b188d92ef2abea359b3287508bd6fac1f98d0f9f
- Temp kavriva_e1008_r6-request-error-1.png SHA256 e12d34bc9e5522db4cc6a21f42116d4e39b7c8de17feef13a273d7245995285a
- Temp kavriva_e1008_r6-request-error-2.png SHA256 6e16eb9a678da8948be972e3a0406d96b4c90f7054540b99926c5f6a88851575
- Temp kavriva_e1008_r6-unmappable-0.png SHA256 83eb820cb6f8cd910fbfb8c4d4c75ba962c30d4982f9889921f9cd4f8a32bd2c
- Temp kavriva_e1008_r6-unmappable-1.png SHA256 e630fad9ec5335c63d60e01e9127738e63852d03dd951e51a0140335bb7f9e36
- Temp kavriva_e1008_r6-unmappable-2.png SHA256 a33ce95a4f039b65c5a4d4537118f56c36437efae601f1619d5e989aec6cc98c
