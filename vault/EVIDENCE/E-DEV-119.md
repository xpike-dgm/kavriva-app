---
test_id: E-DEV-119
version: 1
purpose: Kaynak varsayımlarını göstermek ve bilinmeyen planlama bilgisini uydurmadan korumak
domain: cost-assumptions
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, ADR-008, ADR-014, C1.2, F1.2.2, FL1.2.2, SCR-010, BR-063, BR-064, BR-007, CON-004, R-001, R-003, R-004, R-007, R-009, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: cost-assumptions-presentation
tasks: [T-E1-019b]
tests: [modules/e01-app/internal/shell/test/cost_assumptions_test.dart, modules/e01-app/internal/shell/test/cost_split_test.dart, modules/e01-app/internal/shell/test/duration_range_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-12
depends_on: [V-E1-ASSUMPTIONS-001]
used_by: [V-E1-ASSUMPTIONS-001, P-E1-019b, T-E1-019b]
evidence: []
supersedes: []
status: RECORDED

contract_id_version: "C1.2 F1.2.2 FL1.2.2 BR063/064 v1 REVIEW validation method"
subject_file: modules/e01-app/internal/shell/lib/cost_split.dart
subject_digest: 5ec2e4e33a13c42e1cefdc969a3dd93513416f67c65c5d03caa7bef29ad995c7
result: "Yerel437 PASS; bağımsız REVIEW bekleniyor"
gate_verdict: "RECORDED yerel test; bağımsız REVIEW ve üretim HELD"
reviewer: none
timestamp: 2026-10-12
evidence_links: [vault/PROFILES/cost-assumptions-render.md, vault/PACKS/P-E1-019b.md, vault/REGISTRY/T-E1-019b.md, vault/EVIDENCE/E-DEV-119.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-118-E10-GOVERNED-PATHS-FOR-T-E1-019b.md.snapshot, vault/EVIDENCE/SNAPSHOTS/E-DEV-118-COST-SPLIT-FOR-T-E1-019b.dart.snapshot, modules/e01-app/internal/shell/lib/cost_split.dart, modules/e01-app/internal/shell/test/cost_assumptions_test.dart, modules/e01-app/internal/shell/test/fixtures/cost_assumptions_reading_questions.json]
---

# Kaynak varsayımları ve bilinmeyen bilgi — sınırlı SCR010 sunumu

Plan fa914f013fdcd032faed876689092da245989459; T-E1-019b/BR063064/C1.2/F1.2.2/FL1.2.2 REVIEW doğrulama yöntemi. T019a gerçekDONE/PR120 normalmerge BASE 3d5eff3567ac1e694d7518f509220079dc264348; fetchedmain tree=FINAL ve gerçek ana8 başarılı. Gerçek107 sınırlıDONE/99kalan/206; bu aday sayımı ilerletmez. `vault/PACKS/P-E1-019b.md`; `vault/EVIDENCE/E-DEV-119.md`.

## Kaynak ve ürün sınırı

Approved SCREEN_COVERAGE_TRACEABILITY BR063064→SCR010011. Mevcut SCR010 rehber kapsamı içindeki isteğe bağlı maliyet alanında kaynak koşulları gösterilir. D02 scope/bilgi/fit/trust ve DP01/02/06/13/14 hiyerarşisi korunur. Ayrı SCR-TBD onaysız/HELD; yeni ekran/route/tab/modal/picker/catalog/token/ikon/publicsözleşme yok. E1 sunar, E3 sağlar, E5 yetkilendirir. Üretim fiyat kaynağı veya doğrulayıcı oluşturulmaz; current/confirmed çağıran beyanıdır, üretim otoritesi değildir.

Kaynağın varsayımları bölümünün görünür uyarısı kaynakta olmayan varsayımın eklenmeyeceğini ve motosiklet/rehber/deneyim değişince eski varsayımların kullanılamayacağını söyler. Eski kaynaklı listeler aynı hedef/contextRevision/docRevision/deneyim bağlamında kalır. Kaynak eksik/onaysız/eski/yanlış, offline, scope eksik/eski/busy/error veya deneyim eksikse koşullar gizlenir. Loading/failed/held/unknown hazır bilgiye dönüşmez. Null koşullar bilinmiyor; boş liste güvence değildir. Bilinen fiyat veya süre eksik koşulu doldurmaz; bilinmeyen fiyat sıfır/bedava olmaz, bilinmeyen hariçler tüm giderlerin dahil olduğunu söylemez. Eksik deneyime seviye atanmaz. Verilmiş metin olduğu gibi korunur; kaynak kopyaları dış liste mutasyonundan etkilenmez. Kaynak adı/sürümü/belge ve fiyat/kontrol tarihleri çağıranın girdisidir; bugün damgası eklenmez.

Fixture koşulları ve tutarlar açık örnektir. Kesin fiyat/ödeme/uygunluk/hazırlık/fiziksel izin yok, okumak hesap gerektirmez. Mevcut maliyet modeli ve tüm427 test, rehber/süre/fit/kabuk/komşu ekranlar ve sabit sorular korunur; ürün kodunda yalnız görünür dar uyarı eklenir. Yeni test eski yardımcıları yeniden kullanır, eski main çağrılmaz ve testler çift sayılmaz.

## Gerçek yerel doğrulama

Koddan önce ea4ad1e5e4b261502ec38ee02172de0e7ec8cf18 tam15/sabit20/105BASELFpin sabitlendi. Target-r1 derlemeFAIL: test yardımcısında iki yanlış parametre adı; yalnız yeni test bike/id ile düzeltildi. Özgün FAIL logu korunur. Target-r2 10PASS. Full437=427korunan+10yeni PASS;45format0/analyze0. Ayrı native koşusu10test+1capture=11PASS normal437 toplamına eklenmez.20durum×320390768×scale1/2/3=180 gerçek tamkaydırma; fatalpointer/52/shell5/sonTopluluk hit. Mevcut geçerli fit için gerçek TabEnterSpace/2pxfocus/contrast>=3/text>=4.5 ve aynı hedefe iki callback doğrulandı; varsayımlar tekbaşına hazırlık açmaz.

Native 60PNG/27benzersiz/33bayteşalias;20durum390×844 tamkaydırma. RAW boyut/SHA/IHDR/offset-end/bayt eşliği doğrulandı. Root yeni doğal görseller ve geçmişsiz ilk okuma henüz kaydedilmedi. Yerel test bağımsız kabul değildir; bütünSOURCE/aynıCI-T3/FINAL6freshreviewCI/normalmerge/main8 gerekir.

## Yedi tasarım karşılaştırması ve kapanış

Tam ekran: rehber/motor/kapsam/opsiyonel süre/maliyet/fit/kabuk5; crop-only değil. Komşu: previous-default ve süre birlikte, mevcut hiyerarşi. Durum:20pozitif/partial/missing/unknown/loading/error/held/offline/stale/long/default. Duyarlı:180tamkaydırma. Erişilebilirlik: Semantics başlık, mevcut gerçek klavye/focus/kontrast/52. Kanonik: approvedD02/SCR010, mevcut20başlık16metin20pad8gap; workingDNA finaltoken değildir. Regresyon:427korunan/105BASEpin/tam15/eskiRAWv85+cost/index111 yeniden üretilebilirlik kapısı beklenir. D02 orijinal RAW941×1672 SHAde9487dbcd342f9c29dfb890560ada92efa6a178193cbc8daf26531552836f2c; yeni alanla gerçek görsel karşılaştırma henüz gerekir.

V-E10-CLOSE001 templates/CLOSURE_MATRIX_TEMPLATE.md10katman: bu görev kabulü feature/flow/designfinal/production/release kabulü değildir. E3R1 REVIEW/E5IN_PROGRESS/PR47/57/59/RET97/üretimkimlik/fiyatfeed/router/physical/human/device/OSassistive/finaltokens/release HELD. Ayrı genel devir template eksikse MISSING. Ortak körnokta: bilinen fiyatın bilinmeyen koşulu doldurduğu sanılması veya eski koşulların yeni hedefe taşınması; bağımsız inceleme bunu denetler. `vault/PACKS/P-E1-019b.md`; `vault/EVIDENCE/E-DEV-119.md`.

## RAW makbuzlar

vault/EVIDENCE/SNAPSHOTS/E-DEV-118-E10-GOVERNED-PATHS-FOR-T-E1-019b.md.snapshot RAW SHA256 31b40e4302dc60bb007aab9c1aea4f2a634a09fed4add5beb2f6b412c07d1044.

vault/EVIDENCE/SNAPSHOTS/E-DEV-118-COST-SPLIT-FOR-T-E1-019b.dart.snapshot RAW SHA256 503889de30e99f9e33e572140019d27239686b50294cc003fa617d4a5fde287c.

modules/e01-app/internal/shell/lib/cost_split.dart LF SHA256 5ec2e4e33a13c42e1cefdc969a3dd93513416f67c65c5d03caa7bef29ad995c7.

modules/e01-app/internal/shell/test/cost_assumptions_test.dart LF SHA256 4be938048b7fed9cab67b19122c534e0b8cab08182fc1ebc6bd15eb0f8055046.

modules/e01-app/internal/shell/test/fixtures/cost_assumptions_reading_questions.json LF SHA256 ddac6c0e488433e2ef27626c5b2d1bdae16378abad70e97e26d09a5d059f2335.

C:\Users\Xpike\.codex\task-state\kavriva-e1019b\target-r1.log RAW 3916 SHA256 763b1e247c92f6fff116645fff38d38425bfd10aaf91c39ce5c25959ea3a0269.

C:\Users\Xpike\.codex\task-state\kavriva-e1019b\target-r2.log RAW 1433 SHA256 1370f7cd0baef5e49268664d5d2813315749ceb396eb8a523cf3c670d42cfb7f.

C:\Users\Xpike\.codex\task-state\kavriva-e1019b\full-r1.log RAW 104110 SHA256 e14ebde36b3b38b022634d73ae3693cf2729d725e34496a5888cfe6b9f943252.

C:\Users\Xpike\.codex\task-state\kavriva-e1019b\format-r1.log RAW 49 SHA256 1f9739278f8b5accdbee163c007204152ec417b42c566a6c90f4f0bbe523dd42.

C:\Users\Xpike\.codex\task-state\kavriva-e1019b\analyze-r1.log RAW 385 SHA256 df46c757b74d1215683db49f503cd6c41aac0a8b15f7fcec442b8ea0b0a2c27f.

C:\Users\Xpike\.codex\task-state\kavriva-e1019b\native-r1.log RAW 1499 SHA256 b6541375657d5fc093e9ff2f12fc5550bb5e0bf4359cf77e6c7c029699de1589.

C:\Users\Xpike\.codex\task-state\kavriva-e1019b\native-r1-manifest.txt RAW 6125 SHA256 15481f4190326f0ddcaf38a8a5af218d783cacd25bbe3aa367679d9a4e6dbc4b.

|durum|parça|offset/end|bayt|SHA256|RAWdosya|
|---|---|---|---|---|---|
|ready|0|0.0/973.0|77388|c0361f15cb4c3eb727ae2946450d33087788c3d78223fa05084272e08f318701|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-ready-0.png|
|ready|1|600.0/973.0|79940|e08d3779a1dbb39f41293093520a22ae1f72eaa157b2c069e40d2726cf180cf2|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-ready-1.png|
|ready|2|973.0/973.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-ready-2.png|
|missing-assumptions|0|0.0/897.0|77388|c0361f15cb4c3eb727ae2946450d33087788c3d78223fa05084272e08f318701|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-missing-assumptions-0.png|
|missing-assumptions|1|600.0/897.0|75467|6cc1256de95f287955b010709991667d7b82f82180cdb7f5b9d6ab3eb4d8879e|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-missing-assumptions-1.png|
|missing-assumptions|2|897.0/897.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-missing-assumptions-2.png|
|empty-assumptions|0|0.0/897.0|77388|c0361f15cb4c3eb727ae2946450d33087788c3d78223fa05084272e08f318701|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-empty-assumptions-0.png|
|empty-assumptions|1|600.0/897.0|76613|e723677c6cc883847c2f4e34c7ac735e75a672bbd8d2dd91dc7af64692707c12|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-empty-assumptions-1.png|
|empty-assumptions|2|897.0/897.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-empty-assumptions-2.png|
|unknown|0|0.0/973.0|78096|0fac41cc3b85b5f8b65011676f1b055a714c13823b43e7caffb46e168a7bb726|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-unknown-0.png|
|unknown|1|600.0/973.0|81633|99b0e69b8ff3b64d8b76a799e20c75b86e4c44ae8471128c57756b100638f447|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-unknown-1.png|
|unknown|2|973.0/973.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-unknown-2.png|
|loading|0|0.0/973.0|78342|3e2096cd4bb6c2f6905f2e6445fc615a586c8f83bdc13e93a1d55c2318f02336|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-loading-0.png|
|loading|1|600.0/973.0|81633|99b0e69b8ff3b64d8b76a799e20c75b86e4c44ae8471128c57756b100638f447|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-loading-1.png|
|loading|2|973.0/973.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-loading-2.png|
|failed|0|0.0/973.0|79537|39abaf54d2a61707b9e4bdcac1705341297be0c19c4395773f47d8851717099f|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-failed-0.png|
|failed|1|600.0/973.0|81633|99b0e69b8ff3b64d8b76a799e20c75b86e4c44ae8471128c57756b100638f447|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-failed-1.png|
|failed|2|973.0/973.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-failed-2.png|
|held|0|0.0/973.0|79865|7e72d6302f94ce34c6c18ed1928322ed524aacccee91f1ad2c69029e46292c43|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-held-0.png|
|held|1|600.0/973.0|81633|99b0e69b8ff3b64d8b76a799e20c75b86e4c44ae8471128c57756b100638f447|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-held-1.png|
|held|2|973.0/973.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-held-2.png|
|missing-source|0|0.0/870.0|79597|5005b9db85541ab921dfd2da9b5dbb8cae9e05e30494387099ce3df453d45808|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-missing-source-0.png|
|missing-source|1|600.0/870.0|75962|d7e7a71c0d516717fc6ca2d51b00de73194eca81436aefd39be8e436edbdb98d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-missing-source-1.png|
|missing-source|2|870.0/870.0|65855|a5e3ab899d2902d4510551f31bf31d5418ed161651bef56697379e5ae846e42d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-missing-source-2.png|
|missing-experience|0|0.0/851.0|79653|0a9c7f2f236bd86eaa2223e75b48bc977fb21d80e61e030b76687a5ea1e9ab89|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-missing-experience-0.png|
|missing-experience|1|600.0/851.0|75311|8866e9ff13c8a3eb5b0b01476b7ea6d44675af53e2453fea9e231bd807033577|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-missing-experience-1.png|
|missing-experience|2|851.0/851.0|65855|a5e3ab899d2902d4510551f31bf31d5418ed161651bef56697379e5ae846e42d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-missing-experience-2.png|
|offline|0|0.0/897.0|79597|5005b9db85541ab921dfd2da9b5dbb8cae9e05e30494387099ce3df453d45808|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-offline-0.png|
|offline|1|600.0/897.0|76467|c21e1a2b8b5dc36aa7de1a2b18d185659574dfdc6ceb5f972715f9626f168814|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-offline-1.png|
|offline|2|897.0/897.0|65724|71bbb1a6f98204bea5c651c87f829593869d9b0d4b99a5f73b2ae6b7a10f9b47|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-offline-2.png|
|wrong-motorcycle|0|0.0/870.0|79597|5005b9db85541ab921dfd2da9b5dbb8cae9e05e30494387099ce3df453d45808|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-wrong-motorcycle-0.png|
|wrong-motorcycle|1|600.0/870.0|75962|d7e7a71c0d516717fc6ca2d51b00de73194eca81436aefd39be8e436edbdb98d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-wrong-motorcycle-1.png|
|wrong-motorcycle|2|870.0/870.0|65855|a5e3ab899d2902d4510551f31bf31d5418ed161651bef56697379e5ae846e42d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-wrong-motorcycle-2.png|
|new-document|0|0.0/870.0|79597|5005b9db85541ab921dfd2da9b5dbb8cae9e05e30494387099ce3df453d45808|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-new-document-0.png|
|new-document|1|600.0/870.0|75962|d7e7a71c0d516717fc6ca2d51b00de73194eca81436aefd39be8e436edbdb98d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-new-document-1.png|
|new-document|2|870.0/870.0|65855|a5e3ab899d2902d4510551f31bf31d5418ed161651bef56697379e5ae846e42d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-new-document-2.png|
|new-experience|0|0.0/870.0|79597|5005b9db85541ab921dfd2da9b5dbb8cae9e05e30494387099ce3df453d45808|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-new-experience-0.png|
|new-experience|1|600.0/870.0|75962|d7e7a71c0d516717fc6ca2d51b00de73194eca81436aefd39be8e436edbdb98d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-new-experience-1.png|
|new-experience|2|870.0/870.0|65855|a5e3ab899d2902d4510551f31bf31d5418ed161651bef56697379e5ae846e42d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-new-experience-2.png|
|stale|0|0.0/870.0|79597|5005b9db85541ab921dfd2da9b5dbb8cae9e05e30494387099ce3df453d45808|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-stale-0.png|
|stale|1|600.0/870.0|75962|d7e7a71c0d516717fc6ca2d51b00de73194eca81436aefd39be8e436edbdb98d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-stale-1.png|
|stale|2|870.0/870.0|65855|a5e3ab899d2902d4510551f31bf31d5418ed161651bef56697379e5ae846e42d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-stale-2.png|
|unconfirmed|0|0.0/870.0|79597|5005b9db85541ab921dfd2da9b5dbb8cae9e05e30494387099ce3df453d45808|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-unconfirmed-0.png|
|unconfirmed|1|600.0/870.0|75962|d7e7a71c0d516717fc6ca2d51b00de73194eca81436aefd39be8e436edbdb98d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-unconfirmed-1.png|
|unconfirmed|2|870.0/870.0|65855|a5e3ab899d2902d4510551f31bf31d5418ed161651bef56697379e5ae846e42d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-unconfirmed-2.png|
|stale-scope|0|0.0/916.0|79746|dda4deba7d6f73a07b5d6825654c835919b1d88d04c8239ad0ec10b8ee11ad5f|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-stale-scope-0.png|
|stale-scope|1|600.0/916.0|76825|1fbb2eb04c5b45a4e268a793d837e7242c78a38a08b5a3f12c4d97e0b5e41489|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-stale-scope-1.png|
|stale-scope|2|916.0/916.0|65855|a5e3ab899d2902d4510551f31bf31d5418ed161651bef56697379e5ae846e42d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-stale-scope-2.png|
|missing-scope|0|0.0/798.0|83245|e23edd48f5175610efde19d7bf9a6fc957f6991683ac251f3f45f1bbe42da118|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-missing-scope-0.png|
|missing-scope|1|600.0/798.0|73469|95ac586ea56976db9b04b3a04959d034ee94c903f689c0ddfea87952c89e231e|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-missing-scope-1.png|
|missing-scope|2|798.0/798.0|65855|a5e3ab899d2902d4510551f31bf31d5418ed161651bef56697379e5ae846e42d|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-missing-scope-2.png|
|long-context|0|0.0/1087.0|77388|c0361f15cb4c3eb727ae2946450d33087788c3d78223fa05084272e08f318701|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-long-context-0.png|
|long-context|1|600.0/1087.0|80655|e02433a6d036263cc1c34d9e8a44d9af7825cc673ebb024679113c28477e9ff8|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-long-context-1.png|
|long-context|2|1087.0/1087.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-long-context-2.png|
|with-duration|0|0.0/1311.0|78175|500878d7b324d7c31965e31436f273e498a2db96269bc4ea9014525c23b51657|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-with-duration-0.png|
|with-duration|1|600.0/1311.0|81647|590ae3a051399dad569b661a8830952408e4e75a5fc0649b4d7e6095a6144014|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-with-duration-1.png|
|with-duration|2|1200.0/1311.0|70178|6d1efb3d2942d6f03e882e6c812b01d4d89e5fbb98951084de6052e9dec5364e|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-with-duration-2.png|
|with-duration|3|1311.0/1311.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-with-duration-3.png|
|previous-default|0|0.0/491.0|75610|600396a4bf0489695b54637d1c5354da127215029d5c0a0af9bb16e77aa78cf5|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-previous-default-0.png|
|previous-default|1|491.0/491.0|67531|c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c|C:/Users/Xpike/.codex/task-state/kavriva-e1019b/native-r1-previous-default-1.png|

## Root gerçek görsel okuması

Root27benzersiz doğalPNG ve approvedD02 gerçekten açtı;60RAW/33bayteşalias,20durum tamkaydırma; metinler ve kabuk5 okunur. Kaydırma sırasında kenarda kısmen görünen satırlar komşu parçada tam okunur; kalıcı taşma gözlenmedi. D02 bilgi/uygunluk/güven ayrımı korunur; finaltokens/cihaz/üretim kabulü yok. İlk geçmişsiz okuma bekleniyor. İlk format komutu yanlış executable adresi nedeniyle çalışmadı; doğru cache/dart-sdk/bin/dart.exe ile gerçek45format0 ayrıca doğrulandı; full437/analyze0/native11 sonuçları değişmez.
