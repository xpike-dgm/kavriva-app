---
record_id: V-E2-FRAMEWORK-001
version: 1
purpose: Yönetim çalışma alanı için aynı koşullarda dört altyapı denemesi
domain: internal-operations
module: e02-panel
owner: E2
implements: [ADR-010, ADR-015, C2.1, F2.1.1, FL2.1.1]
public_contracts: []
internal_scope: framework-evidence-fixture
tasks: [T-E2-001]
tests: [modules/e02-panel/internal/framework-gate/tests/contracts.test.mjs, modules/e02-panel/internal/framework-gate/tests/browser.mjs]
superseded_by: []
last_verified: 2026-10-18
depends_on: [M-E2-001]
used_by: [P-E2-001, T-E2-001, E-DEV-125, V-E2-SHELL-001]
evidence: [E-DEV-125]
supersedes: []
status: IN_PROGRESS
---

# Yönetim altyapısı — ortak karşılaştırma sözleşmesi

ADR010 dört aileyi aynı gerçek örnekte sınamadan seçim yapılmasını yasaklar. Bu kayıt yalnız iç deneme kapsamıdır; ürün kabuğu veya bir altyapı seçimi değildir. E2 kaynak yetkisi üretmez; gerçek E3/E5 bağlantısı bu örneğe bağlanmadı.

Sabit fixture.json ve reading-questions.json koddan önce 7f8010c9a198ad027b2ca9aad914e037775a4343 içinde kaydedildi. 240örnek kayıt/20sayfa,1440x900test tabanı, liste/ayrıntı/eski-güncel farkı/metin eşli grafik/taslak formu aynı dört yerel framework bileşeninde çalışır. Örnek pozitifler test sunucusuna aittir; üretim oturum veya yetki yazımı değildir.

API yalnız loopback deneme sunucusunda; HttpOnly/SameSite cookie, güncel epoch, aynı origin/CSRFmarker, tam kaynak sürümü, auditöncesi tek yazım, same-id belirsizsonuç sorgusu, özel karantina ve kapalı aktifönizleme senaryolarını sağlar. Bunlar E3/E5 gerçek backend kabulünün yerine geçmez. Ürün bağlı değilken pozitiffixture etkinleştirmek yasaktır.

Dört adayın tam kilidi/lisans/engine/audit/SBOM raporu saklanır. Gerçek ekran okuyucu, gerçek browserzoom, majoryükseltme, destekömrü, operasyonmaliyeti/çıkış ve bağımsız kapılar olmadan tüm adaylar HELD. Nuxt paket açığı diğerini otomatik kazandırmaz. Yeni framework seçimi ancak kanıt ve supersedingADR ile mümkündür.

Bağlayıcı açıkkapı kaynağı: `vault/PACKS/P-E2-001.md` ve `vault/REGISTRY/T-E2-001.md`; ADR010 seçimi ve ürün kabulü henüz kapalıdır.


## Destek ömrü — 18 Ekim 2026 tarihli kaynak okuması

- [React resmi sürüm politikası](https://react.dev/community/versioning-policy): kararlı sürümlerde semver; etkilenen major sürümlere güvenlik düzeltmesi geri taşınır. Bu belgeye dayanarak tarihli LTS bitişi veya ücretli müdahale garantisi yazılamaz. Vite ve TypeScript ayrı bakım bağımlılıklarıdır.
- [Angular resmi sürüm/destek tablosu](https://angular.dev/reference/releases): v22 aktif destek yaklaşık Haziran2027, LTS bitişi Haziran2028; v22 ile major ritmi yıllık ve toplam tipik destek24ay. Tarihler değişebilir. Eski altı aylık ritim bu sürüm için güncel kabul edilmez. CLI/core eşliği ve TS uyumu kilitlerle korunur.
- [Nuxt resmi yol haritası](https://nuxt.com/docs/4.x/community/roadmap/): Nuxt3 desteği31Temmuz2026da bitti. Bu deneyde3.21.11 yalnız eski-major göç girdisidir; yeni ürün için öneri veya güvenli eski sürüme dönüş hedefi değildir. Nuxt4 destek çizgisi ve kilitte görülen güvenlik bulguları ayrı değerlendirilmelidir;3ün bittiği bilgisi4ün reddi anlamına gelmez.
- [SvelteKit3 resmi göç belgesi](https://svelte.dev/docs/kit/migrating-to-sveltekit-3): Vite eklentisine taşınan yapılandırma ve yükselen minimum bağımlılıklar açık değişikliklerdir. SvelteKit2→3 deneyi, Svelte4→5 göçü olarak adlandırılmaz. İncelenen kaynakta tarihli LTS taahhüdü doğrulanmadı; garanti varsayılmaz.

## Gerçek deneme sınırları ve bakım yükü

Normal çalışma bu örnekte statik dosya ve aynı loopbackAPI ile ölçülür; ayrı SSR sunucusu yoktur. Paket/BOM/artifact boyutları ve komut süreleri gerçek deney verisidir; üretim aylık faturası veya gelecek bakım saatine çevrilmez. Olay yolu aynı kapalı durum ve aynı işlemkimliği sorgusudur; dosya yolu özel karantinadır; destek/çıkış her adayda görünür. Sahibe SQL/SSH/konsol onarımı atanmaz. Üretim hostu, kapasitesi ve kullanım trafiği seçilmediğinden üretim parasal maliyeti HELD kalır.

AI çakışması için mevcut E10 kuralı ayrı çıktı/sabit görev/dosya sahipliği/kaynak pinleri ve görsel-anlamsal denetimdir. Otomatik çalışma zamanı dosya kilidi veya çoklu ajan ekran üretimi gerçekleştirilmiş sayılmaz. Bu görevde uygulamayı tek yazar üretir; bağımsız görevsonu inceleme ayrı yapılır. Dört nativeUI aynı model ve iş yükünü kullanır; birebir gövde eşliği, kapalıform temizliği ve doğalPNG okuması tasarım gerilemesini sınar. Framework seçimi bu ortak sözleşmenin yerine geçmez.


Nuxt yol haritasının gerçek Markdown yanıtı ayrıca saklandı: 4.x şu an kararlı sürüm; destek bitişi 5.x yayımlandıktan altı ay sonrası. 5.x için Q4 2026 yalnız tahmin, yayımlanmış sürüm gibi yazılmaz. Bu nedenle 4.x için uydurma kesin bitiş tarihi verilmez. Bu destek çizgisi ile mevcut kilitteki güvenlik bulguları ayrı risklerdir.

## Aynı örneğin yerel karşılaştırma ölçümleri

Bu tablo R3 denemesinin gerçek çıktısıdır. Derleme klasörlerindeki bütün dosyaları kapsar; ağ aktarımı veya uygulama hız ölçümü değildir. gzip toplamı her dosyanın ayrı sıkıştırılmasıdır. Eski sürümler göç girdisidir; üretimde eski sürüme dönme önerisi değildir.

| Aday | Eski / güncel kilit paketi | Güncel statik çıktı (bayt) | Güncel ayrı gzip toplamı (bayt) | Yerel güvenlik taraması |
|---|---:|---:|---:|---|
| react | 51 / 48 | 232033 | 72588 | 0 kayıtlı bulgu |
| angular | 512 / 347 | 124303 | 42417 | 0 kayıtlı bulgu |
| nuxt | 757 / 712 | 163615 | 63760 | 11 yüksek bağlı bulgu; iki kök; açık |
| svelte | 84 / 80 | 100635 | 39822 | 0 kayıtlı bulgu |

Dört adayda da lisans alanı eksik paket sayısı sıfır; bu bir hukuk incelemesi değildir. Güncel dört adayın npm ağacı ve kilit temelli CycloneDX üretimi başarılı. Eski SvelteKit2 ağacında cookie üzerinden düşük düzey bulgular, eski Nuxt3 ağacında ek destek/güvenlik riski raporda korunur. Yeni ürünün bu eski sürümlere kurulması kabul edilmez.

React en küçük bağımlılık ağacını, SvelteKit en küçük statik çıktıyı verdi; Angular açık tarihli destek çizgisine sahip. Bunlar ayrı ödünleşimlerdir. Dosya boyutu, tanınırlık veya başka adayın sorunu tek başına kazanan seçmez. R3 yerel toplam dört-aday build süresi eski fazda 44.692 saniye, güncel fazda 35.913 saniye. Bu toplamlar tek adayın performansı veya üretim faturası olarak sunulmaz. İki fazda Windows gerçek okuyucu NOT_RUN; yeni Linux CI ve bağımsız görevsonu inceleme beklenir.

## Dosya sahipliği ve çakışma denemesi

`bc057850192d8f27e9f22e22bfd87ac9542c5edd` başlığındaki dört gerçek native bileşenin her biri için aynı tabandan iki sentetik başlık değişikliği ayrı dosyalara yazıldı. Gerçek `git merge-file --stdout proposal-a.txt base.txt proposal-b.txt` dört adayda da exit1 ve açık çakışma işaretleri üretti; iki öneri ve çakışma çıktısı ayrı korundu, depodaki kaynak baytları değişmedi. Bu gerçek Git çakışma deneyidir; iki bağımsız AI tarafından kod yazıldığı veya otomatik runtime dosya kilidi kurulduğu iddiası değildir.

Kontrol yolu E10 kuralıyla aynı: sabit görev ve taban, tek dosyanın sahipliği, ayrı öneri çıktıları, çakışmayı görünür bırakma, incelemeden birini doğru kabul etmeme. Değişen headingin tasarım/okuma sözleşmesini koruduğu kanıtlanmadığından hiçbir öneri uygulanmadı. Semantic/görsel kabul ve görev sonu bağımsız inceleme ayrıca gerekir. Çerçeve seçimi çoklu AI üretiminin otomatik tutarlı olduğu garantisini vermez.


R1 bütün görev incelemesi CHANGES_REQUIRED/HOLD verdi. Ortak modelde aynı-ID yenileme/reload ve doğrulanmamış çıkış onarımı; dört native tabloda aynı güncel erişilebilir ad;92 browser/11HTTP yerel PASS. Tab içi iz sürme kaydı yalnız fixture UUID/çıkış niyetidir, yetki veya özel veri değildir. Gerçek Linux3aşamalı okuyucu/majorCI ve bağımsız yeniden hüküm beklenir. Eski76browser/10HTTP kanıtları yalnız eski exact-head kaynaklarını kapsar. Nuxt Q4 2026 resmi yönlenmiş ham yanıt8.853bayt SHA25666cb5a6fa9b7a149b5c8064abc5b8418c728b170eea7fb56f71966bb80267d1d ile tekrar okundu; resmi releaseAPI4.6.2 published2026-10-16T17:21:23Z döndü. Yeni kaynak R1deki Q1/4.6.0 gözlemini sessizce değiştirmez; yeniden incelemeye sunulur.
