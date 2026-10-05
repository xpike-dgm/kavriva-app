---
record_id: V-E1-DIAG-001
version: 1
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
depends_on: [M-E1-001, M-E9-001, M-E3-001, M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E1-009, T-E1-009, E-DEV-107]
evidence: [E-DEV-107]
supersedes: []
status: REVIEW
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


`vault/PROFILES/diagnosis-render.md`; `vault/PACKS/P-E1-009.md`; `vault/REGISTRY/T-E1-009.md`; `vault/EVIDENCE/E-DEV-107.md`.

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

## R2 bağımsız ret ve gerçek R2 CI — tarihsel, değiştirilmemiş kayıt

R2 yalnız kaynak3aa5112cc50785075b7889bc79d9e21701ea879c için CHANGES_REQUESTED/P2: onaylı görsel hiyerarşi ve seçili/seçilmemiş durum yeterince uygulanmamış. Fotoğraf bulgusu R2 içinde kapatılmıştır. Sahip de aynı görsel eksikliği bildirdi. R2 onay değildir; R1 ret kaydı ve eski raporlar aynen korunur. R2 rapor RAW SHA25603851ba63f6e5fd8dbb592dbbee5534093ec47511be837add0b7f9300939c08d.

T-E1-009 / PR109 — R2 bağımsız tam görev incelemesi
Tarih: 2026-10-05

VERDICT: CHANGES_REQUESTED

İnceleme öznesi (değişmez Git commit’i): 3aa5112cc50785075b7889bc79d9e21701ea879c
Karşılaştırma tabanı: 303f0de2beb0ec4933bb6d4f1302085ba2092c3b
Plan pin’i: fa914f013fdcd032faed876689092da245989459
R2 pre-code onarım paketi: f4332a305c5d1573d5528deedbde05b540ef571c
PR: https://github.com/xpike-dgm/kavriva-app/pull/109 — R2 incelenirken OPEN/DRAFT, base ve head eşleşiyor

Bu, implementerden ayrı yürütülmüş R2 incelemesidir. R1 kararını veren aynı reviewer yeni kaynak ve kanıtlarla yeniden değerlendirdi; önceki ret kaydı korunuyor.

1. Bulgu

P2 — Onaylı görsel hiyerarşi ve seçim durumu uygulanmamış

Konum:
- modules/e01-app/internal/shell/lib/diagnosis.dart:491-499
- modules/e01-app/internal/shell/lib/diagnosis.dart:520-535
- modules/e01-app/internal/shell/lib/diagnosis.dart:640-681
- modules/e01-app/internal/shell/lib/diagnosis.dart:870-895

R2 ekranları doğru işlevsel içerik taşısa da tekrar eden metin ve aynı kare kenarlıklı eylem kutularından oluşan tek dikey akış halinde. heading() ana ekran başlığı ile alt bölüm başlıklarının hepsini 22 px semibold yapıyor. DiagnosisView.build tüm SCR-019..021 durumlarında aynı gövde, arka plan, 16 px metin ve tek Column düzenini kullanıyor. Fotoğraf yararlılığı, kaynak kontrolleri ve sonuç anlatımı da aynı çizgisel akışa ekleniyor.

G02’de seçili ve seçilmemiş seçeneklerin dekorasyonu aynıdır: seçim durumu sınırı, arka planı veya şeklini değiştirmiyor; yalnızca metnin başına “Seçili:” ekleniyor. checked Semantics doğru taşınıyor; ancak statik görüntüde referanstaki radyo/seçim biçimi veya görünür sınır/zemin farkı yok. Birincil eylem etkinse mavi dolgu alıyor; seçim durumu ise farklı görsel durum almıyor.

Bu, keyfi tasarım zevki ya da onaylanmamış renk/font/radius talebi değildir. Sabit plan pinindeki DIAGNOSIS_VISUAL_REFERENCES.md G01–G04’ü hiyerarşi, durum ayrımı, etkileşim anlamı ve görsel süreklilik için onaylı çalışma referansı olarak tanımlar. G03 için ana sonraki eylemin rehber önizlemesi, G02 için tek gözlem ve geçerli “Emin değilim” seçimi belirtilir. KAVRIVA_DIAGNOSIS_VISUALS_01_HANDOFF.md L bölümü birincil eylemin büyük ve görsel olarak ayırt edilir olmasını; seçili/seçilmemiş gözlem durumlarının şekil ve sınır, ayrıca renk kullanarak ayrılmasını ister. Production copy/icon/component/token/font, responsive küçük ekran standardı ve bottom bar ise non-final/HELD olarak kalır. R2’den istenen PNG’leri aynen kopyalamak değildir; referanstaki yapısal hiyerarşi ve durum anlamının gerçek ekranlara taşınmasıdır.

Kanıt: R2 manifestindeki 43 ayrı 390×844 PNG’nin her biri view_image ile açıldı; dört kanonik G01–G04 PNG’si de ayrıca açıldı. G02 kanonik görüntüsü ürün/akış bağlamından sonra belirgin büyük soru, seçim durumunu gösteren radyo seçenekleri, ayraçla ayrılan açıklama, baskın devam eylemi ve ikincil çıkış hiyerarşisi gösteriyor. R2 check/check-unsure görüntülerinde başlık ve metin alanları aynı düzeyde, seçim farkı yalnızca “Seçili:” önekiyle, satırlar aynı çizgi kutularıyla sunuluyor. G03 kanonik ekranındaki sonuç başlığı, kanıt kartları, ikincil olasılık/uyarı ve rehber eylemi hiyerarşisi R2’nin bilgiyi ardışık düz metin listesinde vermesiyle aynı değil. Bu rapor eksik görsel kanıt değil, var olan ekranların doğrudan görünüşü hakkında bulgudur. G03’teki illustrative mekanik görselin yokluğunu tek başına ret nedeni yapmıyorum; plan onu motosiklete özgü tanı kanıtı saymayı yasaklar.

Düzeltme ölçütü: Koddan önce izinli P-E1-009/T-E1-009 v3 kapsamı ve test sorusu sabitlensin. Mevcut doğru kaynak/güvenlik/otorite sınırlarını korurken ekranların referans hiyerarşisini ve eylem sırasını gerçek UI’ya taşıyın; seçili/seçilmemiş kontroller renk dışında da görsel olarak ayrılsın; ana eylem, açıklama ve güvenli çıkışın göreli önemi belirgin olsun. Nihai logo, typeface, spacing/radius/color token, gerçek medya, bottom bar veya backend seçimi bu bulgunun gereği değildir ve HELD kalır. Onarım sonrası native ekranlar, ilgili state’ler, cross-screen karşılaştırma/regresyon, yeni geçmişsiz ilk okuma ve aynı PR’da gerçek CI/T3 ile düzeltilmiş HEAD ayrı incelenmelidir.

İlk okuyucunun güvenlik dili hakkındaki iki notu: bloklayıcı olmayan, v3 copy/tasarımında ele alınması gereken açıklık tavsiyeleridir.
- diagnosis.dart:631-637’de normal akış kapalı düğmesinin adı “Gözlem sorusunu istemek için devam et — şu anda kapalı”. Düğme gerçekten disabled ve üstte hayır/belirsiz güvenlikte durma açıklaması var; okuyucu devam edilemeyeceğini doğru anladı. Yine de “devam et” sözünün güvensiz/emin olunmayan ekranda görünmesi gereksiz anlam yükü yaratıyor. Disabled eylemi pozitif bir devam hedefi gibi adlandırmamak daha anlaşılır olur.
- diagnosis.dart:761’de “Güvenlik ve hazırlık: Bu sonuç için olumlu doğrulandı” ifadesi, fiziksel güvenlik garantisi değildir açıklamasıyla birlikte doğru okunabilir; ilk okuyucu hızlı okumada sürüş izni gibi anlaşılabileceğini not etmiş. Yanıtı yanlış değildi ve R2 bunu sürüş izni olarak sunmuyor. “Bu sonuç için kaynak kontrolü olumlu” benzeri çerçeve anlamı daha hızlı netleştirebilir.
Bu iki not, ana P2 görsel bulgusundan ayrı yeni bir fiziksel güvenlik/otorite iddiası değildir.

R1 fotoğraf bulgusu — R2’de giderilmiş

Basit G02 gözleminde fotoğraf CTA’sı artık yok. DiagnosisPhotoRequest açık materyal yararlılık ve önceki kanıt durumunu, tam güncel scope, request, check ID/revision, reason ve nullable authority ile taşır. CTA yalnızca geçerli güncel check ve aynı check subject/request/scope için diagnosis-photo amacıyla olumlu güncel referans varken gösterilir. Missing, stale, foreign, held, unknown, yanlış amaç/konu veya usefulness=false durumda gerekçe ve CTA saklanır. Aynı fotoğrafın mevcut olduğu kaynakça bildirildiğinde tekrar istenmez; gözlem cevabı otomatik seçilmez veya onaylanmaz. Fotoğraf niyeti check ID/revision taşır. Olumlu fotoğraf gerekçesi busy/error/unknown/safety-disabled/handler-missing kapılarını aşmaz. R1’in gerçek G02 CTA yok RED testi onarım sonrasında GREEN oldu. R4’te taşınmış eski optional-copy beklentisi R5’te olumlu yararlı örneğe taşınmış; eski 142 test korunmuş.

2. Kaynak kimliği, diff ve sınırlar

- R2 commit’i 3aa5112cc50785075b7889bc79d9e21701ea879c iken checkout HEAD’i doğrulandı ve temizdi. Base→HEAD farkı tam 15 izinli path, 4.771 ekleme / 12 silme; git diff --check temiz. Scope JSON’daki 16 pinin tamamı base blob SHA-256’larıyla eşleşti; değişen path kümesi 15-path scope listesine tam eşit, dışarıda path yok.
- Plan fa914f013fdcd032faed876689092da245989459 pininden okundu. Koddan önce sabitlenen R2 P009/T009 v2 ve 14 soru fixture’ı onarım commit’i f4332a305c5d1573d5528deedbde05b540ef571c; repair code commit’i afb9e09a43d092fab9638dfdb4841e982bec62c8. R2 code LF SHA-256 53e4357ecc33fdb3e4383d22ee45e790f44004c2fb1b8518db3cf1b97ae3f44e; test 1934deae45085bda8788fa3e336891beeef6728c976e49521f2d3a565990568d; frozen 14 soru 544bd3b7d21de72e3886e298fadb70f55b61bcac33bcc9dbd346a5d490c47fa9.
- R1 raporu E-DEV-107 içinde ham SHA-256 dde4c9a1eb99114fae4212ae00f5d1fa59f47aa79f1c2a977e12c9f6d2505046 ile korunmuş. R1 kaynağındaki foto CTA’sı, gerçek RED→GREEN çıktısı ve R2 davranışı ayrı karşılaştırıldı.
- Eski raw v73, E-DEV-106 esas gövdesi ve governed path snapshot, M1/M9 eski sözleşme gövdeleri, önceki test/SDK/lock/YAML ve eski 142 test korunmuş. E3R1, E5-003, Supabase 47/57/59 veya RET97 kaynak değişikliği yok.
- R2 code/photo delta’sı ve test delta’sı incelendi. Önceki R1 kaynak gövdesi ile bu aynı base/plan bağlamındaki 15 path governance/CI metadata değişiklikleri önceki tam incelemeden devam edilerek yeniden değerlendirildi.
- PR109, R2 incelemesi sırasında OPEN/DRAFT, base 303f0de…, head 3aa5112…, reviewDecision boş ve merge state CLEAN idi. Daha sonraki 73e0143 pre-code UI refinement kapsamı bu R2 hükmünün dışındadır; sonrasındaki UI kodu yeni exact-head inceleme gerektirir.

3. Görsel inceleme ve E10 yedi kapısı

43 ayrı R2 PNG’nin her dosya yolu gerçek view_image çağrısıyla açıldı (43/43, her biri 390×844; kaydırılmış parçalar aynı tam ekranın devamı olarak okundu). Dört kanonik G01–G04 dosyası da ayrıca view_image ile açıldı. Önceki kabul edilmiş E1008 R6 remap ailesinden 38 görüntü, önceki R1 incelemede açılıp cross-screen bağlam olarak kullanılmıştı. R2 için 43 ayrı aday görüntüsü ve dört ayrı kanonik referans görüntüsü açılmıştır.

E10 DESIGN_GATE_CHECKLIST / DESIGN_REGRESSION_EVIDENCE_RULE karşılaştırması:
1) Full-screen: 24 UI state ve 43 native ekran görüntüsü açıldı. Güvenlik, held/foreign/unknown, tek soru ve fotoğraf state’leri mevcut. İçerik var; hiyerarşi/state görünümü onaylı aileyle eşleşmediğinden acceptance geçmez.
2) Cross-screen: G01–G04 ve önceki accepted remap ekranları karşılaştırıldı. Akış amacı doğru; başlık/seçim/eylem görsel hiyerarşisi ve sürekliliği aktarılamamış. Geçmez.
3) Cross-state: photo absent/useful/held/foreign/reuse; safety, busy, error, OUTCOME_UNKNOWN, supported/unresolved, proposal-only ve result-held incelendi. Fotoğraf doğru koşullanıyor, fail-closed kapılar korunuyor. Davranış geçer.
4) Responsive/Türkçe: 24 state × 320/390/768 genişlik × 1/2/3 text scale yerel test kapsamı; gerçek scroll ve en az 52 hedef ölçümü kayıtlı. Widget test kanıtı geçer, fiziksel telefon/OS kanıtı değildir.
5) Accessibility: Tab/Space/Enter, disabled Semantics/liveRegion, focus retention, painted contrast ve fatal pointer warning beklentileri korunup test edilmiş. Widget test kanıtı geçer; gerçek yardımcı teknoloji/ekran okuyucu cihaz deneyi değildir. Görsel seçim işareti eksiği ayrıca P2’de kalır; Semantics görünür durumu tamamlamaz.
6) Visual regression: R1 snapshot ve red identity korunmuş; önceki 142 ve yeni testler R5 çalışmasında geçti. G02 fotoğraf yok testi eski gerçek kaynakta fail, düzeltilmiş kaynakta pass. Test regresyonu geçer, ancak UI hiyerarşisi bulgusunu telafi etmez.
7) Canonical reference: G02 basit gözleminde varsayılan fotoğraf yok; maddi fayda kapısı doğru. G01–G04’ün işlevsel amacı korunuyor. Hiyerarşi ve gözlem seçim durumu açık handoff kuralını karşılamıyor; geçmez.

E10 belgeleri kaynak bazlı manuel karşılaştırmanın feature acceptance’ta gerekli olduğunu, yeşil yapısal CI/metadata’nın görüntü kabulü olmadığını söyler. Bu rapordaki bulgu eksik proof değil, incelenen gerçek ekranların görünüşüdür.

4. 14 soruluk geçmişsiz ilk okuma

Sabit 14 soru koddan önce verildi; ilk 12 R1 ile aynı, Q13 her gözlemde fotoğraf gerekip gerekmediğini ve görünüyorsa nedenini, Q14 önceki kanıtın yeniden istenip istenmediğini sınar. Değiştirilmemiş rapor C:/Users/Xpike/AppData/Local/Temp/kavriva_e1009_r2_first_reading.txt, ham SHA-256 bb6550ed6e1fe2aceeebaaaabb60f6f0a9294da58cf4f85ffaada1d25ba0dd6a. Okuyucu yalnız 14 soru ve 43 görseli görmüş; kod, plan, cevap anahtarı, önceki rapor ve dış yardım kullanmamış. Bu reviewer da 43 resmi ayrı ayrı açtı.

14 cevabın tamamı anlamca doğru ve görsellerle destekli. Q13’te fotoğrafın her gözlemde istenmediğini, yalnız kaynağın o gözlem için yararlı bulduğu durumda göründüğünü; Q14’te aynı gözlem için mevcut fotoğrafın tekrar istenmediğini anlıyor. Q2 güvenli değil/belirsiz seçimle tanıya devam edilemeyeceğini, Q6 fit/readiness’in ayrı oluşunu doğru yanıtlıyor. İki yorum notu yukarıda copy tavsiyesi olarak ele alındı; yanıtı yanlış yapmıyor. Bu statik AI ilk okuması CON-004 metin anlaşılabilirliği kanıtıdır; insan kullanıcı, fiziksel cihaz, ekran okuyucu, gerçek etkileşim veya model çalışma zamanı kanıtı değildir. Q1-14 R2 görsel hiyerarşisini doğrudan sınamıyor; Q15 daha sonraki v3 kapsamındadır ve R2’ye geriye dönük eklenemez.

5. Yerel ve gerçek GitHub CI/T3

Testler bu incelemede tekrar çalıştırılmadı; gerçek makbuzlar incelendi.
- R5 yerel: locked pub get PASS; strict formatter 22 dosya / 0 değişiklik; analyzer 0 sorun; bütün 177 test PASS. Bu 142 önceki + 34 yeni normal test + 1 yalnız yerel native capture’dır; normal CI beklentisi 176’dır.
- 34 yeni test; photo authority/scope/request/check/revision, 20 negatif usefulness ve authority hali, previous evidence reuse, G02 photo CTA yok RED→GREEN, doğru request payload, safety/busy/error/handler no fail-closed, 24 responsive state, keyboard/semantics/focus/contrast regresyonlarını kapsıyor.
- Gerçek aynı kaynak CI makbuzu C:/Users/Xpike/AppData/Local/Temp/kavriva_e1009_source_ci_receipt.md, kavriva_e1009_source_ci.json, kavriva_e1009_source_jobs.json ve source log dosyalarından incelendi. Exact 3aa HEAD’de pull_request run 37247128851 SUCCESS. t3-gate job 111567099665 5/5 adım; checks job 111567099803 7/7 adım SUCCESS. Makbuz 16/16 run başarısını doğruluyor: 8 push ve 8 pull-request suite olayı, gerçek labelled PR T3 dahil. PR E1 176 PASS, formatter22/0, analyzer0; E4 170 PASS; E9 9 PASS. R1 CI/T3 tarihsel kaydı R2 kabulü yerine kullanılmadı.
- CI/T3 bu kod ve kapıların çalıştığını kanıtlar; bağımsız görsel/CON-004 hükmünün yerine geçmez.

6. Task ve ürün sınırı / sonuç

R2 P-E1-009/T-E1-009 v2 kod öncesi sabitlenmişti; E-DEV-107 RECORDED ve task REVIEW kalmalı, DONE değildir. Ana dal sayımı 95 DONE / 111 remaining / 206; generated v74/99 yalnız candidate, gerçek ana kabul değil. Son altı metadata kapısı bu hükmün dışında ve tamamlanmış sayılmamalıdır.

Bu kaynak E1 renderer’ıdır. E9 proposal producer/model/provider, E3 authority veya T-E4-011b/T-E3-004 gerçek reconcile, API/DB/identity/media uploader, kalıcılık, fiziksel motosiklet durumu, tamir/güvenli sürüş, üretim cihaz/OS/assistive tech veya yayın kanıtı yoktur. OUTCOME_UNKNOWN aynı request ID ve original kind ile yalnız reconcile intent sunar; gerçek sonuç makbuzu veya replay kanıtı değildir. E3R1, E5-003, Supabase 47/57/59, RET97 ve final asset/font/token/navigation sınırları HELD.

Sonuç:
- R1 fotoğraf bulgusu: R2’de kapandı.
- R2 davranışsal kapsam ve gerçek CI/T3: geçer.
- R2 görsel family/hierarchy/state görünümü: P2 nedeniyle CHANGES_REQUESTED.
- E-DEV-107 RECORDED, T-E1-009 REVIEW; bağımsız kabul veya DONE değil.
- PR109, R2’de OPEN/DRAFT; merge/yayın değildir.
- Daha sonraki 73e0143 pre-code UI refinement ve devamındaki UI kodu bu R2 kararının dışında; yeni exact-head kanıt ve yeniden inceleme gerekir.

Reviewer bu rapor dışında kaynak, PR, Git ref veya CI üzerinde mutasyon yapmadı. Yalnızca R2 tam inceleme raporu Temp alanına yazıldı.




## Gerçek source CI makbuzu

Exact kaynak 3aa5112cc50785075b7889bc79d9e21701ea879c; 16/16 gerçek SUCCESS; push8/PR8 ve ilk label architecture varsa ayrı olay. Bütün job ve adımlar tek tek başarıyla doğrulandı.

PR t3-gate job111567099665: 5 başarılı adım/success.

PR checks job111567099803: 7 başarılı adım/success.
- pull_request architecture-checks: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247128851 — SUCCESS.
- pull_request e1-shell-widget-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247129001 — SUCCESS.
- pull_request e3-commit-authorization-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247128829 — SUCCESS.
- pull_request e3-live-auth-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247128861 — SUCCESS.
- pull_request e4-offline-composition-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247128824 — SUCCESS.
- pull_request e5-current-authority-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247128700 — SUCCESS.
- pull_request e6-release-policy-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247128803 — SUCCESS.
- pull_request e9-bounded-proposal-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247128785 — SUCCESS.
- push architecture-checks: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247125159 — SUCCESS.
- push e1-shell-widget-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247125140 — SUCCESS.
- push e3-commit-authorization-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247125145 — SUCCESS.
- push e3-live-auth-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247125163 — SUCCESS.
- push e4-offline-composition-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247125167 — SUCCESS.
- push e5-current-authority-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247125148 — SUCCESS.
- push e6-release-policy-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247125154 — SUCCESS.
- push e9-bounded-proposal-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37247125233 — SUCCESS.

PR E1 gerçek log: formatter22zero/analyze0issue/176PASS; E4 170PASS ve E9 9PASS. Push veya ilk opened PR T3 SKIPPED/0 adım bağımsız kabul değildir; yukarıdaki gerçek labelled PR T3 SUCCESS ayrı doğrulandı. CI bağımsız reviewer hükmünün yerine geçmez.


Bu 16/16 GitHub sonucu yalnız eski R2 kaynağına aittir; sonraki UI koduna aktarılmaz.

## Üçüncü kaynak — gerçek görsel hiyerarşi onarımı

Koddan önce v3 paket/görev/15 soru 73e0143e9f8f51befa6bd0a23817b0d9dbaf0ee8 commitinde sabitlendi; ilk14 soru korunmuştur. UI kod/test commitffe4f3bb0ddda3426091d93a080540f49c70d421; kod LF SHA256509029b6c039dab3c7d237b238f22e1d29b1ee7c6944289adc184c4e82c7362c; test LF SHA2565f8492e49bfbe1fc0dbb08aa710a140b47476dd8259a65333a17a4f3c5ec968b; soru LF SHA256dcc0d734362eb559e160eed90e7b0dbee1ba17439e76b9bc7e30a905f4c435d9. Yeni15 soru eylem hiyerarşisini sorar; eski ilk okuma yeni okunabilirlik kanıtının yerine geçirilmez.

G01..04 çalışma referanslarıyla karşılaştırma: ana soru/sonuç32pt, alt başlık22pt; üstte sakin güncel motosiklet bağlamı; 12 aralıkla ayrı seçenekler ve 14 radius. Radio seçimi metinle birlikte daire/nokta şekli, sınır ve zeminle ayrılır. Ana eylem mavi dolgu; destek/özet/çıkış daha sakin ve seçenek biçiminden ayrıdır. Bilinen, bilinmeyen ve alternatif bilgi ayrı hafif zeminlerde sunulur; dashboard veya yüzdelik güven eklenmez. İçerik geniş ekranlarda640 ile sınırlıdır. Uzun kaynak geçmişi isteğe bağlı açılır; güncel eksik/olumsuz altı boyutun her biri ilk sunumda görünür ve ilerleme kapısını değiştirmez. Yeni sonuç/kapsam/istek ayrıntıyı kapatır. Kaynak olumlu değerlendirmesi fiziksel güvenlik veya sürüş izni olarak sunulmaz. Hayır/emin değilim ekranının kapalı düğmesinde olumlu devam çağrısı kaldırılmıştır.

Yedi tasarım kapısı için rootun gerçek karşılaştırması: (1) görev hiyerarşisi G01 belirti ve güvenlik, G02 tek soru/radio, G03 sonuç ve bilinen-bilinmeyen, G04 ek gözlem yolu; (2) bu dört yüzeyde ortak başlık/bağlam/seçenek/ana-ikincil eylem ilişkisi; (3) seçili, kapalı, busy, hata, kaynak held/foreign ve bilinmeyen istek şekil/metin ve kapalı eylemlerle ayrılıyor; (4)25durum×320/390/768×1/2/3 gerçek kaydırma/52hedef testleri; (5) gerçek Tab/Space/Enter, disabled Semantics, odak/liveRegion/kontrast beklentileri korunmuştur; (6) önceki142test, R2fotoğraf tam bağlama/reuse, SDK-lock-YAML/hamv73/eski kanıt esasgövdesi korunur ve yeni kaynak ayrıntısı regresyonu eklendi; (7) gerçek referans hiyerarşisi ve durum ayrımı karşılaştırılmıştır, görüntüleri aynen kopyalama veya nihai üretim token/logo/font/routing/medya seçimi iddiası yoktur. Bu root değerlendirmesi bağımsız hüküm değildir.

Son UIr3: locked pubget başarılı; strict formatter22dosya/0değişiklik; analyze0sorun;178yerel testPASS. Önceki142+yeni35=177normalCI; yalnız yerel nativecapture1 ile178. Yeni anlamlı test: olumlu kaynak ayrıntısı açılır; eksik kritik boyut varsayılan sunumda saklanmaz, yeni sonuçta ayrıntı kapanır ve rehber önizlemesi kapalı kalır. Önceki güvenlik/otorite/fotoğraf/unknown/foreign/replay sınırları gevşetilmemiştir. İki ilk patch bağlam/parça doğrulama denemesi dosya değiştirmeden durdu; sonraki küçük patchler uygulanmıştır. UIr1/2 yerel başarılı ara denemeler ayrı Temp kayıtlarındadır; güncel tam UIr3 kanıtı178/55/25tir.

55 gerçek390×844PNG tüm25durumun kaydırılmış parçalarını içerir; görüntüler düzenlenmedi. Root55/55 dosyayı gerçekten view_image ile açtı; seçili radio ve primary/secondary, kapanmış yollar, kaynak ayrıntısı, aynı isteği kontrol etme, fotoğraf yararlılığı/yeniden istememe ve özel yabancı veri saklaması karşılaştırıldı. Bağımsız geçmişsiz ilk okuyucu yalnız55görüntü ve15koddanönce soru aldı; kod/plan/eski rapor/anahtar/dış yardım verilmedi. Yeni bütün görev incelemesi ve aynı kaynak gerçek GitHubCI/T3 henüz beklenmektedir. Ana kabul95/111/206 değişmez; DONE/üretim/cihaz/fiziksel/yayın hazır iddiası yoktur.

## Üçüncü geçmişsiz ilk okuma — değiştirilmemiş rapor

RAW SHA25611356428455e9e9ac35a907030c08e8df990d7b0d0181514388323b2566f33ac

Geçmişsiz bağımsız ilk okuyucu raporu

Açılan görsel sayısı: 55/55 PNG. Listedeki her PNG, ayrı ayrı view_image ile açıldı.
Soru kaynağı: diagnosis_reading_questions.json içindeki 15 soru.
Kapsam: Yalnız belirtilen ekran görüntülerinden okuma. Bu AI okuması insan tarafından kullanılabilirlik testi veya cihaz/gerçek motosiklet kanıtı değildir.

1. Teknik terim bilmem gerekir mi?
Hayır. Ekranda “Teknik terim kullanmadan anlatabilirsin.” yazıyor; sorunu kendi sözlerimle tarif edebilirim.

2. “Şu anda güvenli mi?” sorusuna “Hayır” veya “Emin değilim” dersem tanıya devam edebilir miyim?
Hayır. Ekran, hayır veya emin değilim yanıtında tanıya devam etmememi söylüyor; gözlem yolu kapalı oluyor. Güvenli kullanım ayrıca kanıtlanmış sayılmıyor.

3. Gözlem sorusuna “Emin değilim” demek geçerli bir yanıt mı?
Evet. “Emin değilim” seçenek olarak sunuluyor ve örnek yanıtta seçilebiliyor.

4. Bir gözlem seçmek kesin arızayı veya tamir sonucunu doğrular mı?
Hayır. Gözlem olasılıkları ayırmaya yardımcı olur; kesin arıza, yapılmış tamir veya güvenli sürüş kanıtı değildir.

5. Bulgular bir yönü desteklediğinde doğrudan tamire başlanabilir mi; sıradaki yol nedir?
Hayır. Sıradaki yol gözlem rehberinin önizlemesini açmak. Ekran, doğrudan tamire başlamamayı ve uygulamadan önce motosiklete uygunluk ile hazırlık kontrollerini yapmayı söylüyor.

6. Rehberin motosiklete uygunluğu ve hazırlık koşulları ayrıca kontrol edilir mi?
Evet. Rehber kullanılmadan önce motosiklete uygunluk ve hazırlık ayrıca kontrol edilmeli. Ekran ayrıca kaynak kontrollerinin sürüş izni vermediğini belirtiyor.

7. Sonuç netleşmediyse rastgele bir parça değiştirmek öneriliyor mu?
Hayır. Ekran açıkça “Sonuç netleşmediyse rastgele parça değiştirme.” diyor.

8. Bilinen ve bilinmeyen bilgiler nasıl ayrılıyor; önceki gözlemler kayboluyor mu?
Bilinenler, bilinmeyenler ve diğer olasılıklar ayrı başlıklarda gösteriliyor. Önceki gözlemin korunduğu yazıyor; örnekte bilinen gözlem “ses yalnız fren yaparken duyulmuş”, neden ise henüz bilinmiyor.

9. Fotoğraf eklemek zorunlu veya otomatik teşhis onayı mı?
Hayır. Fotoğraf yolu isteğe bağlı. Ekran, fotoğraf eklemenin otomatik teşhis, fiziksel doğrulama veya devam izni olmadığını söylüyor.

10. Sonucu henüz doğrulanmayan çevrimdışı istek başarılı sayılır mı veya yeniden fiziksel işlem başlatır mı?
Başarılı ya da başarısız sayılmaz. Ekrana göre işlem tekrar uygulanmaz; önce aynı isteğin sonucu kontrol edilir. Yeni yanıt ve normal ilerleme, sonuç doğrulanana kadar kapalıdır.

11. AI önerisi tek başına onay ya da güvenli kullanım izni verir mi?
Hayır. Öneri tek başına onay veya güvenli kullanım izni değildir; güncel kaynak değerlendirmesi gerekir.

12. Özet yolu işi tamir edilmiş veya tamamlanmış olarak kaydeder mi?
Hayır. Özet yolu bilgileri görmemi ister; motosikleti tamir edilmiş veya işi tamamlanmış olarak kaydetmez.

13. Her gözlem sorusunda fotoğraf isteniyor mu? Fotoğraf yolu görünüyorsa neden gösteriliyor?
Hayır, her gözlemde fotoğraf istenmiyor. Örnek fotoğraf açıklamasında, gözlemin hangi bölgeye ait olduğunu ayırt etmeye görsel bilginin yardımcı olabileceği belirtiliyor. Yol isteğe bağlı; fotoğraf eklemek zorunlu değil.

14. Bu gözlem için daha önce fotoğraf sağlanmışsa yeniden fotoğraf yüklemem isteniyor mu?
Hayır. Ekran, bu gözleme ait önceki fotoğrafın bulunduğunu belirtiyor ve yeniden fotoğraf istemiyor.

15. Sorun anlatma, gözlem ve sonuç ekranlarında ana iş ve sıradaki eylem hangisi? Destek ve çıkış yollarını bu eylemden ayırabiliyor muyum?
Evet, genel olarak ayırt edebiliyorum. Sorun anlatma ekranında sorunu teknik terimsiz anlatıp güvenliği belirtirim; güvenli yanıtıyla devam edersem sıradaki düğme gözlem sorusunu istemek içindir. “Hayır” veya “Emin değilim” yanıtında tanı/gözlem yolu kapalıdır. Gözlem ekranında tek soruyu yanıtlayıp gözlem yanıtını gönderirim. Sonuç ekranında sıradaki ana eylem duruma göre değişiyor: desteklenen bulguda rehber önizlemesini açmak, sonuç netleşmediyse ek gözlem yolu açmak, bekleyen istekte aynı isteğin sonucunu kontrol etmek. Güvenli destek ve tanıdan çıkış yolları bunlardan ayrı seçenekler olarak aşağıda yer alıyor. Ekranların bazı durumlarda eylemi “şu anda kapalı” gösterdiğini de not ediyorum.

Not: Bu rapor yalnızca ekran görüntülerinin AI tarafından okunmasına dayanır. İnsanların ekranları doğru anlayabildiğinin veya gerçek bir cihazın/motosikletin durumunun kanıtı değildir.


AI ilk okuması insan/telefon/yardımcı teknoloji veya model runtime tasdiki değildir. ÜretimE9/E3/E5/kimlik/API/veritabanı/kalıcılık/medya/fiziksel/cihaz/yayın ve T-E4-011b/T-E3-004 gerçek uzlaştırma bağları HELD kalır. Sonraki gerçekCI ve bütün bağımsız rapor ayrıca kaydedilmeden bu kanıt kabul değildir.

## UIr3 görüntü kimlikleri

- Temp kavriva_e1009_ui_r3-busy-supported-0.png RAW SHA256 134831a63437f6be3aa0a169830a023dedcb7dc8bce42a73b599200dd6ad96f1 /74039byte/390×844
- Temp kavriva_e1009_ui_r3-busy-supported-1.png RAW SHA256 8f61411e00aef102908ebe695e9c0827aac0670e9f26af84a5480449972645b6 /69234byte/390×844
- Temp kavriva_e1009_ui_r3-busy-supported-2.png RAW SHA256 94b2f778ea15470bd61bc4b3fbfe48ed0be3485901ba601be1d7ad98e852761f /70944byte/390×844
- Temp kavriva_e1009_ui_r3-check-0.png RAW SHA256 d3b08485c07fa9dcf1fd3620dfd861da1aca06e76b464cc5bcaee08c21fec5b2 /66872byte/390×844
- Temp kavriva_e1009_ui_r3-check-1.png RAW SHA256 1f18488abef19400c2032d357559f55af9778e3445c458d1255aed89ab5baab5 /66870byte/390×844
- Temp kavriva_e1009_ui_r3-check-foreign-0.png RAW SHA256 56f19d8dcd1893ebd82a37e96a73f47bb9f660a229a84198c3b9fc31393ba990 /38605byte/390×844
- Temp kavriva_e1009_ui_r3-check-held-0.png RAW SHA256 56f19d8dcd1893ebd82a37e96a73f47bb9f660a229a84198c3b9fc31393ba990 /38605byte/390×844
- Temp kavriva_e1009_ui_r3-check-unsure-0.png RAW SHA256 432fe3cdefcd4a396b8928d48ddb20aaf020e7243167f7d96d57de616e7327a1 /66447byte/390×844
- Temp kavriva_e1009_ui_r3-check-unsure-1.png RAW SHA256 769847fb2ecd65dcc657f0b1b12ec20b17cff91c21e6cddd9a49c9a5bdf3158b /66444byte/390×844
- Temp kavriva_e1009_ui_r3-danger-no-0.png RAW SHA256 082e072f9f044ac75f4a61aaeba2ccb3494b978894a0abd403fad60af3ca0d4c /60476byte/390×844
- Temp kavriva_e1009_ui_r3-danger-no-1.png RAW SHA256 fd50dce4a3a98fba61939410af74afea4731adfbafc096f74a7d9c49edbf8578 /60486byte/390×844
- Temp kavriva_e1009_ui_r3-danger-unsure-0.png RAW SHA256 a552b1a850846924603a119a66fe988212f0780067ac27213b11a257a29ca974 /60286byte/390×844
- Temp kavriva_e1009_ui_r3-danger-unsure-1.png RAW SHA256 96026371a2b5538c9d410e40a11ac81323762127d6912bf3ceccbc779ae98416 /60399byte/390×844
- Temp kavriva_e1009_ui_r3-error-foreign-0.png RAW SHA256 be0703cb530ac24cd32984c415e6041558ce7350115790b36c15b8a7bff6d078 /79023byte/390×844
- Temp kavriva_e1009_ui_r3-error-foreign-1.png RAW SHA256 4edae12675b87f314345c96d761d441f3b6e50e41784d4734a8ab7e45c9acd10 /71036byte/390×844
- Temp kavriva_e1009_ui_r3-error-foreign-2.png RAW SHA256 94b2f778ea15470bd61bc4b3fbfe48ed0be3485901ba601be1d7ad98e852761f /70944byte/390×844
- Temp kavriva_e1009_ui_r3-error-supported-0.png RAW SHA256 893a3ad26e4f0dbf60a7049f4020536c772fac2d4db83d7c5ea3e187ca08f696 /81905byte/390×844
- Temp kavriva_e1009_ui_r3-error-supported-1.png RAW SHA256 8b06cabde19d0967202318a8e80c3919212201ec212b1bde3a38d72426c77c32 /71522byte/390×844
- Temp kavriva_e1009_ui_r3-error-supported-2.png RAW SHA256 94b2f778ea15470bd61bc4b3fbfe48ed0be3485901ba601be1d7ad98e852761f /70944byte/390×844
- Temp kavriva_e1009_ui_r3-outcome-unknown-0.png RAW SHA256 4aa445c599ad3989d27e82c26d0b414fe87a03447fc6b1f6ad4dc9453c8033d8 /82178byte/390×844
- Temp kavriva_e1009_ui_r3-outcome-unknown-1.png RAW SHA256 8b06cabde19d0967202318a8e80c3919212201ec212b1bde3a38d72426c77c32 /71522byte/390×844
- Temp kavriva_e1009_ui_r3-outcome-unknown-2.png RAW SHA256 94b2f778ea15470bd61bc4b3fbfe48ed0be3485901ba601be1d7ad98e852761f /70944byte/390×844
- Temp kavriva_e1009_ui_r3-photo-foreign-0.png RAW SHA256 52410f5554217fcad630e94bbf546e13eb2d768d80932a8e9b9528dad5b082e6 /72697byte/390×844
- Temp kavriva_e1009_ui_r3-photo-foreign-1.png RAW SHA256 67a4622ee9fc3c7b054000626a91cd38b985fac7834735eb67a95e133887a44e /72693byte/390×844
- Temp kavriva_e1009_ui_r3-photo-held-0.png RAW SHA256 52410f5554217fcad630e94bbf546e13eb2d768d80932a8e9b9528dad5b082e6 /72697byte/390×844
- Temp kavriva_e1009_ui_r3-photo-held-1.png RAW SHA256 67a4622ee9fc3c7b054000626a91cd38b985fac7834735eb67a95e133887a44e /72693byte/390×844
- Temp kavriva_e1009_ui_r3-photo-reuse-0.png RAW SHA256 4a36717398f0047e87c116e8d8a01b332e50779d05630780d383d0edaf47a811 /81587byte/390×844
- Temp kavriva_e1009_ui_r3-photo-reuse-1.png RAW SHA256 69fd38047107cdbebd195226b3a8e6f0a7e80f4b8f5c24e3995072f62c316ad4 /77862byte/390×844
- Temp kavriva_e1009_ui_r3-photo-useful-0.png RAW SHA256 d95769a7a8b2d9369d6a7e30dea546b4146c715133320f7c0c0acd3030accc4a /78551byte/390×844
- Temp kavriva_e1009_ui_r3-photo-useful-1.png RAW SHA256 9fff184d3ea73d5bd8c23b8f854b5ee1ab0b0afbba31f67f4d9e0e3af1ddf2c7 /73121byte/390×844
- Temp kavriva_e1009_ui_r3-proposal-only-0.png RAW SHA256 33a5ee25fb6e4b861789738d039a1e2534d3c044e373fd7ade0b8d90cb455554 /53011byte/390×844
- Temp kavriva_e1009_ui_r3-provider-held-0.png RAW SHA256 2332574dc33f15caf9a26f12147d9cdfe7e9317890f07b4847c4ec26d2650b4d /37130byte/390×844
- Temp kavriva_e1009_ui_r3-safety-no-check-0.png RAW SHA256 815b241e1971ef71f790374470ae107c8ed9412fa3fb712347d35110a07ee1a3 /70816byte/390×844
- Temp kavriva_e1009_ui_r3-safety-no-check-1.png RAW SHA256 be9ff4ade429cbd19c0678fdd00dd13bca3be51880c90dd8232daee4e35507aa /67424byte/390×844
- Temp kavriva_e1009_ui_r3-safety-unknown-result-0.png RAW SHA256 291914fd3f15830d06f8aa1113654cb2501ffe8aea34597d407fc975d295a45b /69460byte/390×844
- Temp kavriva_e1009_ui_r3-safety-unknown-result-1.png RAW SHA256 414e55466d529de5b3797961ba334deab52e64a2f3bcab65a54cbf79e100d46b /69982byte/390×844
- Temp kavriva_e1009_ui_r3-safety-unknown-result-2.png RAW SHA256 b91bf878f01e95e2432f6760241660f0172aea7ce7657d0df4c00cf22148726c /68708byte/390×844
- Temp kavriva_e1009_ui_r3-supported-0.png RAW SHA256 8632804e5f72e0e4a51a672052c10b9d122e52bd8a6f5ab70f1f94cd2f0b4d9e /68227byte/390×844
- Temp kavriva_e1009_ui_r3-supported-1.png RAW SHA256 06a0c46fe7fa34155ae0c745e7a987f9c7c27c2f2588b63fe966d1132d5e04f9 /68694byte/390×844
- Temp kavriva_e1009_ui_r3-supported-2.png RAW SHA256 b63ea8f4379d37bee816d9c3daaf2e68c955bfe6bc68149007de61ce46b1d223 /68703byte/390×844
- Temp kavriva_e1009_ui_r3-supported-held-0.png RAW SHA256 8632804e5f72e0e4a51a672052c10b9d122e52bd8a6f5ab70f1f94cd2f0b4d9e /68227byte/390×844
- Temp kavriva_e1009_ui_r3-supported-held-1.png RAW SHA256 647f38973bce697bf71e3ce422a8d46e94a8b6bf3733a0a8ff4b087f45956fb6 /71040byte/390×844
- Temp kavriva_e1009_ui_r3-supported-held-2.png RAW SHA256 6d834c7df846cf208ad109d6b8ddaffbcf68cee9aebae8ef2f98259177ad8d46 /69305byte/390×844
- Temp kavriva_e1009_ui_r3-supported-source-open-0.png RAW SHA256 8632804e5f72e0e4a51a672052c10b9d122e52bd8a6f5ab70f1f94cd2f0b4d9e /68227byte/390×844
- Temp kavriva_e1009_ui_r3-supported-source-open-1.png RAW SHA256 a11c5147b1bf7da8cc5fe970a9b971c6839cc28ceca0fb3b327b59ba15150771 /74985byte/390×844
- Temp kavriva_e1009_ui_r3-supported-source-open-2.png RAW SHA256 4bab5a6c0ab018cedd2b347d4e3974f63b1e97d5f18b52827e80ea02160bad41 /75815byte/390×844
- Temp kavriva_e1009_ui_r3-symptom-0.png RAW SHA256 17a80c13ff858ebc9d00971217965030218e9a828391cae4786f86164d7088bf /53554byte/390×844
- Temp kavriva_e1009_ui_r3-symptom-1.png RAW SHA256 f84c6768bf2650eee09db4d3e97e7aabdff9bc62bd6a41d8ed743880dca0758c /53646byte/390×844
- Temp kavriva_e1009_ui_r3-symptom-yes-0.png RAW SHA256 99036ba4942027c7a106144044acbf8a6e5369474cf8a5e2b7d48ff55e8425e4 /58229byte/390×844
- Temp kavriva_e1009_ui_r3-symptom-yes-1.png RAW SHA256 ec12c82f52f441acaef835e9ce82f508a42eceac0a15f4f750c08c403637e3db /57814byte/390×844
- Temp kavriva_e1009_ui_r3-unknown-foreign-0.png RAW SHA256 7a3b11daa2e725066f1ee488a30eb84097e471674d48eac1508eb8df9aec65b1 /84775byte/390×844
- Temp kavriva_e1009_ui_r3-unknown-foreign-1.png RAW SHA256 2d2c6d6200efa2b48f8de9bb91bbd5d39a9ac1a755aface01426bad056241906 /75063byte/390×844
- Temp kavriva_e1009_ui_r3-unknown-foreign-2.png RAW SHA256 94b2f778ea15470bd61bc4b3fbfe48ed0be3485901ba601be1d7ad98e852761f /70944byte/390×844
- Temp kavriva_e1009_ui_r3-unresolved-0.png RAW SHA256 cdf886ee5afbfb22a85e069fabb89a149c63d409d612bc2a67f2276d3bd915c2 /69753byte/390×844
- Temp kavriva_e1009_ui_r3-unresolved-1.png RAW SHA256 4587e3fd1949c33254aa676da6f4ad5c2a341afeb7f0fe14a22cbe858d9e6db0 /63785byte/390×844
