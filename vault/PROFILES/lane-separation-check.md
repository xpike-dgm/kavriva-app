---
record_id: V-E7-SEPARATION-001
version: 1
purpose: Derleme, imza ve yayın görevlerinin ayrı sorumluluklarını kontrol etmek
domain: lane-responsibility-separation
module: e07-build-lane
owner: E7
implements: [ADR-013, ADR-008, ADR-007, C7.3, F7.3.1, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: lane-separation-check
tasks: [T-E7-004]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [M-E7-001, M-E6-001, V-E6-AUTHORITY-001, V-E7-ANDROID-001, V-E7-IOS-ACCESS-001, V-E7-IOS-RECOVERY-001, V-E7-IOS-CLEAN-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E7-004, T-E7-004, E-DEV-090]
evidence: [E-DEV-090]
supersedes: []
status: ACTIVE
---

# Derleme ve yayın sorumluluklarının ayrımı

T-E7-004, ADR013R3 sorumluluklarının ayrı tutulduğunu mevcut deklarasyon ve modül sınırları üzerinde denetler. Canonical kabul `Distinctness verified; no takeover`; FL7.3.1 ayrımın kaydını ve anahtar işlenmemesini ister, gerçek yürütme E6 kapılıdır ve burada yetkilendirilmemiştir. Bu değerlendirme gerçek kişilerin, anahtarların veya çalışan bir hizmet hattının birbirinden bağımsız olduğunu kanıtlamaz. Kaynak sınırları aşağıda karşılaştırıldı; bütün görev bağımsız incelemesi ve kaynak CI bekleniyor.

## Özgün ayrım koşulu

`build execution, signing/provisioning, artifact provenance, release approval, store identity/roles, upload transport and physical-device validation stay distinct.`

[ADR013 Decision3](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-013__MOBILE_BUILD_SIGNING_AND_RELEASE_OPERATIONS.md#L61-L65) yedi görevi ayrı tutar; E6 politika sahibi, E7 uygulayıcı ve E3 kanonik kaynak sunucusudur. E6'nın sekiz yayın alanı farklı bir sınıflandırmadır: bu yedi işlem, sekiz alanın yerine geçen yeni yetki listesi değildir.

## Yedi ayrı görev ve kaynak karşılaştırması

| Görev | Ayrı sorumluluk sınırı | Yerine geçemeyeceği sonuç | Gerçek uygulama kanıtı |
|---|---|---|---|
| build execution | E7 E6'nın izin verdiği kaynak/girdilerle çıktı hazırlar | İmza veya yayın onayı vermez | HELD; gerçek Kavriva mobil derleme sonucu yok |
| signing/provisioning | E7 izinli işlemi yürütür; anahtar emaneti ve imza politikası E6'da | İmzalı olmak yayın onayı veya sole-provider custody değildir | HELD; gerçek anahtar/emanet/izinli işlem yok |
| artifact provenance | Çıktının kaynak/build/version/digest bağı sağlayıcı dışında doğrulanabilir olmalı | Sağlayıcı beyanı, imza veya genel CI bu köken kanıtı değildir | HELD; gerçek mobil çıktı zinciri yok |
| release approval | E6 onay kararı ve ayrı yetki sınırı | Derleyen veya taşıyan sağlayıcı kendi çıktısını onaylayamaz | HELD; güncel üretim onay/emanet bağları yok |
| store identity/roles | E6 mağaza kimlik/rol politikası; E7 yalnız izinli mağaza uygulaması | Upload hesabı imza anahtarı veya yayın onayı sayılmaz | HELD; gerçek mağaza rol/hesap sınırı kurulmadı |
| upload transport | E7 yalnız onaylı çıktıyı E6 kapısı altında taşır | Taşıma başarısı onay, kaynak doğruluğu veya cihaz testi değildir | HELD; gerçek mağaza taşıması yok |
| physical-device validation | Gerçek cihazın ayrı kabul/doğrulama kanıtı | Simülatör/CI/VDS/ödünç iPhone erişimi tek başına fiziksel senaryo kanıtı değildir | HELD; gerçek cihaz senaryo sonucu yok |

Kabul edilmiş E7 manifestinin Public contract surface bölümü build/sign/provenance/approve/store/transport/verify ayrımını ve E6 politikasına uyumu açıkça bildirir. E6 manifesti politika sahibi olduğunu ve hattı kendisinin yürütmediğini belirtir. E7 Allowed dependencies yalnız E3/E6; E6 Allowed E3/E5. Plan MODULE_BOUNDARIES bu yönleri ve E1'in sadece kabul fixture bağını korur. Mevcut E7'de çalışan lane kodu yok, yalnız manifest var; no-takeover doğrulaması mevcut deklarasyonlar ve bu PR'ın hiçbir kod/politika/anahtar işlemi açmaması üzerindedir. İleride gerçek yürütme için ayrı güncel kanıt gerekir; yokluğundan runtime engel uygulandı sonucu çıkarılmaz.

## Sağlayıcının alamayacağı beş sahiplik

ADR013R3: `canonical source, release approval, sole signing-secret holder, protected audit authority or an exit dependency.`

| Sağlayıcıya devredilemeyen | Kaynak sınırı ve negatif örnek |
|---|---|
| canonical source | E3 kanonik kaynak sunar; sağlayıcının artifact/cache kopyası proje gerçeğinin yerine konmaz |
| release approval | E6 onay sınırı korunur; build başarı/sağlayıcı ALLOW/GitHub test yeşili yayın onayı değildir |
| sole signing-secret holder | E6 kontrollü emanet/iptal/yenileme gerekir; tek sağlayıcıda kalan anahtar bağımsız custody kanıtı değildir |
| protected audit authority | E5/E3/E6'nın kendi yetki/denetim sınırları korunur; sağlayıcı logu korumalı denetimin yerine geçmez |
| an exit dependency | Temiz yeniden üretim ve sağlayıcı değiştirme için bağımsız kanıt gerekir; opak sağlayıcı durumunu kopyalamak çıkış bağımsızlığı değildir |

Sağlayıcı izinli build/signing adımını yürütebilir; burada hesap, kaynak yetkisi, anahtar erişimi veya politika kararı verilmez. Rol adı, farklı e-posta/alias veya AI ikinci göz review'u fiziksel farklı imzalayan/kurtarma kişisi değildir. Mantıksal E6 registry tüm actualholder/key/audit bağlarını boş ve physical_activation HELD tutar; metadata ve private snapshot fixture'ları gerçek bağımsızlık kanıtı değildir. PROPOSED release-promotion belgesinden çalışan public API türetilmedi, E6 private import veya yeni seam yok.

## Anahtar kaybı ve teknik kurtarma sınırı

ADR013R3: `Key loss/exposure means revoke/rotate/reissue plus clean rebuild — never copying a compromised credential elsewhere.`

Anahtar kaybı/sızıntısında yön E6 iptal/yenileme/yeniden oluşturma ve temiz yeniden derlemedir. Bu kayıt anahtar işlemez, playbook yazmaz veya çalıştırmaz; T-E7-005 referans görevi bu görev tamamlanmadan ilerlemez. Sahip terminal/Xcode/Gradle/CI/SSH/anahtar/debug onarımını üstlenmez. Yalnız yönerge veya mock recovery gerçek kurtarma sayılmaz; etkilenen gerçek yol HELD.

## Bütün kapsam ve korunmuş eksikler

Yedi ayrı deklarasyon, beş sahiplik yasağı, kaynak sınırı karşılaştırması ve anahtar-kayıp yönü bu review görevinin kapsamıdır. Bağımsız whole-task hüküm ve CI olmadan belge DONE değildir. Bütün yedi gerçek uygulama kanıtı HELD; bu belge gerçek güvenli hat veya yayın yetkisi değildir. Evrensel operasyon handoff ID MISSING/BLOCKED; sınırlı belge devri D-APP-DOC-004v1/P-E10-007v1/P-E7-004.

Android hattı iOS/Mac eksikliği yüzünden durmaz. iOS ilk iki, sonraki iki ve beşinci koşul önceki üç profilde HELD; bu görev hepsini geçirip iOS'u açmaz. T-E7-002/T006007/E3R1 REVIEW/E5-003 IN_PROGRESS/PR47-57-59 değişmez. Hesap, satın alma, bütçe, anahtar, derleme, imza, mağaza veya cihaz işlemi yapılmadı. Kod/test/workflow/schema/runner değişmedi. Eski kanıtların birincil hükümleri korunur; yeni vault açıklamaları Türkçe.

## Kayıt adresleri ve iz

ADR013R3/ADR008R5/ADR007 → C7.3 → F7.3.1 → FL7.3.1 → T-E7-004 → M-E7-001 → E-DEV-090. Pack `vault/PACKS/P-E7-004.md`; görev `vault/REGISTRY/T-E7-004.md`; kanıt `vault/EVIDENCE/E-DEV-090.md`. E7 `modules/e07-build-lane/MANIFEST.md`; E6 `modules/e06-release/MANIFEST.md`; mantıksal registry `vault/PROFILES/release-authority-registry.md`; Android `vault/PROFILES/android-lane-checklist.md`; iOS `vault/PROFILES/ios-access-custody-proof.md`, `vault/PROFILES/ios-provenance-recovery-proof.md`, `vault/PROFILES/ios-clean-room-proof.md`.

## Bütün görev kaynak kabul kaydı — T-E7-004

Bağımsız /root/e7004_lane_separation_full_review ayrı sınırlı bağlamda gpt-6-luna/max spawn yapılandırmasıyla exact546d9663cd49f27a66215f43f23606703d197fd9 için FULL PASS verdi; bulgu yok. Model bilgisi gerçek spawn çağrısıdır, modelin çalışma içinde alt sürüm kimlik doğrulaması değildir. Sahip bağımsız altajan ikinci gözü ve gerekli yeşil CI sonrası olağan merge kabul etti; DEC0069 geçerli, pendingDEC0070 yetki değil. Taban2d3d38a786f5fa1c40192aa4c6128b2fe2e11aa8, planfa914f013fdcd032faed876689092da245989459.

İncelemeci bütün canonical kabulü karşılaştırdı: TASK_INDEX Distinctness verified; no takeover / F7.3.1 execution only / FL7.3.1 Separation recorded; no key handling; key-loss refers to E6 playbook; execution E6-gated noneauthorizedhere. Kabul, mevcut kaynak deklarasyonlarının ayrımının incelenmesidir; runtime enforcement görevi diye değiştirilmedi. Profilin yedi ayrı satırdaki sorumluluk sınırları ve birbirinin yerine geçmeyen sonuçları, E7 manifestindeki aynı yedili ayrım, beş sağlayıcı sahipliği yasağı ve E6 anahtar-kayıp yönü bütün kayıt/inceleme kabulünü karşılıyor. Gerçek hat, kişi, anahtar ve audit ayrılığı, gerçek provenance veya yayın yetkisi bu FULL tarafından onaylanmadı; yedi gerçek uygulama kanıtı HELD. E7 çalışan hat kodu yok; mantıksal E6 sekiz alanı farklı taksonomidir ve actualholder/key/auditrefsnull/physicalactivationHELD. No-owner-debug/Android bağımsız/allfiveiOSHELD ve E6 politika/E7 uygulama/E3 kaynak sınırları korunur. Sağlayıcının onayı veya teknik çıktısı yayın yetkisi değildir. Anahtar işlemi veya kompromize anahtar kopyası yok; key-loss politikası E6'da.

İncelemeci canonical ADR013/007/008/capability-feature-flow-acceptance/dependency/taskprotocol/packstandard/moduleboundary/E10rules bağlamlarını okudu; 12 sabit kaynak LF-normalize SHA256 özeti taban bloblarıyla bağımsız12/12 doğrulandı. Profil kaynakLF208b245726263d3688f70f8684e6716a50e05cdfe9419066b736cc8c2aec35af; hamv57snapshot184074byte/rawSHA6aa04f819cb1c6411a3b5f981a374c75dc1834072de68150c973dcd1d1e65692/baseblob bayt eşitliği, exact11allowedpaths, EDEV089primarysubject-review-verdict-history korunması, pack14alan/REVIEW/cleanworktree doğrulandı. İncelemeci dosya yazmadı ve test veya CI çalıştırmadı ya da bağımsız CI sorgulamadı. Sonuçlar ona mal edilmez.

Root kaynak12kontrol+42regresyonPASS0.433s/worst0/build83/routingREVIEW/diff/manualsource karşılaştırmaları PASS. Artifact öncesi packmetadataF7.2.1 adresi33d5eaa ile F7.3.1 yapıldı, eski checkpoint geçmişi korunur. Salt-okunur Temp manuel helper önce inline quote regex yüzünden IndexError, sonra iki ayrı tablonun releaseapproval satırını global saydığı için assertion verdi. Helper alıntı sınırı ve yedi görev tablosuna düzeltildi; profil değişmedi; EDEV090 geçmişinde kayıtlı. Bağımsız ret veya ürün testi başarısızlığı değildi. P-PROOF001 mevcut freshness uyarısı korunur.

Kaynak546d966 için 15/15 SUCCESS:
- pull_request architecture-checks: 37160807726 SUCCESS
- pull_request architecture-checks: 37160818225 SUCCESS
- pull_request e3-commit-authorization-tests: 37160807727 SUCCESS
- pull_request e3-live-auth-tests: 37160807758 SUCCESS
- pull_request e4-offline-composition-tests: 37160807734 SUCCESS
- pull_request e5-current-authority-tests: 37160807753 SUCCESS
- pull_request e6-release-policy-tests: 37160807740 SUCCESS
- pull_request e9-bounded-proposal-tests: 37160807718 SUCCESS
- push architecture-checks: 37160787057 SUCCESS
- push e3-commit-authorization-tests: 37160787015 SUCCESS
- push e3-live-auth-tests: 37160787017 SUCCESS
- push e4-offline-composition-tests: 37160787044 SUCCESS
- push e5-current-authority-tests: 37160787020 SUCCESS
- push e6-release-policy-tests: 37160786966 SUCCESS
- push e9-bounded-proposal-tests: 37160786943 SUCCESS

Açılışarchitecture37160807726 checks111313659999yediadımSUCCESS/T3job111313660550skipped0; etiketliarchitecture37160818225 checks111313692654yediadımSUCCESS/T3job111313692764 gerçekbeşadımSUCCESS. E4PR37160807734 170testPASS0.151s; E9PR37160807718 9testPASS0.001s. Otomatik T3 bağımsız incelemenin yerine geçmez.

Bu kaynak FULL+CI kabulüne dayanarak profilACTIVE, pack/görevDONE; yalnız profil/pack/görev/EDEV090/registry/routing altı kapanış dosyası. İlk hüküm exact546d966 kaynağına bağlıdır; finalmetadataaudit ve finalheadCI/T3 ayrı zorunlu, henüz bekleniyor. Eski pending ifadeler yazıldıkları anın kaydıdır. Yedi görev/beş sahiplik yasağı/12pins/rawv57/workingv58/manifestCI/priorEDEV089/kod-politika-workflow değişmez. Belge görevi DONE gerçek runtime/ürün/feature/flow/iOS/cihaz/yayın hazır oluşu değildir.

Sınırlı belge devri D-APP-DOC-004v1/P-E10-007v1/P-E7-004; universaloperationalhandoffID MISSING/BLOCKED. T-E7-005 actualE6playbook bulunmadan ilerlemez; T-E7-002/T006007/E3R1REVIEW/E5-003IN_PROGRESS/PR47-57-59 gerçek engelleri korunur. Yeni vault açıklamaları Türkçe, mevcut İngilizce tarihi kayıtlar değişmez.
