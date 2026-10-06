---
test_id: E-DEV-109
version: 1
purpose: Bakım geçmişi, kayıt anlamı ve kopya kapsamının kaynaklı sunumu
domain: history
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, C1.6, F1.6.1, SCR-025, SCR-026, SCR-030, BR-057, BR-059, BR-078, BR-093, BR-094, BR-113, BR-114, BR-115, BR-116, BR-144, BR-145, BR-146, CON-001, CON-002, CON-003, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: history-presentation
tasks: [T-E1-011]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-06
depends_on: [V-E1-HISTORY-001]
used_by: [V-E1-HISTORY-001, P-E1-011, T-E1-011]
evidence: []
supersedes: []
status: RECORDED
contract_id_version: "SCR-025/026/030; C1.6/F1.6.1/FL1.6.1 history v1"
subject_file: modules/e01-app/internal/shell/lib/history.dart
subject_digest: a64d499a4f9e0d1508027a8d0599c6a1c0c3b9b3c800c6274140864c7c488469
result: "Yerel sunum kanıtı; bütün bağımsız inceleme ve GitHub CI/T3 bekleniyor"
gate_verdict: "RECORDED yerel kanıt; kabul ve bütün inceleme bekleniyor"
reviewer: none
timestamp: 2026-10-06
evidence_links: [vault/PROFILES/history-render.md, vault/PACKS/P-E1-011.md, vault/REGISTRY/T-E1-011.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-108-E10-GOVERNED-PATHS-FOR-T-E1-011.md.snapshot, modules/e01-app/internal/shell/lib/history.dart, modules/e01-app/internal/shell/test/history_test.dart, modules/e01-app/internal/shell/test/fixtures/history_reading_questions.json]
---

# Bakım geçmişi, kayıt anlamı ve kopya kapsamı

T-E1-011; C1.6/F1.6.1/FL1.6.1; yalnız SCR-025/026/030. Kanonik kabul Provenance; serve T-E3-010; authorize T-E5-013/019. Tek sert bağımlılık T-E1-001 DONE. Plan fa914f013fdcd032faed876689092da245989459 ACCEPTANCE_MATRIX F1.6.1 için SIMULATION kanıtını tanımlar. Bu kayıt sınırlı E1 sunumunu değerlendirir; üretim geçmişi veya yetki bağlantısı tamamlanmış sayılmaz. SCR-027/028/029 ayrı T-E1-012/013 kapsamıdır ve bu görev kabul edilmeden başlamaz.

E1 kaydı doğrulamaz, izin veya yeni kanonik claim üretmez. Mevcut E3 T-E3-010 kaynağı yalnız USER_REPORTED geçmişi üretir; tarihsel kopya güncel kanonik değerlendirme değildir. E5 T-E5-013 üretim okuma bağlayıcısı uygulama kaydı yoktur; T-E5-019 yalnız alan kapsamı manifest politikasını üretir. Gerçek HTTP/kimlik, E5 oturum/yetki yazıcısı, alan değerleri, dosya üreticisi ve üretim kopya hizmeti bağlanmadı. Olumlu kaynak/izinli kopya/diğer değerlendirme durumları açık test örneğidir. Eksik üretim üreticisi test girdisiyle tamamlanmış sayılmaz.

HistoryScope motosiklet, bağlam, katalog ve katalog revizyonunu; HistoryReference ayrıca istek, amaç, konu, kaynak/sürüm/konum/kontrol tarihi, gerekçe, güncellik ve unknown/held/confirmed durumunu taşır. Referans mevcudiyeti tek başına izin değildir. Kayıt/revizyon, değerlendirme/revizyon, sınıflandırma revizyonu ve tüm tarihsel alan sürümleri katalog üyelik konusuna bağlanır. Kayıt listeleri/haritalar değişmezdir, boş kimlikler reddedilir. Ayraç, Unicode ve bozuk UTF16 kimlikleri kayıpsız ayrılır; farklı hedef aynı izin konusuna çökmez. Katalogda çift ID, yabancı kapsam veya eski/tarihsel/eksik referans bütün özel kataloğu kapatır.

Okuma dört ayrı güncel boyut ister: motorcycle/source/authorization/policy. Çekirdek sekiz alanın ayrı güncel okuma izni yoksa kayıt başlığı dahil özel içerik açılmaz. Yüksek riskte inceleyen ve belirsizlik de zorunludur. İsteğe bağlı ek açıklama/iletişim değerleri ancak kendi izniyle görünür. Tarihsel eski/yeni/zaman/gerekçe hem alanın bugünkü sınıflandırma iznini hem o tarihsel sürümün ayrı okuma iznini gerektirir. Geçmiş izin verildi diye eski özel iletişim bilgisi açılmaz.

SCR-025 arama ve tüm/düzeltilen/itirazlı filtrelerini yalnız güncel okunabilir kayıtlara uygular. Boş veya kapalı kaynak bütün bakımın tamamlandığını söylemez. SCR-026 bugünkü değerlendirmeyi ilk ana kartta, bildirilen sonuç/yazar/kanıt/düzeltmeyi ayrı bölümlerde sunar. Aktörün servis/profesyonel olması işi doğrulamaz; belge tek başına doğrulama değildir. İncelenmiş iş yalnız belirtilen kanıt kapsamını destekler, kusursuz işçilik garantisi değildir. İtirazda kazanan/güven puanı üretilmez; çekilmiş kanıtın bugünkü değerlendirmesi eski izden ayrıdır. Değerlendirme kaynağı yoksa son revizyon kendiliğinden kesin doğru sayılmaz. Yüksek risk iddia/kanıt/kaynak/inceleyen/belirsizliği gizli detaya bırakmaz. Kaynak ve sürüm izi ayrı isteğe bağlı bölümlerdir.

SCR-030 seçili motosiklet, kayıtlar/tarihler/sürümler, dahil edilen ve dışarıda kalan alan etiketlerini gösterir; özel değerleri dışarı taşımaz. Kopya kapsamı tam kayıt+değerlendirme+sınıflandırma+tarihsel sürüm bağını içerir; eski manifest yeni revizyonun yetkisini ödünç alamaz. Zorunlu tarih/kaynak/kanıt/düzeltme/itiraz bağlamı veya seçilmiş tarihsel alanın izni eksikse niyet kapalıdır. Dışarı aktarma altı ayrı güncel boyut ister: motorcycle/source/authorization/policy/operationIntent/audit. Geçmişi okuma izni dışarı aktarma izni değildir. Temel geçmiş ve kopya kapsamı pasif motosiklet veya ücretli paket değişimiyle geriye dönük kapanmaz. Asıl kayıtlar değişmez/silinmez; bağlantı iptali önceden indirilmiş/gönderilmiş/basılmış kopyayı geri almaz.

Düğme yalnız HistoryIntent kapsam/istek/eylem/kopya planıID+REV bildirir; veri değeri, gerçek dosya, yazıcı veya paylaşım bağlantısı üretmez. İşlem çağrısı oluşturulduğu kapsam/istek/katalog bağını yakalar, güncel hedef ve tüm izinleri yeniden denetler. Eski tıklama yeni istek/sürüm/izinle çalışamaz; silinmiş hedef veya kaldırılmış izin etkisizdir. Yerel gönderim kilidi aynı istekte kaynak yenilenince korunur. Busy/hata/handler yokluğu normal niyeti kapatır. OUTCOME_UNKNOWN başarı/başarısızlık tahmini değil, yalnız aynı istek kimliğiyle reconcile niyetidir; tekrar gönderim yoktur. Destek ve çıkış niyetleri etki izinlerinden ayrı güvenli yollardır.

## Gerçek yerel doğrulama

Kilitli SDK ve pub get --enforce-lockfile başarılı. R5 strict formatter26 dosya/0 değişiklik; analyze0 sorun. Bütün normal240 test tek çalışmada geçti = eski208+yeni32. Native yakalama ayrı1 test geçti; tek bir241test çalışması iddia edilmez. 30 durum×320/390/768×1/2/3 gerçek tam kaydırma ve52hedef denetlendi. Bütün270kombinasyon için görüntü veya cihaz kanıtı iddia edilmez. Güncel64 doğal390×844 PNG, tüm30 durumun sonuna kadar kaydırma parçalarıdır. Test fontu SDK Roboto; nihai ürün fontu değildir.

Anlamlı regresyonlar: değişmezlik/boş alan; beyan-belge-inceleme ayrımı; yüksek risk ve değerlendirme eksikliği; eski/yeni/zaman/gerekçe; tarihsel özel alan sızıntısı ve sürüm izni eksikliği; itiraz/çekilme; isteğe bağlı kaynak; eski/yabancı/held/kopya; dört okuma boyutunun sekiz negatif çeşidi; her çekirdek alan için boyanmış+Semantics sızıntı denetimi; arama/filtre/geçiş; boş/pasif/paket; altı dışarı aktarma boyutunun yedi negatif çeşidi; zorunlu kapsam/özel alan/eskimiş değerlendirme-sınıflandırma-tarihsel manifest; handler/busy/hata/unknown; gönderim kilidi; eski closure/güncel izin/silme/revizyon/unmount; katalog çift üyelik ve kayıpsız kimlik; gerçek Tab/Enter/Space; disabledSemantics/liveRegion; boyanmış metin4.5/odak3 kontrastı; bütün270 düzenin sonuna erişim. Pointer uyarıları fataldır.

## Korunan yerel hata ve onarım geçmişi

İlk hedef koşusu29PASS/2FAIL: Semantics handle test bitmeden kapatılmamıştı; ikinci test düğme Semantics'i yerine dış Focus Semantics'ini seçiyordu. Handle try/finally ile test içinde kapatıldı, gerçek button Semantics seçildi. Gizli değerlerin boyanmış/semantik içerikte olmaması ve kapalı düğmenin eylemsiz olması beklentileri korunur. R1 iki odaklı test geçti; analizde eski pipelineOwner kullanım uyarısı güncel getSemantics ile giderildi. Eski testi başlatan yanlış cwd Python onarım dosyası yazmadan durdu; ikinci formatter metni eşleşmeyen onarım da yazmadan durdu; sonra doğru dar patch uygulandı. Önceki ham FAIL logu korunur.

Görüntü R2 font/dosya beklemesi Flutter testinin fake async ortamında ilerlemedi; root bu denemeyi CtrlC ile durdurdu, PASS verilmedi. Font ve görüntü/dosya IO'su runAsync içine alındı; R3 yakalama1PASS/64PNG. Bazı araç görüntü tekrarlarını kesit gibi gösterdiği için root üst başlık eksikliği şüphesi bildirdi. Örnekler arasında yeni kabukla R5 tekrar yakalandı;64/64 RAW SHA birebir eşit çıktı. Bu nedenle gerçek uygulamada kaydırma hatası kanıtlanmış değildir. Root64R3 dosyayı açtı, R5 üç özgün ilk parçayı tekrar açtı; güncel içeriğin kalan61'i RAW eşitlik yöntemiyle taşındı. Bütün64R5dosyanın yeni açıldığı iddia edilmez. R4 yardımcı dosyası yanlış metin kodlamasıyla isim regexini bozdu:0test/exit79; UTF8 açık okumayla R5 gerçek yakalama başarıldı. Bütün eski günlükler korunur.

## Yedi E10 tasarım kapısı

| Kapı | Gerçek karşılaştırma ve sınır |
|---|---|
| Bütün ekran |64 güncel parçanın tüm içeriği R3 gerçek açımı + R5 RAW eşitliği yöntemiyle okundu; destek/çıkış dahil tam sonuna erişim, yalnız üst parça değil. |
| Ekranlar arası | Kabul edilmiş T-E1-010 R8 detail-supported0 gerçek açıldı. Aynı açık zemin/koyu metin/başlık32/22/gövde16/52hedef/ikincil çerçeve ve kaynaklı belirsizlik dili korundu. Liste, kayıt anlamı ve kopya kapsamı farklı hiyerarşidir. |
| Durum |30 ayrı veri hazırlığı; beyan/belge/incelenmiş/itiraz/çekilmiş/yetersiz/değerlendirme ve alan kaynağı eksik/özel sürüm/boş/pasif/kopya kapsamı ve işlem durumları. Eşit PNG ayrı tasarım değildir; dört katalog kapanma nedeni ortak güvenli mesajdır, E1 neden uydurmaz. |
| Duyarlı düzen |30×9 gerçek kaydırma ve52hedef; Türkçe1/2/3 ölçek. Native sadece390×844; fiziksel telefon ve sayısal nihai breakpoint kanıtı değil. |
| Erişilebilirlik | Gerçek klavye, görünür odak, kapalı düğme Semantics, liveRegion, çizilmiş metin/odak kontrastı ve fatal hit testi. Fiziksel OS/ekran okuyucu HELD. |
| Regresyon | Önceki208 normal test aynı çalışmada geçti; SDK/lock/YAML/eski kod-soru değişmez.28 taban pin, eski esas gövdeler ve hamv75 bayt eşit arşiv denetlenir. |
| Kaynak/varyasyon | Plan pininden R04/I02/I06 üç gerçekPNG tekrar açıldı; belgeSHAeşit. R04 taranabilir kayıt/arama, I02 bugünkü anlam önce, I06 motosiklet-kapsam-uyarı-eylem ayrımı esas alındı. Logo/icon/font/altbar/router/claimenum/dosya-formatı/nihai token ve cihaz/yayın kararları HELD. |

Üretim E3R1 REVIEW/E5-003 IN_PROGRESS, Supabase47/57/59 ve RET97 kapanmaz. AI okuması insan/telefon kanıtı değildir. Ana dal97DONE/109kalan/206; aday envanterv76/101kayıt kabul sayımını ilerletmez. Kanonik DEC0069 ve doğrudan sahibin sürekli yetkisi geçerli; birleşmemiş planPR4 DEC0070 kanonik karar diye kullanılmaz. Tek görev tek PR; bütün kaynak ve ayrı son6 kayıt incelemesi + aynı gerçek CI/T3 + normal eşleşen birleştirme + fetchedmain8 gereklidir. Yerel başarı GitHubCI veya tam görev incelemesi değildir.

## Sabit kimlikler

Kabul edilmiş taban 94d0f963ff7fe2c93bdaf43b398fcdf95724cf37; kodöncesi 1062d1eac31d269f84f57eef50a00e6ef3e136a5; kaynak kod 4215dad357aa9c31d337b58e207503a1497865e3; kodLF SHA256 a64d499a4f9e0d1508027a8d0599c6a1c0c3b9b3c800c6274140864c7c488469; testLF SHA256 62bdffad01b387a6707e9bdb71f710671cc2eb4390f284e7f8924644e9949846;17soruLF SHA256 2a5e7f768549f02bdc3071dddb0ec78715a63264651e895b82330215e421f2a8. Hamv75 206544byte/RAW SHA256 301b497b310615b9af34d9a1b9258f591d6adf86bb6e6cf84737f9937e9d24d9.

## Güncel64görüntü kimliği

- kavriva_e1011_r5_native-list-0.png / list / RAW SHA256 5825f0dd8b1c7659f99e879127f566ce8b3dd7b68801a5f2054853114389ace4 / 48503byte /390×844 /offset 0.0/end 1106.0
- kavriva_e1011_r5_native-list-1.png / list / RAW SHA256 a5268012835462fc72af4917ac9138d135f83d6d652bd78eaef6d8ccfc49fe92 / 47456byte /390×844 /offset 620.0/end 1106.0
- kavriva_e1011_r5_native-list-2.png / list / RAW SHA256 ad6d0d7bb039b87a5fe7c586b50d670cea550aad30128d811202822cb4e60e3a / 44831byte /390×844 /offset 1106.0/end 1106.0
- kavriva_e1011_r5_native-detail-reported-0.png / detail-reported / RAW SHA256 9972dbafd7f4f1012744220ffd4bf094f0f8f6a35f36fa6dac4c229b449279cb / 66422byte /390×844 /offset 0.0/end 500.0
- kavriva_e1011_r5_native-detail-reported-1.png / detail-reported / RAW SHA256 7a530ca1bdfe6ae2ac18832a7bcdd0fce3e89591276aab81ab7f2f678b2a1157 / 47406byte /390×844 /offset 500.0/end 500.0
- kavriva_e1011_r5_native-detail-documented-0.png / detail-documented / RAW SHA256 a8cfe145660e48c6871835131dcf8fdcd0f928e0002c682cbf5284385585a714 / 65286byte /390×844 /offset 0.0/end 531.0
- kavriva_e1011_r5_native-detail-documented-1.png / detail-documented / RAW SHA256 d288527ccfef477ce6b745c72e4a1e3175c7c5532110cfea174d9bc611e5abc7 / 48029byte /390×844 /offset 531.0/end 531.0
- kavriva_e1011_r5_native-detail-reviewed-0.png / detail-reviewed / RAW SHA256 7877ae16d35801cfd46f37bb5e363a5b1334fb8a1c7e79eb72c451b7a62e5506 / 67860byte /390×844 /offset 0.0/end 607.0
- kavriva_e1011_r5_native-detail-reviewed-1.png / detail-reviewed / RAW SHA256 d288527ccfef477ce6b745c72e4a1e3175c7c5532110cfea174d9bc611e5abc7 / 48029byte /390×844 /offset 607.0/end 607.0
- kavriva_e1011_r5_native-detail-disputed-0.png / detail-disputed / RAW SHA256 becade0813820efded2aafaa7bea69167813823dbb8a7ffabc75edbaa36f3a1f / 66896byte /390×844 /offset 0.0/end 585.0
- kavriva_e1011_r5_native-detail-disputed-1.png / detail-disputed / RAW SHA256 d288527ccfef477ce6b745c72e4a1e3175c7c5532110cfea174d9bc611e5abc7 / 48029byte /390×844 /offset 585.0/end 585.0
- kavriva_e1011_r5_native-detail-withdrawn-0.png / detail-withdrawn / RAW SHA256 0818e5ab1bbf79cd9f90444a8c8ab96e8c7904314114e505536910486d04c835 / 71764byte /390×844 /offset 0.0/end 607.0
- kavriva_e1011_r5_native-detail-withdrawn-1.png / detail-withdrawn / RAW SHA256 d288527ccfef477ce6b745c72e4a1e3175c7c5532110cfea174d9bc611e5abc7 / 48029byte /390×844 /offset 607.0/end 607.0
- kavriva_e1011_r5_native-detail-unresolved-0.png / detail-unresolved / RAW SHA256 01699f5e3c941e5dcd9b69c8122204717f5224303381a28c6ff81eac2b8cf16f / 68775byte /390×844 /offset 0.0/end 500.0
- kavriva_e1011_r5_native-detail-unresolved-1.png / detail-unresolved / RAW SHA256 d288527ccfef477ce6b745c72e4a1e3175c7c5532110cfea174d9bc611e5abc7 / 48029byte /390×844 /offset 500.0/end 500.0
- kavriva_e1011_r5_native-detail-high-risk-0.png / detail-high-risk / RAW SHA256 7877ae16d35801cfd46f37bb5e363a5b1334fb8a1c7e79eb72c451b7a62e5506 / 67860byte /390×844 /offset 0.0/end 1305.0
- kavriva_e1011_r5_native-detail-high-risk-1.png / detail-high-risk / RAW SHA256 487cd0c5f3bcad503a58dea03a1f2973cf974e7e1000e13d7caf779d70316c6a / 68347byte /390×844 /offset 620.0/end 1305.0
- kavriva_e1011_r5_native-detail-high-risk-2.png / detail-high-risk / RAW SHA256 a12b1a2b45d3a88ef92e272f9aaf55a505e1a63fc153f7dd825be018c81f99b0 / 50944byte /390×844 /offset 1240.0/end 1305.0
- kavriva_e1011_r5_native-detail-high-risk-3.png / detail-high-risk / RAW SHA256 84e03f8871d0328f5d29e32a8e8e4d1bcd14a4d4b3979836d46183ce1e8cabae / 45899byte /390×844 /offset 1305.0/end 1305.0
- kavriva_e1011_r5_native-detail-corrected-0.png / detail-corrected / RAW SHA256 edf895155292c40d4660eeb1a7d73970718b4ea67189e1b188bc2ca21921e0a3 / 65427byte /390×844 /offset 0.0/end 843.0
- kavriva_e1011_r5_native-detail-corrected-1.png / detail-corrected / RAW SHA256 d6fc5ad6eecb535e3d23e57eba838ec34f5559ff48bf65e9e5012454bf883f41 / 58706byte /390×844 /offset 620.0/end 843.0
- kavriva_e1011_r5_native-detail-corrected-2.png / detail-corrected / RAW SHA256 879ad38453d2ebc580ef54f837793fa251687bdee8c2bcd7fd3abfa112289975 / 48035byte /390×844 /offset 843.0/end 843.0
- kavriva_e1011_r5_native-detail-private-version-0.png / detail-private-version / RAW SHA256 edf895155292c40d4660eeb1a7d73970718b4ea67189e1b188bc2ca21921e0a3 / 65427byte /390×844 /offset 0.0/end 606.0
- kavriva_e1011_r5_native-detail-private-version-1.png / detail-private-version / RAW SHA256 4d883516a6633d52ff389b6280f5ea0eefaa1f0148e34c21e5b54e533662760d / 46207byte /390×844 /offset 606.0/end 606.0
- kavriva_e1011_r5_native-detail-no-evaluation-0.png / detail-no-evaluation / RAW SHA256 a0109c7cd8bfa3197dd2ccfc7ffe5bd4d541b3b654be7a7cea906578e23121bd / 67466byte /390×844 /offset 0.0/end 553.0
- kavriva_e1011_r5_native-detail-no-evaluation-1.png / detail-no-evaluation / RAW SHA256 7a530ca1bdfe6ae2ac18832a7bcdd0fce3e89591276aab81ab7f2f678b2a1157 / 47406byte /390×844 /offset 553.0/end 553.0
- kavriva_e1011_r5_native-detail-no-source-0.png / detail-no-source / RAW SHA256 6759e092ba875260065080f46b022c3b05afca815e5652608a144ed32cfa55d6 / 37347byte /390×844 /offset 0.0/end 0.0
- kavriva_e1011_r5_native-detail-field-denied-0.png / detail-field-denied / RAW SHA256 6759e092ba875260065080f46b022c3b05afca815e5652608a144ed32cfa55d6 / 37347byte /390×844 /offset 0.0/end 0.0
- kavriva_e1011_r5_native-detail-missing-0.png / detail-missing / RAW SHA256 6759e092ba875260065080f46b022c3b05afca815e5652608a144ed32cfa55d6 / 37347byte /390×844 /offset 0.0/end 0.0
- kavriva_e1011_r5_native-catalog-missing-0.png / catalog-missing / RAW SHA256 a2bd2c417c6f0f2972f4f21ba7926e2e6d37d01c0d3971b6a116295874fc8218 / 44616byte /390×844 /offset 0.0/end 0.0
- kavriva_e1011_r5_native-catalog-held-0.png / catalog-held / RAW SHA256 a2bd2c417c6f0f2972f4f21ba7926e2e6d37d01c0d3971b6a116295874fc8218 / 44616byte /390×844 /offset 0.0/end 0.0
- kavriva_e1011_r5_native-catalog-stale-0.png / catalog-stale / RAW SHA256 a2bd2c417c6f0f2972f4f21ba7926e2e6d37d01c0d3971b6a116295874fc8218 / 44616byte /390×844 /offset 0.0/end 0.0
- kavriva_e1011_r5_native-catalog-foreign-0.png / catalog-foreign / RAW SHA256 a2bd2c417c6f0f2972f4f21ba7926e2e6d37d01c0d3971b6a116295874fc8218 / 44616byte /390×844 /offset 0.0/end 0.0
- kavriva_e1011_r5_native-historical-copy-0.png / historical-copy / RAW SHA256 ac381632bd65ef243babeae1e53327c25e4d2ca2344fe27599234c66b5ce9b1f / 42043byte /390×844 /offset 0.0/end 0.0
- kavriva_e1011_r5_native-empty-list-0.png / empty-list / RAW SHA256 c6f6034d0403c3548483b32829573d2f8f6a3f94119fcc7c71deb323908309d7 / 54513byte /390×844 /offset 0.0/end 371.0
- kavriva_e1011_r5_native-empty-list-1.png / empty-list / RAW SHA256 92641fadec4bf86a352fc83b58bf05e24ed573a3ed5af5e1866c893d27e4a3e6 / 39892byte /390×844 /offset 371.0/end 371.0
- kavriva_e1011_r5_native-inactive-list-0.png / inactive-list / RAW SHA256 018d547224f9e84f5ba197870f7feb1be652f6acecd2b4f5d3df9a5f585ecea7 / 51814byte /390×844 /offset 0.0/end 622.0
- kavriva_e1011_r5_native-inactive-list-1.png / inactive-list / RAW SHA256 acb1272b50bb260744c074238b4f533021afb58962bbcdd91d28a27b96bf614b / 36512byte /390×844 /offset 620.0/end 622.0
- kavriva_e1011_r5_native-inactive-list-2.png / inactive-list / RAW SHA256 e0031c4035798f013e3d5a2c00d6be321863d41f152ee84d7a98e71d09b60727 / 36476byte /390×844 /offset 622.0/end 622.0
- kavriva_e1011_r5_native-export-ready-0.png / export-ready / RAW SHA256 e47b772749e2962519e03db42a2b357b3fc797baf0761e40ff310832795b3fd5 / 68233byte /390×844 /offset 0.0/end 759.0
- kavriva_e1011_r5_native-export-ready-1.png / export-ready / RAW SHA256 dce0b2c01eb6975d867d7c2fc9355416aeea9421be82e549b9ecd0142d48583a / 70575byte /390×844 /offset 620.0/end 759.0
- kavriva_e1011_r5_native-export-ready-2.png / export-ready / RAW SHA256 e0f26bc894a46904c528f17ea6e4b3652b09ea21603e308eb891f16d3b99fda6 / 58686byte /390×844 /offset 759.0/end 759.0
- kavriva_e1011_r5_native-export-corrected-0.png / export-corrected / RAW SHA256 e47b772749e2962519e03db42a2b357b3fc797baf0761e40ff310832795b3fd5 / 68233byte /390×844 /offset 0.0/end 759.0
- kavriva_e1011_r5_native-export-corrected-1.png / export-corrected / RAW SHA256 dce0b2c01eb6975d867d7c2fc9355416aeea9421be82e549b9ecd0142d48583a / 70575byte /390×844 /offset 620.0/end 759.0
- kavriva_e1011_r5_native-export-corrected-2.png / export-corrected / RAW SHA256 e0f26bc894a46904c528f17ea6e4b3652b09ea21603e308eb891f16d3b99fda6 / 58686byte /390×844 /offset 759.0/end 759.0
- kavriva_e1011_r5_native-export-denied-0.png / export-denied / RAW SHA256 e47b772749e2962519e03db42a2b357b3fc797baf0761e40ff310832795b3fd5 / 68233byte /390×844 /offset 0.0/end 859.0
- kavriva_e1011_r5_native-export-denied-1.png / export-denied / RAW SHA256 f43e4e9cb13cf85c31ba90a443872484f92423b8bb0d4a31ec83c91e4f731662 / 76227byte /390×844 /offset 620.0/end 859.0
- kavriva_e1011_r5_native-export-denied-2.png / export-denied / RAW SHA256 cb64f266a37ff27cff733add56e1dbd89a192fdd1317a15687a35618d93b9501 / 62709byte /390×844 /offset 859.0/end 859.0
- kavriva_e1011_r5_native-export-missing-0.png / export-missing / RAW SHA256 ae8a6a0f593ce6c81e9764ec1539325493cbc267e8ef38481ed2ceb6f3ef91fd / 71728byte /390×844 /offset 0.0/end 619.0
- kavriva_e1011_r5_native-export-missing-1.png / export-missing / RAW SHA256 75e8eef1fe629c9af553a5556d4f9d2d3f87623512fef43c715af0c212f79e85 / 58581byte /390×844 /offset 619.0/end 619.0
- kavriva_e1011_r5_native-export-missing-coverage-0.png / export-missing-coverage / RAW SHA256 ae8a6a0f593ce6c81e9764ec1539325493cbc267e8ef38481ed2ceb6f3ef91fd / 71728byte /390×844 /offset 0.0/end 619.0
- kavriva_e1011_r5_native-export-missing-coverage-1.png / export-missing-coverage / RAW SHA256 75e8eef1fe629c9af553a5556d4f9d2d3f87623512fef43c715af0c212f79e85 / 58581byte /390×844 /offset 619.0/end 619.0
- kavriva_e1011_r5_native-export-no-handler-0.png / export-no-handler / RAW SHA256 e47b772749e2962519e03db42a2b357b3fc797baf0761e40ff310832795b3fd5 / 68233byte /390×844 /offset 0.0/end 852.0
- kavriva_e1011_r5_native-export-no-handler-1.png / export-no-handler / RAW SHA256 3b339eb263a752ce7b111fc17f82003842b59a9652c33bb47b60c870d988cb8b / 76798byte /390×844 /offset 620.0/end 852.0
- kavriva_e1011_r5_native-export-no-handler-2.png / export-no-handler / RAW SHA256 f426273c34a5f437bb22ab53c6408adcb30ba7c37f4acc238a0e164796bf134f / 65120byte /390×844 /offset 852.0/end 852.0
- kavriva_e1011_r5_native-export-submitting-0.png / export-submitting / RAW SHA256 54e79dad238f35238890219692b69c45408da83b756fc824af5cc79922e90750 / 67744byte /390×844 /offset 0.0/end 944.0
- kavriva_e1011_r5_native-export-submitting-1.png / export-submitting / RAW SHA256 690291cb68fb5319948802b2beb8817af83630b7210fcf65d790e55547f6f87f / 78026byte /390×844 /offset 620.0/end 944.0
- kavriva_e1011_r5_native-export-submitting-2.png / export-submitting / RAW SHA256 37f901838c2b613fd57d6f9b5000e802e4350b5d2ccdfdfdc0dfca658cd179d0 / 59114byte /390×844 /offset 944.0/end 944.0
- kavriva_e1011_r5_native-export-failed-0.png / export-failed / RAW SHA256 9c00bda1d38e4b3be5dfd8f7bea4837aed6bfeb78db97a3e54add8d990a2bae5 / 66437byte /390×844 /offset 0.0/end 966.0
- kavriva_e1011_r5_native-export-failed-1.png / export-failed / RAW SHA256 0ebbe441ed39f826e9371cf958dc68aacd26bab3f1308a34cc32258b3b2a99be / 75480byte /390×844 /offset 620.0/end 966.0
- kavriva_e1011_r5_native-export-failed-2.png / export-failed / RAW SHA256 37f901838c2b613fd57d6f9b5000e802e4350b5d2ccdfdfdc0dfca658cd179d0 / 59114byte /390×844 /offset 966.0/end 966.0
- kavriva_e1011_r5_native-export-unknown-0.png / export-unknown / RAW SHA256 4f0ab116275bc7f8df93a817bc528e5b69e11752bac73ad27037d0660c878684 / 65679byte /390×844 /offset 0.0/end 1075.0
- kavriva_e1011_r5_native-export-unknown-1.png / export-unknown / RAW SHA256 856415187794e894f092951d52d17c7f4a0f5d932ad0c7cb82ae07d081f65b86 / 72758byte /390×844 /offset 620.0/end 1075.0
- kavriva_e1011_r5_native-export-unknown-2.png / export-unknown / RAW SHA256 37f901838c2b613fd57d6f9b5000e802e4350b5d2ccdfdfdc0dfca658cd179d0 / 59114byte /390×844 /offset 1075.0/end 1075.0

## Gerçek kaynak PNG kimlikleri

[
  {
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1011_pinned_references\\I02-SCR-026-Historical-Record-and-Provenance.png",
    "source": "fa914f013fdcd032faed876689092da245989459:refernces/I02-SCR-026-Historical-Record-and-Provenance.png",
    "sha256": "c4769cb2c20f0759e1219987da193388bd89a4eb6fa013d0438613227063928c",
    "docShaMatch": true,
    "dimensions": [
      887,
      1774
    ],
    "rootActualOpened": true
  },
  {
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1011_pinned_references\\I06-SCR-030-Data-Export.png",
    "source": "fa914f013fdcd032faed876689092da245989459:refernces/I06-SCR-030-Data-Export.png",
    "sha256": "ea3ae943e904246eab4c834f6cb56bac6913a812af6c901a7bcfb01db75d5419",
    "docShaMatch": true,
    "dimensions": [
      887,
      1774
    ],
    "rootActualOpened": true
  },
  {
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1011_pinned_references\\R04-Gecmis.png",
    "source": "fa914f013fdcd032faed876689092da245989459:refernces/R04-Gecmis.png",
    "sha256": "5e5a057c9b372485edf648406f5cf33740959d8ea88eb1e1a88b204d45256dc8",
    "docShaMatch": true,
    "dimensions": [
      887,
      1774
    ],
    "rootActualOpened": true,
    "documentSource": "fa914f013fdcd032faed876689092da245989459:03_DESIGN/MAIN_SHELL_VISUAL_REFERENCES.md"
  }
]

## Korunan komut günlükleri

- kavriva_e1011_initial_tests.log / RAW SHA256 cff81ec755c6b62c82e086029b46425e9790b34fd88b07f122f6c66e42467b63 / 6624byte
- kavriva_e1011_r1_analyze.log / RAW SHA256 3e0f32eb2dc16a741efbb6b997e8e9f683599a98644af1691237bea25e07674c / 97byte
- kavriva_e1011_r1_focus.log / RAW SHA256 60e7bac0d1df1844b64b828169bd6e404370fccd9ded53318b4da080c65f9b49 / 337byte
- kavriva_e1011_r1_format.log / RAW SHA256 7a2370e58f50bef299dfcee5088979a17d68aacb8e0d5ae7c9ced3cab46812b8 / 80byte
- kavriva_e1011_r2_analyze.log / RAW SHA256 3e0f32eb2dc16a741efbb6b997e8e9f683599a98644af1691237bea25e07674c / 97byte
- kavriva_e1011_r2_format.log / RAW SHA256 c9df69205cdf45759687d4acb7d3bbe3f29dbcea6d9a1707aef8323d67eebe87 / 80byte
- kavriva_e1011_r2_native.log / RAW SHA256 229317e8af99be118f4cae91d2d9474f139ca8e01517c6d3633ebce1d0d82575 / 708byte
- kavriva_e1011_r2_normal.log / RAW SHA256 041af94c9dca38cb5f93237a28a1efc4833b7c8b1c201f4018bbb538d96c47c8 / 55176byte
- kavriva_e1011_r2_pub.log / RAW SHA256 5b1a68840d4e55378a400abfa809626b97104dba69d6b2958c6bf36170880f79 / 280byte
- kavriva_e1011_r3_native.log / RAW SHA256 18ccafb29d5861c6c05b23ea92fb53c4d28e32041ad8f9ed8e7684d854b99c2e / 260byte
- kavriva_e1011_r4_native.log / RAW SHA256 56341e761c409ac238d0c78b11b9f025e4dbc3deebded1140baa9de427b49f60 / 224byte
- kavriva_e1011_r5_analyze.log / RAW SHA256 a27c9b5a0a48e2348798f9504cf83b0b897376507e097ba8a604d7955a03348a / 97byte
- kavriva_e1011_r5_format.log / RAW SHA256 7896b0d771885861c3b9a775509729de2b37426cd0a814039b6c49fdf80f0d95 / 48byte
- kavriva_e1011_r5_native.log / RAW SHA256 18ccafb29d5861c6c05b23ea92fb53c4d28e32041ad8f9ed8e7684d854b99c2e / 260byte
- kavriva_e1011_r5_normal.log / RAW SHA256 d764bd7d9d50b9b34fed0926f663b1c75b1485ef73da9133883c35d43e49ccd4 / 54863byte

## Bağımsız ilk okuma — değiştirilmemiş tam rapor

RAW SHA256 555fa99852aa8335f5a40d684d011591c177995a541a4d56aae47ed3ba9c0aa5

T-E1-011 — Bağımsız ilk okuma
Yöntem ve sınırlar
Yalnızca belirtilen görüntü manifesti ve sabit 17 soruluk JSON okundu. Manifestteki 64 PNG, listedeki sırayla, her biri ayrı ayrı ve view_image aracında original ayrıntı düzeyinde açıldı. Aynı SHA-256 değerine sahip dosyalar da tek tek açıldı; tekrarlar atlanmadı. Görseller 390×844 boyutlarında verildi; dosyalar değiştirilmedi. Kod, plan, paket, kanıt dosyası, önceki rapor, cevap anahtarı veya internet kullanılmadı.
Bu bir yapay zekâ görüntü okumasıdır; insan incelemesi veya telefon kanıtı değildir. Görseller örnek/test içeriği taşıyor.

Yanıtlar

1. Bu kayıt bugün neyi doğruluyor? Hangi bilgiler hâlâ bilinmiyor?
Ekran, bildirilen bakım sonucunu, kaydı kimin yazdığını ve kanıt/değerlendirme durumunu ayrı gösteriyor. Örneğin “işin tamamlandığı bildirildi” ifadesi, işçiliğin doğrulandığı anlamına gelmiyor; kullanıcı beyanı da doğrulanmış bakım sayılmıyor. Belgeli/incelemeli örnekte değerlendirme yalnız belirtilen iş ve kanıt kapsamını destekliyor. Gerçek işin yapılıp yapılmadığı, işçilik kalitesi ve örnekten çıkarılamayan güvenlik bilgileri hâlâ belirsiz olabilir.

2. Kaydı bir servis veya profesyonel yazdığı için otomatik olarak doğrulanmış sayılır mı?
Hayır. Ekran “Dış servis · örnek aktör” yazarı gösteriyor ve servis/profesyonel unvanının tek başına işi doğrulamadığını açıkça belirtiyor.

3. Bakımın bildirilen sonucu, kimin yazdığı ve kanıtın durumu ayrı ayrı anlaşılabiliyor mu?
Evet. Ayrı “Bildirilen bakım sonucu”, “Kaydı yazan” ve “Kanıtın durumu” bölümleri var. Örneklerde sonuç işin tamamlandığının bildirildiğini, yazarı dış servis veya kullanıcı beyanını, kanıt durumunu ise kullanıcı beyanı ya da örnek belge ve inceleme girdisi olarak ayırıyor. Bunların hiçbiri tek başına işin doğrulandığı anlamına gelmiyor.

4. Kaydın hangi motosiklete ait olduğunu, tarihini ve dayandığı kaynağı bulabiliyor musun?
Görünen örnek kayıtta motosiklet “Örnek motosiklet”, tarih “03.10.2026 · örnek tarih”; yazan taraf “Dış servis · örnek aktör”. “Kaynak ayrıntısını aç” düğmesi daha fazla kaynak bilgisine gidiyor. Açık kaynak ayrıntısı örneğinde kaynak “Örnek kaynak · test verisi”, kaynak sürümü “örnek-r1”, kayıt kimliği “record-example”, kayıt sürümü “record-r1” ve değerlendirme sürümü “evaluation-r1” gösteriliyor. Bunlar test değerleri; gerçek bir motosiklet kaydı olarak yorumlanmamalı.

5. Bir kayıt düzeltilince önceki bilgiler korunuyor mu? Son yazılan bilgi kendiliğinden kesin doğru sayılır mı?
Önceki ve yeni bilgi, değişiklik zamanı ve gerekçeyle birlikte korunuyor; eski bilgi silinmiyor. Örnekte önceki “İşin bir bölümü açık kaldı”, yeni “Kalan bölümün yapıldığı bildirildi”; zaman “04.10.2026 · örnek düzeltme zamanı” ve gerekçe ilk beyanın kapsamını açıklamak. Yeni bilgi kendiliğinden kesin doğru sayılmıyor; güncel değerlendirmeyle geçerliliği ayrılıyor. Ayrıca ekran, güncel değerlendirme yoksa son yazılan kaydın kendiliğinden kesin doğru sayılamayacağını söylüyor.

6. Kanıt geri çekilince eski iz ile bugün geçerli değerlendirme nasıl ayrılıyor?
Kanıtın geri çekildiği belirtiliyor ve bugünkü değerlendirme eski izden ayrı yeniden ele alınmalı. Geri çekilen kanıtın bugünkü değerlendirmede ayrıca ele alınacağı; eski iz ve bağımsız kayıtların sessizce silinmeyeceği yazıyor.

7. İtiraz veya çelişki çözülmediyse ekran bir tarafı kesin doğru gösteriyor mu?
Hayır. İtirazlı örnekte “İtiraz sürüyor; sonuç kesin değil” ve çelişkinin çözülmediği, bir tarafın kesin doğru veya kazanan gösterilmediği yazıyor. Yeterli bilgi olmayan örnekte de sonuç açık bırakılıyor.

8. Güvenlik açısından önemli kayıtta iddia, kanıt, inceleyen kişi ve bilinmeyenler açıkça görünüyor mu?
Evet. Önemli kayıt kartı, kaynak/inceleyen/belirsizlik bilgilerinin gizli ayrıntıya bırakılmadığını söylüyor. Görüntüde kaynak “Örnek bakım kaydı ve kaynak açıklaması · test verisi”, inceleyen “Örnek inceleyen · test verisi”; bilinmeyenler ise işçilik ve fiziksel güvenliğin bu örnekten kesinleştirilemeyeceği olarak yazıyor. Bildirilen sonuç ve kanıt durumu da ayrı bölümlerde.

9. Kaynak ve değişikliklerin ayrıntısını gerektiğinde açabiliyor musun?
Evet. “Kaynak ayrıntısını aç” ve “Değişiklik geçmişini aç” düğmeleri var. Kaynak ayrıntısı açık örnekte kaynak, sürüm, kayıt kimliği, değerlendirme sürümü, konum ve kontrol zamanı gösteriliyor. Düzeltme örneğinde eski/yeni bilgi, değişiklik zamanı ve gerekçe açılmış durumda.

10. Geçmişte ilgili kaydı nasıl bulup ayrıntısını açarsın?
Bakım geçmişinde bakım adı, tarih veya bildirilen sonuçla arama alanı var. “Tüm kayıtlar”, “Düzeltme geçmişi olanlar” ve “İtirazı sürenler” seçimleri görünüyor. Sonuç kartındaki “Kaydın ayrıntısını aç” düğmesi kaydı açıyor.

11. Motosiklet pasif olsa veya ücretli paket değişse temel geçmişin erişimi kapanır mı?
Ekrana göre kapanmıyor. Pasif motosiklet uyarısı, temel geçmiş/kaynak/kopya kapsamının yeni bakım başlatma hakkından ayrı olduğunu belirtiyor. Ayrıca temel geçmiş ve kaynak bilgisinin ücretli pakete bağlı olmadığı ve geriye dönük kapanmadığı yazıyor. Bu, ekranda açıklanan ürün davranışıdır; görseller dışında ayrıca doğrulanmış bir hizmet garantisi değildir.

12. Dışarı aktarılacak kopya hangi motosikleti, kayıtları ve bilgileri içeriyor? Neler dışarıda kalıyor?
Örnek kapsam, “Örnek motosiklet · kullanıcı beyanı” için 03.10.2026 tarihli “Yağ bakımı” kaydını gösteriyor. Kopyaya bakım işi, bakım tarihi, bildirilen sonuç, kaydı yazan, kaynak, kanıt, bugünkü değerlendirme ve düzeltme/itiraz geçmişi giriyor; kayıt ve değerlendirme sürümleri de listeleniyor. İnceleyen, bilinmeyenler, ek açıklama ve iletişim bilgileri dışarıda kalıyor. Temel geçmiş ve kopya kapsamının ücretli pakete bağlı olmadığı belirtilmiş.

13. Geçmişi görme izni, dışarı aktarma izni de veriyor mu?
Hayır. Ekran geçmişi görme izninin dışarı aktarma izni vermediğini; güncel dışarı aktarma izninin ayrıca kontrol edildiğini söylüyor. İzin yoksa kopya isteği düğmesi kapalı.

14. Kopya oluşturmak asıl kayıtları değiştirir veya siler mi?
Hayır. Ekran, kopya oluşturmanın asıl kayıtları değiştirmeyeceğini veya silmeyeceğini açıkça belirtiyor.

15. Bir paylaşım bağlantısını iptal etmek daha önce indirilen veya gönderilen kopyaları da geri alır mı?
Hayır. Önceden indirilmiş, gönderilmiş veya basılmış kopyaların geri alınamayacağı; bilgi dışarı taşındıktan sonra her kopyanın kontrol edilemeyebileceği yazıyor.

16. Dışarı aktarma sonucunun bilinmediği durumda tekrar gönderim mi, aynı isteğin sonucunu kontrol etme mi sunuluyor?
Aynı isteğin sonucunu kontrol etme sunuluyor: “Aynı isteğin sonucunu kontrol et”. Ekran başarı veya başarısızlığın tahmin edilmediğini ve isteğin yeniden gönderilemeyeceğini söylüyor. Hata durumunda da önce güncel sonucu kontrol etme isteniyor; yeni gönderim kapalı.

17. Başka motosiklete ait, eski veya eksik kaynak özel kayıt içeriğini ve işlem iznini açıyor mu?
Görüntüler, kayıt/sürüm/güncel okuma izni eşleşmediğinde kaydın açılmadığını, özel bilginin gösterilmediğini ve başka bir kaydın seçilmiş gibi sunulmadığını belirtiyor. Eski kopya da güncel kayıt veya işlem izninin yerine geçmiyor; güncel kaynak ve okuma izni ayrıca kontrol edilmeli. Eksik kopya kapsamı doğrulanmadığında dosya isteği gönderilmiyor. Ancak başka motosiklet/eski/eksik kaynak nedenleri için verilen katalog ekranları aynı görüntü içeriğine sahip; her nedenin ayrı ayrı nasıl ayırt edildiği bu görüntülerden okunamıyor.

Okunabilirlik ve anlam sınırları
- catalog-missing, catalog-held, catalog-stale ve catalog-foreign dosyaları aynı SHA-256 değerini ve aynı genel “Güncel geçmiş henüz kullanılamıyor” ekranını gösteriyor. Ekran bunun boş geçmiş veya tamamlanmış tüm bakım anlamına gelmediğini söylüyor; fakat bu dört durumun nedeni görselde ayrıştırılmıyor.
- detail-no-source, detail-field-denied ve detail-missing dosyaları da aynı SHA-256 değerine ve aynı “Kayıt şu anda açılamıyor” mesajına sahip. Ayrı hata nedenleri görüntüden seçilemiyor.
- Bazı kaydırma parçaları önceki parçayla aynı metin alanlarını tekrar gösteriyor. Her parça yine ayrı açıldı; yanıtlar görünen örtüşen metni birleştirerek verildi.
- Test verisi gerçek bakım, kaynak, servis, inceleyen kişi veya telefon kaydı kanıtı değildir.

Root17yanıtın tamamını anlamca doğru buldu. Okuyucunun dört katalog/üç ayrıntı ortak mesaj sınırlaması aynen korunur; eşit görüntüler ayrı görsel tasarım diye sunulmaz. Güncel/eksik/held/eski/yabancı kapanmanın kesin arıza nedeni E1 tarafından tahmin edilmez. Bütün bağımsız incelemeci bu sınırlamayı ayrıca değerlendirir. İncelemeci tüm64R5PNGyi ayrı ayrı original açmıştır; root yöntemi yukarıda farklı ve açıktır.


`vault/PROFILES/history-render.md`; `vault/PACKS/P-E1-011.md`; `vault/REGISTRY/T-E1-011.md`; `vault/EVIDENCE/E-DEV-109.md`.

## İlk mimari kontrol kaydı düzeltmesi

İlk run_all gerçekFAIL: gate_verdict için kapalı sözlük dışında REVIEW yazılmıştı. İnceleme bekleyen kanıtın doğru sözlüğü RECORDED olarak düzeltildi; görev/profil REVIEW ve kabul bekleniyor anlamı korunur. Kontrol gevşetilmedi. HamilkFAIL günlük kavriva_e1011_graph_initial_FAIL.log / RAW SHA256 ba2a213d7a551addc7633281b10e0d95d0a0d88130ca62a657fe3e2511e7c4ee aynen korunur. Sonraki gerçek kontrol sonucu ayrıca kaydedilir.

## Kaynak dondurulmadan gerçek yapısal kontrol

run_all12kontrol+42koruma worst0; strictlinks4688; oluşturulmuş registry101satır/REVIEW routing; exact14adres/28tabanpini, eski esas gövdeler ve hamv75 eşitliği denetlendi. Kontrol sözlüğü hatası yukarıdaki ilkFAIL arşivinde korunur. Şu günlükler gerçek başarıdır; GitHub CI henüz başlamadı:
- kavriva_e1011_run_all.log /RAW SHA256 51415ba7688c07576a1d9db9e25a471a999f4680d70072b56eb5c7264993487e
- kavriva_e1011_strict_links.log /RAW SHA256 8bc9936b7b6aca7985597cb65447d5d95edb92ff1417cc638e1573ef136bb5c3
- kavriva_e1011_index.log /RAW SHA256 3f8e66596027606fed02097d96279c8440bfb78410a11dfb55d1330847929ddf
- kavriva_e1011_routing.log /RAW SHA256 d3dc6defdcee0c37edd3ffcfeefa93c19030fb8b4b1aca169e47ca6d75d86b77
