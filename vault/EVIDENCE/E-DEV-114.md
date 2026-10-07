---
test_id: E-DEV-114
version: 1
purpose: İsteğe bağlı profil, açık taşıma kapsamı ve geri alınabilir paylaşımı sunmak
domain: profile-collaboration
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, ADR-008, C1.8, F1.8.1, SCR-006, SCR-007, SCR-034, BR-101, BR-141, BR-142, BR-143, BR-147, CON-001, CON-002, CON-003, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: profile-collaboration-presentation
tasks: [T-E1-015]
tests: [modules/e01-app/internal/shell/test/profile_collaboration_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-07
depends_on: [V-E1-PROFILE-001]
used_by: [V-E1-PROFILE-001, P-E1-015, T-E1-015]
evidence: []
supersedes: []
status: RECORDED
contract_id_version: "SCR006 SCR007 SCR034 C1.8/F1.8.1/FL1.8.1 profile v1 REVIEW"
subject_file: modules/e01-app/internal/shell/lib/profile_collaboration.dart
subject_digest: a2389d55edcffd0887ae1ca801373e96f56791e60e7513c35f061727c38069da
result: "Yerel345 normal ve ayrı1 native PASS; bağımsız kabul bekleniyor"
gate_verdict: "RECORDED - bağımsız görev kabulü bekleniyor"
reviewer: none
timestamp: 2026-10-07
evidence_links: [vault/PROFILES/profile-collaboration-render.md, vault/PACKS/P-E1-015.md, vault/REGISTRY/T-E1-015.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-113-E10-GOVERNED-PATHS-FOR-T-E1-015.md.snapshot, modules/e01-app/internal/shell/lib/profile_collaboration.dart, modules/e01-app/internal/shell/test/profile_collaboration_test.dart, modules/e01-app/internal/shell/test/fixtures/profile_collaboration_reading_questions.json]
---

# Profil, kayıt taşıma ve paylaşım sunumu

T-E1-015 / FL1.8.1 / F1.8.1 / C1.8 / SCR006, SCR007 ve SCR034. Plan kaynağı `fa914f013fdcd032faed876689092da245989459`. Kanonik kabul yöntemi REVIEW; matrisin NONE satırı yöntem atamasına tabidir. Sonuç: taşıma önizlemesi, sessiz kayıp olmaması ve geri alınabilir paylaşım. Tek sert bağımlılık T-E1-001 gerçek DONE. Başlangıç gerçek ana kod `9f02dc013bff0d49256dcbb030a9d68d94603085`; 102 sınırlı DONE, 104 kalan, toplam 206. Bu kayıt yeni kabul değildir.

## Sunum ve kaynak sınırı

E1 gerçek hesap, oturum, taşıma veya davet üretmez. Değişmez yerel kapsam, hesap ve motosiklet kimlik/revizyon çiftleri ile tam belge girdisini tüketir. Belge konusu; bütün alanlar, kayıtların sırası ve içeriği, hedef kişi, durum ve revizyonu kayıpsız UTF16 uzunluk/hex kodlamasıyla içerir. Yapısal alan/kayıt sayıları ayrıdır; bozuk Unicode başka kimlikle aynı sayılmaz. Tekrarlanan kayıt veya normalize edilmiş alan anahtarı reddedilir.

Özel verinin okunması için güncel belge kaynağı ve dört bağlam/kaynak/kimlik/politika okuma referansı gerekir. Her özel alan ve kayıt ayrıca kendi referansını ister. Tam kapsam, istek, amaç ve konu eşleşmeyen; eski, HELD veya unknown kaynak özel veriyi açmaz. Handler, rol etiketi veya çıplak ALLOW izin değildir. Eksik bir alanın izni diğer alanlardan ödünç alınmaz.

Profil isteğe bağlıdır. Profil bilgisi eksikken yerel devam ve destek veri taşımayan niyet olarak açıktır; bunlar hesap veya taşıma otoritesine bağlı değildir. Ancak dış handler yoksa bütün dış eylemler kapalıdır: bu sunum gerçek router veya yerel depoya erişim kanıtı değildir. Dil, birim ve erişilebilirlik için hesap şartı getirilmez.

Taşıma öncesinde kapsam ve yerel/profil kayıtları ayrı kaynak, tarih ve fark açıklamasıyla gösterilir. Çakışmada otomatik kazanan veya overwrite üretilmez. Kısmi, başarısız ve geri dönüş durumları tamamlanma değildir. Yerel kaynağın korunması burada ürün gereğidir; gerçek kalıcılık/yazıcı henüz bu bileşene bağlı değildir. İptal etmek silme niyeti üretmez. Tamamlandı başlığı yalnız ayrı güncel sonuç referansıyla açılır.

Sahip ve yardımcı ayrıdır. Rol etiketi doğrulanmış gerçek veya izin değildir. Kişi, sınırlı erişim, katkı sahibi ve zaman görünür. Ayrıntılar kademeli açılır; hesap veya belge değişince kapanır. Eski ayrıntı callback'i yeni bağlamı açamaz. Özel hesap bilgileri ve paylaşılan motosiklet alanları ayrı açıklanır. Erişimi kaldırma gelecekteki erişim içindir; önceki katkı sahibini, zamanını ve kanıtını silmez. Kaldırıldı sonucu yalnız ayrı güncel sonuç referansından gösterilir.

Profil oluşturma, taşıma kontrolü, davet ve erişimi kaldırma yalnız çevrimiçi, uygun durum, güncel bütün özel alanlar, ayrı eylem referansı ve altı etki referansıyla dış değerlendirme niyeti iletir. Çakışma incelemesi okuma niyetidir; yazma yetkisi veya çevrimiçi zorunluluğu değildir. Niyet gerçek ürün mutasyonu değildir. Eski callback güncel yerel/tam kapsamı, istek, belge, ekran, bağlantı durumu, handler ve izinleri yeniden denetler. Aynı yerel kapsam/istek/eylem tekrar gönderilmez; içerik veya hesap değişimi kilidi açmaz. Gönderildi mesajı yeni bağlama taşınmaz.

## Yerel kanıt

Koddan önce `8bfec443fcfb03265c2b7071c29c7102cdbb82a2`, kod `f2bddc2b3df3ef1dceba55fd8f7af1832e4bf51d`. Önceki 321 normal test korunarak 24 yeni testle toplam 345 PASS. Strict format 36 dosya, sıfır değişiklik; analyze sıfır bulgu. Native çizim ayrı bir testtir ve PASS; normal toplamına eklenmez. 23 durum × 3 ekran genişliği × 3 yazı ölçeği = 207 gerçek düzen. 320/390/768 genişlik, 1/2/3 yazı; bütün kaydırma sonları, en az 52 yükseklikte eylemler ve gerçek yerel çıkış tıklaması denetlendi. Gerçek Tab/Enter/Space, başlık, disabled button ve liveRegion doğrulandı. Çizilmiş metin kontrastı en az 4.5 ve gerçek birincil odak kontrastı en az 3.

Native 390×844 tam kaydırma 38 PNG. Root 30 farklı orijinal görüntüyü açtı; kalan sekiz RAW SHA256/bayt eşitliğiyle bu görüntülere bağlandı. K01/K02/K03 pinned orijinallerinin üçü de Root tarafından açıldı ve handoff RAW özetleriyle eşleşti. Sabit SDK Roboto yalnız test fontudur; nihai font/token/nav/logo/ikon kararı değildir.

## Korunan hata geçmişi

İlk hedef koşu 18 PASS. Klavye ve duyarlı kontroller eklenince ikinci ve üçüncü hedef koşularda 19 PASS / 1 FAIL: test kökünde WidgetsApp Tab kısayol altyapısı yoktu. Ek pump bunu çözmedi. Gerçek WidgetsApp bağlamıyla klavye testi yeniden 1 PASS; ürün kodundaki klavye davranışı gevşetilmedi. İlk tam koşu 345 PASS ve analyze sıfırdı; test senaryoları genişletilirken strict format sıfır değişiklik şartı henüz sağlanmadı. Bu ara sonuç kabul kanıtı yapılmadı. Format sonrası güncel R2 tam 345 PASS, analyze sıfır ve format 36/0. Native R1 tek kayıt örnekleriydi; R2 ayrı yerel/profil kaydı ve açılmış ayrıntı/gönderildi durumlarını kapsar. R1 dosyaları korunur; R1/R2 tamamı byteequal iddiası yoktur.

## Yedi tasarım kapısı

| Kapı | Kanıt ve sınır |
|---|---|
| Bütün ekran | 38 tam kaydırma görüntüsü; 30 orijinal açım ve sekiz RAW eşitliği. Son eylemler ve destek görülür. |
| Ekranlar arası | K01 isteğe bağlı sade profil; K02 anlaşılır kapsam ve fark; K03 basit paylaşım ayrıntıları. Kabul edilmiş E1 çalışma dili korunur. |
| Durum | Hazır, eksik, eski, çevrimdışı, alan izni eksik, gönderildi, açılmış ayrıntı, çakışma, kısmi, başarısız, geri dönüş, tamamlanma ve kaldırılma. |
| Duyarlı | 207 gerçek düzen; tam kaydırma, 52 hedef ve gerçek çıkış tıklaması. Native yalnız 390×844. |
| Erişilebilirlik | Gerçek klavye, başlık/button/liveRegion ve renk kontrastı. OS ve gerçek ekran okuyucu testi HELD. |
| Regresyon | Önceki 321 test aynı 345 koşuda başarılı; 64 taban pini ve eski kanıt gövdeleri korunur. |
| Kaynak/varyasyon | REF-PROFILE-001 üç pinned kaynak. Hero, garanti veren güvenlik rozeti, teknik diff duvarı veya enterprise yönetim konsolu yok. Nihai tasarım, nav ve cihaz HELD. |

## Açık kabul sınırı

20 soru koddan önce sabitlendi. Geçmişsiz bağımsız gpt-6-luna/max yalnız gerçek ekranlar ve soruları okuyor; rapor henüz kaydedilmedi. İlk okuma insan, cihaz veya üretim kanıtı değildir. Bütün görev REVIEW hükmü ve gerçek aynı kaynak CI/T3, ayrı son metadata incelemesi ve aynı son CI/T3 gerekir. Normal merge ve fetched ana kodun sekiz kontrolü olmadan ana sayı ilerlemez. DEC0068/69 ve sahibin açık sürekli yetkisi geçerli; birleşmemiş DEC0070 otorite değildir. T-E3-001-R1 REVIEW ve T-E5-003 IN_PROGRESS korunur. Üretim kimlik/yetki/taşıma/paylaşım yazıcıları, Supabase47/57/59, RET97, fiziksel işlem, gerçek nav/cihaz ve yayın HELD.

## Sabit kimlikler

Kod LF SHA256 a2389d55edcffd0887ae1ca801373e96f56791e60e7513c35f061727c38069da; test LF SHA256 248ba91e3ccc5aff4ea46e36df59a2751c07d6355a7d2d96b6c6b95c31d1b256; 20 soru LF SHA256 f667cbbcc647756a3b152af76494b5f7a1925ddf9039389ba49adadaafe3c3ae. Ham v80 213576 bayt / RAW SHA256 c29e781ee0b898486e3bd1050b8c7c78d631aa5d16fc7ae49680aa430a47d8a0.

## Güncel native RAW kimlikler

- kavriva_e1015_native_R2-intro-requested-0.png / intro-requested / RAW SHA256 489663acd27836512fd4497e1aebe29f8b7c5ea5d06d3fbaa80d433be0f53e6f / 68163 bayt / 390×844 / offset 0.0 / end 0.0 / Root orijinali açtı
- kavriva_e1015_native_R2-collaboration-expanded-0.png / collaboration-expanded / RAW SHA256 320412e9c9845a7b7237091d5f60443e294dd8dbd6b71130db746f8a34c708df / 68249 bayt / 390×844 / offset 0.0 / end 505.0 / Root orijinali açtı
- kavriva_e1015_native_R2-collaboration-expanded-1.png / collaboration-expanded / RAW SHA256 fa0f6b31b3edd44f0f974ca2ea31da89491cdec557375c35dfba73d2324c4b08 / 63101 bayt / 390×844 / offset 505.0 / end 505.0 / Root orijinali açtı
- kavriva_e1015_native_R2-intro-ready-0.png / intro-ready / RAW SHA256 743a641b3dd55000a2063b4f76a0b36f4039e05f96e44258bc96ed199fd64d5c / 62334 bayt / 390×844 / offset 0.0 / end 0.0 / Root orijinali açtı
- kavriva_e1015_native_R2-intro-unknown-0.png / intro-unknown / RAW SHA256 984df0772beb1bc2c8c9c46160bc39d88ffea2700040e243e213ec544ff1f338 / 59502 bayt / 390×844 / offset 0.0 / end 0.0 / Root orijinali açtı
- kavriva_e1015_native_R2-intro-stale-0.png / intro-stale / RAW SHA256 984df0772beb1bc2c8c9c46160bc39d88ffea2700040e243e213ec544ff1f338 / 59502 bayt / 390×844 / offset 0.0 / end 0.0 / RAW eşit: kavriva_e1015_native_R2-intro-unknown-0.png
- kavriva_e1015_native_R2-intro-offline-0.png / intro-offline / RAW SHA256 1930fb3c2fb57a6d8e40d32808fa63b84355a9303eb1b24acab20a7058be713d / 69171 bayt / 390×844 / offset 0.0 / end 0.0 / Root orijinali açtı
- kavriva_e1015_native_R2-intro-private-held-0.png / intro-private-held / RAW SHA256 6818de271a768712d0498e6acc6aafe703daf7c4f3371349a0eecbb327bba0fe / 59102 bayt / 390×844 / offset 0.0 / end 0.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-ready-0.png / migration-ready / RAW SHA256 c0e85ad3ef731ff4a43adac31b2a6ae582a37064fcb53403f8d79102e04bdf28 / 71910 bayt / 390×844 / offset 0.0 / end 184.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-ready-1.png / migration-ready / RAW SHA256 e45a0dc8a23e7f08cbe6d65ac239a7db90112b0c39f4531a31dc47557f0a1924 / 69351 bayt / 390×844 / offset 184.0 / end 184.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-unknown-0.png / migration-unknown / RAW SHA256 1f20748daa81853dd26d62ac212411caa1ae54a7b51db9354465c2c2b1513775 / 56158 bayt / 390×844 / offset 0.0 / end 0.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-stale-0.png / migration-stale / RAW SHA256 1f20748daa81853dd26d62ac212411caa1ae54a7b51db9354465c2c2b1513775 / 56158 bayt / 390×844 / offset 0.0 / end 0.0 / RAW eşit: kavriva_e1015_native_R2-migration-unknown-0.png
- kavriva_e1015_native_R2-migration-offline-0.png / migration-offline / RAW SHA256 e6d4e210180e6bd9aae1129fc0c127367b6b1c466aade232d184936ebcac033d / 71893 bayt / 390×844 / offset 0.0 / end 242.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-offline-1.png / migration-offline / RAW SHA256 bdf828fcdf467b3a4203c85d23bf116137e3c2cf825218921fb0e4a634d09c74 / 70153 bayt / 390×844 / offset 242.0 / end 242.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-private-held-0.png / migration-private-held / RAW SHA256 54def6bf73e6f632ed7a583ba5f83127da442fe4a3efd5384e12634aaa8ae10e / 70574 bayt / 390×844 / offset 0.0 / end 149.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-private-held-1.png / migration-private-held / RAW SHA256 6212dba9bc09afefb4298a60dac67f8e7a0aa69db80a8a18a47dfdbe6c2b819a / 68933 bayt / 390×844 / offset 149.0 / end 149.0 / Root orijinali açtı
- kavriva_e1015_native_R2-collaboration-ready-0.png / collaboration-ready / RAW SHA256 325fabcd89dcf689f065bb42c1487d6a66adb00f3ca928178db2186154c51859 / 67358 bayt / 390×844 / offset 0.0 / end 351.0 / Root orijinali açtı
- kavriva_e1015_native_R2-collaboration-ready-1.png / collaboration-ready / RAW SHA256 0708b07ee7c92b8ff59e87c0f7cff8454ec8f77f24b6d104f88b3f2a671defef / 64903 bayt / 390×844 / offset 351.0 / end 351.0 / Root orijinali açtı
- kavriva_e1015_native_R2-collaboration-unknown-0.png / collaboration-unknown / RAW SHA256 798108d735015d4e36cb82d165e7376999865e3b4b086abcb9a30891cc150ec5 / 66922 bayt / 390×844 / offset 0.0 / end 56.0 / Root orijinali açtı
- kavriva_e1015_native_R2-collaboration-unknown-1.png / collaboration-unknown / RAW SHA256 84e8733eaaab7fd53201c4d29ef4859a7bb4e1a1c706401ed7f20bdfb59fa9b1 / 64549 bayt / 390×844 / offset 56.0 / end 56.0 / Root orijinali açtı
- kavriva_e1015_native_R2-collaboration-stale-0.png / collaboration-stale / RAW SHA256 798108d735015d4e36cb82d165e7376999865e3b4b086abcb9a30891cc150ec5 / 66922 bayt / 390×844 / offset 0.0 / end 56.0 / RAW eşit: kavriva_e1015_native_R2-collaboration-unknown-0.png
- kavriva_e1015_native_R2-collaboration-stale-1.png / collaboration-stale / RAW SHA256 84e8733eaaab7fd53201c4d29ef4859a7bb4e1a1c706401ed7f20bdfb59fa9b1 / 64549 bayt / 390×844 / offset 56.0 / end 56.0 / RAW eşit: kavriva_e1015_native_R2-collaboration-unknown-1.png
- kavriva_e1015_native_R2-collaboration-offline-0.png / collaboration-offline / RAW SHA256 6c30f8c869b6080afeec4b4a089242f8105a6ba82051095ea772c3481bbba180 / 67418 bayt / 390×844 / offset 0.0 / end 409.0 / Root orijinali açtı
- kavriva_e1015_native_R2-collaboration-offline-1.png / collaboration-offline / RAW SHA256 9d6228371555bf61fbcd4e903bb02df4917e6c9ea6350817449f3fa3cef8a1b5 / 64692 bayt / 390×844 / offset 409.0 / end 409.0 / Root orijinali açtı
- kavriva_e1015_native_R2-collaboration-private-held-0.png / collaboration-private-held / RAW SHA256 b6395eeafcae8915312578a21da62de7ed15f6f726be116b69a6c3496373f8ca / 66413 bayt / 390×844 / offset 0.0 / end 316.0 / Root orijinali açtı
- kavriva_e1015_native_R2-collaboration-private-held-1.png / collaboration-private-held / RAW SHA256 aa327beecfda6efd7e22b37d683ba4b6f1eeefe791ac6d88bc95dfc6e1a46201 / 65002 bayt / 390×844 / offset 316.0 / end 316.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-conflict-0.png / migration-conflict / RAW SHA256 e55b58ee6d4221ca2215f3ddc5adca7b86e8def1c0c0717aaa6c24b4e94908b9 / 69112 bayt / 390×844 / offset 0.0 / end 317.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-conflict-1.png / migration-conflict / RAW SHA256 e573bab2d589b617b65268c8f8f7091257688e9fc464a2ead5746091a3f05b85 / 65770 bayt / 390×844 / offset 317.0 / end 317.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-partial-0.png / migration-partial / RAW SHA256 088a96709c48c7b882523742ff833ca63f0d314806d02c95bc2a87039b82c1cb / 67738 bayt / 390×844 / offset 0.0 / end 271.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-partial-1.png / migration-partial / RAW SHA256 e573bab2d589b617b65268c8f8f7091257688e9fc464a2ead5746091a3f05b85 / 65770 bayt / 390×844 / offset 271.0 / end 271.0 / RAW eşit: kavriva_e1015_native_R2-migration-conflict-1.png
- kavriva_e1015_native_R2-migration-failed-0.png / migration-failed / RAW SHA256 990c363d0cafe721cf60456af5ce9178111ad983dfd89fe295eaf63fff5e16bb / 68841 bayt / 390×844 / offset 0.0 / end 271.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-failed-1.png / migration-failed / RAW SHA256 e573bab2d589b617b65268c8f8f7091257688e9fc464a2ead5746091a3f05b85 / 65770 bayt / 390×844 / offset 271.0 / end 271.0 / RAW eşit: kavriva_e1015_native_R2-migration-conflict-1.png
- kavriva_e1015_native_R2-migration-rollback-0.png / migration-rollback / RAW SHA256 9b19553957d5c498f4e7c771fc35d0702bb925026f6b9bc5c3d207466db11359 / 70852 bayt / 390×844 / offset 0.0 / end 271.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-rollback-1.png / migration-rollback / RAW SHA256 e573bab2d589b617b65268c8f8f7091257688e9fc464a2ead5746091a3f05b85 / 65770 bayt / 390×844 / offset 271.0 / end 271.0 / RAW eşit: kavriva_e1015_native_R2-migration-conflict-1.png
- kavriva_e1015_native_R2-migration-completed-0.png / migration-completed / RAW SHA256 1bcbe0054365222356941a78adfa18fcb33bc138318df09ed315b476b3e81e4d / 68536 bayt / 390×844 / offset 0.0 / end 271.0 / Root orijinali açtı
- kavriva_e1015_native_R2-migration-completed-1.png / migration-completed / RAW SHA256 6d1a35f7158c07856e2cd9f5ab0d9b1d4f096d07c08eb5904f68ca268bd9f94a / 63933 bayt / 390×844 / offset 271.0 / end 271.0 / Root orijinali açtı
- kavriva_e1015_native_R2-collaboration-revoked-0.png / collaboration-revoked / RAW SHA256 a658ede6e9cf67dc826e273dfdf636e3655cf5f75c8095035c8aee245e6ea507 / 69501 bayt / 390×844 / offset 0.0 / end 397.0 / Root orijinali açtı
- kavriva_e1015_native_R2-collaboration-revoked-1.png / collaboration-revoked / RAW SHA256 aa327beecfda6efd7e22b37d683ba4b6f1eeefe791ac6d88bc95dfc6e1a46201 / 65002 bayt / 390×844 / offset 397.0 / end 397.0 / RAW eşit: kavriva_e1015_native_R2-collaboration-private-held-1.png

## Ham günlükler

- kavriva_e1015_analyze_R1.log / RAW SHA256 9d4f253e32c6da69fd914f1bead47c1db0947ae72adb13a9a83a3d7aafbd9942 / 385 bayt
- kavriva_e1015_analyze_R2.log / RAW SHA256 ae6a483b8aa8d709b111227fedc92762e549d4ab8b34f0cf6249470734bfec1c / 385 bayt
- kavriva_e1015_format_R2.log / RAW SHA256 932a85d284ebe7ef30290253a0dde5a3bd9a7a07034abcca69f1a4162c4d7121 / 49 bayt
- kavriva_e1015_full_R1.log / RAW SHA256 4714f8b030da13f4f8929c86ab3cb2e93ed67f7798967f3d138cfe299dc618f4 / 77686 bayt
- kavriva_e1015_full_R2.log / RAW SHA256 f2177d33cd01a3501c40d88852f8aaf448564c469000eb56bbf113c3d5ec7fd3 / 78128 bayt
- kavriva_e1015_keyboard_R4.log / RAW SHA256 f73b941761a443cd799a2a1ce7771ba008353ba0646a9535684acb7442f96d77 / 567 bayt
- kavriva_e1015_native_R1.log / RAW SHA256 b0e3b2d040047f2239fade7ec8c5e2f670edbe2f7a01b355b828544b483f7c57 / 552 bayt
- kavriva_e1015_native_R2.log / RAW SHA256 b0e3b2d040047f2239fade7ec8c5e2f670edbe2f7a01b355b828544b483f7c57 / 552 bayt
- kavriva_e1015_R1_analyze.log / RAW SHA256 96ca7b81931b25fe0c5a184f87798a2456a80d78dc5c940d93b77fd2e7dee7e9 / 98 bayt
- kavriva_e1015_target_R1.log / RAW SHA256 f52420aa7f6fad26e990de01ceb2682c5df76697378b06ef6e2993fef90fd9d7 / 2010 bayt
- kavriva_e1015_target_R2.log / RAW SHA256 1e9f529c8470ab9b06fe5daa3de20d74dfb8e229e850c14cd691f6929ca169d3 / 4163 bayt
- kavriva_e1015_target_R3.log / RAW SHA256 efc2759cca440e1941f5eb03cce2ed71bb8429ce84afd1eeb53f36a721efeb75 / 4163 bayt

## Pinned kaynak görseller

[
  {
    "plan": "fa914f013fdcd032faed876689092da245989459",
    "reference": "refernces/kavriva_profil_oluşturma_ekranı.png",
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1015_readahead_K01.png",
    "bytes": 1806400,
    "sha256": "c3f0623cb425cb32ecff7711571b580b776c9eff5cbebbe4bbcc66b4660f74d8",
    "dimensions": [
      941,
      1672
    ],
    "rootOriginalOpened": true
  },
  {
    "plan": "fa914f013fdcd032faed876689092da245989459",
    "reference": "refernces/K02-SCR-007-Migration-Scope-Conflict-Review.png",
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1015_readahead_K02.png",
    "bytes": 145239,
    "sha256": "165861a5d897629c2b9511c662cfe8014384b627b4058e878cfc306e5277d0fe",
    "dimensions": [
      887,
      1774
    ],
    "rootOriginalOpened": true
  },
  {
    "plan": "fa914f013fdcd032faed876689092da245989459",
    "reference": "refernces/K03-SCR-034-Collaboration-Management.png",
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1015_readahead_K03.png",
    "bytes": 114231,
    "sha256": "136ab04ad59c138fb1e200fb8a88fa81032639da5618820c344496cd7d1cbfa6",
    "dimensions": [
      887,
      1774
    ],
    "rootOriginalOpened": true
  }
]


`vault/PROFILES/profile-collaboration-render.md`; `vault/PACKS/P-E1-015.md`; `vault/REGISTRY/T-E1-015.md`; `vault/EVIDENCE/E-DEV-114.md`.

## Geçmişsiz bağımsız ilk okuma

/root/e1015_first_reading, gpt-6-luna/max. 20 yanıtın tümü görünen ekranlardan anlamca doğru; kaynak ve tarih farkını, isteğe bağlı profili, tamamlanmama ve gelecekteki erişim/geçmiş ayrımını yardımsız çıkardı. Root tam özgün raporu okudu. 38 yol /30 farklı RAW görüntü; sekiz eşitlik. Rapor statik ekran, insan/cihaz/üretim kanıtı değildir. Bütün görev REVIEW hükmü henüz yok.

### Özgün ilk okuma raporu

RAW 14526 bayt / SHA256 89a52f1119c49daea4411a71d14c608a8834821a3b4902dd6d6b8a522596593e

<pre># T-E1-015 — bağımsız ilk okuma raporu

Tarih: 2026-10-07. Bu rapor, verilen sabit 20 soruyu ve manifestteki native PNG ekranlarını tek başıma okuyarak hazırlanmıştır. PNG dosyaları özgün biçimde, yeniden boyutlandırılmadan, kolaj veya yeniden kodlama yapılmadan görüntülendi. Tam SHA256 özeti aynı olan dosyalar aynı ham PNG görüntüsüne bağlandı.

## 20 soru ve yalnız ekranlardan verdiğim yanıtlar

1. **Profil oluşturmak zorunlu mu; erteleyince hangi güvenli yolu kullanabilirim?** Hayır, isteğe bağlı görünüyor. Mevcut yerel kullanıma devam edebilirim; ekrandaki yol “Şimdilik yerel devam et”. Profil, kayıtları taşımak ve sınırlı paylaşımı değerlendirmek için sonraki adım olarak sunuluyor.
2. **Profil oluşturmadan mevcut yerel kullanıma devam edebilir miyim?** Evet. Ekran bunu doğrudan söylüyor ve yerel devam seçeneğini gösteriyor.
3. **Dil, ölçü birimleri ve erişilebilirlik için hesap açmam gerekiyor mu?** Hayır; ekranda hesap gerekmediği yazıyor.
4. **Profil isteği göndermek hesabın zaten oluşturulduğunu kanıtlar mı?** Hayır. İstek iletilmiş olsa da güncel sonuç doğrulanmadı; tamamlanmış sayılmaması ve ayrıca kontrol edilmesi gerektiği yazıyor.
5. **Taşımadan önce nelerin taşınacağını görebilir miyim?** Evet. Kaynak/hedef, kayıt türü, her kaydın kaynağı ve tarihi, görünen değerler ve kayıtların farklı olduğu gösteriliyor. Örnekte yerel cihazdaki yağ bakım kaydı 2026-10-06 tarihli ve 12.400 km; profil kaydı 2026-10-05 tarihli ve 12.000 km.
6. **İki çakışan kaydın kaynağını, zamanını ve farkını nasıl anlarım?** Taşıma kapsamındaki her kayıt ayrı gösteriliyor. Örnekte “Yerel cihaz · kullanıcı beyanı · 2026-10-06 · 12.400 km” ile “Profil · kullanıcı beyanı · 2026-10-05 · 12.000 km” yazıyor; tarih bir gün, kilometre 400 km farklı.
7. **Uygulama kendiliğinden kazanan kaydı seçip diğerinin üstüne yazar mı?** Hayır. Çakışma ekranı kayıtların ayrı kalacağını ve uygulamanın kendiliğinden kazanan seçip diğerinin üstüne yazmayacağını açıkça söylüyor.
8. **Kısmi taşıma tamamlanmış taşıma mıdır?** Hayır. “Taşıma kısmi kaldı” ekranı bunun tamamlanmış taşıma olmadığını, yerel kaynağın kullanılabilir kalması gerektiğini ve kısmi sonucun başarı diye gösterilemeyeceğini söylüyor.
9. **Taşıma başarısızsa veya geri dönülüyorsa yerel kayıtların kullanımı hakkında ne söyleniyor?** Güvenli sonuç doğrulanana kadar yerel kaynak korunmalı; kısmi/başarısız sonuç tamamlanmış taşıma sayılmamalı. Kısmi ekranda yerel kaynağın kullanılabilir kalması özellikle belirtiliyor; geri dönüş ekranının başlığı “Yerel kaynağa dönüş”.
10. **İptal etmek veya yerel kullanıma dönmek kayıtları siler mi?** Hayır. Ekranda iptal etmenin ya da yerel kullanıma dönmenin kayıtları silmek olmadığı açıkça yazıyor.
11. **İnceleme veya taşıma isteği göndermek taşımanın güvenle tamamlandığı anlamına gelir mi?** Hayır. İstek/inceleme tamamlanmayı kanıtlamaz; güvenli sonuç ayrıca doğrulanmalı ve doğrulanana kadar yerel kaynak korunmalı.
12. **Motosiklet sahibi ve davet edilmiş yardımcı aynı şey mi?** Hayır. Ekran sahibin ve davet edilen yardımcının farklı roller olduğunu belirtiyor.
13. **Yardımcı veya servis etiketi kişinin katkısının doğrulanmış gerçek olduğunu kanıtlar mı?** Hayır. Ekranda rol etiketinin katkının doğrulanmış gerçek olduğunu göstermediği yazıyor. Katkı satırında kişi, tarih ve beyan kaynağı gösterilse de bunlar tek başına gerçekliği doğrulamaz.
14. **Paylaşılan motosiklet bilgileri ve kişisel özel bilgiler aynı erişim alanı mı?** Hayır. Ekran bunların ayrı erişim alanları olduğunu söylüyor; paylaşım kapsamı ayrıca incelenmeli. Örnekte yardımcı erişimi yalnız bakım kayıtlarıyla sınırlı ve özel hesap bilgileri paylaşılmıyor.
15. **Yardımcı erişiminin kapsamını ve katkıyı kimin ne zaman yaptığını nerede görürüm?** Paylaşım/erişim ekranında “Sınırlı erişim” satırı kapsamı gösteriyor; “İzin ayrıntılarını gör” izinleri, “Katkı ve geçmiş” bölümü kişi ve tarihi, kayıt ayrıntıları da kaynak ve tarihi gösteriyor.
16. **Erişimi kaldırmak önceki katkıları ve kayıt geçmişini siler mi?** Hayır. Ekran kişinin, zamanın, kanıtın ve geçmişin silinmediğini söylüyor.
17. **Erişimi kaldırmak gelecekteki erişim açısından ne anlama gelir?** Kaldırılan kişi için gelecekteki erişim durdurulur.
18. **Güncel izin veya kaynak doğrulanamıyorsa özel bilgiler ve paylaşım işlemleri kendiliğinden açılır mı?** Hayır. İlgili ekran güncel kaynak/izin alınamadığında kişisel bilgilerle paylaşım işlemlerinin kapalı kalacağını söylüyor.
19. **Davet veya erişimi kaldırma isteği gerçek işlemin tamamlandığını kanıtlar mı?** Hayır. İstek gerçek işlemin tamamlandığı anlamına gelmez; güncel sonuç ayrıca kontrol edilir.
20. **Kaynak ve güncel durum görülebiliyor mu; görünmesi doğru veya tamamlanmış olduğunu gösterir mi?** Ekranlarda kaynak ve tarih ile istek, doğrulanmamış durum, çakışma veya tamamlanma sonucu gibi durum bilgileri görünüyor. Yalnız ekranda görünmesi doğruluk ya da tamamlanma kanıtı değil; özellikle istek ve sonuç ayrıca doğrulanmalı.

## Görüntüleme envanteri

Aşağıdaki boyutlar PNG başlığından, dosya boyutu ve SHA256 ise ham dosyalardan alınmıştır.

| Manifestteki PNG yolu | Boyut (px) | Ham bayt | SHA256 |
|---|---:|---:|---|
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-intro-requested-0.png | 390×844 | 68163 | 489663ACD27836512FD4497E1AEBE29F8B7C5EA5D06D3FBAA80D433BE0F53E6F |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-expanded-0.png | 390×844 | 68249 | 320412E9C9845A7B7237091D5F60443E294DD8DBD6B71130DB746F8A34C708DF |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-expanded-1.png | 390×844 | 63101 | FA0F6B31B3EDD44F0F974CA2EA31DA89491CDEC557375C35DFBA73D2324C4B08 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-intro-ready-0.png | 390×844 | 62334 | 743A641B3DD55000A2063B4F76A0B36F4039E05F96E44258BC96ED199FD64D5C |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-intro-unknown-0.png | 390×844 | 59502 | 984DF0772BEB1BC2C8C9C46160BC39D88FFEA2700040E243E213EC544FF1F338 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-intro-stale-0.png | 390×844 | 59502 | 984DF0772BEB1BC2C8C9C46160BC39D88FFEA2700040E243E213EC544FF1F338 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-intro-offline-0.png | 390×844 | 69171 | 1930FB3C2FB57A6D8E40D32808FA63B84355A9303EB1B24ACAB20A7058BE713D |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-intro-private-held-0.png | 390×844 | 59102 | 6818DE271A768712D0498E6ACC6AAFE703DAF7C4F3371349A0EECBB327BBA0FE |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-ready-0.png | 390×844 | 71910 | C0E85AD3EF731FF4A43ADAC31B2A6AE582A37064FCB53403F8D79102E04BDF28 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-ready-1.png | 390×844 | 69351 | E45A0DC8A23E7F08CBE6D65AC239A7DB90112B0C39F4531A31DC47557F0A1924 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-unknown-0.png | 390×844 | 56158 | 1F20748DAA81853DD26D62AC212411CAA1AE54A7B51DB9354465C2C2B1513775 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-stale-0.png | 390×844 | 56158 | 1F20748DAA81853DD26D62AC212411CAA1AE54A7B51DB9354465C2C2B1513775 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-offline-0.png | 390×844 | 71893 | E6D4E210180E6BD9AAE1129FC0C127367B6B1C466AADE232D184936EBCAC033D |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-offline-1.png | 390×844 | 70153 | BDF828FCDF467B3A4203C85D23BF116137E3C2CF825218921FB0E4A634D09C74 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-private-held-0.png | 390×844 | 70574 | 54DEF6BF73E6F632ED7A583BA5F83127DA442FE4A3EFD5384E12634AAA8AE10E |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-private-held-1.png | 390×844 | 68933 | 6212DBA9BC09AFEFB4298A60DAC67F8E7A0AA69DB80A8A18A47DFDBE6C2B819A |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-ready-0.png | 390×844 | 67358 | 325FABCD89DCF689F065BB42C1487D6A66ADB00F3CA928178DB2186154C51859 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-ready-1.png | 390×844 | 64903 | 0708B07EE7C92B8FF59E87C0F7CFF8454EC8F77F24B6D104F88B3F2A671DEFEF |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-unknown-0.png | 390×844 | 66922 | 798108D735015D4E36CB82D165E7376999865E3B4B086ABCB9A30891CC150EC5 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-unknown-1.png | 390×844 | 64549 | 84E8733EAAAB7FD53201C4D29EF4859A7BB4E1A1C706401ED7F20BDFB59FA9B1 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-stale-0.png | 390×844 | 66922 | 798108D735015D4E36CB82D165E7376999865E3B4B086ABCB9A30891CC150EC5 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-stale-1.png | 390×844 | 64549 | 84E8733EAAAB7FD53201C4D29EF4859A7BB4E1A1C706401ED7F20BDFB59FA9B1 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-offline-0.png | 390×844 | 67418 | 6C30F8C869B6080AFEEC4B4A089242F8105A6BA82051095EA772C3481BBBA180 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-offline-1.png | 390×844 | 64692 | 9D6228371555BF61FBCD4E903BB02DF4917E6C9EA6350817449F3FA3CEF8A1B5 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-private-held-0.png | 390×844 | 66413 | B6395EEAFCAE8915312578A21DA62DE7ED15F6F726BE116B69A6C3496373F8CA |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-private-held-1.png | 390×844 | 65002 | AA327BEECFDA6EFD7E22B37D683BA4B6F1EEEFE791AC6D88BC95DFC6E1A46201 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-conflict-0.png | 390×844 | 69112 | E55B58EE6D4221CA2215F3DDC5ADCA7B86E8DEF1C0C0717AAA6C24B4E94908B9 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-conflict-1.png | 390×844 | 65770 | E573BAB2D589B617B65268C8F8F7091257688E9FC464A2EAD5746091A3F05B85 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-partial-0.png | 390×844 | 67738 | 088A96709C48C7B882523742FF833CA63F0D314806D02C95BC2A87039B82C1CB |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-partial-1.png | 390×844 | 65770 | E573BAB2D589B617B65268C8F8F7091257688E9FC464A2EAD5746091A3F05B85 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-failed-0.png | 390×844 | 68841 | 990C363D0CAFE721CF60456AF5CE9178111AD983DFD89FE295EAF63FFF5E16BB |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-failed-1.png | 390×844 | 65770 | E573BAB2D589B617B65268C8F8F7091257688E9FC464A2EAD5746091A3F05B85 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-rollback-0.png | 390×844 | 70852 | 9B19553957D5C498F4E7C771FC35D0702BB925026F6B9BC5C3D207466DB11359 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-rollback-1.png | 390×844 | 65770 | E573BAB2D589B617B65268C8F8F7091257688E9FC464A2EAD5746091A3F05B85 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-completed-0.png | 390×844 | 68536 | 1BCBE0054365222356941A78ADFA18FCB33BC138318DF09ED315B476B3E81E4D |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-migration-completed-1.png | 390×844 | 63933 | 6D1A35F7158C07856E2CD9F5AB0D9B1D4F096D07C08EB5904F68CA268BD9F94A |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-revoked-0.png | 390×844 | 69501 | A658EDE6E9CF67DC826E273DFDF636E3655CF5F75C8095035C8AEE245E6EA507 |
| C:/Users/Xpike/AppData/Local/Temp/kavriva_e1015_native_R2-collaboration-revoked-1.png | 390×844 | 65002 | AA327BEECFDA6EFD7E22B37D683BA4B6F1EEEFE791AC6D88BC95DFC6E1A46201 |

## Ham bayt eşitliği

Aşağıdaki dosyalar tam SHA256 özeti ve aynı dosya boyutuyla eşleşti; her eşitlik grubunun görüntüsü en az bir kez view_image ile açıldı. Bu nedenle eşit dosyaları aynı açılmış PNG görüntüsüne bağlıyorum:
- SHA256 1F20748DAA81853DD26D62AC212411CAA1AE54A7B51DB9354465C2C2B1513775 — 56158 bayt: kavriva_e1015_native_R2-migration-unknown-0.png, kavriva_e1015_native_R2-migration-stale-0.png
- SHA256 798108D735015D4E36CB82D165E7376999865E3B4B086ABCB9A30891CC150EC5 — 66922 bayt: kavriva_e1015_native_R2-collaboration-unknown-0.png, kavriva_e1015_native_R2-collaboration-stale-0.png
- SHA256 84E8733EAAAB7FD53201C4D29EF4859A7BB4E1A1C706401ED7F20BDFB59FA9B1 — 64549 bayt: kavriva_e1015_native_R2-collaboration-unknown-1.png, kavriva_e1015_native_R2-collaboration-stale-1.png
- SHA256 984DF0772BEB1BC2C8C9C46160BC39D88FFEA2700040E243E213EC544FF1F338 — 59502 bayt: kavriva_e1015_native_R2-intro-unknown-0.png, kavriva_e1015_native_R2-intro-stale-0.png
- SHA256 AA327BEECFDA6EFD7E22B37D683BA4B6F1EEEFE791AC6D88BC95DFC6E1A46201 — 65002 bayt: kavriva_e1015_native_R2-collaboration-private-held-1.png, kavriva_e1015_native_R2-collaboration-revoked-1.png
- SHA256 E573BAB2D589B617B65268C8F8F7091257688E9FC464A2EAD5746091A3F05B85 — 65770 bayt: kavriva_e1015_native_R2-migration-conflict-1.png, kavriva_e1015_native_R2-migration-partial-1.png, kavriva_e1015_native_R2-migration-failed-1.png, kavriva_e1015_native_R2-migration-rollback-1.png

## Kapsam ve sınırlar

Bu, statik PNG ekranlarının ilk okumasıdır. Kod, uygulama paketi veya beklenen yanıt/kanıt okunmadı. Gerçek cihazda işlem yapıldığı, üretim davranışı, sunucu durumu, kaynak yetkisi, kişinin kimliği ya da görünen katkıların gerçekte yapılmış olduğu doğrulanmadı. Ekranlarda “Örnek test kaynağı” ve örnek kişi/kayıt adları bulunuyor; bunlar gerçek kişi, cihaz veya üretim kanıtı değildir. Görsellerde kesit/scroll parçaları var; yanıtlar yalnızca açılan PNG’lerde görünen bilgiyle sınırlı. Bu rapor kendi başına ürün otoritesi veya üretim doğrulaması değildir.</pre>

```text
IyBULUUxLTAxNSDigJQgYmHEn8SxbXPEsXogaWxrIG9rdW1hIHJhcG9ydQoKVGFyaWg6IDIwMjYtMTAtMDcuIEJ1IHJhcG9yLCB2ZXJpbGVuIHNhYml0IDIwIHNvcnV5dSB2ZSBtYW5pZmVzdHRla2kgbmF0aXZlIFBORyBla3JhbmxhcsSxbsSxIHRlayBiYcWfxLFtYSBva3V5YXJhayBoYXrEsXJsYW5txLHFn3TEsXIuIFBORyBkb3N5YWxhcsSxIMO2emfDvG4gYmnDp2ltZGUsIHllbmlkZW4gYm95dXRsYW5kxLFyxLFsbWFkYW4sIGtvbGFqIHZleWEgeWVuaWRlbiBrb2RsYW1hIHlhcMSxbG1hZGFuIGfDtnLDvG50w7xsZW5kaS4gVGFtIFNIQTI1NiDDtnpldGkgYXluxLEgb2xhbiBkb3N5YWxhciBheW7EsSBoYW0gUE5HIGfDtnLDvG50w7xzw7xuZSBiYcSfbGFuZMSxLgoKIyMgMjAgc29ydSB2ZSB5YWxuxLF6IGVrcmFubGFyZGFuIHZlcmRpxJ9pbSB5YW7EsXRsYXIKCjEuICoqUHJvZmlsIG9sdcWfdHVybWFrIHpvcnVubHUgbXU7IGVydGVsZXlpbmNlIGhhbmdpIGfDvHZlbmxpIHlvbHUga3VsbGFuYWJpbGlyaW0/KiogSGF5xLFyLCBpc3RlxJ9lIGJhxJ9sxLEgZ8O2csO8bsO8eW9yLiBNZXZjdXQgeWVyZWwga3VsbGFuxLFtYSBkZXZhbSBlZGViaWxpcmltOyBla3JhbmRha2kgeW9sIOKAnMWeaW1kaWxpayB5ZXJlbCBkZXZhbSBldOKAnS4gUHJvZmlsLCBrYXnEsXRsYXLEsSB0YcWfxLFtYWsgdmUgc8SxbsSxcmzEsSBwYXlsYcWfxLFtxLEgZGXEn2VybGVuZGlybWVrIGnDp2luIHNvbnJha2kgYWTEsW0gb2xhcmFrIHN1bnVsdXlvci4KMi4gKipQcm9maWwgb2x1xZ90dXJtYWRhbiBtZXZjdXQgeWVyZWwga3VsbGFuxLFtYSBkZXZhbSBlZGViaWxpciBtaXlpbT8qKiBFdmV0LiBFa3JhbiBidW51IGRvxJ9ydWRhbiBzw7Z5bMO8eW9yIHZlIHllcmVsIGRldmFtIHNlw6dlbmXEn2luaSBnw7ZzdGVyaXlvci4KMy4gKipEaWwsIMO2bMOnw7wgYmlyaW1sZXJpIHZlIGVyacWfaWxlYmlsaXJsaWsgacOnaW4gaGVzYXAgYcOnbWFtIGdlcmVraXlvciBtdT8qKiBIYXnEsXI7IGVrcmFuZGEgaGVzYXAgZ2VyZWttZWRpxJ9pIHlhesSxeW9yLgo0LiAqKlByb2ZpbCBpc3RlxJ9pIGfDtm5kZXJtZWsgaGVzYWLEsW4gemF0ZW4gb2x1xZ90dXJ1bGR1xJ91bnUga2FuxLF0bGFyIG3EsT8qKiBIYXnEsXIuIMSwc3RlayBpbGV0aWxtacWfIG9sc2EgZGEgZ8O8bmNlbCBzb251w6cgZG/En3J1bGFubWFkxLE7IHRhbWFtbGFubcSxxZ8gc2F5xLFsbWFtYXPEsSB2ZSBheXLEsWNhIGtvbnRyb2wgZWRpbG1lc2kgZ2VyZWt0acSfaSB5YXrEsXlvci4KNS4gKipUYcWfxLFtYWRhbiDDtm5jZSBuZWxlcmluIHRhxZ/EsW5hY2HEn8SxbsSxIGfDtnJlYmlsaXIgbWl5aW0/KiogRXZldC4gS2F5bmFrL2hlZGVmLCBrYXnEsXQgdMO8csO8LCBoZXIga2F5ZMSxbiBrYXluYcSfxLEgdmUgdGFyaWhpLCBnw7Zyw7xuZW4gZGXEn2VybGVyIHZlIGthecSxdGxhcsSxbiBmYXJrbMSxIG9sZHXEn3UgZ8O2c3RlcmlsaXlvci4gw5ZybmVrdGUgeWVyZWwgY2loYXpkYWtpIHlhxJ8gYmFrxLFtIGtheWTEsSAyMDI2LTEwLTA2IHRhcmlobGkgdmUgMTIuNDAwIGttOyBwcm9maWwga2F5ZMSxIDIwMjYtMTAtMDUgdGFyaWhsaSB2ZSAxMi4wMDAga20uCjYuICoqxLBraSDDp2FrxLHFn2FuIGtheWTEsW4ga2F5bmHEn8SxbsSxLCB6YW1hbsSxbsSxIHZlIGZhcmvEsW7EsSBuYXPEsWwgYW5sYXLEsW0/KiogVGHFn8SxbWEga2Fwc2FtxLFuZGFraSBoZXIga2F5xLF0IGF5csSxIGfDtnN0ZXJpbGl5b3IuIMOWcm5la3RlIOKAnFllcmVsIGNpaGF6IMK3IGt1bGxhbsSxY8SxIGJleWFuxLEgwrcgMjAyNi0xMC0wNiDCtyAxMi40MDAga23igJ0gaWxlIOKAnFByb2ZpbCDCtyBrdWxsYW7EsWPEsSBiZXlhbsSxIMK3IDIwMjYtMTAtMDUgwrcgMTIuMDAwIGtt4oCdIHlhesSxeW9yOyB0YXJpaCBiaXIgZ8O8biwga2lsb21ldHJlIDQwMCBrbSBmYXJrbMSxLgo3LiAqKlV5Z3VsYW1hIGtlbmRpbGnEn2luZGVuIGthemFuYW4ga2F5ZMSxIHNlw6dpcCBkacSfZXJpbmluIMO8c3TDvG5lIHlhemFyIG3EsT8qKiBIYXnEsXIuIMOHYWvEscWfbWEgZWtyYW7EsSBrYXnEsXRsYXLEsW4gYXlyxLEga2FsYWNhxJ/EsW7EsSB2ZSB1eWd1bGFtYW7EsW4ga2VuZGlsacSfaW5kZW4ga2F6YW5hbiBzZcOnaXAgZGnEn2VyaW5pbiDDvHN0w7xuZSB5YXptYXlhY2HEn8SxbsSxIGHDp8Sxa8OnYSBzw7Z5bMO8eW9yLgo4LiAqKkvEsXNtaSB0YcWfxLFtYSB0YW1hbWxhbm3EscWfIHRhxZ/EsW1hIG3EsWTEsXI/KiogSGF5xLFyLiDigJxUYcWfxLFtYSBrxLFzbWkga2FsZMSx4oCdIGVrcmFuxLEgYnVudW4gdGFtYW1sYW5txLHFnyB0YcWfxLFtYSBvbG1hZMSxxJ/EsW7EsSwgeWVyZWwga2F5bmHEn8SxbiBrdWxsYW7EsWxhYmlsaXIga2FsbWFzxLEgZ2VyZWt0acSfaW5pIHZlIGvEsXNtaSBzb251Y3VuIGJhxZ9hcsSxIGRpeWUgZ8O2c3RlcmlsZW1leWVjZcSfaW5pIHPDtnlsw7x5b3IuCjkuICoqVGHFn8SxbWEgYmHFn2FyxLFzxLF6c2EgdmV5YSBnZXJpIGTDtm7DvGzDvHlvcnNhIHllcmVsIGthecSxdGxhcsSxbiBrdWxsYW7EsW3EsSBoYWtrxLFuZGEgbmUgc8O2eWxlbml5b3I/KiogR8O8dmVubGkgc29udcOnIGRvxJ9ydWxhbmFuYSBrYWRhciB5ZXJlbCBrYXluYWsga29ydW5tYWzEsTsga8Sxc21pL2JhxZ9hcsSxc8SxeiBzb251w6cgdGFtYW1sYW5txLHFnyB0YcWfxLFtYSBzYXnEsWxtYW1hbMSxLiBLxLFzbWkgZWtyYW5kYSB5ZXJlbCBrYXluYcSfxLFuIGt1bGxhbsSxbGFiaWxpciBrYWxtYXPEsSDDtnplbGxpa2xlIGJlbGlydGlsaXlvcjsgZ2VyaSBkw7Zuw7zFnyBla3JhbsSxbsSxbiBiYcWfbMSxxJ/EsSDigJxZZXJlbCBrYXluYcSfYSBkw7Zuw7zFn+KAnS4KMTAuICoqxLBwdGFsIGV0bWVrIHZleWEgeWVyZWwga3VsbGFuxLFtYSBkw7ZubWVrIGthecSxdGxhcsSxIHNpbGVyIG1pPyoqIEhhecSxci4gRWtyYW5kYSBpcHRhbCBldG1lbmluIHlhIGRhIHllcmVsIGt1bGxhbsSxbWEgZMO2bm1lbmluIGthecSxdGxhcsSxIHNpbG1layBvbG1hZMSxxJ/EsSBhw6fEsWvDp2EgeWF6xLF5b3IuCjExLiAqKsSwbmNlbGVtZSB2ZXlhIHRhxZ/EsW1hIGlzdGXEn2kgZ8O2bmRlcm1layB0YcWfxLFtYW7EsW4gZ8O8dmVubGUgdGFtYW1sYW5kxLHEn8SxIGFubGFtxLFuYSBnZWxpciBtaT8qKiBIYXnEsXIuIMSwc3Rlay9pbmNlbGVtZSB0YW1hbWxhbm1hecSxIGthbsSxdGxhbWF6OyBnw7x2ZW5saSBzb251w6cgYXlyxLFjYSBkb8SfcnVsYW5tYWzEsSB2ZSBkb8SfcnVsYW5hbmEga2FkYXIgeWVyZWwga2F5bmFrIGtvcnVubWFsxLEuCjEyLiAqKk1vdG9zaWtsZXQgc2FoaWJpIHZlIGRhdmV0IGVkaWxtacWfIHlhcmTEsW1jxLEgYXluxLEgxZ9leSBtaT8qKiBIYXnEsXIuIEVrcmFuIHNhaGliaW4gdmUgZGF2ZXQgZWRpbGVuIHlhcmTEsW1jxLFuxLFuIGZhcmtsxLEgcm9sbGVyIG9sZHXEn3VudSBiZWxpcnRpeW9yLgoxMy4gKipZYXJkxLFtY8SxIHZleWEgc2VydmlzIGV0aWtldGkga2nFn2luaW4ga2F0a8Sxc8SxbsSxbiBkb8SfcnVsYW5txLHFnyBnZXLDp2VrIG9sZHXEn3VudSBrYW7EsXRsYXIgbcSxPyoqIEhhecSxci4gRWtyYW5kYSByb2wgZXRpa2V0aW5pbiBrYXRrxLFuxLFuIGRvxJ9ydWxhbm3EscWfIGdlcsOnZWsgb2xkdcSfdW51IGfDtnN0ZXJtZWRpxJ9pIHlhesSxeW9yLiBLYXRrxLEgc2F0xLFyxLFuZGEga2nFn2ksIHRhcmloIHZlIGJleWFuIGtheW5hxJ/EsSBnw7ZzdGVyaWxzZSBkZSBidW5sYXIgdGVrIGJhxZ/EsW5hIGdlcsOnZWtsacSfaSBkb8SfcnVsYW1hei4KMTQuICoqUGF5bGHFn8SxbGFuIG1vdG9zaWtsZXQgYmlsZ2lsZXJpIHZlIGtpxZ9pc2VsIMO2emVsIGJpbGdpbGVyIGF5bsSxIGVyacWfaW0gYWxhbsSxIG3EsT8qKiBIYXnEsXIuIEVrcmFuIGJ1bmxhcsSxbiBheXLEsSBlcmnFn2ltIGFsYW5sYXLEsSBvbGR1xJ91bnUgc8O2eWzDvHlvcjsgcGF5bGHFn8SxbSBrYXBzYW3EsSBheXLEsWNhIGluY2VsZW5tZWxpLiDDlnJuZWt0ZSB5YXJkxLFtY8SxIGVyacWfaW1pIHlhbG7EsXogYmFrxLFtIGthecSxdGxhcsSxeWxhIHPEsW7EsXJsxLEgdmUgw7Z6ZWwgaGVzYXAgYmlsZ2lsZXJpIHBheWxhxZ/EsWxtxLF5b3IuCjE1LiAqKllhcmTEsW1jxLEgZXJpxZ9pbWluaW4ga2Fwc2FtxLFuxLEgdmUga2F0a8SxecSxIGtpbWluIG5lIHphbWFuIHlhcHTEscSfxLFuxLEgbmVyZWRlIGfDtnLDvHLDvG0/KiogUGF5bGHFn8SxbS9lcmnFn2ltIGVrcmFuxLFuZGEg4oCcU8SxbsSxcmzEsSBlcmnFn2lt4oCdIHNhdMSxcsSxIGthcHNhbcSxIGfDtnN0ZXJpeW9yOyDigJzEsHppbiBheXLEsW50xLFsYXLEsW7EsSBnw7Zy4oCdIGl6aW5sZXJpLCDigJxLYXRrxLEgdmUgZ2XDp21pxZ/igJ0gYsO2bMO8bcO8IGtpxZ9pIHZlIHRhcmloaSwga2F5xLF0IGF5csSxbnTEsWxhcsSxIGRhIGtheW5hayB2ZSB0YXJpaGkgZ8O2c3Rlcml5b3IuCjE2LiAqKkVyacWfaW1pIGthbGTEsXJtYWsgw7ZuY2VraSBrYXRrxLFsYXLEsSB2ZSBrYXnEsXQgZ2XDp21pxZ9pbmkgc2lsZXIgbWk/KiogSGF5xLFyLiBFa3JhbiBracWfaW5pbiwgemFtYW7EsW4sIGthbsSxdMSxbiB2ZSBnZcOnbWnFn2luIHNpbGlubWVkacSfaW5pIHPDtnlsw7x5b3IuCjE3LiAqKkVyacWfaW1pIGthbGTEsXJtYWsgZ2VsZWNla3Rla2kgZXJpxZ9pbSBhw6fEsXPEsW5kYW4gbmUgYW5sYW1hIGdlbGlyPyoqIEthbGTEsXLEsWxhbiBracWfaSBpw6dpbiBnZWxlY2VrdGVraSBlcmnFn2ltIGR1cmR1cnVsdXIuCjE4LiAqKkfDvG5jZWwgaXppbiB2ZXlhIGtheW5hayBkb8SfcnVsYW5hbcSxeW9yc2Egw7Z6ZWwgYmlsZ2lsZXIgdmUgcGF5bGHFn8SxbSBpxZ9sZW1sZXJpIGtlbmRpbGnEn2luZGVuIGHDp8SxbMSxciBtxLE/KiogSGF5xLFyLiDEsGxnaWxpIGVrcmFuIGfDvG5jZWwga2F5bmFrL2l6aW4gYWzEsW5hbWFkxLHEn8SxbmRhIGtpxZ9pc2VsIGJpbGdpbGVybGUgcGF5bGHFn8SxbSBpxZ9sZW1sZXJpbmluIGthcGFsxLEga2FsYWNhxJ/EsW7EsSBzw7Z5bMO8eW9yLgoxOS4gKipEYXZldCB2ZXlhIGVyacWfaW1pIGthbGTEsXJtYSBpc3RlxJ9pIGdlcsOnZWsgacWfbGVtaW4gdGFtYW1sYW5kxLHEn8SxbsSxIGthbsSxdGxhciBtxLE/KiogSGF5xLFyLiDEsHN0ZWsgZ2Vyw6dlayBpxZ9sZW1pbiB0YW1hbWxhbmTEscSfxLEgYW5sYW3EsW5hIGdlbG1lejsgZ8O8bmNlbCBzb251w6cgYXlyxLFjYSBrb250cm9sIGVkaWxpci4KMjAuICoqS2F5bmFrIHZlIGfDvG5jZWwgZHVydW0gZ8O2csO8bGViaWxpeW9yIG11OyBnw7Zyw7xubWVzaSBkb8SfcnUgdmV5YSB0YW1hbWxhbm3EscWfIG9sZHXEn3VudSBnw7ZzdGVyaXIgbWk/KiogRWtyYW5sYXJkYSBrYXluYWsgdmUgdGFyaWggaWxlIGlzdGVrLCBkb8SfcnVsYW5tYW3EscWfIGR1cnVtLCDDp2FrxLHFn21hIHZleWEgdGFtYW1sYW5tYSBzb251Y3UgZ2liaSBkdXJ1bSBiaWxnaWxlcmkgZ8O2csO8bsO8eW9yLiBZYWxuxLF6IGVrcmFuZGEgZ8O2csO8bm1lc2kgZG/En3J1bHVrIHlhIGRhIHRhbWFtbGFubWEga2FuxLF0xLEgZGXEn2lsOyDDtnplbGxpa2xlIGlzdGVrIHZlIHNvbnXDpyBheXLEsWNhIGRvxJ9ydWxhbm1hbMSxLgoKIyMgR8O2csO8bnTDvGxlbWUgZW52YW50ZXJpCgpBxZ9hxJ/EsWRha2kgYm95dXRsYXIgUE5HIGJhxZ9sxLHEn8SxbmRhbiwgZG9zeWEgYm95dXR1IHZlIFNIQTI1NiBpc2UgaGFtIGRvc3lhbGFyZGFuIGFsxLFubcSxxZ90xLFyLgoKfCBNYW5pZmVzdHRla2kgUE5HIHlvbHUgfCBCb3l1dCAocHgpIHwgSGFtIGJheXQgfCBTSEEyNTYgfAp8LS0tfC0tLTp8LS0tOnwtLS18DQp8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1pbnRyby1yZXF1ZXN0ZWQtMC5wbmcgfCAzOTDDlzg0NCB8IDY4MTYzIHwgNDg5NjYzQUNEMjc4MzY1MTJGRDQ0OTdFMUFFQkUyOUY4QjdDNUVBNUQwNkQzRkJBQTgwRDQzM0JFMEY1M0U2RiB8DQp8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1jb2xsYWJvcmF0aW9uLWV4cGFuZGVkLTAucG5nIHwgMzkww5c4NDQgfCA2ODI0OSB8IDMyMDQxMkU5Qzk4NDVBN0I3MjM3MDkxRDVGNjA0NDNFMjk0REQ4REJENkI3MTEzMERCNzQ2RjhBMzRDNzA4REYgfA0KfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxNV9uYXRpdmVfUjItY29sbGFib3JhdGlvbi1leHBhbmRlZC0xLnBuZyB8IDM5MMOXODQ0IHwgNjMxMDEgfCBGQTBGNkIzMUIzRURENDRGMEY5NzRDQTJFQTMxREE4OTQ5MUNERUM1NTczNzVDMzVERkJBNzNEMjMyNEM0QjA4IHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLWludHJvLXJlYWR5LTAucG5nIHwgMzkww5c4NDQgfCA2MjMzNCB8IDc0M0E2NDFCM0RENTUwMDBBMjA2M0I0Rjc2QTBCMzZGNDAzOUUwNUY5NkU0NDI1OEJDOTZFRDE5OUZENjRENUMgfA0KfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxNV9uYXRpdmVfUjItaW50cm8tdW5rbm93bi0wLnBuZyB8IDM5MMOXODQ0IHwgNTk1MDIgfCA5ODRERjA3NzJCRUIxQkMyQzhDOUM0NjE2MEJDMzlEODhGRkVBMjcwMDA0MEUyNDNFMjEzRUM1NDRGRjFGMzM4IHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLWludHJvLXN0YWxlLTAucG5nIHwgMzkww5c4NDQgfCA1OTUwMiB8IDk4NERGMDc3MkJFQjFCQzJDOEM5QzQ2MTYwQkMzOUQ4OEZGRUEyNzAwMDQwRTI0M0UyMTNFQzU0NEZGMUYzMzggfA0KfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxNV9uYXRpdmVfUjItaW50cm8tb2ZmbGluZS0wLnBuZyB8IDM5MMOXODQ0IHwgNjkxNzEgfCAxOTMwRkIzQzJGQjU3QTZEOEU0MEQzMjgwOEZBNjNCODQzNTVBOTMwM0VCMUIyNEFDQUIyMEE3MDU4QkU3MTNEIHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLWludHJvLXByaXZhdGUtaGVsZC0wLnBuZyB8IDM5MMOXODQ0IHwgNTkxMDIgfCA2ODE4REUyNzFBNzY4NzEyRDA0OThFNkFDQzZBQUZFNzAzREFGN0M0RjMzNzEzNDlBMEVFQ0JCMzI3QkJBMEZFIHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLW1pZ3JhdGlvbi1yZWFkeS0wLnBuZyB8IDM5MMOXODQ0IHwgNzE5MTAgfCBDMEU4NUFEM0VGNzMxRkY0QTQzQURBQzMxQjJBNkFFNTgyQTM3MDY0RkNCNTM0MDNGOEQ3OTEwMkUwNEJERjI4IHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLW1pZ3JhdGlvbi1yZWFkeS0xLnBuZyB8IDM5MMOXODQ0IHwgNjkzNTEgfCBFNDVBMERDOEEyM0U3RjA4Q0JFNkQ2NUFDMjM5QTdEQjkwMTEyQjBDMzlGNDUzMUEzMURDNDc1NTdGMEExOTI0IHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLW1pZ3JhdGlvbi11bmtub3duLTAucG5nIHwgMzkww5c4NDQgfCA1NjE1OCB8IDFGMjA3NDhEQUE4MTg1M0REMjZENjJBQzIxMjQxMUNBQTFBRTU0QTdCNTFEQjkzNTQ0NjVDMkMyQjE1MTM3NzUgfA0KfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxNV9uYXRpdmVfUjItbWlncmF0aW9uLXN0YWxlLTAucG5nIHwgMzkww5c4NDQgfCA1NjE1OCB8IDFGMjA3NDhEQUE4MTg1M0REMjZENjJBQzIxMjQxMUNBQTFBRTU0QTdCNTFEQjkzNTQ0NjVDMkMyQjE1MTM3NzUgfA0KfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxNV9uYXRpdmVfUjItbWlncmF0aW9uLW9mZmxpbmUtMC5wbmcgfCAzOTDDlzg0NCB8IDcxODkzIHwgRTZENEUyMTAxODBFNkJEOUFBRTExMjlGQzBDMTI3MzY3QjZCMUM0NjZBQURFMjMyRDE4NDkzNkVCQ0FDMDMzRCB8DQp8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1taWdyYXRpb24tb2ZmbGluZS0xLnBuZyB8IDM5MMOXODQ0IHwgNzAxNTMgfCBCREY4MjhGQ0RGNDY3QjNBNDIwM0M4NUQyM0JGMTE2MTM3RTNDMkNGODI1MjE4OTIxRkIwRTRBNjM0RDA5Qzc0IHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLW1pZ3JhdGlvbi1wcml2YXRlLWhlbGQtMC5wbmcgfCAzOTDDlzg0NCB8IDcwNTc0IHwgNTRERUY2QkY3M0U2RjYzMkVEN0E1ODNCQTVGODMxMjdEQTQ0MkZFNEEzRUZENTM4NEUxMjYzNEFBQThBRTEwRSB8DQp8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1taWdyYXRpb24tcHJpdmF0ZS1oZWxkLTEucG5nIHwgMzkww5c4NDQgfCA2ODkzMyB8IDYyMTJEQkE5QkMwOUFGRUZCNDI5OEE2MERBQzY3RjhFN0EwQUE2OURCODBBOEExOEE0N0RGREJFNkMyQjgxOUEgfA0KfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxNV9uYXRpdmVfUjItY29sbGFib3JhdGlvbi1yZWFkeS0wLnBuZyB8IDM5MMOXODQ0IHwgNjczNTggfCAzMjVGQUJDRDg5RENGNjg5RjA2NUJCNDJDMTQ4N0Q2QTY2QURCMDBGM0NBOTI4MTc4REIyMTg2MTU0QzUxODU5IHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLWNvbGxhYm9yYXRpb24tcmVhZHktMS5wbmcgfCAzOTDDlzg0NCB8IDY0OTAzIHwgMDcwOEIwN0VFN0M5MkI4RkY1OUU4N0MwRjdDRkY4NDU0RUM4Rjc3RjI0QjZEMTA0Rjg4QjNGMkE2NzFERUZFRiB8DQp8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1jb2xsYWJvcmF0aW9uLXVua25vd24tMC5wbmcgfCAzOTDDlzg0NCB8IDY2OTIyIHwgNzk4MTA4RDczNTAxNUQ0RTM2Q0I4MkQxNjVFNzM3Njk5OTg2NUUzQjRCMDg2QUJDQjlBMzA4OTFDQzE1MEVDNSB8DQp8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1jb2xsYWJvcmF0aW9uLXVua25vd24tMS5wbmcgfCAzOTDDlzg0NCB8IDY0NTQ5IHwgODRFODczM0VBQUFCN0ZENTMyMDFDNEQyOUVGNDg1OUE3QkI0RTFBMUM3MDY0MDFFRDdGMjBCREZCNTlGQTlCMSB8DQp8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1jb2xsYWJvcmF0aW9uLXN0YWxlLTAucG5nIHwgMzkww5c4NDQgfCA2NjkyMiB8IDc5ODEwOEQ3MzUwMTVENEUzNkNCODJEMTY1RTczNzY5OTk4NjVFM0I0QjA4NkFCQ0I5QTMwODkxQ0MxNTBFQzUgfA0KfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxNV9uYXRpdmVfUjItY29sbGFib3JhdGlvbi1zdGFsZS0xLnBuZyB8IDM5MMOXODQ0IHwgNjQ1NDkgfCA4NEU4NzMzRUFBQUI3RkQ1MzIwMUM0RDI5RUY0ODU5QTdCQjRFMUExQzcwNjQwMUVEN0YyMEJERkI1OUZBOUIxIHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLWNvbGxhYm9yYXRpb24tb2ZmbGluZS0wLnBuZyB8IDM5MMOXODQ0IHwgNjc0MTggfCA2QzMwRjhDODY5QjYwODBBRkVFQzRCNEEwODkyNDJGODEwNUE2QkE4MjA1MTA5NUVBNzcyQzM0ODFCQkJBMTgwIHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLWNvbGxhYm9yYXRpb24tb2ZmbGluZS0xLnBuZyB8IDM5MMOXODQ0IHwgNjQ2OTIgfCA5RDYyMjgzNzE1NTVCRjYxRkJDRDRFOTAzQkIwMkRGNDkxN0U2QzlFQTYzNTA4MTc0NDlGM0ZBM0NFRjhBMUI1IHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLWNvbGxhYm9yYXRpb24tcHJpdmF0ZS1oZWxkLTAucG5nIHwgMzkww5c4NDQgfCA2NjQxMyB8IEI2Mzk1RUVBRkNBRTg5MTUzMTI1NzhBMjFEQTYyREU3RUQxNUY2RjcyNkJFMTE2QjY5QTZDMzQ5NjM3M0Y4Q0EgfA0KfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxNV9uYXRpdmVfUjItY29sbGFib3JhdGlvbi1wcml2YXRlLWhlbGQtMS5wbmcgfCAzOTDDlzg0NCB8IDY1MDAyIHwgQUEzMjdCRUVDRkRBNkVGRDdFMjJCMzdENjgzQkE0QjZGMUVFRUZFNzkxQUM2RDg4QkM5NURGQzZFMUE0NjIwMSB8DQp8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1taWdyYXRpb24tY29uZmxpY3QtMC5wbmcgfCAzOTDDlzg0NCB8IDY5MTEyIHwgRTU1QjU4RUU2RDQyMjFDQTIyMTVGM0REQzVBRENBN0I4NkU4REVGMUMwQzA3MTdBQUE2QzI0QjRFOTQ5MDhCOSB8DQp8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1taWdyYXRpb24tY29uZmxpY3QtMS5wbmcgfCAzOTDDlzg0NCB8IDY1NzcwIHwgRTU3M0JBQjJENTg5QjYxN0I2NTI2OEM4RjhGNzA5MTI1NzY4OEU5RkM0NjRBMkVBRDU3NDYwOTFBM0YwNUI4NSB8DQp8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1taWdyYXRpb24tcGFydGlhbC0wLnBuZyB8IDM5MMOXODQ0IHwgNjc3MzggfCAwODhBOTY3MDlDNDhDN0I4ODI1MjM3NDJGRjgzM0NBNjNGMEQzMTQ4MDZEMDJDOTVCQzJBODcwMzlCODJDMUNCIHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLW1pZ3JhdGlvbi1wYXJ0aWFsLTEucG5nIHwgMzkww5c4NDQgfCA2NTc3MCB8IEU1NzNCQUIyRDU4OUI2MTdCNjUyNjhDOEY4RjcwOTEyNTc2ODhFOUZDNDY0QTJFQUQ1NzQ2MDkxQTNGMDVCODUgfA0KfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxNV9uYXRpdmVfUjItbWlncmF0aW9uLWZhaWxlZC0wLnBuZyB8IDM5MMOXODQ0IHwgNjg4NDEgfCA5OTBDMzYzRDBDQUZFNzIxQ0Y2MDQ1NkFGNUNFOTE3ODExMUFEOTgzREZEODlGRTI5NUVBRjYzRkZGNUUxNkJCIHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLW1pZ3JhdGlvbi1mYWlsZWQtMS5wbmcgfCAzOTDDlzg0NCB8IDY1NzcwIHwgRTU3M0JBQjJENTg5QjYxN0I2NTI2OEM4RjhGNzA5MTI1NzY4OEU5RkM0NjRBMkVBRDU3NDYwOTFBM0YwNUI4NSB8DQp8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1taWdyYXRpb24tcm9sbGJhY2stMC5wbmcgfCAzOTDDlzg0NCB8IDcwODUyIHwgOUIxOTU1Mzk1N0Q1QzQ5OEY0RTdDNzcxRkMzNUQwNzAyQkI5MjUwMjZGNkI5QkM1QzNEMjA3NDY2REIxMTM1OSB8DQp8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1taWdyYXRpb24tcm9sbGJhY2stMS5wbmcgfCAzOTDDlzg0NCB8IDY1NzcwIHwgRTU3M0JBQjJENTg5QjYxN0I2NTI2OEM4RjhGNzA5MTI1NzY4OEU5RkM0NjRBMkVBRDU3NDYwOTFBM0YwNUI4NSB8DQp8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1taWdyYXRpb24tY29tcGxldGVkLTAucG5nIHwgMzkww5c4NDQgfCA2ODUzNiB8IDFCQ0JFMDA1NDM2NTIyMjM1Njk0MUE3OEFERkExOEZDQjMzQkMxMzgzMThERjA5RUQzMTVCNDc2QjNFODFFNEQgfA0KfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxNV9uYXRpdmVfUjItbWlncmF0aW9uLWNvbXBsZXRlZC0xLnBuZyB8IDM5MMOXODQ0IHwgNjM5MzMgfCA2RDFBMzVGNzE1OEMwNzg1NkUyQ0Q5RjVBQjBEOUIxRDRGMDk2RDA3QzA4RUI1OTA0RjY4Q0EyNjhCRDlGOTRBIHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLWNvbGxhYm9yYXRpb24tcmV2b2tlZC0wLnBuZyB8IDM5MMOXODQ0IHwgNjk1MDEgfCBBNjU4RURFNkU5Q0Y2N0RDODI2RTI3M0RGREY2MzZFMzY1NUNGNUY3NUM4MDk1MDM1QzhBRUUyNDVFNkVBNTA3IHwNCnwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTVfbmF0aXZlX1IyLWNvbGxhYm9yYXRpb24tcmV2b2tlZC0xLnBuZyB8IDM5MMOXODQ0IHwgNjUwMDIgfCBBQTMyN0JFRUNGREE2RUZEN0UyMkIzN0Q2ODNCQTRCNkYxRUVFRkU3OTFBQzZEODhCQzk1REZDNkUxQTQ2MjAxIHwNCgojIyBIYW0gYmF5dCBlxZ9pdGxpxJ9pCgpBxZ9hxJ/EsWRha2kgZG9zeWFsYXIgdGFtIFNIQTI1NiDDtnpldGkgdmUgYXluxLEgZG9zeWEgYm95dXR1eWxhIGXFn2xlxZ90aTsgaGVyIGXFn2l0bGlrIGdydWJ1bnVuIGfDtnLDvG50w7xzw7wgZW4gYXogYmlyIGtleiB2aWV3X2ltYWdlIGlsZSBhw6fEsWxkxLEuIEJ1IG5lZGVubGUgZcWfaXQgZG9zeWFsYXLEsSBheW7EsSBhw6fEsWxtxLHFnyBQTkcgZ8O2csO8bnTDvHPDvG5lIGJhxJ9sxLF5b3J1bToKLSBTSEEyNTYgMUYyMDc0OERBQTgxODUzREQyNkQ2MkFDMjEyNDExQ0FBMUFFNTRBN0I1MURCOTM1NDQ2NUMyQzJCMTUxMzc3NSDigJQgNTYxNTggYmF5dDoga2F2cml2YV9lMTAxNV9uYXRpdmVfUjItbWlncmF0aW9uLXVua25vd24tMC5wbmcsIGthdnJpdmFfZTEwMTVfbmF0aXZlX1IyLW1pZ3JhdGlvbi1zdGFsZS0wLnBuZw0KLSBTSEEyNTYgNzk4MTA4RDczNTAxNUQ0RTM2Q0I4MkQxNjVFNzM3Njk5OTg2NUUzQjRCMDg2QUJDQjlBMzA4OTFDQzE1MEVDNSDigJQgNjY5MjIgYmF5dDoga2F2cml2YV9lMTAxNV9uYXRpdmVfUjItY29sbGFib3JhdGlvbi11bmtub3duLTAucG5nLCBrYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1jb2xsYWJvcmF0aW9uLXN0YWxlLTAucG5nDQotIFNIQTI1NiA4NEU4NzMzRUFBQUI3RkQ1MzIwMUM0RDI5RUY0ODU5QTdCQjRFMUExQzcwNjQwMUVEN0YyMEJERkI1OUZBOUIxIOKAlCA2NDU0OSBiYXl0OiBrYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1jb2xsYWJvcmF0aW9uLXVua25vd24tMS5wbmcsIGthdnJpdmFfZTEwMTVfbmF0aXZlX1IyLWNvbGxhYm9yYXRpb24tc3RhbGUtMS5wbmcNCi0gU0hBMjU2IDk4NERGMDc3MkJFQjFCQzJDOEM5QzQ2MTYwQkMzOUQ4OEZGRUEyNzAwMDQwRTI0M0UyMTNFQzU0NEZGMUYzMzgg4oCUIDU5NTAyIGJheXQ6IGthdnJpdmFfZTEwMTVfbmF0aXZlX1IyLWludHJvLXVua25vd24tMC5wbmcsIGthdnJpdmFfZTEwMTVfbmF0aXZlX1IyLWludHJvLXN0YWxlLTAucG5nDQotIFNIQTI1NiBBQTMyN0JFRUNGREE2RUZEN0UyMkIzN0Q2ODNCQTRCNkYxRUVFRkU3OTFBQzZEODhCQzk1REZDNkUxQTQ2MjAxIOKAlCA2NTAwMiBiYXl0OiBrYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1jb2xsYWJvcmF0aW9uLXByaXZhdGUtaGVsZC0xLnBuZywga2F2cml2YV9lMTAxNV9uYXRpdmVfUjItY29sbGFib3JhdGlvbi1yZXZva2VkLTEucG5nDQotIFNIQTI1NiBFNTczQkFCMkQ1ODlCNjE3QjY1MjY4QzhGOEY3MDkxMjU3Njg4RTlGQzQ2NEEyRUFENTc0NjA5MUEzRjA1Qjg1IOKAlCA2NTc3MCBiYXl0OiBrYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1taWdyYXRpb24tY29uZmxpY3QtMS5wbmcsIGthdnJpdmFfZTEwMTVfbmF0aXZlX1IyLW1pZ3JhdGlvbi1wYXJ0aWFsLTEucG5nLCBrYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1taWdyYXRpb24tZmFpbGVkLTEucG5nLCBrYXZyaXZhX2UxMDE1X25hdGl2ZV9SMi1taWdyYXRpb24tcm9sbGJhY2stMS5wbmcNCgojIyBLYXBzYW0gdmUgc8SxbsSxcmxhcgoKQnUsIHN0YXRpayBQTkcgZWtyYW5sYXLEsW7EsW4gaWxrIG9rdW1hc8SxZMSxci4gS29kLCB1eWd1bGFtYSBwYWtldGkgdmV5YSBiZWtsZW5lbiB5YW7EsXQva2FuxLF0IG9rdW5tYWTEsS4gR2Vyw6dlayBjaWhhemRhIGnFn2xlbSB5YXDEsWxkxLHEn8SxLCDDvHJldGltIGRhdnJhbsSxxZ/EsSwgc3VudWN1IGR1cnVtdSwga2F5bmFrIHlldGtpc2ksIGtpxZ9pbmluIGtpbWxpxJ9pIHlhIGRhIGfDtnLDvG5lbiBrYXRrxLFsYXLEsW4gZ2Vyw6dla3RlIHlhcMSxbG3EscWfIG9sZHXEn3UgZG/En3J1bGFubWFkxLEuIEVrcmFubGFyZGEg4oCcw5ZybmVrIHRlc3Qga2F5bmHEn8Sx4oCdIHZlIMO2cm5layBracWfaS9rYXnEsXQgYWRsYXLEsSBidWx1bnV5b3I7IGJ1bmxhciBnZXLDp2VrIGtpxZ9pLCBjaWhheiB2ZXlhIMO8cmV0aW0ga2FuxLF0xLEgZGXEn2lsZGlyLiBHw7Zyc2VsbGVyZGUga2VzaXQvc2Nyb2xsIHBhcsOnYWxhcsSxIHZhcjsgeWFuxLF0bGFyIHlhbG7EsXpjYSBhw6fEsWxhbiBQTkfigJlsZXJkZSBnw7Zyw7xuZW4gYmlsZ2l5bGUgc8SxbsSxcmzEsS4gQnUgcmFwb3Iga2VuZGkgYmHFn8SxbmEgw7xyw7xuIG90b3JpdGVzaSB2ZXlhIMO8cmV0aW0gZG/En3J1bGFtYXPEsSBkZcSfaWxkaXIu
```

### Mimari kayıt düzeltme geçmişi

R1 run_all worst1: yalnız E-DEV-114 gate_verdict kapalı kümede olmayan IN_PROGRESS ile yazılmıştı. Gerçek kabul uydurmadan RECORDED olarak düzeltildi. Özgün günlük korunur.

R2 kayıt denemesinde RECORDED sözcüğüne bitişik noktalı virgül de kapalı kümenin ilk sözcük eşleşmesini bozdu. R3 yalnız ayırıcıyı düzeltir; kabul sonucu değişmez. R1 ve R2 günlükleri korunur.

## Bütün kaynak incelemesine hazırlık

R3 run_all: 12 kontrol ve 42 koruma/iz testi PASS, worst0. R1/R2 kayıt biçimi hataları korunur. 345 normal, format36/0, analyze0, ayrı native1 PASS ve 20 yanıt ilk okuma kaydedildi. Görev REVIEW; bütün bağımsız hüküm ve gerçek aynı kaynak CI/T3 bekleniyor. Ana 102 DONE/104 kalan/206 değişmez.
