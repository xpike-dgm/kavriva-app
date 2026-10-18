---
test_id: E-DEV-125
contract_id_version: "C2.1/F2.1.1/FL2.1.1 closed shell candidate + equal fixture v1"
subject_file: modules/e02-panel/internal/workspace-shell/src/workspace-shell.tsx
subject_digest: e6b6abddeef2a09525f6f7083fbb13143578fcbacbb70dc2bf9b3f78a5762e5e
result: "Karşılaştırma CI kanıtı ve yerel kapalı kabuk; görev IN_PROGRESS"
evidence_links: [modules/e02-panel/internal/workspace-shell/package.json, modules/e02-panel/internal/workspace-shell/package-lock.json, modules/e02-panel/internal/workspace-shell/tsconfig.json, modules/e02-panel/internal/workspace-shell/vite.config.ts, modules/e02-panel/internal/workspace-shell/index.html, modules/e02-panel/internal/workspace-shell/src/main.tsx, modules/e02-panel/internal/workspace-shell/src/workspace-shell.tsx, modules/e02-panel/internal/workspace-shell/src/workspace.css, modules/e02-panel/internal/workspace-shell/tests/server.mjs, modules/e02-panel/internal/workspace-shell/tests/browser.mjs, modules/e02-panel/internal/workspace-shell/tests/orca.py, modules/e02-panel/internal/workspace-shell/tests/zoom-extension/manifest.json, modules/e02-panel/internal/workspace-shell/tests/zoom-extension/worker.js, vault/PROFILES/workspace-shell.md, modules/e02-panel/internal/framework-gate/tools/upgrade.mjs, modules/e02-panel/internal/framework-gate/tools/upgrade-versions.json, modules/e02-panel/internal/framework-gate/tests/previous-locks/react.package-lock.json, modules/e02-panel/internal/framework-gate/tests/previous-locks/angular.package-lock.json, modules/e02-panel/internal/framework-gate/tests/previous-locks/nuxt.package-lock.json, modules/e02-panel/internal/framework-gate/tests/previous-locks/svelte.package-lock.json, modules/e02-panel/internal/framework-gate/tests/real-zoom.mjs, modules/e02-panel/internal/framework-gate/tests/zoom-extension/manifest.json, modules/e02-panel/internal/framework-gate/tests/zoom-extension/worker.js, modules/e02-panel/internal/framework-gate/tests/orca.py, vault/PROFILES/workspace-framework-gate.md, vault/PACKS/P-E2-001.md, vault/REGISTRY/T-E2-001.md, vault/EVIDENCE/E-DEV-124.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-124-E10-GOVERNED-PATHS-FOR-T-E2-001.md.snapshot, modules/e02-panel/internal/framework-gate/fixture.json, modules/e02-panel/internal/framework-gate/reading-questions.json, modules/e02-panel/internal/framework-gate/package.json, modules/e02-panel/internal/framework-gate/package-lock.json, modules/e02-panel/internal/framework-gate/shared/model.ts, modules/e02-panel/internal/framework-gate/shared/workspace.css, modules/e02-panel/internal/framework-gate/tests/server.mjs, modules/e02-panel/internal/framework-gate/tests/browser.mjs, modules/e02-panel/internal/framework-gate/tests/contracts.test.mjs, modules/e02-panel/internal/framework-gate/tools/evidence.mjs, modules/e02-panel/internal/framework-gate/tools/run.mjs, modules/e02-panel/internal/framework-gate/react/package.json, modules/e02-panel/internal/framework-gate/react/package-lock.json, modules/e02-panel/internal/framework-gate/react/tsconfig.json, modules/e02-panel/internal/framework-gate/react/index.html, modules/e02-panel/internal/framework-gate/react/vite.config.ts, modules/e02-panel/internal/framework-gate/react/src/main.tsx, modules/e02-panel/internal/framework-gate/angular/package.json, modules/e02-panel/internal/framework-gate/angular/package-lock.json, modules/e02-panel/internal/framework-gate/angular/tsconfig.json, modules/e02-panel/internal/framework-gate/angular/angular.json, modules/e02-panel/internal/framework-gate/angular/tsconfig.app.json, modules/e02-panel/internal/framework-gate/angular/src/index.html, modules/e02-panel/internal/framework-gate/angular/src/main.ts, modules/e02-panel/internal/framework-gate/nuxt/package.json, modules/e02-panel/internal/framework-gate/nuxt/package-lock.json, modules/e02-panel/internal/framework-gate/nuxt/tsconfig.json, modules/e02-panel/internal/framework-gate/nuxt/nuxt.config.ts, modules/e02-panel/internal/framework-gate/nuxt/app/app.vue, modules/e02-panel/internal/framework-gate/svelte/package.json, modules/e02-panel/internal/framework-gate/svelte/package-lock.json, modules/e02-panel/internal/framework-gate/svelte/tsconfig.json, modules/e02-panel/internal/framework-gate/svelte/vite.config.ts, modules/e02-panel/internal/framework-gate/svelte/src/app.html, modules/e02-panel/internal/framework-gate/svelte/src/routes/+layout.ts, modules/e02-panel/internal/framework-gate/svelte/src/routes/+page.svelte, .github/workflows/e2-tests.yml]
gate_verdict: "RECORDED — yeni ürün CI, bağımsız inceleme ve çatı kararı HELD"
reviewer: "none; görev sonunda bağımsız gpt-6-luna/max inceleme beklenir"
timestamp: 2026-10-18
version: 1
purpose: Yönetim çalışma alanı kabuğu adayı ve dört altyapının karşılaştırma kanıtı
domain: internal-operations
module: e02-panel
owner: E2
implements: [ADR-010, ADR-015, C2.1, F2.1.1, FL2.1.1]
public_contracts: []
internal_scope: workspace-shell-candidate-and-framework-evidence
tasks: [T-E2-001]
tests: [modules/e02-panel/internal/framework-gate/tests/contracts.test.mjs, modules/e02-panel/internal/framework-gate/tests/browser.mjs, modules/e02-panel/internal/workspace-shell/tests/browser.mjs, modules/e02-panel/internal/workspace-shell/tests/orca.py]
superseded_by: []
last_verified: 2026-10-18
depends_on: [V-E2-FRAMEWORK-001, V-E2-SHELL-001]
used_by: [V-E2-FRAMEWORK-001, P-E2-001, T-E2-001, V-E2-SHELL-001]
evidence: []
supersedes: []
status: RECORDED
---

# Yönetim çalışma alanı — dört aileli deneme kanıtı

Bu bir görev bitişi veya ürün kabulü değildir. T-E2-001 IN_PROGRESS, gerçek113 sınırlıDONE/93kalan/206. ADR010 kazanan seçilmedi; daha sonra supersedingADR gerekir. Üretim E3/E5/host/CDN/veri ve yeni yetki bağlantısı yok.

## Gerçek ilerleme ve korunmuş başarısızlıklar

Kod öncesi 7f8010c9a198ad027b2ca9aad914e037775a4343, aynı49izinli yol/130korunanpin/sabit20soru ve ortak fixture. App tabanı972622acb2a9e3ea2f6b696a2b368bfeb11fba70, planfa914f013fdcd032faed876689092da245989459. Başlangıç run_all gerçek exit0; önceki PR126 ana8CI/normalmerge geçmişi korunur.

React19.3.1/Vite8.3.4, Angular22.2.3, Vue3.5.44/Nuxt4.6.2, Svelte5.57.2/Kit3.1.0; ortakNode24.19/TS6.0.3, yerel ayrı npm11.10.1. Tam kilitler ve gerçek tipkontrol+statik derlemeler var. npm10 peerçözücü hatası, diskdolmasıyla kesilen Nuxt kurulumları, native komut sonrası yanlışcwd kaynak okuma hataları ve ilk Svelte CSP RET logları korunur; başarı gibi değiştirilmez. Sahip diskte alan açtı; önceki önbellek silme ve yarımkurulum temizleme komutları otomatik güvenlik politikası tarafından reddedildi, başka kabukla aşılmadı. Npm kendi cacheverify ilk bakımda351764716bayt atıl veri topladı; ikinci bakım diskdolmasıyla hata verdi.

Dokuz gerçek localhostHTTP testi ilk turda9PASS. BrowserR1 React/Angular13erPASS; Nuxt derlenmemiş olduğundan timeout, Svelte13davranışPASS fakat announcerinlineCSS CSPFAIL. R1 raporu aynen saklanır. R2: dört adayda13er aynı senaryo, toplam52PASS/0FAIL; WCAG2A/AA+2.1axe ihlali0, görünür klavyeodağı/skip/select, boundedpagination, metingrafik, özelkarantina, response-loss/same-id, altı kapalıdurum, CSS200reflow ve sunucuoturumu kapatma. Bu CSSprobe gerçek browserzoom değildir; axe gerçek ekranokuyucu değildir.

R2 doğal40PNG/13özgünSHA. Root daha önce R1 üç readyoriginal açtı ve tablo sözcükbölmesini gördü; ortak min-genişlik/başlık-kimlik-bölmeme ile R2 düzeltildi. Güncel R2 özgünlerinin tam Rootokuma/makbuzu henüz tamamlanmadı. Yeni iptal edilmiş istek/dosya ve APIartifactuyumsuzluğu/CSPkeyfiinline/noJS olumsuzları ekleniyor; güncel SOURCE bağımsız kabulü veya tamamlanmış CI iddia edilmez.

## Bağımlılık ve güvenlik bulguları

R2 gerçek npm ls bütün ağaç0; dört kilit-temelli CycloneDXSBOM0 ve eksik lisans0. React48,Angular347,Nuxt712,Svelte80 kilitpaketi; platformoptional paketler kurulu paket sayısıyla aynı değildir. İlk SvelteSBOM $app aliasını geçersiznpmadı saydı; resmi package-lock-only kipinde dörtadaya aynırapor alındı, eskihata korunur.

Nuxt audit exit1:11yüksek bağlı kayıt; iki kök braces<=3.0.3 GHSA-vfj7-8cjw-p6xm ve node-forge<=1.4.0 GHSA-86w9-cpqp-85rv. Resmi registry latest açık sürümlerle aynı; yayımlanmamış yama/düzeltme varsayılmadı. npm önerdiği0.0.0 downgrade/fix-force yapılmadı. Build-time araç ile statikçıktı maruziyeti ayrıdır; Nuxt güvenlikkapısı kapanmadı. Başka aday otomatik kazanmaz. Diğer üç audit0; bu bütün ürün güvenliğinin kanıtı değildir.

## Açık eşitlik kapıları

|Boyut|Gerçek durum|
|---|---|
|Aynı native iş yükü|Dört framework gerçek bileşen/derleyici; ortak veri/stil/transport. Tek DOMrenderer sarılmadı|
|Tarayıcı/klavye/Türkçe/durum|R2 aynı13senaryo başarılı; son ilaveler yeniden sınanacak|
|Ekran okuyucu|HELD; gerçek okuyucu kanıtı yok. node_repl aracı bulunmadığından computer-use ile Windows kontrolü başlatılmadı|
|Yakınlaştırma|CSS200reflow sınırlı kanıt; gerçek browserzoom HELD|
|Yetki/CSRF/XSS/CSP/BOLA|Sadece denemeHTTP ve tarayıcı negatifleri; gerçek ürün E3/E5 entegrasyonu değildir|
|Karantina/arşiv/restore|HTTPfixture kapalı aktifönizleme/digest/epoch; gerçek ürün depolaması değil|
|Temiz kaynak yeniden kurulum|Ayrı dizine36tam kaynak dosyası, buildçıktısı/node_modules taşımadan beşnpmci başarılı; yeni build/aynıbrowser sonuçları ayrıca kaydedilecek|
|Majorupgrade/artifact/recovery|Uyumsuz API/istemci kapalı negatif hazırlanıyor; gerçek majorupgrade HELD|
|Destek/lisans/maliyet/çıkış|Tam kilitmetadata/SBOM/lisans mevcut; destekömrü/incident/upgrade/restore/exit maliyetinin tamamı HELD|
|AIçakışma/bağımsızkabul|Dosya kapsamı/pinler mevcut; tasksonu bağımsızgpt6luna/max inceleme bekler; runtime attestation ayrı|

## Yedi tasarım karşılaştırması

Tam ekran liste/ayrıntı; dört aday arası aynı iş; generic durumların ayrılığı; scope/sürüm/kaynak görünürlüğü; veri/draft ayrımı; klavye/anlamsal tablo/graph metni; baseline taşma ve CSSreflow yerel gözlem kapsamıdır. Kabul edilmiş E2 PNG referansı bulunmadı; tüketici E1 görselleri admin referansı diye sunulmadı. Final tasarım, token, tamresponsive ve ürünrotası kilitlenmedi. Referans yokluğu görünürdür.

## On kapanış katmanı

Task/feature/flow/requirement: IN_PROGRESS, ürün kabuğu tamamlanmadı. Design: yerel karşılaştırma, finalref/reader/gerçekzoom açık. Architecture: E2internalfixture; yeni E3/E5/E6 runtimeedge yok. Data-migration: kalıcı göç yok. Release: yayın/host/hesap yok. Product-scenario: yalnız sentetikdeneme. Gap-audit: bu açıkmatris, bağımsızretler değişmeden korunacak. Hiçbir üst katman DONE sayılmaz.

## Geri alma

Yeni örnekdosyaları/işakışı ve metadata normalPRrevert ile kaldırılabilir; gerçek kayıt veya yetki değiştirilmedi. E10envanterv91 hamGitblob snapshot korunur, v92yeniadresleri ekler. EDEV124 özgünprimarysubject/digest/tarih/gövde korunur; yalnız tüketim ve PR126 gerçekmakbuzu eki eklenir.

Bağlayıcı açıkkapı kaynağı: `vault/PACKS/P-E2-001.md` ve `vault/REGISTRY/T-E2-001.md`; ADR010 seçimi ve ürün kabulü henüz kapalıdır.

## Yardımcı teknoloji denemesi için kod öncesi ek

53yolluk kapsam eki e19b0f2e9ea85036338a5ab96aeac03f6f93cf73, koddan önce kaydedildi. Yeni gerçekzoom denemesi R1 ReactPASS; Chromiumzoom host bazında saklandığından diğer3aday önceki200%den başladı ve ölçümkoşulu timeoutoldu. R1deki3FAIL korunur. Her adaydan önce yalnız geçici testprofilinin kendi zoomu100%e sıfırlanarak eşit başlangıçla R2 sınanacak. Bu ürün hatası veya başka aday kazandı sonucu değildir.

Orca/AT-SPI/Xvfb ve gerçekPulseAudio/espeak seskaydı test kodu hazırlandı; henüz çalıştırılmadı, PASSdeğil. DOM/axe yerine gerçek SPEECH OUTPUT satırları ve sessizolmayanWAV şartı var. İnsani kullanım/telaffuz kalitesi bunlardan çıkarılmaz. Windowsprofilineokuyucu kurulmadı; tüm sistem paketleri yalnız LinuxCI imajında.

Yerel repo bağımlılık kurulumlarından sonra eski graphscanner node_modules içindeki üçüncü tarafMarkdownlarını da taradığı için r1exit2 verdi. Mevcut checker değiştirilmedi. Temiz kaynakaynada49aynı dosya ve gerçekGitkayıtlarıyla kontrol tekrarlandı; ilktemiz R1 üç kayıtta referansbiçimi ve registry evidence list/scalar uyumsuzluğu buldu. Bu metadataonarımları sonrası cleanR2 gerçek42test/graph worstexit0. Temiz ayna uygulama kodunu veya kuralları gevşetmedi; CIarchitecturejob zaten bağımlılık kurmayan temiz kaynakta çalışır.

## İlk gerçek GitHub CI bulgusu ve ölçüm onarımı

CODEe647528d4b86339a25b614bbdd05c33989b1021f / e2run39082552864: beş temiznpmci,9HTTP ve dört nativebuild başarılı. Browser75/76; Angular klavye seçiminden hemen sonra eskiOBJ0001metni okunmuştu. Aynı eylem sonrası görünürOBJ0002yi en fazla5saniye bekleyen anlamlı paintkoşulu eklenir; beklenen sonuç gevşetilmez. Diğer3aday19arPASS. İlk CIartefact/hamlog korunur; Orca/zoom bu başarısız aşamadan dolayı atlandı, PASS değildir. Yerel BrowserR4 dörtaday19ar,76PASS/0FAIL;40PNG/15özgün; tümaliaslar byte-byte doğrulandı, Rootokuma halen sürer.

Gerçek zoomR2 dört davranışPASS, fakat Root original açınca Playwright fullPage yakalamasının200%de görüntüyü kestiği görüldü; bu PNGler tamgörselkabul değildir. CDPgerçek1440x900viewport yakalamasıyla yerelR3altkare okundu; R4üst→son doğalörtüşen kareye geçildi. EskiChromiumoverride ile R3/R4 uzantı çağrıları takıldı ve denemeler kesildi; başarı sayılmadı. KilitliPlaywright1.64.1 ile eşleşen gerçekChromium ayrı görev araçdizinine kuruldu. Ek ölçümlerde beklemeler sınırlı; güncel doğalR5kareleri toplanacak. Hiçbirgörsel kırpılmadı/birleştirilmedi/düzenlenmedi.

## Doğal görsel okumadan gelen form bağlamı onarımı

Kodöncesi47c6e57 kapsamında önceki BrowserR4te kapalıdurumda eski not/fileinput adı görünür kaldığı Rootoriginalokumayla bulundu. Ortak model not ve formEpoch tutar; kapalıdurumlar not/dosya/işlem referansını temizler. Her dört nativebileşen modelnotunu ve kendi keyedinput yenilenmesini kullanır. OUTCOME_UNKNOWN aynıid sorguyu korur. Yeni olumsuzlar kapalıdurumda dd/not/fileinput boşluğunu gerçekbrowserda arar. Önceki76PASS vePNGler korunur; bu yeniSOURCE henüzyenidenbuild/CI/bağımsızkabul değildir.

## Gerçek yardımcı teknoloji ve kapalı form onarımının yerel sonucu

Önceki CODE463eda841560f85b11c149ad9186a2aa5aa76e5c / CI39082832921 E2tambaşarılı:76browser,4gerçekzoom,4gerçekOrca. Orca46.1/pulseaudio16.1/pythonpyatspi2.46.1/speechdispatcher0.12rc2 Ubuntu24.04 testimajında gerçekten çalıştı. Dört özgün speechtranscript ve dört WAV byte/SHA doğrulandı; Root bütün konuşma içeriklerini metadata gürültüsünden ayrıştırarak okudu. İlk hamtamokuma çıktısı kesilmişti, bu nedenle tamRAWokuma iddia edilmez; asıl dosyalar değişmez. Tablo21satır6sütun, Kayıtbaşlığı, ikibaşlık, Güncelbilgiyiyükle ve gerekli notalanı gerçek SPEECH OUTPUT satırlarında var. WAVlar yaklaşık15.7saniye/0.5MB ve sessizdeğil; insani telaffuz veya bütün ürün kullanılabilirliği hükmü değildir.

Yerel eşleşenPlaywright1.64.1 browserile gerçekzoomR5 dörtadayPASS;24doğal1440x900viewport/8özgün, tümaliaslar tambyteeş. Root8özgününhepsini original açtı; üstten gerçeksona örtüşen6kare, yapıştırma/kırpma yok. ÖncekiR2fullPagekırpılması ve kesilenR3/R4 aynıkanıt değildir. Bu zoom eskiCODE463 dönemini kapsar.

47c6e57kodöncesi kapalı-form onarımı sonrası yerel build-all-r13 dörtadaygerçektipkontrol/build0. Güncel BrowserR5 dörtaday19ar76PASS/0FAIL: kapalıdurumlarda eski dd/not/fileinput boşluğu da artık gerçekbrowserda aranır. Bu yeni model/nativeform SOURCE için yeniCI/Orca/bağımsızkabul henüz yok. Sabitfixture ve20soru değişmedi, ürün seçimi ve görevIN_PROGRESS.

## Major karşılaştırmasının tekrarlanabilir kapsamı

77727f7kodöncesi ek ile59yol. Dış dizinde önceki-major dört temizlock/npmci/build gerçekbaşarılı. Kit2namespace hatası korunup aynıflattenedconfige dönüldü. NativeUI/model/stil/fixture/sabit20 değişmedi; yalnız paketkompozisyonu, Nuxt3compatlayout ve Kit2üretilentsconfig uyarlaması yapıldı. Eski4lock repo içinde sabitSHA ile saklanır. Yenihelper önce eski sonra güncel kaynak/kilitlerle aynıtestleri ve arşivartifact API/epoch antiresurrectionı çalıştırır; henüz bu helper çalıştırılmış veya başarılı sayılmaz. Windowsyerel Orca NOT_RUN kalır; gerçekCI herikimajorda kendi sesgünlüğüyle gerekir.


## Kapalı form onarımı için gerçek CI makbuzu

CODE `fceb63748b533188fb9d2687d5ab53bd54df61b1` için dokuz push iş akışı başarılı. Gerçek ham loglarda E9 9 test, E6 50 test, E3 107 test, E5 59 test, E4 176 test, E1 482 test ve mimari 42 test / worst exit 0 okundu. Yerel Auth işinde gerçek kayıt, bakım yazımı ve çıkış ile doğrudan veri/depolama yolu olumsuzları PASS. Bu mevcut E3/E5 kanıtının tekrarıdır; yeni E2 denemesinin üretime bağlandığı anlamına gelmez.

[E2 CI 39083198991](https://github.com/xpike-dgm/kavriva-app/actions/runs/39083198991) aynı başlıkta başarılı; gerçek Orca konuşma/ses satırlarında dört aday PASS. Ayrı T3 push kontrolü atlanmış; CI başarısı bağımsız inceleme yerine geçmez. Yeni major geçiş helper değişiklikleri bu eski başlığın kanıtı kapsamında değildir.

Kontrollü major geçiş R1 ölçüm takılması nedeniyle FAIL; R2 eski dört adayın HTTP, build, 76 tarayıcı ve gerçek zoom adımlarından sonra Nuxt eski bağımlılık ağacı/SBOM hatasında FAIL. Her iki ham rapor korunur. Kod öncesi `da40ae9` kaydından sonra yalnız eski Nuxt deneme kilidinin isteğe bağlı commander peer çakışması düzeltildi; terser kendi 2.20.3 sürümünü korur, kök geliştirme aracı 15.0.0. Yeni temiz R3 sonucu bekleniyor; mevcut audit açıkları kapandı veya görev tamamlandı denmez.


## Kontrollü yerel major geçiş R3 sonucu

R3 gerçek sonucu `PASS_LOCAL_ORCA_NOT_RUN`: eski ve güncel fazların her birinde beş temiz kilitli kurulum, 9 HTTP testi, dört native build, aynı 76 tarayıcı testi, dört gerçek zoom davranışı ve paket ağacı/SBOM toplama başarılı. On altı native kaynak eşliği kaydı korunur. Dört eski statik dosya geri getirildiğinde API-major uyumsuzluğu kapalı kaldı; eski epoch çerezi geçerli API sürümünde de 403 aldı, yazım ve audit sayısı sıfır kaldı. Bunlar yalnız test sunucusunun denetimidir. Windows tarafında iki fazın gerçek Orca testi çalışmadı; Linux CI olmadan bu boyuta PASS verilemez. Nuxt audit bulguları ve önceki SvelteKit audit bulguları raporda saklı; helper başarısı güvenlik bulgularını kaldırmaz.

Root, sonradan R7 özgün zoom karelerinde boş/kesilmiş kayıt saptadı. Bu nedenle R3 zoom davranışının başarılı olması tam görsel kabul değildir. Kod öncesi `19cfd07` ile ölçüm onarımı kaydedildi. Yeni doğal kareler CDP `fromSurface:true, captureBeyondViewport:false` kullanır; görsel düzenleme, clip veya birleştirme yok. Önceki R1/R2/R3/R7 ölçüm sınırları korunur. Yerel eski kilitler Git ile aynı LF baytlarına sabitlenir; kanıt özetleri bu gerçek baytlardan hesaplanır.


## Gerçek zoom görüntüsü ve kapanış onarımı

R8/R9 görüntü toplaması tamamlanan adaylarda yeni doğal kareler doğruydu; fakat test sunucusu kapanışında takıldığı için bu turlar tam PASS değildir. R9 aşama logu son beklemeyi `closing server` olarak ayırdı. Kod öncesi `163f616` sonrasında yalnız test sunucusunun kalan bağlantıları kapatıldı. Yeni gerçek yarım HTTP bağlantısı olumsuzu ilk turda beklenen ECONNRESET olayını test hata saydı; bu ilk FAIL korunur. Yalnız beklenen ECONNRESET, kapanan bağlantının sonucu olarak ele alınır; diğer ağ hataları kabul edilmez.

Son yerel HTTP R5: 10 test / 10 PASS / 0 FAIL. Zoom R10: dört aday PASS; 24 doğal 1440x900 kare, sekiz özgün içerik. Root sekiz R8 özgününü original açtı; R10 karelerinin tamamı bu okunmuş karelerle dosyanın bütün baytları karşılaştırılarak eşleştirildi. Üstten gerçek sona örtüşme, iki kat gerçek tarayıcı zoomu, yatay tablo kaydırması ve klavye destek yolu korunur. R7 kesilmiş görüntüler bu kanıtın yerine geçmez. Güncel kaynak için Linux CI ve iki faz gerçek okuyucu sonucu henüz beklenir.


## Dört adayın tam temiz CI makbuzu ve ayrı kabuk adayı

`bc057850192d8f27e9f22e22bfd87ac9542c5edd` için dokuz CI başarılı; bütün ham loglar ve exact-head sonuçları saklandı. [E2 CI39084979140](https://github.com/xpike-dgm/kavriva-app/actions/runs/39084979140) ilk temiz kurulumdan sonra76 tarayıcı, dört gerçek zoom ve dört Orca sonucu; major geçişte eski ve güncel fazlarda76şar tarayıcı/dörder zoom/dörder Orca sonucu verdi. Toplam12 konuşma metni ve12 WAV özgün byte/SHA ile doğrulandı; WAVlar ayrıca açılıp ses örneklerinin sıfır olmadığı doğrulandı. Root bütün12 konuşmanın gerçek utterance içeriğini okudu; voice metadata gürültüsünün veya bütün ham Orca debug logunun tam okunduğu iddia edilmez. İnsan telaffuz/kullanılabilirlik hükmü değildir.

Major helper22 alt komutun tamamı exit0; her log byte/SHA ve gerçek süreyle doğrulandı.46 kaynak özeti tam Git bloblarıyla eşleşti;16 native kaynak eşliği ve dört arşiv geri dönüşü PASS. İlk arşiv durumu API uyumsuzluğu ve iptal koşullarını birlikte kapalı tutar; ardından uyumlu APIde eski epoch çerezi tek başına403 alır, yazım/audit sıfır. Bu sentetik denetim üretim yetkisi kanıtı değildir. İlk temiz checkout güncel sürümün temiz oda buildidir; helperın güncel fazı eski çalışma dizinindeki gerçek yükseltme akışıdır. Bunlar aynı iddia değildir. Nuxt11 yüksek bağlı bulgu ve eski SvelteKit audit kayıtları korunur; test başarısı açıkları gidermez.

Ayrı ürün kabuğu kod öncesi `04b60e5` kapsamında oluşturuldu; önceki karşılaştırma modelinin birincil subject kaydı aşağıda tarihsel olarak korunur. EDEV125 henüz bağımsız kabul almamış RECORDED kaydıdır; yeni primary subject kapalı ürün bileşenidir. Önceki VERIFIED kanıtlar veya EDEV124 subject/digest/tarih değişmedi.

- Önceki karşılaştırma subject: `modules/e02-panel/internal/framework-gate/shared/model.ts`
- Önceki karşılaştırma LF SHA256: `47a2a285d2318822504be362adb07cb184c2125b3c8979e474e7030c66e7f9c5`
- Yeni aday subject LF SHA256: `e6b6abddeef2a09525f6f7083fbb13143578fcbacbb70dc2bf9b3f78a5762e5e`

Yerel ürün install/clean npmci/typecheck/build başarılı; R1 ve kısaltılmış kullanıcı metni sonrası R2 ayrı8 tarayıcı senaryosu PASS. Bunlar panel çakışması/axe, klavye gezinme, bilinmeyen bağlantının boş/başarılı sayılmaması, sorgu/yerel rol ile erişim açılamaması, salt statik test sunucusu, noJS açıklaması, ürünün veri/etki isteği yapmaması ve gerçek200% zoomdur. Ürün kendi paket ağacı/CycloneDX/audit raporunu üretir; yerel audit0. Yeni ürün CI ve gerçek okuyucu sonucu henüz yok. T-E2-001 IN_PROGRESS; çatı önerisi, bağımsız görevsonu inceleme ve gerçek ürün bağlantısı ayrı sınırlardır. Yeni profil `vault/PROFILES/workspace-shell.md` bağlayıcı kapsamı açık tutar.


Yerel kabuk R2 için Root altı doğal görüntünün tamamını kapsadı: üç yeni özgünü original açtı; diğer üçü okunmuş R1 dosyalarıyla bütün baytları eşti. İlk metadata kontrolü gate_verdict alanındaki noktalı virgülü kapalı durum sözlüğü dışında saydı; yalnız alanın ilk durum sözcüğü ayrıldı, kural değiştirilmedi. İlk RET logu korunur.130 korunan taban pini değişmedi.


## Ürün okuyucusu onarımı ve bütün kaynak CI makbuzu

35525c0 / CI39086356023 ürün speech-dispatcher --spawn çıkış1 nedeniyle FAIL oldu; gerçek stderr önceki yardımcı tarafından saklanmadığı için kesin neden iddia edilmez. Kod öncesi1bdf837 sonrası2564b06 gerçek speechd SSIP bağlantısını yeniden kullanır veya hizmet yoksa başlatır; hata gizlenmez. Önceki gerçek PulseAudio test çıkışı kullanılır. Ürün kendi sunucu/veri/model/kimlik sınırını korur. Gerçek komut stdout/stderr/çıkış günlüğü ve SSIP modül yanıtı artık dosyaya yazılır. Konuşma etiketi/ses genliği koşulları gevşemedi.

`2564b06bbf9f46803d8d1eb81b654125d65eb411` exact-head dokuz push iş akışı başarılı. [E2 CI39126947518](https://github.com/xpike-dgm/kavriva-app/actions/runs/39126947518) kendi ürün8 browser, gerçek200% zoom ve gerçek Orca/ses kaydını geçti. SSIP gerçek modülleri espeak-ng/openjtalk; ürün konuşmasında üç panelin başlık ve linkleri ile erişimin doğrulanmadığı duyurusu okundu. Ürün WAV547596bayt /17.111saniye / genlik32768; speechSHA256 b375ba5b1a5c1c1721bb694fdbb2678a8e6c9a6afadbdeed6574cf73137bb846; audioSHA256 7f73c5821f3447963aeffded91ea12533c6cebd1cfd2611587da6c5a5d763b4a. Gerçek dosya baytları ve WAV örnekleri ayrıca doğrulandı. İnsan telaffuz/onayı değildir. Ürün npm ağacı, kilit CycloneDX ve audit başarılı; audit0.

Aynı CI ortak ilk76 browser/dört zoom/dört Orca; önceki ve güncel major fazlarında76şar browser/dörder zoom/dörder Orca verdi.22 alt komut logunun bütün bayt/süre/özetleri,46 Git kaynak özeti,16 native eşlik ve dört eskiartifact geri dönüşü doğrulandı. Ürün dahil13 gerçek konuşma/WAV dosyasının özetleri doğrulandı. Root ses kayıtlarının gerçek konuşma içeriklerini üç sınırlı çıktı halinde okudu; ilk metadata ağırlıklı çıktının kesilmiş olması gizlenmez ve tam ham debug okuması iddia edilmez. Eski ve güncel ortak fixture üretim E3/E5 yetkisi değildir.

**Açık gözlem:** Anguların ilk ve önceki-major konuşmalarında bir tabloya yeniden girişte “Toplam240 ... Toplam0” birleşik başlığı duyuluyor; kaynakta tek dinamik caption var. Güncel-major tekrarında aynı birleşme yok. CI gerekli etiketleri bulduğu için PASS verdi; bu ek konuşmanın nedenini veya kullanıcı etkisini çözmüş sayılmaz. Bütün görev bağımsız incelemesinde ve gerekirse dar gerçek tarayıcı/okuyucu teşhisinde değerlendirilmelidir; Angular erişilebilirliği kusursuz ilan edilmez.

Diğer gerçek ham loglar: E1 482; E3 107; E5 59; E4 176; E6 50; E9 9 test; mimari42 test /worst exit0. LiveAuth gerçek kayıt/korumalı bakım yazımı/çıkış ve doğrudan yol olumsuzlarını tekrar geçti. Bu önceki ürün testlerinin gerileme kontrolüdür; E2ye canlı bağ kurulduğu anlamına gelmez. Push T3 adımının atlanması bağımsız inceleme yerine sayılmaz.

Plan önerisi [PR5](https://github.com/xpike-dgm/motobakim-plan/pull/5): ADR016 PROPOSED, ADR010 değiştirilmedi. Plan checks CI39127235399 başarılı. Görev IN_PROGRESS, reviewer none; bütün görev incelemesi ve kayıtlı karar olmadan DONE veya seçilmiş çatı yok.

### Kaynak CI ham log makbuzları

| İş akışı / run | Gerçek log baytı | SHA256 |
|---|---:|---|
| e6-release-policy-tests /39126947537 | 26695 | e16cfbb6dc83f3bd0c37ff4053363e32dc253a1e532a5e5d9ac52c1f9df8d19a |
| e4-offline-composition-tests /39126947545 | 56420 | 0cf0a151a1931a5c9a96626520aa43dff6c47eba78916fb30f0fd4a257042748 |
| e9-bounded-proposal-tests /39126947476 | 17037 | 5eb30a08f8b68fcc958cbfaecd10b41aba028f0d3868d600f4c888415245fa84 |
| architecture-checks /39126947717 | 31119 | 8790d3045f7915e23c3251b979e8179063ac612e49a1290ea6ea9c7b32fd8fb7 |
| e3-commit-authorization-tests /39126947477 | 65292 | 3af12c8211f5079eee9248be3a917b0a5cad0bf40093d9b25bf67924d2a5074d |
| e3-live-auth-tests /39126947475 | 24279 | 01c36e21f664c139d581f0255ee5e61836f2241ab68cedbb8b0e92868374accd |
| e5-current-authority-tests /39126947444 | 34253 | 77b41b6e10ac5b74e7055c9cbfe87bf6d6acdf819c7319b12cc11a3d5f7fcd12 |
| e1-shell-widget-tests /39126947441 | 175723 | 74605b12f12653db000e27a498def1ecd6cc3f6d288c350a6d1686b115e3e06f |
| e2-framework-fixture-tests /39126947518 | 262301 | 3c4a4571a4189907ae3f5ad8eb8434b219ed58ae5add0f9467e77bb2d6819135 |
