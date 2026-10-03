---
record_id: V-E7-IOS-RECOVERY-001
version: 1
purpose: iOS çıktısının bağımsız kaynak doğruluğu ve teknik kurtarma kanıtlarını ayrı değerlendirmek
domain: ios-lane-readiness
module: e07-build-lane
owner: E7
implements: [ADR-013, ADR-008, ADR-007, C7.2, F7.2.1, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: ios-provenance-recovery-proof
tasks: [T-E7-003b]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [M-E7-001, M-E6-001, V-E6-AUTHORITY-001, V-E7-ANDROID-001, V-E7-IOS-ACCESS-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E7-003b, T-E7-003b, E-DEV-088]
evidence: [E-DEV-088]
supersedes: []
status: REVIEW
---

# iOS çıktısının bağımsız kaynak doğruluğu ve teknik kurtarma

T-E7-003b, iOS üçüncü ve dördüncü koşulunun ayrı PASS/HELD değerlendirilmesini ister; taahhüt verilmez. Kabul edilmiş kaynaklarda iki gerçek kanıt da yok; iki koşul ayrı HELD kaydedildi. Bu, bir sağlayıcıda hiç hizmet olmadığı iddiası değildir: Kavriva için doğrulanmış gerçek çıktı ve kurtarma kaydı bulunmuyor. Bu kaynak bağımsız tam inceleme ve CI bekliyor.

## Kaynağın üçüncü ve dördüncü koşulu

3. `provider-neutral artifact provenance`
4. `no-owner-debug routine and incident recovery`

[ADR013 Decision2](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-013__MOBILE_BUILD_SIGNING_AND_RELEASE_OPERATIONS.md#L55-L60) bu koşulları beş ayrı kanıttan ikisi olarak tanımlar. F7.2.1 bağımsız geçmiş, sahipsiz kurtarma ve diğer üç koşulun ayrılığını korur. [ADR008 Decision4–8](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-008__CONSUMER_MOBILE_FRAMEWORK.md#L64-L71) gerçek erişim, sahip kontrollü yetki, cihaz ve gider sınırlarını korur.

## İki ayrı gerçek kanıt değerlendirmesi

| Kanıt | Sonuç | İncelenen kaynaklarda eksik olan | Gerçek kapanışta gereken |
|---|---|---|---|
| 3 — Sağlayıcıdan bağımsız artifact provenance ve geçmiş | HELD | Kavriva'nın gerçek iOS çıktısını onaylı kaynak, build/version kimliği ve digest ile bağlayan, sağlayıcı dışında doğrulanabilen kanıt yok | Gerçek çıktının ve kaynak/build/version/digest bağının bağımsız doğrulanması; kanonik geçmişin sağlayıcı dışında kalması ve kanıtın dışarı aktarılması. E6'nın politika ve güncel kararı ayrıca gerekir |
| 4 — Sahibe teknik onarım yaptırmadan rutin ve incident kurtarma | HELD | Hem rutin işletim hem olay sonrası kurtarma için gerçekten yapılan, teknik sorumlusu belli ve sahibin debug yapmadığını gösteren Kavriva kayıtları yok | Rutin ve incident yollarının gerçek sonuç kanıtları; teknik sorumluluk ve kurtarma çıktısının doğrulanması; kullanıcının terminal/Xcode/Gradle/SSH/CI/signing müdahalesine bağımlı olmayan uygulanabilir yol |

İki koşul birbirinin kanıtı değildir. Doğru çıktının hash'i rutin veya incident kurtarmayı kanıtlamaz; kurtarılan sistem de çıktının bağımsız kaynak doğruluğunu kendiliğinden kanıtlamaz. Rutin yol için kanıt bulunsa bile incident yolu eksikse dördüncü koşul HELD kalır. Belge örnekleri ve test girdileri gerçek işletim sonucu değildir.

## Kabul edilmeyen ikameler

- Git deposunda geçmiş olması veya checksum hesaplamak, gerçek iOS çıktısının bağımsız kaynak/build/version bağını tek başına kanıtlamaz. Başka kaynak veya sürüme ait digest geçerli değildir.
- Sağlayıcının kendi beyanı, imza tek başına, biçim doğruluğu, eski review, genel CI yeşili veya çağıranın ALLOW değeri bağımsız provenance veya E6'nın güncel yayın kararı değildir. Aynı kişinin takma adları bağımsız teknik doğrulama sağlamaz.
- Runbook yazmak, AI'ın kurtaracağını söylemesi, mock incident veya VDS/simülatör denemesi gerçek Kavriva iOS rutin ve incident kurtarma kanıtı değildir. Sahibe terminal, Xcode, Gradle, CI veya anahtar onarımı yaptıran yol koşulu karşılamaz.
- Ödünç iPhone gerçek Mac/Xcode çalıştırma veya Apple emaneti değildir. İlk iki koşulun ayrı HELD kaydı ve beşinci temiz oda yeniden derleme koşulu bu görevde PASS olmaz.
- Gerçek maliyet veya operasyon sınırı bilinmiyorsa boşluk yeni sağlayıcı, ücretli plan veya bütçe varsayımıyla kapatılmaz. iOS sorunu Android'in bağımsız devamını durdurmak veya E6 politikalarını zayıflatmak için gerekçe değildir.

## Politika ve gerçek çalışma sınırları

E6 yayın, imza ve emanet politikasını belirler; E7 izinli hattı uygular; E3 kanonik kaynak sunar. Mevcut E6 iç snapshot testleri verilen baytları bağlar, gerçek iOS build/provenance/yayın otoritesi oluşturmaz. Private E6 modülü ithal edilmez; proposed release-promotion belgesi olumlu runtime API veya gerçek yayın kararı değildir. Yeni kod/test/workflow/runner/publicseam/E7→E1runtime bağı yok.

Android kendi hattında bağımsız kalır; paylaşılan Flutter değişikliklerinin etkisi gerçek kanıtla kontrol edilmelidir. Kullanıcı gizli debugger veya build işletmecisi değildir. Teknik ekip/AI kapasitesinin adını yazmak gerçek kurtarma sonucunu üretmez; gerçek sorumlu ve sonuç bulunmadığından dördüncü koşul HELD.

Satın alma, hesap/rol veya sağlayıcı değişikliği, Mac kapasitesi, ücretli plan, anahtar/certificate/profile işlemi, build, signing, store submission veya cihaz denemesi yapılmadı. Gerçek dış işlem ileride gerekiyorsa kaynak, kullanıcı sonucu, kişi/adımlar, seçenek ve bilinen gider/gecikme mevcut sade bildirimle açıklanır; bilinmeyen tutar/süre uydurulmaz.

## Kabul ve izlenebilirlik

İki ayrı HELD değerlendirme kaydı bütün T-E7-003b kapsamıdır; gerçek provenance/kurtarma veya iOS hazır oluşu değildir. İlk iki koşul T-E7-003a'da HELD; beşinci T-E7-003c değerlendirmesi yapılmadı. Beş ayrı PASS ve E6 güncel yayın kararı olmadan iOS açılmaz. Evrensel operasyon devri ID MISSING/BLOCKED; sınırlı P-E7-003b belge devri D-APP-DOC-004v1/P-E10-007v1 biçimindedir. Geri dönüş yalnız kendi belge değişikliğini geri alır; geçmiş kanıt ve E6 politikası korunur.

T-E7-002 gerçek provenance-binding henüz tamamlanmadı. T-E3-001-R1 REVIEW/T-E5-003 IN_PROGRESS/PR47-57-59/T006007 değişmedi. Ürün, feature, flow, gerçek cihaz veya fiziksel yayın hazırlığı DONE iddiası yok. ADR013R2 → C7.2 → F7.2.1 → FL7.2.1 → T-E7-003b → M-E7-001 → E-DEV-088.

## Kayıt adresleri

Pack `vault/PACKS/P-E7-003b.md`, görev `vault/REGISTRY/T-E7-003b.md`, kanıt `vault/EVIDENCE/E-DEV-088.md`; önceki iki koşul `vault/PROFILES/ios-access-custody-proof.md`, Android `vault/PROFILES/android-lane-checklist.md`, E6 `modules/e06-release/MANIFEST.md`, E7 `modules/e07-build-lane/MANIFEST.md`. Yeni açıklamalar Türkçe; önceki İngilizce kayıtlar korunur.
