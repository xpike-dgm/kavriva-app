---
record_id: V-E7-IOS-ACCESS-001
version: 1
purpose: iOS gerçek Mac erişimi ve Apple emaneti kanıtlarını ayrı ayrı kaydetmek
domain: ios-lane-readiness
module: e07-build-lane
owner: E7
implements: [ADR-013, ADR-008, ADR-007, C7.2, F7.2.1, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: ios-access-custody-proof
tasks: [T-E7-003a]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [M-E7-001, M-E6-001, V-E6-AUTHORITY-001, V-E7-ANDROID-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E7-003a, T-E7-003a, E-DEV-087]
evidence: [E-DEV-087]
supersedes: []
status: ACTIVE
---

# iOS için Mac erişimi ve Apple emaneti: iki ayrı kanıt

T-E7-003a, ilk iki iOS kanıtının ayrı ayrı PASS/HELD değerlendirilmesini ve hiçbir taahhüt verilmemesini ister. Bu kayıt bütün bu görev kapsamını değerlendirir; iOS derlemesi veya yayın açılışı değildir. İncelenen kabul edilmiş kaynaklarda iki gerçek kanıt da bulunmadığı için ikisi ayrı HELD kaydedildi. Bu, sahibin hiç Mac'i olmadığı iddiası değildir; Kavriva için doğrulanmış çalışma kanıtı mevcut değildir. Bağımsız tam görev incelemesi ve bu başlığın CI sonucu bekleniyor.

## Kaynağın istediği ilk iki kanıt

1. `real Kavriva Mac/Xcode execution access`
2. `Apple certificate/profile/private-key custody with rotation/revocation/recovery and App Store Connect role boundaries`

[ADR-013 Decision2: özgün ilk iki koşul](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-013__MOBILE_BUILD_SIGNING_AND_RELEASE_OPERATIONS.md#L55-L60). Kaynakta sonraki üç koşul provenance, sahibin teknik onarım yapmadığı kurtarma ve temiz oda yeniden derlemesidir. T-E7-003b ve T-E7-003c bu ayrı değerlendirmeleri kapsar; bu kayıtta onların sonucu PASS değildir. [ADR-008 Decision4–8](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-008__CONSUMER_MOBILE_FRAMEWORK.md#L64-L71) gerçek erişim, sahip kontrollü yetki, fiziksel cihaz kanıtı ve ücret sınırlarını korur.

## İki ayrı değerlendirme

| Kanıt | Sonuç | İncelenen kaynaklarda mevcut durum | Sonradan gerçekten gerekli olacak kanıt |
|---|---|---|---|
| 1 — Mac/Xcode çalıştırma erişimi | HELD | Kavriva kaynağını gerçek Mac/Xcode ortamında çalıştıran kanıt, erişim kapsamı ve bağımsız doğrulanabilir çıktı yok | Gerçek Kavriva çalıştırma kaydı; hangi kaynaktan hangi çıktı üretildiği, kullanılabilir erişim ve dışarı aktarılabilir kanıt. Barındırılan yol seçilirse ayrıca açıkça onaylı, gideri sınırlı ve dışarı aktarılabilir olmalı |
| 2 — Apple emaneti ve roller | HELD | Sertifika, profil ve özel anahtarın gerçek sahip kontrollü yönetimi ile yenileme/iptal/kurtarma ve App Store Connect rol sınırlarını gösteren kanıt yok | Her bileşen için gerçek sahiplik ve en az yetki; yenileme, iptal ve kurtarma kanıtı; mağaza hesabı rollerinin imza ve CI çalıştırma rollerinden ayrı olduğunun doğrulanması. Gizli anahtarlar bu kayda konmaz |

HELD nedenleri birbirinden ayrıdır. Mac erişiminin kanıtlanması Apple emaneti için PASS değildir; Apple hesabının veya sertifikanın varlığı Mac/Xcode çalıştırma kanıtı değildir. İkinci kanıtın ayrıntılarından biri eksikse ikinci kanıt HELD kalır. İki kanıt da ileride PASS olsa bile kalan üç kanıt ve E6'nın güncel yayın kararı olmadan iOS açılmaz.

## Geçerli sayılmayan ikameler

- Ödünç iPhone, gerçek Mac/Xcode çalıştırma erişimi değildir. Telefon testi, kendi ayrı planlama ve fiziksel cihaz kanıtını gerektirir.
- Linux/VDS, genel CI erişimi, simülatör, AI beyanı, rol adı veya örnek test verisi bu iki gerçek kanıtın yerine geçmez.
- Sağlayıcının imzalama hizmeti; sahip kontrollü emanet, yenileme/iptal/kurtarma, rol ayrımı ve çıkış kanıtı olmadan ikinci kanıtı geçirmez. Tek sağlayıcı anahtar sahibi veya yayın otoritesi olamaz.
- Görev belgelerinin onayı, başarılı genel test, eski inceleme, kullanıcının ALLOW beyanı veya tek kişinin farklı takma adları yayın yetkisi sağlamaz.
- Anahtar kaybı/sızması başka yere kopyalanarak giderilmiş sayılmaz; E6'nın yenileme/iptal/yeniden oluşturma ve temiz yeniden derleme yönü korunur. Bu görev anahtar işlemiyor veya yeni politika belirlemiyor.

## Sorumluluk ve sınırlar

E6 imza, emanet ve yayın politikasını belirler; E7 yalnız izinli hattı uygular; E3 kanonik kaynağı sunar. Mevcut E6 mantıksal kayıt ve iç örnek testler gerçek Apple sahipliği veya güncel yayın kararı değildir. E6'nın özel iç modülleri çağrılmaz; yeni public seam, kod, test, çalıştırılabilir workflow veya E7→E1 runtime bağı yoktur. E1 çıktısı yalnız kabul fixture'ı ilişkisindedir.

Android'in bağımsız ilerlemesi iOS/Mac beklemesine bağlanmaz. Paylaşılan Flutter değişiklikleri iki hattı birbirine bağlamamalı; bunu doğrulayan gerçek çalışma kanıtı henüz yoksa öyle bir kanıt uydurulmaz. Sahip Xcode, Gradle, SSH, CI, imza veya anahtar hata ayıklaması yapacak gizli geliştirici değildir. Gerçek bir dış işlem ileride gerekirse mevcut sade bildirim protokolüyle kaynak, sonuç, kişi/adımlar, seçenek ve bilinen gider/gecikme açıklanır; bilinmeyen tutar veya süre uydurulmaz.

Mac satın alma, barındırma kapasitesi, ücretli plan, Apple hesabı/rol değişikliği, sertifika/profil/özel anahtar oluşturma veya taşıma, build, signing, mağazaya gönderim ve cihaz işi yapılmadı. Yeni sağlayıcı, final bütçe veya çalışma aracı seçilmedi. Mevcut İngilizce kayıtlar korunuyor; bu kaydın yeni açıklamaları Türkçe.

## Kabul, devir ve geri dönüş

İki kanıtı ayrı HELD değerlendirme kaydı görev kabulünün tamamıdır; gerçek kanıt üretimini tamamladığı iddiası değildir. Gerçek iOS aktivasyonu MISSING/HELD, evrensel operasyon devri ID MISSING/BLOCKED. Sınırlı P-E7-003a belge devri D-APP-DOC-004v1/P-E10-007v1 biçimindedir. Yalnız bu belge değişikliği geri alınabilir; önceki kanıtlar ve E6 politikası korunur.

T-E3-001-R1 REVIEW, T-E5-003 IN_PROGRESS, PR47/57/59 beklemede; T-E9-006 ve ona bağımlı T-E9-007 ilerletilmedi. T-E7-002 gerçek source/build/version/artifact bağ kanıtı yokken tamamlanmış sayılmaz. T-E7-003b/c veya beşli iOS paketi için DONE verilmez. Bu belge, ürünün telefonda kullanıma veya yayına hazır olduğunu kanıtlamaz.

ADR013R2 → C7.2 → F7.2.1 → FL7.2.1 → T-E7-003a → M-E7-001 → E-DEV-087.

## Kayıt adresleri

Bağlam `vault/PACKS/P-E7-003a.md`, görev `vault/REGISTRY/T-E7-003a.md`, kanıt `vault/EVIDENCE/E-DEV-087.md`; E6 politika sınırı `modules/e06-release/MANIFEST.md`, E7 uygulama sınırı `modules/e07-build-lane/MANIFEST.md`. HELD gerekçesi özgün ADR013 kaynağının ilk iki koşulu ve bu kaydın iki ayrı değerlendirme tablosudur.

## 2026-10-04 tam görev incelemesi ve kaynak CI kabulü

Bağımsız /root/e7003a_ios_access_custody_full_review, ayrı sınırlı bağlamda gpt-6-luna/max yapılandırmasıyla 6e6c2a9e2e65ad1878eab832f0b6bcebe3f805ed başlığı için FULL PASS verdi; taban eb5a26abd5b5192c3b586740d1504efe4354aa82, kabul edilmiş plan fa914f013fdcd032faed876689092da245989459. Açık bulgu veya düzeltme isteği yok. Model bilgisi gerçekten yapılan spawn yapılandırmasıdır; modelin çalışma içinden kimlik doğrulaması değildir. Kullanıcı bu bağımsız altajanı ikinci göz olarak ve gerekli yeşil CI sonrası olağan birleştirmeleri aksini söyleyene kadar açıkça kabul etti; DEC-0069 geçerli, kabul edilmemiş DEC-0070/planPR4 yetki değil.

Kullanıcının güvenli dur talimatıyla inceleme kesildiğinde yalnız ön bulgular vardı, PASS verilmedi; hiçbir kapanış veya birleştirme yapılmadı. 2026-10-04 devam et talimatıyla aynı temiz kaynak ve ayrılmış reviewer bağlamında kalan inceleme tamamlandı. Kesinti bir ret değildir. Tam kaynak görevi kabulü, iki kanıtı ayrı değerlendirmek ve taahhüt vermemektir: gerçek Kavriva Mac/Xcode çalıştırma kanıtı HELD, Apple sertifika/profil/özel anahtar yenileme/iptal/kurtarma/Connectrol sınırı kanıtı ayrı HELD. Kaynakta kanıt bulunmaması, sahibin hiç Mac veya hesabı olmadığı iddiası değildir. Beşli iOS paketi ve gerçek iOS açılışı tamamlanmış sayılmaz.

İncelemeci pinned task/ADR013R2ilkiki koşul/ADR008D4–8/C7.2F7.2.1FL7.2.1 ve 14 alanlı pack'i karşılaştırdı. Dokuz sabit pini, kaynak profil LF özeti df3f659c08fd7f12edde33d4264fbbd5700cf12bc796d97817122fce330568b4, ham v54 boyut180901byte/raw SHA256b1590840e18c2a17839488b9c49ccb4a8d97398520c1bf5e6f38adff0902d3ae/source blob byte eşitliği, tam11izinliyol, packcheckpoint62e0811artifactöncesi ve öncekiEDEV086primaryreviewverdict korunmasını bağımsız doğruladı. İkiHELD gerekçe/altayrıntıları, borrowed iPhone/simulator/VDS/CI/roladı/eski inceleme ikamelerinin reddi, E6owns/E7executes/Androidindependent/kalanüçkanıtHELD/noownerdebug/noimpersonation/no procure-build-sign-store-device doğrulandı. İncelemeci fiilen run_all12kontrol+42regresyon PASS, build/routing sonuçlarının salt okunur yeniden hesabının80satır/REVIEW görünümleriyle eşleşmesi, diffcheck/temizağaç/hash/custody denetimlerini yaptı. GitHub sorgusu yapmadı; aşağıdaki CI root'un ayrı gerçek ölçümüdür. Önceden var olan P-PROOF-001 freshness uyarısı kaldı.

Kaynak başlığında 15/15 SUCCESS: PR architecture37134874621(opened)/37134900245(labeled)/E337134874610/live37134874619/E437134874603/E537134874618/E637134874672/E937134874657; push architecture37134829453/E337134829509/live37134829426/E437134829421/E537134829413/E637134829429/E937134829431. AçılışT3job111237267526skipped0adım; etiketliT3job111237337724 gerçekten5adımSUCCESS/checks1112373378147adımSUCCESS/E4PR170testPASS0.168s/E9PR9testPASS0.001s. 2026-10-04 yeniden sorguda aynı15runSUCCESS ve PR89OPEN/DRAFT/head/base eşleşti; ilk statequery geçiciHTTP503 okuma hatası sonra düzeldi, CI hatası veya ret değildir. OtomatikT3 bağımsız hükmün yerine geçmez.

Yazar ilkpacksonboşluk hatasını artifactöncesi düzeltti. İlk yerel HELDlinkcheck hatası iki çalıştırmada görüldü; kayıtadresleri ve doğrulanmış ADR008satır64–71 adresiyle düzeltildi, geçmişte korunur. Son kaynak root12+42PASS0.431s/worst0/build80/routingREVIEW/diff/manual2koşul/2HELD/9pins/raw/exact11/priorprimary/code-tests-workflowunchanged PASS. Bağımsız ret veya sonradan kapatılmamış bulgu uydurulmaz.

Bu kabul bütün T-E7-003a'nın iki ayrı HELD değerlendirme kaydı içindir. Profil REVIEW→ACTIVE, pack IN_PROGRESS→DONE, görev REVIEW→DONE; son altı yol profil/pack/görev/kanıt/iki görünüm. Gerçek kanıt durumu, sekizAndroidHELD, E6kararı, kalanüçiOSkanıtı, hamkopya/envanter/manifestCI/priorproof/code değişmez. Önceki hazırlık/bekleyen inceleme metinleri yazıldıkları anın geçmişidir; bu bölüm güncel belge kabulünü bildirir. Son bağımsız metadata incelemesi ve son başlığın bütün gerçekCI/PRT3/E4/E9 sonuçları olmadan PR89birleştirilemez.

Gerçek Mac/Xcode, Apple emaneti/rol/kurtarma, provenance, gerçekcihaz, gider ve evrensel operasyonhandoff eksik/beklemede. Sınırlı belge devri D-APP-DOC-004v1/P-E10-007v1; gerçek evrenselhandoffID MISSING/BLOCKED. T-E7-002/T003b-c/T006007 ilerlemedi, E3R1REVIEW/E5-003IN_PROGRESS/PR47-57-59beklemede. Belge görevi DONE ürün/feature/flow/iOS hazırlığı değil. Hesap, anahtar, ücret, sağlayıcı, build, signing, mağaza veya cihaz eylemi yapılmadı. Yeni vault açıklamaları Türkçe; mevcut İngilizce geçmiş korunuyor.
