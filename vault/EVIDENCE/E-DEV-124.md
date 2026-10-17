---
test_id: E-DEV-124
contract_id_version: "C1.7/F1.7.1/FL1.7.2 replacement presentation v1"
subject_file: modules/e01-app/internal/shell/lib/replacement_right.dart
subject_digest: e1996238c6526df0dee4d3ff781e91e10d0518d01f9df6a191188d7e3ae2061b
result: "Yerel482 PASS; kör R1 Q17/Q18 CHANGES_REQUESTED"
evidence_links: [vault/EVIDENCE/E-DEV-123.md, vault/PROFILES/replacement-right-render.md, vault/PACKS/P-E1-025.md, vault/REGISTRY/T-E1-025.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-123-E10-GOVERNED-PATHS-FOR-T-E1-025.md.snapshot, modules/e01-app/internal/shell/lib/replacement_right.dart, modules/e01-app/internal/shell/test/replacement_right_test.dart, modules/e01-app/internal/shell/test/fixtures/replacement_right_reading_questions.json]
gate_verdict: "FAIL kör R1 Q17/Q18; dar metin onarımı ve taze inceleme gerekir"
reviewer: "/root/e1025_blind_r1; only first-reading requested gpt-6-luna/max"
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
