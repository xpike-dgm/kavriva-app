---
record_id: V-E7-BANDS-001
version: 1
purpose: Derleme kabiliyetlerinin dört sınıfını ve ihtiyaç tetiklerini güncel tutmak
domain: lane-capability-classification
module: e07-build-lane
owner: E7
implements: [ADR-013, ADR-008, ADR-007, C7.4, F7.4.1, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: lane-capability-classification
tasks: [T-E7-006]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [M-E7-001, M-E6-001, V-E6-AUTHORITY-001, V-E7-ANDROID-001, V-E7-IOS-ACCESS-001, V-E7-IOS-RECOVERY-001, V-E7-IOS-CLEAN-001, V-E7-SEPARATION-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E7-006, T-E7-006, E-DEV-091]
evidence: [E-DEV-091]
supersedes: []
status: REVIEW
---

# Derleme kabiliyetlerinin dört sınıfı ve ihtiyaç tetikleri

T-E7-006 kabulü `Bands current; triggers explicit`. Bu kayıt kabul edilmiş ADR013R4 sınıflarını bütün nitelikleriyle tutar ve kullanım nedeninin hangi durumda değerlendirmeyi tetikleyeceğini açıklar. Sınıflandırma, gerçek Android/iOS hazırlığının geçtiğini veya hesap, satın alma, anahtar, derleme, imza, mağaza ya da cihaz işlemi yetkisi verildiğini söylemez. Bütün görev bağımsız incelemesi ve kaynak CI sonucu bekleniyor.

## Onaylı sınıflandırma kaynağı

[ADR013 Decision4](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-013__MOBILE_BUILD_SIGNING_AND_RELEASE_OPERATIONS.md#L66-L72) dört ayrı sınıfı belirtir. İlk Android sürümünde zorunlu sınıfı Decision1'in sekiz bileşik kalemidir; [Decision1](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-013__MOBILE_BUILD_SIGNING_AND_RELEASE_OPERATIONS.md#L48-L54). E6 politika sahibi, E7 yalnız sınıflandırmayı tutan uygulayıcı, E3 kaynak sunucusudur. Yeni politika, eşik veya çalışma zamanı API'si tanımlanmaz.

## İlk Android sürümü için zorunlu — sekiz kalem

Tetik: ilk Android sürümünü gerçekten hazırlama/yayınlama ihtiyacı. Her kalem kendi gerçek kanıtı ve E6'nın güncel kararıyla doğrulanmadan hat hazır sayılmaz. Mevcut sekiz Android kanıtının eksikliği korunur; sınıflandırma kaydı hazır oluş belgesinin yerine geçmez.

| Özgün kalem | Ayrı ihtiyaç ve kanıt sınırı | Mevcut gerçek kanıt |
|---|---|---|
| canonical source stays outside build providers | E3 kanonik kaynak doğruluğu ve sağlayıcı dışında denetlenebilir kaynak bağı | HELD |
| build success is never release approval | Gerçek derleme sonucu E6 onayını atlayamaz | HELD |
| Android signing/upload-key custody and Google Play authority stay separate from CI execution | İmza/yükleme anahtarı ve mağaza yetkisi CI'dan ayrı kanıtlanır | HELD |
| artifact provenance binds canonical source, build/version identity and digest | Gerçek çıktının tam kaynak/sürüm/özet bağı | HELD |
| machine-readable build status with technical recovery ownership | Gerçek durum kaydı ve teknik kurtarmanın AI/uygun operatör sahibi; kullanıcı debugger olmaz | HELD |
| least-privilege secret handling with redaction review | Gerçek sırların dar izin/maskeleme kontrolü | HELD |
| spend/quota/billing visibility with safe hold | Gerçek kullanım/kota/ödeme görünürlüğü ve güvenli bekleme | HELD |
| exportable artifacts/evidence plus a provider-exit runbook | Dışarı çıkarılabilir gerçek çıktı/kanıt ve E6 uyumlu sağlayıcı çıkış yolu | HELD |

## iOS aktivasyonuna kadar ertelenebilir — beş kalem

Değerlendirme tetiği: iOS kapılarındaki gerçek kanıt ihtiyacının ortaya çıkması. iOS gerçekten etkinleştirilmeden önce beş ayrı kanıtın tamamı ve güncel E6 kararı gerekir. Kanıt ihtiyacının değerlendirilmesi, kanıt toplama ile aktivasyonu birbirine karıştırmaz; tek başına hiçbir kapıyı geçirmez veya hesap/ücretli kurulum yetkisi üretmez. Mevcut iOS koşulları HELD; Android bu eksiklik yüzünden durmaz.

| Özgün kalem | Ayrı değerlendirme sınırı | Mevcut gerçek kanıt |
|---|---|---|
| real Mac/Xcode path | Gerçek Kavriva çalıştırma erişimi; ödünç iPhone/VDS/CI Mac erişimi değildir | HELD |
| Apple signing/Connect setup | Apple emanet/imza/Connect sınırlarının gerçek kaydı | HELD |
| any Xcode Cloud bootstrap | iOS ihtiyacı varsa ayrı açılış/emanet/kurtarma kanıtı; otomatik ücretli seçim değildir | HELD |
| borrowed-iPhone validation | Ayrı gerçek cihaz senaryosu; tek başına derleme veya imza erişimi değildir | HELD |
| iOS store transport | İzinli gerçek çıktının mağaza taşıması; yayın onayından ayrı | HELD |

## İsteğe bağlı; her biri ayrı kanıt ister — dört kalem

Tetik: somut ihtiyacın ve o kaleme özel kanıtın değerlendirilmesi, E6 sınırlarının korunması. İsteğe bağlı sınıfta bulunmak hazır oluş veya kullanım izni değildir. Eksik kanıt varsa kalemin gerçek kullanımı HELD.

| Özgün kalem | Ayrı ihtiyaç ve kanıt sınırı | Mevcut gerçek kanıt |
|---|---|---|
| provider-managed signing | Somut yürütme ihtiyacı; E6 emanet/iptal/yenileme/çıkış bağımsızlığı kanıtı, sağlayıcı tek sır sahibi olamaz | HELD |
| long retention | Gerçek saklama ihtiyacı ve ayrı dışarı aktarılabilirlik/gider/çıkış kanıtı | HELD |
| extra concurrency | İsteğe bağlı eşzamanlılık ihtiyacı için ayrı kapasite/maliyet/kurtarma kanıtı | HELD |
| provider AI/debug summaries as helper signals only | Yardımcı özet ihtiyacı için ayrı veri/denetim kanıtı; hiçbir onay veya otorite üretmez | HELD |

## Ölçek ihtiyacıyla değerlendirilecek; mevcut öneri değil — altı kalem

Tetikler gerçek kullanım/yük, mevcut izinli kapasite ve ayrı kanıtla değerlendirmeyi başlatır. Şu anda ölçülmüş tetik sonucu, sayı eşikleri veya seçilmiş plan yok. Gereksinim oluştuğunda E6'nın güncel kararı ve geçerli harcama yetkisi ayrı gerekir; bu kayıt bunları üretmez.

| Özgün kalem | Açık değerlendirme tetiği | Mevcut durum |
|---|---|---|
| paid Xcode Cloud compute above allowance | Gerçek iOS hesaplaması mevcut geçerli allowance sınırını aşma ihtiyacını gösterdiğinde; above allowance niteliği korunur | HELD; tetik kanıtı yok |
| extra concurrency | Gerçek yükte mevcut izinli eşzamanlılığın yetersiz kaldığı ölçüldüğünde | HELD; tetik kanıtı yok |
| annual/unlimited plans | Sürekli gerçek kullanım için mevcut izinli planın uygunluğu yeniden değerlendirilmek gerektiğinde | HELD; tetik kanıtı yok |
| dedicated Mac/host capacity | Gerçek yük/işletim ihtiyacı mevcut izinli kapasiteyle karşılanamadığında | HELD; tetik kanıtı yok |
| enterprise support/SLA | Gerçek işletim/kurtarma ihtiyacı mevcut destek sınırlarını aştığında | HELD; tetik kanıtı yok |
| warm secondary provider | Gerçek süreklilik/kurtarma ihtiyacı ikinci sağlayıcı değerlendirmesi gerektirdiğinde ve bağımsız yeniden üretim/çıkış kanıtı bulunduğunda | HELD; tetik kanıtı yok |

`extra concurrency` isteğe bağlı ve ölçek sınıflarında iki ayrı nitelikli bağlamla bulunur; biri silinmez, tek bir band etiketiyle zorla birleştirilmez. Ölçek sınıfı kalemleri güncel öneri değildir. Buradaki tetikler yeni sayısal politika eşikleri belirlemez; bilinmeyen değer MISSING/HELD kalır. TRY 2.000–3.000/ay mağaza dışı planlama bağlamı kaynak ADR'deki bağlamdır; güncel fiyat, bütçe veya satın alma yetkisi değildir. Mağaza ücretleri ayrı yönetişim konusudur.

## Güncellik ve yeniden denetim

Kayıt sınıfları kabul edilmiş ADR013R4/R1 sürümüyle karşılaştırılır. Plan/politika revizyonu, sağlayıcı kabiliyetinde değişiklik, gerçek kullanım/kota/saklama/işletim gereksinimi veya iOS kapısı durumu değiştiğinde ilgili kalemler ve nitelikler tekrar gözden geçirilir. Eski pin, yeni koşula verilmiş güncel karar değildir; değişen veya doğrulanamayan gereksinimde ilgili gerçek yol HELD. Bütün listeyi sessizce ücretli plana veya öneriye çevirmek yok. Taahhüt gereksinimi doğduğunda açık sade bildirim kaynak/sonuç/kişi-adımlar/seçenek/bilinen gider-gecikme/geri dönüş/AI devam işi içerir; tutar/süre uydurulmaz ve kullanıcı teknik onarımı üstlenmez.

## Kabul sınırı, kanıt ve devir

Dört sınıfta tam 8/5/4/6 kalem ve nitelikli ihtiyaç tetikleri bu kayıt görevinin bütün kapsamıdır. Gerçek hizmet/hardware/hesap/anahtar/derleme/mağaza/üretim aktivasyonu değildir; evrensel operasyon handoff ID MISSING/BLOCKED. Belge devri D-APP-DOC-004v1/P-E10-007v1/P-E7-006 kapsamında; geri dönüş kendi belge PR'ını geri alır, eski kanıt ve E6 politikası korunur.

T-E7-002 ve T-E7-005 gerçek eksikleri korunur; E6 key-loss playbook varmış gibi referans uydurulmaz. T006007/E3R1 REVIEW/E5-003 IN_PROGRESS/PR47-57-59 ve gerçek Android/iOS/yayın HELD kalır. Runtime kod/test/workflow/privateimport/seam değişikliği veya hesap/satın alma/anahtar/build/signing/store/device eylemi yok. Yeni vault açıklamaları Türkçe; eski İngilizce kayıtlar korunur.

ADR013R4/R1 → C7.4 → F7.4.1 → FL7.4.1 → T-E7-006 → M-E7-001 → E-DEV-091. Pack `vault/PACKS/P-E7-006.md`; görev `vault/REGISTRY/T-E7-006.md`; kanıt `vault/EVIDENCE/E-DEV-091.md`; E7 `modules/e07-build-lane/MANIFEST.md`; E6 `modules/e06-release/MANIFEST.md`; Android `vault/PROFILES/android-lane-checklist.md`; ayrım `vault/PROFILES/lane-separation-check.md`.
