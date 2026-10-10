---
record_id: V-E1-AIENTRY-001
version: 1
purpose: A1 iki seçenekli AI Usta girişini teknik karar vermeden sunmak
domain: ai-entry
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, ADR-008, ADR-014, C1.10, F1.10.1, DEC-0018, A1, R-001, R-003, R-004, R-007, R-009, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: ai-entry-presentation
tasks: [T-E1-017]
tests: [modules/e01-app/internal/shell/test/ai_entry_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-10
depends_on: [M-E1-001, M-E3-001, M-E9-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E1-017, T-E1-017, E-DEV-116]
evidence: [E-DEV-116]
supersedes: []
status: REVIEW
---

# AI Usta iki seçenekli giriş — sınırlı E1 REVIEW

T-E1-017/FL1.10.1/F1.10.1/C1.10, planfa914f013fdcd032faed876689092da245989459. Tek sert bağımlılık T001 gerçekDONE. BASE06803354b4bba5c399005598dd74591d74f3b78a:104 sınırlıDONE/102kalan/206. Bu aday bağımsız kabul olmadan sayımı ilerletmez.

## Sunum ve kaynak sınırı

A1 bir seçili motosiklet bağlamı, Nasıl yardımcı olayım? sorusu, Bir iş yapmak istiyorum ve Motorda bir sorun var seçenekleridir. Bilinen iş yalnız SCR009 iş arama/seçim niyeti; uygunluk010/hazırlık011 ayrı değerlendirilir. Belirti yalnız SCR019 yakalama niyeti; kontrol020/sonuç021 yerine kesin teşhis veya parça değiştirme kararı verilmez. Düşük vurgulu Hangisini seçmeliyim? yerel açıklama açar; üçüncü eşit giriş değildir. Serbest metin, tamir adımı, teknik cevap, popülerlik/feed/KPI veya dashboard yoktur. Hesap/profil zorunlu değildir; bağlam yönetimi Garaj'a aittir. E9 önerir, E3 doğrular, E1 sunar. Gerçek runtime/publicseam/router/provider seçilmez; komşu kabul edilmiş kod değişmez.

Immutable kapsam local ve motosiklet id/rev çiftlerini taşır; boş alanlar reddedilir, saklanan karakterler trim edilmez. Tam snapshot local/request/document/revision/context/state/offline ve bütün açıklama metni kayıpsız UTF16 uzunluk/hex subject'e bağlıdır. Bağlam ve iki hedefin her biri için aynı scope/request/fullsubject/exactpurpose current-confirmed dış kaynak işareti gerekir; çıplak handler, AI çıktısı, fotoğraf, rol, eksik/yanlış/eski/unknown/held veya çevrimdışı kaynak izin değildir. Bir hedefin kaynağı eksikse tam iki-yol çerçevesi kapalı kalır. Bu iç tüketici kaynak üretmez veya imza doğrulamaz; gerçek üreticiler bulunmadığında normal giriş HELD'dir.

Durma açıklaması ayrı güncel status ve dört dolu sebep/sonuç/şimdi yapılabilecek iş/yeniden giriş alanı ister. Kanıtsız safety iddiası doğrulanmış neden olarak sunulmaz; genel kapalı durum ve yeniden değerlendirme yolu gösterilir. İstek gerçekleşmiş yönlendirme, teknik karar veya fiziksel çalışma izni değildir. Garaj/destek dış niyetinde local/request/subject boş, scope/target null; dahili tam presentation/handler eski callback kontrolü korunur. Aynı local/request iki birincil yoldan yalnız bir kere gönderilir; belge, motosiklet veya handler değişimi kilidi açmaz; yeni istek yeni seçimdir. Ack yeni sunuma taşınmaz. Yardım yereldir, alıcı yokken dış eylemler disabled'dır.

## Görünür tasarım ve yedi kapı kanıtı

Root R03 gerçek pinned PNG ve27 farklı doğal Flutter orijinali açtı;58 kayıtlı parça/31RAWalias bütün boyut/SHA/bayt ve kaydırma adresi doğrulandı. R03'ün bağlam/soru/iki yol/quiethelp ve beş sekmede AI Usta seçimi korunur. Nearwhite/navy/blue; hiyerarşi22/32/20/16 ve52hedef. Fotoğraf/logo/ikon nihai üretim seçimi değildir; A1 kompakt bağlam ve DP14 nedeniyle büyük süs hero kopyalanmadı. Long bağlam kayıpsız sarılır ve kaydırılır, fit kanıtı sayılmaz. REF-SHELL-001 kabuğu gerçek test harness'ta korunur; seçili AI Usta ve bütün beş bölüm vardır. Gerçek router veya ilk açılış politikası değişmez.

V-E10-DESIGN-001 ve V-E10-DESIGN-EVID-001: (1) authoritative A1/REF-R03/DP01..16 ilişkisi ve gerçek reference-native karşılaştırması; (2)20durum×320390768×1/2/3=180 gerçek tam kaydırma; (3) mevcut sabit20soru geçmişsiz ilk okuma ayrı incelemede; (4) border/52target/header/disabled/liveRegion/TabEnterSpace/çizilen metin4.5 ve odak3; (5) nofeed/grid/composer/technical/AItruth ve sahte izin negatifleri; (6) offline/absent/statusheld/long/intentack/nohandler karşılaştırmaları, aynı request sentlock ve stale callback; (7) korunan bütün önceki378 test ve78tabanpin, kabuk/YAML/SDK/deps/komşu uygulama kodları. E1 boundedworking font/token/breakpoint nihai tasarım sertifikası değildir. İnsan/cihaz/işletim sistemi erişilebilirliği, üretim kimlik/yetki/serve/provider/physicalwork ve release HELD kalır.

## Gerçek yerel kanıt ve sınırlar

Koddan önce e8a853f72f167fa49e6d250a63f5a24ed13a56ea exact15/sabit20. İlk targetR1 24PASS; zorunlu alan/izole gerçek düğme negatifleri ile26PASS. İlkfullR1 404PASS20durum genişlemesi öncesi tarihçe; güncel targetR2 26PASS, fullR2 404=378korunan+26yeniPASS;40dosya/0format/analyze0. Ayrı native1PASS normal toplamına eklenmez.20durum/180duyarlı gerçek five-tab kabuk/58PNG390×844/27unique31alias. Fatal hit-test, gerçek son kaydırma ve yardım hedefi,52target ve gerçek klavye testleri geçti. Bağımsız ilk okuma/bütün SOURCE review ve gerçek aynıbaş CI/T3/ayrı FINAL review+CI/normalmerge-main8 henüz beklenir. SDKRoboto yalnız çizim fontudur.

E3R1REVIEW/E5IN_PROGRESS; Supabase47/57/59/RET97 ve gerçek üretim/router/device/releaseHELD. Hiçbir eksik kapı yeşiltestle tamamlanmış sayılmaz. task/feature/flow/design/architecture/production/ownership/release kapanış ayrımı V-E10-CLOSE-001 şablonunda korunur; bu boundedA1 sunum görevi ürünün AI veya yetki sistemini kurmaz.

## Kaynak adresleri ve yerel kayıt düzeltmesi

`vault/PACKS/P-E1-017.md`; `vault/REGISTRY/T-E1-017.md`; `vault/PROFILES/ai-entry-render.md`; `vault/EVIDENCE/E-DEV-116.md`. İlk run_all42test geçti fakat link etiketleri kaynak adresi backtick biçiminde bulunmadığından ve verdict kapalı küme dışı PENDING yazıldığından worst1 döndü. Linkler açık kaynak adresine ve verdict bağımsız kabul beklenirken BLOCKED olarak düzeltildi; ürün kodu/test/soru değişmedi. Özgün graph-r1.log korunur.

## Güncel R3 dar onarım ve 2026-10-10 yerel doğrulama

Önceki58PNG/27unique/R1ilkoku ve özgün ek rapor korunmuş tarihçedir; güncel aday değildir. Q5 açıklaması SCR010 Rehber kapsamı ve uygunluk ve SCR011 Hazırlık ekranlarını adlandırır. No-handler seçim nedeninin görünür açıklaması vardır; safeack Garaj veya desteği adlandırır, girişin durumunun değişmediğini ve geçişin henüz doğrulanmadığını söyler. Root eski10598 ve ek7410bayt raporları tam okudu; kabul oluşturmaz. Gerçek odak border2/blue ve disabled metnin gerçek4.5 kontrastı ek testle doğrulanır.20sabit soru aynen korunur.

TargetR3/R4/R5 her26PASS; fullR3 404PASS onarım öncesi tarihçedir. Oturum sona erdiğinde fullR4 +62 satırda kaldı; süreç kimliği yeniden bulunamadı, tamamlanma iddiası yok; özgün eksik log tutulur. Güncel fullR5 404PASS=378korunan+26yeni;40formatzero/analyze0. NativeR2 yalnız ara onarım çizimi; güncel ayrı nativeR3 1PASS,20durum/59PNG390×844/28unique31alias. Root güncel28orijinali gerçekten açtı; bütün59RAWbayt/SHA/dim/kaydırma ve31alias bayt eşitliğini doğruladı. R03 orijinal tasarım ile bağlam/soru/iki yol/quiethelp ve beş-sekme seçimi korunur; büyük süs hero veya nihai icon/font/token seçilmez.20×3width×3scale=180 gerçekfullscroll five-tab kabuk;52hedef/fatalhit/sonyardım/TabEnterSpace/header/disabled/liveRegion/contrast geçer. Taze geçmişsiz20ilkoku ve bütün exactSOURCEreview/aynıCI-T3/ayrıFINALreview-CI/main8 henüz gerekir; yeşil yerel koşu bağımsız kabul değildir.

Ana104DONE102kalan206; E3R1REVIEW/E5IN_PROGRESS/üretim-router-physical-device-releaseHELD. `vault/PACKS/P-E1-017.md`; `vault/EVIDENCE/E-DEV-116.md`.
