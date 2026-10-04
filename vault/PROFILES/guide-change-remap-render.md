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
