---
record_id: V-E7-IOS-CLEAN-001
version: 1
purpose: iOS temiz yeniden derleme ve sağlayıcı değiştirme kanıtını değerlendirmek
domain: ios-lane-readiness
module: e07-build-lane
owner: E7
implements: [ADR-013, ADR-008, ADR-007, C7.2, F7.2.1, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: ios-clean-room-proof
tasks: [T-E7-003c]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [M-E7-001, M-E6-001, V-E6-AUTHORITY-001, V-E7-ANDROID-001, V-E7-IOS-ACCESS-001, V-E7-IOS-RECOVERY-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E7-003c, T-E7-003c, E-DEV-089]
evidence: [E-DEV-089]
supersedes: []
status: REVIEW
---

# iOS temiz yeniden derleme ve sağlayıcı değiştirme kanıtı

T-E7-003c beşinci gerçek iOS koşulunu PASS/HELD değerlendirmeyi ve taahhüt vermemeyi ister. Kabul edilmiş kaynaklarda Kavriva için doğrulanabilir temiz iOS yeniden derleme ve sağlayıcı değiştirme sonucu yok; beşinci koşul HELD. Bu kayıt herhangi bir sağlayıcının hiç böyle hizmeti olmadığı iddiası değildir. Bağımsız bütün görev incelemesi ve bu kaynak başlığının gerçek CI sonucu bekleniyor.

## Özgün beşinci koşul

5. `clean-room rebuild and provider replacement without copying opaque provider state.`

[ADR013 Decision2](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-013__MOBILE_BUILD_SIGNING_AND_RELEASE_OPERATIONS.md#L55-L60) beş kanıtın ayrı doğrulanmasını ve hepsi geçmeden iOS'un HELD kalmasını ister. [ADR008 Decision4–8](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-008__CONSUMER_MOBILE_FRAMEWORK.md#L64-L71) gerçek çalıştırma/emanet/cihaz/gider kanıtlarını korur; sağlayıcı veya ücretli taahhüt seçmez.

## Beşinci koşulun tek değerlendirmesi

| Kanıt | Sonuç | Eksik olan gerçek sonuç | Kapanışta gereken |
|---|---|---|---|
| 5 — Temiz yeniden derleme ve sağlayıcı değiştirme | HELD | Hem temiz ortamdan gerçek Kavriva iOS çıktısının yeniden üretilmesi hem sağlayıcının gizli/kapalı durumunu kopyalamadan değiştirilmesinin sonuç kanıtı yok | Onaylı kaynak, girdiler, araç/bağımlılık kimlikleri ve gerçek çıktı/build/version/digest bağının bağımsız doğrulanması; ayrı sağlayıcıya geçişte aynı portable source/evidence üzerinden çalışabilirlik, dışarı aktarılabilir kanıt ve opak sağlayıcı durumuna bağımlı olunmadığının gerçek gösterimi |

İki altgereksinim birlikte gerekir. Temiz yeniden derleme başarılı olsa bile sağlayıcı değiştirme sonucu eksikse beşinci koşul HELD. Sağlayıcı değiştirilmiş olsa bile temiz yeniden üretim yoksa HELD. Beklenen sonucu burada yazmak, gerçek çıktı üretmek veya kanıtları doğrulamak değildir. Rutin/incident kurtarma koşulu ayrı T-E7-003b kapsamındadır; bu değerlendirmeye karıştırılmaz.

## Geçerli sayılmayan ikameler

- Git clone veya kaynak dosyası kopyalamak, checksum üretmek, genel CI yeşili, bir container/simülatör/VDS örneği veya sahte artifact gerçek Kavriva iOS temiz yeniden derleme kanıtı değildir.
- Yalnız dışarı aktarılabilir dosya, bir runbook, yeni sağlayıcı hesabı veya sağlayıcının kendi beyanı sağlayıcı değiştirme sonucunu kanıtlamaz. Taşınan çıktının kaynağı/build/version/digest bağını açıklamayan eski kanıt geçerli değildir.
- Açıklanamayan sağlayıcı önbelleği, gizli ayar veya opak build durumunu kopyalayarak çalıştırmak bağımsız sağlayıcı değiştirme sayılmaz. Canonical source/release approval/sole signing-secret/protected audit/exit dependency sağlayıcıya taşınamaz; E6 politikası korunur.
- Başka kaynak/sürüm/çıktıya ait proof, eski review, yalnız imza, çağıranın ALLOW değeri, rol takma adı veya AI sözü bu gerçek kanıtı geçirmez. Gerçek cihaz davranışı ayrıca kanıtlanır; clean-room kaydı telefon testi yerine geçmez.
- Sahibe terminal/Xcode/Gradle/SSH/CI/signing/debug onarımı yaptıran yol kabul edilmez. Anahtar kaybı veya sızıntısı eski anahtarı başka yere kopyalamakla çözülmüş sayılmaz; E6 iptal/yenileme/yeniden oluşturma yönü değişmez.

## Beşli paketin ve yayın kararının sınırı

İlk iki koşul `vault/PROFILES/ios-access-custody-proof.md` içinde ayrı HELD; üçüncü ve dördüncü `vault/PROFILES/ios-provenance-recovery-proof.md` içinde ayrı HELD. Bu kayıtta beşinci koşul da HELD. Üç belge görevi kabul edilmiş olsa bile beş gerçek kanıt PASS değildir; iOS aktivasyonu kapalı kalır. Bütün beş gerçek kanıt ve E6'nın güncel yayın kararı olmadan derleme/imza/mağaza işlemi açılmaz.

E6 yayın/imza/emanet politikasını belirler; E7 izinli hattı uygular; E3 kanonik kaynak sunar. Mantıksal E6 kaydı, verilen baytları bağlayan iç snapshot testleri veya PROPOSED release-promotion belgesi gerçek iOS runtime otoritesi değildir. Private E6 import/publicseam/E7→E1runtime/kod/test/workflow/runner/schema değişikliği yok; E1 kabul fixture'ı dışında runtime tüketicisi değildir.

Android hattı iOS/Mac eksikliği yüzünden durmaz. Paylaşılan Flutter değişikliklerinin etkisi gerçek kanıttan ayrı olarak uydurulmaz. Bu görev provider/account/purchase/paidplan/finalbudget/build/signing/certificate-profile-privatekey/store/device eylemi yapmadı; araç veya kapasite seçmedi. Gerçek dış iş gerektiğinde mevcut sade bildirim, kaynak ve sonuç, kişi/adımlar, seçenek, bilinen gider/gecikme ve AI'ın sürdüreceği işi açıklar; bilinmeyen tutar/süre uydurulmaz, kullanıcı gizli debugger olmaz.

## Kabul ve devir

Tek beşinci koşulun iki altgereksinimiyle HELD değerlendirme kaydı bütün T-E7-003c belge kapsamıdır. Gerçek iOS/ürün/feature/flow/cihaz/yayın veya universal operational handoff kanıtı değildir; evrensel handoff ID MISSING/BLOCKED. Sınırlı belge devri D-APP-DOC-004v1/P-E10-007v1/P-E7-003c biçiminde; geri dönüş yalnız kendi belgeyi geri alır, eski kanıt ve E6 politikası korunur.

T-E7-002/T006007 ilerlemez; E3R1 REVIEW/E5-003 IN_PROGRESS/PR47-57-59 beklemede. Önceki iki profilin gerçek HELD durumu ve önceki birincil kanıtlar değişmez. ADR013R2 → C7.2 → F7.2.1 → FL7.2.1 → T-E7-003c → M-E7-001 → E-DEV-089.

## Kayıt adresleri

Pack `vault/PACKS/P-E7-003c.md`, görev `vault/REGISTRY/T-E7-003c.md`, kanıt `vault/EVIDENCE/E-DEV-089.md`; E6 `modules/e06-release/MANIFEST.md`, E7 `modules/e07-build-lane/MANIFEST.md`, Android `vault/PROFILES/android-lane-checklist.md`. Yeni vault açıklamaları Türkçe; mevcut İngilizce tarihi kayıtlar korunur.
