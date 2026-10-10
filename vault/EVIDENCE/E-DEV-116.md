---
test_id: E-DEV-116
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
depends_on: [V-E1-AIENTRY-001]
used_by: [V-E1-AIENTRY-001, P-E1-017, T-E1-017]
evidence: []
supersedes: []
status: RECORDED

contract_id_version: "C1.10 F1.10.1 FL1.10.1 A1 v1 REVIEW"
subject_file: modules/e01-app/internal/shell/lib/ai_entry.dart
subject_digest: fcfb9967db570d33b02c4206613ba1c6911be2c067e0f4723269e73ec07fed84
result: "Yerel26/404 PASS; bağımsız REVIEW bekleniyor"
gate_verdict: "BLOCKED bağımsız REVIEW bekleniyor; üretim HELD"
reviewer: none
timestamp: 2026-10-10
evidence_links: [vault/PROFILES/ai-entry-render.md, vault/PACKS/P-E1-017.md, vault/REGISTRY/T-E1-017.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-115-E10-GOVERNED-PATHS-FOR-T-E1-017.md.snapshot, modules/e01-app/internal/shell/lib/ai_entry.dart, modules/e01-app/internal/shell/test/ai_entry_test.dart, modules/e01-app/internal/shell/test/fixtures/ai_entry_reading_questions.json]
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

## Kayıpsız kaynak ve RAW makbuzlar

RAWv82snapshot vault/EVIDENCE/SNAPSHOTS/E-DEV-115-E10-GOVERNED-PATHS-FOR-T-E1-017.md.snapshot SHA256 46c8e30be7b207ff020b0ad5950223f04c01be9acc70b0526d6c0c5303c5ae3d.

modules/e01-app/internal/shell/lib/ai_entry.dart LF SHA256 70f69137dffb86aec4bbf858712174424f68cedc5587f072dbb97e9d9892fb09.

modules/e01-app/internal/shell/test/ai_entry_test.dart LF SHA256 5a0fd3223ddf18830fdb4bb92a9f7c841883d5f2ced2afa2910ff2b00616baf6.

modules/e01-app/internal/shell/test/fixtures/ai_entry_reading_questions.json LF SHA256 3bc2abbc07a729b188c32d2c48595d66bc9d7aa4afb66df422cfa65ee1b1e01d.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\target-r1.log RAW 2251 SHA256 8c9f68a9f3eea45eb40fd9190fdc675a9897d05c66b0f3612d21785f0ed226fb.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\target-r2.log RAW 2410 SHA256 d6c9fdc169ca5ca568d30276a0c1374c58352a3dc716050f92bee8cc46f223ab.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\full-r1.log RAW 94855 SHA256 cbf63c24ae80e99d4c34c05b56d3b1ad0d24f122b9b40e3161ac5fae47e32b3a.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\full-r2.log RAW 94565 SHA256 48d09c3a70fc46e49a95db445b81f0418885fbd57b6059bddb72480f3bf315c4.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\format-r2.log RAW 49 SHA256 4df0a9a4ce7c159d0aadaa881afcd8e75c9a9917092a67217408ae1ca26ce1a0.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\analyze-r2.log RAW 385 SHA256 16c3771151a0153a948f6613050c296f6c619e73f5cbac100dfd326709c7ca9a.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\native-r1.log RAW 512 SHA256 b0f2ff23242fdaf6a4d984d9c2a84190d72ed3443ea28bccdbfa0258a49ba2b7.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\native-manifest.txt RAW 6342 SHA256 cd30da7b037ebd5062500fa460e123ce8aa53682390952ddab93d7ca0d23878d.

### Tam58 doğal çizim makbuzu

|durum|görünüm|parça|offset/end|RAWbayt|SHA256|dosya|
|---|---|---|---|---|---|---|
|ready|root|0|0.0/0.0|31785|11c12b6905ff9f34f76e3f38bc42320978ed3f4a25dd5a6b3903c81551b53083|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-ready-root-0.png|
|ready|help|0|0.0/0.0|69930|ed5122d11af8e4583604bbe8e1a86653408ea418a4715e4d068323b2f9415b0e|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-ready-help-0.png|
|knownTask-requested|root|0|0.0/0.0|37316|6aab585b172f6ef87fb54afa4dba2fae40ec4c78bad7f18464e203bda7379b66|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-knownTask-requested-root-0.png|
|knownTask-requested|help|0|0.0/17.0|74968|5b693ad7c615669c4304693332e6b318157f27e5a3087e9073f4eb704e24bd27|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-knownTask-requested-help-0.png|
|knownTask-requested|help|1|17.0/17.0|74991|4d8aa8ba038f909c898d1c2faf125a998ebe7e54159d27b79a467e2ecec94623|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-knownTask-requested-help-1.png|
|symptom-requested|root|0|0.0/0.0|37316|6aab585b172f6ef87fb54afa4dba2fae40ec4c78bad7f18464e203bda7379b66|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-symptom-requested-root-0.png|
|symptom-requested|help|0|0.0/17.0|74968|5b693ad7c615669c4304693332e6b318157f27e5a3087e9073f4eb704e24bd27|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-symptom-requested-help-0.png|
|symptom-requested|help|1|17.0/17.0|74991|4d8aa8ba038f909c898d1c2faf125a998ebe7e54159d27b79a467e2ecec94623|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-symptom-requested-help-1.png|
|garage-requested|root|0|0.0/0.0|36881|f91be9c99b394eb7d7c6755a3284efb0f008ed91992cfdeb8edda2ca3dafff71|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-garage-requested-root-0.png|
|garage-requested|help|0|0.0/17.0|74615|5475625f2077836d4ed6870ffd77affa6f773a4e0d1ff636ec5f899bee92d9ed|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-garage-requested-help-0.png|
|garage-requested|help|1|17.0/17.0|74633|1889689c5cd0bde534e3a203f330face284ba5ead9f29090d198d85ff61a0158|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-garage-requested-help-1.png|
|support-requested|root|0|0.0/0.0|56230|3c0d17442a0f46da92f8cfa89ae8f5392eb739340cdd8a539762fa4fca607796|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-support-requested-root-0.png|
|support-requested|help|0|0.0/225.0|68293|31973d8fbdf4371806ab7d7580ade3205a2be8711a4f3487942b0783a8c2493d|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-support-requested-help-0.png|
|support-requested|help|1|225.0/225.0|79477|6a81f20e4623824e3f442fb7b262defb25b944c233d0fa8b4705f1773a7ab3a4|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-support-requested-help-1.png|
|no-handler|root|0|0.0/0.0|31994|e56e6bbc926384a097865390a506c4c2c80bbb53eb8368edaec576dc54ebf8f6|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-no-handler-root-0.png|
|no-handler|help|0|0.0/0.0|70099|857f3fee0474a7ce410233ccbe195f5f1605c7ebe70141473e131ee864a7debb|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-no-handler-help-0.png|
|loading|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-loading-root-0.png|
|loading|help|0|0.0/181.0|69736|fc4eef2c99087c46d376733e120cd91883dccbf263a36654a7830532ac11d3fb|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-loading-help-0.png|
|loading|help|1|181.0/181.0|78219|0670a8f14e36be5e914db0bf97cde6952a619c20dab6fa2d4f3bdf0d2aeb0b07|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-loading-help-1.png|
|unknown|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-unknown-root-0.png|
|unknown|help|0|0.0/181.0|69736|fc4eef2c99087c46d376733e120cd91883dccbf263a36654a7830532ac11d3fb|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-unknown-help-0.png|
|unknown|help|1|181.0/181.0|78219|0670a8f14e36be5e914db0bf97cde6952a619c20dab6fa2d4f3bdf0d2aeb0b07|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-unknown-help-1.png|
|held|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-held-root-0.png|
|held|help|0|0.0/181.0|69736|fc4eef2c99087c46d376733e120cd91883dccbf263a36654a7830532ac11d3fb|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-held-help-0.png|
|held|help|1|181.0/181.0|78219|0670a8f14e36be5e914db0bf97cde6952a619c20dab6fa2d4f3bdf0d2aeb0b07|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-held-help-1.png|
|safetyHold|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-safetyHold-root-0.png|
|safetyHold|help|0|0.0/181.0|69736|fc4eef2c99087c46d376733e120cd91883dccbf263a36654a7830532ac11d3fb|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-safetyHold-help-0.png|
|safetyHold|help|1|181.0/181.0|78219|0670a8f14e36be5e914db0bf97cde6952a619c20dab6fa2d4f3bdf0d2aeb0b07|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-safetyHold-help-1.png|
|failed|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-failed-root-0.png|
|failed|help|0|0.0/181.0|69736|fc4eef2c99087c46d376733e120cd91883dccbf263a36654a7830532ac11d3fb|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-failed-help-0.png|
|failed|help|1|181.0/181.0|78219|0670a8f14e36be5e914db0bf97cde6952a619c20dab6fa2d4f3bdf0d2aeb0b07|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-failed-help-1.png|
|absent-context|root|0|0.0/0.0|50802|a5b789f8bb2eff8f52657a47158ef2285b905c0ee8c2e8dd49a244e623d51dfd|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-absent-context-root-0.png|
|absent-context|help|0|0.0/181.0|69156|c0cbc06fca7ee7a8ae06419e8a3ef289ba2a465cb4a6d58e2643bb737d6f03c3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-absent-context-help-0.png|
|absent-context|help|1|181.0/181.0|78219|0670a8f14e36be5e914db0bf97cde6952a619c20dab6fa2d4f3bdf0d2aeb0b07|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-absent-context-help-1.png|
|offline|root|0|0.0/0.0|51320|aca990ac7a140598295adda50ee376c08fd157c7cb10deb572d0ff6906d9c86f|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-offline-root-0.png|
|offline|help|0|0.0/181.0|69655|8e6c703c51e6cf872d9d24c42b309c25fc2dfafd881b5aecd20fdca4d66fde3e|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-offline-help-0.png|
|offline|help|1|181.0/181.0|78691|25ee7007534aa5c16f2d824982f6b375673199e4404a3bb710c233cfcbb3a695|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-offline-help-1.png|
|stale-context|root|0|0.0/0.0|50802|a5b789f8bb2eff8f52657a47158ef2285b905c0ee8c2e8dd49a244e623d51dfd|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-stale-context-root-0.png|
|stale-context|help|0|0.0/181.0|69156|c0cbc06fca7ee7a8ae06419e8a3ef289ba2a465cb4a6d58e2643bb737d6f03c3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-stale-context-help-0.png|
|stale-context|help|1|181.0/181.0|78219|0670a8f14e36be5e914db0bf97cde6952a619c20dab6fa2d4f3bdf0d2aeb0b07|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-stale-context-help-1.png|
|missing-task-route|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-missing-task-route-root-0.png|
|missing-task-route|help|0|0.0/181.0|69736|fc4eef2c99087c46d376733e120cd91883dccbf263a36654a7830532ac11d3fb|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-missing-task-route-help-0.png|
|missing-task-route|help|1|181.0/181.0|78219|0670a8f14e36be5e914db0bf97cde6952a619c20dab6fa2d4f3bdf0d2aeb0b07|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-missing-task-route-help-1.png|
|unknown-symptom-route|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-unknown-symptom-route-root-0.png|
|unknown-symptom-route|help|0|0.0/181.0|69736|fc4eef2c99087c46d376733e120cd91883dccbf263a36654a7830532ac11d3fb|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-unknown-symptom-route-help-0.png|
|unknown-symptom-route|help|1|181.0/181.0|78219|0670a8f14e36be5e914db0bf97cde6952a619c20dab6fa2d4f3bdf0d2aeb0b07|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-unknown-symptom-route-help-1.png|
|safety-explained|root|0|0.0/0.0|50470|15819075a01b312acb557d20a44ed8d1062b444e6840edcda1b68c93bcbf0b2f|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-safety-explained-root-0.png|
|safety-explained|help|0|0.0/181.0|68854|e9c05109bfd5eb12e77ee44116d09faeea02bce0b2a1298f642888f73b64ef69|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-safety-explained-help-0.png|
|safety-explained|help|1|181.0/181.0|77301|b4002c8e8ddb3c973aa28ad49dee95ea5f5b982df90ed72365b799c1d504b590|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-safety-explained-help-1.png|
|safety-unverified|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-safety-unverified-root-0.png|
|safety-unverified|help|0|0.0/181.0|69736|fc4eef2c99087c46d376733e120cd91883dccbf263a36654a7830532ac11d3fb|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-safety-unverified-help-0.png|
|safety-unverified|help|1|181.0/181.0|78219|0670a8f14e36be5e914db0bf97cde6952a619c20dab6fa2d4f3bdf0d2aeb0b07|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-safety-unverified-help-1.png|
|safety-incomplete|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-safety-incomplete-root-0.png|
|safety-incomplete|help|0|0.0/181.0|69736|fc4eef2c99087c46d376733e120cd91883dccbf263a36654a7830532ac11d3fb|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-safety-incomplete-help-0.png|
|safety-incomplete|help|1|181.0/181.0|78219|0670a8f14e36be5e914db0bf97cde6952a619c20dab6fa2d4f3bdf0d2aeb0b07|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-safety-incomplete-help-1.png|
|long-context|root|0|0.0/0.0|59045|18d8c4aebf76bf06baf4e591ef12ffe63a9d9f50ed64d33453cb70043f981d11|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-long-context-root-0.png|
|long-context|help|0|0.0/171.0|80310|22e295a22afc872b9c76e19e19630cc10d4632b8377b988974439cd0d2ac61c4|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-long-context-help-0.png|
|long-context|help|1|171.0/171.0|78741|3df564543c966b16c3d595dc25a32ee837cda60c6fd6a291d4ac0cd17821d68b|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-long-context-help-1.png|

## Kaynak adresleri ve yerel kayıt düzeltmesi

`vault/PACKS/P-E1-017.md`; `vault/REGISTRY/T-E1-017.md`; `vault/PROFILES/ai-entry-render.md`; `vault/EVIDENCE/E-DEV-116.md`. İlk run_all42test geçti fakat link etiketleri kaynak adresi backtick biçiminde bulunmadığından ve verdict kapalı küme dışı PENDING yazıldığından worst1 döndü. Linkler açık kaynak adresine ve verdict bağımsız kabul beklenirken BLOCKED olarak düzeltildi; ürün kodu/test/soru değişmedi. Özgün graph-r1.log korunur.

## İlk okuma R1 — kabul değildir ve dar onarım

/root/e1017_blind_reading, istenen gpt-6-luna/max; geçmişsiz27gerçekorijinal58parça/20durum. Root özgün10598bayt raporu ve7410bayt ayrı kapsam ekini tam okudu. Yardım olmadan şartı dış insan/kod yardımı olarak bütün sağlanan root+yerel açıklama ekranlarıdır; özgün raporun dar ilk-root yorumu aynen korunur. Ayrı ek rapor Q5 nerede sorusunda sayfa adının eksikliğini buldu ve19/20açık dedi; otomatik PASS yok. nohandler neden yazısı eksikliği ve supportack mesaj gerilimi de gerçek bulgudur.

Dar R2/R3 onarım: alıcı yokken kapalı girişin nedenini açıkla; Garaj/destek isteğini hedefiyle adlandır ve giriş durumunun değişmediğini söyle. Q5 için kaynak SCR010 Rehber kapsamı ve uygunluk / SCR011 Hazırlık ekranlarını yalnız açıklamada adlandır; gerçek yönlendirme veya router ekleme. Sabit20soru/kapsam/önceki378/YAML/komşu kod değişmez. Uzun bağlam bilerek12tekrarlı taşma stres fikstürüdür; gerçek model veya source kanıtı sayılmaz. Fotoğraf/fit/AI üretim ispatı icat edilmez. Yeni native/taze geçmişsiz ilkoku gerekir. R1özgün raporlar silinmez.

## R1 özgün10598bayt ilk okuma

RAW 10598 SHA256 3177424ab59430108818494fc7cad4b3b51638992a65fe8cead0cb44d22b0bc5.

<details><summary>Tam özgün rapor</summary>
<pre>İLK EKRAN OKUMASI — T-E1-017
Tarih: 2026-10-09

Kapsam
Yalnız native-proof.json, native-manifest.txt, sabit ai_entry_reading_questions.json ve aşağıda listelenen özgün PNG ekranları okundu. Kod/iş mantığı, üretim davranışı, gerçek motosiklet uygunluğu, güncel izin veya canlı AI bağlantısı doğrulanmadı.

Bütünlük denetimi
Manifest 58 satır ve proof 58 kayıt içeriyor; her satırın durum, kip, yol, offset, bitiş offset’i ve indeks alanları eşleşti. 20 durum var: ready ve no-handler ikişer; kalan 18 durum üçer parçalı, toplam 58. Her gerçek dosyanın SHA-256, bayt sayısı ve PNG boyutu proof ile eşleşti. Tüm boyutlar 390×844. Hash+bayt+boyut gruplaması 27 benzersiz özgün PNG verdi; 27’si de view_image ile açıldı. Aynı üçlüye sahip farklı yollar alias olarak listelenmiştir.

Açılan benzersiz özgünler
Ortak yol kökü: C:/Users/Xpike/.codex/task-state/kavriva-e1017/
Her satırdaki dosya açılan temsilcidir. Alias adları aynı ham SHA-256, bayt ve boyuta sahip ayrı dosyalardır. Bütün satırlar 390×844’tür.

Dosya | SHA-256 | Bayt | Alias dosyaları (temsilci hariç)
native-ready-root-0.png | 11c12b6905ff9f34f76e3f38bc42320978ed3f4a25dd5a6b3903c81551b53083 | 31785 | —
native-ready-help-0.png | ed5122d11af8e4583604bbe8e1a86653408ea418a4715e4d068323b2f9415b0e | 69930 | —
native-knownTask-requested-root-0.png | 6aab585b172f6ef87fb54afa4dba2fae40ec4c78bad7f18464e203bda7379b66 | 37316 | native-symptom-requested-root-0.png
native-knownTask-requested-help-0.png | 5b693ad7c615669c4304693332e6b318157f27e5a3087e9073f4eb704e24bd27 | 74968 | native-symptom-requested-help-0.png
native-knownTask-requested-help-1.png | 4d8aa8ba038f909c898d1c2faf125a998ebe7e54159d27b79a467e2ecec94623 | 74991 | native-symptom-requested-help-1.png
native-garage-requested-root-0.png | f91be9c99b394eb7d7c6755a3284efb0f008ed91992cfdeb8edda2ca3dafff71 | 36881 | —
native-garage-requested-help-0.png | 5475625f2077836d4ed6870ffd77affa6f773a4e0d1ff636ec5f899bee92d9ed | 74615 | —
native-garage-requested-help-1.png | 1889689c5cd0bde534e3a203f330face284ba5ead9f29090d198d85ff61a0158 | 74633 | —
native-support-requested-root-0.png | 3c0d17442a0f46da92f8cfa89ae8f5392eb739340cdd8a539762fa4fca607796 | 56230 | —
native-support-requested-help-0.png | 31973d8fbdf4371806ab7d7580ade3205a2be8711a4f3487942b0783a8c2493d | 68293 | —
native-support-requested-help-1.png | 6a81f20e4623824e3f442fb7b262defb25b944c233d0fa8b4705f1773a7ab3a4 | 79477 | —
native-no-handler-root-0.png | e56e6bbc926384a097865390a506c4c2c80bbb53eb8368edaec576dc54ebf8f6 | 31994 | —
native-no-handler-help-0.png | 857f3fee0474a7ce410233ccbe195f5f1605c7ebe70141473e131ee864a7debb | 70099 | —
native-loading-root-0.png | dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3 | 51400 | native-unknown-root-0.png, native-held-root-0.png, native-safetyHold-root-0.png, native-failed-root-0.png, native-missing-task-route-root-0.png, native-unknown-symptom-route-root-0.png, native-safety-unverified-root-0.png, native-safety-incomplete-root-0.png
native-loading-help-0.png | fc4eef2c99087c46d376733e120cd91883dccbf263a36654a7830532ac11d3fb | 69736 | native-unknown-help-0.png, native-held-help-0.png, native-safetyHold-help-0.png, native-failed-help-0.png, native-missing-task-route-help-0.png, native-unknown-symptom-route-help-0.png, native-safety-unverified-help-0.png, native-safety-incomplete-help-0.png
native-loading-help-1.png | 0670a8f14e36be5e914db0bf97cde6952a619c20dab6fa2d4f3bdf0d2aeb0b07 | 78219 | native-unknown-help-1.png, native-held-help-1.png, native-safetyHold-help-1.png, native-failed-help-1.png, native-absent-context-help-1.png, native-stale-context-help-1.png, native-missing-task-route-help-1.png, native-unknown-symptom-route-help-1.png, native-safety-unverified-help-1.png, native-safety-incomplete-help-1.png
native-absent-context-root-0.png | a5b789f8bb2eff8f52657a47158ef2285b905c0ee8c2e8dd49a244e623d51dfd | 50802 | native-stale-context-root-0.png
native-absent-context-help-0.png | c0cbc06fca7ee7a8ae06419e8a3ef289ba2a465cb4a6d58e2643bb737d6f03c3 | 69156 | native-stale-context-help-0.png
native-offline-root-0.png | aca990ac7a140598295adda50ee376c08fd157c7cb10deb572d0ff6906d9c86f | 51320 | —
native-offline-help-0.png | 8e6c703c51e6cf872d9d24c42b309c25fc2dfafd881b5aecd20fdca4d66fde3e | 69655 | —
native-offline-help-1.png | 25ee7007534aa5c16f2d824982f6b375673199e4404a3bb710c233cfcbb3a695 | 78691 | —
native-safety-explained-root-0.png | 15819075a01b312acb557d20a44ed8d1062b444e6840edcda1b68c93bcbf0b2f | 50470 | —
native-safety-explained-help-0.png | e9c05109bfd5eb12e77ee44116d09faeea02bce0b2a1298f642888f73b64ef69 | 68854 | —
native-safety-explained-help-1.png | b4002c8e8ddb3c973aa28ad49dee95ea5f5b982df90ed72365b799c1d504b590 | 77301 | —
native-long-context-root-0.png | 18d8c4aebf76bf06baf4e591ef12ffe63a9d9f50ed64d33453cb70043f981d11 | 59045 | —
native-long-context-help-0.png | 22e295a22afc872b9c76e19e19630cc10d4632b8377b988974439cd0d2ac61c4 | 80310 | —
native-long-context-help-1.png | 3df564543c966b16c3d595dc25a32ee837cda60c6fd6a291d4ac0cd17821d68b | 78741 | —

Sabit sorular ve yalnız ekranlardan yanıtlar
1. Ana soru ve iki seçenek nedir? — “Nasıl yardımcı olayım?”; “Bir iş yapmak istiyorum” ve “Motorda bir sorun var”.
2. Yapacağın işi biliyorsan hangi seçenek? — “Bir iş yapmak istiyorum.”
3. Ses, belirti veya arıza şüphesi varsa hangi seçenek? — “Motorda bir sorun var.”
4. İş seçmek doğrudan tamire başlama izni verir mi? — Hayır. Açıklama “Seçim isteği uygulama izni değildir” ve bu girişin tamir adımı sunmadığını söylüyor.
5. Uygunluk ve hazırlık değerlendirmesi nerede yapılır? — İlk yolun açıklamasına göre önce iş bulunur, sonra motosiklet uygunluğu ve hazırlık koşulları değerlendirilir. Belirli ekran/bölüm adı verilmez.
6. Belirti yolunu seçmek kesin teşhis veya parça kararı mı? — Hayır. Belirti ve gözlemler toplanır; seçim kesin teşhis ya da parça değiştirme kararı değildir.
7. Kanıt yetersizse belirsiz sonuç mümkün mü? — Evet; açıklama yetersiz kanıtta sonucun belirsiz kalabileceğini söylüyor.
8. Serbest metin sohbeti veya teknik cevap var mı? — Serbest metin sohbeti sunulmadığı yazıyor; ekranda teknik cevap görünmüyor.
9. Hangi motosiklet bağlamında olduğunu nereden anlarsın? — Üstteki bağlam satırından: “Motosikletim: Örnek motosiklet · kullanıcı beyanı.” Bu örnek ifade gerçek model kanıtı değildir. Eksik bağlam ekranında yeniden doğrulama gerektiği yazıyor.
10. Bağlam nerede değiştirilir? — “Bağlamı Garaj’da yönet” bağlantısından.
11. Emin değilsen yardım nasıl açılır; üçüncü eşit yol mu? — “Hangisini seçmeliyim?” açıklama bağlantısıdır; açılınca “Açıklamayı kapat” görünür. Üçüncü eşit seçenek değildir.
12. AI cevabı doğrulanmış resmî rehber gibi mi sunuluyor? — Hayır. Açıklama, AI önerisinin doğrulanmış resmî rehber yerine geçmediğini söylüyor; somut AI cevabı görünmüyor.
13. Bağlam/güncel kaynak eksikse normal seçim açılır mı? — Hayır. “Normal iş akışı açılmaz”; Garaj’da bağlamı değerlendirme veya destek kullanıp güncel kaynakla yeniden deneme yazıyor.
14. Çevrimdışı/eski yönlendirme güncel izin yerine geçer mi? — Hayır. Çevrimdışıyken güncel yönlendirmenin doğrulanamayacağı ve normal akışın açılmayacağı yazıyor. “Eski yönlendirme” sözcüğü ekranda doğrudan geçmiyor.
15. Güvenlik duruşunda sebep, sonuç, şimdi yapılacak ve yeniden giriş açıklanıyor mu? — Evet: sebep “Örnek güvenlik bulgusu”; sonuç “Normal akış açılmaz”; şimdi “İşleme başlama; destek yolunu kullan”; yeniden giriş “Güncel değerlendirme ile yeniden dene.”
16. “İstek gönderildi” sonraki adımın tamamlandığını mı gösterir? — Hayır. Bir ekran “Sonraki akış henüz açılmış sayılmaz”, diğeri “Sonuç henüz doğrulanmış değil” diyor.
17. Hesap/profil zorunlu mu? — Hayır; açıklama zorunlu olmadığını söylüyor.
18. Alt çubuktaki beş bölüm ve seçili olan nedir? — Garaj, Bakım, AI Usta, Geçmiş, Topluluk; AI Usta seçili.
19. Bakım/geçmiş/topluluk özeti veya popüler liste var mı? — Görünen giriş ekranlarında yok; seçim/durum/açıklama ve gezinme çubuğu var.
20. Örnek ekran gerçek motosiklet uygunluğunu, güncel üretim iznini veya canlı AI’ı kanıtlar mı? — Hayır. Örnek kullanıcı beyanı dışında gerçek uygunluk sonucu, güncel izin veya canlı bağlantı göstergesi görünmüyor.

Belirsizlik ve çelişki notları
- Açıklama paneli açıldığında 20 sorunun yanıtı görünür metinden verilebiliyor. Ancak giriş ekranı tek başına tamir izni, belirsiz teşhis, serbest sohbet, resmî rehber ve hesap gerekliliği gibi anlamları göstermiyor. “Yardım olmadan” ölçütü uygulama içi açıklamayı da kapsam dışı sayıyorsa ilk ekran 20/20 açık değil.
- Uygunluk ve hazırlık sırası belirtilmiş, fakat hangi sayfada/bölümde olduğu adlandırılmamış.
- Bağlam “Örnek motosiklet · kullanıcı beyanı” diyor; gerçek motosiklet kimliği bu örnek ekrandan anlaşılamaz.
- no-handler ekranında düğmeler ve bağlam bağlantısı soluk, fakat neden kullanılamadıklarını anlatan durum metni yok.
- long-context görüntüsünde bağlam satırı birçok kez yineleniyor ve içeriği aşağı itiyor; okunabilirliği azaltıyor.
- support-requested ekranı aynı anda “Giriş şu anda açılamıyor” ve “Geçiş isteği gönderildi. Sonuç henüz doğrulanmış değil” diyor. Son cümle tamamlanma iddiasını önlüyor, ama iki mesajın yan yana gelişi anlam gerilimi yaratıyor.
- Bilinen iş ve Garaj geçişi mesajları “Seçim isteği” / “Geçiş isteği” olarak farklı; ikisi de akışın açıldığını veya sonucun doğrulandığını söylemiyor. Bu içerik çelişkisi değil, terim tutarlılığı farkı.

Yalnız ekran okuması hükmü
Ana seçim ayrımı anlaşılır ve açıklama paneliyle birlikte sabit sorular yanıtlanabiliyor. Açıklama paneli açılmadan 20/20 “yardım olmadan” açıklık koşulu karşılanmıyor. no-handler kontrollerinin soluk olma sebebi ve örnek motosiklet bağlamının gerçekliği görünür ekranlardan anlaşılamıyor. Bu, yalnız ekran okumasıdır; kod veya üretim davranışı kanıtı değildir.</pre>
</details>

<details><summary>Özgün RAWBase64</summary>
<pre>xLBMSyBFS1JBTiBPS1VNQVNJIOKAlCBULUUxLTAxNwpUYXJpaDogMjAyNi0xMC0wOQoKS2Fwc2FtCllhbG7EsXogbmF0aXZlLXByb29mLmpzb24sIG5hdGl2ZS1tYW5pZmVzdC50eHQsIHNhYml0IGFpX2VudHJ5X3JlYWRpbmdfcXVlc3Rpb25zLmpzb24gdmUgYcWfYcSfxLFkYSBsaXN0ZWxlbmVuIMO2emfDvG4gUE5HIGVrcmFubGFyxLEgb2t1bmR1LiBLb2QvacWfIG1hbnTEscSfxLEsIMO8cmV0aW0gZGF2cmFuxLHFn8SxLCBnZXLDp2VrIG1vdG9zaWtsZXQgdXlndW5sdcSfdSwgZ8O8bmNlbCBpemluIHZleWEgY2FubMSxIEFJIGJhxJ9sYW50xLFzxLEgZG/En3J1bGFubWFkxLEuCgpCw7x0w7xubMO8ayBkZW5ldGltaQpNYW5pZmVzdCA1OCBzYXTEsXIgdmUgcHJvb2YgNTgga2F5xLF0IGnDp2VyaXlvcjsgaGVyIHNhdMSxcsSxbiBkdXJ1bSwga2lwLCB5b2wsIG9mZnNldCwgYml0acWfIG9mZnNldOKAmWkgdmUgaW5kZWtzIGFsYW5sYXLEsSBlxZ9sZcWfdGkuIDIwIGR1cnVtIHZhcjogcmVhZHkgdmUgbm8taGFuZGxlciBpa2nFn2VyOyBrYWxhbiAxOCBkdXJ1bSDDvMOnZXIgcGFyw6dhbMSxLCB0b3BsYW0gNTguIEhlciBnZXLDp2VrIGRvc3lhbsSxbiBTSEEtMjU2LCBiYXl0IHNhecSxc8SxIHZlIFBORyBib3l1dHUgcHJvb2YgaWxlIGXFn2xlxZ90aS4gVMO8bSBib3l1dGxhciAzOTDDlzg0NC4gSGFzaCtiYXl0K2JveXV0IGdydXBsYW1hc8SxIDI3IGJlbnplcnNpeiDDtnpnw7xuIFBORyB2ZXJkaTsgMjfigJlzaSBkZSB2aWV3X2ltYWdlIGlsZSBhw6fEsWxkxLEuIEF5bsSxIMO8w6dsw7x5ZSBzYWhpcCBmYXJrbMSxIHlvbGxhciBhbGlhcyBvbGFyYWsgbGlzdGVsZW5tacWfdGlyLgoKQcOnxLFsYW4gYmVuemVyc2l6IMO2emfDvG5sZXIKT3J0YWsgeW9sIGvDtmvDvDogQzovVXNlcnMvWHBpa2UvLmNvZGV4L3Rhc2stc3RhdGUva2F2cml2YS1lMTAxNy8KSGVyIHNhdMSxcmRha2kgZG9zeWEgYcOnxLFsYW4gdGVtc2lsY2lkaXIuIEFsaWFzIGFkbGFyxLEgYXluxLEgaGFtIFNIQS0yNTYsIGJheXQgdmUgYm95dXRhIHNhaGlwIGF5csSxIGRvc3lhbGFyZMSxci4gQsO8dMO8biBzYXTEsXJsYXIgMzkww5c4NDTigJl0w7xyLgoKRG9zeWEgfCBTSEEtMjU2IHwgQmF5dCB8IEFsaWFzIGRvc3lhbGFyxLEgKHRlbXNpbGNpIGhhcmnDpykKbmF0aXZlLXJlYWR5LXJvb3QtMC5wbmcgfCAxMWMxMmI2OTA1ZmY5ZjM0Zjc2ZTNmMzhiYzQyMzIwOTc4ZWQzZjRhMjVkZDVhNmIzOTAzYzgxNTUxYjUzMDgzIHwgMzE3ODUgfCDigJQKbmF0aXZlLXJlYWR5LWhlbHAtMC5wbmcgfCBlZDUxMjJkMTFhZjhlNDU4MzYwNGJiZThlMWE4NjY1MzQwOGVhNDE4YTQ3MTVlNGQwNjgzMjNiMmY5NDE1YjBlIHwgNjk5MzAgfCDigJQKbmF0aXZlLWtub3duVGFzay1yZXF1ZXN0ZWQtcm9vdC0wLnBuZyB8IDZhYWI1ODViMTcyZjZlZjg3ZmI1NGFmYTRkYmEyZmFlNDBlYzRjNzhiYWQ3ZjE4NDY0ZTIwM2JkYTczNzliNjYgfCAzNzMxNiB8IG5hdGl2ZS1zeW1wdG9tLXJlcXVlc3RlZC1yb290LTAucG5nCm5hdGl2ZS1rbm93blRhc2stcmVxdWVzdGVkLWhlbHAtMC5wbmcgfCA1YjY5M2FkN2M2MTU2NjljNDMwNDY5MzMzMmU2YjMxODE1N2YyN2U1YTMwODdlOTA3M2Y0ZWI3MDRlMjRiZDI3IHwgNzQ5NjggfCBuYXRpdmUtc3ltcHRvbS1yZXF1ZXN0ZWQtaGVscC0wLnBuZwpuYXRpdmUta25vd25UYXNrLXJlcXVlc3RlZC1oZWxwLTEucG5nIHwgNGQ4YWE4YmEwMzhmOTA5Yzg5OGQxYzJmYWYxMjVhOTk4ZWJlN2U1NDE1OWQyN2I3OWE0NjdlMmVjZWM5NDYyMyB8IDc0OTkxIHwgbmF0aXZlLXN5bXB0b20tcmVxdWVzdGVkLWhlbHAtMS5wbmcKbmF0aXZlLWdhcmFnZS1yZXF1ZXN0ZWQtcm9vdC0wLnBuZyB8IGY5MWJlOWM5OWIzOTRlYjdkN2M2NzU1YTMyODRlZmIwZjAwOGVkOTE5OTJjZmRlYjhlZGRhMmNhM2RhZmZmNzEgfCAzNjg4MSB8IOKAlApuYXRpdmUtZ2FyYWdlLXJlcXVlc3RlZC1oZWxwLTAucG5nIHwgNTQ3NTYyNWYyMDc3ODM2ZDRlZDY4NzBmZmQ3N2FmZmE2Zjc3M2E0ZTBkMWZmNjM2ZWM1Zjg5OWJlZTkyZDllZCB8IDc0NjE1IHwg4oCUCm5hdGl2ZS1nYXJhZ2UtcmVxdWVzdGVkLWhlbHAtMS5wbmcgfCAxODg5Njg5YzVjZDBiZGU1MzRlM2EyMDNmMzMwZmFjZTI4NGJhNWVhZDlmMjkwOTBkMTk4ZDg1ZmY2MWEwMTU4IHwgNzQ2MzMgfCDigJQKbmF0aXZlLXN1cHBvcnQtcmVxdWVzdGVkLXJvb3QtMC5wbmcgfCAzYzBkMTc0NDJhMGY0NmRhOTJmOGNmYTg5YWU4ZjUzOTJlYjczOTM0MGNkZDhhNTM5NzYyZmE0ZmNhNjA3Nzk2IHwgNTYyMzAgfCDigJQKbmF0aXZlLXN1cHBvcnQtcmVxdWVzdGVkLWhlbHAtMC5wbmcgfCAzMTk3M2Q4ZmJkZjQzNzE4MDZhYjdkNzU4MGFkZTMyMDVhMmJlODcxMWE0ZjM0ODc5NDJiMDc4M2E4YzI0OTNkIHwgNjgyOTMgfCDigJQKbmF0aXZlLXN1cHBvcnQtcmVxdWVzdGVkLWhlbHAtMS5wbmcgfCA2YTgxZjIwZTQ2MjM4MjRlM2Y0NDJmYjdiMjYyZGVmYjI1Yjk0NGMyMzNkMGZhOGI0NzA1ZjE3NzNhN2FiM2E0IHwgNzk0NzcgfCDigJQKbmF0aXZlLW5vLWhhbmRsZXItcm9vdC0wLnBuZyB8IGU1NmU2YmJjOTI2Mzg0YTA5Nzg2NTM5MGE1MDZjNGMyYzgwYmJiNTNlYjgzNjhlZGFlYzU3NmRjNTRlYmY4ZjYgfCAzMTk5NCB8IOKAlApuYXRpdmUtbm8taGFuZGxlci1oZWxwLTAucG5nIHwgODU3ZjNmZWUwNDc0YTdjZTQxMDIzM2NjYmUxOTVmNWYxNjA1YzdlYmU3MDE0MTQ3M2UxMzFlZTg2NGE3ZGViYiB8IDcwMDk5IHwg4oCUCm5hdGl2ZS1sb2FkaW5nLXJvb3QtMC5wbmcgfCBkZWU2ZjUzYjE0OTk0ZWYyZTc2NmI4MTljYzAxMGE3NDQ1MWE2MTg4ZGFmZGNiZmFkNWE4M2E5NGI5MjQzNmUzIHwgNTE0MDAgfCBuYXRpdmUtdW5rbm93bi1yb290LTAucG5nLCBuYXRpdmUtaGVsZC1yb290LTAucG5nLCBuYXRpdmUtc2FmZXR5SG9sZC1yb290LTAucG5nLCBuYXRpdmUtZmFpbGVkLXJvb3QtMC5wbmcsIG5hdGl2ZS1taXNzaW5nLXRhc2stcm91dGUtcm9vdC0wLnBuZywgbmF0aXZlLXVua25vd24tc3ltcHRvbS1yb3V0ZS1yb290LTAucG5nLCBuYXRpdmUtc2FmZXR5LXVudmVyaWZpZWQtcm9vdC0wLnBuZywgbmF0aXZlLXNhZmV0eS1pbmNvbXBsZXRlLXJvb3QtMC5wbmcKbmF0aXZlLWxvYWRpbmctaGVscC0wLnBuZyB8IGZjNGVlZjJjOTkwODdjNDZkMzc2NzMzZTEyMGNkOTE4ODNkY2NiZjI2M2EzNjY1NGE3ODMwNTMyYWMxMWQzZmIgfCA2OTczNiB8IG5hdGl2ZS11bmtub3duLWhlbHAtMC5wbmcsIG5hdGl2ZS1oZWxkLWhlbHAtMC5wbmcsIG5hdGl2ZS1zYWZldHlIb2xkLWhlbHAtMC5wbmcsIG5hdGl2ZS1mYWlsZWQtaGVscC0wLnBuZywgbmF0aXZlLW1pc3NpbmctdGFzay1yb3V0ZS1oZWxwLTAucG5nLCBuYXRpdmUtdW5rbm93bi1zeW1wdG9tLXJvdXRlLWhlbHAtMC5wbmcsIG5hdGl2ZS1zYWZldHktdW52ZXJpZmllZC1oZWxwLTAucG5nLCBuYXRpdmUtc2FmZXR5LWluY29tcGxldGUtaGVscC0wLnBuZwpuYXRpdmUtbG9hZGluZy1oZWxwLTEucG5nIHwgMDY3MGE4ZjE0ZTM2YmU1ZTkxNGRiMGJmOTdjZGU2OTUyYTYxOWMyMGRhYjZmYTJkNGYzYmRmMGQyYWViMGIwNyB8IDc4MjE5IHwgbmF0aXZlLXVua25vd24taGVscC0xLnBuZywgbmF0aXZlLWhlbGQtaGVscC0xLnBuZywgbmF0aXZlLXNhZmV0eUhvbGQtaGVscC0xLnBuZywgbmF0aXZlLWZhaWxlZC1oZWxwLTEucG5nLCBuYXRpdmUtYWJzZW50LWNvbnRleHQtaGVscC0xLnBuZywgbmF0aXZlLXN0YWxlLWNvbnRleHQtaGVscC0xLnBuZywgbmF0aXZlLW1pc3NpbmctdGFzay1yb3V0ZS1oZWxwLTEucG5nLCBuYXRpdmUtdW5rbm93bi1zeW1wdG9tLXJvdXRlLWhlbHAtMS5wbmcsIG5hdGl2ZS1zYWZldHktdW52ZXJpZmllZC1oZWxwLTEucG5nLCBuYXRpdmUtc2FmZXR5LWluY29tcGxldGUtaGVscC0xLnBuZwpuYXRpdmUtYWJzZW50LWNvbnRleHQtcm9vdC0wLnBuZyB8IGE1Yjc4OWY4YmIyZWZmOGY1MjY1N2E0NzE1OGVmMjI4NWI5MDVjMGVlOGMyZThkZDQ5YTI0NGU2MjNkNTFkZmQgfCA1MDgwMiB8IG5hdGl2ZS1zdGFsZS1jb250ZXh0LXJvb3QtMC5wbmcKbmF0aXZlLWFic2VudC1jb250ZXh0LWhlbHAtMC5wbmcgfCBjMGNiYzA2ZmNhN2VlN2E4YWUwNjQxOWU4YTNlZjI4OWJhMmE0NjVjYjRhNmQ1OGUyNjQzYmI3MzdkNmYwM2MzIHwgNjkxNTYgfCBuYXRpdmUtc3RhbGUtY29udGV4dC1oZWxwLTAucG5nCm5hdGl2ZS1vZmZsaW5lLXJvb3QtMC5wbmcgfCBhY2E5OTBhYzdhMTQwNTk4Mjk1YWRkYTUwZWUzNzZjMDhmZDE1N2M3Y2IxMGRlYjU3MmQwZmY2OTA2ZDljODZmIHwgNTEzMjAgfCDigJQKbmF0aXZlLW9mZmxpbmUtaGVscC0wLnBuZyB8IDhlNmM3MDNjNTFlNmNmODcyZDlkMjRjNDJiMzA5YzI1ZmMyZGZhZmQ4ODFiNWFlY2QyMGZkY2E0ZDY2ZmRlM2UgfCA2OTY1NSB8IOKAlApuYXRpdmUtb2ZmbGluZS1oZWxwLTEucG5nIHwgMjVlZTcwMDc1MzRhYTVjMTZmMmQ4MjQ5ODJmNmIzNzU2NzMxOTllNDQwNGEzYmI3MTBjMjMzY2ZjYmIzYTY5NSB8IDc4NjkxIHwg4oCUCm5hdGl2ZS1zYWZldHktZXhwbGFpbmVkLXJvb3QtMC5wbmcgfCAxNTgxOTA3NWEwMWIzMTJhY2I1NTdkMjBhNDRlZDhkMTA2MmI0NDRlNjg0MGVkY2RhMWI2OGM5M2JjYmYwYjJmIHwgNTA0NzAgfCDigJQKbmF0aXZlLXNhZmV0eS1leHBsYWluZWQtaGVscC0wLnBuZyB8IGU5YzA1MTA5YmZkNWViMTJlNzdlZTQ0MTE2ZDA5ZmFlZWEwMmJjZTBiMmExMjk4ZjY0Mjg4OGY3M2I2NGVmNjkgfCA2ODg1NCB8IOKAlApuYXRpdmUtc2FmZXR5LWV4cGxhaW5lZC1oZWxwLTEucG5nIHwgYjQwMDJjOGU4ZGRiM2M5NzNhYTI4YWQ0OWRlZTk1ZWE1ZjViOTgyZGY5MGVkNzIzNjViNzk5YzFkNTA0YjU5MCB8IDc3MzAxIHwg4oCUCm5hdGl2ZS1sb25nLWNvbnRleHQtcm9vdC0wLnBuZyB8IDE4ZDhjNGFlYmY3NmJmMDZiYWY0ZTU5MWVmMTJmZmU2M2E5ZDlmNTBlZDY0ZDMzNDUzY2I3MDA0M2Y5ODFkMTEgfCA1OTA0NSB8IOKAlApuYXRpdmUtbG9uZy1jb250ZXh0LWhlbHAtMC5wbmcgfCAyMmUyOTVhMjJhZmM4NzJiOWM3NmUxOWUxOTYzMGNjMTBkNDYzMmI4Mzc3Yjk4ODk3NDQzOWNkMGQyYWM2MWM0IHwgODAzMTAgfCDigJQKbmF0aXZlLWxvbmctY29udGV4dC1oZWxwLTEucG5nIHwgM2RmNTY0NTQzYzk2NmIxNmMzZDU5NWRjMjVhMzJlZTgzN2NkYTYwYzZmZDZhMjkxZDRhYzBjZDE3ODIxZDY4YiB8IDc4NzQxIHwg4oCUCgpTYWJpdCBzb3J1bGFyIHZlIHlhbG7EsXogZWtyYW5sYXJkYW4geWFuxLF0bGFyCjEuIEFuYSBzb3J1IHZlIGlraSBzZcOnZW5layBuZWRpcj8g4oCUIOKAnE5hc8SxbCB5YXJkxLFtY8SxIG9sYXnEsW0/4oCdOyDigJxCaXIgacWfIHlhcG1hayBpc3RpeW9ydW3igJ0gdmUg4oCcTW90b3JkYSBiaXIgc29ydW4gdmFy4oCdLgoyLiBZYXBhY2HEn8SxbiBpxZ9pIGJpbGl5b3JzYW4gaGFuZ2kgc2XDp2VuZWs/IOKAlCDigJxCaXIgacWfIHlhcG1hayBpc3RpeW9ydW0u4oCdCjMuIFNlcywgYmVsaXJ0aSB2ZXlhIGFyxLF6YSDFn8O8cGhlc2kgdmFyc2EgaGFuZ2kgc2XDp2VuZWs/IOKAlCDigJxNb3RvcmRhIGJpciBzb3J1biB2YXIu4oCdCjQuIMSwxZ8gc2XDp21layBkb8SfcnVkYW4gdGFtaXJlIGJhxZ9sYW1hIGl6bmkgdmVyaXIgbWk/IOKAlCBIYXnEsXIuIEHDp8Sxa2xhbWEg4oCcU2XDp2ltIGlzdGXEn2kgdXlndWxhbWEgaXpuaSBkZcSfaWxkaXLigJ0gdmUgYnUgZ2lyacWfaW4gdGFtaXIgYWTEsW3EsSBzdW5tYWTEscSfxLFuxLEgc8O2eWzDvHlvci4KNS4gVXlndW5sdWsgdmUgaGF6xLFybMSxayBkZcSfZXJsZW5kaXJtZXNpIG5lcmVkZSB5YXDEsWzEsXI/IOKAlCDEsGxrIHlvbHVuIGHDp8Sxa2xhbWFzxLFuYSBnw7ZyZSDDtm5jZSBpxZ8gYnVsdW51ciwgc29ucmEgbW90b3Npa2xldCB1eWd1bmx1xJ91IHZlIGhhesSxcmzEsWsga2/Fn3VsbGFyxLEgZGXEn2VybGVuZGlyaWxpci4gQmVsaXJsaSBla3Jhbi9iw7Zsw7xtIGFkxLEgdmVyaWxtZXouCjYuIEJlbGlydGkgeW9sdW51IHNlw6dtZWsga2VzaW4gdGXFn2hpcyB2ZXlhIHBhcsOnYSBrYXJhcsSxIG3EsT8g4oCUIEhhecSxci4gQmVsaXJ0aSB2ZSBnw7Z6bGVtbGVyIHRvcGxhbsSxcjsgc2XDp2ltIGtlc2luIHRlxZ9oaXMgeWEgZGEgcGFyw6dhIGRlxJ9pxZ90aXJtZSBrYXJhcsSxIGRlxJ9pbGRpci4KNy4gS2FuxLF0IHlldGVyc2l6c2UgYmVsaXJzaXogc29udcOnIG3DvG1rw7xuIG3DvD8g4oCUIEV2ZXQ7IGHDp8Sxa2xhbWEgeWV0ZXJzaXoga2FuxLF0dGEgc29udWN1biBiZWxpcnNpeiBrYWxhYmlsZWNlxJ9pbmkgc8O2eWzDvHlvci4KOC4gU2VyYmVzdCBtZXRpbiBzb2hiZXRpIHZleWEgdGVrbmlrIGNldmFwIHZhciBtxLE/IOKAlCBTZXJiZXN0IG1ldGluIHNvaGJldGkgc3VudWxtYWTEscSfxLEgeWF6xLF5b3I7IGVrcmFuZGEgdGVrbmlrIGNldmFwIGfDtnLDvG5tw7x5b3IuCjkuIEhhbmdpIG1vdG9zaWtsZXQgYmHEn2xhbcSxbmRhIG9sZHXEn3VudSBuZXJlZGVuIGFubGFyc8Sxbj8g4oCUIMOcc3R0ZWtpIGJhxJ9sYW0gc2F0xLFyxLFuZGFuOiDigJxNb3Rvc2lrbGV0aW06IMOWcm5layBtb3Rvc2lrbGV0IMK3IGt1bGxhbsSxY8SxIGJleWFuxLEu4oCdIEJ1IMO2cm5layBpZmFkZSBnZXLDp2VrIG1vZGVsIGthbsSxdMSxIGRlxJ9pbGRpci4gRWtzaWsgYmHEn2xhbSBla3JhbsSxbmRhIHllbmlkZW4gZG/En3J1bGFtYSBnZXJla3RpxJ9pIHlhesSxeW9yLgoxMC4gQmHEn2xhbSBuZXJlZGUgZGXEn2nFn3RpcmlsaXI/IOKAlCDigJxCYcSfbGFtxLEgR2FyYWrigJlkYSB5w7ZuZXTigJ0gYmHEn2xhbnTEsXPEsW5kYW4uCjExLiBFbWluIGRlxJ9pbHNlbiB5YXJkxLFtIG5hc8SxbCBhw6fEsWzEsXI7IMO8w6fDvG5jw7wgZcWfaXQgeW9sIG11PyDigJQg4oCcSGFuZ2lzaW5pIHNlw6dtZWxpeWltP+KAnSBhw6fEsWtsYW1hIGJhxJ9sYW50xLFzxLFkxLFyOyBhw6fEsWzEsW5jYSDigJxBw6fEsWtsYW1hecSxIGthcGF04oCdIGfDtnLDvG7DvHIuIMOcw6fDvG5jw7wgZcWfaXQgc2XDp2VuZWsgZGXEn2lsZGlyLgoxMi4gQUkgY2V2YWLEsSBkb8SfcnVsYW5txLHFnyByZXNtw64gcmVoYmVyIGdpYmkgbWkgc3VudWx1eW9yPyDigJQgSGF5xLFyLiBBw6fEsWtsYW1hLCBBSSDDtm5lcmlzaW5pbiBkb8SfcnVsYW5txLHFnyByZXNtw64gcmVoYmVyIHllcmluZSBnZcOnbWVkacSfaW5pIHPDtnlsw7x5b3I7IHNvbXV0IEFJIGNldmFixLEgZ8O2csO8bm3DvHlvci4KMTMuIEJhxJ9sYW0vZ8O8bmNlbCBrYXluYWsgZWtzaWtzZSBub3JtYWwgc2XDp2ltIGHDp8SxbMSxciBtxLE/IOKAlCBIYXnEsXIuIOKAnE5vcm1hbCBpxZ8gYWvEscWfxLEgYcOnxLFsbWF64oCdOyBHYXJhauKAmWRhIGJhxJ9sYW3EsSBkZcSfZXJsZW5kaXJtZSB2ZXlhIGRlc3RlayBrdWxsYW7EsXAgZ8O8bmNlbCBrYXluYWtsYSB5ZW5pZGVuIGRlbmVtZSB5YXrEsXlvci4KMTQuIMOHZXZyaW1kxLHFn8SxL2Vza2kgecO2bmxlbmRpcm1lIGfDvG5jZWwgaXppbiB5ZXJpbmUgZ2XDp2VyIG1pPyDigJQgSGF5xLFyLiDDh2V2cmltZMSxxZ/EsXlrZW4gZ8O8bmNlbCB5w7ZubGVuZGlybWVuaW4gZG/En3J1bGFuYW1heWFjYcSfxLEgdmUgbm9ybWFsIGFrxLHFn8SxbiBhw6fEsWxtYXlhY2HEn8SxIHlhesSxeW9yLiDigJxFc2tpIHnDtm5sZW5kaXJtZeKAnSBzw7Z6Y8O8xJ/DvCBla3JhbmRhIGRvxJ9ydWRhbiBnZcOnbWl5b3IuCjE1LiBHw7x2ZW5saWsgZHVydcWfdW5kYSBzZWJlcCwgc29udcOnLCDFn2ltZGkgeWFwxLFsYWNhayB2ZSB5ZW5pZGVuIGdpcmnFnyBhw6fEsWtsYW7EsXlvciBtdT8g4oCUIEV2ZXQ6IHNlYmVwIOKAnMOWcm5layBnw7x2ZW5saWsgYnVsZ3VzdeKAnTsgc29udcOnIOKAnE5vcm1hbCBha8SxxZ8gYcOnxLFsbWF64oCdOyDFn2ltZGkg4oCcxLDFn2xlbWUgYmHFn2xhbWE7IGRlc3RlayB5b2x1bnUga3VsbGFu4oCdOyB5ZW5pZGVuIGdpcmnFnyDigJxHw7xuY2VsIGRlxJ9lcmxlbmRpcm1lIGlsZSB5ZW5pZGVuIGRlbmUu4oCdCjE2LiDigJzEsHN0ZWsgZ8O2bmRlcmlsZGnigJ0gc29ucmFraSBhZMSxbcSxbiB0YW1hbWxhbmTEscSfxLFuxLEgbcSxIGfDtnN0ZXJpcj8g4oCUIEhhecSxci4gQmlyIGVrcmFuIOKAnFNvbnJha2kgYWvEscWfIGhlbsO8eiBhw6fEsWxtxLHFnyBzYXnEsWxtYXrigJ0sIGRpxJ9lcmkg4oCcU29udcOnIGhlbsO8eiBkb8SfcnVsYW5txLHFnyBkZcSfaWzigJ0gZGl5b3IuCjE3LiBIZXNhcC9wcm9maWwgem9ydW5sdSBtdT8g4oCUIEhhecSxcjsgYcOnxLFrbGFtYSB6b3J1bmx1IG9sbWFkxLHEn8SxbsSxIHPDtnlsw7x5b3IuCjE4LiBBbHQgw6d1YnVrdGFraSBiZcWfIGLDtmzDvG0gdmUgc2XDp2lsaSBvbGFuIG5lZGlyPyDigJQgR2FyYWosIEJha8SxbSwgQUkgVXN0YSwgR2XDp21pxZ8sIFRvcGx1bHVrOyBBSSBVc3RhIHNlw6dpbGkuCjE5LiBCYWvEsW0vZ2XDp21pxZ8vdG9wbHVsdWsgw7Z6ZXRpIHZleWEgcG9ww7xsZXIgbGlzdGUgdmFyIG3EsT8g4oCUIEfDtnLDvG5lbiBnaXJpxZ8gZWtyYW5sYXLEsW5kYSB5b2s7IHNlw6dpbS9kdXJ1bS9hw6fEsWtsYW1hIHZlIGdlemlubWUgw6d1YnXEn3UgdmFyLgoyMC4gw5ZybmVrIGVrcmFuIGdlcsOnZWsgbW90b3Npa2xldCB1eWd1bmx1xJ91bnUsIGfDvG5jZWwgw7xyZXRpbSBpem5pbmkgdmV5YSBjYW5sxLEgQUnigJnEsSBrYW7EsXRsYXIgbcSxPyDigJQgSGF5xLFyLiDDlnJuZWsga3VsbGFuxLFjxLEgYmV5YW7EsSBkxLHFn8SxbmRhIGdlcsOnZWsgdXlndW5sdWsgc29udWN1LCBnw7xuY2VsIGl6aW4gdmV5YSBjYW5sxLEgYmHEn2xhbnTEsSBnw7ZzdGVyZ2VzaSBnw7Zyw7xubcO8eW9yLgoKQmVsaXJzaXpsaWsgdmUgw6dlbGnFn2tpIG5vdGxhcsSxCi0gQcOnxLFrbGFtYSBwYW5lbGkgYcOnxLFsZMSxxJ/EsW5kYSAyMCBzb3J1bnVuIHlhbsSxdMSxIGfDtnLDvG7DvHIgbWV0aW5kZW4gdmVyaWxlYmlsaXlvci4gQW5jYWsgZ2lyacWfIGVrcmFuxLEgdGVrIGJhxZ/EsW5hIHRhbWlyIGl6bmksIGJlbGlyc2l6IHRlxZ9oaXMsIHNlcmJlc3Qgc29oYmV0LCByZXNtw64gcmVoYmVyIHZlIGhlc2FwIGdlcmVrbGlsacSfaSBnaWJpIGFubGFtbGFyxLEgZ8O2c3Rlcm1peW9yLiDigJxZYXJkxLFtIG9sbWFkYW7igJ0gw7Zsw6fDvHTDvCB1eWd1bGFtYSBpw6dpIGHDp8Sxa2xhbWF5xLEgZGEga2Fwc2FtIGTEscWfxLEgc2F5xLF5b3JzYSBpbGsgZWtyYW4gMjAvMjAgYcOnxLFrIGRlxJ9pbC4KLSBVeWd1bmx1ayB2ZSBoYXrEsXJsxLFrIHPEsXJhc8SxIGJlbGlydGlsbWnFnywgZmFrYXQgaGFuZ2kgc2F5ZmFkYS9iw7Zsw7xtZGUgb2xkdcSfdSBhZGxhbmTEsXLEsWxtYW3EscWfLgotIEJhxJ9sYW0g4oCcw5ZybmVrIG1vdG9zaWtsZXQgwrcga3VsbGFuxLFjxLEgYmV5YW7EseKAnSBkaXlvcjsgZ2Vyw6dlayBtb3Rvc2lrbGV0IGtpbWxpxJ9pIGJ1IMO2cm5layBla3JhbmRhbiBhbmxhxZ/EsWxhbWF6LgotIG5vLWhhbmRsZXIgZWtyYW7EsW5kYSBkw7zEn21lbGVyIHZlIGJhxJ9sYW0gYmHEn2xhbnTEsXPEsSBzb2x1aywgZmFrYXQgbmVkZW4ga3VsbGFuxLFsYW1hZMSxa2xhcsSxbsSxIGFubGF0YW4gZHVydW0gbWV0bmkgeW9rLgotIGxvbmctY29udGV4dCBnw7Zyw7xudMO8c8O8bmRlIGJhxJ9sYW0gc2F0xLFyxLEgYmlyw6dvayBrZXogeWluZWxlbml5b3IgdmUgacOnZXJpxJ9pIGHFn2HEn8SxIGl0aXlvcjsgb2t1bmFiaWxpcmxpxJ9pIGF6YWx0xLF5b3IuCi0gc3VwcG9ydC1yZXF1ZXN0ZWQgZWtyYW7EsSBheW7EsSBhbmRhIOKAnEdpcmnFnyDFn3UgYW5kYSBhw6fEsWxhbcSxeW9y4oCdIHZlIOKAnEdlw6dpxZ8gaXN0ZcSfaSBnw7ZuZGVyaWxkaS4gU29udcOnIGhlbsO8eiBkb8SfcnVsYW5txLHFnyBkZcSfaWzigJ0gZGl5b3IuIFNvbiBjw7xtbGUgdGFtYW1sYW5tYSBpZGRpYXPEsW7EsSDDtm5sw7x5b3IsIGFtYSBpa2kgbWVzYWrEsW4geWFuIHlhbmEgZ2VsacWfaSBhbmxhbSBnZXJpbGltaSB5YXJhdMSxeW9yLgotIEJpbGluZW4gacWfIHZlIEdhcmFqIGdlw6dpxZ9pIG1lc2FqbGFyxLEg4oCcU2XDp2ltIGlzdGXEn2nigJ0gLyDigJxHZcOnacWfIGlzdGXEn2nigJ0gb2xhcmFrIGZhcmtsxLE7IGlraXNpIGRlIGFrxLHFn8SxbiBhw6fEsWxkxLHEn8SxbsSxIHZleWEgc29udWN1biBkb8SfcnVsYW5kxLHEn8SxbsSxIHPDtnlsZW1peW9yLiBCdSBpw6dlcmlrIMOnZWxpxZ9raXNpIGRlxJ9pbCwgdGVyaW0gdHV0YXJsxLFsxLHEn8SxIGZhcmvEsS4KCllhbG7EsXogZWtyYW4gb2t1bWFzxLEgaMO8a23DvApBbmEgc2XDp2ltIGF5csSxbcSxIGFubGHFn8SxbMSxciB2ZSBhw6fEsWtsYW1hIHBhbmVsaXlsZSBiaXJsaWt0ZSBzYWJpdCBzb3J1bGFyIHlhbsSxdGxhbmFiaWxpeW9yLiBBw6fEsWtsYW1hIHBhbmVsaSBhw6fEsWxtYWRhbiAyMC8yMCDigJx5YXJkxLFtIG9sbWFkYW7igJ0gYcOnxLFrbMSxayBrb8WfdWx1IGthcsWfxLFsYW5txLF5b3IuIG5vLWhhbmRsZXIga29udHJvbGxlcmluaW4gc29sdWsgb2xtYSBzZWJlYmkgdmUgw7ZybmVrIG1vdG9zaWtsZXQgYmHEn2xhbcSxbsSxbiBnZXLDp2VrbGnEn2kgZ8O2csO8bsO8ciBla3JhbmxhcmRhbiBhbmxhxZ/EsWxhbcSxeW9yLiBCdSwgeWFsbsSxeiBla3JhbiBva3VtYXPEsWTEsXI7IGtvZCB2ZXlhIMO8cmV0aW0gZGF2cmFuxLHFn8SxIGthbsSxdMSxIGRlxJ9pbGRpci4=</pre>
</details>

## R1 özgün7410bayt ayrı kapsam eki

RAW 7410 SHA256 fbbddc27e1a270029fe2ac964d6b3ced256d9e99c0e30610e3857a2e9c19f7f4.

<details><summary>Tam özgün rapor</summary>
<pre>EK RAPOR — İLK EKRAN OKUMASI KAPSAM AÇIKLAMASI
Tarih: 2026-10-09

Bu ayrı not, özgün first-reading.txt dosyasını değiştirmez. Yalnızca sağlanan gerçek PNG ekranlarının kapsamı ve soruların görünür ekranlardan ne ölçüde cevaplanabildiği hakkındadır. Kod, plan, önceki konuşma veya beklenen cevaplar dayanak alınmadı.

Ölçüt yorumu
Sabit soru seti, yalnızca ilk root görünümünü değil, sağlanan gerçek ekranların tamamını kapsar: root ekranları, uygulama içindeki isteğe bağlı açıklama panelinin açık hâli ve durum/güvenlik ekranları. Bu değerlendirmede “dışarıdan yardım olmadan” ifadesi; insan açıklaması, kod incelemesi veya beklenen cevabın yardımı olmaması anlamındadır. Ekranda sunulan uygulama içi açıklama da değerlendirme kanıtıdır. Bu yüzden ilk ekranda görünmeyen ama isteğe bağlı panelde açıkça yazan bilgiler sorular için kullanılabilir.

Önceki hüküm, açıklama panelinin kapalı olduğu ilk görünüm hakkında dar kapsamlı bir nottu. Bu not o ilk görünüm bulgusunu korur; tüm ekran seti için otomatik PASS kararı vermez.

20 sabit sorunun ekran kapsamındaki açıklığı
1. “Bu ekranın ana sorusu ve iki seçeneği nedir?” — Açık. Root başlık ve iki seçenek metniyle görünür.
2. “Yapacağın işi biliyorsan hangi seçeneği kullanırsın?” — Açık. Açıklama, ilk seçeneği bu durumla eşliyor.
3. “Bir ses, belirti veya arıza şüphen varsa hangi seçeneği kullanırsın?” — Açık. Açıklama, ikinci seçeneği belirti/arıza şüphesiyle eşliyor.
4. “Bir iş seçmek doğrudan motosiklette tamire başlama izni verir mi?” — Açık. Yardım metni seçim isteğinin uygulama izni olmadığını ve girişin tamir adımı sunmadığını söylüyor.
5. “İş yolunda uygunluk ve hazırlık değerlendirmesi nerede yapılır?” — Kısmen açık; sıkı anlam açıklığı ölçütünü karşılamıyor. Yardım metni sıralamayı verir: önce iş bulunur, ardından motosiklete uygunluk ve hazırlık koşulları değerlendirilir. Fakat “nerede” sorusuna bir ekran, bölüm veya adlandırılmış aşama söylemez. Kullanıcı yalnızca bunun iş bulunduktan sonra olduğunu çıkarabilir.
6. “Belirti yolunu seçmek kesin teşhis veya parça değiştirme kararı mı verir?” — Açık. Yardım metni kesin teşhis veya parça kararı olmadığını söylüyor.
7. “Yetersiz kanıtla kesin bir teşhis yoksa belirsiz sonuç mümkün mü?” — Açık. Yardım metni yeterli kanıt yoksa sonucun belirsiz kalabileceğini söylüyor.
8. “Bu girişte serbest metin sohbet kutusu veya teknik cevap bulunuyor mu?” — Açık. Yardım metni serbest metin sohbeti sunulmadığını söylüyor; hiçbir sağlanan giriş görüntüsünde teknik cevap yok.
9. “Hangi motosiklet bağlamında olduğunu nereden anlarsın?” — Açık. Üst bağlam satırı “Motosikletim: Örnek motosiklet · kullanıcı beyanı” diyor. “Örnek” etiketi de bunun gerçek motosiklet kimliğini kanıtlamadığını açık bırakıyor.
10. “Motosiklet bağlamını değiştirme işi hangi bölümdedir?” — Açık. “Bağlamı Garaj’da yönet” bağlantısı görünür.
11. “İki seçenekten emin değilsen yardım nasıl açılır; üçüncü eşit bir yol mu?” — Açık. “Hangisini seçmeliyim?” yardım bağlantısı açıklamayı açıyor; iki ana seçeneğe üçüncü eşit seçenek eklenmiyor.
12. “Bu ekran yapay zekâ cevabını doğrulanmış resmî rehber gibi sunuyor mu?” — Açık. Yardım metni AI önerisinin doğrulanmış resmî rehber yerine geçmediğini söylüyor.
13. “Bağlam veya güncel yönlendirme kaynağı eksikse normal seçim açılır mı?” — Açık. Durum ekranları normal iş akışının açılmadığını ve güncel kaynakla yeniden denemeyi söylüyor.
14. “Çevrimdışı ya da eski yönlendirme güncel uygulama izni yerine geçer mi?” — Yanıt açık: hayır. Çevrimdışı ekranı güncel yönlendirmenin doğrulanamayacağını, normal akışın açılmayacağını söylüyor; eksik/eski bağlam ekranı güncel kaynakla yeniden denemeyi söylüyor. Küçük ifade farkı: “eski yönlendirme” sözcükleri ekranda aynen kullanılmıyor.
15. “Güvenlik nedeniyle durulduğunda sebep, sonucu, yapılabilecek iş ve yeniden giriş açıklanıyor mu?” — Açık. Güvenlik ekranı sebep, normal akışın açılmaması, şimdi yapılacaklar ve güncel değerlendirme sonrası yeniden giriş alanlarını ayrı ayrı veriyor.
16. “Bir seçim isteği gönderildi mesajı sonraki işlemin tamamlandığını mı gösterir?” — Açık. Sağlanan mesajlar sonraki akışın açılmadığını veya sonucun doğrulanmadığını açıkça söylüyor.
17. “Bu giriş için hesap veya profil zorunlu mu?” — Açık. Yardım metni zorunlu olmadığını söylüyor.
18. “Alt bölüm çubuğunda hangi beş bölüm var ve hangisi seçili?” — Açık. Beş etiket ve seçili AI Usta bölümü görünür.
19. “Bu ekranda bakım, geçmiş, topluluk özetleri veya popüler öneri listesi var mı?” — Açık. Sağlanan giriş görüntülerinde bu listeler/özetler yer almıyor; alt gezinme etiketi tek başına içerik listesi göstermiyor.
20. “Bir örnek ekran gerçek motosiklet uygunluğunu, güncel üretim iznini veya canlı AI bağlantısını kanıtlar mı?” — Açık, görünür kanıt bakımından. Ekran örnek kullanıcı beyanı gösteriyor; uygunluk sonucu, güncel izin veya canlı bağlantı göstergesi içermiyor. Bu yanıt, sistemin gerçekte bağlı olmadığı iddiası değil; yalnızca ekranların bunu kanıtlamadığı anlamındadır.

Tüm ekran seti için sonuç
19 soru sağlanan ekranların metin ve durumlarından anlamca açık. 5. sorunun “nerede” kısmı adlandırılmış bir yer/ekranla yanıtlanmıyor; yalnızca işlem sırası görünüyor. Bu nedenle katı “20 yanıtın tümü anlamca açık olmalı” ölçütüne göre tam PASS sonucu verilemez. 14. soruda da “eski yönlendirme” terimi ekranda doğrudan geçmese de, güncel kaynak gerekliliği ve çevrimdışı engeli cevabı destekliyor. Uygulama içi açıklama panelini ekran setine dahil etmek, ilk görünümdeki açıklama eksikliğini gideriyor; 5. sorudaki yer belirsizliğini gidermiyor.

Korunan gerçek UI bulguları
- no-handler görüntüsünde seçim düğmeleri ve bağlam bağlantısı soluk görünüyor; ekranda bunun nedenini açıklayan durum metni yok.
- long-context görüntüsünde örnek motosiklet/kullanıcı beyanı bağlam metni yineleniyor ve içeriği aşağı itiyor.
- support-requested görüntüsünde “Giriş şu anda açılamıyor” mesajı, “Geçiş isteği gönderildi. Sonuç henüz doğrulanmış değil” mesajıyla birlikte. İkincisi tamamlanma iddiasını önlese de, aynı ekrandaki iki durum yan yana gelince anlam gerilimi yaratıyor.
- Bilinen iş ve Garaj geçiş ekranlarında “Seçim isteği” ve “Geçiş isteği” farklı terimlerle kullanılıyor; iki metin de akışın tamamlandığını söylemiyor.
- Bağlam satırındaki “Örnek motosiklet · kullanıcı beyanı” gerçek motosiklet modelini belirlemiyor.

Bu ek rapor yalnız sağlanan ekranların kullanıcıya verdiği anlamı değerlendirir; kodun mantığını veya üretim davranışını kanıtlamaz.
</pre>
</details>

<details><summary>Özgün RAWBase64</summary>
<pre>RUsgUkFQT1Ig4oCUIMSwTEsgRUtSQU4gT0tVTUFTSSBLQVBTQU0gQcOHSUtMQU1BU0kKVGFyaWg6IDIwMjYtMTAtMDkKCkJ1IGF5csSxIG5vdCwgw7Z6Z8O8biBmaXJzdC1yZWFkaW5nLnR4dCBkb3N5YXPEsW7EsSBkZcSfacWfdGlybWV6LiBZYWxuxLF6Y2Egc2HEn2xhbmFuIGdlcsOnZWsgUE5HIGVrcmFubGFyxLFuxLFuIGthcHNhbcSxIHZlIHNvcnVsYXLEsW4gZ8O2csO8bsO8ciBla3JhbmxhcmRhbiBuZSDDtmzDp8O8ZGUgY2V2YXBsYW5hYmlsZGnEn2kgaGFra8SxbmRhZMSxci4gS29kLCBwbGFuLCDDtm5jZWtpIGtvbnXFn21hIHZleWEgYmVrbGVuZW4gY2V2YXBsYXIgZGF5YW5hayBhbMSxbm1hZMSxLgoKw5Zsw6fDvHQgeW9ydW11ClNhYml0IHNvcnUgc2V0aSwgeWFsbsSxemNhIGlsayByb290IGfDtnLDvG7DvG3DvG7DvCBkZcSfaWwsIHNhxJ9sYW5hbiBnZXLDp2VrIGVrcmFubGFyxLFuIHRhbWFtxLFuxLEga2Fwc2FyOiByb290IGVrcmFubGFyxLEsIHV5Z3VsYW1hIGnDp2luZGVraSBpc3RlxJ9lIGJhxJ9sxLEgYcOnxLFrbGFtYSBwYW5lbGluaW4gYcOnxLFrIGjDomxpIHZlIGR1cnVtL2fDvHZlbmxpayBla3JhbmxhcsSxLiBCdSBkZcSfZXJsZW5kaXJtZWRlIOKAnGTEscWfYXLEsWRhbiB5YXJkxLFtIG9sbWFkYW7igJ0gaWZhZGVzaTsgaW5zYW4gYcOnxLFrbGFtYXPEsSwga29kIGluY2VsZW1lc2kgdmV5YSBiZWtsZW5lbiBjZXZhYsSxbiB5YXJkxLFtxLEgb2xtYW1hc8SxIGFubGFtxLFuZGFkxLFyLiBFa3JhbmRhIHN1bnVsYW4gdXlndWxhbWEgacOnaSBhw6fEsWtsYW1hIGRhIGRlxJ9lcmxlbmRpcm1lIGthbsSxdMSxZMSxci4gQnUgecO8emRlbiBpbGsgZWtyYW5kYSBnw7Zyw7xubWV5ZW4gYW1hIGlzdGXEn2UgYmHEn2zEsSBwYW5lbGRlIGHDp8Sxa8OnYSB5YXphbiBiaWxnaWxlciBzb3J1bGFyIGnDp2luIGt1bGxhbsSxbGFiaWxpci4KCsOWbmNla2kgaMO8a8O8bSwgYcOnxLFrbGFtYSBwYW5lbGluaW4ga2FwYWzEsSBvbGR1xJ91IGlsayBnw7Zyw7xuw7xtIGhha2vEsW5kYSBkYXIga2Fwc2FtbMSxIGJpciBub3R0dS4gQnUgbm90IG8gaWxrIGfDtnLDvG7DvG0gYnVsZ3VzdW51IGtvcnVyOyB0w7xtIGVrcmFuIHNldGkgacOnaW4gb3RvbWF0aWsgUEFTUyBrYXJhcsSxIHZlcm1lei4KCjIwIHNhYml0IHNvcnVudW4gZWtyYW4ga2Fwc2FtxLFuZGFraSBhw6fEsWtsxLHEn8SxCjEuIOKAnEJ1IGVrcmFuxLFuIGFuYSBzb3J1c3UgdmUgaWtpIHNlw6dlbmXEn2kgbmVkaXI/4oCdIOKAlCBBw6fEsWsuIFJvb3QgYmHFn2zEsWsgdmUgaWtpIHNlw6dlbmVrIG1ldG5peWxlIGfDtnLDvG7DvHIuCjIuIOKAnFlhcGFjYcSfxLFuIGnFn2kgYmlsaXlvcnNhbiBoYW5naSBzZcOnZW5lxJ9pIGt1bGxhbsSxcnPEsW4/4oCdIOKAlCBBw6fEsWsuIEHDp8Sxa2xhbWEsIGlsayBzZcOnZW5lxJ9pIGJ1IGR1cnVtbGEgZcWfbGl5b3IuCjMuIOKAnEJpciBzZXMsIGJlbGlydGkgdmV5YSBhcsSxemEgxZ/DvHBoZW4gdmFyc2EgaGFuZ2kgc2XDp2VuZcSfaSBrdWxsYW7EsXJzxLFuP+KAnSDigJQgQcOnxLFrLiBBw6fEsWtsYW1hLCBpa2luY2kgc2XDp2VuZcSfaSBiZWxpcnRpL2FyxLF6YSDFn8O8cGhlc2l5bGUgZcWfbGl5b3IuCjQuIOKAnEJpciBpxZ8gc2XDp21layBkb8SfcnVkYW4gbW90b3Npa2xldHRlIHRhbWlyZSBiYcWfbGFtYSBpem5pIHZlcmlyIG1pP+KAnSDigJQgQcOnxLFrLiBZYXJkxLFtIG1ldG5pIHNlw6dpbSBpc3RlxJ9pbmluIHV5Z3VsYW1hIGl6bmkgb2xtYWTEscSfxLFuxLEgdmUgZ2lyacWfaW4gdGFtaXIgYWTEsW3EsSBzdW5tYWTEscSfxLFuxLEgc8O2eWzDvHlvci4KNS4g4oCcxLDFnyB5b2x1bmRhIHV5Z3VubHVrIHZlIGhhesSxcmzEsWsgZGXEn2VybGVuZGlybWVzaSBuZXJlZGUgeWFwxLFsxLFyP+KAnSDigJQgS8Sxc21lbiBhw6fEsWs7IHPEsWvEsSBhbmxhbSBhw6fEsWtsxLHEn8SxIMO2bMOnw7x0w7xuw7wga2FyxZ/EsWxhbcSxeW9yLiBZYXJkxLFtIG1ldG5pIHPEsXJhbGFtYXnEsSB2ZXJpcjogw7ZuY2UgacWfIGJ1bHVudXIsIGFyZMSxbmRhbiBtb3Rvc2lrbGV0ZSB1eWd1bmx1ayB2ZSBoYXrEsXJsxLFrIGtvxZ91bGxhcsSxIGRlxJ9lcmxlbmRpcmlsaXIuIEZha2F0IOKAnG5lcmVkZeKAnSBzb3J1c3VuYSBiaXIgZWtyYW4sIGLDtmzDvG0gdmV5YSBhZGxhbmTEsXLEsWxtxLHFnyBhxZ9hbWEgc8O2eWxlbWV6LiBLdWxsYW7EsWPEsSB5YWxuxLF6Y2EgYnVudW4gacWfIGJ1bHVuZHVrdGFuIHNvbnJhIG9sZHXEn3VudSDDp8Sxa2FyYWJpbGlyLgo2LiDigJxCZWxpcnRpIHlvbHVudSBzZcOnbWVrIGtlc2luIHRlxZ9oaXMgdmV5YSBwYXLDp2EgZGXEn2nFn3Rpcm1lIGthcmFyxLEgbcSxIHZlcmlyP+KAnSDigJQgQcOnxLFrLiBZYXJkxLFtIG1ldG5pIGtlc2luIHRlxZ9oaXMgdmV5YSBwYXLDp2Ega2FyYXLEsSBvbG1hZMSxxJ/EsW7EsSBzw7Z5bMO8eW9yLgo3LiDigJxZZXRlcnNpeiBrYW7EsXRsYSBrZXNpbiBiaXIgdGXFn2hpcyB5b2tzYSBiZWxpcnNpeiBzb251w6cgbcO8bWvDvG4gbcO8P+KAnSDigJQgQcOnxLFrLiBZYXJkxLFtIG1ldG5pIHlldGVybGkga2FuxLF0IHlva3NhIHNvbnVjdW4gYmVsaXJzaXoga2FsYWJpbGVjZcSfaW5pIHPDtnlsw7x5b3IuCjguIOKAnEJ1IGdpcmnFn3RlIHNlcmJlc3QgbWV0aW4gc29oYmV0IGt1dHVzdSB2ZXlhIHRla25payBjZXZhcCBidWx1bnV5b3IgbXU/4oCdIOKAlCBBw6fEsWsuIFlhcmTEsW0gbWV0bmkgc2VyYmVzdCBtZXRpbiBzb2hiZXRpIHN1bnVsbWFkxLHEn8SxbsSxIHPDtnlsw7x5b3I7IGhpw6diaXIgc2HEn2xhbmFuIGdpcmnFnyBnw7Zyw7xudMO8c8O8bmRlIHRla25payBjZXZhcCB5b2suCjkuIOKAnEhhbmdpIG1vdG9zaWtsZXQgYmHEn2xhbcSxbmRhIG9sZHXEn3VudSBuZXJlZGVuIGFubGFyc8Sxbj/igJ0g4oCUIEHDp8Sxay4gw5xzdCBiYcSfbGFtIHNhdMSxcsSxIOKAnE1vdG9zaWtsZXRpbTogw5ZybmVrIG1vdG9zaWtsZXQgwrcga3VsbGFuxLFjxLEgYmV5YW7EseKAnSBkaXlvci4g4oCcw5ZybmVr4oCdIGV0aWtldGkgZGUgYnVudW4gZ2Vyw6dlayBtb3Rvc2lrbGV0IGtpbWxpxJ9pbmkga2FuxLF0bGFtYWTEscSfxLFuxLEgYcOnxLFrIGLEsXJha8SxeW9yLgoxMC4g4oCcTW90b3Npa2xldCBiYcSfbGFtxLFuxLEgZGXEn2nFn3Rpcm1lIGnFn2kgaGFuZ2kgYsO2bMO8bWRlZGlyP+KAnSDigJQgQcOnxLFrLiDigJxCYcSfbGFtxLEgR2FyYWrigJlkYSB5w7ZuZXTigJ0gYmHEn2xhbnTEsXPEsSBnw7Zyw7xuw7xyLgoxMS4g4oCcxLBraSBzZcOnZW5la3RlbiBlbWluIGRlxJ9pbHNlbiB5YXJkxLFtIG5hc8SxbCBhw6fEsWzEsXI7IMO8w6fDvG5jw7wgZcWfaXQgYmlyIHlvbCBtdT/igJ0g4oCUIEHDp8Sxay4g4oCcSGFuZ2lzaW5pIHNlw6dtZWxpeWltP+KAnSB5YXJkxLFtIGJhxJ9sYW50xLFzxLEgYcOnxLFrbGFtYXnEsSBhw6fEsXlvcjsgaWtpIGFuYSBzZcOnZW5lxJ9lIMO8w6fDvG5jw7wgZcWfaXQgc2XDp2VuZWsgZWtsZW5taXlvci4KMTIuIOKAnEJ1IGVrcmFuIHlhcGF5IHpla8OiIGNldmFixLFuxLEgZG/En3J1bGFubcSxxZ8gcmVzbcOuIHJlaGJlciBnaWJpIHN1bnV5b3IgbXU/4oCdIOKAlCBBw6fEsWsuIFlhcmTEsW0gbWV0bmkgQUkgw7ZuZXJpc2luaW4gZG/En3J1bGFubcSxxZ8gcmVzbcOuIHJlaGJlciB5ZXJpbmUgZ2XDp21lZGnEn2luaSBzw7Z5bMO8eW9yLgoxMy4g4oCcQmHEn2xhbSB2ZXlhIGfDvG5jZWwgecO2bmxlbmRpcm1lIGtheW5hxJ/EsSBla3Npa3NlIG5vcm1hbCBzZcOnaW0gYcOnxLFsxLFyIG3EsT/igJ0g4oCUIEHDp8Sxay4gRHVydW0gZWtyYW5sYXLEsSBub3JtYWwgacWfIGFrxLHFn8SxbsSxbiBhw6fEsWxtYWTEscSfxLFuxLEgdmUgZ8O8bmNlbCBrYXluYWtsYSB5ZW5pZGVuIGRlbmVtZXlpIHPDtnlsw7x5b3IuCjE0LiDigJzDh2V2cmltZMSxxZ/EsSB5YSBkYSBlc2tpIHnDtm5sZW5kaXJtZSBnw7xuY2VsIHV5Z3VsYW1hIGl6bmkgeWVyaW5lIGdlw6dlciBtaT/igJ0g4oCUIFlhbsSxdCBhw6fEsWs6IGhhecSxci4gw4dldnJpbWTEscWfxLEgZWtyYW7EsSBnw7xuY2VsIHnDtm5sZW5kaXJtZW5pbiBkb8SfcnVsYW5hbWF5YWNhxJ/EsW7EsSwgbm9ybWFsIGFrxLHFn8SxbiBhw6fEsWxtYXlhY2HEn8SxbsSxIHPDtnlsw7x5b3I7IGVrc2lrL2Vza2kgYmHEn2xhbSBla3JhbsSxIGfDvG5jZWwga2F5bmFrbGEgeWVuaWRlbiBkZW5lbWV5aSBzw7Z5bMO8eW9yLiBLw7zDp8O8ayBpZmFkZSBmYXJrxLE6IOKAnGVza2kgecO2bmxlbmRpcm1l4oCdIHPDtnpjw7xrbGVyaSBla3JhbmRhIGF5bmVuIGt1bGxhbsSxbG3EsXlvci4KMTUuIOKAnEfDvHZlbmxpayBuZWRlbml5bGUgZHVydWxkdcSfdW5kYSBzZWJlcCwgc29udWN1LCB5YXDEsWxhYmlsZWNlayBpxZ8gdmUgeWVuaWRlbiBnaXJpxZ8gYcOnxLFrbGFuxLF5b3IgbXU/4oCdIOKAlCBBw6fEsWsuIEfDvHZlbmxpayBla3JhbsSxIHNlYmVwLCBub3JtYWwgYWvEscWfxLFuIGHDp8SxbG1hbWFzxLEsIMWfaW1kaSB5YXDEsWxhY2FrbGFyIHZlIGfDvG5jZWwgZGXEn2VybGVuZGlybWUgc29ucmFzxLEgeWVuaWRlbiBnaXJpxZ8gYWxhbmxhcsSxbsSxIGF5csSxIGF5csSxIHZlcml5b3IuCjE2LiDigJxCaXIgc2XDp2ltIGlzdGXEn2kgZ8O2bmRlcmlsZGkgbWVzYWrEsSBzb25yYWtpIGnFn2xlbWluIHRhbWFtbGFuZMSxxJ/EsW7EsSBtxLEgZ8O2c3RlcmlyP+KAnSDigJQgQcOnxLFrLiBTYcSfbGFuYW4gbWVzYWpsYXIgc29ucmFraSBha8SxxZ/EsW4gYcOnxLFsbWFkxLHEn8SxbsSxIHZleWEgc29udWN1biBkb8SfcnVsYW5tYWTEscSfxLFuxLEgYcOnxLFrw6dhIHPDtnlsw7x5b3IuCjE3LiDigJxCdSBnaXJpxZ8gacOnaW4gaGVzYXAgdmV5YSBwcm9maWwgem9ydW5sdSBtdT/igJ0g4oCUIEHDp8Sxay4gWWFyZMSxbSBtZXRuaSB6b3J1bmx1IG9sbWFkxLHEn8SxbsSxIHPDtnlsw7x5b3IuCjE4LiDigJxBbHQgYsO2bMO8bSDDp3VidcSfdW5kYSBoYW5naSBiZcWfIGLDtmzDvG0gdmFyIHZlIGhhbmdpc2kgc2XDp2lsaT/igJ0g4oCUIEHDp8Sxay4gQmXFnyBldGlrZXQgdmUgc2XDp2lsaSBBSSBVc3RhIGLDtmzDvG3DvCBnw7Zyw7xuw7xyLgoxOS4g4oCcQnUgZWtyYW5kYSBiYWvEsW0sIGdlw6dtacWfLCB0b3BsdWx1ayDDtnpldGxlcmkgdmV5YSBwb3DDvGxlciDDtm5lcmkgbGlzdGVzaSB2YXIgbcSxP+KAnSDigJQgQcOnxLFrLiBTYcSfbGFuYW4gZ2lyacWfIGfDtnLDvG50w7xsZXJpbmRlIGJ1IGxpc3RlbGVyL8O2emV0bGVyIHllciBhbG3EsXlvcjsgYWx0IGdlemlubWUgZXRpa2V0aSB0ZWsgYmHFn8SxbmEgacOnZXJpayBsaXN0ZXNpIGfDtnN0ZXJtaXlvci4KMjAuIOKAnEJpciDDtnJuZWsgZWtyYW4gZ2Vyw6dlayBtb3Rvc2lrbGV0IHV5Z3VubHXEn3VudSwgZ8O8bmNlbCDDvHJldGltIGl6bmluaSB2ZXlhIGNhbmzEsSBBSSBiYcSfbGFudMSxc8SxbsSxIGthbsSxdGxhciBtxLE/4oCdIOKAlCBBw6fEsWssIGfDtnLDvG7DvHIga2FuxLF0IGJha8SxbcSxbmRhbi4gRWtyYW4gw7ZybmVrIGt1bGxhbsSxY8SxIGJleWFuxLEgZ8O2c3Rlcml5b3I7IHV5Z3VubHVrIHNvbnVjdSwgZ8O8bmNlbCBpemluIHZleWEgY2FubMSxIGJhxJ9sYW50xLEgZ8O2c3Rlcmdlc2kgacOnZXJtaXlvci4gQnUgeWFuxLF0LCBzaXN0ZW1pbiBnZXLDp2VrdGUgYmHEn2zEsSBvbG1hZMSxxJ/EsSBpZGRpYXPEsSBkZcSfaWw7IHlhbG7EsXpjYSBla3JhbmxhcsSxbiBidW51IGthbsSxdGxhbWFkxLHEn8SxIGFubGFtxLFuZGFkxLFyLgoKVMO8bSBla3JhbiBzZXRpIGnDp2luIHNvbnXDpwoxOSBzb3J1IHNhxJ9sYW5hbiBla3JhbmxhcsSxbiBtZXRpbiB2ZSBkdXJ1bWxhcsSxbmRhbiBhbmxhbWNhIGHDp8Sxay4gNS4gc29ydW51biDigJxuZXJlZGXigJ0ga8Sxc23EsSBhZGxhbmTEsXLEsWxtxLHFnyBiaXIgeWVyL2VrcmFubGEgeWFuxLF0bGFubcSxeW9yOyB5YWxuxLF6Y2EgacWfbGVtIHPEsXJhc8SxIGfDtnLDvG7DvHlvci4gQnUgbmVkZW5sZSBrYXTEsSDigJwyMCB5YW7EsXTEsW4gdMO8bcO8IGFubGFtY2EgYcOnxLFrIG9sbWFsxLHigJ0gw7Zsw6fDvHTDvG5lIGfDtnJlIHRhbSBQQVNTIHNvbnVjdSB2ZXJpbGVtZXouIDE0LiBzb3J1ZGEgZGEg4oCcZXNraSB5w7ZubGVuZGlybWXigJ0gdGVyaW1pIGVrcmFuZGEgZG/En3J1ZGFuIGdlw6dtZXNlIGRlLCBnw7xuY2VsIGtheW5hayBnZXJla2xpbGnEn2kgdmUgw6dldnJpbWTEscWfxLEgZW5nZWxpIGNldmFixLEgZGVzdGVrbGl5b3IuIFV5Z3VsYW1hIGnDp2kgYcOnxLFrbGFtYSBwYW5lbGluaSBla3JhbiBzZXRpbmUgZGFoaWwgZXRtZWssIGlsayBnw7Zyw7xuw7xtZGVraSBhw6fEsWtsYW1hIGVrc2lrbGnEn2luaSBnaWRlcml5b3I7IDUuIHNvcnVkYWtpIHllciBiZWxpcnNpemxpxJ9pbmkgZ2lkZXJtaXlvci4KCktvcnVuYW4gZ2Vyw6dlayBVSSBidWxndWxhcsSxCi0gbm8taGFuZGxlciBnw7Zyw7xudMO8c8O8bmRlIHNlw6dpbSBkw7zEn21lbGVyaSB2ZSBiYcSfbGFtIGJhxJ9sYW50xLFzxLEgc29sdWsgZ8O2csO8bsO8eW9yOyBla3JhbmRhIGJ1bnVuIG5lZGVuaW5pIGHDp8Sxa2xheWFuIGR1cnVtIG1ldG5pIHlvay4KLSBsb25nLWNvbnRleHQgZ8O2csO8bnTDvHPDvG5kZSDDtnJuZWsgbW90b3Npa2xldC9rdWxsYW7EsWPEsSBiZXlhbsSxIGJhxJ9sYW0gbWV0bmkgeWluZWxlbml5b3IgdmUgacOnZXJpxJ9pIGHFn2HEn8SxIGl0aXlvci4KLSBzdXBwb3J0LXJlcXVlc3RlZCBnw7Zyw7xudMO8c8O8bmRlIOKAnEdpcmnFnyDFn3UgYW5kYSBhw6fEsWxhbcSxeW9y4oCdIG1lc2FqxLEsIOKAnEdlw6dpxZ8gaXN0ZcSfaSBnw7ZuZGVyaWxkaS4gU29udcOnIGhlbsO8eiBkb8SfcnVsYW5txLHFnyBkZcSfaWzigJ0gbWVzYWrEsXlsYSBiaXJsaWt0ZS4gxLBraW5jaXNpIHRhbWFtbGFubWEgaWRkaWFzxLFuxLEgw7ZubGVzZSBkZSwgYXluxLEgZWtyYW5kYWtpIGlraSBkdXJ1bSB5YW4geWFuYSBnZWxpbmNlIGFubGFtIGdlcmlsaW1pIHlhcmF0xLF5b3IuCi0gQmlsaW5lbiBpxZ8gdmUgR2FyYWogZ2XDp2nFnyBla3JhbmxhcsSxbmRhIOKAnFNlw6dpbSBpc3RlxJ9p4oCdIHZlIOKAnEdlw6dpxZ8gaXN0ZcSfaeKAnSBmYXJrbMSxIHRlcmltbGVybGUga3VsbGFuxLFsxLF5b3I7IGlraSBtZXRpbiBkZSBha8SxxZ/EsW4gdGFtYW1sYW5kxLHEn8SxbsSxIHPDtnlsZW1peW9yLgotIEJhxJ9sYW0gc2F0xLFyxLFuZGFraSDigJzDlnJuZWsgbW90b3Npa2xldCDCtyBrdWxsYW7EsWPEsSBiZXlhbsSx4oCdIGdlcsOnZWsgbW90b3Npa2xldCBtb2RlbGluaSBiZWxpcmxlbWl5b3IuCgpCdSBlayByYXBvciB5YWxuxLF6IHNhxJ9sYW5hbiBla3JhbmxhcsSxbiBrdWxsYW7EsWPEsXlhIHZlcmRpxJ9pIGFubGFtxLEgZGXEn2VybGVuZGlyaXI7IGtvZHVuIG1hbnTEscSfxLFuxLEgdmV5YSDDvHJldGltIGRhdnJhbsSxxZ/EsW7EsSBrYW7EsXRsYW1hei4K</pre>
</details>

## Güncel R3 dar onarım ve 2026-10-10 yerel doğrulama

Önceki58PNG/27unique/R1ilkoku ve özgün ek rapor korunmuş tarihçedir; güncel aday değildir. Q5 açıklaması SCR010 Rehber kapsamı ve uygunluk ve SCR011 Hazırlık ekranlarını adlandırır. No-handler seçim nedeninin görünür açıklaması vardır; safeack Garaj veya desteği adlandırır, girişin durumunun değişmediğini ve geçişin henüz doğrulanmadığını söyler. Root eski10598 ve ek7410bayt raporları tam okudu; kabul oluşturmaz. Gerçek odak border2/blue ve disabled metnin gerçek4.5 kontrastı ek testle doğrulanır.20sabit soru aynen korunur.

TargetR3/R4/R5 her26PASS; fullR3 404PASS onarım öncesi tarihçedir. Oturum sona erdiğinde fullR4 +62 satırda kaldı; süreç kimliği yeniden bulunamadı, tamamlanma iddiası yok; özgün eksik log tutulur. Güncel fullR5 404PASS=378korunan+26yeni;40formatzero/analyze0. NativeR2 yalnız ara onarım çizimi; güncel ayrı nativeR3 1PASS,20durum/59PNG390×844/28unique31alias. Root güncel28orijinali gerçekten açtı; bütün59RAWbayt/SHA/dim/kaydırma ve31alias bayt eşitliğini doğruladı. R03 orijinal tasarım ile bağlam/soru/iki yol/quiethelp ve beş-sekme seçimi korunur; büyük süs hero veya nihai icon/font/token seçilmez.20×3width×3scale=180 gerçekfullscroll five-tab kabuk;52hedef/fatalhit/sonyardım/TabEnterSpace/header/disabled/liveRegion/contrast geçer. Taze geçmişsiz20ilkoku ve bütün exactSOURCEreview/aynıCI-T3/ayrıFINALreview-CI/main8 henüz gerekir; yeşil yerel koşu bağımsız kabul değildir.

Ana104DONE102kalan206; E3R1REVIEW/E5IN_PROGRESS/üretim-router-physical-device-releaseHELD. `vault/PACKS/P-E1-017.md`; `vault/EVIDENCE/E-DEV-116.md`.

Güncel modules/e01-app/internal/shell/lib/ai_entry.dart LF SHA256 fcfb9967db570d33b02c4206613ba1c6911be2c067e0f4723269e73ec07fed84.

Güncel modules/e01-app/internal/shell/test/ai_entry_test.dart LF SHA256 0ac63129fa5ee2848198db66fcda119eb7072fed87d0d45e0fe76f6d667cf659.

Güncel modules/e01-app/internal/shell/test/fixtures/ai_entry_reading_questions.json LF SHA256 3bc2abbc07a729b188c32d2c48595d66bc9d7aa4afb66df422cfa65ee1b1e01d.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\target-r3.log RAW 2410 SHA256 78870e1088695bedf938e012b1db09e011f5fd66e76ba538783452775699aadf.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\target-r4.log RAW 2410 SHA256 74149c7c559c571ce30a74472efd15d57bee46d29416b712817b539ddbff27c4.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\target-r5.log RAW 2410 SHA256 7cdb7e5b1e2bc68fc7fe62222f7e7ba41e41326aa85f59ee0093915d60fb34c9.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\full-r3.log RAW 97251 SHA256 d1409de46f64d607205e6a41fe9d6a7961b245da6d05aee16d3e71330a1723bd.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\full-r4.log RAW 15721 SHA256 cdf6ef27de15f254ad8901dff00292d80cb8b184c34e1fa455bf82ea37284bb9.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\full-r5.log RAW 93005 SHA256 6e4224183662ac9cb40e6093ab4eaa4830717cc3fd22dd309a31eff22530c748.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\analyze-r5.log RAW 385 SHA256 7b088f5767f80975f6bfd3fb4130a4c0b2dc0144cf43c196b6d9a6e39647e9ae.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\format-r5.log RAW 49 SHA256 2d030707956cf1b11cb572954db44bd0be99061b95a947c4378ad2d82fa48dc1.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\native-r2.log RAW 512 SHA256 483393c9d82d8214a6cb20d41d897b6cc000e2d3e7008ea1f95d39cb7e24b2f9.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\native-r3.log RAW 512 SHA256 93b074a4ac5e3414e6d0c7a8f2ef1d88cc73101d0ca0b16e85a055deed7d5618.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\native-r3-manifest.txt RAW 6627 SHA256 a4828870ba000ffe259530b847ea2c85424921f52a569fa8844f7c692504df11.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\graph-r1.log RAW 8246 SHA256 bfe447f7b2839a583f0647b9adf6b98488f00e4b81ce269d208eee7d7928440e.

C:\Users\Xpike\.codex\task-state\kavriva-e1017\graph-r2.log RAW 7960 SHA256 f41cf2b1d63aa67c03cdbba636b5eb1b9522461db6a57d91c0933df7f89beb31.

### Güncel bütün59 nativeR3 makbuzu

|durum|görünüm|parça|offset/end|RAWbayt|SHA256|adres|
|---|---|---|---|---|---|---|
|ready|root|0|0.0/0.0|31785|11c12b6905ff9f34f76e3f38bc42320978ed3f4a25dd5a6b3903c81551b53083|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-ready-root-0.png|
|ready|help|0|0.0/0.0|73570|2345b2fb6eaaa855e548bb4e396abecb0abda412f0d1dba7e7cedb5995b158a9|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-ready-help-0.png|
|knownTask-requested|root|0|0.0/0.0|37316|6aab585b172f6ef87fb54afa4dba2fae40ec4c78bad7f18464e203bda7379b66|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-knownTask-requested-root-0.png|
|knownTask-requested|help|0|0.0/39.0|77283|7d3268658b2a94cdc54ae0c1a63555a5c02955c636fbe5204d8401390f2d835e|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-knownTask-requested-help-0.png|
|knownTask-requested|help|1|39.0/39.0|77949|7fa314be78c904e8b3336630cae7a8139241f7dc1e565a80081e5f0bdfaa1c9b|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-knownTask-requested-help-1.png|
|symptom-requested|root|0|0.0/0.0|37316|6aab585b172f6ef87fb54afa4dba2fae40ec4c78bad7f18464e203bda7379b66|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-symptom-requested-root-0.png|
|symptom-requested|help|0|0.0/39.0|77283|7d3268658b2a94cdc54ae0c1a63555a5c02955c636fbe5204d8401390f2d835e|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-symptom-requested-help-0.png|
|symptom-requested|help|1|39.0/39.0|77949|7fa314be78c904e8b3336630cae7a8139241f7dc1e565a80081e5f0bdfaa1c9b|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-symptom-requested-help-1.png|
|garage-requested|root|0|0.0/0.0|38909|ea387f2aa634d502ac1ed448177a68905a933e517d51fb57bf840ec6158b0c18|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-garage-requested-root-0.png|
|garage-requested|help|0|0.0/39.0|78784|92f06e0af95455739d77296ddc04c9e47eb1512b55bed470f15e6bfb9c8c0810|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-garage-requested-help-0.png|
|garage-requested|help|1|39.0/39.0|79465|a0ac17c3c82bf761abb7d7b146580dc9ba28482129e451f3237a576ecf25d9bc|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-garage-requested-help-1.png|
|support-requested|root|0|0.0/0.0|59277|d3a42f4195fa49cd825c37504082cde6b5db1630e96b7d305d1d7d61de130d55|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-support-requested-root-0.png|
|support-requested|help|0|0.0/269.0|71452|751f7e9573584144ada1a34fb86d73d4ecf60e176a86d3f34f9eafcfcdbe85b6|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-support-requested-help-0.png|
|support-requested|help|1|269.0/269.0|81471|d7db1b5d4bebdc4434f19953e1f99dfc13015e6ca6ba37fd57d13ecf1b2a887a|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-support-requested-help-1.png|
|no-handler|root|0|0.0/0.0|50921|f5a8ccd8b9df51500ee56e5023cdbcd68ca954cd51769c5caf7b506d6c64f8d8|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-no-handler-root-0.png|
|no-handler|help|0|0.0/181.0|72917|6d6678f2f682036366f48148c967f878f4eb0c5e9db2bcf463f364cdea686102|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-no-handler-help-0.png|
|no-handler|help|1|181.0/181.0|81338|22d9f6f1823b33ec52595e6f15df78c257907d3cfcaa6b640b5c35dcd248808e|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-no-handler-help-1.png|
|loading|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-loading-root-0.png|
|loading|help|0|0.0/203.0|70240|70069b96afcfa3b38bb3a1aa50c3defe76d407b1edd9484d032d99237c4fb766|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-loading-help-0.png|
|loading|help|1|203.0/203.0|78470|e60c276edabcc43938f96f959caa3f3187261420326900a599c22fe9391dd308|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-loading-help-1.png|
|unknown|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-unknown-root-0.png|
|unknown|help|0|0.0/203.0|70240|70069b96afcfa3b38bb3a1aa50c3defe76d407b1edd9484d032d99237c4fb766|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-unknown-help-0.png|
|unknown|help|1|203.0/203.0|78470|e60c276edabcc43938f96f959caa3f3187261420326900a599c22fe9391dd308|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-unknown-help-1.png|
|held|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-held-root-0.png|
|held|help|0|0.0/203.0|70240|70069b96afcfa3b38bb3a1aa50c3defe76d407b1edd9484d032d99237c4fb766|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-held-help-0.png|
|held|help|1|203.0/203.0|78470|e60c276edabcc43938f96f959caa3f3187261420326900a599c22fe9391dd308|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-held-help-1.png|
|safetyHold|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-safetyHold-root-0.png|
|safetyHold|help|0|0.0/203.0|70240|70069b96afcfa3b38bb3a1aa50c3defe76d407b1edd9484d032d99237c4fb766|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-safetyHold-help-0.png|
|safetyHold|help|1|203.0/203.0|78470|e60c276edabcc43938f96f959caa3f3187261420326900a599c22fe9391dd308|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-safetyHold-help-1.png|
|failed|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-failed-root-0.png|
|failed|help|0|0.0/203.0|70240|70069b96afcfa3b38bb3a1aa50c3defe76d407b1edd9484d032d99237c4fb766|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-failed-help-0.png|
|failed|help|1|203.0/203.0|78470|e60c276edabcc43938f96f959caa3f3187261420326900a599c22fe9391dd308|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-failed-help-1.png|
|absent-context|root|0|0.0/0.0|50802|a5b789f8bb2eff8f52657a47158ef2285b905c0ee8c2e8dd49a244e623d51dfd|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-absent-context-root-0.png|
|absent-context|help|0|0.0/203.0|69653|0b3983d22d03b28e33d98e24f0bbd5718c2d2e3c1f756a0f08ec1b4843f95ee6|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-absent-context-help-0.png|
|absent-context|help|1|203.0/203.0|78470|e60c276edabcc43938f96f959caa3f3187261420326900a599c22fe9391dd308|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-absent-context-help-1.png|
|offline|root|0|0.0/0.0|51320|aca990ac7a140598295adda50ee376c08fd157c7cb10deb572d0ff6906d9c86f|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-offline-root-0.png|
|offline|help|0|0.0/203.0|70161|51d02cab5ff9cac65b093f1c9a1a0dc76a178956b7442ba86d97e6b2c375926d|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-offline-help-0.png|
|offline|help|1|203.0/203.0|78921|34dac87f2030bf384d0955331c9537893f2c49c986a1422344d922a12d8f3b64|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-offline-help-1.png|
|stale-context|root|0|0.0/0.0|50802|a5b789f8bb2eff8f52657a47158ef2285b905c0ee8c2e8dd49a244e623d51dfd|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-stale-context-root-0.png|
|stale-context|help|0|0.0/203.0|69653|0b3983d22d03b28e33d98e24f0bbd5718c2d2e3c1f756a0f08ec1b4843f95ee6|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-stale-context-help-0.png|
|stale-context|help|1|203.0/203.0|78470|e60c276edabcc43938f96f959caa3f3187261420326900a599c22fe9391dd308|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-stale-context-help-1.png|
|missing-task-route|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-missing-task-route-root-0.png|
|missing-task-route|help|0|0.0/203.0|70240|70069b96afcfa3b38bb3a1aa50c3defe76d407b1edd9484d032d99237c4fb766|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-missing-task-route-help-0.png|
|missing-task-route|help|1|203.0/203.0|78470|e60c276edabcc43938f96f959caa3f3187261420326900a599c22fe9391dd308|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-missing-task-route-help-1.png|
|unknown-symptom-route|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-unknown-symptom-route-root-0.png|
|unknown-symptom-route|help|0|0.0/203.0|70240|70069b96afcfa3b38bb3a1aa50c3defe76d407b1edd9484d032d99237c4fb766|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-unknown-symptom-route-help-0.png|
|unknown-symptom-route|help|1|203.0/203.0|78470|e60c276edabcc43938f96f959caa3f3187261420326900a599c22fe9391dd308|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-unknown-symptom-route-help-1.png|
|safety-explained|root|0|0.0/0.0|50470|15819075a01b312acb557d20a44ed8d1062b444e6840edcda1b68c93bcbf0b2f|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-safety-explained-root-0.png|
|safety-explained|help|0|0.0/203.0|69353|2cfedea03b3dc9e9ee3c487beb0eb89c10a6fb3d29852dbed9fe7a11a6e6ab45|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-safety-explained-help-0.png|
|safety-explained|help|1|203.0/203.0|77571|d7457c2f9789b9b7bd7ff2679944724649df5dfc7a6e4176f3a927ab773b2b2f|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-safety-explained-help-1.png|
|safety-unverified|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-safety-unverified-root-0.png|
|safety-unverified|help|0|0.0/203.0|70240|70069b96afcfa3b38bb3a1aa50c3defe76d407b1edd9484d032d99237c4fb766|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-safety-unverified-help-0.png|
|safety-unverified|help|1|203.0/203.0|78470|e60c276edabcc43938f96f959caa3f3187261420326900a599c22fe9391dd308|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-safety-unverified-help-1.png|
|safety-incomplete|root|0|0.0/0.0|51400|dee6f53b14994ef2e766b819cc010a74451a6188dafdcbfad5a83a94b92436e3|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-safety-incomplete-root-0.png|
|safety-incomplete|help|0|0.0/203.0|70240|70069b96afcfa3b38bb3a1aa50c3defe76d407b1edd9484d032d99237c4fb766|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-safety-incomplete-help-0.png|
|safety-incomplete|help|1|203.0/203.0|78470|e60c276edabcc43938f96f959caa3f3187261420326900a599c22fe9391dd308|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-safety-incomplete-help-1.png|
|long-context|root|0|0.0/0.0|59045|18d8c4aebf76bf06baf4e591ef12ffe63a9d9f50ed64d33453cb70043f981d11|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-long-context-root-0.png|
|long-context|help|0|0.0/193.0|80683|6dff25ddc755244fbd65decf3ff69f5763839eb8fad37f466edc45904fdcd98c|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-long-context-help-0.png|
|long-context|help|1|193.0/193.0|79256|9ecc649079baa22988128be6e17373287ace844b1aeabadbf8a3b04177f2f686|C:/Users/Xpike/.codex/task-state/kavriva-e1017/native-r3-long-context-help-1.png|
