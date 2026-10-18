---
test_id: E-DEV-124
contract_id_version: "C1.7/F1.7.1/FL1.7.2 replacement presentation v1"
subject_file: modules/e01-app/internal/shell/lib/replacement_right.dart
subject_digest: 9f3e132b8905c11ca06a6c44de8ef2778e45f4a4bcd9a9f1a3f441fab8bcc475
result: "Bağımsız bütün SOURCE PASS; ayrı FINAL kabulü bekleniyor"
evidence_links: [vault/EVIDENCE/E-DEV-123.md, vault/PROFILES/replacement-right-render.md, vault/PACKS/P-E1-025.md, vault/REGISTRY/T-E1-025.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-123-E10-GOVERNED-PATHS-FOR-T-E1-025.md.snapshot, modules/e01-app/internal/shell/lib/replacement_right.dart, modules/e01-app/internal/shell/test/replacement_right_test.dart, modules/e01-app/internal/shell/test/fixtures/replacement_right_reading_questions.json, vault/EVIDENCE/SNAPSHOTS/E-DEV-124-E10-GOVERNED-PATHS-FOR-T-E2-001.md.snapshot]
gate_verdict: "PASS sınırlı seçim değerlendirmesi sunumu; üretim HELD"
reviewer: "/root/e1025_source_whole_r1; requested gpt-6-luna/max"
timestamp: 2026-10-17
version: 3
purpose: Rehber seçimi düzeltme ve yeniden seçim taleplerini güncel sunucu kararıyla sınırlı sunmak
domain: motorcycle-entitlement
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, C1.7, F1.7.1, FL1.7.2, SCR-037, BR-048, BR-049, BR-134, CON-001, CON-002, CON-003, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: selection-replacement-presentation
tasks: [T-E1-025]
tests: [modules/e01-app/internal/shell/test/replacement_right_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-17
depends_on: [V-E1-REPLACEMENT-001]
used_by: [V-E1-REPLACEMENT-001, P-E1-025, T-E1-025, V-E2-FRAMEWORK-001, P-E2-001, E-DEV-125]
evidence: []
supersedes: []
status: RECORDED
---

# Seçim düzeltme ve yeniden seçim — sınırlı sunum kanıtı

Plan fa914f013fdcd032faed876689092da245989459; BASE 29cf09064bb775324d36129001c6ba9b9869bd5a; PRECODE e177e7155063c1cd970126a9535e3603090fa83c. Tam14yol/173BASEpin/sabit20soru koddan önce kaydedildi. Gerçek112/94/206; aday index116/v91. Sahip2026-10-17 uzman belgesi olmadığını doğruladı; T023/T024 bekler. Tek sert bağımlılık T014a gerçek sınırlıDONE; mevcut T014b guardları aynıE1 içinde değişmeden tüketilir. E3R1REVIEW/E5IN_PROGRESS; gerçek server seçim/hak yazıcısı HELD.

## Davranış ve kaynak sınırı

Immutable sunum tupleı hesap, motosiklet, bağlam/katalog revizyonları, seçili rehber/sürümü ve seçim kimliği/revizyonunu içerir. Yanlış seçim düzeltmesi ile kullanıcı hatası olmayan kullanılamaz rehber için MAY-open talebi ayrıdır. Aynı amaç/subject/istek için güncel okuma ve altı etki boyutunun referansları gerekir. Correction ilk fiziksel adım bilinmiyorsa/başladıysa kapalıdır; uygun güncel server kararı olmadan yenileme açılmaz. E1 karar imzası doğrulayıcısı veya hak/fiziksel gerçek üreticisi değildir. current/confirmed sadece güvenilir dış üreticinin sunum girdisidir; ham istemci verisi üretim yetkisi değildir. Gerçek üretici/HTTP/DB/yazıcı bu görevde bağlanmadı; pozitifler açık örnek fixture, üretim girişinde plan/reference yok/HELD kalmalıdır.

Callback yalnız tam kapsam ve amaç/subject ile kontrol isteği taşır; epoch/aynı kaynak/aynıhandler/güncel koşul ile yeniden denetlenir, ABA/çift gönderim engellenir. İstek iletilmesi hakkın verildiğini veya seçimin değiştiğini kanıtlamaz; bakım başlamış sayılmaz. Eksik/stale/foreign/offline/busy/error/received/no-handler/yanlış amaç kapalıdır. Eksik karar özel motosiklet/rehber verisini göstermez. Korunan altı yol EntitlementSnapshot.pathAllowed ve ayrıca aynıhesap currentproof ile doğrulanır; seçim kararı yokluğu onları satın almaya bağlamaz; recovery okuması güvenli sonuç yazmaz.

DEC0053 tek seçili motosiklet hakkı şeklini korur: hak taşınır/üstüne eklenmez; bike-switch/completion yeni ücretsiz hak değildir. EskiQ222 kalıcı ücretsiz rehber yorumu yeni ticari politika yapılmadı. Kesin süre/sıklık/fiyat, canlı hak, uzman/cihaz/insan/üretim/yayın HELD.

## Yerel sonuç ve korunmuş onarımlar

Güncel482normal=473korunan+9yeni; native10=9+1capture ayrı koşu, normal toplama eklenmez. 56format0/analyze0. Dokuz tuple ekseni/delimiter/unpairedUnicode/immutablemaps; her read ve altı etki boyutu/yanlış amaç/neden/fiziksel başlangıç/phase/staleoffline; capturedcallback replay/ABA/handler değişimi, hesaba bağlı korunan6yol, request!=outcome, TabEnterSpace/semanticlabel/52min kontrol;320390768×scale123×4durum=36tamdoğalscroll doğrulandı.

R1 test kabuğunda route builder eksikti; R2 kabukta routefocus yoktu; R3 gerçek klavye beklentileri geçti fakat SemanticsHandle testsonrasına kaldığı için FAIL oldu. Doğru Navigator/_Input host ve try/finally ile R4dokuzPASS; ürün izin kriteri değiştirilmedi. R1native22durum120PNG76unique44alias ve full482PASS olsa da Root yalnız ilk8unique açtı ve kapalı düğmeyle çelişen olumlu üst başlığı reddetti. R1tamRoot okuması/kabulü iddia edilmez. Dar onarımda başlık gerçek requestAllowed+handler+sent/phase/physical koşuluna bağlandı; gönderilen istekte gerçek hakkın/seçim sonucunun doğrulanmadığı yazıldı. R5hedef9/analyze0 ve R2native/full güncelPASS. Özgün tüm FAIL/RET logları ve R1kaynak/test kopyaları dış task-state içinde korunur.

Native-r2:22durum119PNG80özgün39tamalias;390×844/scale1ve3, offset0→max ve ≤600adımlar. Her bayt/SHA/IHDR ve alias tambyte eşliği doğrulandı; Root80 özgün PNGnin hepsini original açtı. Üç kat yazıda uzun başlık/sözcükler satır böler; ölçek kısılmaz ve tüm içerik/eylemler doğal kaydırmayla erişilir. Viewport sınırı kesmeleri sonraki örtüşen karede sürer. Gerçek cihaz/pixel/screenreader kanıtı değildir.

## Yedi tasarım karşılaştırması

|Katman|Gerçek karşılaştırma ve sınır|
|---|---|
|Tam ekran|22durumun ilk→son doğalPNGleri: başlık/karar/kaynak/iki amaç/istek/hak şekli/korunan yollar/recovery/çıkış; canlırouter/veri yok|
|Ekranlar arası|Yeni correction/replacement ile mevcut EntitlementGateView/LifecycleView kaynak/guard/terim,nearwhite-nav-blue-amber,22padding/640width/52kontrol/keyboard karşılaştırıldı; eski ekranlar yeni cihazda tekrar çekildi iddiası yok|
|Durumlar arası|Started/unknown/cause/held/denied/missing/stale/foreign/offline/busy/error/received/no-handler/no-intent/no-account-read; R1başlık çelişkisi R2de onarıldı; pozitifler fixture|
|Responsive/Türkçe|36doğalscroll; uzun görünür gerekçe ve native390scale1/3; tüm metin/kontroller erişilir; finaldevice/window/token yok|
|Erişilebilirlik|GerçekTabEnterSpace/semanticlabel/52min ve büyükyazı; callback ve sonuç testi; gerçekscreenreader/insan yok|
|Görsel regresyon|173korunanBASEpin/eski E1kodtestleri aynı; R1ret→R2durumbaşlığı karşılaştırması; yeni pixel toleransı yok|
|Kanonik referans|REF-LIFECYCLE-001 J05acceptedv3/SCR037/FAM07 Rootoriginalaçtı; işlem kapısı→korunan kayıtlar→güvenlik/recovery hiyerarşisi; yeni rota/modal/nav/logo/icon/finaltokens yok|

## On katman kapanış

|Katman|Durum ve gerçek sınır|
|---|---|
|task|T025 yerelREVIEW; bağımsız20/bütünSOURCE/CI-T3/FINAL/main beklenir|
|feature|F1.7.1 sunum dilimi; gerçekE3/E5seçimwriter HELD|
|flow|FL1.7.2 iki kontrol isteği; canlıuçtanuca seçim değişimi yok|
|requirement|C1.7/Q222/Q227/DEC0053/R001003004007009013014; windowHELD|
|design|Yedi karşılaştırma yukarıda; cihaz/son tasarımHELD|
|architecture|E1renders/E3serves/E5authorizes; aynıE1history/entitlement, yeni cross-epic/privateimport yok|
|data/migration|Yeni DB/yazıcı/göç yok; RAWv90 ve EDEV123primary/body korunur|
|release|Yayın/activation/onaylı bakım içeriği HELD|
|product-scenario|Örnek tuple/fixture üzerinde negatif ve geri giriş; gerçek müşteri/cihaz/fiziksel sonuç yok|
|gap-audit|UzmanT023/T024/E3R1REVIEW/E5IN_PROGRESS/writer/producer/window/device açık; başkaPASS kapatmaz|

## Güncel konu özetleri

- modules/e01-app/internal/shell/lib/replacement_right.dart LF SHA256 e1996238c6526df0dee4d3ff781e91e10d0518d01f9df6a191188d7e3ae2061b
- modules/e01-app/internal/shell/test/replacement_right_test.dart LF SHA256 c9de7336de7ee784fb5d8cf2aea560814a5a988d1a2152cb304e9224b03eb63e
- modules/e01-app/internal/shell/test/fixtures/replacement_right_reading_questions.json LF SHA256 c9aa588599797fbdcd114f14f932abf3d7263be0e298ab938968092b39d471c0

## Gerçek RAW kayıtlar

- format-apply-r1.log 127 bayt SHA256 3f4b8c1a5db53ffd50918e9537e0ba0a5ff82143bca41bddf239039561790426
- analyze-r1.log 96 bayt SHA256 cb7ed8430c0ac63fe7b63d6bb780cda919f2588ec9b42763cf2b48be01b047ed
- target-r1.log 14126 bayt SHA256 38921e55704554b30744ebaeab6aea3e3798719b88db981182bc732c3dc628fa
- target-r2.log 2988 bayt SHA256 7659794cc62f9ea9dc5d0022d304910e236aeaf5008e6bea2d432ef6817ed7cf
- target-r3.log 2663 bayt SHA256 19575a6d0a68d45e2a1906f25f3ae976245cdb87dd232c961bbc1b659c076fa9
- target-r4.log 981 bayt SHA256 5930ad22e08fb0b74b0e538dabf7f2d8a0aa99c2595b45a4964e6c32a93eb527
- target-r5.log 981 bayt SHA256 f128bc579a58c2b7a861be422a9a6a236e82b3c371d373759ec9626f4e19fbef
- analyze-r5.log 96 bayt SHA256 d6b943eb80df69d1f7892ac3998cf3270343ea65e0a61587929ee4403d079a2e
- format-r2.log 48 bayt SHA256 b978b0c1840721d3c9f4afb85dc4c9575257f3a0d7126b35e4ce8f6989a8c2b5
- native-r1.log 1056 bayt SHA256 a59a3297a4b8fe43131eb584cd0147c3dd39641bdcc79e702d1eff3afa07c6cb
- full-r1.log 112520 bayt SHA256 138b45673d3b1d83adf74d1fd9480b8c672883002c967d70dba423a858c89655
- native-r2.log 1056 bayt SHA256 a59a3297a4b8fe43131eb584cd0147c3dd39641bdcc79e702d1eff3afa07c6cb
- full-r2.log 113116 bayt SHA256 67834ae8599bbca133f1241f4ae792ef4837f134f592765731d6e3eedb5c02ac

root-native-r1-partial-read.json 1263 bayt SHA256 e0983a42fbd131332582adba4e877603add6d086f28d76c3d8cf6e60148ed4e1

<pre>{
  &quot;stage&quot;: &quot;native-r1&quot;,
  &quot;actuallyOpenedOriginal&quot;: [
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r1\\native-r1-correction-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r1\\native-r1-correction-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r1\\native-r1-correction-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r1\\native-r1-correction-3.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r1\\native-r1-replacement-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r1\\native-r1-replacement-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r1\\native-r1-replacement-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r1\\native-r1-started-1.png&quot;
  ],
  &quot;opened&quot;: 8,
  &quot;totalUnique&quot;: 76,
  &quot;allCurrentUniqueCovered&quot;: false,
  &quot;verdict&quot;: &quot;CHANGES_REQUESTED&quot;,
  &quot;finding&quot;: &quot;Top card mayRequest wording claimed a request could be sent while physical-start/offline/missing-guard/no-handler states disable it. Source status wording must describe actual UI availability; no false permission.&quot;,
  &quot;rawManifestIntact&quot;: true,
  &quot;frames&quot;: 120,
  &quot;aliases&quot;: 44
}</pre>

root-native-r2-read.json 9780 bayt SHA256 0475453922235427d521c3334a635198fa7a20365bbdf62fdabce3d46ca884c9

<pre>{
  &quot;stage&quot;: &quot;native-r2&quot;,
  &quot;actuallyOpenedOriginal&quot;: [
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-correction-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-correction-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-correction-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-correction-3.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-replacement-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-replacement-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-replacement-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-started-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-started-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-started-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-unknown-start-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-unknown-start-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-renew-started-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-renew-started-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-renew-started-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-user-fault-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-user-fault-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-held-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-denied-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-missing-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-missing-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-offline-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-offline-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-offline-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-busy-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-busy-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-busy-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-error-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-received-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-no-handler-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-no-handler-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-no-handler-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-no-handler-3.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-no-account-read-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-no-account-read-3.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-long-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-long-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-long-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-3.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-4.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-5.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-6.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-7.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-8.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-9.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-10.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-11.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-12.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-13.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-14.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-15.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-16.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-17.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-18.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-19.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-20.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-21.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-3.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-4.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-5.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-6.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-7.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-8.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-9.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-10.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-11.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-12.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-13.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-14.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-15.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-16.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-17.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-18.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-19.png&quot;
  ],
  &quot;opened&quot;: 80,
  &quot;totalUnique&quot;: 80,
  &quot;allCurrentUniqueCovered&quot;: true,
  &quot;frames&quot;: 119,
  &quot;aliases&quot;: 39,
  &quot;aliasMethod&quot;: &quot;Every SHA grouping also compared full byte equality; every unique original opened by Root in ten batches of eight&quot;,
  &quot;sourceDigests&quot;: {
    &quot;modules/e01-app/internal/shell/lib/replacement_right.dart&quot;: &quot;e1996238c6526df0dee4d3ff781e91e10d0518d01f9df6a191188d7e3ae2061b&quot;,
    &quot;modules/e01-app/internal/shell/test/replacement_right_test.dart&quot;: &quot;c9de7336de7ee784fb5d8cf2aea560814a5a988d1a2152cb304e9224b03eb63e&quot;,
    &quot;modules/e01-app/internal/shell/test/fixtures/replacement_right_reading_questions.json&quot;: &quot;c9aa588599797fbdcd114f14f932abf3d7263be0e298ab938968092b39d471c0&quot;
  },
  &quot;verdict&quot;: &quot;PASS bounded presentation visual comparison; independent reading and whole review pending&quot;,
  &quot;observations&quot;: [
    &quot;Root read every actual unique original at 390x844; natural viewport edge clipping has continuous overlapping scroll coverage, not hidden content&quot;,
    &quot;Corrected r1 disabled-state positive header is absent; physical-start/offline/busy/failed/no-handler states reflect actual request availability&quot;,
    &quot;Three-times text wraps long words and enlarges headings; no text scale cap, every paragraph and control accessible through full natural scroll&quot;,
    &quot;No claim of physical device, screen-reader user, pixel identity or production authority&quot;
  ],
  &quot;supersededR1&quot;: &quot;Only initial eight r1 unique originals opened; root rejection and all raw120PNG76unique44aliases preserved, not current accepted proof&quot;
}</pre>

|Durum|Kare/ölçek|Offset/son|Bayt|SHA256|RAW dosya|Tam alias|
|---|---|---|---|---|---|---|
|correction|0/1.0|0.0/1383.0|73791|d31f475f40e37d7d1172849290f851cc5fb7e3d70c2879b153765ab766cd31a2|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-correction-0.png|None|
|correction|1/1.0|600.0/1383.0|81548|cd6552b1d4ca76d46a1d9a5ae0a9b79c4c1ef9aceac7505019ad9b73e697b6f8|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-correction-1.png|None|
|correction|2/1.0|1200.0/1383.0|81959|810c843888e2e3b3ec17ecc656e2bf433ef793f40c2f514c6d53fdaba06db6d4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-correction-2.png|None|
|correction|3/1.0|1383.0/1383.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-correction-3.png|None|
|replacement|0/1.0|0.0/1337.0|72656|19513ac0fe7508262df117eb918c7f179feb5acad43a20c3719cbb43342317c5|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-replacement-0.png|None|
|replacement|1/1.0|600.0/1337.0|83811|218ceb5aa77359f8e7510e837f21dcb113839ac070efa3e451039015850d2485|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-replacement-1.png|None|
|replacement|2/1.0|1200.0/1337.0|77494|2593fafd2a7693703bd2d14569d76fba78d6c70a65eabd30fb638e231ae3174f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-replacement-2.png|None|
|replacement|3/1.0|1337.0/1337.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-replacement-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|started|0/1.0|0.0/1406.0|73771|614b3dad8a6eaa33f80b995576f124c4e71ed87e2a354d2c040e5d424c4ffc47|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-started-0.png|None|
|started|1/1.0|600.0/1406.0|82454|a7345075bd3084606e9b87797fc41a3cf8d3c4535ca095155c050d6e3db17851|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-started-1.png|None|
|started|2/1.0|1200.0/1406.0|79816|e0b458fa6b73b3e02791bddb104a4c3ec19cb3ca66bacd17b3e343ca2142da3b|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-started-2.png|None|
|started|3/1.0|1406.0/1406.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-started-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|unknown-start|0/1.0|0.0/1406.0|73303|7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-unknown-start-0.png|None|
|unknown-start|1/1.0|600.0/1406.0|80856|e0449f60f57100c30cd8afc3bdc92d7bfdcfaf005eb106573db64b57748cb27e|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-unknown-start-1.png|None|
|unknown-start|2/1.0|1200.0/1406.0|79816|e0b458fa6b73b3e02791bddb104a4c3ec19cb3ca66bacd17b3e343ca2142da3b|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-unknown-start-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-started-2.png|
|unknown-start|3/1.0|1406.0/1406.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-unknown-start-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|renew-started|0/1.0|0.0/1360.0|72685|9521ef4a2b65815c47040c8f3f9e56c07baf0edbd8421b3060ef195b8c4b1aa4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-renew-started-0.png|None|
|renew-started|1/1.0|600.0/1360.0|84066|f27d8ed010da01aa5415fc2b5b99028b34705ad3f6a72aa8093c7deb31349917|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-renew-started-1.png|None|
|renew-started|2/1.0|1200.0/1360.0|80133|2e39624a246d8203102ec3ecdc764de3dea48811559902173992cd1b78862cb7|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-renew-started-2.png|None|
|renew-started|3/1.0|1360.0/1360.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-renew-started-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|user-fault|0/1.0|0.0/1337.0|72184|c3b260f369f61fec99679fac89c09a618ebad9177c1bd4ecebdedd172a62e6d3|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-user-fault-0.png|None|
|user-fault|1/1.0|600.0/1337.0|83673|4d22265298f0a091e535991d06af8866561ba418fa52e943471a49213da0f359|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-user-fault-1.png|None|
|user-fault|2/1.0|1200.0/1337.0|77494|2593fafd2a7693703bd2d14569d76fba78d6c70a65eabd30fb638e231ae3174f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-user-fault-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-replacement-2.png|
|user-fault|3/1.0|1337.0/1337.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-user-fault-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|held|0/1.0|0.0/1383.0|73303|7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-held-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-unknown-start-0.png|
|held|1/1.0|600.0/1383.0|81460|5d8acf63d3f4e2931cfa713f558d65c5f9498fcbe0d8ddb9c4b43cd97721da76|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-held-1.png|None|
|held|2/1.0|1200.0/1383.0|81959|810c843888e2e3b3ec17ecc656e2bf433ef793f40c2f514c6d53fdaba06db6d4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-held-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-2.png|
|held|3/1.0|1383.0/1383.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-held-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|denied|0/1.0|0.0/1383.0|72832|f4ef3af0f1993dd023ae7126aa2a960c76a20ad6514c92431341b9e03b429166|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-denied-0.png|None|
|denied|1/1.0|600.0/1383.0|81460|5d8acf63d3f4e2931cfa713f558d65c5f9498fcbe0d8ddb9c4b43cd97721da76|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-denied-1.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-held-1.png|
|denied|2/1.0|1200.0/1383.0|81959|810c843888e2e3b3ec17ecc656e2bf433ef793f40c2f514c6d53fdaba06db6d4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-denied-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-2.png|
|denied|3/1.0|1383.0/1383.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-denied-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|missing|0/1.0|0.0/1054.0|76753|8ccb78d0d5885e21228a2e3e9a57dab1968335c895a82c4c1a2852dbc5e67f20|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-missing-0.png|None|
|missing|1/1.0|600.0/1054.0|77836|629c249d9f2e5cc294b4b3d25928935ef8ae045028293ba72468608f690bd277|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-missing-1.png|None|
|missing|2/1.0|1054.0/1054.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-missing-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|no-read|0/1.0|0.0/1054.0|76753|8ccb78d0d5885e21228a2e3e9a57dab1968335c895a82c4c1a2852dbc5e67f20|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-read-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-missing-0.png|
|no-read|1/1.0|600.0/1054.0|77836|629c249d9f2e5cc294b4b3d25928935ef8ae045028293ba72468608f690bd277|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-read-1.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-missing-1.png|
|no-read|2/1.0|1054.0/1054.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-read-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|foreign|0/1.0|0.0/1054.0|76753|8ccb78d0d5885e21228a2e3e9a57dab1968335c895a82c4c1a2852dbc5e67f20|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-foreign-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-missing-0.png|
|foreign|1/1.0|600.0/1054.0|77836|629c249d9f2e5cc294b4b3d25928935ef8ae045028293ba72468608f690bd277|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-foreign-1.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-missing-1.png|
|foreign|2/1.0|1054.0/1054.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-foreign-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|stale|0/1.0|0.0/1054.0|76753|8ccb78d0d5885e21228a2e3e9a57dab1968335c895a82c4c1a2852dbc5e67f20|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-stale-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-missing-0.png|
|stale|1/1.0|600.0/1054.0|77836|629c249d9f2e5cc294b4b3d25928935ef8ae045028293ba72468608f690bd277|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-stale-1.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-missing-1.png|
|stale|2/1.0|1054.0/1054.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-stale-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|offline|0/1.0|0.0/1441.0|74868|74b9984ef14fec1524510513b156b244dad8eae37aef4a41623811de28c521e3|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-offline-0.png|None|
|offline|1/1.0|600.0/1441.0|80019|7071c668d3dfeece8e09b8e2a22ecbe91b6deeb9e13406f15045e4407676954e|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-offline-1.png|None|
|offline|2/1.0|1200.0/1441.0|78542|467f6e9094f9557a775a7abc1a0a358d6c656440c62a42f3e1fca264a33e7c1d|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-offline-2.png|None|
|offline|3/1.0|1441.0/1441.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-offline-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|busy|0/1.0|0.0/1418.0|72726|6f906e993160db4b371195278d2c20c793ce9c8f385467725b0e2d8684a05a69|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-busy-0.png|None|
|busy|1/1.0|600.0/1418.0|81774|ae37168f661365395ca6564ba078bafdb21ff276754b3bd579fff5d258d64506|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-busy-1.png|None|
|busy|2/1.0|1200.0/1418.0|79259|ffa336c2579e876111ad96b6b4bc1129c884484d76bb91e71847bc9bdaa5ace5|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-busy-2.png|None|
|busy|3/1.0|1418.0/1418.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-busy-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|error|0/1.0|0.0/1441.0|73303|7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-error-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-unknown-start-0.png|
|error|1/1.0|600.0/1441.0|79609|7b478554934a794f89d2737ad2df0b19856decdcbc7a1b4372506ac724e6d2f0|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-error-1.png|None|
|error|2/1.0|1200.0/1441.0|78542|467f6e9094f9557a775a7abc1a0a358d6c656440c62a42f3e1fca264a33e7c1d|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-error-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-offline-2.png|
|error|3/1.0|1441.0/1441.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-error-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|received|0/1.0|0.0/1441.0|73303|7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-received-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-unknown-start-0.png|
|received|1/1.0|600.0/1441.0|80598|5499538f52593e81f3693799978fbb348c120e3251e14eeeeee3ee4f56bc6fff|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-received-1.png|None|
|received|2/1.0|1200.0/1441.0|78542|467f6e9094f9557a775a7abc1a0a358d6c656440c62a42f3e1fca264a33e7c1d|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-received-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-offline-2.png|
|received|3/1.0|1441.0/1441.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-received-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|no-handler|0/1.0|0.0/1383.0|73848|864d5b8656b6060e61c82bc5be4d269a89a6e0fdbd5f4a0ce3c9dd060335e229|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-handler-0.png|None|
|no-handler|1/1.0|600.0/1383.0|81431|fda1cd36c7e508df8cf484a156ec28f6509fce6fa72b7406770e55d8302c5b33|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-handler-1.png|None|
|no-handler|2/1.0|1200.0/1383.0|81901|a1b6a2d054d8d1cced594bb0b8775fc499163443c01cfb8255b9d7c2dfb5217f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-handler-2.png|None|
|no-handler|3/1.0|1383.0/1383.0|68741|d74addeba4afe69c012c3039684a426350c55b9712a9e17f306a77aab25f7558|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-handler-3.png|None|
|no-intent|0/1.0|0.0/1383.0|73303|7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-intent-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-unknown-start-0.png|
|no-intent|1/1.0|600.0/1383.0|81460|5d8acf63d3f4e2931cfa713f558d65c5f9498fcbe0d8ddb9c4b43cd97721da76|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-intent-1.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-held-1.png|
|no-intent|2/1.0|1200.0/1383.0|81959|810c843888e2e3b3ec17ecc656e2bf433ef793f40c2f514c6d53fdaba06db6d4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-intent-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-2.png|
|no-intent|3/1.0|1383.0/1383.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-intent-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|no-account-read|0/1.0|0.0/1383.0|73791|d31f475f40e37d7d1172849290f851cc5fb7e3d70c2879b153765ab766cd31a2|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-account-read-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-0.png|
|no-account-read|1/1.0|600.0/1383.0|81546|43c8c500b95bc3bce96a97de447fd24d748b73202cbd9e7c833a3211c4593c78|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-account-read-1.png|None|
|no-account-read|2/1.0|1200.0/1383.0|81901|a1b6a2d054d8d1cced594bb0b8775fc499163443c01cfb8255b9d7c2dfb5217f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-account-read-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-no-handler-2.png|
|no-account-read|3/1.0|1383.0/1383.0|68814|5b3152944003a2532c1ec3498c3efaeadd256c18ab8372cc89bc38878c86bbed|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-no-account-read-3.png|None|
|long|0/1.0|0.0/1613.0|79005|6f1100c52bb0bd32a89c690829ce00df50f557ad9533a8fcfc096f1a21a45fbc|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-long-0.png|None|
|long|1/1.0|600.0/1613.0|76995|e512fe1acabbf028b9aeefa4bb500a591b20bb43ab26cf86b6e3dc2484eead3d|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-long-1.png|None|
|long|2/1.0|1200.0/1613.0|79172|76efcee12e8f03d3a62e6d6bba8ae564d35ad25c1f9480f8e630468f412761db|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-long-2.png|None|
|long|3/1.0|1613.0/1613.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-long-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-correction-3.png|
|large-correction|0/3.0|0.0/12352.0|31123|c2e3366dd6822e95b1c1ec13db0bb7de0c7d7c0a68ccf76b14f83512c5b9a9e2|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-0.png|None|
|large-correction|1/3.0|600.0/12352.0|43921|c33dab4cd4475678c93dec98d927083271063298142af11e0700f63d40de7cef|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-1.png|None|
|large-correction|2/3.0|1200.0/12352.0|46201|07d90088e1709c00a39cc083caac83a71acae4d6a8e24047c74bc4377b7bce21|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-2.png|None|
|large-correction|3/3.0|1800.0/12352.0|39247|f9f71dae050319e1a1ef43bd89074d0b8b74525edf39594fb78ec28391cacf5b|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-3.png|None|
|large-correction|4/3.0|2400.0/12352.0|42137|e99f6adeba44d6825f8c62c1e21d54243878f6334380f4be2d88105be1e80328|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-4.png|None|
|large-correction|5/3.0|3000.0/12352.0|37233|f43df6121e325c6cb7fb827d9942079c423f7c181b5abf9757478387db254f11|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-5.png|None|
|large-correction|6/3.0|3600.0/12352.0|35616|3f08f2976146902987d79dd19683ba864f21b3dbb27a1c95eb7ed0c464f9690f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-6.png|None|
|large-correction|7/3.0|4200.0/12352.0|42004|60c9cd2206c51f999f22944b9fa631789b4aa840fad9a688be71a6d9f98d536a|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-7.png|None|
|large-correction|8/3.0|4800.0/12352.0|46666|a3a2c97ec3228a5f5b1e2f6a2f8ebd1b15e2d582a507ae07d9250705587ab6f2|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-8.png|None|
|large-correction|9/3.0|5400.0/12352.0|49860|25cb2ac7bebf260772cdb7fb80d330b6cded1263e9dee6687543b5a282575cd3|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-9.png|None|
|large-correction|10/3.0|6000.0/12352.0|50804|dfb652798bf56dc3c0af3e3834cbae62774cfdd3701ba25c2a7a5a7c93b5c3d4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-10.png|None|
|large-correction|11/3.0|6600.0/12352.0|42987|397b5a812235cfe37eb091ab6932115e1883201538339536af678434c7e5b5de|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-11.png|None|
|large-correction|12/3.0|7200.0/12352.0|43489|e14b7cee83d2c5b2552ee56671883fb61fd84a70e730e6cd90ac39554df70afa|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-12.png|None|
|large-correction|13/3.0|7800.0/12352.0|43859|756cf9c005b232abf21e0694e6e8a5e29df08d916094e76c53c5ba1b2254f193|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-13.png|None|
|large-correction|14/3.0|8400.0/12352.0|43010|bf31f218d6a96b2866f7aaa9c7f29b558d24519f18db6432146d39e9d40cf31d|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-14.png|None|
|large-correction|15/3.0|9000.0/12352.0|47102|a00c7791afb985098e3594a1a85b4802e13de72a9b86c5cce5e3ddd7992e5456|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-15.png|None|
|large-correction|16/3.0|9600.0/12352.0|50737|fd635f1208a41cf96ca715e818c74fb0616c80c7d74eb12ea6991dd746f17eab|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-16.png|None|
|large-correction|17/3.0|10200.0/12352.0|43747|41b3cd12574f19b7f59f18147ae3e6e5b4c0c9fb1f6887a7a92eaf31f39a68a5|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-17.png|None|
|large-correction|18/3.0|10800.0/12352.0|46116|98335f7ee4ca1d4eb01cd4dc46bbb2368e3f7ce451f2b28d1b30bf03cf5e584a|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-18.png|None|
|large-correction|19/3.0|11400.0/12352.0|52566|a565bcfe91cc7d2dc3b88708b8546dd2de2e62fb21fd899109c68eb18c88b68d|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-19.png|None|
|large-correction|20/3.0|12000.0/12352.0|49321|fe5e87aedbeb55febed33abe617740c1ab68afdb4616552282ef1b0b55b9cd81|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-20.png|None|
|large-correction|21/3.0|12352.0/12352.0|49938|3e4bdd98a677bcbb66503c554984a358724afb09661127757992c80ae81de115|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-correction-21.png|None|
|large-replacement|0/3.0|0.0/11935.0|42917|7810abfa526b6b52bfef245bbf018bab2bb72e070b6ee634a153ff4ae3871c53|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-0.png|None|
|large-replacement|1/3.0|600.0/11935.0|48074|49265f82911b4d4f4c0210ac7c6d02fbbe61e7a8dd54392e01c07b90b24a834f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-1.png|None|
|large-replacement|2/3.0|1200.0/11935.0|40336|b1b531736c99e8fef1a08370aeee150fc749d49fe7ece7618aa7e62a18e34bc6|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-2.png|None|
|large-replacement|3/3.0|1800.0/11935.0|40240|754b68c85fb19f92a68cee7b427c1925c18e02dca09bf66daff6afb5fcd673e4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-3.png|None|
|large-replacement|4/3.0|2400.0/11935.0|36482|181e44ee2b4fc3e06e2b3e82718ad73ff4c0519f0c8763fbf7dd7f5ecead06d6|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-4.png|None|
|large-replacement|5/3.0|3000.0/11935.0|34064|c0118fdf2a3661dc23dde795b7dc301af8947a343e43957fbf14b565850f9cae|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-5.png|None|
|large-replacement|6/3.0|3600.0/11935.0|41254|978f5e8960e2def8f72c0a66f1376bde2e2eacb8e8f721038bad5b35db8f3055|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-6.png|None|
|large-replacement|7/3.0|4200.0/11935.0|45581|8316a6f0d180fcb84cb29b9b38c2c0e2a920614ad2eaa55c43068005812f46c4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-7.png|None|
|large-replacement|8/3.0|4800.0/11935.0|43445|68eb04c1516ec73826e7ac33cc275de5012cc7292b010256cb43647afa4988bd|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-8.png|None|
|large-replacement|9/3.0|5400.0/11935.0|48570|94df99549df44a1c391e4dd0641e349d4269403a36274a9551074d8b31965940|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-9.png|None|
|large-replacement|10/3.0|6000.0/11935.0|40023|794f082fd855b860dedf6b6e5531e52e663e99138e8b6b5695ec183326f8a9d7|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-10.png|None|
|large-replacement|11/3.0|6600.0/11935.0|44037|7e1861b342754001aa5a44726e9809d0a2e170f89d56d7f3a5b81069962c687b|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-11.png|None|
|large-replacement|12/3.0|7200.0/11935.0|45629|00c928c20cec1429e7cb5e0aa0a43b1163dd29f6fa23739f230e1136fec5e869|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-12.png|None|
|large-replacement|13/3.0|7800.0/11935.0|45006|a7d41a3d115a77b5d02e4176142497eafe7addab3dbc2b6cffeec075603022a5|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-13.png|None|
|large-replacement|14/3.0|8400.0/11935.0|44847|c29aa15664f7d45fc96fbe2b3e076e1eea3334dfc71d51b5fe89a415fd1476d0|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-14.png|None|
|large-replacement|15/3.0|9000.0/11935.0|50633|98bd5b0ba060f0b3cb4cb0fbf54248f5fc8825f593a800a68bf438f728a2f02f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-15.png|None|
|large-replacement|16/3.0|9600.0/11935.0|47482|4b2bf6218a0675b58494c88f13e5acee19b7004df3f40c2fcb0b15f935b2b5af|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-16.png|None|
|large-replacement|17/3.0|10200.0/11935.0|43309|44fa893e3b91b995a2d1cf8ac82e878d6643f6a57c50f43ee90068fc21aced56|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-17.png|None|
|large-replacement|18/3.0|10800.0/11935.0|52796|29e284148d28dcbcb2e2a1b64faccb3e164130533cf6fe01a4f999e8fba95022|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-18.png|None|
|large-replacement|19/3.0|11400.0/11935.0|51192|df67173d216104dd5953aa45141083767db065b2ccab6b4e082d7f8efb08f251|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-19.png|None|
|large-replacement|20/3.0|11935.0/11935.0|49938|3e4bdd98a677bcbb66503c554984a358724afb09661127757992c80ae81de115|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2/native-r2-large-replacement-20.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r2\native-r2-large-correction-21.png|

## İlişkiler ve açık üst kapılar

`vault/PROFILES/replacement-right-render.md`, `vault/PACKS/P-E1-025.md`, `vault/REGISTRY/T-E1-025.md`, `vault/REGISTRY/T-E3-001-R1.md`, `vault/REGISTRY/T-E5-003.md`. Bu kayıtlar yerel sunumun bağımsız REVIEW izini ve E3R1/E5 üretim HELD sınırını bağlar; teknik uzman/cihaz/yayın kanıtı oluşturmaz.

## Kayıt bağlantısı onarımı

GraphR1 raw8320bayt/SHA256 e1ab55a1d7eefc6dc71be280de303d95569258693754acf2cf676169ba8b2e5b;42testPASS olsa da profile incoming-backtick ve yeni dört kaydın HELD kaynak adresleri işaretlenmediği içinworst1. Kontrol kodu değiştirilmedi; gerçek paket/profil/görev/kanıt ve E3R1/E5 açık-kapı kaynakları yeni kayıtlara açıkça bağlandı. Aynı kod/PNG/testözetleri korunur; GraphR2 gereklidir.

## Güncel kayıt/koruma kontrolü

GraphR2 12kontrol/42testPASS,worst0;393ID/503Markdown,123kanıt,9contract/12runtime+8provision,index116. RAW 7960bayt/SHA256 0a7c8d94844f39d1e09ca58cdd4c815e7166d56136ec737881116fc0f863f0cd. R1 bağlantıFAILi korunur, checker değişmedi. 14izinliyol/173BASEpin/RAWv90/önceki primary ve gövde korundu. Kod/test/sabit20 özetleri yerel/test/doğal ekran kanıtıyla aynıdır. Bağımsız20/bütünSOURCE/CI-T3/FINAL/main beklenir; gerçek112/94/206.

## Kör ilk okuma R1 reddi — kod öncesi dar onarım kapsamı

CODE 0fd5e96768bf53c98b62665c3f50042f81067d6f /root/e1025_blind_r1 istenengpt6luna/max sabit20de18PASS/2BELİRSİZ-RET; Root nihai tam7362bayt/SHA256 5aee9a2d5cd41c09eed8342036eac5034ee9b8ff9e00446636283d1821932b2a raporu okudu. R1rapor ve CODE değişmez. Q17 hata mesajı yeni seçim talebinin gönderilmediğini açık söylemeli; refresh yalnız güncel bilgi isteği olup seçim talebinden ayrıdır. Q18 doğrulanamayan karar görünümünde başka hesap/motosiklet/rehber kararının bu seçimde geçersizliği açık söylenmeli.

İzinli14yol/173BASEpin ve sabit20SHA c9aa588599797fbdcd114f14f932abf3d7263be0e298ab938968092b39d471c0 değişmez. Yalnız replacement_right.dart içindeki bu iki açıklama ve ilişkili davranış beklentileri/onarıma ait doğal PNG/kanıt/kayıtlar yenilenir. Yeni politika, süre/izin/hak yazıcısı/rota veya yetki üretimi yok. Yeni CODE/localproof ve geçmişsiz körR2/bütünSOURCE/CI-T3 gereklidir; R1 kabul veya DONE değildir. Gerçek112/94/206.

Tam özgünR1 raporu: 7362bayt/SHA256 5aee9a2d5cd41c09eed8342036eac5034ee9b8ff9e00446636283d1821932b2a

<pre>KAVRIVA E1025 — BAĞIMSIZ KÖR İLK ARAYÜZ OKUMASI (R1)

Kapsam
- Verilen kapsam kimliği: CODE0fd5e96768bf53c98b62665c3f50042f81067d6f. Bu görevde Git doğrulaması yapılmadı.
- İstenen model/akıl yürütme: gpt-6-luna/max.
- Gerçek model/runtime attestation: unavailable. İzinli manifest ve proof dosyalarında model/runtime/attestation alanı yok; gerçek model kimliği iddia edilmiyor.
- Sabit 20 soru dosyası SHA-256: c9aa588599797fbdcd114f14f932abf3d7263be0e298ab938968092b39d471c0 — istenen hash ile eşleşti.
- Yalnız sabit soru fixture&#x27;ı, native-r2-manifest.json, native-r2-proof.json, unique-images-native-r2.json ve bu listelerdeki gerçek PNG&#x27;ler okundu. Kod, paket, task/root raporu, önceki R1, Git, PR veya plan okunmadı; test çalıştırılmadı.
- 80 özgün PNG&#x27;nin tamamı view_image original ile tek tek açıldı. Proof&#x27;taki 119 çerçevenin dosya varlığı, gerçek bayt boyutu, SHA-256 ve PNG signature/IHDR denetlendi: 119/119 geçerli, 390×844, SHA/byte alanları eşleşiyor; 80 farklı SHA bulundu. Proof&#x27;ta 39 alias olarak işaretli dosyanın tamamı hedefiyle tam bayt bayt karşılaştırıldı: 39/39 eşit.
- Manifest/proof sayımları: 22 durum, 119 çerçeve, 80 özgün PNG, 39 alias. Scroll metadata&#x27;sında 22/22 durum 0 offset&#x27;ten maxScrollExtent&#x27;e ulaşıyor; en büyük ardışık offset adımı 600px, viewport yüksekliği 844px (en az 244px örtüşme); başlangıç, max ve aradaki kaydırma yakalamalarında boşluk yok.

Sabit sorular ve görsel yanıtlar
1. PASS — Motosiklet, seçili rehber, rehber sürümü ve seçim sürümü örnek değerlerle etiketli; aynı kart örnek/üretim dışı karar olduğunu söylüyor. İzin/kimlik doğrulanmayan durumda ayrıntıların gizlendiği ayrıca yazıyor. [native-r2-correction-0.png, native-r2-replacement-0.png, native-r2-missing-0.png]
2. PASS — Ekran başlığı ve eylem metinleri “Yanlış rehber seçimini düzeltme” ile “Yeniden rehber seçimi”ni ayırıyor; “İki farklı durum” metni bu farkı açıklıyor. [native-r2-correction-0.png, native-r2-replacement-0.png, native-r2-started-1.png]
3. PASS — Yanlış seçimin ilk fiziksel adımdan önce düzeltilebileceği; iş başlamışsa düzeltmenin açılmayacağı açıkça yazıyor. Başlanmış durumda düzeltme isteği gri. [native-r2-correction-0.png, native-r2-started-1.png]
4. PASS — Başlangıç bilinmiyorsa düzeltmenin açılmadığı yazıyor; unknown-start durumu doğrulama eksikliğini gösteriyor ve düzeltme isteği gri. [native-r2-correction-0.png, native-r2-unknown-start-1.png]
5. PASS — Rehber kullanıcının hatası olmadan geri çekilirse yeni seçim hakkının sunucu kararına bağlı olduğu ve kendiliğinden yenilenmeyeceği açık. [native-r2-correction-0.png, native-r2-replacement-0.png]
6. PASS (örnek veri sınırı açık) — Kaynak, karar sürümü, kaynak konumu ve kontrol zamanı gösteriliyor; kaynak ve kararın örnek olduğu, üretime bağlı olmadığı kartta belirtiliyor. Canlı sunucu kararı gibi sunulmuyor. [native-r2-correction-0.png]
7. PASS — İstek alındıktan sonra hak verildiği veya seçimin değiştiğinin doğrulanmadığı; hata halinde seçimin değişmiş sayılmadığı yazıyor. [native-r2-received-1.png, native-r2-error-1.png]
8. PASS — Motosiklet değiştirme veya rehberi tamamlama yeni bir ücretsiz seçim hakkı üretmez açıklaması var. [native-r2-correction-1.png]
9. PASS — Tam rehber hakkının bir seçili motosiklette aynı anda açıldığı, motosiklet değişiminde taşındığı ve üstüne eklenmediği açık. [native-r2-correction-1.png]
10. PASS — Süre, seçim sıklığı ve ücret koşullarının burada belirlenmediği yazıyor; kesin değer uydurulmuyor. [native-r2-correction-1.png]
11. PASS (offline açık; eksik izin bağlamı görsel olarak kapalı) — Çevrimdışıyken yeni seçim için güncel sunucu kontrolü gerektiği yazıyor ve ilgili eylemler gri. Bilgi/izin yokken güncel seçim doğrulanamıyor, güncel kimlik ve okuma izni gerektiği, özel ayrıntıların gösterilmediği yazıyor; yeni seçim eylemi sunulmuyor. [native-r2-offline-1.png, native-r2-missing-0.png]
12. PASS — Okuma izni/kimlik doğrulanmadığında özel motosiklet ve rehber ayrıntılarının gösterilmediği açıkça yazıyor. [native-r2-missing-0.png]
13. PASS — Eski işlem kaydı, kullanılan rehber sürümü ve güvenlik düzeltmelerinin yeni seçimle silinmediği açık. [native-r2-correction-2.png]
14. PASS — Geçmiş kayıtları, kanıt/kaynak, düzeltme/itiraz ve dışa aktarma eylemleri ayrı gösteriliyor; bu yolların satın almaya bağlı olmadığı yazıyor. [native-r2-correction-2.png, native-r2-correction-3.png]
15. PASS — Kritik güvenlik bilgisi ile başlanmış işin güvenli dönüşü ayrı eylemler olarak yer alıyor. [native-r2-correction-2.png, native-r2-correction-3.png]
16. PASS — Seçim hakkının bakım izni veya motosikletin güvenli olduğuna dair kanıt olmadığı; güvenlik yollarına erişimin işi sürdürme izni olmadığı açık. [native-r2-correction-3.png]
17. BELİRSİZ / KISMİ RET — İşlem sürerken “Yeni istek gönderilmiyor” açık; işleyici yokken “Yeni seçim talebi gönderilemiyor” açık. Hata durumunda metin yalnızca kontrolün tamamlanamadığını ve seçimin değişmiş sayılmadığını söylüyor; istek eylemi gri olsa da yeni isteğin gönderilmediği metinle açıkça tekrarlanmıyor. [native-r2-busy-1.png, native-r2-error-1.png, native-r2-no-handler-0.png]
18. BELİRSİZ / RET — Kimlik ve okuma izninin güncel olması gerektiği belirtiliyor; başka hesap, motosiklet veya rehbere ait kararın bu seçime uygulanamayacağı açıkça söylenmiyor. Kimlik uyarısı tek başına üç bağlamı da kesin biçimde kapatmıyor. [native-r2-missing-0.png, native-r2-correction-0.png]
19. PASS (3× büyük yazıda biçim notu) — Uzun açıklama ve 3× yazı doğal kaydırmayla okunabiliyor; manifest yakalamaları 0&#x27;dan max&#x27;a kadar 600px adımla ilerleyip örtüşüyor. Büyük yazıda satırlar ve başlıklar çok uzun; bazı sözcükler kırılma/ekran sınırında bölünüyor, ancak ardışık kaydırma ekranında metin devam ediyor. Kayıt, güvenlik eylemleri ve footer yolları max scroll&#x27;da görünüyor. [native-r2-long-0.png, native-r2-long-1.png, native-r2-large-correction-0.png, native-r2-large-correction-21.png, native-r2-large-replacement-0.png, native-r2-large-replacement-19.png]
20. PASS — “Garaja dön” ve “Destek seçenekleri” eylemleri açık isimlerle son bölümde bulunuyor. [native-r2-correction-3.png, native-r2-no-handler-3.png, native-r2-large-correction-21.png]

Öne çıkan belirsizlikler
- Soru 17: hata halinde görsel olarak pasif istek eylemi var; metin yeni isteğin gönderilmediğini açıkça söylemiyor.
- Soru 18: farklı hesap/motosiklet/rehber kararının bu seçimde geçersiz olduğu açık cümleyle belirtilmiyor.
- Büyük yazı testi içeriği kaybetmiyor; ancak 3× görünüm çok yüksek ve bazı uzun başlıklarda/kelimelerde satır kırılımı kaba.

Görsel okuma sonucu: 18 PASS, 2 BELİRSİZ/RET. Bu sonuç yalnız sağlanan örnek ekranların görsel okunabilirliği hakkındadır; üretim davranışı, gerçek kullanıcı verisi veya kaynak kodu hakkında doğrulama değildir.</pre>

RAW Base64: S0FWUklWQSBFMTAyNSDigJQgQkHEnklNU0laIEvDllIgxLBMSyBBUkFZw5xaIE9LVU1BU0kgKFIxKQoKS2Fwc2FtCi0gVmVyaWxlbiBrYXBzYW0ga2ltbGnEn2k6IENPREUwZmQ1ZTk2NzY4YmY1M2M5OGI2MjY2NWMzZjUwMDQyZjgxMDY3ZDZmLiBCdSBnw7ZyZXZkZSBHaXQgZG/En3J1bGFtYXPEsSB5YXDEsWxtYWTEsS4KLSDEsHN0ZW5lbiBtb2RlbC9ha8SxbCB5w7xyw7x0bWU6IGdwdC02LWx1bmEvbWF4LgotIEdlcsOnZWsgbW9kZWwvcnVudGltZSBhdHRlc3RhdGlvbjogdW5hdmFpbGFibGUuIMSwemlubGkgbWFuaWZlc3QgdmUgcHJvb2YgZG9zeWFsYXLEsW5kYSBtb2RlbC9ydW50aW1lL2F0dGVzdGF0aW9uIGFsYW7EsSB5b2s7IGdlcsOnZWsgbW9kZWwga2ltbGnEn2kgaWRkaWEgZWRpbG1peW9yLgotIFNhYml0IDIwIHNvcnUgZG9zeWFzxLEgU0hBLTI1NjogYzlhYTU4ODU5OTc5N2ZiZGNkMTE0ZjE0ZjkzMmFiZjNkNzI2M2JlMGUyOThhYjkzODk2ODA5MmIzOWQ0NzFjMCDigJQgaXN0ZW5lbiBoYXNoIGlsZSBlxZ9sZcWfdGkuCi0gWWFsbsSxeiBzYWJpdCBzb3J1IGZpeHR1cmUnxLEsIG5hdGl2ZS1yMi1tYW5pZmVzdC5qc29uLCBuYXRpdmUtcjItcHJvb2YuanNvbiwgdW5pcXVlLWltYWdlcy1uYXRpdmUtcjIuanNvbiB2ZSBidSBsaXN0ZWxlcmRla2kgZ2Vyw6dlayBQTkcnbGVyIG9rdW5kdS4gS29kLCBwYWtldCwgdGFzay9yb290IHJhcG9ydSwgw7ZuY2VraSBSMSwgR2l0LCBQUiB2ZXlhIHBsYW4gb2t1bm1hZMSxOyB0ZXN0IMOnYWzEscWfdMSxcsSxbG1hZMSxLgotIDgwIMO2emfDvG4gUE5HJ25pbiB0YW1hbcSxIHZpZXdfaW1hZ2Ugb3JpZ2luYWwgaWxlIHRlayB0ZWsgYcOnxLFsZMSxLiBQcm9vZid0YWtpIDExOSDDp2Vyw6dldmVuaW4gZG9zeWEgdmFybMSxxJ/EsSwgZ2Vyw6dlayBiYXl0IGJveXV0dSwgU0hBLTI1NiB2ZSBQTkcgc2lnbmF0dXJlL0lIRFIgZGVuZXRsZW5kaTogMTE5LzExOSBnZcOnZXJsaSwgMzkww5c4NDQsIFNIQS9ieXRlIGFsYW5sYXLEsSBlxZ9sZcWfaXlvcjsgODAgZmFya2zEsSBTSEEgYnVsdW5kdS4gUHJvb2YndGEgMzkgYWxpYXMgb2xhcmFrIGnFn2FyZXRsaSBkb3N5YW7EsW4gdGFtYW3EsSBoZWRlZml5bGUgdGFtIGJheXQgYmF5dCBrYXLFn8SxbGHFn3TEsXLEsWxkxLE6IDM5LzM5IGXFn2l0LgotIE1hbmlmZXN0L3Byb29mIHNhecSxbWxhcsSxOiAyMiBkdXJ1bSwgMTE5IMOnZXLDp2V2ZSwgODAgw7Z6Z8O8biBQTkcsIDM5IGFsaWFzLiBTY3JvbGwgbWV0YWRhdGEnc8SxbmRhIDIyLzIyIGR1cnVtIDAgb2Zmc2V0J3RlbiBtYXhTY3JvbGxFeHRlbnQnZSB1bGHFn8SxeW9yOyBlbiBiw7x5w7xrIGFyZMSxxZ/EsWsgb2Zmc2V0IGFkxLFtxLEgNjAwcHgsIHZpZXdwb3J0IHnDvGtzZWtsacSfaSA4NDRweCAoZW4gYXogMjQ0cHggw7ZydMO8xZ9tZSk7IGJhxZ9sYW5nxLHDpywgbWF4IHZlIGFyYWRha2kga2F5ZMSxcm1hIHlha2FsYW1hbGFyxLFuZGEgYm/Fn2x1ayB5b2suCgpTYWJpdCBzb3J1bGFyIHZlIGfDtnJzZWwgeWFuxLF0bGFyCjEuIFBBU1Mg4oCUIE1vdG9zaWtsZXQsIHNlw6dpbGkgcmVoYmVyLCByZWhiZXIgc8O8csO8bcO8IHZlIHNlw6dpbSBzw7xyw7xtw7wgw7ZybmVrIGRlxJ9lcmxlcmxlIGV0aWtldGxpOyBheW7EsSBrYXJ0IMO2cm5lay/DvHJldGltIGTEscWfxLEga2FyYXIgb2xkdcSfdW51IHPDtnlsw7x5b3IuIMSwemluL2tpbWxpayBkb8SfcnVsYW5tYXlhbiBkdXJ1bWRhIGF5csSxbnTEsWxhcsSxbiBnaXpsZW5kacSfaSBheXLEsWNhIHlhesSxeW9yLiBbbmF0aXZlLXIyLWNvcnJlY3Rpb24tMC5wbmcsIG5hdGl2ZS1yMi1yZXBsYWNlbWVudC0wLnBuZywgbmF0aXZlLXIyLW1pc3NpbmctMC5wbmddCjIuIFBBU1Mg4oCUIEVrcmFuIGJhxZ9sxLHEn8SxIHZlIGV5bGVtIG1ldGlubGVyaSDigJxZYW5sxLHFnyByZWhiZXIgc2XDp2ltaW5pIGTDvHplbHRtZeKAnSBpbGUg4oCcWWVuaWRlbiByZWhiZXIgc2XDp2ltaeKAnW5pIGF5xLFyxLF5b3I7IOKAnMSwa2kgZmFya2zEsSBkdXJ1beKAnSBtZXRuaSBidSBmYXJrxLEgYcOnxLFrbMSxeW9yLiBbbmF0aXZlLXIyLWNvcnJlY3Rpb24tMC5wbmcsIG5hdGl2ZS1yMi1yZXBsYWNlbWVudC0wLnBuZywgbmF0aXZlLXIyLXN0YXJ0ZWQtMS5wbmddCjMuIFBBU1Mg4oCUIFlhbmzEscWfIHNlw6dpbWluIGlsayBmaXppa3NlbCBhZMSxbWRhbiDDtm5jZSBkw7x6ZWx0aWxlYmlsZWNlxJ9pOyBpxZ8gYmHFn2xhbcSxxZ9zYSBkw7x6ZWx0bWVuaW4gYcOnxLFsbWF5YWNhxJ/EsSBhw6fEsWvDp2EgeWF6xLF5b3IuIEJhxZ9sYW5txLHFnyBkdXJ1bWRhIGTDvHplbHRtZSBpc3RlxJ9pIGdyaS4gW25hdGl2ZS1yMi1jb3JyZWN0aW9uLTAucG5nLCBuYXRpdmUtcjItc3RhcnRlZC0xLnBuZ10KNC4gUEFTUyDigJQgQmHFn2xhbmfEscOnIGJpbGlubWl5b3JzYSBkw7x6ZWx0bWVuaW4gYcOnxLFsbWFkxLHEn8SxIHlhesSxeW9yOyB1bmtub3duLXN0YXJ0IGR1cnVtdSBkb8SfcnVsYW1hIGVrc2lrbGnEn2luaSBnw7ZzdGVyaXlvciB2ZSBkw7x6ZWx0bWUgaXN0ZcSfaSBncmkuIFtuYXRpdmUtcjItY29ycmVjdGlvbi0wLnBuZywgbmF0aXZlLXIyLXVua25vd24tc3RhcnQtMS5wbmddCjUuIFBBU1Mg4oCUIFJlaGJlciBrdWxsYW7EsWPEsW7EsW4gaGF0YXPEsSBvbG1hZGFuIGdlcmkgw6dla2lsaXJzZSB5ZW5pIHNlw6dpbSBoYWtrxLFuxLFuIHN1bnVjdSBrYXJhcsSxbmEgYmHEn2zEsSBvbGR1xJ91IHZlIGtlbmRpbGnEn2luZGVuIHllbmlsZW5tZXllY2XEn2kgYcOnxLFrLiBbbmF0aXZlLXIyLWNvcnJlY3Rpb24tMC5wbmcsIG5hdGl2ZS1yMi1yZXBsYWNlbWVudC0wLnBuZ10KNi4gUEFTUyAow7ZybmVrIHZlcmkgc8SxbsSxcsSxIGHDp8Sxaykg4oCUIEtheW5haywga2FyYXIgc8O8csO8bcO8LCBrYXluYWsga29udW11IHZlIGtvbnRyb2wgemFtYW7EsSBnw7ZzdGVyaWxpeW9yOyBrYXluYWsgdmUga2FyYXLEsW4gw7ZybmVrIG9sZHXEn3UsIMO8cmV0aW1lIGJhxJ9sxLEgb2xtYWTEscSfxLEga2FydHRhIGJlbGlydGlsaXlvci4gQ2FubMSxIHN1bnVjdSBrYXJhcsSxIGdpYmkgc3VudWxtdXlvci4gW25hdGl2ZS1yMi1jb3JyZWN0aW9uLTAucG5nXQo3LiBQQVNTIOKAlCDEsHN0ZWsgYWzEsW5kxLFrdGFuIHNvbnJhIGhhayB2ZXJpbGRpxJ9pIHZleWEgc2XDp2ltaW4gZGXEn2nFn3RpxJ9pbmluIGRvxJ9ydWxhbm1hZMSxxJ/EsTsgaGF0YSBoYWxpbmRlIHNlw6dpbWluIGRlxJ9pxZ9tacWfIHNhecSxbG1hZMSxxJ/EsSB5YXrEsXlvci4gW25hdGl2ZS1yMi1yZWNlaXZlZC0xLnBuZywgbmF0aXZlLXIyLWVycm9yLTEucG5nXQo4LiBQQVNTIOKAlCBNb3Rvc2lrbGV0IGRlxJ9pxZ90aXJtZSB2ZXlhIHJlaGJlcmkgdGFtYW1sYW1hIHllbmkgYmlyIMO8Y3JldHNpeiBzZcOnaW0gaGFra8SxIMO8cmV0bWV6IGHDp8Sxa2xhbWFzxLEgdmFyLiBbbmF0aXZlLXIyLWNvcnJlY3Rpb24tMS5wbmddCjkuIFBBU1Mg4oCUIFRhbSByZWhiZXIgaGFra8SxbsSxbiBiaXIgc2XDp2lsaSBtb3Rvc2lrbGV0dGUgYXluxLEgYW5kYSBhw6fEsWxkxLHEn8SxLCBtb3Rvc2lrbGV0IGRlxJ9pxZ9pbWluZGUgdGHFn8SxbmTEscSfxLEgdmUgw7xzdMO8bmUgZWtsZW5tZWRpxJ9pIGHDp8Sxay4gW25hdGl2ZS1yMi1jb3JyZWN0aW9uLTEucG5nXQoxMC4gUEFTUyDigJQgU8O8cmUsIHNlw6dpbSBzxLFrbMSxxJ/EsSB2ZSDDvGNyZXQga2/Fn3VsbGFyxLFuxLFuIGJ1cmFkYSBiZWxpcmxlbm1lZGnEn2kgeWF6xLF5b3I7IGtlc2luIGRlxJ9lciB1eWR1cnVsbXV5b3IuIFtuYXRpdmUtcjItY29ycmVjdGlvbi0xLnBuZ10KMTEuIFBBU1MgKG9mZmxpbmUgYcOnxLFrOyBla3NpayBpemluIGJhxJ9sYW3EsSBnw7Zyc2VsIG9sYXJhayBrYXBhbMSxKSDigJQgw4dldnJpbWTEscWfxLF5a2VuIHllbmkgc2XDp2ltIGnDp2luIGfDvG5jZWwgc3VudWN1IGtvbnRyb2zDvCBnZXJla3RpxJ9pIHlhesSxeW9yIHZlIGlsZ2lsaSBleWxlbWxlciBncmkuIEJpbGdpL2l6aW4geW9ra2VuIGfDvG5jZWwgc2XDp2ltIGRvxJ9ydWxhbmFtxLF5b3IsIGfDvG5jZWwga2ltbGlrIHZlIG9rdW1hIGl6bmkgZ2VyZWt0acSfaSwgw7Z6ZWwgYXlyxLFudMSxbGFyxLFuIGfDtnN0ZXJpbG1lZGnEn2kgeWF6xLF5b3I7IHllbmkgc2XDp2ltIGV5bGVtaSBzdW51bG11eW9yLiBbbmF0aXZlLXIyLW9mZmxpbmUtMS5wbmcsIG5hdGl2ZS1yMi1taXNzaW5nLTAucG5nXQoxMi4gUEFTUyDigJQgT2t1bWEgaXpuaS9raW1saWsgZG/En3J1bGFubWFkxLHEn8SxbmRhIMO2emVsIG1vdG9zaWtsZXQgdmUgcmVoYmVyIGF5csSxbnTEsWxhcsSxbsSxbiBnw7ZzdGVyaWxtZWRpxJ9pIGHDp8Sxa8OnYSB5YXrEsXlvci4gW25hdGl2ZS1yMi1taXNzaW5nLTAucG5nXQoxMy4gUEFTUyDigJQgRXNraSBpxZ9sZW0ga2F5ZMSxLCBrdWxsYW7EsWxhbiByZWhiZXIgc8O8csO8bcO8IHZlIGfDvHZlbmxpayBkw7x6ZWx0bWVsZXJpbmluIHllbmkgc2XDp2ltbGUgc2lsaW5tZWRpxJ9pIGHDp8Sxay4gW25hdGl2ZS1yMi1jb3JyZWN0aW9uLTIucG5nXQoxNC4gUEFTUyDigJQgR2XDp21pxZ8ga2F5xLF0bGFyxLEsIGthbsSxdC9rYXluYWssIGTDvHplbHRtZS9pdGlyYXogdmUgZMSxxZ9hIGFrdGFybWEgZXlsZW1sZXJpIGF5csSxIGfDtnN0ZXJpbGl5b3I7IGJ1IHlvbGxhcsSxbiBzYXTEsW4gYWxtYXlhIGJhxJ9sxLEgb2xtYWTEscSfxLEgeWF6xLF5b3IuIFtuYXRpdmUtcjItY29ycmVjdGlvbi0yLnBuZywgbmF0aXZlLXIyLWNvcnJlY3Rpb24tMy5wbmddCjE1LiBQQVNTIOKAlCBLcml0aWsgZ8O8dmVubGlrIGJpbGdpc2kgaWxlIGJhxZ9sYW5txLHFnyBpxZ9pbiBnw7x2ZW5saSBkw7Zuw7zFn8O8IGF5csSxIGV5bGVtbGVyIG9sYXJhayB5ZXIgYWzEsXlvci4gW25hdGl2ZS1yMi1jb3JyZWN0aW9uLTIucG5nLCBuYXRpdmUtcjItY29ycmVjdGlvbi0zLnBuZ10KMTYuIFBBU1Mg4oCUIFNlw6dpbSBoYWtrxLFuxLFuIGJha8SxbSBpem5pIHZleWEgbW90b3Npa2xldGluIGfDvHZlbmxpIG9sZHXEn3VuYSBkYWlyIGthbsSxdCBvbG1hZMSxxJ/EsTsgZ8O8dmVubGlrIHlvbGxhcsSxbmEgZXJpxZ9pbWluIGnFn2kgc8O8cmTDvHJtZSBpem5pIG9sbWFkxLHEn8SxIGHDp8Sxay4gW25hdGl2ZS1yMi1jb3JyZWN0aW9uLTMucG5nXQoxNy4gQkVMxLBSU8SwWiAvIEtJU03EsCBSRVQg4oCUIMSwxZ9sZW0gc8O8cmVya2VuIOKAnFllbmkgaXN0ZWsgZ8O2bmRlcmlsbWl5b3LigJ0gYcOnxLFrOyBpxZ9sZXlpY2kgeW9ra2VuIOKAnFllbmkgc2XDp2ltIHRhbGViaSBnw7ZuZGVyaWxlbWl5b3LigJ0gYcOnxLFrLiBIYXRhIGR1cnVtdW5kYSBtZXRpbiB5YWxuxLF6Y2Ega29udHJvbMO8biB0YW1hbWxhbmFtYWTEscSfxLFuxLEgdmUgc2XDp2ltaW4gZGXEn2nFn21pxZ8gc2F5xLFsbWFkxLHEn8SxbsSxIHPDtnlsw7x5b3I7IGlzdGVrIGV5bGVtaSBncmkgb2xzYSBkYSB5ZW5pIGlzdGXEn2luIGfDtm5kZXJpbG1lZGnEn2kgbWV0aW5sZSBhw6fEsWvDp2EgdGVrcmFybGFubcSxeW9yLiBbbmF0aXZlLXIyLWJ1c3ktMS5wbmcsIG5hdGl2ZS1yMi1lcnJvci0xLnBuZywgbmF0aXZlLXIyLW5vLWhhbmRsZXItMC5wbmddCjE4LiBCRUzEsFJTxLBaIC8gUkVUIOKAlCBLaW1saWsgdmUgb2t1bWEgaXpuaW5pbiBnw7xuY2VsIG9sbWFzxLEgZ2VyZWt0acSfaSBiZWxpcnRpbGl5b3I7IGJhxZ9rYSBoZXNhcCwgbW90b3Npa2xldCB2ZXlhIHJlaGJlcmUgYWl0IGthcmFyxLFuIGJ1IHNlw6dpbWUgdXlndWxhbmFtYXlhY2HEn8SxIGHDp8Sxa8OnYSBzw7Z5bGVubWl5b3IuIEtpbWxpayB1eWFyxLFzxLEgdGVrIGJhxZ/EsW5hIMO8w6cgYmHEn2xhbcSxIGRhIGtlc2luIGJpw6dpbWRlIGthcGF0bcSxeW9yLiBbbmF0aXZlLXIyLW1pc3NpbmctMC5wbmcsIG5hdGl2ZS1yMi1jb3JyZWN0aW9uLTAucG5nXQoxOS4gUEFTUyAoM8OXIGLDvHnDvGsgeWF6xLFkYSBiacOnaW0gbm90dSkg4oCUIFV6dW4gYcOnxLFrbGFtYSB2ZSAzw5cgeWF6xLEgZG/En2FsIGtheWTEsXJtYXlsYSBva3VuYWJpbGl5b3I7IG1hbmlmZXN0IHlha2FsYW1hbGFyxLEgMCdkYW4gbWF4J2Ega2FkYXIgNjAwcHggYWTEsW1sYSBpbGVybGV5aXAgw7ZydMO8xZ/DvHlvci4gQsO8ecO8ayB5YXrEsWRhIHNhdMSxcmxhciB2ZSBiYcWfbMSxa2xhciDDp29rIHV6dW47IGJhesSxIHPDtnpjw7xrbGVyIGvEsXLEsWxtYS9la3JhbiBzxLFuxLFyxLFuZGEgYsO2bMO8bsO8eW9yLCBhbmNhayBhcmTEscWfxLFrIGtheWTEsXJtYSBla3JhbsSxbmRhIG1ldGluIGRldmFtIGVkaXlvci4gS2F5xLF0LCBnw7x2ZW5saWsgZXlsZW1sZXJpIHZlIGZvb3RlciB5b2xsYXLEsSBtYXggc2Nyb2xsJ2RhIGfDtnLDvG7DvHlvci4gW25hdGl2ZS1yMi1sb25nLTAucG5nLCBuYXRpdmUtcjItbG9uZy0xLnBuZywgbmF0aXZlLXIyLWxhcmdlLWNvcnJlY3Rpb24tMC5wbmcsIG5hdGl2ZS1yMi1sYXJnZS1jb3JyZWN0aW9uLTIxLnBuZywgbmF0aXZlLXIyLWxhcmdlLXJlcGxhY2VtZW50LTAucG5nLCBuYXRpdmUtcjItbGFyZ2UtcmVwbGFjZW1lbnQtMTkucG5nXQoyMC4gUEFTUyDigJQg4oCcR2FyYWphIGTDtm7igJ0gdmUg4oCcRGVzdGVrIHNlw6dlbmVrbGVyaeKAnSBleWxlbWxlcmkgYcOnxLFrIGlzaW1sZXJsZSBzb24gYsO2bMO8bWRlIGJ1bHVudXlvci4gW25hdGl2ZS1yMi1jb3JyZWN0aW9uLTMucG5nLCBuYXRpdmUtcjItbm8taGFuZGxlci0zLnBuZywgbmF0aXZlLXIyLWxhcmdlLWNvcnJlY3Rpb24tMjEucG5nXQoKw5ZuZSDDp8Sxa2FuIGJlbGlyc2l6bGlrbGVyCi0gU29ydSAxNzogaGF0YSBoYWxpbmRlIGfDtnJzZWwgb2xhcmFrIHBhc2lmIGlzdGVrIGV5bGVtaSB2YXI7IG1ldGluIHllbmkgaXN0ZcSfaW4gZ8O2bmRlcmlsbWVkacSfaW5pIGHDp8Sxa8OnYSBzw7Z5bGVtaXlvci4KLSBTb3J1IDE4OiBmYXJrbMSxIGhlc2FwL21vdG9zaWtsZXQvcmVoYmVyIGthcmFyxLFuxLFuIGJ1IHNlw6dpbWRlIGdlw6dlcnNpeiBvbGR1xJ91IGHDp8SxayBjw7xtbGV5bGUgYmVsaXJ0aWxtaXlvci4KLSBCw7x5w7xrIHlhesSxIHRlc3RpIGnDp2VyacSfaSBrYXliZXRtaXlvcjsgYW5jYWsgM8OXIGfDtnLDvG7DvG0gw6dvayB5w7xrc2VrIHZlIGJhesSxIHV6dW4gYmHFn2zEsWtsYXJkYS9rZWxpbWVsZXJkZSBzYXTEsXIga8SxcsSxbMSxbcSxIGthYmEuCgpHw7Zyc2VsIG9rdW1hIHNvbnVjdTogMTggUEFTUywgMiBCRUzEsFJTxLBaL1JFVC4gQnUgc29udcOnIHlhbG7EsXogc2HEn2xhbmFuIMO2cm5layBla3JhbmxhcsSxbiBnw7Zyc2VsIG9rdW5hYmlsaXJsacSfaSBoYWtrxLFuZGFkxLFyOyDDvHJldGltIGRhdnJhbsSxxZ/EsSwgZ2Vyw6dlayBrdWxsYW7EsWPEsSB2ZXJpc2kgdmV5YSBrYXluYWsga29kdSBoYWtrxLFuZGEgZG/En3J1bGFtYSBkZcSfaWxkaXIu

## Q17/Q18 dar onarımının güncel yerel kanıtı

R1 CODE0fd5e96768bf53c98b62665c3f50042f81067d6f ve7362bayt/SHA256 5aee9a2d5cd41c09eed8342036eac5034ee9b8ff9e00446636283d1821932b2a körRET aynen korunur. Kodöncesi dar kapsam 3635d0e6ef5316d0d9155085fe0ee6b964b153c9. Hata metni yeni seçim talebinin gönderilmediğini ve tekrar güncel bilgi istemenin seçim talebi olmadığını açık söyler. Doğrulanamayan kararda başka hesap/motosiklet/rehber kararının bu seçimde kullanılamayacağı açıkça yazılır. Guard/izin/ticari politika/süre/pencere değişmedi. İlişkili davranış beklentileri güçlendirildi; sabit20soru aynı c9aa588599797fbdcd114f14f932abf3d7263be0e298ab938968092b39d471c0. Yeni körR2 bu iki bulguyu bağımsız yeniden değerlendirmeden R1 kapanmış sayılmaz.

Güncel R3 normal482=473korunan+9yeni; ayrı native10,56format0/analyze0 ve36responsive. NativeR3 22durum/119PNG/81özgün/38tamalias. Root güncel tüm özgünleri kapsadı: 4 yeni original açıldı; 77 görüntü daha önce gerçekten açılmış R2original ile tam byteeş. R2kopya karşılaştırması yalnızSHAya dayanmaz; her eşin tüm baytları karşılaştırıldı. Eski R1 Root8 ve R2 Root80 gerçekokumaları ve körRET tarihi korunur. Bu yerel metin onarımı üretim/uzman/cihaz/yayın veya bağımsızPASS değildir; görev CHANGES_REQUESTED; yeni körR2 beklenir, gerçek112/94/206.

## R1 konu başlığı — tarihsel ret kaynağı

<pre>
test_id: E-DEV-124
contract_id_version: &quot;C1.7/F1.7.1/FL1.7.2 replacement presentation v1&quot;
subject_file: modules/e01-app/internal/shell/lib/replacement_right.dart
subject_digest: e1996238c6526df0dee4d3ff781e91e10d0518d01f9df6a191188d7e3ae2061b
result: &quot;Yerel482 PASS; kör R1 Q17/Q18 CHANGES_REQUESTED&quot;
evidence_links: [vault/EVIDENCE/E-DEV-123.md, vault/PROFILES/replacement-right-render.md, vault/PACKS/P-E1-025.md, vault/REGISTRY/T-E1-025.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-123-E10-GOVERNED-PATHS-FOR-T-E1-025.md.snapshot, modules/e01-app/internal/shell/lib/replacement_right.dart, modules/e01-app/internal/shell/test/replacement_right_test.dart, modules/e01-app/internal/shell/test/fixtures/replacement_right_reading_questions.json]
gate_verdict: &quot;FAIL kör R1 Q17/Q18; dar metin onarımı ve taze inceleme gerekir&quot;
reviewer: &quot;/root/e1025_blind_r1; only first-reading requested gpt-6-luna/max&quot;
timestamp: 2026-10-17
version: 1
purpose: Rehber seçimi düzeltme ve yeniden seçim taleplerini güncel sunucu kararıyla sınırlı sunmak
domain: motorcycle-entitlement
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, C1.7, F1.7.1, FL1.7.2, SCR-037, BR-048, BR-049, BR-134, CON-001, CON-002, CON-003, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: selection-replacement-presentation
tasks: [T-E1-025]
tests: [modules/e01-app/internal/shell/test/replacement_right_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-17
depends_on: [V-E1-REPLACEMENT-001]
used_by: [V-E1-REPLACEMENT-001, P-E1-025, T-E1-025]
evidence: []
supersedes: []
status: RECORDED
</pre>

## Güncel R3 konu özetleri

- modules/e01-app/internal/shell/lib/replacement_right.dart LF SHA256 cfda3b926e0e493814fa849f7cb913ae12e670075483fb79c7e0a00d677f8744
- modules/e01-app/internal/shell/test/replacement_right_test.dart LF SHA256 817923a2bd55a21e96fe9f2923b46e06a9a833b4ed0720bd3651511e7b2b3c52
- modules/e01-app/internal/shell/test/fixtures/replacement_right_reading_questions.json LF SHA256 c9aa588599797fbdcd114f14f932abf3d7263be0e298ab938968092b39d471c0

target-r6.log 981bayt/SHA256 d6fdd3856c8fcd62c724a942cbcfe1dae8f7df342e08c46bdbe58f56a2476439

analyze-r6.log 96bayt/SHA256 bf1bdb10eb9553a187514a8f3f72f969f77aad2421064b7aac5bec64f500d643

format-r3.log 48bayt/SHA256 6cb948c8e8c97c28f429d7c721183b8bac807c97fc87314a9e2ff9c37d7cb9f8

native-r3.log 1056bayt/SHA256 daa21d19eed9a8598c16b5c16c52e140523b4f06db523cc39de81b07d6f24d13

full-r3.log 111962bayt/SHA256 0855dbcc06e3a8d66006db1cba8d687fcf43be4c074ad54fd82f71c93bd3d1c0

root-native-r3-read.json 30497bayt/SHA256 c4685a562c974abc1fb06a71b214da903dfc6f62913543fdb48eade95fe1b4c6

<pre>{
  &quot;stage&quot;: &quot;native-r3&quot;,
  &quot;allCurrentUniqueCovered&quot;: true,
  &quot;openedNewOriginal&quot;: 4,
  &quot;coveredByPriorActualRead&quot;: 77,
  &quot;totalCurrentUnique&quot;: 81,
  &quot;frames&quot;: 119,
  &quot;aliases&quot;: 38,
  &quot;actuallyOpenedNewOriginal&quot;: [
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-missing-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-missing-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-error-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-error-2.png&quot;
  ],
  &quot;fullByteMappings&quot;: [
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-correction-0.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-correction-0.png&quot;,
      &quot;sha256&quot;: &quot;d31f475f40e37d7d1172849290f851cc5fb7e3d70c2879b153765ab766cd31a2&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-correction-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-correction-1.png&quot;,
      &quot;sha256&quot;: &quot;cd6552b1d4ca76d46a1d9a5ae0a9b79c4c1ef9aceac7505019ad9b73e697b6f8&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-correction-2.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-correction-2.png&quot;,
      &quot;sha256&quot;: &quot;810c843888e2e3b3ec17ecc656e2bf433ef793f40c2f514c6d53fdaba06db6d4&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-correction-3.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-correction-3.png&quot;,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-replacement-0.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-replacement-0.png&quot;,
      &quot;sha256&quot;: &quot;19513ac0fe7508262df117eb918c7f179feb5acad43a20c3719cbb43342317c5&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-replacement-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-replacement-1.png&quot;,
      &quot;sha256&quot;: &quot;218ceb5aa77359f8e7510e837f21dcb113839ac070efa3e451039015850d2485&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-replacement-2.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-replacement-2.png&quot;,
      &quot;sha256&quot;: &quot;2593fafd2a7693703bd2d14569d76fba78d6c70a65eabd30fb638e231ae3174f&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-started-0.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-started-0.png&quot;,
      &quot;sha256&quot;: &quot;614b3dad8a6eaa33f80b995576f124c4e71ed87e2a354d2c040e5d424c4ffc47&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-started-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-started-1.png&quot;,
      &quot;sha256&quot;: &quot;a7345075bd3084606e9b87797fc41a3cf8d3c4535ca095155c050d6e3db17851&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-started-2.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-started-2.png&quot;,
      &quot;sha256&quot;: &quot;e0b458fa6b73b3e02791bddb104a4c3ec19cb3ca66bacd17b3e343ca2142da3b&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-unknown-start-0.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-unknown-start-0.png&quot;,
      &quot;sha256&quot;: &quot;7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-unknown-start-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-unknown-start-1.png&quot;,
      &quot;sha256&quot;: &quot;e0449f60f57100c30cd8afc3bdc92d7bfdcfaf005eb106573db64b57748cb27e&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-renew-started-0.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-renew-started-0.png&quot;,
      &quot;sha256&quot;: &quot;9521ef4a2b65815c47040c8f3f9e56c07baf0edbd8421b3060ef195b8c4b1aa4&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-renew-started-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-renew-started-1.png&quot;,
      &quot;sha256&quot;: &quot;f27d8ed010da01aa5415fc2b5b99028b34705ad3f6a72aa8093c7deb31349917&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-renew-started-2.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-renew-started-2.png&quot;,
      &quot;sha256&quot;: &quot;2e39624a246d8203102ec3ecdc764de3dea48811559902173992cd1b78862cb7&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-user-fault-0.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-user-fault-0.png&quot;,
      &quot;sha256&quot;: &quot;c3b260f369f61fec99679fac89c09a618ebad9177c1bd4ecebdedd172a62e6d3&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-user-fault-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-user-fault-1.png&quot;,
      &quot;sha256&quot;: &quot;4d22265298f0a091e535991d06af8866561ba418fa52e943471a49213da0f359&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-held-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-held-1.png&quot;,
      &quot;sha256&quot;: &quot;5d8acf63d3f4e2931cfa713f558d65c5f9498fcbe0d8ddb9c4b43cd97721da76&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-denied-0.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-denied-0.png&quot;,
      &quot;sha256&quot;: &quot;f4ef3af0f1993dd023ae7126aa2a960c76a20ad6514c92431341b9e03b429166&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-offline-0.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-offline-0.png&quot;,
      &quot;sha256&quot;: &quot;74b9984ef14fec1524510513b156b244dad8eae37aef4a41623811de28c521e3&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-offline-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-offline-1.png&quot;,
      &quot;sha256&quot;: &quot;7071c668d3dfeece8e09b8e2a22ecbe91b6deeb9e13406f15045e4407676954e&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-offline-2.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-offline-2.png&quot;,
      &quot;sha256&quot;: &quot;467f6e9094f9557a775a7abc1a0a358d6c656440c62a42f3e1fca264a33e7c1d&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-busy-0.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-busy-0.png&quot;,
      &quot;sha256&quot;: &quot;6f906e993160db4b371195278d2c20c793ce9c8f385467725b0e2d8684a05a69&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-busy-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-busy-1.png&quot;,
      &quot;sha256&quot;: &quot;ae37168f661365395ca6564ba078bafdb21ff276754b3bd579fff5d258d64506&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-busy-2.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-busy-2.png&quot;,
      &quot;sha256&quot;: &quot;ffa336c2579e876111ad96b6b4bc1129c884484d76bb91e71847bc9bdaa5ace5&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-received-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-received-1.png&quot;,
      &quot;sha256&quot;: &quot;5499538f52593e81f3693799978fbb348c120e3251e14eeeeee3ee4f56bc6fff&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-no-handler-0.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-no-handler-0.png&quot;,
      &quot;sha256&quot;: &quot;864d5b8656b6060e61c82bc5be4d269a89a6e0fdbd5f4a0ce3c9dd060335e229&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-no-handler-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-no-handler-1.png&quot;,
      &quot;sha256&quot;: &quot;fda1cd36c7e508df8cf484a156ec28f6509fce6fa72b7406770e55d8302c5b33&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-no-handler-2.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-no-handler-2.png&quot;,
      &quot;sha256&quot;: &quot;a1b6a2d054d8d1cced594bb0b8775fc499163443c01cfb8255b9d7c2dfb5217f&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-no-handler-3.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-no-handler-3.png&quot;,
      &quot;sha256&quot;: &quot;d74addeba4afe69c012c3039684a426350c55b9712a9e17f306a77aab25f7558&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-no-account-read-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-no-account-read-1.png&quot;,
      &quot;sha256&quot;: &quot;43c8c500b95bc3bce96a97de447fd24d748b73202cbd9e7c833a3211c4593c78&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-no-account-read-3.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-no-account-read-3.png&quot;,
      &quot;sha256&quot;: &quot;5b3152944003a2532c1ec3498c3efaeadd256c18ab8372cc89bc38878c86bbed&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-long-0.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-long-0.png&quot;,
      &quot;sha256&quot;: &quot;6f1100c52bb0bd32a89c690829ce00df50f557ad9533a8fcfc096f1a21a45fbc&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-long-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-long-1.png&quot;,
      &quot;sha256&quot;: &quot;e512fe1acabbf028b9aeefa4bb500a591b20bb43ab26cf86b6e3dc2484eead3d&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-long-2.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-long-2.png&quot;,
      &quot;sha256&quot;: &quot;76efcee12e8f03d3a62e6d6bba8ae564d35ad25c1f9480f8e630468f412761db&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-0.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-0.png&quot;,
      &quot;sha256&quot;: &quot;c2e3366dd6822e95b1c1ec13db0bb7de0c7d7c0a68ccf76b14f83512c5b9a9e2&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-1.png&quot;,
      &quot;sha256&quot;: &quot;c33dab4cd4475678c93dec98d927083271063298142af11e0700f63d40de7cef&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-2.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-2.png&quot;,
      &quot;sha256&quot;: &quot;07d90088e1709c00a39cc083caac83a71acae4d6a8e24047c74bc4377b7bce21&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-3.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-3.png&quot;,
      &quot;sha256&quot;: &quot;f9f71dae050319e1a1ef43bd89074d0b8b74525edf39594fb78ec28391cacf5b&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-4.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-4.png&quot;,
      &quot;sha256&quot;: &quot;e99f6adeba44d6825f8c62c1e21d54243878f6334380f4be2d88105be1e80328&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-5.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-5.png&quot;,
      &quot;sha256&quot;: &quot;f43df6121e325c6cb7fb827d9942079c423f7c181b5abf9757478387db254f11&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-6.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-6.png&quot;,
      &quot;sha256&quot;: &quot;3f08f2976146902987d79dd19683ba864f21b3dbb27a1c95eb7ed0c464f9690f&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-7.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-7.png&quot;,
      &quot;sha256&quot;: &quot;60c9cd2206c51f999f22944b9fa631789b4aa840fad9a688be71a6d9f98d536a&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-8.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-8.png&quot;,
      &quot;sha256&quot;: &quot;a3a2c97ec3228a5f5b1e2f6a2f8ebd1b15e2d582a507ae07d9250705587ab6f2&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-9.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-9.png&quot;,
      &quot;sha256&quot;: &quot;25cb2ac7bebf260772cdb7fb80d330b6cded1263e9dee6687543b5a282575cd3&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-10.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-10.png&quot;,
      &quot;sha256&quot;: &quot;dfb652798bf56dc3c0af3e3834cbae62774cfdd3701ba25c2a7a5a7c93b5c3d4&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-11.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-11.png&quot;,
      &quot;sha256&quot;: &quot;397b5a812235cfe37eb091ab6932115e1883201538339536af678434c7e5b5de&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-12.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-12.png&quot;,
      &quot;sha256&quot;: &quot;e14b7cee83d2c5b2552ee56671883fb61fd84a70e730e6cd90ac39554df70afa&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-13.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-13.png&quot;,
      &quot;sha256&quot;: &quot;756cf9c005b232abf21e0694e6e8a5e29df08d916094e76c53c5ba1b2254f193&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-14.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-14.png&quot;,
      &quot;sha256&quot;: &quot;bf31f218d6a96b2866f7aaa9c7f29b558d24519f18db6432146d39e9d40cf31d&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-15.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-15.png&quot;,
      &quot;sha256&quot;: &quot;a00c7791afb985098e3594a1a85b4802e13de72a9b86c5cce5e3ddd7992e5456&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-16.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-16.png&quot;,
      &quot;sha256&quot;: &quot;fd635f1208a41cf96ca715e818c74fb0616c80c7d74eb12ea6991dd746f17eab&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-17.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-17.png&quot;,
      &quot;sha256&quot;: &quot;41b3cd12574f19b7f59f18147ae3e6e5b4c0c9fb1f6887a7a92eaf31f39a68a5&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-18.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-18.png&quot;,
      &quot;sha256&quot;: &quot;98335f7ee4ca1d4eb01cd4dc46bbb2368e3f7ce451f2b28d1b30bf03cf5e584a&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-19.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-19.png&quot;,
      &quot;sha256&quot;: &quot;a565bcfe91cc7d2dc3b88708b8546dd2de2e62fb21fd899109c68eb18c88b68d&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-20.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-20.png&quot;,
      &quot;sha256&quot;: &quot;fe5e87aedbeb55febed33abe617740c1ab68afdb4616552282ef1b0b55b9cd81&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-21.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-correction-21.png&quot;,
      &quot;sha256&quot;: &quot;3e4bdd98a677bcbb66503c554984a358724afb09661127757992c80ae81de115&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-0.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-0.png&quot;,
      &quot;sha256&quot;: &quot;7810abfa526b6b52bfef245bbf018bab2bb72e070b6ee634a153ff4ae3871c53&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-1.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-1.png&quot;,
      &quot;sha256&quot;: &quot;49265f82911b4d4f4c0210ac7c6d02fbbe61e7a8dd54392e01c07b90b24a834f&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-2.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-2.png&quot;,
      &quot;sha256&quot;: &quot;b1b531736c99e8fef1a08370aeee150fc749d49fe7ece7618aa7e62a18e34bc6&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-3.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-3.png&quot;,
      &quot;sha256&quot;: &quot;754b68c85fb19f92a68cee7b427c1925c18e02dca09bf66daff6afb5fcd673e4&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-4.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-4.png&quot;,
      &quot;sha256&quot;: &quot;181e44ee2b4fc3e06e2b3e82718ad73ff4c0519f0c8763fbf7dd7f5ecead06d6&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-5.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-5.png&quot;,
      &quot;sha256&quot;: &quot;c0118fdf2a3661dc23dde795b7dc301af8947a343e43957fbf14b565850f9cae&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-6.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-6.png&quot;,
      &quot;sha256&quot;: &quot;978f5e8960e2def8f72c0a66f1376bde2e2eacb8e8f721038bad5b35db8f3055&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-7.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-7.png&quot;,
      &quot;sha256&quot;: &quot;8316a6f0d180fcb84cb29b9b38c2c0e2a920614ad2eaa55c43068005812f46c4&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-8.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-8.png&quot;,
      &quot;sha256&quot;: &quot;68eb04c1516ec73826e7ac33cc275de5012cc7292b010256cb43647afa4988bd&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-9.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-9.png&quot;,
      &quot;sha256&quot;: &quot;94df99549df44a1c391e4dd0641e349d4269403a36274a9551074d8b31965940&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-10.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-10.png&quot;,
      &quot;sha256&quot;: &quot;794f082fd855b860dedf6b6e5531e52e663e99138e8b6b5695ec183326f8a9d7&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-11.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-11.png&quot;,
      &quot;sha256&quot;: &quot;7e1861b342754001aa5a44726e9809d0a2e170f89d56d7f3a5b81069962c687b&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-12.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-12.png&quot;,
      &quot;sha256&quot;: &quot;00c928c20cec1429e7cb5e0aa0a43b1163dd29f6fa23739f230e1136fec5e869&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-13.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-13.png&quot;,
      &quot;sha256&quot;: &quot;a7d41a3d115a77b5d02e4176142497eafe7addab3dbc2b6cffeec075603022a5&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-14.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-14.png&quot;,
      &quot;sha256&quot;: &quot;c29aa15664f7d45fc96fbe2b3e076e1eea3334dfc71d51b5fe89a415fd1476d0&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-15.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-15.png&quot;,
      &quot;sha256&quot;: &quot;98bd5b0ba060f0b3cb4cb0fbf54248f5fc8825f593a800a68bf438f728a2f02f&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-16.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-16.png&quot;,
      &quot;sha256&quot;: &quot;4b2bf6218a0675b58494c88f13e5acee19b7004df3f40c2fcb0b15f935b2b5af&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-17.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-17.png&quot;,
      &quot;sha256&quot;: &quot;44fa893e3b91b995a2d1cf8ac82e878d6643f6a57c50f43ee90068fc21aced56&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-18.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-18.png&quot;,
      &quot;sha256&quot;: &quot;29e284148d28dcbcb2e2a1b64faccb3e164130533cf6fe01a4f999e8fba95022&quot;,
      &quot;fullByteEqual&quot;: true
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-19.png&quot;,
      &quot;priorActuallyOpenedOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r2\\native-r2-large-replacement-19.png&quot;,
      &quot;sha256&quot;: &quot;df67173d216104dd5953aa45141083767db065b2ccab6b4e082d7f8efb08f251&quot;,
      &quot;fullByteEqual&quot;: true
    }
  ],
  &quot;priorRootReceipt&quot;: &quot;root-native-r2-read.json; Root actually opened all80 originals&quot;,
  &quot;sourceDigests&quot;: {
    &quot;modules/e01-app/internal/shell/lib/replacement_right.dart&quot;: &quot;cfda3b926e0e493814fa849f7cb913ae12e670075483fb79c7e0a00d677f8744&quot;,
    &quot;modules/e01-app/internal/shell/test/replacement_right_test.dart&quot;: &quot;817923a2bd55a21e96fe9f2923b46e06a9a833b4ed0720bd3651511e7b2b3c52&quot;,
    &quot;modules/e01-app/internal/shell/test/fixtures/replacement_right_reading_questions.json&quot;: &quot;c9aa588599797fbdcd114f14f932abf3d7263be0e298ab938968092b39d471c0&quot;
  },
  &quot;visualResult&quot;: &quot;Q17 error now explicitly blocks new selection request and distinguishes read refresh; Q18 unreadable card explicitly excludes another account/motorcycle/guide decision. This is root visual check, not independent finding closure.&quot;,
  &quot;productionDeviceHumanScreenreaderProof&quot;: false
}</pre>

|Durum|Kare/ölçek|Offset/son|Bayt|SHA256|RAW dosya|Tam alias|
|---|---|---|---|---|---|---|
|correction|0/1.0|0.0/1383.0|73791|d31f475f40e37d7d1172849290f851cc5fb7e3d70c2879b153765ab766cd31a2|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-correction-0.png|None|
|correction|1/1.0|600.0/1383.0|81548|cd6552b1d4ca76d46a1d9a5ae0a9b79c4c1ef9aceac7505019ad9b73e697b6f8|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-correction-1.png|None|
|correction|2/1.0|1200.0/1383.0|81959|810c843888e2e3b3ec17ecc656e2bf433ef793f40c2f514c6d53fdaba06db6d4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-correction-2.png|None|
|correction|3/1.0|1383.0/1383.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-correction-3.png|None|
|replacement|0/1.0|0.0/1337.0|72656|19513ac0fe7508262df117eb918c7f179feb5acad43a20c3719cbb43342317c5|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-replacement-0.png|None|
|replacement|1/1.0|600.0/1337.0|83811|218ceb5aa77359f8e7510e837f21dcb113839ac070efa3e451039015850d2485|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-replacement-1.png|None|
|replacement|2/1.0|1200.0/1337.0|77494|2593fafd2a7693703bd2d14569d76fba78d6c70a65eabd30fb638e231ae3174f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-replacement-2.png|None|
|replacement|3/1.0|1337.0/1337.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-replacement-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|started|0/1.0|0.0/1406.0|73771|614b3dad8a6eaa33f80b995576f124c4e71ed87e2a354d2c040e5d424c4ffc47|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-started-0.png|None|
|started|1/1.0|600.0/1406.0|82454|a7345075bd3084606e9b87797fc41a3cf8d3c4535ca095155c050d6e3db17851|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-started-1.png|None|
|started|2/1.0|1200.0/1406.0|79816|e0b458fa6b73b3e02791bddb104a4c3ec19cb3ca66bacd17b3e343ca2142da3b|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-started-2.png|None|
|started|3/1.0|1406.0/1406.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-started-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|unknown-start|0/1.0|0.0/1406.0|73303|7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-unknown-start-0.png|None|
|unknown-start|1/1.0|600.0/1406.0|80856|e0449f60f57100c30cd8afc3bdc92d7bfdcfaf005eb106573db64b57748cb27e|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-unknown-start-1.png|None|
|unknown-start|2/1.0|1200.0/1406.0|79816|e0b458fa6b73b3e02791bddb104a4c3ec19cb3ca66bacd17b3e343ca2142da3b|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-unknown-start-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-started-2.png|
|unknown-start|3/1.0|1406.0/1406.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-unknown-start-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|renew-started|0/1.0|0.0/1360.0|72685|9521ef4a2b65815c47040c8f3f9e56c07baf0edbd8421b3060ef195b8c4b1aa4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-renew-started-0.png|None|
|renew-started|1/1.0|600.0/1360.0|84066|f27d8ed010da01aa5415fc2b5b99028b34705ad3f6a72aa8093c7deb31349917|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-renew-started-1.png|None|
|renew-started|2/1.0|1200.0/1360.0|80133|2e39624a246d8203102ec3ecdc764de3dea48811559902173992cd1b78862cb7|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-renew-started-2.png|None|
|renew-started|3/1.0|1360.0/1360.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-renew-started-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|user-fault|0/1.0|0.0/1337.0|72184|c3b260f369f61fec99679fac89c09a618ebad9177c1bd4ecebdedd172a62e6d3|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-user-fault-0.png|None|
|user-fault|1/1.0|600.0/1337.0|83673|4d22265298f0a091e535991d06af8866561ba418fa52e943471a49213da0f359|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-user-fault-1.png|None|
|user-fault|2/1.0|1200.0/1337.0|77494|2593fafd2a7693703bd2d14569d76fba78d6c70a65eabd30fb638e231ae3174f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-user-fault-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-replacement-2.png|
|user-fault|3/1.0|1337.0/1337.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-user-fault-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|held|0/1.0|0.0/1383.0|73303|7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-held-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-unknown-start-0.png|
|held|1/1.0|600.0/1383.0|81460|5d8acf63d3f4e2931cfa713f558d65c5f9498fcbe0d8ddb9c4b43cd97721da76|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-held-1.png|None|
|held|2/1.0|1200.0/1383.0|81959|810c843888e2e3b3ec17ecc656e2bf433ef793f40c2f514c6d53fdaba06db6d4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-held-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-2.png|
|held|3/1.0|1383.0/1383.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-held-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|denied|0/1.0|0.0/1383.0|72832|f4ef3af0f1993dd023ae7126aa2a960c76a20ad6514c92431341b9e03b429166|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-denied-0.png|None|
|denied|1/1.0|600.0/1383.0|81460|5d8acf63d3f4e2931cfa713f558d65c5f9498fcbe0d8ddb9c4b43cd97721da76|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-denied-1.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-held-1.png|
|denied|2/1.0|1200.0/1383.0|81959|810c843888e2e3b3ec17ecc656e2bf433ef793f40c2f514c6d53fdaba06db6d4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-denied-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-2.png|
|denied|3/1.0|1383.0/1383.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-denied-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|missing|0/1.0|0.0/1077.0|80324|5113db997f5c7a1c8536fece56a9929cb57b1a75bfb0e243e5a0074bac09d228|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-missing-0.png|None|
|missing|1/1.0|600.0/1077.0|74951|bd72436bf872510a9b094b1d3f50f2163683a4cd72d3f032bda27173c004b9d2|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-missing-1.png|None|
|missing|2/1.0|1077.0/1077.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-missing-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|no-read|0/1.0|0.0/1077.0|80324|5113db997f5c7a1c8536fece56a9929cb57b1a75bfb0e243e5a0074bac09d228|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-read-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-missing-0.png|
|no-read|1/1.0|600.0/1077.0|74951|bd72436bf872510a9b094b1d3f50f2163683a4cd72d3f032bda27173c004b9d2|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-read-1.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-missing-1.png|
|no-read|2/1.0|1077.0/1077.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-read-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|foreign|0/1.0|0.0/1077.0|80324|5113db997f5c7a1c8536fece56a9929cb57b1a75bfb0e243e5a0074bac09d228|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-foreign-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-missing-0.png|
|foreign|1/1.0|600.0/1077.0|74951|bd72436bf872510a9b094b1d3f50f2163683a4cd72d3f032bda27173c004b9d2|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-foreign-1.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-missing-1.png|
|foreign|2/1.0|1077.0/1077.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-foreign-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|stale|0/1.0|0.0/1077.0|80324|5113db997f5c7a1c8536fece56a9929cb57b1a75bfb0e243e5a0074bac09d228|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-stale-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-missing-0.png|
|stale|1/1.0|600.0/1077.0|74951|bd72436bf872510a9b094b1d3f50f2163683a4cd72d3f032bda27173c004b9d2|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-stale-1.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-missing-1.png|
|stale|2/1.0|1077.0/1077.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-stale-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|offline|0/1.0|0.0/1441.0|74868|74b9984ef14fec1524510513b156b244dad8eae37aef4a41623811de28c521e3|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-offline-0.png|None|
|offline|1/1.0|600.0/1441.0|80019|7071c668d3dfeece8e09b8e2a22ecbe91b6deeb9e13406f15045e4407676954e|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-offline-1.png|None|
|offline|2/1.0|1200.0/1441.0|78542|467f6e9094f9557a775a7abc1a0a358d6c656440c62a42f3e1fca264a33e7c1d|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-offline-2.png|None|
|offline|3/1.0|1441.0/1441.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-offline-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|busy|0/1.0|0.0/1418.0|72726|6f906e993160db4b371195278d2c20c793ce9c8f385467725b0e2d8684a05a69|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-busy-0.png|None|
|busy|1/1.0|600.0/1418.0|81774|ae37168f661365395ca6564ba078bafdb21ff276754b3bd579fff5d258d64506|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-busy-1.png|None|
|busy|2/1.0|1200.0/1418.0|79259|ffa336c2579e876111ad96b6b4bc1129c884484d76bb91e71847bc9bdaa5ace5|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-busy-2.png|None|
|busy|3/1.0|1418.0/1418.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-busy-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|error|0/1.0|0.0/1464.0|73303|7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-error-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-unknown-start-0.png|
|error|1/1.0|600.0/1464.0|81590|8380e93e14f2bd58a0f936bc8178737155d10fd8ff7af6f3b6d189d474722448|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-error-1.png|None|
|error|2/1.0|1200.0/1464.0|79177|355e848118b729972caebbdc14da4613ee9166f6db5770aa6226441e0f42bf0c|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-error-2.png|None|
|error|3/1.0|1464.0/1464.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-error-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|received|0/1.0|0.0/1441.0|73303|7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-received-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-unknown-start-0.png|
|received|1/1.0|600.0/1441.0|80598|5499538f52593e81f3693799978fbb348c120e3251e14eeeeee3ee4f56bc6fff|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-received-1.png|None|
|received|2/1.0|1200.0/1441.0|78542|467f6e9094f9557a775a7abc1a0a358d6c656440c62a42f3e1fca264a33e7c1d|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-received-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-offline-2.png|
|received|3/1.0|1441.0/1441.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-received-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|no-handler|0/1.0|0.0/1383.0|73848|864d5b8656b6060e61c82bc5be4d269a89a6e0fdbd5f4a0ce3c9dd060335e229|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-handler-0.png|None|
|no-handler|1/1.0|600.0/1383.0|81431|fda1cd36c7e508df8cf484a156ec28f6509fce6fa72b7406770e55d8302c5b33|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-handler-1.png|None|
|no-handler|2/1.0|1200.0/1383.0|81901|a1b6a2d054d8d1cced594bb0b8775fc499163443c01cfb8255b9d7c2dfb5217f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-handler-2.png|None|
|no-handler|3/1.0|1383.0/1383.0|68741|d74addeba4afe69c012c3039684a426350c55b9712a9e17f306a77aab25f7558|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-handler-3.png|None|
|no-intent|0/1.0|0.0/1383.0|73303|7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-intent-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-unknown-start-0.png|
|no-intent|1/1.0|600.0/1383.0|81460|5d8acf63d3f4e2931cfa713f558d65c5f9498fcbe0d8ddb9c4b43cd97721da76|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-intent-1.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-held-1.png|
|no-intent|2/1.0|1200.0/1383.0|81959|810c843888e2e3b3ec17ecc656e2bf433ef793f40c2f514c6d53fdaba06db6d4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-intent-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-2.png|
|no-intent|3/1.0|1383.0/1383.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-intent-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|no-account-read|0/1.0|0.0/1383.0|73791|d31f475f40e37d7d1172849290f851cc5fb7e3d70c2879b153765ab766cd31a2|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-account-read-0.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-0.png|
|no-account-read|1/1.0|600.0/1383.0|81546|43c8c500b95bc3bce96a97de447fd24d748b73202cbd9e7c833a3211c4593c78|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-account-read-1.png|None|
|no-account-read|2/1.0|1200.0/1383.0|81901|a1b6a2d054d8d1cced594bb0b8775fc499163443c01cfb8255b9d7c2dfb5217f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-account-read-2.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-no-handler-2.png|
|no-account-read|3/1.0|1383.0/1383.0|68814|5b3152944003a2532c1ec3498c3efaeadd256c18ab8372cc89bc38878c86bbed|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-no-account-read-3.png|None|
|long|0/1.0|0.0/1613.0|79005|6f1100c52bb0bd32a89c690829ce00df50f557ad9533a8fcfc096f1a21a45fbc|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-long-0.png|None|
|long|1/1.0|600.0/1613.0|76995|e512fe1acabbf028b9aeefa4bb500a591b20bb43ab26cf86b6e3dc2484eead3d|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-long-1.png|None|
|long|2/1.0|1200.0/1613.0|79172|76efcee12e8f03d3a62e6d6bba8ae564d35ad25c1f9480f8e630468f412761db|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-long-2.png|None|
|long|3/1.0|1613.0/1613.0|68877|75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-long-3.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-correction-3.png|
|large-correction|0/3.0|0.0/12352.0|31123|c2e3366dd6822e95b1c1ec13db0bb7de0c7d7c0a68ccf76b14f83512c5b9a9e2|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-0.png|None|
|large-correction|1/3.0|600.0/12352.0|43921|c33dab4cd4475678c93dec98d927083271063298142af11e0700f63d40de7cef|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-1.png|None|
|large-correction|2/3.0|1200.0/12352.0|46201|07d90088e1709c00a39cc083caac83a71acae4d6a8e24047c74bc4377b7bce21|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-2.png|None|
|large-correction|3/3.0|1800.0/12352.0|39247|f9f71dae050319e1a1ef43bd89074d0b8b74525edf39594fb78ec28391cacf5b|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-3.png|None|
|large-correction|4/3.0|2400.0/12352.0|42137|e99f6adeba44d6825f8c62c1e21d54243878f6334380f4be2d88105be1e80328|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-4.png|None|
|large-correction|5/3.0|3000.0/12352.0|37233|f43df6121e325c6cb7fb827d9942079c423f7c181b5abf9757478387db254f11|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-5.png|None|
|large-correction|6/3.0|3600.0/12352.0|35616|3f08f2976146902987d79dd19683ba864f21b3dbb27a1c95eb7ed0c464f9690f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-6.png|None|
|large-correction|7/3.0|4200.0/12352.0|42004|60c9cd2206c51f999f22944b9fa631789b4aa840fad9a688be71a6d9f98d536a|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-7.png|None|
|large-correction|8/3.0|4800.0/12352.0|46666|a3a2c97ec3228a5f5b1e2f6a2f8ebd1b15e2d582a507ae07d9250705587ab6f2|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-8.png|None|
|large-correction|9/3.0|5400.0/12352.0|49860|25cb2ac7bebf260772cdb7fb80d330b6cded1263e9dee6687543b5a282575cd3|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-9.png|None|
|large-correction|10/3.0|6000.0/12352.0|50804|dfb652798bf56dc3c0af3e3834cbae62774cfdd3701ba25c2a7a5a7c93b5c3d4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-10.png|None|
|large-correction|11/3.0|6600.0/12352.0|42987|397b5a812235cfe37eb091ab6932115e1883201538339536af678434c7e5b5de|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-11.png|None|
|large-correction|12/3.0|7200.0/12352.0|43489|e14b7cee83d2c5b2552ee56671883fb61fd84a70e730e6cd90ac39554df70afa|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-12.png|None|
|large-correction|13/3.0|7800.0/12352.0|43859|756cf9c005b232abf21e0694e6e8a5e29df08d916094e76c53c5ba1b2254f193|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-13.png|None|
|large-correction|14/3.0|8400.0/12352.0|43010|bf31f218d6a96b2866f7aaa9c7f29b558d24519f18db6432146d39e9d40cf31d|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-14.png|None|
|large-correction|15/3.0|9000.0/12352.0|47102|a00c7791afb985098e3594a1a85b4802e13de72a9b86c5cce5e3ddd7992e5456|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-15.png|None|
|large-correction|16/3.0|9600.0/12352.0|50737|fd635f1208a41cf96ca715e818c74fb0616c80c7d74eb12ea6991dd746f17eab|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-16.png|None|
|large-correction|17/3.0|10200.0/12352.0|43747|41b3cd12574f19b7f59f18147ae3e6e5b4c0c9fb1f6887a7a92eaf31f39a68a5|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-17.png|None|
|large-correction|18/3.0|10800.0/12352.0|46116|98335f7ee4ca1d4eb01cd4dc46bbb2368e3f7ce451f2b28d1b30bf03cf5e584a|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-18.png|None|
|large-correction|19/3.0|11400.0/12352.0|52566|a565bcfe91cc7d2dc3b88708b8546dd2de2e62fb21fd899109c68eb18c88b68d|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-19.png|None|
|large-correction|20/3.0|12000.0/12352.0|49321|fe5e87aedbeb55febed33abe617740c1ab68afdb4616552282ef1b0b55b9cd81|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-20.png|None|
|large-correction|21/3.0|12352.0/12352.0|49938|3e4bdd98a677bcbb66503c554984a358724afb09661127757992c80ae81de115|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-correction-21.png|None|
|large-replacement|0/3.0|0.0/11935.0|42917|7810abfa526b6b52bfef245bbf018bab2bb72e070b6ee634a153ff4ae3871c53|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-0.png|None|
|large-replacement|1/3.0|600.0/11935.0|48074|49265f82911b4d4f4c0210ac7c6d02fbbe61e7a8dd54392e01c07b90b24a834f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-1.png|None|
|large-replacement|2/3.0|1200.0/11935.0|40336|b1b531736c99e8fef1a08370aeee150fc749d49fe7ece7618aa7e62a18e34bc6|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-2.png|None|
|large-replacement|3/3.0|1800.0/11935.0|40240|754b68c85fb19f92a68cee7b427c1925c18e02dca09bf66daff6afb5fcd673e4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-3.png|None|
|large-replacement|4/3.0|2400.0/11935.0|36482|181e44ee2b4fc3e06e2b3e82718ad73ff4c0519f0c8763fbf7dd7f5ecead06d6|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-4.png|None|
|large-replacement|5/3.0|3000.0/11935.0|34064|c0118fdf2a3661dc23dde795b7dc301af8947a343e43957fbf14b565850f9cae|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-5.png|None|
|large-replacement|6/3.0|3600.0/11935.0|41254|978f5e8960e2def8f72c0a66f1376bde2e2eacb8e8f721038bad5b35db8f3055|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-6.png|None|
|large-replacement|7/3.0|4200.0/11935.0|45581|8316a6f0d180fcb84cb29b9b38c2c0e2a920614ad2eaa55c43068005812f46c4|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-7.png|None|
|large-replacement|8/3.0|4800.0/11935.0|43445|68eb04c1516ec73826e7ac33cc275de5012cc7292b010256cb43647afa4988bd|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-8.png|None|
|large-replacement|9/3.0|5400.0/11935.0|48570|94df99549df44a1c391e4dd0641e349d4269403a36274a9551074d8b31965940|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-9.png|None|
|large-replacement|10/3.0|6000.0/11935.0|40023|794f082fd855b860dedf6b6e5531e52e663e99138e8b6b5695ec183326f8a9d7|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-10.png|None|
|large-replacement|11/3.0|6600.0/11935.0|44037|7e1861b342754001aa5a44726e9809d0a2e170f89d56d7f3a5b81069962c687b|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-11.png|None|
|large-replacement|12/3.0|7200.0/11935.0|45629|00c928c20cec1429e7cb5e0aa0a43b1163dd29f6fa23739f230e1136fec5e869|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-12.png|None|
|large-replacement|13/3.0|7800.0/11935.0|45006|a7d41a3d115a77b5d02e4176142497eafe7addab3dbc2b6cffeec075603022a5|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-13.png|None|
|large-replacement|14/3.0|8400.0/11935.0|44847|c29aa15664f7d45fc96fbe2b3e076e1eea3334dfc71d51b5fe89a415fd1476d0|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-14.png|None|
|large-replacement|15/3.0|9000.0/11935.0|50633|98bd5b0ba060f0b3cb4cb0fbf54248f5fc8825f593a800a68bf438f728a2f02f|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-15.png|None|
|large-replacement|16/3.0|9600.0/11935.0|47482|4b2bf6218a0675b58494c88f13e5acee19b7004df3f40c2fcb0b15f935b2b5af|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-16.png|None|
|large-replacement|17/3.0|10200.0/11935.0|43309|44fa893e3b91b995a2d1cf8ac82e878d6643f6a57c50f43ee90068fc21aced56|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-17.png|None|
|large-replacement|18/3.0|10800.0/11935.0|52796|29e284148d28dcbcb2e2a1b64faccb3e164130533cf6fe01a4f999e8fba95022|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-18.png|None|
|large-replacement|19/3.0|11400.0/11935.0|51192|df67173d216104dd5953aa45141083767db065b2ccab6b4e082d7f8efb08f251|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-19.png|None|
|large-replacement|20/3.0|11935.0/11935.0|49938|3e4bdd98a677bcbb66503c554984a358724afb09661127757992c80ae81de115|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3/native-r3-large-replacement-20.png|C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\native-r3-large-correction-21.png|

## Dar onarımın güncel kayıt kontrolü

GraphR3 12kontrol/42testPASS,worst0; RAW 7960bayt/SHA256 84eb94a2e2ed6820d9902cbb741b3708458d33b1bcb635317d6799708c7683bc. 393ID/503Markdown/123kanıt/index116; CHECKER değişmedi. R1 körRET ile mevcut CHANGES_REQUESTED, taze körR2 beklenir; önceki bağımsız hüküm değiştirilmedi.

## Kör R2 bulgusu ve kod öncesi dar açıklama onarımı

CODE 74dbc53a8a25484afc5686be3f47321a7338c054 için bağımsız /root/e1025_blind_r2 raporu ve eki tamamlandıktan sonra Root özgün raporların tamamını okudu ve bayt/SHA doğruladı. Q1/Q6 örnek arayüz okunabilirliği kapsamında PASS; Q11 BELİRSİZ: etkin kontrol isteğinin seçim hakkı vermediği ve seçimi değiştirmediği eylem öncesinde açık değil. Önceki R1 ve R2 hükümleri aynen korunur; görev CHANGES_REQUESTED kalır.

Kod öncesi dar kapsam: aynı izinli kaynakta ana istek düğmesinden önce yalnız değerlendirme talebi olduğu, hak vermediği ve seçimi değiştirmediği açık yazılacak. Eski kayıt yollarının izni ana seçim değerlendirmesinden ayrı olduğundan kayıt okuma izni doğrulanmadığında bu yolların neden kapalı olduğu ayrıca belirtilecek. Model/guard/sunucu yetkisi/politika değişmeyecek. Aynı izinli testte eylem öncesi açıklamalar ve ayrı kapılar sınanacak; sabit20 soru değişmeyecek. Yeni doğal R4 görüntüleri ve anlamlı yerel testler, taze bağımsız kör okuma, bütün SOURCE ve CI/T3/FINAL/main kapıları gerekecek. Üretim ve gerçek 112/94/206 sayımı değişmez.

first-reading-r2.txt 7263 bayt; SHA256 74edc346f03b5d523dd599ccf756834f2fa17ce3225c52602cc36a521bda4430

<pre># E1025 native-r3 — bağımsız kör ilk arayüz okuması (R2)

## Kapsam ve doğrulama

- Beyan edilen kapsam: CODE 74dbc53a8a25484afc5686be3f47321a7338c054. Bu kör görevde Git doğrulaması yapılmadı.
- Sabit soru fixture&#x27;ı 20 soru içeriyor; SHA-256: c9aa588599797fbdcd114f14f932abf3d7263be0e298ab938968092b39d471c0 (beklenenle aynı).
- Manifest 22 durum ve 119 çerçeve listeliyor. Yalnız manifestteki PNG yolları okundu: tüm 119 dosyanın bayt uzunluğu, SHA-256&#x27;sı, PNG imzası ve IHDR boyutları denetlendi. Her dosya manifest bayt ve boyut metaverisiyle eşleşti; tümü 390×844.
- 119 çerçeve 81 farklı SHA-256&#x27;ya ayrılıyor: 81 özgün görüntü ve 38 yinelenen takma ad. Aynı SHA grubundaki dosyaların tam bayt dizileri eşit çıktı (12 takma ad grubu; bayt eşitliği uyuşmazlığı yok).
- 22 durumun her çerçeve dizisi 0 kaydırmadan başlıyor ve bildirilen maxScrollExtent&#x27;te bitiyor; kaydırmalar artan sırada. Ardışık kaydırma aralıkları 844 pikselden kısa olduğu için kareler örtüşüyor; 3× metin ölçeğinde adım 600 piksel, örtüşme en az 244 piksel. Her 81 özgün PNG, view_image ile original ayrıntısında açıldı.
- İzin verilen girdiler arasında belirtilen native-r3-proof.json ve unique-images-native-r3.json, verilen tam konumlarında bulunamadı. Özgün/takma ad sayısı manifestteki gerçek PNG&#x27;lerden bağımsız olarak türetildi. Bu iki dosya için içerik doğrulaması yapılamadı.
- İstenen model bağlamı: gpt-6-luna/max. Bağımsız çalıştırma/model attestation&#x27;ı: unavailable.

## 20 sabit soruya görsel yanıt

Dosya marker&#x27;ları aşağıdaki C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3\ dizinindeki gerçek PNG adlarıdır. “BELİRSİZ” üretim durumu hakkında görüntülerin kanıt sağlamadığı anlamına gelir; örnek metin gerçek seçim/karar olarak okunmamıştır.

| # | Sonuç | Görsel bulgu ve gerçek dosya marker&#x27;ı |
|---:|---|---|
| 1 | BELİRSİZ | Motosiklet, rehber ve sürüm alanları Örnek ... olarak işaretlenmiş; kart ayrıca gerçek/üretim kararı olmadığını söylüyor. guide-v1 ve sel-r1 örnek değerleri görünür, fakat gerçek seçili motosiklet/rehber/sürüm bu görüntülerde yok. native-r3-correction-0.png, native-r3-replacement-0.png. |
| 2 | PASS | “Yanlış rehber seçimini düzeltme” ile “Yeniden rehber seçimi” başlıkları ve ilgili farklı kontrol isteği düğmeleri ayrılıyor. native-r3-correction-1.png, native-r3-replacement-1.png. |
| 3 | PASS | Yanlış seçimin ilk fiziksel adımdan önce düzeltilebileceği yazıyor. native-r3-correction-1.png. |
| 4 | PASS | Başlangıç durumu bilinmiyorsa veya işe başlanmışsa düzeltmenin açılmadığı belirtiliyor; belirsiz başlangıçta doğrulanmadığı açıkça yazıyor. native-r3-unknown-start-1.png, native-r3-started-1.png. |
| 5 | PASS | Rehber kullanıcının hatası olmadan geri çekildiğinde hakkın sunucu kararına göre açılabileceği ve kendiliğinden yenilenmediği yazıyor. native-r3-replacement-1.png. |
| 6 | BELİRSİZ | Kaynak, karar sürümü, kaynak konumu ve kontrol zamanı kartta var; hepsi örnek olarak etiketlenmiş ve üretime bağlı olmadığı söylenmiş. Gerçek güncel kaynak/zaman görüntüden doğrulanamıyor. native-r3-correction-0.png. |
| 7 | PASS | İstek alındı durumunda hakkın verildiğinin veya seçimin değiştiğinin henüz doğrulanmadığı açık. native-r3-received-1.png. |
| 8 | PASS | Motosiklet değiştirmek veya rehberi tamamlamak yeni ücretsiz seçim hakkı üretmez deniyor. native-r3-correction-1.png. |
| 9 | PASS | Tam rehber hakkının aynı anda tek seçili motosiklette açıldığı; motosiklet değişince taşındığı ve üst üste eklenmediği yazıyor. native-r3-correction-1.png. |
| 10 | PASS | Kesin süre, seçim sıklığı ve ücret koşullarının burada belirlenmediği açıkça belirtiliyor. native-r3-correction-1.png. |
| 11 | BELİRSİZ | Doğrulanamayan seçim bilgisi ekranında özel ayrıntılar saklı ve düzeltme isteği kapalı; çevrimdışı durumda yeni seçim isteği kapalı ve iki ana işlem de devre dışı görünüyor. Bununla birlikte native-r3-no-account-read-1.png içinde düzeltme kontrol isteği düğmesi etkin. Bu karede izin eksikliği metinsel olarak görünmediğinden bunun istek/izin farkı mı yoksa çelişki mi olduğu yalnız görüntüden çözülemiyor. Marker&#x27;lar: native-r3-missing-0.png, native-r3-offline-0.png, native-r3-offline-1.png, native-r3-no-account-read-1.png. |
| 12 | PASS | Doğrulanamayan durumda özel motosiklet ve rehber ayrıntılarının gösterilmediği; güncel kimlik ve okuma izni gerektiği yazıyor. Görünen değerler örnek olarak etiketli. native-r3-missing-0.png. |
| 13 | PASS | Eski işlem kaydı, kullanılan rehber sürümü ve güvenlik düzeltmelerinin yeni seçimle silinmediği belirtiliyor. native-r3-correction-2.png. |
| 14 | PASS | Geçmiş, kanıt/kaynak, düzeltme/itiraz ve dışa aktarma yolları görünür; satın almaya bağlı olmadıkları yazıyor. native-r3-correction-2.png. |
| 15 | PASS | Kritik güvenlik bilgisi ile başlanmış işin güvenli dönüşü ayrı yollar; metin bunların işi sürdürme izni veya güvenli sonuç kaydı olmadığını belirtiyor. native-r3-correction-2.png. |
| 16 | PASS | Rehber hakkının bakımın doğru veya motosikletin sürüşe güvenli olduğunu kanıtlamadığı; fiziksel uygunluğun ayrıca değerlendirileceği yazıyor. native-r3-correction-3.png. |
| 17 | PASS | Kontrol sürerken yeni istek gönderilmediği yazıyor ve ana düğmeler devre dışı. Hata durumunda yeni seçim talebi gönderilmediği belirtiliyor; işleyici yokken tüm işlem ve kayıt yolları devre dışı. native-r3-busy-1.png, native-r3-error-1.png, native-r3-no-handler-1.png, native-r3-no-handler-3.png. |
| 18 | PASS | Doğrulanamayan seçim kartı başka hesap, motosiklet veya rehber kararının bu seçimde kullanılamayacağını söylüyor. native-r3-missing-0.png. |
| 19 | PASS | 3× metinde ekran dışına taşan parçalar sonraki örtüşen kaydırma karesinde devam ediyor; son max-scroll karesi alt güvenlik açıklamasını, “Garaja dön” ve “Destek seçenekleri” yollarını gösteriyor. Görülen içerikte kalıcı metin/eylem kaybı yok. native-r3-large-correction-0.png, native-r3-large-correction-1.png, native-r3-large-correction-21.png, native-r3-large-replacement-0.png, native-r3-large-replacement-1.png. |
| 20 | PASS | Alt kısımda “Garaja dön” ve “Destek seçenekleri” düğmeleri anlaşılır biçimde görünüyor. native-r3-large-correction-21.png. |

## Genel görsel karar

Görüntülerin desteklediği arayüz ilk okuması: **BELİRSİZ**. Görsel akış ve çoğu güvenlik ayrımı okunaklı; ancak gerçek motosiklet/rehber/seçim ve karar kaynağı/saat örnek değerlerle temsil edildiği için üretim durumuna ilişkin ilk iki bağlam sorusu yanıtlanamıyor. Ayrıca izin durumu metinsel olarak belirtilmeyen native-r3-no-account-read-1.png karesinde etkin bir kontrol isteği düğmesi var; bunun izin kuralıyla ilişkisi yalnız görüntüden belirlenemiyor. Üretim verisi veya davranışı hakkında bu rapor çıkarım yapmaz.
</pre>

RAW Base64: IyBFMTAyNSBuYXRpdmUtcjMg4oCUIGJhxJ/EsW1zxLF6IGvDtnIgaWxrIGFyYXnDvHogb2t1bWFzxLEgKFIyKQoKIyMgS2Fwc2FtIHZlIGRvxJ9ydWxhbWEKCi0gQmV5YW4gZWRpbGVuIGthcHNhbTogQ09ERSA3NGRiYzUzYThhMjU0ODRhZmM1Njg2YmUzZjQ3MzIxYTczMzhjMDU0LiBCdSBrw7ZyIGfDtnJldmRlIEdpdCBkb8SfcnVsYW1hc8SxIHlhcMSxbG1hZMSxLgotIFNhYml0IHNvcnUgZml4dHVyZSfEsSAyMCBzb3J1IGnDp2VyaXlvcjsgU0hBLTI1NjogYzlhYTU4ODU5OTc5N2ZiZGNkMTE0ZjE0ZjkzMmFiZjNkNzI2M2JlMGUyOThhYjkzODk2ODA5MmIzOWQ0NzFjMCAoYmVrbGVuZW5sZSBheW7EsSkuCi0gTWFuaWZlc3QgMjIgZHVydW0gdmUgMTE5IMOnZXLDp2V2ZSBsaXN0ZWxpeW9yLiBZYWxuxLF6IG1hbmlmZXN0dGVraSBQTkcgeW9sbGFyxLEgb2t1bmR1OiB0w7xtIDExOSBkb3N5YW7EsW4gYmF5dCB1enVubHXEn3UsIFNIQS0yNTYnc8SxLCBQTkcgaW16YXPEsSB2ZSBJSERSIGJveXV0bGFyxLEgZGVuZXRsZW5kaS4gSGVyIGRvc3lhIG1hbmlmZXN0IGJheXQgdmUgYm95dXQgbWV0YXZlcmlzaXlsZSBlxZ9sZcWfdGk7IHTDvG3DvCAzOTDDlzg0NC4KLSAxMTkgw6dlcsOnZXZlIDgxIGZhcmtsxLEgU0hBLTI1Nid5YSBheXLEsWzEsXlvcjogODEgw7Z6Z8O8biBnw7Zyw7xudMO8IHZlIDM4IHlpbmVsZW5lbiB0YWttYSBhZC4gQXluxLEgU0hBIGdydWJ1bmRha2kgZG9zeWFsYXLEsW4gdGFtIGJheXQgZGl6aWxlcmkgZcWfaXQgw6fEsWt0xLEgKDEyIHRha21hIGFkIGdydWJ1OyBiYXl0IGXFn2l0bGnEn2kgdXl1xZ9tYXpsxLHEn8SxIHlvaykuCi0gMjIgZHVydW11biBoZXIgw6dlcsOnZXZlIGRpemlzaSAwIGtheWTEsXJtYWRhbiBiYcWfbMSxeW9yIHZlIGJpbGRpcmlsZW4gbWF4U2Nyb2xsRXh0ZW50J3RlIGJpdGl5b3I7IGtheWTEsXJtYWxhciBhcnRhbiBzxLFyYWRhLiBBcmTEscWfxLFrIGtheWTEsXJtYSBhcmFsxLFrbGFyxLEgODQ0IHBpa3NlbGRlbiBrxLFzYSBvbGR1xJ91IGnDp2luIGthcmVsZXIgw7ZydMO8xZ/DvHlvcjsgM8OXIG1ldGluIMO2bMOnZcSfaW5kZSBhZMSxbSA2MDAgcGlrc2VsLCDDtnJ0w7zFn21lIGVuIGF6IDI0NCBwaWtzZWwuIEhlciA4MSDDtnpnw7xuIFBORywgdmlld19pbWFnZSBpbGUgb3JpZ2luYWwgYXlyxLFudMSxc8SxbmRhIGHDp8SxbGTEsS4KLSDEsHppbiB2ZXJpbGVuIGdpcmRpbGVyIGFyYXPEsW5kYSBiZWxpcnRpbGVuIG5hdGl2ZS1yMy1wcm9vZi5qc29uIHZlIHVuaXF1ZS1pbWFnZXMtbmF0aXZlLXIzLmpzb24sIHZlcmlsZW4gdGFtIGtvbnVtbGFyxLFuZGEgYnVsdW5hbWFkxLEuIMOWemfDvG4vdGFrbWEgYWQgc2F5xLFzxLEgbWFuaWZlc3R0ZWtpIGdlcsOnZWsgUE5HJ2xlcmRlbiBiYcSfxLFtc8SxeiBvbGFyYWsgdMO8cmV0aWxkaS4gQnUgaWtpIGRvc3lhIGnDp2luIGnDp2VyaWsgZG/En3J1bGFtYXPEsSB5YXDEsWxhbWFkxLEuCi0gxLBzdGVuZW4gbW9kZWwgYmHEn2xhbcSxOiBncHQtNi1sdW5hL21heC4gQmHEn8SxbXPEsXogw6dhbMSxxZ90xLFybWEvbW9kZWwgYXR0ZXN0YXRpb24nxLE6IHVuYXZhaWxhYmxlLgoKIyMgMjAgc2FiaXQgc29ydXlhIGfDtnJzZWwgeWFuxLF0CgpEb3N5YSBtYXJrZXInbGFyxLEgYcWfYcSfxLFkYWtpIEM6XFVzZXJzXFhwaWtlXC5jb2RleFx0YXNrLXN0YXRlXGthdnJpdmEtZTEwMjVcbmF0aXZlLXIzXCBkaXppbmluZGVraSBnZXLDp2VrIFBORyBhZGxhcsSxZMSxci4g4oCcQkVMxLBSU8SwWuKAnSDDvHJldGltIGR1cnVtdSBoYWtrxLFuZGEgZ8O2csO8bnTDvGxlcmluIGthbsSxdCBzYcSfbGFtYWTEscSfxLEgYW5sYW3EsW5hIGdlbGlyOyDDtnJuZWsgbWV0aW4gZ2Vyw6dlayBzZcOnaW0va2FyYXIgb2xhcmFrIG9rdW5tYW3EscWfdMSxci4KCnwgIyB8IFNvbnXDpyB8IEfDtnJzZWwgYnVsZ3UgdmUgZ2Vyw6dlayBkb3N5YSBtYXJrZXInxLEgfAp8LS0tOnwtLS18LS0tfAp8IDEgfCBCRUzEsFJTxLBaIHwgTW90b3Npa2xldCwgcmVoYmVyIHZlIHPDvHLDvG0gYWxhbmxhcsSxIMOWcm5layAuLi4gb2xhcmFrIGnFn2FyZXRsZW5tacWfOyBrYXJ0IGF5csSxY2EgZ2Vyw6dlay/DvHJldGltIGthcmFyxLEgb2xtYWTEscSfxLFuxLEgc8O2eWzDvHlvci4gZ3VpZGUtdjEgdmUgc2VsLXIxIMO2cm5layBkZcSfZXJsZXJpIGfDtnLDvG7DvHIsIGZha2F0IGdlcsOnZWsgc2XDp2lsaSBtb3Rvc2lrbGV0L3JlaGJlci9zw7xyw7xtIGJ1IGfDtnLDvG50w7xsZXJkZSB5b2suIG5hdGl2ZS1yMy1jb3JyZWN0aW9uLTAucG5nLCBuYXRpdmUtcjMtcmVwbGFjZW1lbnQtMC5wbmcuIHwKfCAyIHwgUEFTUyB8IOKAnFlhbmzEscWfIHJlaGJlciBzZcOnaW1pbmkgZMO8emVsdG1l4oCdIGlsZSDigJxZZW5pZGVuIHJlaGJlciBzZcOnaW1p4oCdIGJhxZ9sxLFrbGFyxLEgdmUgaWxnaWxpIGZhcmtsxLEga29udHJvbCBpc3RlxJ9pIGTDvMSfbWVsZXJpIGF5csSxbMSxeW9yLiBuYXRpdmUtcjMtY29ycmVjdGlvbi0xLnBuZywgbmF0aXZlLXIzLXJlcGxhY2VtZW50LTEucG5nLiB8CnwgMyB8IFBBU1MgfCBZYW5sxLHFnyBzZcOnaW1pbiBpbGsgZml6aWtzZWwgYWTEsW1kYW4gw7ZuY2UgZMO8emVsdGlsZWJpbGVjZcSfaSB5YXrEsXlvci4gbmF0aXZlLXIzLWNvcnJlY3Rpb24tMS5wbmcuIHwKfCA0IHwgUEFTUyB8IEJhxZ9sYW5nxLHDpyBkdXJ1bXUgYmlsaW5taXlvcnNhIHZleWEgacWfZSBiYcWfbGFubcSxxZ9zYSBkw7x6ZWx0bWVuaW4gYcOnxLFsbWFkxLHEn8SxIGJlbGlydGlsaXlvcjsgYmVsaXJzaXogYmHFn2xhbmfEscOndGEgZG/En3J1bGFubWFkxLHEn8SxIGHDp8Sxa8OnYSB5YXrEsXlvci4gbmF0aXZlLXIzLXVua25vd24tc3RhcnQtMS5wbmcsIG5hdGl2ZS1yMy1zdGFydGVkLTEucG5nLiB8CnwgNSB8IFBBU1MgfCBSZWhiZXIga3VsbGFuxLFjxLFuxLFuIGhhdGFzxLEgb2xtYWRhbiBnZXJpIMOnZWtpbGRpxJ9pbmRlIGhha2vEsW4gc3VudWN1IGthcmFyxLFuYSBnw7ZyZSBhw6fEsWxhYmlsZWNlxJ9pIHZlIGtlbmRpbGnEn2luZGVuIHllbmlsZW5tZWRpxJ9pIHlhesSxeW9yLiBuYXRpdmUtcjMtcmVwbGFjZW1lbnQtMS5wbmcuIHwKfCA2IHwgQkVMxLBSU8SwWiB8IEtheW5haywga2FyYXIgc8O8csO8bcO8LCBrYXluYWsga29udW11IHZlIGtvbnRyb2wgemFtYW7EsSBrYXJ0dGEgdmFyOyBoZXBzaSDDtnJuZWsgb2xhcmFrIGV0aWtldGxlbm1pxZ8gdmUgw7xyZXRpbWUgYmHEn2zEsSBvbG1hZMSxxJ/EsSBzw7Z5bGVubWnFny4gR2Vyw6dlayBnw7xuY2VsIGtheW5hay96YW1hbiBnw7Zyw7xudMO8ZGVuIGRvxJ9ydWxhbmFtxLF5b3IuIG5hdGl2ZS1yMy1jb3JyZWN0aW9uLTAucG5nLiB8CnwgNyB8IFBBU1MgfCDEsHN0ZWsgYWzEsW5kxLEgZHVydW11bmRhIGhha2vEsW4gdmVyaWxkacSfaW5pbiB2ZXlhIHNlw6dpbWluIGRlxJ9pxZ90acSfaW5pbiBoZW7DvHogZG/En3J1bGFubWFkxLHEn8SxIGHDp8Sxay4gbmF0aXZlLXIzLXJlY2VpdmVkLTEucG5nLiB8CnwgOCB8IFBBU1MgfCBNb3Rvc2lrbGV0IGRlxJ9pxZ90aXJtZWsgdmV5YSByZWhiZXJpIHRhbWFtbGFtYWsgeWVuaSDDvGNyZXRzaXogc2XDp2ltIGhha2vEsSDDvHJldG1leiBkZW5peW9yLiBuYXRpdmUtcjMtY29ycmVjdGlvbi0xLnBuZy4gfAp8IDkgfCBQQVNTIHwgVGFtIHJlaGJlciBoYWtrxLFuxLFuIGF5bsSxIGFuZGEgdGVrIHNlw6dpbGkgbW90b3Npa2xldHRlIGHDp8SxbGTEscSfxLE7IG1vdG9zaWtsZXQgZGXEn2nFn2luY2UgdGHFn8SxbmTEscSfxLEgdmUgw7xzdCDDvHN0ZSBla2xlbm1lZGnEn2kgeWF6xLF5b3IuIG5hdGl2ZS1yMy1jb3JyZWN0aW9uLTEucG5nLiB8CnwgMTAgfCBQQVNTIHwgS2VzaW4gc8O8cmUsIHNlw6dpbSBzxLFrbMSxxJ/EsSB2ZSDDvGNyZXQga2/Fn3VsbGFyxLFuxLFuIGJ1cmFkYSBiZWxpcmxlbm1lZGnEn2kgYcOnxLFrw6dhIGJlbGlydGlsaXlvci4gbmF0aXZlLXIzLWNvcnJlY3Rpb24tMS5wbmcuIHwKfCAxMSB8IEJFTMSwUlPEsFogfCBEb8SfcnVsYW5hbWF5YW4gc2XDp2ltIGJpbGdpc2kgZWtyYW7EsW5kYSDDtnplbCBheXLEsW50xLFsYXIgc2FrbMSxIHZlIGTDvHplbHRtZSBpc3RlxJ9pIGthcGFsxLE7IMOnZXZyaW1kxLHFn8SxIGR1cnVtZGEgeWVuaSBzZcOnaW0gaXN0ZcSfaSBrYXBhbMSxIHZlIGlraSBhbmEgacWfbGVtIGRlIGRldnJlIGTEscWfxLEgZ8O2csO8bsO8eW9yLiBCdW51bmxhIGJpcmxpa3RlIG5hdGl2ZS1yMy1uby1hY2NvdW50LXJlYWQtMS5wbmcgacOnaW5kZSBkw7x6ZWx0bWUga29udHJvbCBpc3RlxJ9pIGTDvMSfbWVzaSBldGtpbi4gQnUga2FyZWRlIGl6aW4gZWtzaWtsacSfaSBtZXRpbnNlbCBvbGFyYWsgZ8O2csO8bm1lZGnEn2luZGVuIGJ1bnVuIGlzdGVrL2l6aW4gZmFya8SxIG3EsSB5b2tzYSDDp2VsacWfa2kgbWkgb2xkdcSfdSB5YWxuxLF6IGfDtnLDvG50w7xkZW4gw6fDtnrDvGxlbWl5b3IuIE1hcmtlcidsYXI6IG5hdGl2ZS1yMy1taXNzaW5nLTAucG5nLCBuYXRpdmUtcjMtb2ZmbGluZS0wLnBuZywgbmF0aXZlLXIzLW9mZmxpbmUtMS5wbmcsIG5hdGl2ZS1yMy1uby1hY2NvdW50LXJlYWQtMS5wbmcuIHwKfCAxMiB8IFBBU1MgfCBEb8SfcnVsYW5hbWF5YW4gZHVydW1kYSDDtnplbCBtb3Rvc2lrbGV0IHZlIHJlaGJlciBheXLEsW50xLFsYXLEsW7EsW4gZ8O2c3RlcmlsbWVkacSfaTsgZ8O8bmNlbCBraW1saWsgdmUgb2t1bWEgaXpuaSBnZXJla3RpxJ9pIHlhesSxeW9yLiBHw7Zyw7xuZW4gZGXEn2VybGVyIMO2cm5layBvbGFyYWsgZXRpa2V0bGkuIG5hdGl2ZS1yMy1taXNzaW5nLTAucG5nLiB8CnwgMTMgfCBQQVNTIHwgRXNraSBpxZ9sZW0ga2F5ZMSxLCBrdWxsYW7EsWxhbiByZWhiZXIgc8O8csO8bcO8IHZlIGfDvHZlbmxpayBkw7x6ZWx0bWVsZXJpbmluIHllbmkgc2XDp2ltbGUgc2lsaW5tZWRpxJ9pIGJlbGlydGlsaXlvci4gbmF0aXZlLXIzLWNvcnJlY3Rpb24tMi5wbmcuIHwKfCAxNCB8IFBBU1MgfCBHZcOnbWnFnywga2FuxLF0L2theW5haywgZMO8emVsdG1lL2l0aXJheiB2ZSBkxLHFn2EgYWt0YXJtYSB5b2xsYXLEsSBnw7Zyw7xuw7xyOyBzYXTEsW4gYWxtYXlhIGJhxJ9sxLEgb2xtYWTEsWtsYXLEsSB5YXrEsXlvci4gbmF0aXZlLXIzLWNvcnJlY3Rpb24tMi5wbmcuIHwKfCAxNSB8IFBBU1MgfCBLcml0aWsgZ8O8dmVubGlrIGJpbGdpc2kgaWxlIGJhxZ9sYW5txLHFnyBpxZ9pbiBnw7x2ZW5saSBkw7Zuw7zFn8O8IGF5csSxIHlvbGxhcjsgbWV0aW4gYnVubGFyxLFuIGnFn2kgc8O8cmTDvHJtZSBpem5pIHZleWEgZ8O8dmVubGkgc29udcOnIGtheWTEsSBvbG1hZMSxxJ/EsW7EsSBiZWxpcnRpeW9yLiBuYXRpdmUtcjMtY29ycmVjdGlvbi0yLnBuZy4gfAp8IDE2IHwgUEFTUyB8IFJlaGJlciBoYWtrxLFuxLFuIGJha8SxbcSxbiBkb8SfcnUgdmV5YSBtb3Rvc2lrbGV0aW4gc8O8csO8xZ9lIGfDvHZlbmxpIG9sZHXEn3VudSBrYW7EsXRsYW1hZMSxxJ/EsTsgZml6aWtzZWwgdXlndW5sdcSfdW4gYXlyxLFjYSBkZcSfZXJsZW5kaXJpbGVjZcSfaSB5YXrEsXlvci4gbmF0aXZlLXIzLWNvcnJlY3Rpb24tMy5wbmcuIHwKfCAxNyB8IFBBU1MgfCBLb250cm9sIHPDvHJlcmtlbiB5ZW5pIGlzdGVrIGfDtm5kZXJpbG1lZGnEn2kgeWF6xLF5b3IgdmUgYW5hIGTDvMSfbWVsZXIgZGV2cmUgZMSxxZ/EsS4gSGF0YSBkdXJ1bXVuZGEgeWVuaSBzZcOnaW0gdGFsZWJpIGfDtm5kZXJpbG1lZGnEn2kgYmVsaXJ0aWxpeW9yOyBpxZ9sZXlpY2kgeW9ra2VuIHTDvG0gacWfbGVtIHZlIGthecSxdCB5b2xsYXLEsSBkZXZyZSBkxLHFn8SxLiBuYXRpdmUtcjMtYnVzeS0xLnBuZywgbmF0aXZlLXIzLWVycm9yLTEucG5nLCBuYXRpdmUtcjMtbm8taGFuZGxlci0xLnBuZywgbmF0aXZlLXIzLW5vLWhhbmRsZXItMy5wbmcuIHwKfCAxOCB8IFBBU1MgfCBEb8SfcnVsYW5hbWF5YW4gc2XDp2ltIGthcnTEsSBiYcWfa2EgaGVzYXAsIG1vdG9zaWtsZXQgdmV5YSByZWhiZXIga2FyYXLEsW7EsW4gYnUgc2XDp2ltZGUga3VsbGFuxLFsYW1heWFjYcSfxLFuxLEgc8O2eWzDvHlvci4gbmF0aXZlLXIzLW1pc3NpbmctMC5wbmcuIHwKfCAxOSB8IFBBU1MgfCAzw5cgbWV0aW5kZSBla3JhbiBkxLHFn8SxbmEgdGHFn2FuIHBhcsOnYWxhciBzb25yYWtpIMO2cnTDvMWfZW4ga2F5ZMSxcm1hIGthcmVzaW5kZSBkZXZhbSBlZGl5b3I7IHNvbiBtYXgtc2Nyb2xsIGthcmVzaSBhbHQgZ8O8dmVubGlrIGHDp8Sxa2xhbWFzxLFuxLEsIOKAnEdhcmFqYSBkw7Zu4oCdIHZlIOKAnERlc3RlayBzZcOnZW5la2xlcmnigJ0geW9sbGFyxLFuxLEgZ8O2c3Rlcml5b3IuIEfDtnLDvGxlbiBpw6dlcmlrdGUga2FsxLFjxLEgbWV0aW4vZXlsZW0ga2F5YsSxIHlvay4gbmF0aXZlLXIzLWxhcmdlLWNvcnJlY3Rpb24tMC5wbmcsIG5hdGl2ZS1yMy1sYXJnZS1jb3JyZWN0aW9uLTEucG5nLCBuYXRpdmUtcjMtbGFyZ2UtY29ycmVjdGlvbi0yMS5wbmcsIG5hdGl2ZS1yMy1sYXJnZS1yZXBsYWNlbWVudC0wLnBuZywgbmF0aXZlLXIzLWxhcmdlLXJlcGxhY2VtZW50LTEucG5nLiB8CnwgMjAgfCBQQVNTIHwgQWx0IGvEsXPEsW1kYSDigJxHYXJhamEgZMO2buKAnSB2ZSDigJxEZXN0ZWsgc2XDp2VuZWtsZXJp4oCdIGTDvMSfbWVsZXJpIGFubGHFn8SxbMSxciBiacOnaW1kZSBnw7Zyw7xuw7x5b3IuIG5hdGl2ZS1yMy1sYXJnZS1jb3JyZWN0aW9uLTIxLnBuZy4gfAoKIyMgR2VuZWwgZ8O2cnNlbCBrYXJhcgoKR8O2csO8bnTDvGxlcmluIGRlc3Rla2xlZGnEn2kgYXJhecO8eiBpbGsgb2t1bWFzxLE6ICoqQkVMxLBSU8SwWioqLiBHw7Zyc2VsIGFrxLHFnyB2ZSDDp2/En3UgZ8O8dmVubGlrIGF5csSxbcSxIG9rdW5ha2zEsTsgYW5jYWsgZ2Vyw6dlayBtb3Rvc2lrbGV0L3JlaGJlci9zZcOnaW0gdmUga2FyYXIga2F5bmHEn8SxL3NhYXQgw7ZybmVrIGRlxJ9lcmxlcmxlIHRlbXNpbCBlZGlsZGnEn2kgacOnaW4gw7xyZXRpbSBkdXJ1bXVuYSBpbGnFn2tpbiBpbGsgaWtpIGJhxJ9sYW0gc29ydXN1IHlhbsSxdGxhbmFtxLF5b3IuIEF5csSxY2EgaXppbiBkdXJ1bXUgbWV0aW5zZWwgb2xhcmFrIGJlbGlydGlsbWV5ZW4gbmF0aXZlLXIzLW5vLWFjY291bnQtcmVhZC0xLnBuZyBrYXJlc2luZGUgZXRraW4gYmlyIGtvbnRyb2wgaXN0ZcSfaSBkw7zEn21lc2kgdmFyOyBidW51biBpemluIGt1cmFsxLF5bGEgaWxpxZ9raXNpIHlhbG7EsXogZ8O2csO8bnTDvGRlbiBiZWxpcmxlbmVtaXlvci4gw5xyZXRpbSB2ZXJpc2kgdmV5YSBkYXZyYW7EscWfxLEgaGFra8SxbmRhIGJ1IHJhcG9yIMOnxLFrYXLEsW0geWFwbWF6Lg0K

first-reading-r2-addendum.txt 3432 bayt; SHA256 cee3ef0eeca84c708e3fd60394175b9b3fc4054d6ce07b24f01076d4a0df0889

<pre># E1025 native-r3 — R2 ek hükmü

## Kapsam ve kanıt dosyaları

Bu ek, R2 özgün raporunun yerine geçmez ve onu değiştirmez. İlk okunabilirlik kapsamı örnek verili arayüzdür; üretim verisi ve canlı karar doğrulaması bu hükmün dışındadır. Sabit 20 soru değişmedi.

Önceki görev tanımında yanlış dizin verilen iki dosya, bu ek için bildirilen kök konumlarında okundu:

- C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r3-proof.json
- C:\Users\Xpike\.codex\task-state\kavriva-e1025\unique-images-native-r3.json

Kanıt manifesti native-r3, 22 durum, 119 kare, 81 özgün ve 38 alias kaydı bildiriyor. 119 kanıt girdisinin gerçek PNG baytı ve SHA-256&#x27;sı ile kayıtları eşleşti (uyuşmazlık 0). Benzersiz görüntü listesi 81 yol içeriyor; kanıttaki aliasOf=null kayıtlarıyla sıra dahil eşleşti (uyuşmazlık 0). Önceki raporda bu iki dosyanın erişilemediği notu bu ekle düzeltilmiştir.

İstenen model bağlamı gpt-6-luna/max; bağımsız runtime/model attestation&#x27;ı unavailable.

## Görsel ek hükümler

| Soru | Ek sonuç | Görsel dayanak |
|---:|---|---|
| 1 | PASS | Örnek arayüz bağlamında motosiklet ve rehber “Örnek” olarak, rehber sürümü guide-v1 ve seçim sürümü sel-r1 olarak açıkça okunuyor. Kart bu değerlerin gerçek/üretim kararı olmadığını da söylüyor. Bu hüküm değerlerin örnek olduğunu anlamaya ilişkindir, gerçek üretim kimliği iddiası değildir. Marker: native-r3-correction-0.png, native-r3-replacement-0.png. |
| 6 | PASS | Örnek sunucu kaynağı, karar sürümü karar-v1, örnek seçim kaydı konumu ve “2026-10-17 örnek zamanı” okunaklı. Kart üretime bağlı olmadığını açıkça belirtiyor. Marker: native-r3-correction-0.png, native-r3-replacement-0.png. |
| 11 | BELİRSİZ | Açık izin/bilgi yokluğu ekranında özel motosiklet ve rehber ayrıntıları saklanıyor, güncel kimlik ve okuma izni gerektiği yazıyor ve yanlış seçim kontrol isteği devre dışı. Çevrimdışı ekranda yeni seçim isteğinin kapalı olduğu açık; iki ana düğme devre dışı. Buna karşılık no-account-read marker&#x27;lı karelerde “Kontrol isteği gönderebilirsin” yazıyor ve düzeltme kontrol isteği düğmesi etkin. O karelerin kartı örnek/üretim dışı olduğunu belirtiyor fakat görünür metin, bu istek açıkken okuma izninin eksik olup olmadığını veya isteğin seçim hakkı vermeden/seçimi değiştirmeden yalnız güncel durumu kontrol ettiğini o eylemden önce açıklamıyor. İstek alındı karesinde bu ayrım sonradan anlatılıyor; belirsiz kalan nokta eylem öncesi açıklamadır. Bu nedenle Q11’i PASS’a çevirmedim; bulgu üretim mantığı hakkında iddia değildir. Eksik olabilecek görünür açıklama: etkin kontrol isteğinin yalnızca doğrulama talebi olduğu, seçim hakkı vermediği ve seçimi değiştirmediği; ya da izin eksikken bu isteğin de kapalı olması gerekiyorsa bunun nedenidir. Marker&#x27;lar: native-r3-missing-0.png, native-r3-offline-0.png, native-r3-offline-1.png, native-r3-no-account-read-0.png, native-r3-no-account-read-1.png, native-r3-received-1.png. |

## Güncel karar

Soru 1 ve 6, örnek arayüzün okunabilirliği kapsamında PASS. Soru 11 için eylem öncesi izin/istek kapsamı açıklaması görünmediğinden BELİRSİZ hükmü sürüyor. Bu ek, üretim verisi veya canlı karar hakkında değerlendirme yapmaz.
</pre>

RAW Base64: IyBFMTAyNSBuYXRpdmUtcjMg4oCUIFIyIGVrIGjDvGttw7wKCiMjIEthcHNhbSB2ZSBrYW7EsXQgZG9zeWFsYXLEsQoKQnUgZWssIFIyIMO2emfDvG4gcmFwb3J1bnVuIHllcmluZSBnZcOnbWV6IHZlIG9udSBkZcSfacWfdGlybWV6LiDEsGxrIG9rdW5hYmlsaXJsaWsga2Fwc2FtxLEgw7ZybmVrIHZlcmlsaSBhcmF5w7x6ZMO8cjsgw7xyZXRpbSB2ZXJpc2kgdmUgY2FubMSxIGthcmFyIGRvxJ9ydWxhbWFzxLEgYnUgaMO8a23DvG4gZMSxxZ/EsW5kYWTEsXIuIFNhYml0IDIwIHNvcnUgZGXEn2nFn21lZGkuCgrDlm5jZWtpIGfDtnJldiB0YW7EsW3EsW5kYSB5YW5sxLHFnyBkaXppbiB2ZXJpbGVuIGlraSBkb3N5YSwgYnUgZWsgacOnaW4gYmlsZGlyaWxlbiBrw7ZrIGtvbnVtbGFyxLFuZGEgb2t1bmR1OgoKLSBDOlxVc2Vyc1xYcGlrZVwuY29kZXhcdGFzay1zdGF0ZVxrYXZyaXZhLWUxMDI1XG5hdGl2ZS1yMy1wcm9vZi5qc29uCi0gQzpcVXNlcnNcWHBpa2VcLmNvZGV4XHRhc2stc3RhdGVca2F2cml2YS1lMTAyNVx1bmlxdWUtaW1hZ2VzLW5hdGl2ZS1yMy5qc29uCgpLYW7EsXQgbWFuaWZlc3RpIG5hdGl2ZS1yMywgMjIgZHVydW0sIDExOSBrYXJlLCA4MSDDtnpnw7xuIHZlIDM4IGFsaWFzIGtheWTEsSBiaWxkaXJpeW9yLiAxMTkga2FuxLF0IGdpcmRpc2luaW4gZ2Vyw6dlayBQTkcgYmF5dMSxIHZlIFNIQS0yNTYnc8SxIGlsZSBrYXnEsXRsYXLEsSBlxZ9sZcWfdGkgKHV5dcWfbWF6bMSxayAwKS4gQmVuemVyc2l6IGfDtnLDvG50w7wgbGlzdGVzaSA4MSB5b2wgacOnZXJpeW9yOyBrYW7EsXR0YWtpIGFsaWFzT2Y9bnVsbCBrYXnEsXRsYXLEsXlsYSBzxLFyYSBkYWhpbCBlxZ9sZcWfdGkgKHV5dcWfbWF6bMSxayAwKS4gw5ZuY2VraSByYXBvcmRhIGJ1IGlraSBkb3N5YW7EsW4gZXJpxZ9pbGVtZWRpxJ9pIG5vdHUgYnUgZWtsZSBkw7x6ZWx0aWxtacWfdGlyLgoKxLBzdGVuZW4gbW9kZWwgYmHEn2xhbcSxIGdwdC02LWx1bmEvbWF4OyBiYcSfxLFtc8SxeiBydW50aW1lL21vZGVsIGF0dGVzdGF0aW9uJ8SxIHVuYXZhaWxhYmxlLgoKIyMgR8O2cnNlbCBlayBow7xrw7xtbGVyCgp8IFNvcnUgfCBFayBzb251w6cgfCBHw7Zyc2VsIGRheWFuYWsgfAp8LS0tOnwtLS18LS0tfAp8IDEgfCBQQVNTIHwgw5ZybmVrIGFyYXnDvHogYmHEn2xhbcSxbmRhIG1vdG9zaWtsZXQgdmUgcmVoYmVyIOKAnMOWcm5la+KAnSBvbGFyYWssIHJlaGJlciBzw7xyw7xtw7wgZ3VpZGUtdjEgdmUgc2XDp2ltIHPDvHLDvG3DvCBzZWwtcjEgb2xhcmFrIGHDp8Sxa8OnYSBva3VudXlvci4gS2FydCBidSBkZcSfZXJsZXJpbiBnZXLDp2VrL8O8cmV0aW0ga2FyYXLEsSBvbG1hZMSxxJ/EsW7EsSBkYSBzw7Z5bMO8eW9yLiBCdSBow7xrw7xtIGRlxJ9lcmxlcmluIMO2cm5layBvbGR1xJ91bnUgYW5sYW1heWEgaWxpxZ9raW5kaXIsIGdlcsOnZWsgw7xyZXRpbSBraW1sacSfaSBpZGRpYXPEsSBkZcSfaWxkaXIuIE1hcmtlcjogbmF0aXZlLXIzLWNvcnJlY3Rpb24tMC5wbmcsIG5hdGl2ZS1yMy1yZXBsYWNlbWVudC0wLnBuZy4gfAp8IDYgfCBQQVNTIHwgw5ZybmVrIHN1bnVjdSBrYXluYcSfxLEsIGthcmFyIHPDvHLDvG3DvCBrYXJhci12MSwgw7ZybmVrIHNlw6dpbSBrYXlkxLEga29udW11IHZlIOKAnDIwMjYtMTAtMTcgw7ZybmVrIHphbWFuxLHigJ0gb2t1bmFrbMSxLiBLYXJ0IMO8cmV0aW1lIGJhxJ9sxLEgb2xtYWTEscSfxLFuxLEgYcOnxLFrw6dhIGJlbGlydGl5b3IuIE1hcmtlcjogbmF0aXZlLXIzLWNvcnJlY3Rpb24tMC5wbmcsIG5hdGl2ZS1yMy1yZXBsYWNlbWVudC0wLnBuZy4gfAp8IDExIHwgQkVMxLBSU8SwWiB8IEHDp8SxayBpemluL2JpbGdpIHlva2x1xJ91IGVrcmFuxLFuZGEgw7Z6ZWwgbW90b3Npa2xldCB2ZSByZWhiZXIgYXlyxLFudMSxbGFyxLEgc2FrbGFuxLF5b3IsIGfDvG5jZWwga2ltbGlrIHZlIG9rdW1hIGl6bmkgZ2VyZWt0acSfaSB5YXrEsXlvciB2ZSB5YW5sxLHFnyBzZcOnaW0ga29udHJvbCBpc3RlxJ9pIGRldnJlIGTEscWfxLEuIMOHZXZyaW1kxLHFn8SxIGVrcmFuZGEgeWVuaSBzZcOnaW0gaXN0ZcSfaW5pbiBrYXBhbMSxIG9sZHXEn3UgYcOnxLFrOyBpa2kgYW5hIGTDvMSfbWUgZGV2cmUgZMSxxZ/EsS4gQnVuYSBrYXLFn8SxbMSxayBuby1hY2NvdW50LXJlYWQgbWFya2VyJ2zEsSBrYXJlbGVyZGUg4oCcS29udHJvbCBpc3RlxJ9pIGfDtm5kZXJlYmlsaXJzaW7igJ0geWF6xLF5b3IgdmUgZMO8emVsdG1lIGtvbnRyb2wgaXN0ZcSfaSBkw7zEn21lc2kgZXRraW4uIE8ga2FyZWxlcmluIGthcnTEsSDDtnJuZWsvw7xyZXRpbSBkxLHFn8SxIG9sZHXEn3VudSBiZWxpcnRpeW9yIGZha2F0IGfDtnLDvG7DvHIgbWV0aW4sIGJ1IGlzdGVrIGHDp8Sxa2tlbiBva3VtYSBpem5pbmluIGVrc2lrIG9sdXAgb2xtYWTEscSfxLFuxLEgdmV5YSBpc3RlxJ9pbiBzZcOnaW0gaGFra8SxIHZlcm1lZGVuL3Nlw6dpbWkgZGXEn2nFn3Rpcm1lZGVuIHlhbG7EsXogZ8O8bmNlbCBkdXJ1bXUga29udHJvbCBldHRpxJ9pbmkgbyBleWxlbWRlbiDDtm5jZSBhw6fEsWtsYW3EsXlvci4gxLBzdGVrIGFsxLFuZMSxIGthcmVzaW5kZSBidSBheXLEsW0gc29ucmFkYW4gYW5sYXTEsWzEsXlvcjsgYmVsaXJzaXoga2FsYW4gbm9rdGEgZXlsZW0gw7ZuY2VzaSBhw6fEsWtsYW1hZMSxci4gQnUgbmVkZW5sZSBRMTHigJlpIFBBU1PigJlhIMOnZXZpcm1lZGltOyBidWxndSDDvHJldGltIG1hbnTEscSfxLEgaGFra8SxbmRhIGlkZGlhIGRlxJ9pbGRpci4gRWtzaWsgb2xhYmlsZWNlayBnw7Zyw7xuw7xyIGHDp8Sxa2xhbWE6IGV0a2luIGtvbnRyb2wgaXN0ZcSfaW5pbiB5YWxuxLF6Y2EgZG/En3J1bGFtYSB0YWxlYmkgb2xkdcSfdSwgc2XDp2ltIGhha2vEsSB2ZXJtZWRpxJ9pIHZlIHNlw6dpbWkgZGXEn2nFn3Rpcm1lZGnEn2k7IHlhIGRhIGl6aW4gZWtzaWtrZW4gYnUgaXN0ZcSfaW4gZGUga2FwYWzEsSBvbG1hc8SxIGdlcmVraXlvcnNhIGJ1bnVuIG5lZGVuaWRpci4gTWFya2VyJ2xhcjogbmF0aXZlLXIzLW1pc3NpbmctMC5wbmcsIG5hdGl2ZS1yMy1vZmZsaW5lLTAucG5nLCBuYXRpdmUtcjMtb2ZmbGluZS0xLnBuZywgbmF0aXZlLXIzLW5vLWFjY291bnQtcmVhZC0wLnBuZywgbmF0aXZlLXIzLW5vLWFjY291bnQtcmVhZC0xLnBuZywgbmF0aXZlLXIzLXJlY2VpdmVkLTEucG5nLiB8CgojIyBHw7xuY2VsIGthcmFyCgpTb3J1IDEgdmUgNiwgw7ZybmVrIGFyYXnDvHrDvG4gb2t1bmFiaWxpcmxpxJ9pIGthcHNhbcSxbmRhIFBBU1MuIFNvcnUgMTEgacOnaW4gZXlsZW0gw7ZuY2VzaSBpemluL2lzdGVrIGthcHNhbcSxIGHDp8Sxa2xhbWFzxLEgZ8O2csO8bm1lZGnEn2luZGVuIEJFTMSwUlPEsFogaMO8a23DvCBzw7xyw7x5b3IuIEJ1IGVrLCDDvHJldGltIHZlcmlzaSB2ZXlhIGNhbmzEsSBrYXJhciBoYWtrxLFuZGEgZGXEn2VybGVuZGlybWUgeWFwbWF6Lg0K

## R4 yerel açıklama onarımı — bağımsız kabul henüz yok

Kod öncesi 8f7f543954c8e1d6fc8e2129efe7cce6f06cdf7b kapsamıyla ana düğmeden önce yalnız sunucu değerlendirmesi istendiği, seçim hakkı verilmediği ve seçili rehberin değişmediği yazıldı. Eski kayıtlar için ayrı okuma izni doğrulanmadığında kapalı yollar ve ana seçim değerlendirmesinden ayrı izin denetimi açıklanır. Model/guard/politika değişmedi. İlgili test eylem öncesi metni ve eski kayıtlar kapalıyken bağımsız olarak doğrulanmış seçim değerlendirme talebinin açık kalmasını kontrol eder.

Güncel normal482=473korunan+9yeni; ayrı native10;56format0/analyze0;36responsive. R4 doğal22durum/123PNG/85özgün/38tamalias. Root50yeniOriginal gerçekten açtı;35görüntü önceki gerçekten okunmuş R3 ile tüm baytları eşit. Aynı capture kodu R4 dizininde native-r3 dosya öneki kullanır; tam dizin yolları bu yeni görüntüleri ayırır. Görüntüler değiştirilmedi. Sabit20 aynı. Kör R2 ve eki Q11 belirsizliği korunur; yeni geçmişsiz kör R3 henüz beklenir, CHANGES_REQUESTED devam eder. Gerçek112/94/206 ve üretim/uzman/cihaz/yayın üst kapıları değişmez.

Güncel R4 LF konu özetleri:

- modules/e01-app/internal/shell/lib/replacement_right.dart SHA256 9f3e132b8905c11ca06a6c44de8ef2778e45f4a4bcd9a9f1a3f441fab8bcc475
- modules/e01-app/internal/shell/test/replacement_right_test.dart SHA256 a87d6e2987d00d93a5141ff6587f718ec52e883bf7057f81fcb59cf517952601
- modules/e01-app/internal/shell/test/fixtures/replacement_right_reading_questions.json SHA256 c9aa588599797fbdcd114f14f932abf3d7263be0e298ab938968092b39d471c0

target-r7.log 981 bayt SHA256 f128bc579a58c2b7a861be422a9a6a236e82b3c371d373759ec9626f4e19fbef

analyze-r7.log 96 bayt SHA256 028561b90f65daaa844bb2739b30fb11106ad56e0ba56fdf10684642799afa72

format-r4.log 48 bayt SHA256 db16c13932d2213f424fd9fedeef6a0b3e4d83a12e9f585cc460694f21d27504

native-r4.log 1056 bayt SHA256 a59a3297a4b8fe43131eb584cd0147c3dd39641bdcc79e702d1eff3afa07c6cb

full-r4.log 113360 bayt SHA256 f184b688d07035f6aeca628b49ef59b1e3f8faeb681225305b46b648b46e98bb

native-r4-proof.json 56081 bayt SHA256 468ac3b6bb02e4ff4356e5ca849ccfabf4d94989b4bf78312881c2f5e8c5af9c

<pre>{
  &quot;stage&quot;: &quot;native-r4&quot;,
  &quot;cases&quot;: 22,
  &quot;frames&quot;: 123,
  &quot;unique&quot;: 85,
  &quot;aliases&quot;: 38,
  &quot;entries&quot;: [
    {
      &quot;case&quot;: &quot;correction&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-correction-0.png&quot;,
      &quot;bytes&quot;: 73791,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;d31f475f40e37d7d1172849290f851cc5fb7e3d70c2879b153765ab766cd31a2&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;correction&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-correction-1.png&quot;,
      &quot;bytes&quot;: 79900,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;a782b01eeb98a95f3c1bafd33d8edac3db75e29b142b7c796bd56a998465dbec&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;correction&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-correction-2.png&quot;,
      &quot;bytes&quot;: 79926,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;0dd6f501e4fac0edacfa99087106831f28a816d307a345f90cb7e736eb8d2ffd&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;correction&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1487.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-correction-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;replacement&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1441.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-replacement-0.png&quot;,
      &quot;bytes&quot;: 72656,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;19513ac0fe7508262df117eb918c7f179feb5acad43a20c3719cbb43342317c5&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;replacement&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1441.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-replacement-1.png&quot;,
      &quot;bytes&quot;: 85187,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;c784a4d410c0a34df3ddead52a35c7290c5bcf127161d25672c3539d3dbacd77&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;replacement&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1441.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-replacement-2.png&quot;,
      &quot;bytes&quot;: 78542,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;467f6e9094f9557a775a7abc1a0a358d6c656440c62a42f3e1fca264a33e7c1d&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;replacement&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1441.0,
      &quot;maxScrollExtent&quot;: 1441.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-replacement-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;started&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1510.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-started-0.png&quot;,
      &quot;bytes&quot;: 73771,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;614b3dad8a6eaa33f80b995576f124c4e71ed87e2a354d2c040e5d424c4ffc47&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;started&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1510.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-started-1.png&quot;,
      &quot;bytes&quot;: 81187,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;2d0fcbdfbe1267f0c96af94a2ca9e1377e0efc7487a3d8417d7c171df5b46f27&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;started&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1510.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-started-2.png&quot;,
      &quot;bytes&quot;: 77250,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;2af3afacc58b87e3e952b22dbd27d7a1a12ce4e4d7d5ed040d0908627b6674c8&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;started&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1510.0,
      &quot;maxScrollExtent&quot;: 1510.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-started-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;unknown-start&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1510.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-unknown-start-0.png&quot;,
      &quot;bytes&quot;: 73303,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;unknown-start&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1510.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-unknown-start-1.png&quot;,
      &quot;bytes&quot;: 79580,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;940e4db008a459a3c134674b73f8c351ba7a34d71569f0ef80e11ca7b4a51eff&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;unknown-start&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1510.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-unknown-start-2.png&quot;,
      &quot;bytes&quot;: 77250,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;2af3afacc58b87e3e952b22dbd27d7a1a12ce4e4d7d5ed040d0908627b6674c8&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-started-2.png&quot;
    },
    {
      &quot;case&quot;: &quot;unknown-start&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1510.0,
      &quot;maxScrollExtent&quot;: 1510.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-unknown-start-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;renew-started&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1464.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-renew-started-0.png&quot;,
      &quot;bytes&quot;: 72685,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;9521ef4a2b65815c47040c8f3f9e56c07baf0edbd8421b3060ef195b8c4b1aa4&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;renew-started&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1464.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-renew-started-1.png&quot;,
      &quot;bytes&quot;: 84069,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;543e18c5ffb4d9b2d54f0a94f228d13f7e3067b1aaf82c9ba73c5438b7a4553d&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;renew-started&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1464.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-renew-started-2.png&quot;,
      &quot;bytes&quot;: 79177,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;355e848118b729972caebbdc14da4613ee9166f6db5770aa6226441e0f42bf0c&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;renew-started&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1464.0,
      &quot;maxScrollExtent&quot;: 1464.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-renew-started-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;user-fault&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1441.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-user-fault-0.png&quot;,
      &quot;bytes&quot;: 72184,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;c3b260f369f61fec99679fac89c09a618ebad9177c1bd4ecebdedd172a62e6d3&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;user-fault&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1441.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-user-fault-1.png&quot;,
      &quot;bytes&quot;: 85065,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;ed14adfbb20fdc01716f9183ad734921c63712179c46b6c4819661de4d601b2a&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;user-fault&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1441.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-user-fault-2.png&quot;,
      &quot;bytes&quot;: 78542,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;467f6e9094f9557a775a7abc1a0a358d6c656440c62a42f3e1fca264a33e7c1d&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-replacement-2.png&quot;
    },
    {
      &quot;case&quot;: &quot;user-fault&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1441.0,
      &quot;maxScrollExtent&quot;: 1441.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-user-fault-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;held&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-held-0.png&quot;,
      &quot;bytes&quot;: 73303,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-unknown-start-0.png&quot;
    },
    {
      &quot;case&quot;: &quot;held&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-held-1.png&quot;,
      &quot;bytes&quot;: 79806,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;21e1bdba7020bb7054cc17b8f451c99f3753734d7d7ba09936a694aba5bb7a27&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;held&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-held-2.png&quot;,
      &quot;bytes&quot;: 79926,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;0dd6f501e4fac0edacfa99087106831f28a816d307a345f90cb7e736eb8d2ffd&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-2.png&quot;
    },
    {
      &quot;case&quot;: &quot;held&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1487.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-held-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;denied&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-denied-0.png&quot;,
      &quot;bytes&quot;: 72832,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;f4ef3af0f1993dd023ae7126aa2a960c76a20ad6514c92431341b9e03b429166&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;denied&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-denied-1.png&quot;,
      &quot;bytes&quot;: 79806,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;21e1bdba7020bb7054cc17b8f451c99f3753734d7d7ba09936a694aba5bb7a27&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-held-1.png&quot;
    },
    {
      &quot;case&quot;: &quot;denied&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-denied-2.png&quot;,
      &quot;bytes&quot;: 79926,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;0dd6f501e4fac0edacfa99087106831f28a816d307a345f90cb7e736eb8d2ffd&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-2.png&quot;
    },
    {
      &quot;case&quot;: &quot;denied&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1487.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-denied-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;missing&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1181.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-missing-0.png&quot;,
      &quot;bytes&quot;: 80589,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;1300b9f2caec300eec4713b597e16e34c3a0816a4c5df76d8e225c51857b60a3&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;missing&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1181.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-missing-1.png&quot;,
      &quot;bytes&quot;: 77911,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;20f05c857430d1a30dbf96428c0e993ea67289ced0a8727b53fd18890d21a977&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;missing&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1181.0,
      &quot;maxScrollExtent&quot;: 1181.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-missing-2.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;no-read&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1181.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-read-0.png&quot;,
      &quot;bytes&quot;: 80589,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;1300b9f2caec300eec4713b597e16e34c3a0816a4c5df76d8e225c51857b60a3&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-missing-0.png&quot;
    },
    {
      &quot;case&quot;: &quot;no-read&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1181.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-read-1.png&quot;,
      &quot;bytes&quot;: 77911,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;20f05c857430d1a30dbf96428c0e993ea67289ced0a8727b53fd18890d21a977&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-missing-1.png&quot;
    },
    {
      &quot;case&quot;: &quot;no-read&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1181.0,
      &quot;maxScrollExtent&quot;: 1181.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-read-2.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;foreign&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1181.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-foreign-0.png&quot;,
      &quot;bytes&quot;: 80589,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;1300b9f2caec300eec4713b597e16e34c3a0816a4c5df76d8e225c51857b60a3&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-missing-0.png&quot;
    },
    {
      &quot;case&quot;: &quot;foreign&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1181.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-foreign-1.png&quot;,
      &quot;bytes&quot;: 77911,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;20f05c857430d1a30dbf96428c0e993ea67289ced0a8727b53fd18890d21a977&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-missing-1.png&quot;
    },
    {
      &quot;case&quot;: &quot;foreign&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1181.0,
      &quot;maxScrollExtent&quot;: 1181.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-foreign-2.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;stale&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1181.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-stale-0.png&quot;,
      &quot;bytes&quot;: 80589,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;1300b9f2caec300eec4713b597e16e34c3a0816a4c5df76d8e225c51857b60a3&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-missing-0.png&quot;
    },
    {
      &quot;case&quot;: &quot;stale&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1181.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-stale-1.png&quot;,
      &quot;bytes&quot;: 77911,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;20f05c857430d1a30dbf96428c0e993ea67289ced0a8727b53fd18890d21a977&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-missing-1.png&quot;
    },
    {
      &quot;case&quot;: &quot;stale&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1181.0,
      &quot;maxScrollExtent&quot;: 1181.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-stale-2.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;offline&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1545.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-offline-0.png&quot;,
      &quot;bytes&quot;: 74868,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;74b9984ef14fec1524510513b156b244dad8eae37aef4a41623811de28c521e3&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;offline&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1545.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-offline-1.png&quot;,
      &quot;bytes&quot;: 80930,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;56991140486a64147f09def1d48b899004e682cf9d0f8b7877103b95c4d71b3c&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;offline&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1545.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-offline-2.png&quot;,
      &quot;bytes&quot;: 80355,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;fcdf332db9216c8bf1e2076a7113bf2dad940567808e12452a036941f4c858a6&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;offline&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1545.0,
      &quot;maxScrollExtent&quot;: 1545.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-offline-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;busy&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1522.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-busy-0.png&quot;,
      &quot;bytes&quot;: 72726,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;6f906e993160db4b371195278d2c20c793ce9c8f385467725b0e2d8684a05a69&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;busy&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1522.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-busy-1.png&quot;,
      &quot;bytes&quot;: 79519,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;b76ffc49eb7d06487d203cd1e276be70926c192bfe66f6a42586fe089e704be6&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;busy&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1522.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-busy-2.png&quot;,
      &quot;bytes&quot;: 78605,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;9577d92d76078742f918f5a1d29cfe08576719f2680cb388862c400199a25c79&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;busy&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1522.0,
      &quot;maxScrollExtent&quot;: 1522.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-busy-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;error&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1568.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-error-0.png&quot;,
      &quot;bytes&quot;: 73303,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-unknown-start-0.png&quot;
    },
    {
      &quot;case&quot;: &quot;error&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1568.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-error-1.png&quot;,
      &quot;bytes&quot;: 82981,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;f8097c13fddc0ffe4906da24bb9c18a4b36f5da5f874521ee719efa408523733&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;error&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1568.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-error-2.png&quot;,
      &quot;bytes&quot;: 77465,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;ab9ae584f44fb859831f3b97984834ec41af294151b9d48a96d8802f81eea698&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;error&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1568.0,
      &quot;maxScrollExtent&quot;: 1568.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-error-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;received&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1545.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-received-0.png&quot;,
      &quot;bytes&quot;: 73303,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-unknown-start-0.png&quot;
    },
    {
      &quot;case&quot;: &quot;received&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1545.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-received-1.png&quot;,
      &quot;bytes&quot;: 81554,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;c182e7e1acbdba54c062a921a46f1ea82833397d8d58dcc667ac828de29a82a0&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;received&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1545.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-received-2.png&quot;,
      &quot;bytes&quot;: 80355,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;fcdf332db9216c8bf1e2076a7113bf2dad940567808e12452a036941f4c858a6&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-offline-2.png&quot;
    },
    {
      &quot;case&quot;: &quot;received&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1545.0,
      &quot;maxScrollExtent&quot;: 1545.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-received-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;no-handler&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-handler-0.png&quot;,
      &quot;bytes&quot;: 73848,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;864d5b8656b6060e61c82bc5be4d269a89a6e0fdbd5f4a0ce3c9dd060335e229&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;no-handler&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-handler-1.png&quot;,
      &quot;bytes&quot;: 79774,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;af00b2367ee62201c528efd0b54682f6e6f07cdb24ab3ca7b7a45259ac9569d6&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;no-handler&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-handler-2.png&quot;,
      &quot;bytes&quot;: 79827,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;6f7a8f9172d65e43b9a664119a3a8b6ef39f8e4e539c05bad4bed6657a160d90&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;no-handler&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1487.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-handler-3.png&quot;,
      &quot;bytes&quot;: 68741,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;d74addeba4afe69c012c3039684a426350c55b9712a9e17f306a77aab25f7558&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;no-intent&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-intent-0.png&quot;,
      &quot;bytes&quot;: 73303,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-unknown-start-0.png&quot;
    },
    {
      &quot;case&quot;: &quot;no-intent&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-intent-1.png&quot;,
      &quot;bytes&quot;: 79806,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;21e1bdba7020bb7054cc17b8f451c99f3753734d7d7ba09936a694aba5bb7a27&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-held-1.png&quot;
    },
    {
      &quot;case&quot;: &quot;no-intent&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-intent-2.png&quot;,
      &quot;bytes&quot;: 79926,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;0dd6f501e4fac0edacfa99087106831f28a816d307a345f90cb7e736eb8d2ffd&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-2.png&quot;
    },
    {
      &quot;case&quot;: &quot;no-intent&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1487.0,
      &quot;maxScrollExtent&quot;: 1487.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-intent-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;no-account-read&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1591.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-account-read-0.png&quot;,
      &quot;bytes&quot;: 73791,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;d31f475f40e37d7d1172849290f851cc5fb7e3d70c2879b153765ab766cd31a2&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-0.png&quot;
    },
    {
      &quot;case&quot;: &quot;no-account-read&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1591.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-account-read-1.png&quot;,
      &quot;bytes&quot;: 79900,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;a782b01eeb98a95f3c1bafd33d8edac3db75e29b142b7c796bd56a998465dbec&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-1.png&quot;
    },
    {
      &quot;case&quot;: &quot;no-account-read&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1591.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-account-read-2.png&quot;,
      &quot;bytes&quot;: 84088,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;a6310a60d6c2827e66ff012aa1538ba08a6a97496c327223028dbd27613faa30&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;no-account-read&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1591.0,
      &quot;maxScrollExtent&quot;: 1591.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-no-account-read-3.png&quot;,
      &quot;bytes&quot;: 68814,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;5b3152944003a2532c1ec3498c3efaeadd256c18ab8372cc89bc38878c86bbed&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;long&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 1717.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-long-0.png&quot;,
      &quot;bytes&quot;: 79005,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;6f1100c52bb0bd32a89c690829ce00df50f557ad9533a8fcfc096f1a21a45fbc&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;long&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 1717.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-long-1.png&quot;,
      &quot;bytes&quot;: 78490,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;5263481965b9e6e33715ee420252d466e7b5829ffc419869155222dcf89d0d4f&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;long&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 1717.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-long-2.png&quot;,
      &quot;bytes&quot;: 74543,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;e707daafd024b89fc895aac7cb80af7eddc3515a94a00a6d1e0f546a0bd86462&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;long&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 1.0,
      &quot;offset&quot;: 1717.0,
      &quot;maxScrollExtent&quot;: 1717.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-long-3.png&quot;,
      &quot;bytes&quot;: 68877,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-0.png&quot;,
      &quot;bytes&quot;: 31123,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;c2e3366dd6822e95b1c1ec13db0bb7de0c7d7c0a68ccf76b14f83512c5b9a9e2&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-1.png&quot;,
      &quot;bytes&quot;: 43921,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;c33dab4cd4475678c93dec98d927083271063298142af11e0700f63d40de7cef&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-2.png&quot;,
      &quot;bytes&quot;: 46201,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;07d90088e1709c00a39cc083caac83a71acae4d6a8e24047c74bc4377b7bce21&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 1800.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-3.png&quot;,
      &quot;bytes&quot;: 39247,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;f9f71dae050319e1a1ef43bd89074d0b8b74525edf39594fb78ec28391cacf5b&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 4,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 2400.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-4.png&quot;,
      &quot;bytes&quot;: 42137,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;e99f6adeba44d6825f8c62c1e21d54243878f6334380f4be2d88105be1e80328&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 5,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 3000.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-5.png&quot;,
      &quot;bytes&quot;: 37233,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;f43df6121e325c6cb7fb827d9942079c423f7c181b5abf9757478387db254f11&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 6,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 3600.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-6.png&quot;,
      &quot;bytes&quot;: 35616,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;3f08f2976146902987d79dd19683ba864f21b3dbb27a1c95eb7ed0c464f9690f&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 7,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 4200.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-7.png&quot;,
      &quot;bytes&quot;: 42004,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;60c9cd2206c51f999f22944b9fa631789b4aa840fad9a688be71a6d9f98d536a&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 8,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 4800.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-8.png&quot;,
      &quot;bytes&quot;: 46666,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;a3a2c97ec3228a5f5b1e2f6a2f8ebd1b15e2d582a507ae07d9250705587ab6f2&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 9,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 5400.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-9.png&quot;,
      &quot;bytes&quot;: 41901,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;3a508df46c5685cec9e056c62e2be9501ffc4d94e62c071c4237a2259a8653c7&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 10,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 6000.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-10.png&quot;,
      &quot;bytes&quot;: 45136,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;d565df39cef3303f78030611a0db289a246c9d26688b5af6c246c4d2931e70bf&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 11,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 6600.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-11.png&quot;,
      &quot;bytes&quot;: 55368,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;22f0825c4774b5aaf6a555e7394de0c66114f82a1efe75552023871a1ce8cbd8&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 12,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 7200.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-12.png&quot;,
      &quot;bytes&quot;: 43875,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;78683018b650f8eda8cb74e7da656e81c9c812c63a2755e7bb23d891bf1d61dc&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 13,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 7800.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-13.png&quot;,
      &quot;bytes&quot;: 43241,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;3e2a0f9d08f26119069e239ad208401e081ee7c1722207a5145d39a9f11033de&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 14,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 8400.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-14.png&quot;,
      &quot;bytes&quot;: 42165,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;157aea454275a0454a57d59bf4d4082a3a973542884113f623736b01c3e48a55&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 15,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 9000.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-15.png&quot;,
      &quot;bytes&quot;: 42701,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;d43d1c2ad02053ce40d2051b3a97c4cb8a32b13d876ff6dc7ffde0070dcdb7ea&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 16,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 9600.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-16.png&quot;,
      &quot;bytes&quot;: 46159,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;c66d905ea58b6f41fd87f2d9a04efa0399815f0de03162efb9d503e97455b304&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 17,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 10200.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-17.png&quot;,
      &quot;bytes&quot;: 49403,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;3c7ec6dbd8d9e9a58fcd0c4888dc3455a2f315a2ff9408594456e18421d50592&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 18,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 10800.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-18.png&quot;,
      &quot;bytes&quot;: 50500,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;1d7b2289e3315719825689065bcb2afe7383ec91dd99a9faae443e73d0cc27cc&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 19,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 11400.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-19.png&quot;,
      &quot;bytes&quot;: 43806,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;00025e40b7ee076dd84ec83f916dda6d9402e7abfa07b485303fea5238c5ee7e&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 20,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 12000.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-20.png&quot;,
      &quot;bytes&quot;: 50605,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;40c41e7546f69907a4b6d882c8841d872e9f507c95c67a92236959dd9c925d76&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 21,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 12600.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-21.png&quot;,
      &quot;bytes&quot;: 51951,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;86d69b77a4b4816a594cf1a081c40e429820c383ef6b0e34684231450a8ec823&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 22,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 13200.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-22.png&quot;,
      &quot;bytes&quot;: 51431,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;a0c04e073c4c7251f6e589f3c723f33752a654c9dd62a2aa1434446e37bd15d1&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-correction&quot;,
      &quot;index&quot;: 23,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 13274.0,
      &quot;maxScrollExtent&quot;: 13274.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-correction-23.png&quot;,
      &quot;bytes&quot;: 49938,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;3e4bdd98a677bcbb66503c554984a358724afb09661127757992c80ae81de115&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 0,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 0.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-0.png&quot;,
      &quot;bytes&quot;: 42917,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;7810abfa526b6b52bfef245bbf018bab2bb72e070b6ee634a153ff4ae3871c53&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 1,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 600.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-1.png&quot;,
      &quot;bytes&quot;: 48074,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;49265f82911b4d4f4c0210ac7c6d02fbbe61e7a8dd54392e01c07b90b24a834f&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 2,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 1200.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-2.png&quot;,
      &quot;bytes&quot;: 40336,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;b1b531736c99e8fef1a08370aeee150fc749d49fe7ece7618aa7e62a18e34bc6&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 3,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 1800.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-3.png&quot;,
      &quot;bytes&quot;: 40240,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;754b68c85fb19f92a68cee7b427c1925c18e02dca09bf66daff6afb5fcd673e4&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 4,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 2400.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-4.png&quot;,
      &quot;bytes&quot;: 36482,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;181e44ee2b4fc3e06e2b3e82718ad73ff4c0519f0c8763fbf7dd7f5ecead06d6&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 5,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 3000.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-5.png&quot;,
      &quot;bytes&quot;: 34064,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;c0118fdf2a3661dc23dde795b7dc301af8947a343e43957fbf14b565850f9cae&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 6,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 3600.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-6.png&quot;,
      &quot;bytes&quot;: 41254,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;978f5e8960e2def8f72c0a66f1376bde2e2eacb8e8f721038bad5b35db8f3055&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 7,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 4200.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-7.png&quot;,
      &quot;bytes&quot;: 45581,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;8316a6f0d180fcb84cb29b9b38c2c0e2a920614ad2eaa55c43068005812f46c4&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 8,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 4800.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-8.png&quot;,
      &quot;bytes&quot;: 43445,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;68eb04c1516ec73826e7ac33cc275de5012cc7292b010256cb43647afa4988bd&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 9,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 5400.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-9.png&quot;,
      &quot;bytes&quot;: 44948,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;084a4d868f218431b94cdcb9875e730123f1aa5cf5d0333c7494db0af543e257&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 10,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 6000.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-10.png&quot;,
      &quot;bytes&quot;: 47524,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;ce0c49bbf4b174f6ac186af344eda5b033e1062d2984454b2565c832843d8774&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 11,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 6600.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-11.png&quot;,
      &quot;bytes&quot;: 45272,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;eacd7e30fe416d6dc93023cc827af8648dec3b4198d6a45200c4e6f6b74d7284&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 12,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 7200.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-12.png&quot;,
      &quot;bytes&quot;: 42940,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;7f8c9c5d74000810851b41ea0e2c422f6335cedc5ee6c2fe718fa4ec03f11388&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 13,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 7800.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-13.png&quot;,
      &quot;bytes&quot;: 42717,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;9c6fd77b2ad1e608d8b0095f4a788a56bf63c9718770e4c6a204572cfc52b3a6&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 14,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 8400.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-14.png&quot;,
      &quot;bytes&quot;: 45414,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;ffb50ba86e2c97d116a2880481cb860a54614038e0c0bdb2089bd5c0465a3418&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 15,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 9000.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-15.png&quot;,
      &quot;bytes&quot;: 42907,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;3cc6f8c13eb98869cc75c3997f1f1b742b89b273d65feb460a0c7905e72849d2&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 16,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 9600.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-16.png&quot;,
      &quot;bytes&quot;: 48056,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;4fb8c9bd67d640f15149a041ccf3768a3268ca8f0807014214f73772b94fd870&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 17,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 10200.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-17.png&quot;,
      &quot;bytes&quot;: 51737,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;25b4f041279cb158f88247bcb3093ec1dfb86f3954edff2d02ec477acb60f80c&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 18,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 10800.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-18.png&quot;,
      &quot;bytes&quot;: 45491,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;2d04802005a834ba27b7e8502cd171e49eb1984d15639a5a0a5dfdea391e46b3&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 19,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 11400.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-19.png&quot;,
      &quot;bytes&quot;: 46977,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;3eb849e0b5729db07a545e5e08af28f76541ebb7907f38f68f8159b1c3572b01&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 20,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 12000.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-20.png&quot;,
      &quot;bytes&quot;: 52087,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;63b807af8ea9d852d4ead82043cd0f516731c41bb8047ff2bf5099d878a21cc8&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 21,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 12600.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-21.png&quot;,
      &quot;bytes&quot;: 48344,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;4f5995fbde23a1dcb144c96ebea5de072a889dd7a99d899eb89d857e63766d33&quot;,
      &quot;aliasOf&quot;: null
    },
    {
      &quot;case&quot;: &quot;large-replacement&quot;,
      &quot;index&quot;: 22,
      &quot;scale&quot;: 3.0,
      &quot;offset&quot;: 12857.0,
      &quot;maxScrollExtent&quot;: 12857.0,
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4/native-r3-large-replacement-22.png&quot;,
      &quot;bytes&quot;: 49938,
      &quot;width&quot;: 390,
      &quot;height&quot;: 844,
      &quot;sha256&quot;: &quot;3e4bdd98a677bcbb66503c554984a358724afb09661127757992c80ae81de115&quot;,
      &quot;aliasOf&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-23.png&quot;
    }
  ]
}</pre>

root-native-r4-read.json 19336 bayt SHA256 9d4829443d36a22b9d6457da6d757d94711c254ce06b702d33351ad82f157a7f

<pre>{
  &quot;stage&quot;: &quot;native-r4&quot;,
  &quot;allCurrentUniqueCovered&quot;: true,
  &quot;openedNewOriginal&quot;: 50,
  &quot;coveredByPriorActualRead&quot;: 35,
  &quot;totalCurrentUnique&quot;: 85,
  &quot;frames&quot;: 123,
  &quot;aliases&quot;: 38,
  &quot;actuallyOpenedNewOriginal&quot;: [
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-replacement-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-started-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-started-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-unknown-start-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-renew-started-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-user-fault-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-held-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-missing-0.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-missing-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-offline-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-offline-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-busy-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-busy-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-error-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-error-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-received-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-no-handler-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-no-handler-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-no-account-read-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-long-1.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-long-2.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-9.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-10.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-11.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-12.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-13.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-14.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-15.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-16.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-17.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-18.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-19.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-20.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-21.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-22.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-9.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-10.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-11.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-12.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-13.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-14.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-15.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-16.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-17.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-18.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-19.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-20.png&quot;,
    &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-21.png&quot;
  ],
  &quot;fullByteMappings&quot;: [
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-0.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-correction-0.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;d31f475f40e37d7d1172849290f851cc5fb7e3d70c2879b153765ab766cd31a2&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-correction-3.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-correction-3.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;75c6018030468477fb6fd08e72f9b446bbf0cbc5067a23ef0b3c5eb938f378e9&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-replacement-0.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-replacement-0.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;19513ac0fe7508262df117eb918c7f179feb5acad43a20c3719cbb43342317c5&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-replacement-2.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-offline-2.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;467f6e9094f9557a775a7abc1a0a358d6c656440c62a42f3e1fca264a33e7c1d&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-started-0.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-started-0.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;614b3dad8a6eaa33f80b995576f124c4e71ed87e2a354d2c040e5d424c4ffc47&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-unknown-start-0.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-unknown-start-0.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;7da93556c59e5bffe6251042523efe6f0bff7dd87e51163c77b9a456e3957c61&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-renew-started-0.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-renew-started-0.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;9521ef4a2b65815c47040c8f3f9e56c07baf0edbd8421b3060ef195b8c4b1aa4&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-renew-started-2.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-error-2.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;355e848118b729972caebbdc14da4613ee9166f6db5770aa6226441e0f42bf0c&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-user-fault-0.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-user-fault-0.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;c3b260f369f61fec99679fac89c09a618ebad9177c1bd4ecebdedd172a62e6d3&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-denied-0.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-denied-0.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;f4ef3af0f1993dd023ae7126aa2a960c76a20ad6514c92431341b9e03b429166&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-offline-0.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-offline-0.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;74b9984ef14fec1524510513b156b244dad8eae37aef4a41623811de28c521e3&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-busy-0.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-busy-0.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;6f906e993160db4b371195278d2c20c793ce9c8f385467725b0e2d8684a05a69&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-no-handler-0.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-no-handler-0.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;864d5b8656b6060e61c82bc5be4d269a89a6e0fdbd5f4a0ce3c9dd060335e229&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-no-handler-3.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-no-handler-3.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;d74addeba4afe69c012c3039684a426350c55b9712a9e17f306a77aab25f7558&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-no-account-read-3.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-no-account-read-3.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;5b3152944003a2532c1ec3498c3efaeadd256c18ab8372cc89bc38878c86bbed&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-long-0.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-long-0.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;6f1100c52bb0bd32a89c690829ce00df50f557ad9533a8fcfc096f1a21a45fbc&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-0.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-0.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;c2e3366dd6822e95b1c1ec13db0bb7de0c7d7c0a68ccf76b14f83512c5b9a9e2&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-1.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-1.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;c33dab4cd4475678c93dec98d927083271063298142af11e0700f63d40de7cef&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-2.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-2.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;07d90088e1709c00a39cc083caac83a71acae4d6a8e24047c74bc4377b7bce21&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-3.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-3.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;f9f71dae050319e1a1ef43bd89074d0b8b74525edf39594fb78ec28391cacf5b&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-4.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-4.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;e99f6adeba44d6825f8c62c1e21d54243878f6334380f4be2d88105be1e80328&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-5.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-5.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;f43df6121e325c6cb7fb827d9942079c423f7c181b5abf9757478387db254f11&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-6.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-6.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;3f08f2976146902987d79dd19683ba864f21b3dbb27a1c95eb7ed0c464f9690f&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-7.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-7.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;60c9cd2206c51f999f22944b9fa631789b4aa840fad9a688be71a6d9f98d536a&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-8.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-8.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;a3a2c97ec3228a5f5b1e2f6a2f8ebd1b15e2d582a507ae07d9250705587ab6f2&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-correction-23.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-correction-21.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;3e4bdd98a677bcbb66503c554984a358724afb09661127757992c80ae81de115&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-0.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-0.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;7810abfa526b6b52bfef245bbf018bab2bb72e070b6ee634a153ff4ae3871c53&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-1.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-1.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;49265f82911b4d4f4c0210ac7c6d02fbbe61e7a8dd54392e01c07b90b24a834f&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-2.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-2.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;b1b531736c99e8fef1a08370aeee150fc749d49fe7ece7618aa7e62a18e34bc6&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-3.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-3.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;754b68c85fb19f92a68cee7b427c1925c18e02dca09bf66daff6afb5fcd673e4&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-4.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-4.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;181e44ee2b4fc3e06e2b3e82718ad73ff4c0519f0c8763fbf7dd7f5ecead06d6&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-5.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-5.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;c0118fdf2a3661dc23dde795b7dc301af8947a343e43957fbf14b565850f9cae&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-6.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-6.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;978f5e8960e2def8f72c0a66f1376bde2e2eacb8e8f721038bad5b35db8f3055&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-7.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-7.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;8316a6f0d180fcb84cb29b9b38c2c0e2a920614ad2eaa55c43068005812f46c4&quot;
    },
    {
      &quot;file&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r4\\native-r3-large-replacement-8.png&quot;,
      &quot;priorActuallyCoveredOriginal&quot;: &quot;C:\\Users\\Xpike\\.codex\\task-state\\kavriva-e1025\\native-r3\\native-r3-large-replacement-8.png&quot;,
      &quot;fullByteEqual&quot;: true,
      &quot;sha256&quot;: &quot;68eb04c1516ec73826e7ac33cc275de5012cc7292b010256cb43647afa4988bd&quot;
    }
  ],
  &quot;sourceDigests&quot;: {
    &quot;modules/e01-app/internal/shell/lib/replacement_right.dart&quot;: &quot;9f3e132b8905c11ca06a6c44de8ef2778e45f4a4bcd9a9f1a3f441fab8bcc475&quot;,
    &quot;modules/e01-app/internal/shell/test/replacement_right_test.dart&quot;: &quot;a87d6e2987d00d93a5141ff6587f718ec52e883bf7057f81fcb59cf517952601&quot;,
    &quot;modules/e01-app/internal/shell/test/fixtures/replacement_right_reading_questions.json&quot;: &quot;c9aa588599797fbdcd114f14f932abf3d7263be0e298ab938968092b39d471c0&quot;
  },
  &quot;note&quot;: &quot;Root actually opened all 50 new originals with view_image original in this turn. Remaining 35 full-byte equal to R3 images covered by prior actual original reading. Native R4 directory retains native-r3 capture filenames; distinct full paths identify current captures. No image altered.&quot;
}</pre>

## Yeni bağımsız kör ilk okuma

CODE b2ebe5e466a6f87ba2e9ff8b155b94258882d1ba üzerinde geçmişsiz /root/e1025_blind_r3; istenen gpt-6-luna/max; yalnız doğal123PNG/85özgün/38tamalias ve kodöncesi20soru okumasına sınırlıPASS. Root tamamlandı bildirimi ardından özgün tam raporu okuyup bayt/SHA doğruladı. Çalışanmodelruntimeattestation unavailable; insan/cihaz/üretim veya bütünSOURCE kabulü değildir. Yerel482/native10/56format0/analyze0/graph42worst0/index116;36responsive/22durum;Root50yeniOriginal+35öncedenGerçektenAçılmışFullByteEş. R1başlıkRET/harnessFAIL/graphR1linkFAIL, körR1Q17-Q18 RET ve körR2Q11 BELİRSİZ ile ek raporu korunur. Yeni körR3 sabit20 okuması güncel R4 görüntülerini bağımsız değerlendirir; eski hükümler değiştirilmez. Yeni bütünSOURCE/aynıCI-T3/ayrıFINAL/main8 beklenir; gerçek112/94/206 ve üstkapılarHELD.

Özgün 5509 bayt/SHA256 89116b5bf70481d6985edefc5d4df6e2ea1f6b581721ab7b33bb14a5d7579847.

<pre>Kavriva E1025 — Kör arayüz ilk okuması (R3)
Tarih: 2026-10-17

KAPSAM VE YÖNTEM
Yalnızca kullanıcı tarafından izin verilen sabit soru fixture&#x27;ı, native-r4 manifesti, native-r4 proof dosyası, unique-images-native-r4 listesi ve bu listelerdeki PNG dosyaları incelendi. Üretici kodu, diğer repo dosyaları, planlar, önceki incelemeler ve Git okunmadı; test çalıştırılmadı. Bu, verilen örnek arayüzün görsel okunabilirlik değerlendirmesidir. Canlı üretim kararı veya yetki doğrulaması değildir.

Model attestasyonu: Bu alt iş bağlamı çalışan modelin tam runtime etiketini doğrulamaya yarayan metadata sunmuyor. Bu nedenle incelemenin istenen gpt-6-luna/max modeli tarafından yapıldığını bağımsız olarak attest edemiyorum; aşağıdaki sonuç mevcut işçi oturumunun görsel okumasıdır.

GÖRSEL DOSYA VE KAYDIRMA KONTROLLERİ
- Sabit 20 soruluk fixture SHA-256: c9aa588599797fbdcd114f14f932abf3d7263be0e298ab938968092b39d471c0; beyan edilen sabit hash ile eşleşti.
- Manifest ve proof: 22 durum, 123 kare; manifest kare metadatası proof girdileriyle eşleşti.
- Proof&#x27;taki 123 PNG&#x27;nin gerçek byte uzunlukları ve SHA-256 değerleri proof ile eşleşti; tüm dosyaların PNG IHDR boyutu 390×844.
- 85 özgün PNG listesi 85 farklı SHA-256 verdi ve proof&#x27;taki girdilerle eşleşti. 38 alias eşinin dosya byte&#x27;ları birebir eşit.
- Her 22 durum için kaydırma 0&#x27;dan başlıyor, kesin artıyor, en fazla 600 px adım atıyor ve bildirilen maxScrollExtent değerinde bitiyor. Kare yüksekliği 844 px olduğundan ardışık kareler arasında en az 244 px geometrik örtüşme var.
- Unique listesinde yer alan 85 özgün PNG&#x27;nin tamamı view_image ile original ayrıntı seviyesinde açıldı. Görüntüler dönüştürülmedi.

SABİT 20 SORU — BAĞIMSIZ GÖRSEL HÜKÜMLER

1. PASS — Örnek motosiklet, örnek seçili rehber ve sürüm değerleri açık etiketlerle ayrılıyor: “Örnek motosiklet · gerçek karar değildir”, “Örnek rehber”, guide-v1 ve sel-r1. Bunların örnek/teknik olmayan bağlam olduğu da yazıyor.
2. PASS — Yanlış rehberi düzeltme ile rehber kullanılamaz olduğunda yeniden seçim ayrı başlık ve düğmelerle sunuluyor; genel metin iki durumu ayırıyor.
3. PASS — Yanlış seçim düzeltmesinin ilk fiziksel adımdan önce yapılabileceği açıkça yazıyor.
4. PASS — Başlangıç durumu bilinmiyorsa veya işe başlanmışsa düzeltmenin açılmayacağı belirtiliyor; unknown-start görünümünde ilgili eylem kapalı.
5. PASS — Kullanıcı hatası olmadan rehber geri çekilirse yeniden seçimin sunucu kararına bağlı olduğu ve kendiliğinden yenilenmediği yazıyor.
6. PASS — Örnek karar, kaynak, karar sürümü, kaynak konumu ve kontrol zamanı ayrı ayrı etiketli; kaynak ile zamanın örnek olduğu belli.
7. PASS — Düğmenin yalnızca sunucudan değerlendirme istediği; hak vermediği ve seçili rehberi değiştirmediği açık.
8. PASS — Motosiklet değiştirmenin veya rehberi tamamlamanın yeni ücretsiz seçim hakkı üretmediği yazıyor.
9. PASS — Tam rehber hakkının aynı anda tek seçili motosiklette olduğu, motosiklet değişince taşındığı ve üst üste eklenmediği anlaşılır.
10. PASS — Kesin süre, seçim sıklığı ve ücret koşullarının belirlenmediği açıkça söyleniyor.
11. PASS — Güncel sunucu kontrolü/izin yokken seçim isteği kapalı; offline ve eksik bilgi ekranlarında eylem düğmesi devre dışı ve nedeni açıklanmış.
12. PASS — Okuma izni doğrulanamadığında özel motosiklet ve rehber ayrıntılarının gösterilmediği yazıyor.
13. PASS — Eski işlem kaydının, kullanılan rehber sürümünün ve güvenlik düzeltmelerinin yeni seçimle silinmediği belirtiliyor.
14. PASS — Geçmiş, kanıt/kaynak, düzeltme/itiraz ve dışa aktarma yolları görünür. Metin bunların satın almaya bağlı olmadığını, her yolun yine okuma izni gerektirdiğini söylüyor.
15. PASS — Kritik güvenlik bilgisi ve başlanmış işin güvenli dönüşü ayrı düğmeler. Yeni seçim kararının bu erişimleri veya işi sürdürme iznini vermediği belirtiliyor.
16. PASS — Rehber hakkının bakımın doğru veya motosikletin sürüşe güvenli olduğunu kanıtlamadığı; fiziksel uygunluğun ayrıca değerlendirileceği açık.
17. PASS — Kontrol sürerken yeni istek gönderilmediği yazıyor ve düğme kapalı. Hata ekranı yeni seçim isteğinin gönderilmediğini, seçimin değişmiş sayılmadığını söylüyor; işleyici olmayan ekranda da istek düğmesi kapalı.
18. PASS — Başka hesap, motosiklet veya rehbere ait kararın bu seçimde kullanılamayacağı açıkça yazıyor.
19. PASS — Uzun açıklama ve 3× metin boyutundaki iki akışın 0→maxScrollExtent kareleri açıldı. Metin ve son eylemler aşağı kaydırmayla erişiliyor; ekran boyu adımları örtüşüyor. Çok büyük başlıklarda sözcük içi satır bölünmesi (ör. “düzeltme”) görsel olarak biraz pürüzlü, ancak karakter veya düğme metni kırpılmıyor.
20. PASS — Son bölümde “Garaja dön” ve “Destek seçenekleri” açıkça adlandırılmış; en son kaydırma karelerinde ikisi de erişilebilir.

GENEL HÜKÜM
PASS — Yalnızca örnek arayüzün okunabilirliği için. Örnek bağlamı, örnek kaynak, karar/kılavuz/seçim sürümleri ve örnek zaman görünür biçimde etiketlenmiş. Bu hüküm canlı üretim verisi veya otoritesi hakkında çıkarım değildir.</pre>

RAW Base64: S2F2cml2YSBFMTAyNSDigJQgS8O2ciBhcmF5w7x6IGlsayBva3VtYXPEsSAoUjMpClRhcmloOiAyMDI2LTEwLTE3CgpLQVBTQU0gVkUgWcOWTlRFTQpZYWxuxLF6Y2Ega3VsbGFuxLFjxLEgdGFyYWbEsW5kYW4gaXppbiB2ZXJpbGVuIHNhYml0IHNvcnUgZml4dHVyZSfEsSwgbmF0aXZlLXI0IG1hbmlmZXN0aSwgbmF0aXZlLXI0IHByb29mIGRvc3lhc8SxLCB1bmlxdWUtaW1hZ2VzLW5hdGl2ZS1yNCBsaXN0ZXNpIHZlIGJ1IGxpc3RlbGVyZGVraSBQTkcgZG9zeWFsYXLEsSBpbmNlbGVuZGkuIMOccmV0aWNpIGtvZHUsIGRpxJ9lciByZXBvIGRvc3lhbGFyxLEsIHBsYW5sYXIsIMO2bmNla2kgaW5jZWxlbWVsZXIgdmUgR2l0IG9rdW5tYWTEsTsgdGVzdCDDp2FsxLHFn3TEsXLEsWxtYWTEsS4gQnUsIHZlcmlsZW4gw7ZybmVrIGFyYXnDvHrDvG4gZ8O2cnNlbCBva3VuYWJpbGlybGlrIGRlxJ9lcmxlbmRpcm1lc2lkaXIuIENhbmzEsSDDvHJldGltIGthcmFyxLEgdmV5YSB5ZXRraSBkb8SfcnVsYW1hc8SxIGRlxJ9pbGRpci4KCk1vZGVsIGF0dGVzdGFzeW9udTogQnUgYWx0IGnFnyBiYcSfbGFtxLEgw6dhbMSxxZ9hbiBtb2RlbGluIHRhbSBydW50aW1lIGV0aWtldGluaSBkb8SfcnVsYW1heWEgeWFyYXlhbiBtZXRhZGF0YSBzdW5tdXlvci4gQnUgbmVkZW5sZSBpbmNlbGVtZW5pbiBpc3RlbmVuIGdwdC02LWx1bmEvbWF4IG1vZGVsaSB0YXJhZsSxbmRhbiB5YXDEsWxkxLHEn8SxbsSxIGJhxJ/EsW1zxLF6IG9sYXJhayBhdHRlc3QgZWRlbWl5b3J1bTsgYcWfYcSfxLFkYWtpIHNvbnXDpyBtZXZjdXQgacWfw6dpIG90dXJ1bXVudW4gZ8O2cnNlbCBva3VtYXPEsWTEsXIuCgpHw5ZSU0VMIERPU1lBIFZFIEtBWURJUk1BIEtPTlRST0xMRVLEsAotIFNhYml0IDIwIHNvcnVsdWsgZml4dHVyZSBTSEEtMjU2OiBjOWFhNTg4NTk5Nzk3ZmJkY2QxMTRmMTRmOTMyYWJmM2Q3MjYzYmUwZTI5OGFiOTM4OTY4MDkyYjM5ZDQ3MWMwOyBiZXlhbiBlZGlsZW4gc2FiaXQgaGFzaCBpbGUgZcWfbGXFn3RpLgotIE1hbmlmZXN0IHZlIHByb29mOiAyMiBkdXJ1bSwgMTIzIGthcmU7IG1hbmlmZXN0IGthcmUgbWV0YWRhdGFzxLEgcHJvb2YgZ2lyZGlsZXJpeWxlIGXFn2xlxZ90aS4KLSBQcm9vZid0YWtpIDEyMyBQTkcnbmluIGdlcsOnZWsgYnl0ZSB1enVubHVrbGFyxLEgdmUgU0hBLTI1NiBkZcSfZXJsZXJpIHByb29mIGlsZSBlxZ9sZcWfdGk7IHTDvG0gZG9zeWFsYXLEsW4gUE5HIElIRFIgYm95dXR1IDM5MMOXODQ0LgotIDg1IMO2emfDvG4gUE5HIGxpc3Rlc2kgODUgZmFya2zEsSBTSEEtMjU2IHZlcmRpIHZlIHByb29mJ3Rha2kgZ2lyZGlsZXJsZSBlxZ9sZcWfdGkuIDM4IGFsaWFzIGXFn2luaW4gZG9zeWEgYnl0ZSdsYXLEsSBiaXJlYmlyIGXFn2l0LgotIEhlciAyMiBkdXJ1bSBpw6dpbiBrYXlkxLFybWEgMCdkYW4gYmHFn2zEsXlvciwga2VzaW4gYXJ0xLF5b3IsIGVuIGZhemxhIDYwMCBweCBhZMSxbSBhdMSxeW9yIHZlIGJpbGRpcmlsZW4gbWF4U2Nyb2xsRXh0ZW50IGRlxJ9lcmluZGUgYml0aXlvci4gS2FyZSB5w7xrc2VrbGnEn2kgODQ0IHB4IG9sZHXEn3VuZGFuIGFyZMSxxZ/EsWsga2FyZWxlciBhcmFzxLFuZGEgZW4gYXogMjQ0IHB4IGdlb21ldHJpayDDtnJ0w7zFn21lIHZhci4KLSBVbmlxdWUgbGlzdGVzaW5kZSB5ZXIgYWxhbiA4NSDDtnpnw7xuIFBORyduaW4gdGFtYW3EsSB2aWV3X2ltYWdlIGlsZSBvcmlnaW5hbCBheXLEsW50xLEgc2V2aXllc2luZGUgYcOnxLFsZMSxLiBHw7Zyw7xudMO8bGVyIGTDtm7DvMWfdMO8csO8bG1lZGkuCgpTQULEsFQgMjAgU09SVSDigJQgQkHEnklNU0laIEfDllJTRUwgSMOcS8OcTUxFUgoKMS4gUEFTUyDigJQgw5ZybmVrIG1vdG9zaWtsZXQsIMO2cm5layBzZcOnaWxpIHJlaGJlciB2ZSBzw7xyw7xtIGRlxJ9lcmxlcmkgYcOnxLFrIGV0aWtldGxlcmxlIGF5csSxbMSxeW9yOiDigJzDlnJuZWsgbW90b3Npa2xldCDCtyBnZXLDp2VrIGthcmFyIGRlxJ9pbGRpcuKAnSwg4oCcw5ZybmVrIHJlaGJlcuKAnSwgZ3VpZGUtdjEgdmUgc2VsLXIxLiBCdW5sYXLEsW4gw7ZybmVrL3Rla25payBvbG1heWFuIGJhxJ9sYW0gb2xkdcSfdSBkYSB5YXrEsXlvci4KMi4gUEFTUyDigJQgWWFubMSxxZ8gcmVoYmVyaSBkw7x6ZWx0bWUgaWxlIHJlaGJlciBrdWxsYW7EsWxhbWF6IG9sZHXEn3VuZGEgeWVuaWRlbiBzZcOnaW0gYXlyxLEgYmHFn2zEsWsgdmUgZMO8xJ9tZWxlcmxlIHN1bnVsdXlvcjsgZ2VuZWwgbWV0aW4gaWtpIGR1cnVtdSBhecSxcsSxeW9yLgozLiBQQVNTIOKAlCBZYW5sxLHFnyBzZcOnaW0gZMO8emVsdG1lc2luaW4gaWxrIGZpemlrc2VsIGFkxLFtZGFuIMO2bmNlIHlhcMSxbGFiaWxlY2XEn2kgYcOnxLFrw6dhIHlhesSxeW9yLgo0LiBQQVNTIOKAlCBCYcWfbGFuZ8Sxw6cgZHVydW11IGJpbGlubWl5b3JzYSB2ZXlhIGnFn2UgYmHFn2xhbm3EscWfc2EgZMO8emVsdG1lbmluIGHDp8SxbG1heWFjYcSfxLEgYmVsaXJ0aWxpeW9yOyB1bmtub3duLXN0YXJ0IGfDtnLDvG7DvG3DvG5kZSBpbGdpbGkgZXlsZW0ga2FwYWzEsS4KNS4gUEFTUyDigJQgS3VsbGFuxLFjxLEgaGF0YXPEsSBvbG1hZGFuIHJlaGJlciBnZXJpIMOnZWtpbGlyc2UgeWVuaWRlbiBzZcOnaW1pbiBzdW51Y3Uga2FyYXLEsW5hIGJhxJ9sxLEgb2xkdcSfdSB2ZSBrZW5kaWxpxJ9pbmRlbiB5ZW5pbGVubWVkacSfaSB5YXrEsXlvci4KNi4gUEFTUyDigJQgw5ZybmVrIGthcmFyLCBrYXluYWssIGthcmFyIHPDvHLDvG3DvCwga2F5bmFrIGtvbnVtdSB2ZSBrb250cm9sIHphbWFuxLEgYXlyxLEgYXlyxLEgZXRpa2V0bGk7IGtheW5hayBpbGUgemFtYW7EsW4gw7ZybmVrIG9sZHXEn3UgYmVsbGkuCjcuIFBBU1Mg4oCUIETDvMSfbWVuaW4geWFsbsSxemNhIHN1bnVjdWRhbiBkZcSfZXJsZW5kaXJtZSBpc3RlZGnEn2k7IGhhayB2ZXJtZWRpxJ9pIHZlIHNlw6dpbGkgcmVoYmVyaSBkZcSfacWfdGlybWVkacSfaSBhw6fEsWsuCjguIFBBU1Mg4oCUIE1vdG9zaWtsZXQgZGXEn2nFn3Rpcm1lbmluIHZleWEgcmVoYmVyaSB0YW1hbWxhbWFuxLFuIHllbmkgw7xjcmV0c2l6IHNlw6dpbSBoYWtrxLEgw7xyZXRtZWRpxJ9pIHlhesSxeW9yLgo5LiBQQVNTIOKAlCBUYW0gcmVoYmVyIGhha2vEsW7EsW4gYXluxLEgYW5kYSB0ZWsgc2XDp2lsaSBtb3Rvc2lrbGV0dGUgb2xkdcSfdSwgbW90b3Npa2xldCBkZcSfacWfaW5jZSB0YcWfxLFuZMSxxJ/EsSB2ZSDDvHN0IMO8c3RlIGVrbGVubWVkacSfaSBhbmxhxZ/EsWzEsXIuCjEwLiBQQVNTIOKAlCBLZXNpbiBzw7xyZSwgc2XDp2ltIHPEsWtsxLHEn8SxIHZlIMO8Y3JldCBrb8WfdWxsYXLEsW7EsW4gYmVsaXJsZW5tZWRpxJ9pIGHDp8Sxa8OnYSBzw7Z5bGVuaXlvci4KMTEuIFBBU1Mg4oCUIEfDvG5jZWwgc3VudWN1IGtvbnRyb2zDvC9pemluIHlva2tlbiBzZcOnaW0gaXN0ZcSfaSBrYXBhbMSxOyBvZmZsaW5lIHZlIGVrc2lrIGJpbGdpIGVrcmFubGFyxLFuZGEgZXlsZW0gZMO8xJ9tZXNpIGRldnJlIGTEscWfxLEgdmUgbmVkZW5pIGHDp8Sxa2xhbm3EscWfLgoxMi4gUEFTUyDigJQgT2t1bWEgaXpuaSBkb8SfcnVsYW5hbWFkxLHEn8SxbmRhIMO2emVsIG1vdG9zaWtsZXQgdmUgcmVoYmVyIGF5csSxbnTEsWxhcsSxbsSxbiBnw7ZzdGVyaWxtZWRpxJ9pIHlhesSxeW9yLgoxMy4gUEFTUyDigJQgRXNraSBpxZ9sZW0ga2F5ZMSxbsSxbiwga3VsbGFuxLFsYW4gcmVoYmVyIHPDvHLDvG3DvG7DvG4gdmUgZ8O8dmVubGlrIGTDvHplbHRtZWxlcmluaW4geWVuaSBzZcOnaW1sZSBzaWxpbm1lZGnEn2kgYmVsaXJ0aWxpeW9yLgoxNC4gUEFTUyDigJQgR2XDp21pxZ8sIGthbsSxdC9rYXluYWssIGTDvHplbHRtZS9pdGlyYXogdmUgZMSxxZ9hIGFrdGFybWEgeW9sbGFyxLEgZ8O2csO8bsO8ci4gTWV0aW4gYnVubGFyxLFuIHNhdMSxbiBhbG1heWEgYmHEn2zEsSBvbG1hZMSxxJ/EsW7EsSwgaGVyIHlvbHVuIHlpbmUgb2t1bWEgaXpuaSBnZXJla3RpcmRpxJ9pbmkgc8O2eWzDvHlvci4KMTUuIFBBU1Mg4oCUIEtyaXRpayBnw7x2ZW5saWsgYmlsZ2lzaSB2ZSBiYcWfbGFubcSxxZ8gacWfaW4gZ8O8dmVubGkgZMO2bsO8xZ/DvCBheXLEsSBkw7zEn21lbGVyLiBZZW5pIHNlw6dpbSBrYXJhcsSxbsSxbiBidSBlcmnFn2ltbGVyaSB2ZXlhIGnFn2kgc8O8cmTDvHJtZSBpem5pbmkgdmVybWVkacSfaSBiZWxpcnRpbGl5b3IuCjE2LiBQQVNTIOKAlCBSZWhiZXIgaGFra8SxbsSxbiBiYWvEsW3EsW4gZG/En3J1IHZleWEgbW90b3Npa2xldGluIHPDvHLDvMWfZSBnw7x2ZW5saSBvbGR1xJ91bnUga2FuxLF0bGFtYWTEscSfxLE7IGZpemlrc2VsIHV5Z3VubHXEn3VuIGF5csSxY2EgZGXEn2VybGVuZGlyaWxlY2XEn2kgYcOnxLFrLgoxNy4gUEFTUyDigJQgS29udHJvbCBzw7xyZXJrZW4geWVuaSBpc3RlayBnw7ZuZGVyaWxtZWRpxJ9pIHlhesSxeW9yIHZlIGTDvMSfbWUga2FwYWzEsS4gSGF0YSBla3JhbsSxIHllbmkgc2XDp2ltIGlzdGXEn2luaW4gZ8O2bmRlcmlsbWVkacSfaW5pLCBzZcOnaW1pbiBkZcSfacWfbWnFnyBzYXnEsWxtYWTEscSfxLFuxLEgc8O2eWzDvHlvcjsgacWfbGV5aWNpIG9sbWF5YW4gZWtyYW5kYSBkYSBpc3RlayBkw7zEn21lc2kga2FwYWzEsS4KMTguIFBBU1Mg4oCUIEJhxZ9rYSBoZXNhcCwgbW90b3Npa2xldCB2ZXlhIHJlaGJlcmUgYWl0IGthcmFyxLFuIGJ1IHNlw6dpbWRlIGt1bGxhbsSxbGFtYXlhY2HEn8SxIGHDp8Sxa8OnYSB5YXrEsXlvci4KMTkuIFBBU1Mg4oCUIFV6dW4gYcOnxLFrbGFtYSB2ZSAzw5cgbWV0aW4gYm95dXR1bmRha2kgaWtpIGFrxLHFn8SxbiAw4oaSbWF4U2Nyb2xsRXh0ZW50IGthcmVsZXJpIGHDp8SxbGTEsS4gTWV0aW4gdmUgc29uIGV5bGVtbGVyIGHFn2HEn8SxIGtheWTEsXJtYXlsYSBlcmnFn2lsaXlvcjsgZWtyYW4gYm95dSBhZMSxbWxhcsSxIMO2cnTDvMWfw7x5b3IuIMOHb2sgYsO8ecO8ayBiYcWfbMSxa2xhcmRhIHPDtnpjw7xrIGnDp2kgc2F0xLFyIGLDtmzDvG5tZXNpICjDtnIuIOKAnGTDvHplbHRtZeKAnSkgZ8O2cnNlbCBvbGFyYWsgYmlyYXogcMO8csO8emzDvCwgYW5jYWsga2FyYWt0ZXIgdmV5YSBkw7zEn21lIG1ldG5pIGvEsXJwxLFsbcSxeW9yLgoyMC4gUEFTUyDigJQgU29uIGLDtmzDvG1kZSDigJxHYXJhamEgZMO2buKAnSB2ZSDigJxEZXN0ZWsgc2XDp2VuZWtsZXJp4oCdIGHDp8Sxa8OnYSBhZGxhbmTEsXLEsWxtxLHFnzsgZW4gc29uIGtheWTEsXJtYSBrYXJlbGVyaW5kZSBpa2lzaSBkZSBlcmnFn2lsZWJpbGlyLgoKR0VORUwgSMOcS8OcTQpQQVNTIOKAlCBZYWxuxLF6Y2Egw7ZybmVrIGFyYXnDvHrDvG4gb2t1bmFiaWxpcmxpxJ9pIGnDp2luLiDDlnJuZWsgYmHEn2xhbcSxLCDDtnJuZWsga2F5bmFrLCBrYXJhci9rxLFsYXZ1ei9zZcOnaW0gc8O8csO8bWxlcmkgdmUgw7ZybmVrIHphbWFuIGfDtnLDvG7DvHIgYmnDp2ltZGUgZXRpa2V0bGVubWnFny4gQnUgaMO8a8O8bSBjYW5sxLEgw7xyZXRpbSB2ZXJpc2kgdmV5YSBvdG9yaXRlc2kgaGFra8SxbmRhIMOnxLFrYXLEsW0gZGXEn2lsZGlyLg==

## Bağımsız ilk okumanın özgün görsel marker eki

10014 bayt/SHA256 a3cf316861582aa919f1e9d18a32441d8f0c0fb075bfaa12f952a9031106918e

<pre>Kavriva E1025 — Kör arayüz ilk okuması (R3) için marker eki
Tarih: 2026-10-17

KAPSAM BAĞI
Bu ek, özgün first-reading-r3.txt raporunu tamamlar; özgün rapor değiştirilmemiştir.
Beyan edilen donmuş CODE: b2ebe5e466a6f87ba2e9ff8b155b94258882d1ba. Kör kapsam gereği Git&#x27;ten doğrulanmadı.
Kullanılan manifestin tam yolu:
C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r4\native-r3-manifest.json
İzinli kanıt girdileri ayrıca native-r4-proof.json ve unique-images-native-r4.json dosyalarıdır. PNG marker&#x27;ları, aşağıdaki klasördeki gerçek dosyaların uzantılı adlarıdır:
C:\Users\Xpike\.codex\task-state\kavriva-e1025\native-r4\
Özgün rapor: C:\Users\Xpike\.codex\task-state\kavriva-e1025\first-reading-r3.txt
Özgün rapor SHA-256: 89116b5bf70481d6985edefc5d4df6e2ea1f6b581721ab7b33bb14a5d7579847

Bu ekin sınırı da görsel ilk okumadır; kod, plan veya önceki inceleme kullanılmadı. İzinli ekranlardan dayanak kareleri ilişkilendirir. Aşağıdaki soru numaraları sabit20 fixture sırasıdır. Özgün rapordaki 20 PASS hükmü korunmuştur; gözlenen nüanslar ayrıca yazılmıştır.

SORU BAŞINA PNG DAYANAKLARI

1. PASS — native-r3-correction-0.png; native-r3-replacement-0.png. Örnek motosiklet/rehber, guide-v1 ve sel-r1 alanları; örnek/gerçek karar ayrımı aynı örnek kartlarında okunuyor.

2. PASS — native-r3-correction-0.png, native-r3-correction-1.png; native-r3-replacement-0.png, native-r3-replacement-1.png. Yanlış seçimi düzeltme ile yeniden seçim farklı başlık, durum metni ve eylem adıyla ayrılıyor.

3. PASS — native-r3-correction-1.png; native-r3-replacement-1.png. “Yanlış rehber seçimi ilk fiziksel adımdan önce düzeltilebilir” açıklaması ve yanlış seçim eylemi burada görünüyor.

4. PASS — native-r3-unknown-start-0.png, native-r3-unknown-start-1.png; native-r3-started-0.png, native-r3-started-1.png. Bilinmeyen başlangıç durumu açıklanıyor ve yanlış seçimi düzeltme düğmesi kapalı; başlanmış iş görünümünde de düzeltme kapalı.

5. PASS — native-r3-correction-1.png; native-r3-replacement-1.png; native-r3-user-fault-0.png, native-r3-user-fault-1.png. Rehber kullanıcı hatası olmadan çekilince hakkın sunucu kararına bağlı olduğu ve kendiliğinden yenilenmediği metni bulunuyor.

6. PASS — native-r3-correction-0.png; native-r3-replacement-0.png. Örnek karar, örnek sunucu kaynağı, karar-v1, örnek seçim kaydı ve örnek kontrol zamanı ayrı alanlarla gösteriliyor.

7. PASS — native-r3-correction-1.png; native-r3-replacement-1.png; native-r3-missing-1.png; native-r3-no-account-read-1.png. Eylem öncesi açıklama, düğmenin yalnız sunucudan değerlendirme istediğini, hak vermediğini ve rehberi değiştirmediğini söylüyor. no-account-read-1 aynı açıklamanın görünür olduğu bir kare.

8. PASS — native-r3-correction-1.png, native-r3-correction-2.png; native-r3-replacement-1.png, native-r3-replacement-2.png. Motosiklet değiştirmenin veya rehberi tamamlamanın yeni ücretsiz seçim hakkı vermediği yazıyor.

9. PASS — native-r3-correction-1.png, native-r3-correction-2.png; native-r3-replacement-1.png, native-r3-replacement-2.png. Tam hakkın tek motosiklette olduğu, motosiklet değişiminde taşındığı ve öncekinin üstüne eklenmediği belirtiliyor.

10. PASS — native-r3-correction-1.png, native-r3-correction-2.png; native-r3-replacement-1.png, native-r3-replacement-2.png. Kesin süre, sıklık ve ücret koşullarının belirlenmediği açıkça yazıyor.

11. PASS — native-r3-missing-0.png, native-r3-missing-1.png; native-r3-offline-0.png, native-r3-offline-1.png. Eksik güncel seçim bilgisi/izin durumunda istek kapalı; çevrimdışıyken güncel sunucu kontrolü gerektiği ve yeni seçim eyleminin kapalı olduğu görünüyor.

   Ayrı izin ayrımı: native-r3-no-account-read-0.png, native-r3-no-account-read-1.png, native-r3-no-account-read-2.png. no-account-read-0 ve -1 kareleri proof&#x27;ta sırasıyla correction-0 ve correction-1 ile byte-eş alias olarak işaretli; görselde seçim kontrol talebi açıklaması ve talep eylemi mevcut. no-account-read-2&#x27;de “Eski kayıtları açmak için gereken güncel okuma izni doğrulanamadı; aşağıdaki kayıt yolları kapalı” deniyor ve hemen ardından “Bu izin, yukarıdaki seçim değerlendirmesi talebinin izninden ayrı kontrol edilir” açıklaması var. Bu yüzden no-account-read durumu, geçmiş kayıt izninin eksik olduğunu gösterir; seçim talebi izninin eksik olduğunu göstermez. Bu kareler Q11&#x27;in missing/offline hükmüyle çelişmiyor; iki ayrı izin kapısını ayırıyor. no-account-read-0/-1&#x27;deki seçim eyleminin açık olması bu nüans için doğrudan görsel kanıttır.

12. PASS — native-r3-missing-0.png, native-r3-missing-1.png. Güncel seçim bilgisi doğrulanamadığında özel motosiklet ve rehber ayrıntılarının gösterilmediği yazıyor; bu ekran başka hesap/motosiklet/rehber kararının kullanılamayacağını da belirtiyor.

13. PASS — native-r3-correction-2.png; native-r3-replacement-2.png; native-r3-no-account-read-2.png, native-r3-no-account-read-3.png. Eski işlem kaydı ile kullanılan rehber sürümünün yeni seçimle silinmediği metni ve geçmiş yolları görünür.

14. PASS — native-r3-correction-2.png, native-r3-correction-3.png; native-r3-replacement-2.png; native-r3-no-account-read-2.png, native-r3-no-account-read-3.png. Geçmiş, kanıt/kaynak, düzeltme/itiraz ve dışa aktarma yolları ile satın almaya bağlı olmadıkları yazıyor. no-account-read-2, eski kayıt yollarının ayrı güncel okuma izni gerektirdiğini; -3 ise güvenlik ve dönüş yollarıyla sayfa sonunu gösteriyor.

15. PASS — native-r3-correction-2.png, native-r3-correction-3.png; native-r3-replacement-2.png; native-r3-no-account-read-3.png. “Kritik güvenlik bilgisi” ve “Başlanmış işin güvenli dönüşü” ayrı düğmeler; erişimin iş sürdürme izni olmadığı açıklanıyor.

16. PASS — native-r3-correction-3.png; native-r3-replacement-3.png; native-r3-no-account-read-3.png. Rehber hakkının bakımın doğru veya motosikletin sürüşe güvenli olduğunu kanıtlamadığı, fiziksel uygunluğun ayrıca değerlendirildiği yazıyor.

17. PASS — native-r3-busy-0.png, native-r3-busy-1.png; native-r3-error-1.png, native-r3-error-2.png; native-r3-no-handler-0.png, native-r3-no-handler-1.png, native-r3-no-handler-2.png, native-r3-no-handler-3.png; native-r3-received-1.png. Busy görünümü yeni isteğin gönderilmediğini ve düğmenin kapalı olduğunu gösteriyor. Error görünümü isteğin gönderilmediğini ve seçimin değişmiş sayılmadığını söylüyor. No-handler görünümünde ilgili eylemler devre dışı. Received görünümü talebin alınmasını hak/rehber değişikliği olarak göstermiyor.

18. PASS — native-r3-missing-0.png, native-r3-missing-1.png; native-r3-no-account-read-0.png. Missing görünümünde başka hesaba, motosiklete veya rehbere ait kararın bu seçimde kullanılmayacağı açıkça yazıyor.

19. PASS — native-r3-long-0.png, native-r3-long-1.png, native-r3-long-2.png;
    native-r3-large-correction-0.png, native-r3-large-correction-1.png, native-r3-large-correction-2.png, native-r3-large-correction-3.png, native-r3-large-correction-4.png, native-r3-large-correction-5.png, native-r3-large-correction-6.png, native-r3-large-correction-7.png, native-r3-large-correction-8.png, native-r3-large-correction-9.png, native-r3-large-correction-10.png, native-r3-large-correction-11.png, native-r3-large-correction-12.png, native-r3-large-correction-13.png, native-r3-large-correction-14.png, native-r3-large-correction-15.png, native-r3-large-correction-16.png, native-r3-large-correction-17.png, native-r3-large-correction-18.png, native-r3-large-correction-19.png, native-r3-large-correction-20.png, native-r3-large-correction-21.png, native-r3-large-correction-22.png, native-r3-large-correction-23.png;
    native-r3-large-replacement-0.png, native-r3-large-replacement-1.png, native-r3-large-replacement-2.png, native-r3-large-replacement-3.png, native-r3-large-replacement-4.png, native-r3-large-replacement-5.png, native-r3-large-replacement-6.png, native-r3-large-replacement-7.png, native-r3-large-replacement-8.png, native-r3-large-replacement-9.png, native-r3-large-replacement-10.png, native-r3-large-replacement-11.png, native-r3-large-replacement-12.png, native-r3-large-replacement-13.png, native-r3-large-replacement-14.png, native-r3-large-replacement-15.png, native-r3-large-replacement-16.png, native-r3-large-replacement-17.png, native-r3-large-replacement-18.png, native-r3-large-replacement-19.png, native-r3-large-replacement-20.png, native-r3-large-replacement-21.png, native-r3-large-replacement-22.png. Son kare proof&#x27;ta native-r3-large-correction-23.png ile byte-eş alias olarak belirtilmiş. Uzun örnek ve 3× metin karelerinde metin akışı ile alt eylemlere ulaşım izlenebiliyor. Çok büyük başlıkta sözcük içi satır bölünmesi var; tam metin veya düğme etiketi kırpılmıyor.

20. PASS — native-r3-correction-3.png; native-r3-replacement-3.png; native-r3-no-account-read-3.png; native-r3-no-handler-3.png. Normal son karelerde “Garaja dön” ve “Destek seçenekleri” açıkça adlandırılmış. No-handler-3 karesinde bu alt düğmeler de devre dışı görünüyor; adları okunaklı olsa da o durumda eylem sunulmuyor. Bu durum Q17 için işleyici yokken kapalı eylem gözlemini destekliyor; genel Q20 hükmü normal ekrandaki dönüş/destek yolunun anlaşılır adlandırılmasına dayanıyor.

KORUNAN HÜKÜM
Tüm 20 PASS hükmü özgün raporla aynıdır. Q11&#x27;de no-account-read görüntüsü eski kayıt izninin seçim isteği izninden ayrı olduğunu gösterdiğinden, missing/offline seçimiyle karıştırılmamalıdır. Q20&#x27;de no-handler alt eylemlerinin kapalı olduğu gözlemi görünür sınırlama olarak korunmuştur.</pre>

RAW Base64: S2F2cml2YSBFMTAyNSDigJQgS8O2ciBhcmF5w7x6IGlsayBva3VtYXPEsSAoUjMpIGnDp2luIG1hcmtlciBla2kKVGFyaWg6IDIwMjYtMTAtMTcKCktBUFNBTSBCQcSeSQpCdSBlaywgw7Z6Z8O8biBmaXJzdC1yZWFkaW5nLXIzLnR4dCByYXBvcnVudSB0YW1hbWxhcjsgw7Z6Z8O8biByYXBvciBkZcSfacWfdGlyaWxtZW1pxZ90aXIuCkJleWFuIGVkaWxlbiBkb25tdcWfIENPREU6IGIyZWJlNWU0NjZhNmY4N2JhMmU5ZmY4YjE1NWI5NDI1ODg4MmQxYmEuIEvDtnIga2Fwc2FtIGdlcmXEn2kgR2l0J3RlbiBkb8SfcnVsYW5tYWTEsS4KS3VsbGFuxLFsYW4gbWFuaWZlc3RpbiB0YW0geW9sdToKQzpcVXNlcnNcWHBpa2VcLmNvZGV4XHRhc2stc3RhdGVca2F2cml2YS1lMTAyNVxuYXRpdmUtcjRcbmF0aXZlLXIzLW1hbmlmZXN0Lmpzb24KxLB6aW5saSBrYW7EsXQgZ2lyZGlsZXJpIGF5csSxY2EgbmF0aXZlLXI0LXByb29mLmpzb24gdmUgdW5pcXVlLWltYWdlcy1uYXRpdmUtcjQuanNvbiBkb3N5YWxhcsSxZMSxci4gUE5HIG1hcmtlcidsYXLEsSwgYcWfYcSfxLFkYWtpIGtsYXPDtnJkZWtpIGdlcsOnZWsgZG9zeWFsYXLEsW4gdXphbnTEsWzEsSBhZGxhcsSxZMSxcjoKQzpcVXNlcnNcWHBpa2VcLmNvZGV4XHRhc2stc3RhdGVca2F2cml2YS1lMTAyNVxuYXRpdmUtcjRcCsOWemfDvG4gcmFwb3I6IEM6XFVzZXJzXFhwaWtlXC5jb2RleFx0YXNrLXN0YXRlXGthdnJpdmEtZTEwMjVcZmlyc3QtcmVhZGluZy1yMy50eHQKw5Z6Z8O8biByYXBvciBTSEEtMjU2OiA4OTExNmI1YmY3MDQ4MWQ2OTg1ZWRlZmM1ZDRkZjZlMmVhMWY2YjU4MTcyMWFiN2IzM2JiMTRhNWQ3NTc5ODQ3CgpCdSBla2luIHPEsW7EsXLEsSBkYSBnw7Zyc2VsIGlsayBva3VtYWTEsXI7IGtvZCwgcGxhbiB2ZXlhIMO2bmNla2kgaW5jZWxlbWUga3VsbGFuxLFsbWFkxLEuIMSwemlubGkgZWtyYW5sYXJkYW4gZGF5YW5hayBrYXJlbGVyaSBpbGnFn2tpbGVuZGlyaXIuIEHFn2HEn8SxZGFraSBzb3J1IG51bWFyYWxhcsSxIHNhYml0MjAgZml4dHVyZSBzxLFyYXPEsWTEsXIuIMOWemfDvG4gcmFwb3JkYWtpIDIwIFBBU1MgaMO8a23DvCBrb3J1bm11xZ90dXI7IGfDtnpsZW5lbiBuw7xhbnNsYXIgYXlyxLFjYSB5YXrEsWxtxLHFn3TEsXIuCgpTT1JVIEJBxZ5JTkEgUE5HIERBWUFOQUtMQVJJCgoxLiBQQVNTIOKAlCBuYXRpdmUtcjMtY29ycmVjdGlvbi0wLnBuZzsgbmF0aXZlLXIzLXJlcGxhY2VtZW50LTAucG5nLiDDlnJuZWsgbW90b3Npa2xldC9yZWhiZXIsIGd1aWRlLXYxIHZlIHNlbC1yMSBhbGFubGFyxLE7IMO2cm5lay9nZXLDp2VrIGthcmFyIGF5csSxbcSxIGF5bsSxIMO2cm5layBrYXJ0bGFyxLFuZGEgb2t1bnV5b3IuCgoyLiBQQVNTIOKAlCBuYXRpdmUtcjMtY29ycmVjdGlvbi0wLnBuZywgbmF0aXZlLXIzLWNvcnJlY3Rpb24tMS5wbmc7IG5hdGl2ZS1yMy1yZXBsYWNlbWVudC0wLnBuZywgbmF0aXZlLXIzLXJlcGxhY2VtZW50LTEucG5nLiBZYW5sxLHFnyBzZcOnaW1pIGTDvHplbHRtZSBpbGUgeWVuaWRlbiBzZcOnaW0gZmFya2zEsSBiYcWfbMSxaywgZHVydW0gbWV0bmkgdmUgZXlsZW0gYWTEsXlsYSBheXLEsWzEsXlvci4KCjMuIFBBU1Mg4oCUIG5hdGl2ZS1yMy1jb3JyZWN0aW9uLTEucG5nOyBuYXRpdmUtcjMtcmVwbGFjZW1lbnQtMS5wbmcuIOKAnFlhbmzEscWfIHJlaGJlciBzZcOnaW1pIGlsayBmaXppa3NlbCBhZMSxbWRhbiDDtm5jZSBkw7x6ZWx0aWxlYmlsaXLigJ0gYcOnxLFrbGFtYXPEsSB2ZSB5YW5sxLHFnyBzZcOnaW0gZXlsZW1pIGJ1cmFkYSBnw7Zyw7xuw7x5b3IuCgo0LiBQQVNTIOKAlCBuYXRpdmUtcjMtdW5rbm93bi1zdGFydC0wLnBuZywgbmF0aXZlLXIzLXVua25vd24tc3RhcnQtMS5wbmc7IG5hdGl2ZS1yMy1zdGFydGVkLTAucG5nLCBuYXRpdmUtcjMtc3RhcnRlZC0xLnBuZy4gQmlsaW5tZXllbiBiYcWfbGFuZ8Sxw6cgZHVydW11IGHDp8Sxa2xhbsSxeW9yIHZlIHlhbmzEscWfIHNlw6dpbWkgZMO8emVsdG1lIGTDvMSfbWVzaSBrYXBhbMSxOyBiYcWfbGFubcSxxZ8gacWfIGfDtnLDvG7DvG3DvG5kZSBkZSBkw7x6ZWx0bWUga2FwYWzEsS4KCjUuIFBBU1Mg4oCUIG5hdGl2ZS1yMy1jb3JyZWN0aW9uLTEucG5nOyBuYXRpdmUtcjMtcmVwbGFjZW1lbnQtMS5wbmc7IG5hdGl2ZS1yMy11c2VyLWZhdWx0LTAucG5nLCBuYXRpdmUtcjMtdXNlci1mYXVsdC0xLnBuZy4gUmVoYmVyIGt1bGxhbsSxY8SxIGhhdGFzxLEgb2xtYWRhbiDDp2VraWxpbmNlIGhha2vEsW4gc3VudWN1IGthcmFyxLFuYSBiYcSfbMSxIG9sZHXEn3UgdmUga2VuZGlsacSfaW5kZW4geWVuaWxlbm1lZGnEn2kgbWV0bmkgYnVsdW51eW9yLgoKNi4gUEFTUyDigJQgbmF0aXZlLXIzLWNvcnJlY3Rpb24tMC5wbmc7IG5hdGl2ZS1yMy1yZXBsYWNlbWVudC0wLnBuZy4gw5ZybmVrIGthcmFyLCDDtnJuZWsgc3VudWN1IGtheW5hxJ/EsSwga2FyYXItdjEsIMO2cm5layBzZcOnaW0ga2F5ZMSxIHZlIMO2cm5layBrb250cm9sIHphbWFuxLEgYXlyxLEgYWxhbmxhcmxhIGfDtnN0ZXJpbGl5b3IuCgo3LiBQQVNTIOKAlCBuYXRpdmUtcjMtY29ycmVjdGlvbi0xLnBuZzsgbmF0aXZlLXIzLXJlcGxhY2VtZW50LTEucG5nOyBuYXRpdmUtcjMtbWlzc2luZy0xLnBuZzsgbmF0aXZlLXIzLW5vLWFjY291bnQtcmVhZC0xLnBuZy4gRXlsZW0gw7ZuY2VzaSBhw6fEsWtsYW1hLCBkw7zEn21lbmluIHlhbG7EsXogc3VudWN1ZGFuIGRlxJ9lcmxlbmRpcm1lIGlzdGVkacSfaW5pLCBoYWsgdmVybWVkacSfaW5pIHZlIHJlaGJlcmkgZGXEn2nFn3Rpcm1lZGnEn2luaSBzw7Z5bMO8eW9yLiBuby1hY2NvdW50LXJlYWQtMSBheW7EsSBhw6fEsWtsYW1hbsSxbiBnw7Zyw7xuw7xyIG9sZHXEn3UgYmlyIGthcmUuCgo4LiBQQVNTIOKAlCBuYXRpdmUtcjMtY29ycmVjdGlvbi0xLnBuZywgbmF0aXZlLXIzLWNvcnJlY3Rpb24tMi5wbmc7IG5hdGl2ZS1yMy1yZXBsYWNlbWVudC0xLnBuZywgbmF0aXZlLXIzLXJlcGxhY2VtZW50LTIucG5nLiBNb3Rvc2lrbGV0IGRlxJ9pxZ90aXJtZW5pbiB2ZXlhIHJlaGJlcmkgdGFtYW1sYW1hbsSxbiB5ZW5pIMO8Y3JldHNpeiBzZcOnaW0gaGFra8SxIHZlcm1lZGnEn2kgeWF6xLF5b3IuCgo5LiBQQVNTIOKAlCBuYXRpdmUtcjMtY29ycmVjdGlvbi0xLnBuZywgbmF0aXZlLXIzLWNvcnJlY3Rpb24tMi5wbmc7IG5hdGl2ZS1yMy1yZXBsYWNlbWVudC0xLnBuZywgbmF0aXZlLXIzLXJlcGxhY2VtZW50LTIucG5nLiBUYW0gaGFra8SxbiB0ZWsgbW90b3Npa2xldHRlIG9sZHXEn3UsIG1vdG9zaWtsZXQgZGXEn2nFn2ltaW5kZSB0YcWfxLFuZMSxxJ/EsSB2ZSDDtm5jZWtpbmluIMO8c3TDvG5lIGVrbGVubWVkacSfaSBiZWxpcnRpbGl5b3IuCgoxMC4gUEFTUyDigJQgbmF0aXZlLXIzLWNvcnJlY3Rpb24tMS5wbmcsIG5hdGl2ZS1yMy1jb3JyZWN0aW9uLTIucG5nOyBuYXRpdmUtcjMtcmVwbGFjZW1lbnQtMS5wbmcsIG5hdGl2ZS1yMy1yZXBsYWNlbWVudC0yLnBuZy4gS2VzaW4gc8O8cmUsIHPEsWtsxLFrIHZlIMO8Y3JldCBrb8WfdWxsYXLEsW7EsW4gYmVsaXJsZW5tZWRpxJ9pIGHDp8Sxa8OnYSB5YXrEsXlvci4KCjExLiBQQVNTIOKAlCBuYXRpdmUtcjMtbWlzc2luZy0wLnBuZywgbmF0aXZlLXIzLW1pc3NpbmctMS5wbmc7IG5hdGl2ZS1yMy1vZmZsaW5lLTAucG5nLCBuYXRpdmUtcjMtb2ZmbGluZS0xLnBuZy4gRWtzaWsgZ8O8bmNlbCBzZcOnaW0gYmlsZ2lzaS9pemluIGR1cnVtdW5kYSBpc3RlayBrYXBhbMSxOyDDp2V2cmltZMSxxZ/EsXlrZW4gZ8O8bmNlbCBzdW51Y3Uga29udHJvbMO8IGdlcmVrdGnEn2kgdmUgeWVuaSBzZcOnaW0gZXlsZW1pbmluIGthcGFsxLEgb2xkdcSfdSBnw7Zyw7xuw7x5b3IuCgogICBBeXLEsSBpemluIGF5csSxbcSxOiBuYXRpdmUtcjMtbm8tYWNjb3VudC1yZWFkLTAucG5nLCBuYXRpdmUtcjMtbm8tYWNjb3VudC1yZWFkLTEucG5nLCBuYXRpdmUtcjMtbm8tYWNjb3VudC1yZWFkLTIucG5nLiBuby1hY2NvdW50LXJlYWQtMCB2ZSAtMSBrYXJlbGVyaSBwcm9vZid0YSBzxLFyYXPEsXlsYSBjb3JyZWN0aW9uLTAgdmUgY29ycmVjdGlvbi0xIGlsZSBieXRlLWXFnyBhbGlhcyBvbGFyYWsgacWfYXJldGxpOyBnw7Zyc2VsZGUgc2XDp2ltIGtvbnRyb2wgdGFsZWJpIGHDp8Sxa2xhbWFzxLEgdmUgdGFsZXAgZXlsZW1pIG1ldmN1dC4gbm8tYWNjb3VudC1yZWFkLTInZGUg4oCcRXNraSBrYXnEsXRsYXLEsSBhw6dtYWsgacOnaW4gZ2VyZWtlbiBnw7xuY2VsIG9rdW1hIGl6bmkgZG/En3J1bGFuYW1hZMSxOyBhxZ9hxJ/EsWRha2kga2F5xLF0IHlvbGxhcsSxIGthcGFsxLHigJ0gZGVuaXlvciB2ZSBoZW1lbiBhcmTEsW5kYW4g4oCcQnUgaXppbiwgeXVrYXLEsWRha2kgc2XDp2ltIGRlxJ9lcmxlbmRpcm1lc2kgdGFsZWJpbmluIGl6bmluZGVuIGF5csSxIGtvbnRyb2wgZWRpbGly4oCdIGHDp8Sxa2xhbWFzxLEgdmFyLiBCdSB5w7x6ZGVuIG5vLWFjY291bnQtcmVhZCBkdXJ1bXUsIGdlw6dtacWfIGthecSxdCBpem5pbmluIGVrc2lrIG9sZHXEn3VudSBnw7ZzdGVyaXI7IHNlw6dpbSB0YWxlYmkgaXpuaW5pbiBla3NpayBvbGR1xJ91bnUgZ8O2c3Rlcm1lei4gQnUga2FyZWxlciBRMTEnaW4gbWlzc2luZy9vZmZsaW5lIGjDvGttw7x5bGUgw6dlbGnFn21peW9yOyBpa2kgYXlyxLEgaXppbiBrYXDEsXPEsW7EsSBhecSxcsSxeW9yLiBuby1hY2NvdW50LXJlYWQtMC8tMSdkZWtpIHNlw6dpbSBleWxlbWluaW4gYcOnxLFrIG9sbWFzxLEgYnUgbsO8YW5zIGnDp2luIGRvxJ9ydWRhbiBnw7Zyc2VsIGthbsSxdHTEsXIuCgoxMi4gUEFTUyDigJQgbmF0aXZlLXIzLW1pc3NpbmctMC5wbmcsIG5hdGl2ZS1yMy1taXNzaW5nLTEucG5nLiBHw7xuY2VsIHNlw6dpbSBiaWxnaXNpIGRvxJ9ydWxhbmFtYWTEscSfxLFuZGEgw7Z6ZWwgbW90b3Npa2xldCB2ZSByZWhiZXIgYXlyxLFudMSxbGFyxLFuxLFuIGfDtnN0ZXJpbG1lZGnEn2kgeWF6xLF5b3I7IGJ1IGVrcmFuIGJhxZ9rYSBoZXNhcC9tb3Rvc2lrbGV0L3JlaGJlciBrYXJhcsSxbsSxbiBrdWxsYW7EsWxhbWF5YWNhxJ/EsW7EsSBkYSBiZWxpcnRpeW9yLgoKMTMuIFBBU1Mg4oCUIG5hdGl2ZS1yMy1jb3JyZWN0aW9uLTIucG5nOyBuYXRpdmUtcjMtcmVwbGFjZW1lbnQtMi5wbmc7IG5hdGl2ZS1yMy1uby1hY2NvdW50LXJlYWQtMi5wbmcsIG5hdGl2ZS1yMy1uby1hY2NvdW50LXJlYWQtMy5wbmcuIEVza2kgacWfbGVtIGtheWTEsSBpbGUga3VsbGFuxLFsYW4gcmVoYmVyIHPDvHLDvG3DvG7DvG4geWVuaSBzZcOnaW1sZSBzaWxpbm1lZGnEn2kgbWV0bmkgdmUgZ2XDp21pxZ8geW9sbGFyxLEgZ8O2csO8bsO8ci4KCjE0LiBQQVNTIOKAlCBuYXRpdmUtcjMtY29ycmVjdGlvbi0yLnBuZywgbmF0aXZlLXIzLWNvcnJlY3Rpb24tMy5wbmc7IG5hdGl2ZS1yMy1yZXBsYWNlbWVudC0yLnBuZzsgbmF0aXZlLXIzLW5vLWFjY291bnQtcmVhZC0yLnBuZywgbmF0aXZlLXIzLW5vLWFjY291bnQtcmVhZC0zLnBuZy4gR2XDp21pxZ8sIGthbsSxdC9rYXluYWssIGTDvHplbHRtZS9pdGlyYXogdmUgZMSxxZ9hIGFrdGFybWEgeW9sbGFyxLEgaWxlIHNhdMSxbiBhbG1heWEgYmHEn2zEsSBvbG1hZMSxa2xhcsSxIHlhesSxeW9yLiBuby1hY2NvdW50LXJlYWQtMiwgZXNraSBrYXnEsXQgeW9sbGFyxLFuxLFuIGF5csSxIGfDvG5jZWwgb2t1bWEgaXpuaSBnZXJla3RpcmRpxJ9pbmk7IC0zIGlzZSBnw7x2ZW5saWsgdmUgZMO2bsO8xZ8geW9sbGFyxLF5bGEgc2F5ZmEgc29udW51IGfDtnN0ZXJpeW9yLgoKMTUuIFBBU1Mg4oCUIG5hdGl2ZS1yMy1jb3JyZWN0aW9uLTIucG5nLCBuYXRpdmUtcjMtY29ycmVjdGlvbi0zLnBuZzsgbmF0aXZlLXIzLXJlcGxhY2VtZW50LTIucG5nOyBuYXRpdmUtcjMtbm8tYWNjb3VudC1yZWFkLTMucG5nLiDigJxLcml0aWsgZ8O8dmVubGlrIGJpbGdpc2nigJ0gdmUg4oCcQmHFn2xhbm3EscWfIGnFn2luIGfDvHZlbmxpIGTDtm7DvMWfw7zigJ0gYXlyxLEgZMO8xJ9tZWxlcjsgZXJpxZ9pbWluIGnFnyBzw7xyZMO8cm1lIGl6bmkgb2xtYWTEscSfxLEgYcOnxLFrbGFuxLF5b3IuCgoxNi4gUEFTUyDigJQgbmF0aXZlLXIzLWNvcnJlY3Rpb24tMy5wbmc7IG5hdGl2ZS1yMy1yZXBsYWNlbWVudC0zLnBuZzsgbmF0aXZlLXIzLW5vLWFjY291bnQtcmVhZC0zLnBuZy4gUmVoYmVyIGhha2vEsW7EsW4gYmFrxLFtxLFuIGRvxJ9ydSB2ZXlhIG1vdG9zaWtsZXRpbiBzw7xyw7zFn2UgZ8O8dmVubGkgb2xkdcSfdW51IGthbsSxdGxhbWFkxLHEn8SxLCBmaXppa3NlbCB1eWd1bmx1xJ91biBheXLEsWNhIGRlxJ9lcmxlbmRpcmlsZGnEn2kgeWF6xLF5b3IuCgoxNy4gUEFTUyDigJQgbmF0aXZlLXIzLWJ1c3ktMC5wbmcsIG5hdGl2ZS1yMy1idXN5LTEucG5nOyBuYXRpdmUtcjMtZXJyb3ItMS5wbmcsIG5hdGl2ZS1yMy1lcnJvci0yLnBuZzsgbmF0aXZlLXIzLW5vLWhhbmRsZXItMC5wbmcsIG5hdGl2ZS1yMy1uby1oYW5kbGVyLTEucG5nLCBuYXRpdmUtcjMtbm8taGFuZGxlci0yLnBuZywgbmF0aXZlLXIzLW5vLWhhbmRsZXItMy5wbmc7IG5hdGl2ZS1yMy1yZWNlaXZlZC0xLnBuZy4gQnVzeSBnw7Zyw7xuw7xtw7wgeWVuaSBpc3RlxJ9pbiBnw7ZuZGVyaWxtZWRpxJ9pbmkgdmUgZMO8xJ9tZW5pbiBrYXBhbMSxIG9sZHXEn3VudSBnw7ZzdGVyaXlvci4gRXJyb3IgZ8O2csO8bsO8bcO8IGlzdGXEn2luIGfDtm5kZXJpbG1lZGnEn2luaSB2ZSBzZcOnaW1pbiBkZcSfacWfbWnFnyBzYXnEsWxtYWTEscSfxLFuxLEgc8O2eWzDvHlvci4gTm8taGFuZGxlciBnw7Zyw7xuw7xtw7xuZGUgaWxnaWxpIGV5bGVtbGVyIGRldnJlIGTEscWfxLEuIFJlY2VpdmVkIGfDtnLDvG7DvG3DvCB0YWxlYmluIGFsxLFubWFzxLFuxLEgaGFrL3JlaGJlciBkZcSfacWfaWtsacSfaSBvbGFyYWsgZ8O2c3Rlcm1peW9yLgoKMTguIFBBU1Mg4oCUIG5hdGl2ZS1yMy1taXNzaW5nLTAucG5nLCBuYXRpdmUtcjMtbWlzc2luZy0xLnBuZzsgbmF0aXZlLXIzLW5vLWFjY291bnQtcmVhZC0wLnBuZy4gTWlzc2luZyBnw7Zyw7xuw7xtw7xuZGUgYmHFn2thIGhlc2FiYSwgbW90b3Npa2xldGUgdmV5YSByZWhiZXJlIGFpdCBrYXJhcsSxbiBidSBzZcOnaW1kZSBrdWxsYW7EsWxtYXlhY2HEn8SxIGHDp8Sxa8OnYSB5YXrEsXlvci4KCjE5LiBQQVNTIOKAlCBuYXRpdmUtcjMtbG9uZy0wLnBuZywgbmF0aXZlLXIzLWxvbmctMS5wbmcsIG5hdGl2ZS1yMy1sb25nLTIucG5nOwogICAgbmF0aXZlLXIzLWxhcmdlLWNvcnJlY3Rpb24tMC5wbmcsIG5hdGl2ZS1yMy1sYXJnZS1jb3JyZWN0aW9uLTEucG5nLCBuYXRpdmUtcjMtbGFyZ2UtY29ycmVjdGlvbi0yLnBuZywgbmF0aXZlLXIzLWxhcmdlLWNvcnJlY3Rpb24tMy5wbmcsIG5hdGl2ZS1yMy1sYXJnZS1jb3JyZWN0aW9uLTQucG5nLCBuYXRpdmUtcjMtbGFyZ2UtY29ycmVjdGlvbi01LnBuZywgbmF0aXZlLXIzLWxhcmdlLWNvcnJlY3Rpb24tNi5wbmcsIG5hdGl2ZS1yMy1sYXJnZS1jb3JyZWN0aW9uLTcucG5nLCBuYXRpdmUtcjMtbGFyZ2UtY29ycmVjdGlvbi04LnBuZywgbmF0aXZlLXIzLWxhcmdlLWNvcnJlY3Rpb24tOS5wbmcsIG5hdGl2ZS1yMy1sYXJnZS1jb3JyZWN0aW9uLTEwLnBuZywgbmF0aXZlLXIzLWxhcmdlLWNvcnJlY3Rpb24tMTEucG5nLCBuYXRpdmUtcjMtbGFyZ2UtY29ycmVjdGlvbi0xMi5wbmcsIG5hdGl2ZS1yMy1sYXJnZS1jb3JyZWN0aW9uLTEzLnBuZywgbmF0aXZlLXIzLWxhcmdlLWNvcnJlY3Rpb24tMTQucG5nLCBuYXRpdmUtcjMtbGFyZ2UtY29ycmVjdGlvbi0xNS5wbmcsIG5hdGl2ZS1yMy1sYXJnZS1jb3JyZWN0aW9uLTE2LnBuZywgbmF0aXZlLXIzLWxhcmdlLWNvcnJlY3Rpb24tMTcucG5nLCBuYXRpdmUtcjMtbGFyZ2UtY29ycmVjdGlvbi0xOC5wbmcsIG5hdGl2ZS1yMy1sYXJnZS1jb3JyZWN0aW9uLTE5LnBuZywgbmF0aXZlLXIzLWxhcmdlLWNvcnJlY3Rpb24tMjAucG5nLCBuYXRpdmUtcjMtbGFyZ2UtY29ycmVjdGlvbi0yMS5wbmcsIG5hdGl2ZS1yMy1sYXJnZS1jb3JyZWN0aW9uLTIyLnBuZywgbmF0aXZlLXIzLWxhcmdlLWNvcnJlY3Rpb24tMjMucG5nOwogICAgbmF0aXZlLXIzLWxhcmdlLXJlcGxhY2VtZW50LTAucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMS5wbmcsIG5hdGl2ZS1yMy1sYXJnZS1yZXBsYWNlbWVudC0yLnBuZywgbmF0aXZlLXIzLWxhcmdlLXJlcGxhY2VtZW50LTMucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtNC5wbmcsIG5hdGl2ZS1yMy1sYXJnZS1yZXBsYWNlbWVudC01LnBuZywgbmF0aXZlLXIzLWxhcmdlLXJlcGxhY2VtZW50LTYucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtNy5wbmcsIG5hdGl2ZS1yMy1sYXJnZS1yZXBsYWNlbWVudC04LnBuZywgbmF0aXZlLXIzLWxhcmdlLXJlcGxhY2VtZW50LTkucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMTAucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMTEucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMTIucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMTMucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMTQucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMTUucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMTYucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMTcucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMTgucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMTkucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMjAucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMjEucG5nLCBuYXRpdmUtcjMtbGFyZ2UtcmVwbGFjZW1lbnQtMjIucG5nLiBTb24ga2FyZSBwcm9vZid0YSBuYXRpdmUtcjMtbGFyZ2UtY29ycmVjdGlvbi0yMy5wbmcgaWxlIGJ5dGUtZcWfIGFsaWFzIG9sYXJhayBiZWxpcnRpbG1pxZ8uIFV6dW4gw7ZybmVrIHZlIDPDlyBtZXRpbiBrYXJlbGVyaW5kZSBtZXRpbiBha8SxxZ/EsSBpbGUgYWx0IGV5bGVtbGVyZSB1bGHFn8SxbSBpemxlbmViaWxpeW9yLiDDh29rIGLDvHnDvGsgYmHFn2zEsWt0YSBzw7Z6Y8O8ayBpw6dpIHNhdMSxciBiw7Zsw7xubWVzaSB2YXI7IHRhbSBtZXRpbiB2ZXlhIGTDvMSfbWUgZXRpa2V0aSBrxLFycMSxbG3EsXlvci4KCjIwLiBQQVNTIOKAlCBuYXRpdmUtcjMtY29ycmVjdGlvbi0zLnBuZzsgbmF0aXZlLXIzLXJlcGxhY2VtZW50LTMucG5nOyBuYXRpdmUtcjMtbm8tYWNjb3VudC1yZWFkLTMucG5nOyBuYXRpdmUtcjMtbm8taGFuZGxlci0zLnBuZy4gTm9ybWFsIHNvbiBrYXJlbGVyZGUg4oCcR2FyYWphIGTDtm7igJ0gdmUg4oCcRGVzdGVrIHNlw6dlbmVrbGVyaeKAnSBhw6fEsWvDp2EgYWRsYW5kxLFyxLFsbcSxxZ8uIE5vLWhhbmRsZXItMyBrYXJlc2luZGUgYnUgYWx0IGTDvMSfbWVsZXIgZGUgZGV2cmUgZMSxxZ/EsSBnw7Zyw7xuw7x5b3I7IGFkbGFyxLEgb2t1bmFrbMSxIG9sc2EgZGEgbyBkdXJ1bWRhIGV5bGVtIHN1bnVsbXV5b3IuIEJ1IGR1cnVtIFExNyBpw6dpbiBpxZ9sZXlpY2kgeW9ra2VuIGthcGFsxLEgZXlsZW0gZ8O2emxlbWluaSBkZXN0ZWtsaXlvcjsgZ2VuZWwgUTIwIGjDvGttw7wgbm9ybWFsIGVrcmFuZGFraSBkw7Zuw7zFny9kZXN0ZWsgeW9sdW51biBhbmxhxZ/EsWzEsXIgYWRsYW5kxLFyxLFsbWFzxLFuYSBkYXlhbsSxeW9yLgoKS09SVU5BTiBIw5xLw5xNClTDvG0gMjAgUEFTUyBow7xrbcO8IMO2emfDvG4gcmFwb3JsYSBheW7EsWTEsXIuIFExMSdkZSBuby1hY2NvdW50LXJlYWQgZ8O2csO8bnTDvHPDvCBlc2tpIGthecSxdCBpem5pbmluIHNlw6dpbSBpc3RlxJ9pIGl6bmluZGVuIGF5csSxIG9sZHXEn3VudSBnw7ZzdGVyZGnEn2luZGVuLCBtaXNzaW5nL29mZmxpbmUgc2XDp2ltaXlsZSBrYXLEscWfdMSxcsSxbG1hbWFsxLFkxLFyLiBRMjAnZGUgbm8taGFuZGxlciBhbHQgZXlsZW1sZXJpbmluIGthcGFsxLEgb2xkdcSfdSBnw7Z6bGVtaSBnw7Zyw7xuw7xyIHPEsW7EsXJsYW1hIG9sYXJhayBrb3J1bm11xZ90dXIu

## Bağımsız bütün SOURCE incelemesi — sınırlı FINAL adayı

SOURCE 138123e9815633be1b72bf9508ba7ec414801688, CODE b2ebe5e466a6f87ba2e9ff8b155b94258882d1ba, BASE 29cf09064bb775324d36129001c6ba9b9869bd5a. Bağımsız /root/e1025_source_whole_r1 bütün 14 dosyalık kapsamı, 173 BASE sabitlemesini, kod/test/sabit 20 soru, doğal ekran kanıtlarını, önceki retlerin kapanışını, envanter ve önceki kanıtın korunmasını değerlendirdi ve sınırlı PASS verdi. İstenen model gpt-6-luna/max; bağımsız runtime attestation unavailable. Root tamamlanma bildirimi ardından özgün raporun tamamını okuyup bayt ve SHA doğruladı. Aynı SOURCE için sekiz CI ailesi ve gerçek PR T3 başarılı; push T3 atlaması ayrıdır. Her işin gerçek başı, sonucu ve API adım kullanılabilirliği aşağıda ayrı kayıtlıdır.

Yerel 482 test (473 korunan + 9 yeni), ayrı native 10, 56 dosyada format değişikliği yok, analiz sorunu yok, graph 42 test/worst0/index116. 36 responsive senaryo; R4 22 durum/123PNG/85özgün/38 tam kopya. Root 50 yeni original açtı, 35 görüntü önceki gerçek okumaya tam bayt eşliğiyle bağlı. R1 ret, R2 Q11 belirsizliği ve ek rapor aynen korunur; sonraki bağımsız ilk okuma güncel görüntüler için ayrı hükümdür.

FINAL yalnız profil/paket/görev/kanıt ve registry/routing olmak üzere altı metadata dosyasıdır. ACTIVE/DONE durumları yalnız bu seçim değerlendirmesi sunumu için birleştirilmemiş kabul adayıdır. Ayrı FINAL incelemesi, aynı FINAL CI/T3, olağan birleştirme ve fetch edilmiş main üzerinde sekiz CI geçmeden gerçek 112/94/206 değişmez. Bu dilim hak veya seçim yazmaz. Gerçek E3/E5 üreticisi, üretim aktivasyonu, fiziksel bakım izni, uzman içeriği, insan/cihaz/yayın kabulü HELD; E3R1 REVIEW ve E5 IN_PROGRESS korunur.

## Tam özgün SOURCE raporu

10604 bayt; SHA256 f259e988a2059d36b2f98243fdddebe1831b52fbb4247c03e239eac4880287f3

<pre># T-E1-025 SOURCE Bağımsız Bütünsel İncelemesi

## Hüküm

**PASS — P1: 0; P2: 0.** Bu, PR #126 için SOURCE &#96;138123e9815633be1b72bf9508ba7ec414801688&#96; üzerinde sınırları belirlenmiş bir incelemedir. T-E1-025’in tamamlandığı veya üretimde bir hak tanındığı iddiası değildir.

## İnceleme kimliği ve kaynak bütünlüğü

- APP: &#96;C:\Users\Xpike\.codex\worktrees\e4-required-auto-transfer\kavriva-app&#96;; HEAD &#96;138123e9815633be1b72bf9508ba7ec414801688&#96;; inceleme sırasında çalışma ağacı temizdi.
- Karşılaştırma tabanı: &#96;29cf09064bb775324d36129001c6ba9b9869bd5a&#96;.
- Yetkili plan: &#96;origin/main&#96;, &#96;fa914f013fdcd032faed876689092da245989459&#96; commit’inde. Yerel plan dalındaki birleştirilmemiş DEC-0070 yetkili kaynak olarak kullanılmadı.
- PR: &#96;https://github.com/xpike-dgm/kavriva-app/pull/126&#96;.
- Fark kümesi &#96;scope.json&#96; içindeki 14 yol ile birebir eşleşiyor; BASE’e sabitlenmiş 173 dosyanın tümü eşleşiyor. Kapsam dışı yol veya pin uyuşmazlığı bulunmadı. &#96;git diff --check&#96; temiz; 7.314 ekleme ve 8 silme var.
- Dondurulmuş üç kaynak özeti doğrulandı: &#96;replacement_right.dart&#96; = &#96;9f3e132b8905c11ca06a6c44de8ef2778e45f4a4bcd9a9f1a3f441fab8bcc475&#96;; &#96;replacement_right_test.dart&#96; = &#96;a87d6e2987d00d93a5141ff6587f718ec52e883bf7057f81fcb59cf517952601&#96;; &#96;replacement_right_reading_questions.json&#96; = &#96;c9aa588599797fbdcd114f14f932abf3d7263be0e298ab938968092b39d471c0&#96; (2.000 bayt; sabit 20 soruluk fixture).
- Korunan E-DEV-123 snapshot’ının SHA-256 özeti &#96;6a01afb1edfcdfbce687621a56fcb5afc415224221004446f35aece7229ec6e8&#96;. Snapshot RAW v90 bayt düzeyinde aynı; yeni envanter v91’i ekliyor.

## Kaynak kodu ve sınır incelemesi

Yetkili AI_START_HERE, TASK_EXECUTION_PROTOCOL, MODULE_BOUNDARIES, PACK_STANDARD, T-E1-025 ve ilgili task index, dependency graph ve acceptance matrix, DEC-0053, Q222/Q227 ile komşu güvenlik sorularını; ayrıca ilgili E1, E3, E5, UI, tasarım ve kapanış kaynaklarını okudum. T-E1-025, sınırları belirlenmiş DONE olan T-E1-014a önkoşuluna bağlı bir E1 sunum/değerlendirme isteği dilimidir. Gerekli uzman belgesi bulunmadığından T023/T024, talimat doğrultusunda HELD kalıyor; T025 bağımsız incelenebilir. Kabul kapsamı ilk fiziksel adımdan önce yanlış rehber seçimini düzeltmek ve kullanıcı hatası olmadan geri çekilen bir rehber için yalnız sunucu MAY kararı varsa yeniden seçim değerlendirmesi istemekle sınırlı. DEC-0053’teki tek seçili motosiklet için tam rehber hakkı korunuyor: hak taşınır ve üst üste eklenmez. Fiyat, süre, sıklık, deneme ve tanımlanmamış diğer politikalar HELD; yeni politika veya teknik rehber içeriği uydurulmuyor.

Yeni uygulama kodu, yerel ve değişmez bir E1 görünüm modeli ile türü belirlenmiş intent yüzeyidir. Var olan entitlement/read sözleşmelerini ve history kapsamını kullanır; E3/E5 bağımlılık kenarı, Auth/veritabanı bağımlılığı, entitlement yazıcısı veya hak tanıma yolu eklemez. İstek demeti hesap, motosiklet/bağlam, rehber, seçim ve istek revizyonları, amaç, plan konusu ve güncel referansları bağlar. Özel ayrıntılar için güncel hesap yetkisi ve ilgili tüm history okuma boyutları gerekir. İstek ayrıca kapsama bağlı kararı ve altı etkinin tüm referanslarını gerektirir. Değişmez snapshot’lar, yakalanmış callback’in yeniden doğrulanması, epoch/fingerprint kontrolleri, istek anahtarıyla yinelenen gönderimi önleme ve açık yenileme işlemi; eski callback, replay, ABA, çift gönderim ve handler bulunmaması durumlarını kapsar. Offline, busy, failed, received, denied, held, unknown ve eksik yetki durumları hak verilmiş ya da seçim değişmiş gibi gösterilmez.

Kaydedilmiş geçmiş, kanıt, düzeltme, dışa aktarma, güvenlik ve kurtarma yolları kendi güncel hesap ve yol başına okuma kontrollerini korur; bu kontroller seçim değerlendirmesinden ayrıdır. Başka hesap/motosiklet/rehber kararları mevcut özel ayrıntı gibi gösterilmez. Güncel metin, işlemden önce düğmenin yalnız sunucu değerlendirmesi istediğini, hak vermediğini ve rehberi değiştirmediğini; eski kayıtları okuma yetkisinin ayrı denetlendiğini açıkça söyler. Hesap okuma yetkisi olmayan durumda korunan kayıt yolları kapalı kalırken, ayrıca yetkilendirilmiş seçim değerlendirmesi açık olabilir. Güvenlik/kurtarma erişimi, işe devam izni veya güvenli sonuç kaydı olarak anlatılmaz. Fiziksel işe başlanmış ya da başlangıç durumu bilinmiyorsa düzeltme yolu kapalıdır; ayrı yeniden seçim değerlendirmesi yalnız sunucu isteğidir ve kurtarma önlemlerini geçersiz kılmaz.

Canlı yeniden seçim sağlayıcısı veya üretim hak yazıcısı yoktur. Olumlu fixture’lar açıkça örnek olarak işaretlenmiştir ve canlı yetki değildir. Bu kaynak bir değerlendirme isteği sunabilir; motosiklet/rehber hakkı tanıyamaz. Uygulama üretimdeki sağlayıcının davranışı hakkında iddiada bulunmaz.

Yeni E-DEV-124 kanıtı ek niteliğindedir. E-DEV-123 ilk primary subject’ini, gövdesini, digest/tarihini ve eski makbuzlarını korur; &#96;used_by&#96; ekleri ve PR-125 makbuzu yalnız sona eklenmiştir. Registry/routing/inventory güncellemeleri belgeseldir, T-E1-025’i terfi ettirmez. Durum toplamları 112 gerçek DONE, 94 kalan, 206 toplam olarak korunur; T-E1-025 REVIEW, E3R1 REVIEW, E5 IN_PROGRESS durumundadır. Var olan E1, E3 ve E5 runtime/yetki sınırları korunmuştur.

## Bulgular ve önceki inceleme geçmişi

Güncel P1/P2 kusuru bulunmadı. Önceki R1’de Q17 ve Q18 için verilen RET kararları ve önceki R2’de Q11 için verilen &#96;BELİRSİZ&#96; kararı korunuyor; bu inceleme geçmiş hükümleri değiştirmiyor. R2’nin Q1/Q6 eki de kayıttaki gibi duruyor. Güncel UI’da işlem öncesi “yalnız sunucu değerlendirmesi/hak yok/rehber değişmez” açıklaması ve eski kayıtları okuma yetkisinin ayrı olduğuna dair açıklama, iki yetki kontrolünü birleştirmeden Q11 belirsizliğini gideriyor. Bağımsız yeni R3 kör okuması güncel okuma sonucu olarak korunuyor: 20 fixture sorusunun tümü PASS; rapor SHA-256 &#96;89116b5bf70481d6985edefc5d4df6e2ea1f6b581721ab7b33bb14a5d7579847&#96; (5.509 bayt); marker dosyası SHA-256 &#96;a3cf316861582aa919f1e9d18a32441d8f0c0fb075bfaa12f952a9031106918e&#96; (10.014 bayt). Eski harness/graph ve okuma RET/FAIL kanıtları korunmuş, üzerine yazılmamıştır.

## Yerel doğrulama ve görsel inceleme

Dondurulmuş yerel makbuzları okudum; toplu testleri yeniden çalıştırmaya gerek olmadı. Hedef testler: 9/9 PASS. Tam test kümesi: 482/482 PASS (473 korunan taban + 9 yeni). Native harness: 10/10 PASS (9 hedef testi ve capture). Format: 56 dosya, 0 değişiklik. Analyze: 0 sorun. Graph: 42 test, en kötü çıkış kodu 0. Bunlar yeni çalıştırma değil, saklanan R4 yerel kanıtlarıdır.

Native R4 manifestosu 22 durum, 123 PNG, 85 benzersiz capture ve bayt düzeyinde aynı 38 alias içeriyor. Olumlu düzeltme/yeniden seçim örneklerinin, hesap okuma izni olmayan korumaların, offline durumunun ve büyük yazılı/uzun son-scroll görünümlerinin özgün çözünürlüklü capture’larını açtım. Olumlu fixture’lar örnek olarak işaretli; eski kayıt okuma yetkisinin ayrılığı görünür; ilgili okuma yetkisi olmadığında korunan yollar kapalı; güvenlik/kurtarma seçenekleri ve geri dönme/destek gezinmesi görünümde bulunuyor; okuma eylemleri kendi yetkilerine bağlı. İncelenen son-scroll görünümlerinde eylem kırpılması yok. Root’un ayrı native R4 okuma makbuzu 50 yeni özgün görüntü ile daha önce açılan görüntülere bayt düzeyinde eşit 35 alias kaydediyor. R4 capture dosyalarının native-r4 klasöründe native-r3 önekli ad taşıması kayıttaki gibi.

## SOURCE CI doğrulaması

&#96;source-ci.json&#96;, &#96;source-ci-root-read.json&#96;, 17 adet &#96;source-&lt;runid&gt;.log&#96; dosyasını, mevcut her API adımını ve her ham bayt sayısı/SHA değerini root-read makbuzuyla karşılaştırarak bağımsız doğruladım. İki manifest ve tüm run/job head’leri SOURCE &#96;138123e9815633be1b72bf9508ba7ec414801688&#96; gösteriyor; ham log uzunlukları ve SHA’ları eşleşiyor. CI manifest SHA-256: &#96;9093b660b86f3199b166ff51060d3f50cbf78951f84254d0e2a7613ba56b10ab&#96;; root-read SHA-256: &#96;05f2a3aa43a2ed782ed7b70f3b53383618cb479988e61d8d49c3996188ff825c&#96;.

17 run’ın tümü (9 pull_request, 8 push; 8 workflow ailesi) başarıyla tamamlandı. 20 job’dan 19’u başarılı; tek skip, adımı olmayan ve beklenen push architecture &#96;t3-gate&#96; job’udur. İki pull-request architecture run’ındaki &#96;t3-gate&#96; job’ları başarılıdır. Başarılı job’ların adımları mevcut ve kaydedilen tüm adımlar başarılıdır. Ham log çıktıları ayrıca E1 482 test, format 56/0 değişiklik, analyze 0, E3 107, E4 176, E5 59, E6 50, E9 9, graph 42, index 116 satır, 503 Markdown dosyasında 393 identity ID’si ve 123 evidence kaydı sonuçlarını doğruluyor. İki yalıtılmış CI Auth/defense run’ı signup/current-session/guarded-maintenance-commit/logout PASS ve private Storage/Data API/client-role ile restrictive-write probe’ları PASS olarak raporluyor. Bu yalıtılmış test ortamı sonuçları E1’in üretim yeniden seçim sağlayıcısına bağlı olduğunu kanıtlamaz.

## Sınırlandırılmış iddia ve model doğrulaması

İstenen incelemeci modeli &#96;gpt-6-luna&#96;, akıl yürütme düzeyi &#96;max&#96; idi. Runtime model doğrulaması bu inceleme için mevcut değil; bu nedenle çalışma zamanının gerçekten bu modeli kullandığı iddia edilmiyor. CI, fixture, görsel ve statik kanıtlar yalnız yukarıda tanımlanan sınırlandırılmış SOURCE incelemesini destekliyor; canlı üretim yetkisi veya insan/cihaz davranışı doğrulanmış değildir.

## Düzeltme ve korunma notu

&#96;first-reading-r3-markers.txt&#96; bağımsız olarak yeniden özetlendi: 10.014 bayt, SHA-256 &#96;a3cf316861582aa919f1e9d18a32441d8f0c0fb075bfaa12f952a9031106918e&#96;. Bu Türkçe düzeltilmiş tam sürüm, önceki İngilizce rapordaki marker SHA’sının sonundaki eksik &#96;e&#96; karakterini düzeltir. Özgün İngilizce &#96;source-whole-review.txt&#96;, 8.873 bayt ve SHA-256 &#96;56aed42aefff9040f6befd173a2f4b0bef3bd081a21586fc6d180e24261089b8&#96; ile değiştirilmeden korunmuştur. Daha önce hazırlanmış düzeltilmiş İngilizce &#96;source-whole-review-r2.txt&#96; de 9.368 bayt ve SHA-256 &#96;ba40146b87af98017e5c89d6b29ecfcbbcf63b41944399a5ebde5632770ec1c0&#96; ile değiştirilmeden korunmuştur. Bu çeviri dışında hüküm, kapsam, SOURCE/HEAD veya CI sonucu değişmemiştir.</pre>

RAW Base64: IyBULUUxLTAyNSBTT1VSQ0UgQmHEn8SxbXPEsXogQsO8dMO8bnNlbCDEsG5jZWxlbWVzaQoKIyMgSMO8a8O8bQoKKipQQVNTIOKAlCBQMTogMDsgUDI6IDAuKiogQnUsIFBSICMxMjYgacOnaW4gU09VUkNFIGAxMzgxMjNlOTgxNTYzM2JlMWI3MmJmOTUwOGJhN2VjNDE0ODAxNjg4YCDDvHplcmluZGUgc8SxbsSxcmxhcsSxIGJlbGlybGVubWnFnyBiaXIgaW5jZWxlbWVkaXIuIFQtRTEtMDI14oCZaW4gdGFtYW1sYW5kxLHEn8SxIHZleWEgw7xyZXRpbWRlIGJpciBoYWsgdGFuxLFuZMSxxJ/EsSBpZGRpYXPEsSBkZcSfaWxkaXIuCgojIyDEsG5jZWxlbWUga2ltbGnEn2kgdmUga2F5bmFrIGLDvHTDvG5sw7zEn8O8CgotIEFQUDogYEM6XFVzZXJzXFhwaWtlXC5jb2RleFx3b3JrdHJlZXNcZTQtcmVxdWlyZWQtYXV0by10cmFuc2ZlclxrYXZyaXZhLWFwcGA7IEhFQUQgYDEzODEyM2U5ODE1NjMzYmUxYjcyYmY5NTA4YmE3ZWM0MTQ4MDE2ODhgOyBpbmNlbGVtZSBzxLFyYXPEsW5kYSDDp2FsxLHFn21hIGHEn2FjxLEgdGVtaXpkaS4KLSBLYXLFn8SxbGHFn3TEsXJtYSB0YWJhbsSxOiBgMjljZjA5MDY0YmI3NzUzMjRkMzYxMjkwMDFjNmJhOWI5ODY5YmQ1YWAuCi0gWWV0a2lsaSBwbGFuOiBgb3JpZ2luL21haW5gLCBgZmE5MTRmMDEzZmRjZDAzMmZhZWQ4NzY2ODkwOTJkYTI0NTk4OTQ1OWAgY29tbWl04oCZaW5kZS4gWWVyZWwgcGxhbiBkYWzEsW5kYWtpIGJpcmxlxZ90aXJpbG1lbWnFnyBERUMtMDA3MCB5ZXRraWxpIGtheW5hayBvbGFyYWsga3VsbGFuxLFsbWFkxLEuCi0gUFI6IGBodHRwczovL2dpdGh1Yi5jb20veHBpa2UtZGdtL2thdnJpdmEtYXBwL3B1bGwvMTI2YC4KLSBGYXJrIGvDvG1lc2kgYHNjb3BlLmpzb25gIGnDp2luZGVraSAxNCB5b2wgaWxlIGJpcmViaXIgZcWfbGXFn2l5b3I7IEJBU0XigJllIHNhYml0bGVubWnFnyAxNzMgZG9zeWFuxLFuIHTDvG3DvCBlxZ9sZcWfaXlvci4gS2Fwc2FtIGTEscWfxLEgeW9sIHZleWEgcGluIHV5dcWfbWF6bMSxxJ/EsSBidWx1bm1hZMSxLiBgZ2l0IGRpZmYgLS1jaGVja2AgdGVtaXo7IDcuMzE0IGVrbGVtZSB2ZSA4IHNpbG1lIHZhci4KLSBEb25kdXJ1bG11xZ8gw7zDpyBrYXluYWsgw7Z6ZXRpIGRvxJ9ydWxhbmTEsTogYHJlcGxhY2VtZW50X3JpZ2h0LmRhcnRgID0gYDlmM2UxMzJiODkwNWMxMWNhMDZhNmM0NGRlOGVmMjc3OGU0NWY0YTRiY2Q5YTlmMWEzZjQ0MWZhYjhiY2M0NzVgOyBgcmVwbGFjZW1lbnRfcmlnaHRfdGVzdC5kYXJ0YCA9IGBhODdkNmUyOTg3ZDAwZDkzYTUxNDFmZjY1ODdmNzE4ZWM1MmU4ODNiZjcwNTdmODFmY2I1OWNmNTE3OTUyNjAxYDsgYHJlcGxhY2VtZW50X3JpZ2h0X3JlYWRpbmdfcXVlc3Rpb25zLmpzb25gID0gYGM5YWE1ODg1OTk3OTdmYmRjZDExNGYxNGY5MzJhYmYzZDcyNjNiZTBlMjk4YWI5Mzg5NjgwOTJiMzlkNDcxYzBgICgyLjAwMCBiYXl0OyBzYWJpdCAyMCBzb3J1bHVrIGZpeHR1cmUpLgotIEtvcnVuYW4gRS1ERVYtMTIzIHNuYXBzaG904oCZxLFuxLFuIFNIQS0yNTYgw7Z6ZXRpIGA2YTAxYWZiMWVkZmNkZmJjZTY4NzYyMWE1NmZjYjVhZmM0MTUyMjQyMjEwMDQ0NDZmMzVhZWNlNzIyOWVjNmU4YC4gU25hcHNob3QgUkFXIHY5MCBiYXl0IGTDvHpleWluZGUgYXluxLE7IHllbmkgZW52YW50ZXIgdjkx4oCZaSBla2xpeW9yLgoKIyMgS2F5bmFrIGtvZHUgdmUgc8SxbsSxciBpbmNlbGVtZXNpCgpZZXRraWxpIEFJX1NUQVJUX0hFUkUsIFRBU0tfRVhFQ1VUSU9OX1BST1RPQ09MLCBNT0RVTEVfQk9VTkRBUklFUywgUEFDS19TVEFOREFSRCwgVC1FMS0wMjUgdmUgaWxnaWxpIHRhc2sgaW5kZXgsIGRlcGVuZGVuY3kgZ3JhcGggdmUgYWNjZXB0YW5jZSBtYXRyaXgsIERFQy0wMDUzLCBRMjIyL1EyMjcgaWxlIGtvbcWfdSBnw7x2ZW5saWsgc29ydWxhcsSxbsSxOyBheXLEsWNhIGlsZ2lsaSBFMSwgRTMsIEU1LCBVSSwgdGFzYXLEsW0gdmUga2FwYW7EscWfIGtheW5ha2xhcsSxbsSxIG9rdWR1bS4gVC1FMS0wMjUsIHPEsW7EsXJsYXLEsSBiZWxpcmxlbm1pxZ8gRE9ORSBvbGFuIFQtRTEtMDE0YSDDtm5rb8WfdWx1bmEgYmHEn2zEsSBiaXIgRTEgc3VudW0vZGXEn2VybGVuZGlybWUgaXN0ZcSfaSBkaWxpbWlkaXIuIEdlcmVrbGkgdXptYW4gYmVsZ2VzaSBidWx1bm1hZMSxxJ/EsW5kYW4gVDAyMy9UMDI0LCB0YWxpbWF0IGRvxJ9ydWx0dXN1bmRhIEhFTEQga2FsxLF5b3I7IFQwMjUgYmHEn8SxbXPEsXogaW5jZWxlbmViaWxpci4gS2FidWwga2Fwc2FtxLEgaWxrIGZpemlrc2VsIGFkxLFtZGFuIMO2bmNlIHlhbmzEscWfIHJlaGJlciBzZcOnaW1pbmkgZMO8emVsdG1layB2ZSBrdWxsYW7EsWPEsSBoYXRhc8SxIG9sbWFkYW4gZ2VyaSDDp2VraWxlbiBiaXIgcmVoYmVyIGnDp2luIHlhbG7EsXogc3VudWN1IE1BWSBrYXJhcsSxIHZhcnNhIHllbmlkZW4gc2XDp2ltIGRlxJ9lcmxlbmRpcm1lc2kgaXN0ZW1la2xlIHPEsW7EsXJsxLEuIERFQy0wMDUz4oCZdGVraSB0ZWsgc2XDp2lsaSBtb3Rvc2lrbGV0IGnDp2luIHRhbSByZWhiZXIgaGFra8SxIGtvcnVudXlvcjogaGFrIHRhxZ/EsW7EsXIgdmUgw7xzdCDDvHN0ZSBla2xlbm1lei4gRml5YXQsIHPDvHJlLCBzxLFrbMSxaywgZGVuZW1lIHZlIHRhbsSxbWxhbm1hbcSxxZ8gZGnEn2VyIHBvbGl0aWthbGFyIEhFTEQ7IHllbmkgcG9saXRpa2EgdmV5YSB0ZWtuaWsgcmVoYmVyIGnDp2VyacSfaSB1eWR1cnVsbXV5b3IuCgpZZW5pIHV5Z3VsYW1hIGtvZHUsIHllcmVsIHZlIGRlxJ9pxZ9tZXogYmlyIEUxIGfDtnLDvG7DvG0gbW9kZWxpIGlsZSB0w7xyw7wgYmVsaXJsZW5tacWfIGludGVudCB5w7x6ZXlpZGlyLiBWYXIgb2xhbiBlbnRpdGxlbWVudC9yZWFkIHPDtnpsZcWfbWVsZXJpbmkgdmUgaGlzdG9yeSBrYXBzYW3EsW7EsSBrdWxsYW7EsXI7IEUzL0U1IGJhxJ/EsW1sxLFsxLFrIGtlbmFyxLEsIEF1dGgvdmVyaXRhYmFuxLEgYmHEn8SxbWzEsWzEscSfxLEsIGVudGl0bGVtZW50IHlhesSxY8Sxc8SxIHZleWEgaGFrIHRhbsSxbWEgeW9sdSBla2xlbWV6LiDEsHN0ZWsgZGVtZXRpIGhlc2FwLCBtb3Rvc2lrbGV0L2JhxJ9sYW0sIHJlaGJlciwgc2XDp2ltIHZlIGlzdGVrIHJldml6eW9ubGFyxLEsIGFtYcOnLCBwbGFuIGtvbnVzdSB2ZSBnw7xuY2VsIHJlZmVyYW5zbGFyxLEgYmHEn2xhci4gw5Z6ZWwgYXlyxLFudMSxbGFyIGnDp2luIGfDvG5jZWwgaGVzYXAgeWV0a2lzaSB2ZSBpbGdpbGkgdMO8bSBoaXN0b3J5IG9rdW1hIGJveXV0bGFyxLEgZ2VyZWtpci4gxLBzdGVrIGF5csSxY2Ega2Fwc2FtYSBiYcSfbMSxIGthcmFyxLEgdmUgYWx0xLEgZXRraW5pbiB0w7xtIHJlZmVyYW5zbGFyxLFuxLEgZ2VyZWt0aXJpci4gRGXEn2nFn21leiBzbmFwc2hvdOKAmWxhciwgeWFrYWxhbm3EscWfIGNhbGxiYWNr4oCZaW4geWVuaWRlbiBkb8SfcnVsYW5tYXPEsSwgZXBvY2gvZmluZ2VycHJpbnQga29udHJvbGxlcmksIGlzdGVrIGFuYWh0YXLEsXlsYSB5aW5lbGVuZW4gZ8O2bmRlcmltaSDDtm5sZW1lIHZlIGHDp8SxayB5ZW5pbGVtZSBpxZ9sZW1pOyBlc2tpIGNhbGxiYWNrLCByZXBsYXksIEFCQSwgw6dpZnQgZ8O2bmRlcmltIHZlIGhhbmRsZXIgYnVsdW5tYW1hc8SxIGR1cnVtbGFyxLFuxLEga2Fwc2FyLiBPZmZsaW5lLCBidXN5LCBmYWlsZWQsIHJlY2VpdmVkLCBkZW5pZWQsIGhlbGQsIHVua25vd24gdmUgZWtzaWsgeWV0a2kgZHVydW1sYXLEsSBoYWsgdmVyaWxtacWfIHlhIGRhIHNlw6dpbSBkZcSfacWfbWnFnyBnaWJpIGfDtnN0ZXJpbG1lei4KCktheWRlZGlsbWnFnyBnZcOnbWnFnywga2FuxLF0LCBkw7x6ZWx0bWUsIGTEscWfYSBha3Rhcm1hLCBnw7x2ZW5saWsgdmUga3VydGFybWEgeW9sbGFyxLEga2VuZGkgZ8O8bmNlbCBoZXNhcCB2ZSB5b2wgYmHFn8SxbmEgb2t1bWEga29udHJvbGxlcmluaSBrb3J1cjsgYnUga29udHJvbGxlciBzZcOnaW0gZGXEn2VybGVuZGlybWVzaW5kZW4gYXlyxLFkxLFyLiBCYcWfa2EgaGVzYXAvbW90b3Npa2xldC9yZWhiZXIga2FyYXJsYXLEsSBtZXZjdXQgw7Z6ZWwgYXlyxLFudMSxIGdpYmkgZ8O2c3RlcmlsbWV6LiBHw7xuY2VsIG1ldGluLCBpxZ9sZW1kZW4gw7ZuY2UgZMO8xJ9tZW5pbiB5YWxuxLF6IHN1bnVjdSBkZcSfZXJsZW5kaXJtZXNpIGlzdGVkacSfaW5pLCBoYWsgdmVybWVkacSfaW5pIHZlIHJlaGJlcmkgZGXEn2nFn3Rpcm1lZGnEn2luaTsgZXNraSBrYXnEsXRsYXLEsSBva3VtYSB5ZXRraXNpbmluIGF5csSxIGRlbmV0bGVuZGnEn2luaSBhw6fEsWvDp2Egc8O2eWxlci4gSGVzYXAgb2t1bWEgeWV0a2lzaSBvbG1heWFuIGR1cnVtZGEga29ydW5hbiBrYXnEsXQgeW9sbGFyxLEga2FwYWzEsSBrYWzEsXJrZW4sIGF5csSxY2EgeWV0a2lsZW5kaXJpbG1pxZ8gc2XDp2ltIGRlxJ9lcmxlbmRpcm1lc2kgYcOnxLFrIG9sYWJpbGlyLiBHw7x2ZW5saWsva3VydGFybWEgZXJpxZ9pbWksIGnFn2UgZGV2YW0gaXpuaSB2ZXlhIGfDvHZlbmxpIHNvbnXDpyBrYXlkxLEgb2xhcmFrIGFubGF0xLFsbWF6LiBGaXppa3NlbCBpxZ9lIGJhxZ9sYW5txLHFnyB5YSBkYSBiYcWfbGFuZ8Sxw6cgZHVydW11IGJpbGlubWl5b3JzYSBkw7x6ZWx0bWUgeW9sdSBrYXBhbMSxZMSxcjsgYXlyxLEgeWVuaWRlbiBzZcOnaW0gZGXEn2VybGVuZGlybWVzaSB5YWxuxLF6IHN1bnVjdSBpc3RlxJ9pZGlyIHZlIGt1cnRhcm1hIMO2bmxlbWxlcmluaSBnZcOnZXJzaXoga8SxbG1hei4KCkNhbmzEsSB5ZW5pZGVuIHNlw6dpbSBzYcSfbGF5xLFjxLFzxLEgdmV5YSDDvHJldGltIGhhayB5YXrEsWPEsXPEsSB5b2t0dXIuIE9sdW1sdSBmaXh0dXJl4oCZbGFyIGHDp8Sxa8OnYSDDtnJuZWsgb2xhcmFrIGnFn2FyZXRsZW5tacWfdGlyIHZlIGNhbmzEsSB5ZXRraSBkZcSfaWxkaXIuIEJ1IGtheW5hayBiaXIgZGXEn2VybGVuZGlybWUgaXN0ZcSfaSBzdW5hYmlsaXI7IG1vdG9zaWtsZXQvcmVoYmVyIGhha2vEsSB0YW7EsXlhbWF6LiBVeWd1bGFtYSDDvHJldGltZGVraSBzYcSfbGF5xLFjxLFuxLFuIGRhdnJhbsSxxZ/EsSBoYWtrxLFuZGEgaWRkaWFkYSBidWx1bm1hei4KClllbmkgRS1ERVYtMTI0IGthbsSxdMSxIGVrIG5pdGVsacSfaW5kZWRpci4gRS1ERVYtMTIzIGlsayBwcmltYXJ5IHN1YmplY3TigJlpbmksIGfDtnZkZXNpbmksIGRpZ2VzdC90YXJpaGluaSB2ZSBlc2tpIG1ha2J1emxhcsSxbsSxIGtvcnVyOyBgdXNlZF9ieWAgZWtsZXJpIHZlIFBSLTEyNSBtYWtidXp1IHlhbG7EsXogc29uYSBla2xlbm1pxZ90aXIuIFJlZ2lzdHJ5L3JvdXRpbmcvaW52ZW50b3J5IGfDvG5jZWxsZW1lbGVyaSBiZWxnZXNlbGRpciwgVC1FMS0wMjXigJlpIHRlcmZpIGV0dGlybWV6LiBEdXJ1bSB0b3BsYW1sYXLEsSAxMTIgZ2Vyw6dlayBET05FLCA5NCBrYWxhbiwgMjA2IHRvcGxhbSBvbGFyYWsga29ydW51cjsgVC1FMS0wMjUgUkVWSUVXLCBFM1IxIFJFVklFVywgRTUgSU5fUFJPR1JFU1MgZHVydW11bmRhZMSxci4gVmFyIG9sYW4gRTEsIEUzIHZlIEU1IHJ1bnRpbWUveWV0a2kgc8SxbsSxcmxhcsSxIGtvcnVubXXFn3R1ci4KCiMjIEJ1bGd1bGFyIHZlIMO2bmNla2kgaW5jZWxlbWUgZ2XDp21pxZ9pCgpHw7xuY2VsIFAxL1AyIGt1c3VydSBidWx1bm1hZMSxLiDDlm5jZWtpIFIx4oCZZGUgUTE3IHZlIFExOCBpw6dpbiB2ZXJpbGVuIFJFVCBrYXJhcmxhcsSxIHZlIMO2bmNla2kgUjLigJlkZSBRMTEgacOnaW4gdmVyaWxlbiBgQkVMxLBSU8SwWmAga2FyYXLEsSBrb3J1bnV5b3I7IGJ1IGluY2VsZW1lIGdlw6dtacWfIGjDvGvDvG1sZXJpIGRlxJ9pxZ90aXJtaXlvci4gUjLigJluaW4gUTEvUTYgZWtpIGRlIGthecSxdHRha2kgZ2liaSBkdXJ1eW9yLiBHw7xuY2VsIFVJ4oCZZGEgacWfbGVtIMO2bmNlc2kg4oCceWFsbsSxeiBzdW51Y3UgZGXEn2VybGVuZGlybWVzaS9oYWsgeW9rL3JlaGJlciBkZcSfacWfbWV64oCdIGHDp8Sxa2xhbWFzxLEgdmUgZXNraSBrYXnEsXRsYXLEsSBva3VtYSB5ZXRraXNpbmluIGF5csSxIG9sZHXEn3VuYSBkYWlyIGHDp8Sxa2xhbWEsIGlraSB5ZXRraSBrb250cm9sw7xuw7wgYmlybGXFn3Rpcm1lZGVuIFExMSBiZWxpcnNpemxpxJ9pbmkgZ2lkZXJpeW9yLiBCYcSfxLFtc8SxeiB5ZW5pIFIzIGvDtnIgb2t1bWFzxLEgZ8O8bmNlbCBva3VtYSBzb251Y3Ugb2xhcmFrIGtvcnVudXlvcjogMjAgZml4dHVyZSBzb3J1c3VudW4gdMO8bcO8IFBBU1M7IHJhcG9yIFNIQS0yNTYgYDg5MTE2YjViZjcwNDgxZDY5ODVlZGVmYzVkNGRmNmUyZWExZjZiNTgxNzIxYWI3YjMzYmIxNGE1ZDc1Nzk4NDdgICg1LjUwOSBiYXl0KTsgbWFya2VyIGRvc3lhc8SxIFNIQS0yNTYgYGEzY2YzMTY4NjE1ODJhYTkxOWYxZTlkMThhMzI0NDFkOGYwYzBmYjA3NWJmYWExMmY5NTJhOTAzMTEwNjkxOGVgICgxMC4wMTQgYmF5dCkuIEVza2kgaGFybmVzcy9ncmFwaCB2ZSBva3VtYSBSRVQvRkFJTCBrYW7EsXRsYXLEsSBrb3J1bm11xZ8sIMO8emVyaW5lIHlhesSxbG1hbcSxxZ90xLFyLgoKIyMgWWVyZWwgZG/En3J1bGFtYSB2ZSBnw7Zyc2VsIGluY2VsZW1lCgpEb25kdXJ1bG11xZ8geWVyZWwgbWFrYnV6bGFyxLEgb2t1ZHVtOyB0b3BsdSB0ZXN0bGVyaSB5ZW5pZGVuIMOnYWzEscWfdMSxcm1heWEgZ2VyZWsgb2xtYWTEsS4gSGVkZWYgdGVzdGxlcjogOS85IFBBU1MuIFRhbSB0ZXN0IGvDvG1lc2k6IDQ4Mi80ODIgUEFTUyAoNDczIGtvcnVuYW4gdGFiYW4gKyA5IHllbmkpLiBOYXRpdmUgaGFybmVzczogMTAvMTAgUEFTUyAoOSBoZWRlZiB0ZXN0aSB2ZSBjYXB0dXJlKS4gRm9ybWF0OiA1NiBkb3N5YSwgMCBkZcSfacWfaWtsaWsuIEFuYWx5emU6IDAgc29ydW4uIEdyYXBoOiA0MiB0ZXN0LCBlbiBrw7Z0w7wgw6fEsWvEscWfIGtvZHUgMC4gQnVubGFyIHllbmkgw6dhbMSxxZ90xLFybWEgZGXEn2lsLCBzYWtsYW5hbiBSNCB5ZXJlbCBrYW7EsXRsYXLEsWTEsXIuCgpOYXRpdmUgUjQgbWFuaWZlc3Rvc3UgMjIgZHVydW0sIDEyMyBQTkcsIDg1IGJlbnplcnNpeiBjYXB0dXJlIHZlIGJheXQgZMO8emV5aW5kZSBheW7EsSAzOCBhbGlhcyBpw6dlcml5b3IuIE9sdW1sdSBkw7x6ZWx0bWUveWVuaWRlbiBzZcOnaW0gw7ZybmVrbGVyaW5pbiwgaGVzYXAgb2t1bWEgaXpuaSBvbG1heWFuIGtvcnVtYWxhcsSxbiwgb2ZmbGluZSBkdXJ1bXVudW4gdmUgYsO8ecO8ayB5YXrEsWzEsS91enVuIHNvbi1zY3JvbGwgZ8O2csO8bsO8bWxlcmluaW4gw7Z6Z8O8biDDp8O2esO8bsO8cmzDvGtsw7wgY2FwdHVyZeKAmWxhcsSxbsSxIGHDp3TEsW0uIE9sdW1sdSBmaXh0dXJl4oCZbGFyIMO2cm5layBvbGFyYWsgacWfYXJldGxpOyBlc2tpIGthecSxdCBva3VtYSB5ZXRraXNpbmluIGF5csSxbMSxxJ/EsSBnw7Zyw7xuw7xyOyBpbGdpbGkgb2t1bWEgeWV0a2lzaSBvbG1hZMSxxJ/EsW5kYSBrb3J1bmFuIHlvbGxhciBrYXBhbMSxOyBnw7x2ZW5saWsva3VydGFybWEgc2XDp2VuZWtsZXJpIHZlIGdlcmkgZMO2bm1lL2Rlc3RlayBnZXppbm1lc2kgZ8O2csO8bsO8bWRlIGJ1bHVudXlvcjsgb2t1bWEgZXlsZW1sZXJpIGtlbmRpIHlldGtpbGVyaW5lIGJhxJ9sxLEuIMSwbmNlbGVuZW4gc29uLXNjcm9sbCBnw7Zyw7xuw7xtbGVyaW5kZSBleWxlbSBrxLFycMSxbG1hc8SxIHlvay4gUm9vdOKAmXVuIGF5csSxIG5hdGl2ZSBSNCBva3VtYSBtYWtidXp1IDUwIHllbmkgw7Z6Z8O8biBnw7Zyw7xudMO8IGlsZSBkYWhhIMO2bmNlIGHDp8SxbGFuIGfDtnLDvG50w7xsZXJlIGJheXQgZMO8emV5aW5kZSBlxZ9pdCAzNSBhbGlhcyBrYXlkZWRpeW9yLiBSNCBjYXB0dXJlIGRvc3lhbGFyxLFuxLFuIG5hdGl2ZS1yNCBrbGFzw7Zyw7xuZGUgbmF0aXZlLXIzIMO2bmVrbGkgYWQgdGHFn8SxbWFzxLEga2F5xLF0dGFraSBnaWJpLgoKIyMgU09VUkNFIENJIGRvxJ9ydWxhbWFzxLEKCmBzb3VyY2UtY2kuanNvbmAsIGBzb3VyY2UtY2ktcm9vdC1yZWFkLmpzb25gLCAxNyBhZGV0IGBzb3VyY2UtPHJ1bmlkPi5sb2dgIGRvc3lhc8SxbsSxLCBtZXZjdXQgaGVyIEFQSSBhZMSxbcSxbsSxIHZlIGhlciBoYW0gYmF5dCBzYXnEsXPEsS9TSEEgZGXEn2VyaW5pIHJvb3QtcmVhZCBtYWtidXp1eWxhIGthcsWfxLFsYcWfdMSxcmFyYWsgYmHEn8SxbXPEsXogZG/En3J1bGFkxLFtLiDEsGtpIG1hbmlmZXN0IHZlIHTDvG0gcnVuL2pvYiBoZWFk4oCZbGVyaSBTT1VSQ0UgYDEzODEyM2U5ODE1NjMzYmUxYjcyYmY5NTA4YmE3ZWM0MTQ4MDE2ODhgIGfDtnN0ZXJpeW9yOyBoYW0gbG9nIHV6dW5sdWtsYXLEsSB2ZSBTSEHigJlsYXLEsSBlxZ9sZcWfaXlvci4gQ0kgbWFuaWZlc3QgU0hBLTI1NjogYDkwOTNiNjYwYjg2ZjMxOTliMTY2ZmY1MTA2MGQzZjUwY2JmNzg5NTFmODQyNTRkMGUyYTc2MTNiYTU2YjEwYWJgOyByb290LXJlYWQgU0hBLTI1NjogYDA1ZjJhM2FhNDNhMmVkNzgyZWQ3YjcwZjNiNTMzODM2MThjYjQ3OTk4OGU2MWQ4ZDQ5YzM5OTYxODhmZjgyNWNgLgoKMTcgcnVu4oCZxLFuIHTDvG3DvCAoOSBwdWxsX3JlcXVlc3QsIDggcHVzaDsgOCB3b3JrZmxvdyBhaWxlc2kpIGJhxZ9hcsSxeWxhIHRhbWFtbGFuZMSxLiAyMCBqb2LigJlkYW4gMTnigJl1IGJhxZ9hcsSxbMSxOyB0ZWsgc2tpcCwgYWTEsW3EsSBvbG1heWFuIHZlIGJla2xlbmVuIHB1c2ggYXJjaGl0ZWN0dXJlIGB0My1nYXRlYCBqb2LigJl1ZHVyLiDEsGtpIHB1bGwtcmVxdWVzdCBhcmNoaXRlY3R1cmUgcnVu4oCZxLFuZGFraSBgdDMtZ2F0ZWAgam9i4oCZbGFyxLEgYmHFn2FyxLFsxLFkxLFyLiBCYcWfYXLEsWzEsSBqb2LigJlsYXLEsW4gYWTEsW1sYXLEsSBtZXZjdXQgdmUga2F5ZGVkaWxlbiB0w7xtIGFkxLFtbGFyIGJhxZ9hcsSxbMSxZMSxci4gSGFtIGxvZyDDp8Sxa3TEsWxhcsSxIGF5csSxY2EgRTEgNDgyIHRlc3QsIGZvcm1hdCA1Ni8wIGRlxJ9pxZ9pa2xpaywgYW5hbHl6ZSAwLCBFMyAxMDcsIEU0IDE3NiwgRTUgNTksIEU2IDUwLCBFOSA5LCBncmFwaCA0MiwgaW5kZXggMTE2IHNhdMSxciwgNTAzIE1hcmtkb3duIGRvc3lhc8SxbmRhIDM5MyBpZGVudGl0eSBJROKAmXNpIHZlIDEyMyBldmlkZW5jZSBrYXlkxLEgc29udcOnbGFyxLFuxLEgZG/En3J1bHV5b3IuIMSwa2kgeWFsxLF0xLFsbcSxxZ8gQ0kgQXV0aC9kZWZlbnNlIHJ1buKAmcSxIHNpZ251cC9jdXJyZW50LXNlc3Npb24vZ3VhcmRlZC1tYWludGVuYW5jZS1jb21taXQvbG9nb3V0IFBBU1MgdmUgcHJpdmF0ZSBTdG9yYWdlL0RhdGEgQVBJL2NsaWVudC1yb2xlIGlsZSByZXN0cmljdGl2ZS13cml0ZSBwcm9iZeKAmWxhcsSxIFBBU1Mgb2xhcmFrIHJhcG9ybHV5b3IuIEJ1IHlhbMSxdMSxbG3EscWfIHRlc3Qgb3J0YW3EsSBzb251w6dsYXLEsSBFMeKAmWluIMO8cmV0aW0geWVuaWRlbiBzZcOnaW0gc2HEn2xhecSxY8Sxc8SxbmEgYmHEn2zEsSBvbGR1xJ91bnUga2FuxLF0bGFtYXouCgojIyBTxLFuxLFybGFuZMSxcsSxbG3EscWfIGlkZGlhIHZlIG1vZGVsIGRvxJ9ydWxhbWFzxLEKCsSwc3RlbmVuIGluY2VsZW1lY2kgbW9kZWxpIGBncHQtNi1sdW5hYCwgYWvEsWwgecO8csO8dG1lIGTDvHpleWkgYG1heGAgaWRpLiBSdW50aW1lIG1vZGVsIGRvxJ9ydWxhbWFzxLEgYnUgaW5jZWxlbWUgacOnaW4gbWV2Y3V0IGRlxJ9pbDsgYnUgbmVkZW5sZSDDp2FsxLHFn21hIHphbWFuxLFuxLFuIGdlcsOnZWt0ZW4gYnUgbW9kZWxpIGt1bGxhbmTEscSfxLEgaWRkaWEgZWRpbG1peW9yLiBDSSwgZml4dHVyZSwgZ8O2cnNlbCB2ZSBzdGF0aWsga2FuxLF0bGFyIHlhbG7EsXogeXVrYXLEsWRhIHRhbsSxbWxhbmFuIHPEsW7EsXJsYW5kxLFyxLFsbcSxxZ8gU09VUkNFIGluY2VsZW1lc2luaSBkZXN0ZWtsaXlvcjsgY2FubMSxIMO8cmV0aW0geWV0a2lzaSB2ZXlhIGluc2FuL2NpaGF6IGRhdnJhbsSxxZ/EsSBkb8SfcnVsYW5txLHFnyBkZcSfaWxkaXIuCgojIyBEw7x6ZWx0bWUgdmUga29ydW5tYSBub3R1CgpgZmlyc3QtcmVhZGluZy1yMy1tYXJrZXJzLnR4dGAgYmHEn8SxbXPEsXogb2xhcmFrIHllbmlkZW4gw7Z6ZXRsZW5kaTogMTAuMDE0IGJheXQsIFNIQS0yNTYgYGEzY2YzMTY4NjE1ODJhYTkxOWYxZTlkMThhMzI0NDFkOGYwYzBmYjA3NWJmYWExMmY5NTJhOTAzMTEwNjkxOGVgLiBCdSBUw7xya8OnZSBkw7x6ZWx0aWxtacWfIHRhbSBzw7xyw7xtLCDDtm5jZWtpIMSwbmdpbGl6Y2UgcmFwb3JkYWtpIG1hcmtlciBTSEHigJlzxLFuxLFuIHNvbnVuZGFraSBla3NpayBgZWAga2FyYWt0ZXJpbmkgZMO8emVsdGlyLiDDlnpnw7xuIMSwbmdpbGl6Y2UgYHNvdXJjZS13aG9sZS1yZXZpZXcudHh0YCwgOC44NzMgYmF5dCB2ZSBTSEEtMjU2IGA1NmFlZDQyYWVmZmY5MDQwZjZiZWZkMTczYTJmNGIwYmVmM2JkMDgxYTIxNTg2ZmM2ZDE4MGUyNDI2MTA4OWI4YCBpbGUgZGXEn2nFn3RpcmlsbWVkZW4ga29ydW5tdcWfdHVyLiBEYWhhIMO2bmNlIGhhesSxcmxhbm3EscWfIGTDvHplbHRpbG1pxZ8gxLBuZ2lsaXpjZSBgc291cmNlLXdob2xlLXJldmlldy1yMi50eHRgIGRlIDkuMzY4IGJheXQgdmUgU0hBLTI1NiBgYmE0MDE0NmI4N2FmOTgwMTdlNWM4OWQ2YjI5ZWNmY2JiY2Y2M2I0MTk0NDM5OWE1ZWJkZTU2MzI3NzBlYzFjMGAgaWxlIGRlxJ9pxZ90aXJpbG1lZGVuIGtvcnVubXXFn3R1ci4gQnUgw6dldmlyaSBkxLHFn8SxbmRhIGjDvGvDvG0sIGthcHNhbSwgU09VUkNFL0hFQUQgdmV5YSBDSSBzb251Y3UgZGXEn2nFn21lbWnFn3Rpci4=

## Aynı SOURCE CI

38999920065 e3-commit-authorization-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38999920065 RAW 67761 SHA256 124faffbf468f7078536c9d0d281e0f1eef69f6357649c7b166ed5b7be662c6d
- job 117300477358 e3-tests success; API available; gerçek API adımı 6; RAW Run grubu 3

38999918931 e5-current-authority-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38999918931 RAW 35656 SHA256 16a9c81a1e27ff721ca5fd5dc24d56a68eae8bda689edb875647bc93fbd47b37
- job 117300473844 e5-tests success; API available; gerçek API adımı 6; RAW Run grubu 3

38999918932 e9-bounded-proposal-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38999918932 RAW 18384 SHA256 ca0bcb9b3a6cb11e278abfedcbf877d9ecb4f6c43b1c1be818aa89795f22ce95
- job 117300473820 e9-tests success; API available; gerçek API adımı 5; RAW Run grubu 2

38999918963 e4-offline-composition-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38999918963 RAW 57767 SHA256 3f6871431cfa823d98b6ca3babe347041f0cf7cd83aa07008ce330d959ba983a
- job 117300473983 e4-tests success; API available; gerçek API adımı 5; RAW Run grubu 2

38999918944 e6-release-policy-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38999918944 RAW 28042 SHA256 2ef873890a9e4edfcbe66c01e1a2780db2ccf4ec9ad2c977781eae9b98fdf33a
- job 117300473901 e6-tests success; API available; gerçek API adımı 5; RAW Run grubu 2

38999918921 architecture-checks pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38999918921 RAW 47650 SHA256 14d547e9087a3f6a816aafe20fcd773aa7d62ea59269870eb47b45d45852ce10
- job 117300473799 checks success; API available; gerçek API adımı 7; RAW Run grubu 4
- job 117300473962 t3-gate success; API available; gerçek API adımı 5; RAW Run grubu 2

38999918862 architecture-checks pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38999918862 RAW 47645 SHA256 9fb7dd75ae130dc4bc25a584eaa050997d5a0bb04cc2f8e45a2bba545b8ed516
- job 117300473802 checks success; API available; gerçek API adımı 7; RAW Run grubu 4
- job 117300474031 t3-gate success; API available; gerçek API adımı 5; RAW Run grubu 2

38999918920 e3-live-auth-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38999918920 RAW 25640 SHA256 b129e492dbcdb4bb62c79f43b4c4b8574f84be87794837bb9b8b4f47f5c2ac0f
- job 117300473700 live-auth success; API available; gerçek API adımı 8; RAW Run grubu 5

38999918908 e1-shell-widget-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38999918908 RAW 174590 SHA256 56f352d72a4fa0142d247eacdacf1e53c996662c4e4fe7fa83d77e0fa7aa23cb
- job 117300473784 e1-shell-tests success; API available; gerçek API adımı 8; RAW Run grubu 5

38999910666 e6-release-policy-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38999910666 RAW 26710 SHA256 f4428c5f6b87a63d9ea1de6936af327d755ebd77e5264e68b8cc2ff1a8c532c3
- job 117300449375 e6-tests success; API available; gerçek API adımı 5; RAW Run grubu 2

38999910826 e5-current-authority-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38999910826 RAW 34257 SHA256 0a0b5867a186dcb09ab3aac44f6267826dcc19b15ec358459581be7dc1ed446b
- job 117300449824 e5-tests success; API available; gerçek API adımı 6; RAW Run grubu 3

38999910616 architecture-checks push https://github.com/xpike-dgm/kavriva-app/actions/runs/38999910616 RAW 31102 SHA256 b1dcb6de28dffd2f4d54c929f9ac80e1d17bff7360bdc9f0af4dcf186142fb84
- job 117300449373 checks success; API available; gerçek API adımı 7; RAW Run grubu 4
- job 117300450111 t3-gate skipped; API not-applicable-skipped; gerçek API adımı 0; RAW Run grubu 0

38999910609 e3-commit-authorization-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38999910609 RAW 65167 SHA256 cac9f977658ae013c93ebca53cd45a7a24f4ff76af11be8f1142df7d9307907e
- job 117300449192 e3-tests success; API available; gerçek API adımı 6; RAW Run grubu 3

38999910703 e4-offline-composition-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38999910703 RAW 56433 SHA256 dc20b77d8a6d450ba37ec60a0593995fc88cea809bfb5ee0b6ae02e70ae4ba0f
- job 117300449568 e4-tests success; API available; gerçek API adımı 5; RAW Run grubu 2

38999910638 e9-bounded-proposal-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38999910638 RAW 17058 SHA256 b7c4d76205acdd0d30aa43d053f540949507085edb3a1c7cb107898f92115a22
- job 117300449287 e9-tests success; API available; gerçek API adımı 5; RAW Run grubu 2

38999910772 e3-live-auth-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38999910772 RAW 24290 SHA256 be021d71687bcfa0c736ff86ba3653589aa7eeccc1cf9371bb58d9f44ec3d5c3
- job 117300449648 live-auth success; API available; gerçek API adımı 8; RAW Run grubu 5

38999910677 e1-shell-widget-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38999910677 RAW 173139 SHA256 7d21b4e2da00c17ebe36e964a038e67f61312a1c97ff8af62126f143f5ff91e3
- job 117300449511 e1-shell-tests success; API available; gerçek API adımı 8; RAW Run grubu 5

## T-E2-001 yeni tüketim makbuzu

PR126 gerçek normalmerge972622acb2a9e3ea2f6b696a2b368bfeb11fba70 ve FINAL39342c652cd4f4fc6ec2ca6a36b221283c14ff4c; ana8CIgerçekbaşarılı. Sahip sürekli kabulü ve özgün bağımsızFINALtamrapor kaydı https://github.com/xpike-dgm/kavriva-app/pull/126#issuecomment-6229388334 . Bu ek önceki sınırlı kabul kapsamını değiştirmez. E10v91 RAW snapshot vault/EVIDENCE/SNAPSHOTS/E-DEV-124-E10-GOVERNED-PATHS-FOR-T-E2-001.md.snapshot SHA256 7d8dbe0ab7c1d883be00863a0b5c6d7fb8c3c6c208b6cbb1bea1a10a145f0acc. Yeni T-E2-001 henüzIN_PROGRESS; ürün/üretim/diğer görevlerDONEdeğil.
