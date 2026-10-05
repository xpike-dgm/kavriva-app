---
test_id: E-DEV-108
version: 1
contract_id_version: "SCR-022..024; C1.5/F1.5.1/FL1.5.1 maintenance v1"
subject_file: modules/e01-app/internal/shell/lib/maintenance.dart
subject_digest: 49b2bf22a267de5dd1afa4de6d0dbc85ce8b5380405140d0b6502f253f68186d
result: "RECORDED bakım sunumu; bağımsız bütün kabul bekleniyor"
evidence_links: [vault/PROFILES/maintenance-render.md, vault/PACKS/P-E1-010.md, vault/REGISTRY/T-E1-010.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-107-E10-GOVERNED-PATHS-FOR-T-E1-010.md.snapshot, modules/e01-app/internal/shell/lib/maintenance.dart, modules/e01-app/internal/shell/test/maintenance_test.dart, modules/e01-app/internal/shell/test/fixtures/maintenance_reading_questions.json]
gate_verdict: "RECORDED kaynak REVIEW; üretim/cihaz/yayın HELD"
reviewer: none
timestamp: 2026-10-05
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
depends_on: [V-E1-MAINT-001]
used_by: [V-E1-MAINT-001, P-E1-010, T-E1-010]
evidence: []
supersedes: []
status: RECORDED
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

## Gerçek kimlik ve kabul sınırı

Baseca3df6fbea268ff5b720a5d15193a50a1f3e1bda/PR109; planfa914f013fdcd032faed876689092da245989459; precode70faff765ea56fb6f0fcc7e420c771423d8155a7; sonkodfdb79db89fffce3fabe609c3ec1e135137e12ad2. KodLF SHA256 49b2bf22a267de5dd1afa4de6d0dbc85ce8b5380405140d0b6502f253f68186d; testLF 2efb15594672481ccd5323dec5cafbd685d4f60c912ad893a0a1e1d92b8839c3;15soruLF e408e3aa24229426fc26826fbeeadea799d39535d12814ef56a3e23ea81942e6. Hamv74 205240byte/RAW SHA256 c45addc973b25cf687976101046732580880d491423870d315a588ad75c62cc7. Envanterv75/100registry yalnız aday; main96DONE/110kalan/206 değişmez.

Sahibin doğrudan sürekli konuşma yetkisi ve LunaMax ikinci göz kabulü geçerli. Kanonik DEC0069mainfa914; DEC0070yerelplanPR4açık/birleşmemiş, kanonikmain onayı diye kullanılmaz. Mainpush/adminbypass yok; tam bağımsız kaynak ve ayrı son6metadata hükmü, gerçek aynıCI/T3 ve fetchedmain8 zorunlu. Yerel sonuç GitHubCI veya bütün bağımsız hüküm değildir.

## Güncel native görüntü kimlikleri

- kavriva_e1010_native_r6-catchup-0.png / catchup / RAW SHA256 29324eee0ae220e6c9d9695eb435c76cdb6e8e38ff22ae78f43369250e838bdd / 67048byte /390×844
- kavriva_e1010_native_r6-catchup-1.png / catchup / RAW SHA256 72dac66b456231c820e16e64d3ea81dd7b92da544bee2d314ccadc02de749bae / 51836byte /390×844
- kavriva_e1010_native_r6-catchup-foreign-priority-0.png / catchup-foreign-priority / RAW SHA256 d87f59d858d1cd6596deae1ad56d6f1eb115fe0f99406baf924096942b900b04 / 54475byte /390×844
- kavriva_e1010_native_r6-catchup-foreign-priority-1.png / catchup-foreign-priority / RAW SHA256 6ca33e56fd16805a3bf2fa07dd4e363cf3b8c082d9c4e9ef0cc1c3f7f57e5853 / 52112byte /390×844
- kavriva_e1010_native_r6-catchup-stale-priority-0.png / catchup-stale-priority / RAW SHA256 d87f59d858d1cd6596deae1ad56d6f1eb115fe0f99406baf924096942b900b04 / 54475byte /390×844
- kavriva_e1010_native_r6-catchup-stale-priority-1.png / catchup-stale-priority / RAW SHA256 6ca33e56fd16805a3bf2fa07dd4e363cf3b8c082d9c4e9ef0cc1c3f7f57e5853 / 52112byte /390×844
- kavriva_e1010_native_r6-catchup-unknown-priority-0.png / catchup-unknown-priority / RAW SHA256 d87f59d858d1cd6596deae1ad56d6f1eb115fe0f99406baf924096942b900b04 / 54475byte /390×844
- kavriva_e1010_native_r6-catchup-unknown-priority-1.png / catchup-unknown-priority / RAW SHA256 6ca33e56fd16805a3bf2fa07dd4e363cf3b8c082d9c4e9ef0cc1c3f7f57e5853 / 52112byte /390×844
- kavriva_e1010_native_r6-catchup-with-other-items-0.png / catchup-with-other-items / RAW SHA256 29324eee0ae220e6c9d9695eb435c76cdb6e8e38ff22ae78f43369250e838bdd / 67048byte /390×844
- kavriva_e1010_native_r6-catchup-with-other-items-1.png / catchup-with-other-items / RAW SHA256 049aa5d589c429426e5806c8ff0695c499e569023089031fb8b9105a26c135a8 / 47928byte /390×844
- kavriva_e1010_native_r6-detail-critical-0.png / detail-critical / RAW SHA256 1e870a835c39f175c5d429606b5e6d8c833a591867053113a597e7f06d2440a5 / 67408byte /390×844
- kavriva_e1010_native_r6-detail-critical-1.png / detail-critical / RAW SHA256 f04e38c819c8c1a5b58eff7922309c56f1e972f556c314dcbb4d3bf1e96bdd9a / 68147byte /390×844
- kavriva_e1010_native_r6-detail-critical-2.png / detail-critical / RAW SHA256 364d191e5dc0e21db6b87c404611498127ecf5f238a379fae8af62c5fffa8a0f / 52691byte /390×844
- kavriva_e1010_native_r6-detail-critical-foreign-0.png / detail-critical-foreign / RAW SHA256 aefb4e7708e39dea2d05c2c8611e7253cf9571fe8b0c4ad1629dd18954e9794c / 68164byte /390×844
- kavriva_e1010_native_r6-detail-critical-foreign-1.png / detail-critical-foreign / RAW SHA256 f04e38c819c8c1a5b58eff7922309c56f1e972f556c314dcbb4d3bf1e96bdd9a / 68147byte /390×844
- kavriva_e1010_native_r6-detail-critical-foreign-2.png / detail-critical-foreign / RAW SHA256 364d191e5dc0e21db6b87c404611498127ecf5f238a379fae8af62c5fffa8a0f / 52691byte /390×844
- kavriva_e1010_native_r6-detail-critical-held-0.png / detail-critical-held / RAW SHA256 aefb4e7708e39dea2d05c2c8611e7253cf9571fe8b0c4ad1629dd18954e9794c / 68164byte /390×844
- kavriva_e1010_native_r6-detail-critical-held-1.png / detail-critical-held / RAW SHA256 f04e38c819c8c1a5b58eff7922309c56f1e972f556c314dcbb4d3bf1e96bdd9a / 68147byte /390×844
- kavriva_e1010_native_r6-detail-critical-held-2.png / detail-critical-held / RAW SHA256 364d191e5dc0e21db6b87c404611498127ecf5f238a379fae8af62c5fffa8a0f / 52691byte /390×844
- kavriva_e1010_native_r6-detail-error-0.png / detail-error / RAW SHA256 850a827f37b43c6704806f24ee8ddedce5eb78cd5cb3ea4ad522b33ed644b5a9 / 69104byte /390×844
- kavriva_e1010_native_r6-detail-error-1.png / detail-error / RAW SHA256 100c21835f7f9e0aece9f845a2117bea8ab9bc9b8f7953b063bbf39191d16b2f / 68910byte /390×844
- kavriva_e1010_native_r6-detail-error-2.png / detail-error / RAW SHA256 5841d11ce9169250ecf27265bb3c8a8e1a4a947ed45a68f9e39313426e31439d / 54948byte /390×844
- kavriva_e1010_native_r6-detail-error-3.png / detail-error / RAW SHA256 22553cec599d3b712a9afa6d67820df7cc6adb180ff0c138a86e65e3dba6e83f / 54529byte /390×844
- kavriva_e1010_native_r6-detail-foreign-source-0.png / detail-foreign-source / RAW SHA256 db3ce61c475f2a008f146e7fbaac56d65fa3ffeeaa7c9882ec6ec6d37ef7a7c5 / 72004byte /390×844
- kavriva_e1010_native_r6-detail-foreign-source-1.png / detail-foreign-source / RAW SHA256 4d0c8b983401c3a29c1849a92d57b3c951fa74c6a8faf98271b6501dbd38fc66 / 70800byte /390×844
- kavriva_e1010_native_r6-detail-foreign-source-2.png / detail-foreign-source / RAW SHA256 364d191e5dc0e21db6b87c404611498127ecf5f238a379fae8af62c5fffa8a0f / 52691byte /390×844
- kavriva_e1010_native_r6-detail-held-history-0.png / detail-held-history / RAW SHA256 c73739c307718984b37a6237b5fbb53af39af38ff2f55b1d3238b976083466d0 / 69206byte /390×844
- kavriva_e1010_native_r6-detail-held-history-1.png / detail-held-history / RAW SHA256 a7a3d4a219e6e60325e7333215d18806dd799d50436e56e3ea3a29c918005239 / 64111byte /390×844
- kavriva_e1010_native_r6-detail-held-history-2.png / detail-held-history / RAW SHA256 364d191e5dc0e21db6b87c404611498127ecf5f238a379fae8af62c5fffa8a0f / 52691byte /390×844
- kavriva_e1010_native_r6-detail-held-permit-0.png / detail-held-permit / RAW SHA256 1fb4e74bf3e0c9f0f7194aa053dedc5aeceda054184615fa5f9ab1cc0707b8e4 / 67039byte /390×844
- kavriva_e1010_native_r6-detail-held-permit-1.png / detail-held-permit / RAW SHA256 1cef9ce7ed3dc7d6465301cfef0ba724aa6c66544ff528c0f54451c94ef40221 / 62890byte /390×844
- kavriva_e1010_native_r6-detail-held-permit-2.png / detail-held-permit / RAW SHA256 03305c7ecd41b213a484b10e287f97cb1ffdd2209657c7fe85d37d6a4c44f43c / 53758byte /390×844
- kavriva_e1010_native_r6-detail-missing-permit-0.png / detail-missing-permit / RAW SHA256 7ca8e81e66da96e9eb3000c67bd642b78d00ea0b3d785f9514b8422ff6c27d10 / 68931byte /390×844
- kavriva_e1010_native_r6-detail-missing-permit-1.png / detail-missing-permit / RAW SHA256 17a2d7e688792ff85aacfde4410ea0ce7c0754d3e070bf4f7c20a4f90f91b73b / 64861byte /390×844
- kavriva_e1010_native_r6-detail-missing-permit-2.png / detail-missing-permit / RAW SHA256 3ad1e91e671c86f0f4c29c7cafec595135260b0775a2afa38735d94c75ffba78 / 54418byte /390×844
- kavriva_e1010_native_r6-detail-no-handler-0.png / detail-no-handler / RAW SHA256 52f8e2d572ee644f1c24774b93b658e7b74018cee01aaaaedd37943e0dad4e24 / 69806byte /390×844
- kavriva_e1010_native_r6-detail-no-handler-1.png / detail-no-handler / RAW SHA256 fa354a8c468dea6daa77543d3c253f4fa6789f0ff55ca717a443cc6bf8246795 / 65994byte /390×844
- kavriva_e1010_native_r6-detail-no-handler-2.png / detail-no-handler / RAW SHA256 c8d6f1d255c1f2f5219d067b3b09c5f8185e615353af949de0362ad6d50a0c4f / 56247byte /390×844
- kavriva_e1010_native_r6-detail-outcome-unknown-0.png / detail-outcome-unknown / RAW SHA256 5abc7eacd893355a0c4d5a3d191c25c8b5c3c5bdcc017358b82b301a451225f4 / 69445byte /390×844
- kavriva_e1010_native_r6-detail-outcome-unknown-1.png / detail-outcome-unknown / RAW SHA256 3db6b04aac9e81e17d374e9740b131fd5b00a1305c79834a724e84a18e2273b5 / 67944byte /390×844
- kavriva_e1010_native_r6-detail-outcome-unknown-2.png / detail-outcome-unknown / RAW SHA256 22553cec599d3b712a9afa6d67820df7cc6adb180ff0c138a86e65e3dba6e83f / 54529byte /390×844
- kavriva_e1010_native_r6-detail-postpone-sent-0.png / detail-postpone-sent / RAW SHA256 6c28f8d4ce980d6b12a44895570d122bca30feb6069e82a1219f5ed8467eb217 / 63214byte /390×844
- kavriva_e1010_native_r6-detail-postpone-sent-1.png / detail-postpone-sent / RAW SHA256 cda01e4129fe14e7c93becaf41eb83991dfa91bee65378055babdb28d4c3a73a / 70243byte /390×844
- kavriva_e1010_native_r6-detail-postpone-sent-2.png / detail-postpone-sent / RAW SHA256 81b4543c3aae82e95df6e9135916a91fca12732e97e213b693293fcd278e9bf0 / 56775byte /390×844
- kavriva_e1010_native_r6-detail-postpone-sent-3.png / detail-postpone-sent / RAW SHA256 22553cec599d3b712a9afa6d67820df7cc6adb180ff0c138a86e65e3dba6e83f / 54529byte /390×844
- kavriva_e1010_native_r6-detail-source-open-0.png / detail-source-open / RAW SHA256 1fb4e74bf3e0c9f0f7194aa053dedc5aeceda054184615fa5f9ab1cc0707b8e4 / 67039byte /390×844
- kavriva_e1010_native_r6-detail-source-open-1.png / detail-source-open / RAW SHA256 4032b2b0a3d8954a06ffd08702059782e26f7d4b1246ea3e9250639403bc847b / 60316byte /390×844
- kavriva_e1010_native_r6-detail-source-open-2.png / detail-source-open / RAW SHA256 db80f10a737235621d8689ab9cb99e96314c0fd7a624bb655eb2bdedfc3c7f3e / 52364byte /390×844
- kavriva_e1010_native_r6-detail-stale-history-0.png / detail-stale-history / RAW SHA256 c73739c307718984b37a6237b5fbb53af39af38ff2f55b1d3238b976083466d0 / 69206byte /390×844
- kavriva_e1010_native_r6-detail-stale-history-1.png / detail-stale-history / RAW SHA256 a7a3d4a219e6e60325e7333215d18806dd799d50436e56e3ea3a29c918005239 / 64111byte /390×844
- kavriva_e1010_native_r6-detail-stale-history-2.png / detail-stale-history / RAW SHA256 364d191e5dc0e21db6b87c404611498127ecf5f238a379fae8af62c5fffa8a0f / 52691byte /390×844
- kavriva_e1010_native_r6-detail-stale-source-0.png / detail-stale-source / RAW SHA256 db3ce61c475f2a008f146e7fbaac56d65fa3ffeeaa7c9882ec6ec6d37ef7a7c5 / 72004byte /390×844
- kavriva_e1010_native_r6-detail-stale-source-1.png / detail-stale-source / RAW SHA256 4d0c8b983401c3a29c1849a92d57b3c951fa74c6a8faf98271b6501dbd38fc66 / 70800byte /390×844
- kavriva_e1010_native_r6-detail-stale-source-2.png / detail-stale-source / RAW SHA256 364d191e5dc0e21db6b87c404611498127ecf5f238a379fae8af62c5fffa8a0f / 52691byte /390×844
- kavriva_e1010_native_r6-detail-stale-timing-revision-0.png / detail-stale-timing-revision / RAW SHA256 5dda585630ab70463bffa1290ffc0301de5cb305772eace3e37e2f9695ad98f4 / 69312byte /390×844
- kavriva_e1010_native_r6-detail-stale-timing-revision-1.png / detail-stale-timing-revision / RAW SHA256 806ad93dabd917c9fd20af999baf3ecf51d7ab81516ca82e10fe472aeabb9cf1 / 64118byte /390×844
- kavriva_e1010_native_r6-detail-stale-timing-revision-2.png / detail-stale-timing-revision / RAW SHA256 364d191e5dc0e21db6b87c404611498127ecf5f238a379fae8af62c5fffa8a0f / 52691byte /390×844
- kavriva_e1010_native_r6-detail-submitting-0.png / detail-submitting / RAW SHA256 1cdaf370915230f4d7194253200ed970e757aace548e10645d7421e8f938dbc8 / 69272byte /390×844
- kavriva_e1010_native_r6-detail-submitting-1.png / detail-submitting / RAW SHA256 54b58bec9ae459d3ba8e4ed6b219fdc9bcf2a3e678391aedd9a275cb3348bcef / 64972byte /390×844
- kavriva_e1010_native_r6-detail-submitting-2.png / detail-submitting / RAW SHA256 22553cec599d3b712a9afa6d67820df7cc6adb180ff0c138a86e65e3dba6e83f / 54529byte /390×844
- kavriva_e1010_native_r6-detail-supported-0.png / detail-supported / RAW SHA256 1fb4e74bf3e0c9f0f7194aa053dedc5aeceda054184615fa5f9ab1cc0707b8e4 / 67039byte /390×844
- kavriva_e1010_native_r6-detail-supported-1.png / detail-supported / RAW SHA256 80d0827aab1dbd1c7e3e1c40afac6bc4d20e384966192016349600905ed8ef1a / 59218byte /390×844
- kavriva_e1010_native_r6-detail-supported-2.png / detail-supported / RAW SHA256 364d191e5dc0e21db6b87c404611498127ecf5f238a379fae8af62c5fffa8a0f / 52691byte /390×844
- kavriva_e1010_native_r6-detail-uncertain-timing-0.png / detail-uncertain-timing / RAW SHA256 5dda585630ab70463bffa1290ffc0301de5cb305772eace3e37e2f9695ad98f4 / 69312byte /390×844
- kavriva_e1010_native_r6-detail-uncertain-timing-1.png / detail-uncertain-timing / RAW SHA256 806ad93dabd917c9fd20af999baf3ecf51d7ab81516ca82e10fe472aeabb9cf1 / 64118byte /390×844
- kavriva_e1010_native_r6-detail-uncertain-timing-2.png / detail-uncertain-timing / RAW SHA256 364d191e5dc0e21db6b87c404611498127ecf5f238a379fae8af62c5fffa8a0f / 52691byte /390×844
- kavriva_e1010_native_r6-detail-unknown-history-0.png / detail-unknown-history / RAW SHA256 c73739c307718984b37a6237b5fbb53af39af38ff2f55b1d3238b976083466d0 / 69206byte /390×844
- kavriva_e1010_native_r6-detail-unknown-history-1.png / detail-unknown-history / RAW SHA256 a7a3d4a219e6e60325e7333215d18806dd799d50436e56e3ea3a29c918005239 / 64111byte /390×844
- kavriva_e1010_native_r6-detail-unknown-history-2.png / detail-unknown-history / RAW SHA256 364d191e5dc0e21db6b87c404611498127ecf5f238a379fae8af62c5fffa8a0f / 52691byte /390×844
- kavriva_e1010_native_r6-detail-unknown-source-0.png / detail-unknown-source / RAW SHA256 db3ce61c475f2a008f146e7fbaac56d65fa3ffeeaa7c9882ec6ec6d37ef7a7c5 / 72004byte /390×844
- kavriva_e1010_native_r6-detail-unknown-source-1.png / detail-unknown-source / RAW SHA256 4d0c8b983401c3a29c1849a92d57b3c951fa74c6a8faf98271b6501dbd38fc66 / 70800byte /390×844
- kavriva_e1010_native_r6-detail-unknown-source-2.png / detail-unknown-source / RAW SHA256 364d191e5dc0e21db6b87c404611498127ecf5f238a379fae8af62c5fffa8a0f / 52691byte /390×844
- kavriva_e1010_native_r6-detail-user-reported-0.png / detail-user-reported / RAW SHA256 b4fd243beff94b1a956b77499cd2a01e61ad5a954eea43bcf1ff12bdec569048 / 73967byte /390×844
- kavriva_e1010_native_r6-detail-user-reported-1.png / detail-user-reported / RAW SHA256 0b032243a2ceabaf282b644adcc9748082864f0f4ac778ce87ff5015c7cf720f / 66150byte /390×844
- kavriva_e1010_native_r6-detail-user-reported-2.png / detail-user-reported / RAW SHA256 364d191e5dc0e21db6b87c404611498127ecf5f238a379fae8af62c5fffa8a0f / 52691byte /390×844
- kavriva_e1010_native_r6-empty-plan-0.png / empty-plan / RAW SHA256 a021cf7f802109ba2164c81dd55b27257d087a966c2c5acd0eb7132394668e03 / 38578byte /390×844
- kavriva_e1010_native_r6-foreign-plan-0.png / foreign-plan / RAW SHA256 815994c6f2c1eb816090036557c83eb61972c0c2a6bb572ebf30a3cf064bd0f1 / 43146byte /390×844
- kavriva_e1010_native_r6-loading-plan-0.png / loading-plan / RAW SHA256 3739f0a62e1e7e3f089f572020ec7d3f4c7b3547db641b6fbc1c30ca0bd3bc8f / 50706byte /390×844
- kavriva_e1010_native_r6-loading-plan-1.png / loading-plan / RAW SHA256 70c260fc8cbe0eaa1aec03b06c8172beff9111df0d750e578880ac52da7a5176 / 48273byte /390×844
- kavriva_e1010_native_r6-missing-plan-0.png / missing-plan / RAW SHA256 815994c6f2c1eb816090036557c83eb61972c0c2a6bb572ebf30a3cf064bd0f1 / 43146byte /390×844
- kavriva_e1010_native_r6-plan-0.png / plan / RAW SHA256 07e8f48f66572f968cb19c59a4c8a78dabaf4905c7c0569654b561e80aec5ee3 / 39583byte /390×844

## Referans kimlikleri

[
  {
    "name": "H02.png",
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1010_pinned_references\\H02.png",
    "sha256": "affe6f5277f9b6c0b0e3f22b75de2ae7e54f25b9c3f45f2635eb9f793d0b63aa",
    "bytes": 1934424,
    "source": "fa914f013fdcd032faed876689092da245989459:refernces/H02.png",
    "rootActualOpened": true,
    "docShaMatch": true
  },
  {
    "name": "H03.png",
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1010_pinned_references\\H03.png",
    "sha256": "a4772c29e541819822d67f8a1548f0461d48c7893b1bf091fe795a0b727d6359",
    "bytes": 1939675,
    "source": "fa914f013fdcd032faed876689092da245989459:refernces/H03.png",
    "rootActualOpened": true,
    "docShaMatch": true
  },
  {
    "name": "H04.png",
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1010_pinned_references\\H04.png",
    "sha256": "0b3f4c180c27dade4be9b8c965d048a9fcad0652f3a2016bf07a16b2c5e0d72c",
    "bytes": 1765636,
    "source": "fa914f013fdcd032faed876689092da245989459:refernces/H04.png",
    "rootActualOpened": true,
    "docShaMatch": true
  }
]

H01R02 dışsağlanmış dosya C:/Users/Xpike/Desktop/references/R02-Bakim.png RAW SHA256 4ba3f7eb6651b1a531b76ccbaa8572f7b6f6cf2dedf9dfc97fd4a9abd5d0d0cd; Gitpin kimliği iddia edilmez.

## Gerçek komut kanıtları ve korunmuş hata logları

- kavriva_e1010_pubget.log / RAW SHA256 0f6f606fe6106606054e3e430c19492c9b51de46c4a608eef235b1e595dc13d4 / 287byte
- kavriva_e1010_initial_tests.log / RAW SHA256 1afe8b6e6763a6748b51cf804975e72ce0f8aec4fddd8853a80ff8944a347698 / 266249byte
- kavriva_e1010_after_keys_tests.log / RAW SHA256 eab828a2980d906b53dd3602a1cf647bcc7932a24b6d535ce3b241a33c3a9d6a / 1776byte
- kavriva_e1010_focus_test.log / RAW SHA256 93697fe4c8371070a8a36b6438995179a94e673ff89774392a9084c4327379ee / 258byte
- kavriva_e1010_full_r1_tests.log / RAW SHA256 e0d7b21dcfc01da5dd9a3b3e93d70a5f308edcf13b467431b42a2d39d81a6071 / 49005byte
- kavriva_e1010_full_r2_tests.log / RAW SHA256 41e2a7ab324f2ecd9477f9512d4a1dae44ba597f17f1d12c62c909a600db914b / 46501byte
- kavriva_e1010_full_r3_tests.log / RAW SHA256 a306d92ae2005173dff92d209608f21f308b0e2cace39399a2a988c54e25e80e / 46768byte
- kavriva_e1010_full_r4_tests.log / RAW SHA256 861b9863d08cdb7afd043bbf5f6bcc969974ba15c304164fc83265c7815d06a2 / 46537byte
- kavriva_e1010_full_r5_tests.log / RAW SHA256 b7327d8744dce509621b5b1252542eab14a95f89b652229b31bd9b65096d1a3c / 47076byte
- kavriva_e1010_stale_callback_RED.log / RAW SHA256 7ca5a4b86cb43d5a26280d7a4b89525e4e6a559a5f8431269579f8363390386c / 2314byte
- kavriva_e1010_stale_callback_GREEN.log / RAW SHA256 3a823c9f7988c96c0e23470e663c0449556e8bdf12b58ed4186933459384579b / 403byte
- kavriva_e1010_r6_format.log / RAW SHA256 0dda197314a74de9789e0adc7ccba25f8dc0e9d88e86c4e9c4122d72b367f004 / 49byte
- kavriva_e1010_r6_analyze.log / RAW SHA256 7fa1f6879e46484e1079b8691e6c9dcd411d393822862ecee8a72aaa20d3474b / 98byte
- kavriva_e1010_full_r6_tests.log / RAW SHA256 4cce87c85e2cd3c12a8a2f7b9ec0e5665137d8ce0c7af7779be8ec3d1f4182d6 / 46926byte

## Geçmişsiz bağımsız ilk okuma — değiştirilmemiş tam rapor

RAW SHA256 6d941749e66775c3dce0583ca278434c765b9e5dce635d8aef6bca46081b54a1

Kavriva E01-010 — bağımsız ilk okuma raporu

Sonuç: PASS

Yöntem ve kapsam
- Yalnızca C:/Users/Xpike/AppData/Local/Temp/kavriva_e1010_images_r6.json içindeki güncel PNG görüntüleri ve C:/Users/Xpike/.codex/worktrees/e4-required-auto-transfer/kavriva-app/modules/e01-app/internal/shell/test/fixtures/maintenance_reading_questions.json içindeki 15 soru kullanıldı.
- Manifestteki 81 PNG'nin her biri view_image ile gerçekten açıldı ve görüntü olarak modele aktarıldı. Bunlar 31 ekran durumunun tam kaydırma parçalarıdır.
- Kod, plan, eski sohbet, önceki rapor, cevap anahtarı veya dış kaynak okunmadı.
- Bu, ekran görüntülerine dayalı bir AI okumasıdır; insan kullanıcının, telefonun veya gerçek bakım sürecinin doğrulandığı anlamına gelmez.
- Soruların tamamı anlamca yanıtlanabildiği için PASS. Hiçbir soru yanıtsız veya belirsiz kalmadı.

Metin, görünüm ve eylem anlaşılabilirliği
- 390×844 görüntülerde metinler yüksek kontrastlı ve rahat okunuyor. Başlıklar, durum kutuları ve bölüm ayrımları bakım zamanı, kaynak/geçmiş, rehber önizlemesi, fiilen yapılan bakım ve rutin hatırlatma yollarını ayırıyor.
- Etkin ana eylemler çoğunlukla mavi ve belirgin; ikincil yollar çerçeveli düğmelerle ayrılıyor. Liste, plan, geçmiş, güvenli destek ve çıkış yolları ayrı etiketlenmiş. Eylem kullanılamadığında “şu anda kapalı” açıklaması görülüyor.
- Tekrarlanan “Bu iş neden görüyorsun?” başlığı dil bilgisi açısından hatalı; “Bu işi neden görüyorsun?” daha doğal ve doğru olur. Çevresindeki metin nedeni açıkça verdiği için bu hata soruların anlamca doğru yanıtlanmasını engellemiyor.
- Kritik güvenlik uyarısı, rutin hatırlatma metninden ayrı bir uyarı kutusunda. Kaynak veya geçmiş eksik, eski ya da uygunluğu doğrulanmamış olduğunda tarih, kilometre ve gecikme tahmini gösterilmiyor.

15 soruya ekrandan verilen yanıtlar
1. Evet. Ayrıntı ekranı işin seçili motosikletin bakım planına bağlandığını ve dayandığı bakım kaynağını söylüyor. Kaynak ya da geçmiş doğrulanmadığında bu da ayrıca belirtiliyor.
2. Hayır. Yeterli bilgi yoksa tarih, kilometre veya gecikme durumu tahmin edilmiyor; bakım zamanı net değil deniyor.
3. Hayır. Kullanıcı beyanının kaydedilmiş olması bakımın doğrulandığı anlamına gelmiyor; ekran bunu açıkça söylüyor.
4. Hayır. Rehber yalnızca önizleme. Bugün bakım gerekliliği veya uygulama izni vermiyor.
5. Evet. Motosiklete uygunluk ve tüm hazırlık koşullarının ayrıca kontrol edilmesi gerektiği belirtiliyor.
6. Hayır. Daha sonra hatırlat yalnızca rutin hatırlatma isteği. Bakımı tamamlanmış saymıyor; değişiklik de ancak sonuç doğrulanınca geçerli.
7. Evet. Fiilen yapılan bakım, rehberi önizleme ve hatırlatmayı erteleme ayrı başlıklar ve eylemler altında.
8. Evet. Olağan birikmiş işler ekranı ilk işi güncel kaynakla desteklenen güvenlik ve kullanım etkisine göre öne aldığını söylüyor; yalnızca en çok gecikmiş olduğu için seçmiyor. Öncelik doğrulanamıyorsa ilk iş seçilmediği ayrıca belirtiliyor.
9. Evet. Sıradaki işler ve plandaki diğer işler listeleniyor; tüm bakım planına dönme yolu da var.
10. Evet. Geçmiş ve kanıtı inceleme, bakım kaynağını kontrol etme ve kaynak ayrıntılarını gösterme yolları bulunuyor.
11. Hayır. Sonuç doğrulanmadıysa isteği yeniden başlatmama ve önce aynı isteğin sonucunu kontrol etme uyarısı var.
12. Hayır. Başka motosiklete ait veya bu motosiklete uygulanabilirliği doğrulanmamış kaynak güncel bakım zamanını doğrulamaz. Böyle bir durumda kesin zaman tahmini gösterilmiyor. Ekran ayrıca sürüş izni vermediğini açıkça belirtiyor.
13. Evet. Liste ekranında öncelikli iş ve mavi ayrıntı eylemi öne çıkıyor; diğer işler, plan, geçmiş, destek ve çıkış ayrı yollar olarak görünür. Ayrıntıda ana eylem ile bilgi ve çıkış yolları başlıklar ve düğme biçimleriyle ayrılmış.
14. Hayır. Rutin hatırlatmayı ertelemenin kritik güvenlik uyarısını kaldırmadığı ve ekranın sürüş izni vermediği açıkça yazıyor.
15. Evet. İlk işin kaynakla desteklenen güvenlik/kullanım etkisi açıklanıyor; yaş veya bakım zamanı gibi eksik değerlerin tahmin edilmediği belirtiliyor. Güncel kaynak ve ilgili geçmişi kontrol etme yolları gösteriliyor.

Açılan 81 PNG
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-catchup-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-catchup-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-catchup-foreign-priority-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-catchup-foreign-priority-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-catchup-stale-priority-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-catchup-stale-priority-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-catchup-unknown-priority-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-catchup-unknown-priority-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-catchup-with-other-items-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-catchup-with-other-items-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-critical-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-critical-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-critical-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-critical-foreign-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-critical-foreign-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-critical-foreign-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-critical-held-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-critical-held-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-critical-held-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-error-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-error-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-error-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-error-3.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-foreign-source-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-foreign-source-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-foreign-source-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-held-history-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-held-history-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-held-history-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-held-permit-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-held-permit-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-held-permit-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-missing-permit-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-missing-permit-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-missing-permit-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-no-handler-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-no-handler-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-no-handler-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-outcome-unknown-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-outcome-unknown-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-outcome-unknown-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-postpone-sent-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-postpone-sent-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-postpone-sent-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-postpone-sent-3.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-source-open-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-source-open-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-source-open-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-stale-history-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-stale-history-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-stale-history-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-stale-source-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-stale-source-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-stale-source-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-stale-timing-revision-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-stale-timing-revision-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-stale-timing-revision-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-submitting-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-submitting-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-submitting-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-supported-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-supported-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-supported-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-uncertain-timing-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-uncertain-timing-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-uncertain-timing-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-unknown-history-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-unknown-history-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-unknown-history-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-unknown-source-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-unknown-source-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-unknown-source-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-user-reported-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-user-reported-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-detail-user-reported-2.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-empty-plan-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-foreign-plan-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-loading-plan-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-loading-plan-1.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-missing-plan-0.png
C:\Users\Xpike\AppData\Local\Temp\kavriva_e1010_native_r6-plan-0.png


DÜZELTME — görsel üzerinden yeniden okuma
Önceki “Bu iş neden görüyorsun?” dil bilgisi notu yanlıştı. C:/Users/Xpike/AppData/Local/Temp/kavriva_e1010_native_r6-detail-supported-0.png dosyasını 2026-10-05 tarihinde view_image ile yeniden açıp başlığı dikkatle okudum. Görselde başlık “Bu işi neden görüyorsun?” şeklindedir ve doğrudur. Önceki not geri çekilmiştir. Özgün raporun gövdesi değiştirilmemiş; bu düzeltme yalnızca dosyanın sonuna eklenmiştir. Önceki 15 yanıt ve PASS sonucu değişmiyor.


Yalnız güncel81PNG ve koddan önce sabit15soru kullanıldı. Root15yanıtın tamamını anlamca doğru olarak okudu; AI okuması insan/cihaz/üretim kanıtı değildir. Tam görev incelemecisi bu yöntemi/kapsamı ayrıca değerlendirir. Yeni GitHubCI/T3 ve bütün bağımsız hüküm beklenmektedir.


`vault/PROFILES/maintenance-render.md`; `vault/PACKS/P-E1-010.md`; `vault/REGISTRY/T-E1-010.md`; `vault/EVIDENCE/E-DEV-108.md`.

## Kayıt denetiminde gerçek yerel hata ve dar onarım

İlk run_all12kontrol+42test çalışmasında42testPASS ancak linkkontrolü iki plan yolunu CIbilinen adres listesinde bulamadığından worst1 döndü. Her iki gerçek kanonik dosya var; paket içi gösterim doğrulanmış planpin blob bağlantısına çevrildi, plan veya checker değiştirilmedi. İlk check_links --strict komutu desteklenmeyen argüman nedeniyle başlamadı; gerçek strict biçimi --plan-root ile yeniden çalıştırılır. Bu hata uygulama testinden ve bağımsız hükümden ayrıdır. İlk hamlog kavriva_e1010_source_run_all.log korunur; onarım sonraki source_run_all_r2.log ve source_strict_links.log ile doğrulanacak.

## Güncel kaynak kayıt denetimi

Gerçek onarım sonrası run_all12kontrol+42test PASS/worst0; strictlinks --plan-root4655çözülmüşbağ; generatedregistry100row/T010REVIEW; exact14adres/22basepin/korunan kod-SDK-lock-YAML/eskiesasgövde/hamv74byteeşit PASS. Bağımsız bütün kaynak hükmü ve gerçekGitHubCI/T3 henüz bekleniyor.
