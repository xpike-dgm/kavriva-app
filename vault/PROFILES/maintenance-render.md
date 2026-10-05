---
record_id: V-E1-MAINT-001
version: 1
purpose: Bakım planı, iş ayrıntısı ve önceliklerin kaynaklı sunumu
domain: maintenance
module: e01-app
owner: E1
implements: [ADR-008, C1.5, F1.5.1, SCR-022, SCR-023, SCR-024, BR-024, BR-025, BR-026, BR-055, BR-056, BR-095, BR-096, BR-097, BR-104, BR-124, BR-125, CON-001, CON-002, CON-003, CON-004, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: maintenance-presentation
tasks: [T-E1-010]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-05
depends_on: [M-E1-001, M-E3-001, M-E4-001, M-E5-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E1-010, T-E1-010, E-DEV-108]
evidence: [E-DEV-108]
supersedes: []
status: REVIEW
---

# Bakım planı, ayrıntısı ve önceliklerin sunumu

T-E1-010; C1.5/F1.5.1/FL1.5.1/SCR-022..024. Bu kapsam E1 sunumudur. Dış sistemin doğru kapsamlı güncel kaynak kararını tüketir; bakım aralığı/tarih/km/öncelik hesabı, kanonik tamamlanma, gerçek bildirim veya üretim yetkilendirmesi oluşturmaz. Callback yalnız niyettir; üretim E3/E5/kimlik/DB/Supabase ve gerçek hatırlatma yazıcısı bağlantısı yoktur.

MaintenanceScope motosiklet, bağlam revizyonu, plan ve plan revizyonunu; MaintenanceReference ayrıca istek, amaç, konu, kaynak/sürüm/konum/kontrol tarihi, güncellik, unknown/held/confirmed ve gerekçeyi taşır. Kimlikler boş olamaz; listeler ve izin haritası değişmezdir. Kaynak mevcudiyeti tek başına olumlu kontrol değildir. Eski/yabancı/eksik/yanlış amaç-konu-istek-revizyon veya held/unknown satırlar olumlu kabul edilmez, yabancı özel metinler gösterilmez.

SCR-022 bakım işlerini okunabilir ayrı yollarla gösterir. Boş plan bütün bakımın tamamlandığı anlamına gelmez; olmayan veya yabancı plan tarih/km/gecikme üretmez. SCR-023 destekli durum ile Bakım zamanı net değil durumunu ayrı ana başlıkla gösterir. Zaman bilgisi yalnız uygulanabilir güncel kaynak, kullanılabilir doğrulanmış tamamlanma geçmişi ve aynı item revizyonuna bağlı güncel zaman desteği birlikte mevcutsa gösterilir. E1 tarih/aralık hesaplamaz. Kullanıcı beyanı kaydedildi diye verified olmaz; held/unknown/foreign geçmişin özel açıklaması gösterilmez. Neden bu iş var, geçmiş/kanıt ve bakım kaynağı ayrı erişilir. Olumlu kaynak ayrıntısı isteğe bağlı açılır; kaynak yenilenince kapanır.

Rehber önizlemesi bilgi yoludur, bakımın bugün gerekli olduğunu veya uygulamaya başlanabileceğini söylemez; motosiklete uygunluk ve hazırlık ayrıca kontrol edilir. Gerçekte yapılmış bakımı kaydetme ve rutin hatırlatmayı erteleme ayrı niyetlerdir. Erteleme tamamlanma üretmez, kritik uyarıyı gizlemez, kesin yeni tarih uydurmaz. Güncel işlem kontrolleri altı ayrı boyutta aynı motosiklet/kapsam/istek/eylem/item-revizyon konusuna bağlıdır: motorcycle/source/authorization/policy/operationIntent/audit. Eksik veya olumsuz bir boyut ilgili yolu kapatır. Gecikmiş eski düğme olayı güncel sahip olunan item kimliği ve aynı revizyonu yeniden bulup GÜNCEL izinleri kontrol eder; eski olumlu nesneyi kullanamaz. Silinmiş veya revizyonu değişmiş item için eski tıklama yeni etkiye dönüşmez.

İstek gönderildi yerel kilidi sonucu doğrulanmadan yeni normal etkiyi kapatır, aynı istekte kaynak yenilenmesi bu kilidi kaldırmaz. Busy, hata ve işleyici yokluğu normal etkiyi kapatır. OUTCOME_UNKNOWN başarı/başarısızlık değildir ve işlem yeniden gönderilmez; aynı istek kimliğiyle reconcile niyeti ayrı gönderilir. Hata tamamlanma veya kanonik etkinin yokluğu kanıtı değildir. Tarih/başarı/iş tamamlandı gösterilmez. Geçmiş, güvenli destek ve çıkış bilgi yolları normal etki koşullarından ayrıdır; gerçek uzlaştırma T-E4-011b/T-E3-004 HELD.

SCR-024 sakin öncelik özeti sunar: güncel kaynakla desteklenen güvenlik ve kullanım etkisi ilk işi belirler; sırf gecikme veya fren adı yetmez. E1 sıra hesaplamaz. Öncelik desteği planın güncel bütün item kimliklerini VE revizyonlarını içerir. Destek yok/foreign/stale ise ilk iş ve neden tahmin edilmez. Destekli ilk iş büyük ayrı yüzey ve tek baskın ayrıntı düğmesiyle görünür; sonraki ve sıralama dışında kalan plan işleri erişilir. Neden önce, konu yaşı ve sonraki kontrol kaynak desteğiyle görünür; bilinmeyen yaş tahmin edilmez. Kritik güvenlik uyarısı hatırlatma gönderildikten sonra da görünür; eski/foreign/held uyarı özel metni yerine kontrol gereksinimi gösterilir. Bu ekran sürüş izni vermez.

## Görsel uygulama ve sınırlar

Gerçek UI: ana başlık32/alt başlık22/gövde16; koyu172033/açık zemin; tek baskın mavi0E5BD8 ana eylem; görünür C5CFDF ikincil çerçeve ve dekoratif, Semantics dışı ok. Kaynaklı durum sakin F4F7FB, belirsizlik FA F4 E9; renk tek anlam taşımaz. En az52 hedef, 640 azami genişlik, 14 köşe ve16 boşluk korunur. H02 büyük iş başlığı/önizleme ana yol/ayrı kayıt ve erteleme; H03 kaynakla desteklenen ilk iş/ana ayrıntı/kalan plan; H04 belirsizlik ana başlığı/geçmiş veya kaynak çözüm yolu/kavram bilgisi önizlemesi. H01 listesi KPI duvarı olmadan taranır. Sabit bakım türü öncelik sayılmaz.

Çağıranın marka/font alanı korunur; test kabuğu Kavriva · test örneği ve motosiklet kullanıcı beyanını açıkça gösterir. Referanstaki fotoğraf/logo/icon/font/token/altbar/router nihai üretim varlığı olarak kopyalanmaz; bunlar paket sınırıyla HELD. Kaynak ve konum örnek veridir. Gerçek üretim kaynakları/kimlik/kalıcılık/bildirim/medya/cihaz/OS/yardımcı teknoloji/fiziksel bakım/yayın HELD. E3R1 REVIEW, E5-003 IN_PROGRESS, Supabase47/57/59 ve RET97 kapanmaz. AI ilk okuması insan kullanıcı veya gerçek telefon kanıtı değildir.

## Gerçek yerel doğrulama

Locked pub get başarılı; SDK/lock/YAML ve önceki178 normal test değişmedi. Son R6: strict format24 dosya/0 değişiklik, analyze0 sorun, bütün204 yerel test PASS =203 normal +1 yerel native yakalama. Önceki178+yeni25 normal test. 31durum×320/390/768×1/2/3 gerçek tam kaydırma ve52hedef test edildi; bütün279kombinasyonun PNGsi veya gerçek cihaz kanıtı iddia edilmez. Native81 düzenlenmemiş390×844 ekran parçası, bütün31durumun sonuna kadar kaydırma parçalarıdır. Root81güncel dosyanın tamamını gerçekten açtı.

Anlamlı testler: kaynak/geçmiş/zaman eksikliği; user-reported≠verified; foreign/staleplan; özel geçmişin sızmaması; altı işlem boyutunun her negatif çeşidi; kapsam/istek/amaç/revizyon eşleşmesi; eski düğme olayında güncel izin/silinmiş ve yeni revizyon; erteleme≠completion/kritik uyarı/aynıistekte kilit; unknown aynıistek/noReplay; busy/hata/handler; kaynaklı öncelik/fren otomatik birinci değil; diğer plan işleri; eski öncelik revizyonu; eski kritik metin; isteğe bağlı kaynak ayrıntısı ve taze kaynakta kapanması; aynı bağlamda seçili ayrıntının korunması ve foreign bağlamda temizlenmesi; yeni istekte eskiplanı kullanmama; bilgi/destek/çıkış; disabledSemantics/liveRegion; gerçek Tab/Enter/Space ve etiket değişse sabit odak; boyanmış metin4.5/odak3 kontrastı; gerçek durum hazırlığıyla responsive/fullscroll/52hedef. Hit uyarıları fatal; test anlamları gevşetilmedi.

## Yerel hata ve onarım geçmişi

İlk test 5PASS/16FAIL: tekrarlanan history eylem anahtarları widget kurulmasını bozdu; item kimliğine bağlı benzersiz anahtarlar eklendi ve21hedef test geçti. R1bütün çalışma200PASS/1FAIL: doğru metin Bugün bakım gerekliliği veya uygulama izni değildir olarak kısaltıldıktan sonra eski metin beklentisi kalmıştı; aynı anlamı sınayan beklenti güncellendi. R2bütün201PASS; diğer plan erişimi regresyonuylaR3/R4bütün202PASS. H03 ilk işin ana düğmesi dolduruldu ve fixture kullanıcı beyanı açıklaması anlamıyla eşleştirildi. Kaynak yenileme seçili ayrıntıyı gereksiz kapatıyordu; aynı bağlamda koruma ve değişen kaynak ayrıntısını kapatma regresyonu R5bütün203PASS.

Gecikmiş eski düğme olayı gerçek RED: beklenen boş niyet listesinde eski olumlu itemden1niyet oluştu. Dispatch artık GÜNCEL planın sahip olunan aynı ID+REV itemini bulur, güncel izni denetler; silinmiş/revizyon değiştirmiş hedefi reddeder. Aynı regresyon GREEN1PASS, bütünR6 204PASS. İlk R6komutunda dart-sdk/bin/dart.bat yanlış yolu nedeniyle komut başlamadı; doğru SDK/bin/dart.bat ile strictformat/analyze/fulltest yeniden başarıyla çalıştı. Bunlar root yerel bulgularıdır, bağımsız ret raporu değildir. Önceki bütün ham FAILlogları ve sonraki GREENlogları Temp altında içerik özetleriyle korunur.

## Yedi E10 tasarım karşılaştırması

| Kapı | Yapılan gerçek karşılaştırma ve sınır |
|---|---|
| Bütün ekran | 81güncel native parçanın tamamı açıldı; başlık, ana-ikincil eylem, kaynak, durum, alt destek/çıkış görünür; yalnız kırpılmış üst parça kanıtı yok. |
| Ekranlar arası | Kabul edilmiş T-E1-009 UIv4 busy-supported0..2 gerçek görüntüleri tekrar açıldı; aynı açık zemin/koyu metin/32hiyerarşi/52hedef/ikincil affordance ve kaynak≠isteksonucu diliyle karşılaştırıldı. Bakımın plan/ayrıntı/öncelik rolleri ayrı, aile tek şablona indirilmedi. |
| Durum | Destekli/belirsiz/unknown/held/foreign/stalekaynak-geçmiş-izin/isteksent/busy/hata/handler-yok/critical/boş-yabancı-yükleniyorplan ve priority varyasyonları ayrı test girdileriyle; eşit pikseller benzersiz tasarım sayılmaz. |
| Duyarlı düzen | 31×9kombinasyon gerçek kaydırma52hedef; Türkçe1/2/3 ölçek; native yalnız390×844. Fiziksel telefon iddiası yok. |
| Erişilebilirlik | Gerçek Tab/Enter/Space, sabit odak, disabled Semantics, liveRegion ve boyanmış kontrast; pointer uyarıları fatal. Fiziksel ekran okuyucu/OS HELD. |
| Regresyon | Eski178normal test aynı çalışmada geçti; eski shell/SDK/lock/YAML/kod-soru kaynakları değişmedi; hamv74byteeşit arşiv ve önceki EDEV107/M1esas gövde korunur. |
| Kanonik referans | Pinfa914 H02/H03/H04 gerçekGitblobları açıldı, dokümanSHA eşit; H01R02sağlanmışdışPNG tekrar açıldı, Gitpinbyteeşitliği iddia edilmez. H02ana yol, H03ilk kaynaklı iş/kalanlar, H04belirsizlik/çözüm korunur. Tam piksel/fotoğraf/nihai asset/font/token iddiası yok. |


`vault/PROFILES/maintenance-render.md`; `vault/PACKS/P-E1-010.md`; `vault/REGISTRY/T-E1-010.md`; `vault/EVIDENCE/E-DEV-108.md`.

## R7 güncel kaynak — eski bulguların dar onarımı, kabul beklenir

Önceki kaynak14b2cdacf4fe298bbc184fdd07644dc4f444c7d8 tam bağımsız CHANGES_REQUESTED; üç bulgu ve eski17CI/T3 aşağıda korunur. Koddan önce dar onarım kaydı261a4d4; güncel kod5c5a4ed49e5cbc54f2e2893658bb495306f25169. Öncelik tüm aynı-kapsam plan üyelerinin ID+REV dizisini ve ayrı order dizisini kapsar. Her UI olayında oluşturulduğu scope/request ve mounted denetlenir; dispatch güncel item ID+REV ve güncel altı izin boyutunu yeniden kontrol eder. Plan/item/history/notice kimlik bileşenleri Uri.encodeComponent ile ayrı ayrı kaçırılır. Slash/comma/percent içerikli farklı tuple'lar karışmaz; gerçek payload kimlikleri değiştirilmez. Bu E1 özel gösterimidir; yeni public seam veya üretim adaptörü yoktur.

Gerçek üç negatif regresyon eski kaynakta0PASS/3FAIL verdi; aynı üç regresyon dar onarım sonrası3PASS. Ek virgüllü liste regresyonu farklı planın eski öncelik kanıtını kabul etmediğini ve yeni tam kanıtın çalıştığını sınar. Son tam koşu208PASS=207normal(178önceki+29yeni)+1native; strictformat24zero/analyze0.31×9duyarlı/52hedef ve önceki178test aynı koşuda geçti. Güncel81R7native dosyanın her biri öncekiR6 görüntüsüyle SHA256/byteeşit; görünür metin/düzen değişmedi. Önceki root81gerçek açma/ilkoku15doğru/bağımsız81açma kanıtı bu byteeşitlik üzerinden geçerlidir; yeniR7dosyalarını yeniden açtım veya yeniilkoku yaptım denmez. Sabit15soru değişmedi. GerçekCI/T3 ve tam bağımsız yeniden hüküm beklenir. Görev/profilREVIEW, paketIN_PROGRESS, kanıtRECORDED; main96/110/206 ve üretim/cihaz/yayınheld değişmez.
