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

## Bağımsız geçmişsiz ilk ekran okuması — SOURCE adayı

Geçmişsiz /root/e1019b_blind_r1, istenen gpt-6-luna/max, yalnız sabit20soru ve60PNG/20durum ham makbuzu. Kod/plan/pack/cevap anahtarı verilmedi. Özgün rapor Root tarafından tümüyle okundu;20anlam için sınırlıPASS; gerçek insan/cihaz/üretim kabulü değildir. Kod 0cd4846ac433c5ee992f8a52c9c0881865477314; RAW9512bayt/SHA256 1c5051a9155b26ab4e50feff12ad1bd31bc5953be363667f59718e7addf3a3e3. Root27özgün+D02 gerçekten açtı;33bayteşalias yeni görsel sayılmaz. Yerel437/45format0/analyze0/42graphworst0/180duyarlı/native11; tam15/105BASEpin/sabit20/iki eskiRAWsnapshot/index111 korunur. Bütün SOURCE incelemesi ve aynıCI-T3/FINAL6freshreviewCI/normalmerge-main8 gerekir. Gerçek107/99/206 değişmedi. Üretim ve ayrıSCR-TBD HELD. `vault/PACKS/P-E1-019b.md`; `vault/EVIDENCE/E-DEV-119.md`.

### Özgün bağımsız ilk ekran okuması

<pre># İlk ekran okuması — R1

## Kapsam ve ekran incelemesi

Sabit 20 soru ve doğal PNG ekranları kullanıldı. 27/27 benzersiz PNG view_image ile özgün boyutunda açıldı. Hiçbir kod, paket, kanıt dosyası, plan veya başka rapor okunmadı.

Hedef: Shell 5; alt çubukta Garaj, Bakım, AI Usta, Geçmiş ve Topluluk görünüyor; AI Usta seçili. PNG ölçüleri 390×844. Metinler özgün görüntüde okunaklı ve 20 soruyu cevaplamaya yeterli. Dikey kaydırma ekranlarında üst veya alt kenarda devam eden satırlar doğal viewport kesilmesi; devamı sonraki offset görüntüsünde görünüyor. Son offset görüntüleri kaydırma sonuna ulaşıyor. Kalıcı metin taşması ya da alt çubuğun içerik üstüne binmesi görülmedi.

## 60 RAW dosya ve hash denetimi

Proof kaydındaki 60 PNG yolu için dosya varlığı, RAW bayt sayısı, SHA-256 ve 390×844 IHDR ölçüsü karşılaştırıldı: 60/60 eşleşti. 27 benzersiz içerik, 33 alias var. Her aynı SHA grubunun üyeleri bayt bayt karşılaştırıldı; 33 aliasın tamamı grup örneğiyle eşit. Aşağıda her hash grubu, bayt sayısı ve o içeriğe sahip bütün PNG adları listelenmiştir.
RAW 79653 bayt | SHA-256 0a9c7f2f236bd86eaa2223e75b48bc977fb21d80e61e030b76687a5ea1e9ab89 | 1 dosya: native-r1-missing-experience-0.png
RAW 78096 bayt | SHA-256 0fac41cc3b85b5f8b65011676f1b055a714c13823b43e7caffb46e168a7bb726 | 1 dosya: native-r1-unknown-0.png
RAW 76825 bayt | SHA-256 1fbb2eb04c5b45a4e268a793d837e7242c78a38a08b5a3f12c4d97e0b5e41489 | 1 dosya: native-r1-stale-scope-1.png
RAW 79537 bayt | SHA-256 39abaf54d2a61707b9e4bdcac1705341297be0c19c4395773f47d8851717099f | 1 dosya: native-r1-failed-0.png
RAW 78342 bayt | SHA-256 3e2096cd4bb6c2f6905f2e6445fc615a586c8f83bdc13e93a1d55c2318f02336 | 1 dosya: native-r1-loading-0.png
RAW 79597 bayt | SHA-256 5005b9db85541ab921dfd2da9b5dbb8cae9e05e30494387099ce3df453d45808 | 7 dosya: native-r1-missing-source-0.png, native-r1-offline-0.png, native-r1-wrong-motorcycle-0.png, native-r1-new-document-0.png, native-r1-new-experience-0.png, native-r1-stale-0.png, native-r1-unconfirmed-0.png
RAW 78175 bayt | SHA-256 500878d7b324d7c31965e31436f273e498a2db96269bc4ea9014525c23b51657 | 1 dosya: native-r1-with-duration-0.png
RAW 66443 bayt | SHA-256 5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0 | 9 dosya: native-r1-ready-2.png, native-r1-missing-assumptions-2.png, native-r1-empty-assumptions-2.png, native-r1-unknown-2.png, native-r1-loading-2.png, native-r1-failed-2.png, native-r1-held-2.png, native-r1-long-context-2.png, native-r1-with-duration-3.png
RAW 81647 bayt | SHA-256 590ae3a051399dad569b661a8830952408e4e75a5fc0649b4d7e6095a6144014 | 1 dosya: native-r1-with-duration-1.png
RAW 75610 bayt | SHA-256 600396a4bf0489695b54637d1c5354da127215029d5c0a0af9bb16e77aa78cf5 | 1 dosya: native-r1-previous-default-0.png
RAW 75467 bayt | SHA-256 6cc1256de95f287955b010709991667d7b82f82180cdb7f5b9d6ab3eb4d8879e | 1 dosya: native-r1-missing-assumptions-1.png
RAW 70178 bayt | SHA-256 6d1efb3d2942d6f03e882e6c812b01d4d89e5fbb98951084de6052e9dec5364e | 1 dosya: native-r1-with-duration-2.png
RAW 65724 bayt | SHA-256 71bbb1a6f98204bea5c651c87f829593869d9b0d4b99a5f73b2ae6b7a10f9b47 | 1 dosya: native-r1-offline-2.png
RAW 79865 bayt | SHA-256 7e72d6302f94ce34c6c18ed1928322ed524aacccee91f1ad2c69029e46292c43 | 1 dosya: native-r1-held-0.png
RAW 75311 bayt | SHA-256 8866e9ff13c8a3eb5b0b01476b7ea6d44675af53e2453fea9e231bd807033577 | 1 dosya: native-r1-missing-experience-1.png
RAW 73469 bayt | SHA-256 95ac586ea56976db9b04b3a04959d034ee94c903f689c0ddfea87952c89e231e | 1 dosya: native-r1-missing-scope-1.png
RAW 81633 bayt | SHA-256 99b0e69b8ff3b64d8b76a799e20c75b86e4c44ae8471128c57756b100638f447 | 4 dosya: native-r1-unknown-1.png, native-r1-loading-1.png, native-r1-failed-1.png, native-r1-held-1.png
RAW 65855 bayt | SHA-256 a5e3ab899d2902d4510551f31bf31d5418ed161651bef56697379e5ae846e42d | 9 dosya: native-r1-missing-source-2.png, native-r1-missing-experience-2.png, native-r1-wrong-motorcycle-2.png, native-r1-new-document-2.png, native-r1-new-experience-2.png, native-r1-stale-2.png, native-r1-unconfirmed-2.png, native-r1-stale-scope-2.png, native-r1-missing-scope-2.png
RAW 77388 bayt | SHA-256 c0361f15cb4c3eb727ae2946450d33087788c3d78223fa05084272e08f318701 | 4 dosya: native-r1-ready-0.png, native-r1-missing-assumptions-0.png, native-r1-empty-assumptions-0.png, native-r1-long-context-0.png
RAW 76467 bayt | SHA-256 c21e1a2b8b5dc36aa7de1a2b18d185659574dfdc6ceb5f972715f9626f168814 | 1 dosya: native-r1-offline-1.png
RAW 67531 bayt | SHA-256 c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c | 1 dosya: native-r1-previous-default-1.png
RAW 75962 bayt | SHA-256 d7e7a71c0d516717fc6ca2d51b00de73194eca81436aefd39be8e436edbdb98d | 6 dosya: native-r1-missing-source-1.png, native-r1-wrong-motorcycle-1.png, native-r1-new-document-1.png, native-r1-new-experience-1.png, native-r1-stale-1.png, native-r1-unconfirmed-1.png
RAW 79746 bayt | SHA-256 dda4deba7d6f73a07b5d6825654c835919b1d88d04c8239ad0ec10b8ee11ad5f | 1 dosya: native-r1-stale-scope-0.png
RAW 80655 bayt | SHA-256 e02433a6d036263cc1c34d9e8a44d9af7825cc673ebb024679113c28477e9ff8 | 1 dosya: native-r1-long-context-1.png
RAW 79940 bayt | SHA-256 e08d3779a1dbb39f41293093520a22ae1f72eaa157b2c069e40d2726cf180cf2 | 1 dosya: native-r1-ready-1.png
RAW 83245 bayt | SHA-256 e23edd48f5175610efde19d7bf9a6fc957f6991683ac251f3f45f1bbe42da118 | 1 dosya: native-r1-missing-scope-0.png
RAW 76613 bayt | SHA-256 e723677c6cc883847c2f4e34c7ac735e75a672bbd8d2dd91dc7af64692707c12 | 1 dosya: native-r1-empty-assumptions-1.png

## 20 durumun kaydırma kapsamı

empty-assumptions: offset 0, 600, 897; son offset/end 897/897
failed: offset 0, 600, 973; son offset/end 973/973
held: offset 0, 600, 973; son offset/end 973/973
loading: offset 0, 600, 973; son offset/end 973/973
long-context: offset 0, 600, 1087; son offset/end 1087/1087
missing-assumptions: offset 0, 600, 897; son offset/end 897/897
missing-experience: offset 0, 600, 851; son offset/end 851/851
missing-scope: offset 0, 600, 798; son offset/end 798/798
missing-source: offset 0, 600, 870; son offset/end 870/870
new-document: offset 0, 600, 870; son offset/end 870/870
new-experience: offset 0, 600, 870; son offset/end 870/870
offline: offset 0, 600, 897; son offset/end 897/897
previous-default: offset 0, 491; son offset/end 491/491
ready: offset 0, 600, 973; son offset/end 973/973
stale: offset 0, 600, 870; son offset/end 870/870
stale-scope: offset 0, 600, 916; son offset/end 916/916
unconfirmed: offset 0, 600, 870; son offset/end 870/870
unknown: offset 0, 600, 973; son offset/end 973/973
with-duration: offset 0, 600, 1200, 1311; son offset/end 1311/1311
wrong-motorcycle: offset 0, 600, 870; son offset/end 870/870

## Sabit sorular: ilk okumada yanıt

1. **Açık** — Varsayım, kaynağın hangi motosiklet, rehber revizyonu ve deneyim için geçerli olduğu; yalnız belirtilen parçayı kapsaması; aletin elde olması ve işçiliğin kaynak kapsamında bulunması gibi koşulları anlatıyor.
2. **Açık** — Hayır. “Kaynakta olmayan bir varsayım eklenmez.”
3. **Açık** — Tahmini maliyet içindeki “Kaynağın varsayımları” bölümünde.
4. **Açık** — “Varsayımlar bilinmiyor; kaynakta bu bilgi yok veya henüz kullanılamıyor.”
5. **Açık** — Hayır. Ekran, kaynağın varsayım belirtmemesinin koşulların değişmeyeceği garantisi olmadığını söylüyor.
6. **Açık** — Hayır. Eksik varsayım bilinmiyor ve kaynakta olmayan varsayım eklenmiyor.
7. **Açık** — Hayır. Tutar “Bilinmiyor; kaynak tutarı yok veya henüz kullanılamıyor” diye gösteriliyor; ekranda kaynak dışı hesaplanmış bir fiyat sunulmuyor.
8. **Açık** — Hayır. Motosiklet veya rehber değişince eski kaynağın varsayımları kullanılmamalı.
9. **Açık** — Hayır. Deneyim bilgisi değişince de eski varsayımlar kullanılmamalı.
10. **Açık** — Hayır. “Deneyim bilgisi yok; sana bir seviye atanmadı.”
11. **Açık** — Hayır. “Çevrimdışısın. Eski fiyat güncel tahmin sayılmaz.”
12. **Açık** — Hayır. Yüklemede hazır tahmin olmadığı, hatada maliyetin bilinmediği ve güncel kaynağın yeniden kontrol edilmesi gerektiği yazıyor.
13. **Açık** — Hayır. Doğrulanmamış durumda maliyet bilinmiyor; doğrulanmış güncel kaynak gerekli ve motosiklete özel uygulama kapalı.
14. **Açık** — Tahmini maliyet bölümünde: fiyat tarihi 01.10.2026; kaynak “Örnek maliyet kaynağı”; sürüm “örnek-r1”; kontrol tarihi 10.10.2026.
15. **Açık** — Hayır. Örnek gösterimin gerçek motosiklet için doğrulanmış fiyat olmadığı açıkça yazıyor.
16. **Açık** — Hayır. “Bilinmeyen tutar sıfır veya bedava sayılmaz.”
17. **Açık** — Hayır. Hazır örnekte servis ulaşımı ve beklenmeyen ek parça dahil değil; bilinmeyen durumda tüm giderlerin dahil olduğu varsayılmaması söyleniyor.
18. **Açık** — Hayır. Bilgi planlama içindir; ödeme veya bakım izni değildir. Motosiklete uygunluk ayrımı da yeterli değil.
19. **Açık** — Hayır, ödeme veya bakım adımı başlatmıyor. Okumak için hesap gerekmiyor.
20. **Açık** — Alt çubuk: Garaj, Bakım, AI Usta, Geçmiş, Topluluk. Ayrı “Varsayımlar” sekmesi yok; varsayımlar maliyet bölümünde.

## Hüküm

**20/20 PASS.** Her yanıt ekran metninden açıkça kurulabiliyor; belirsiz yanıt veya taze okumaya gidecek madde yok.</pre>

RAWBase64: IyDEsGxrIGVrcmFuIG9rdW1hc8SxIOKAlCBSMQoKIyMgS2Fwc2FtIHZlIGVrcmFuIGluY2VsZW1lc2kKClNhYml0IDIwIHNvcnUgdmUgZG/En2FsIFBORyBla3JhbmxhcsSxIGt1bGxhbsSxbGTEsS4gMjcvMjcgYmVuemVyc2l6IFBORyB2aWV3X2ltYWdlIGlsZSDDtnpnw7xuIGJveXV0dW5kYSBhw6fEsWxkxLEuIEhpw6diaXIga29kLCBwYWtldCwga2FuxLF0IGRvc3lhc8SxLCBwbGFuIHZleWEgYmHFn2thIHJhcG9yIG9rdW5tYWTEsS4KCkhlZGVmOiBTaGVsbCA1OyBhbHQgw6d1YnVrdGEgR2FyYWosIEJha8SxbSwgQUkgVXN0YSwgR2XDp21pxZ8gdmUgVG9wbHVsdWsgZ8O2csO8bsO8eW9yOyBBSSBVc3RhIHNlw6dpbGkuIFBORyDDtmzDp8O8bGVyaSAzOTDDlzg0NC4gTWV0aW5sZXIgw7Z6Z8O8biBnw7Zyw7xudMO8ZGUgb2t1bmFrbMSxIHZlIDIwIHNvcnV5dSBjZXZhcGxhbWF5YSB5ZXRlcmxpLiBEaWtleSBrYXlkxLFybWEgZWtyYW5sYXLEsW5kYSDDvHN0IHZleWEgYWx0IGtlbmFyZGEgZGV2YW0gZWRlbiBzYXTEsXJsYXIgZG/En2FsIHZpZXdwb3J0IGtlc2lsbWVzaTsgZGV2YW3EsSBzb25yYWtpIG9mZnNldCBnw7Zyw7xudMO8c8O8bmRlIGfDtnLDvG7DvHlvci4gU29uIG9mZnNldCBnw7Zyw7xudMO8bGVyaSBrYXlkxLFybWEgc29udW5hIHVsYcWfxLF5b3IuIEthbMSxY8SxIG1ldGluIHRhxZ9tYXPEsSB5YSBkYSBhbHQgw6d1YnXEn3VuIGnDp2VyaWsgw7xzdMO8bmUgYmlubWVzaSBnw7Zyw7xsbWVkaS4KCiMjIDYwIFJBVyBkb3N5YSB2ZSBoYXNoIGRlbmV0aW1pCgpQcm9vZiBrYXlkxLFuZGFraSA2MCBQTkcgeW9sdSBpw6dpbiBkb3N5YSB2YXJsxLHEn8SxLCBSQVcgYmF5dCBzYXnEsXPEsSwgU0hBLTI1NiB2ZSAzOTDDlzg0NCBJSERSIMO2bMOnw7xzw7wga2FyxZ/EsWxhxZ90xLFyxLFsZMSxOiA2MC82MCBlxZ9sZcWfdGkuIDI3IGJlbnplcnNpeiBpw6dlcmlrLCAzMyBhbGlhcyB2YXIuIEhlciBheW7EsSBTSEEgZ3J1YnVudW4gw7x5ZWxlcmkgYmF5dCBiYXl0IGthcsWfxLFsYcWfdMSxcsSxbGTEsTsgMzMgYWxpYXPEsW4gdGFtYW3EsSBncnVwIMO2cm5lxJ9peWxlIGXFn2l0LiBBxZ9hxJ/EsWRhIGhlciBoYXNoIGdydWJ1LCBiYXl0IHNhecSxc8SxIHZlIG8gacOnZXJpxJ9lIHNhaGlwIGLDvHTDvG4gUE5HIGFkbGFyxLEgbGlzdGVsZW5tacWfdGlyLgpSQVcgNzk2NTMgYmF5dCB8IFNIQS0yNTYgMGE5YzdmMmYyMzZiZDg2ZWFhMjIyM2U3NWI0OGJjOTc3ZmIyMWQ4MGU2MWUwMzBiNzY2ODdhNWVhMWU5YWI4OSB8IDEgZG9zeWE6IG5hdGl2ZS1yMS1taXNzaW5nLWV4cGVyaWVuY2UtMC5wbmcKUkFXIDc4MDk2IGJheXQgfCBTSEEtMjU2IDBmYWM0MWNjM2I4NWI1ZjhiNjUwMTE2NzZmMWIwNTVhNzE0YzEzODIzYjQzZTdjYWZmYjQ2ZTE2OGE3YmI3MjYgfCAxIGRvc3lhOiBuYXRpdmUtcjEtdW5rbm93bi0wLnBuZwpSQVcgNzY4MjUgYmF5dCB8IFNIQS0yNTYgMWZiYjJlYjA0YzViNDVhNGUyNjhhNzkzZDgzN2U3MjQyYzc4YTM4YTA4YjVhM2YxMmM0ZDk3ZTBiNWU0MTQ4OSB8IDEgZG9zeWE6IG5hdGl2ZS1yMS1zdGFsZS1zY29wZS0xLnBuZwpSQVcgNzk1MzcgYmF5dCB8IFNIQS0yNTYgMzlhYmFmNTRkMmE2MTcwN2I5ZTRiZGNhYzE3MDUzNDEyOTdiZTBjMTljNDM5NTc3M2Y0N2Q4ODUxNzE3MDk5ZiB8IDEgZG9zeWE6IG5hdGl2ZS1yMS1mYWlsZWQtMC5wbmcKUkFXIDc4MzQyIGJheXQgfCBTSEEtMjU2IDNlMjA5NmNkNGJiNmMyZjY5MDVmMmU2NDQ1ZmM2MTVhNTg2YzhmODNiZGMxM2U5M2ExZDU1YzIzMThmMDIzMzYgfCAxIGRvc3lhOiBuYXRpdmUtcjEtbG9hZGluZy0wLnBuZwpSQVcgNzk1OTcgYmF5dCB8IFNIQS0yNTYgNTAwNWI5ZGI4NTU0MWFiOTIxZGZkMmRhOWI1ZGJiOGNhZTllMDVlMzA0OTQzODcwOTljZTNkZjQ1M2Q0NTgwOCB8IDcgZG9zeWE6IG5hdGl2ZS1yMS1taXNzaW5nLXNvdXJjZS0wLnBuZywgbmF0aXZlLXIxLW9mZmxpbmUtMC5wbmcsIG5hdGl2ZS1yMS13cm9uZy1tb3RvcmN5Y2xlLTAucG5nLCBuYXRpdmUtcjEtbmV3LWRvY3VtZW50LTAucG5nLCBuYXRpdmUtcjEtbmV3LWV4cGVyaWVuY2UtMC5wbmcsIG5hdGl2ZS1yMS1zdGFsZS0wLnBuZywgbmF0aXZlLXIxLXVuY29uZmlybWVkLTAucG5nClJBVyA3ODE3NSBiYXl0IHwgU0hBLTI1NiA1MDA4NzhkN2IzMjRkN2MzMTk2NWUzMTQzNmYyNzNlNDk4YTJkYjk2MjY5YmM0ZWE5MDE0NTI1YzIzYjUxNjU3IHwgMSBkb3N5YTogbmF0aXZlLXIxLXdpdGgtZHVyYXRpb24tMC5wbmcKUkFXIDY2NDQzIGJheXQgfCBTSEEtMjU2IDUxMzI3MzRjNjNjNWFmZmZmY2Y2ZTM1MDE1MmQxZjRhNDllM2NmNzdmN2Y3Nzc0MjQzOThlZDViOWM3ZDUyZDAgfCA5IGRvc3lhOiBuYXRpdmUtcjEtcmVhZHktMi5wbmcsIG5hdGl2ZS1yMS1taXNzaW5nLWFzc3VtcHRpb25zLTIucG5nLCBuYXRpdmUtcjEtZW1wdHktYXNzdW1wdGlvbnMtMi5wbmcsIG5hdGl2ZS1yMS11bmtub3duLTIucG5nLCBuYXRpdmUtcjEtbG9hZGluZy0yLnBuZywgbmF0aXZlLXIxLWZhaWxlZC0yLnBuZywgbmF0aXZlLXIxLWhlbGQtMi5wbmcsIG5hdGl2ZS1yMS1sb25nLWNvbnRleHQtMi5wbmcsIG5hdGl2ZS1yMS13aXRoLWR1cmF0aW9uLTMucG5nClJBVyA4MTY0NyBiYXl0IHwgU0hBLTI1NiA1OTBhZTNhMDUxMzk5ZGFkNTY5YjY2MWE4ODMwOTUyNDA4ZTRlNzVhNWZjMDY0OWI0ZDdlNjA5NWE2MTQ0MDE0IHwgMSBkb3N5YTogbmF0aXZlLXIxLXdpdGgtZHVyYXRpb24tMS5wbmcKUkFXIDc1NjEwIGJheXQgfCBTSEEtMjU2IDYwMDM5NmE0YmYwNDg5Njk1YjU0NjM3ZDFjNTM1NGRhMTI3MjE1MDI5ZDVjMGEwYWY5YmIxNmU3N2FhNzhjZjUgfCAxIGRvc3lhOiBuYXRpdmUtcjEtcHJldmlvdXMtZGVmYXVsdC0wLnBuZwpSQVcgNzU0NjcgYmF5dCB8IFNIQS0yNTYgNmNjMTI1NmRlOTVmMjg3OTU1YjAxMDcwOTk5MTY2N2Q3YjgyZjgyMTgwY2RiN2Y1YjlkNmFiM2ViNGQ4ODc5ZSB8IDEgZG9zeWE6IG5hdGl2ZS1yMS1taXNzaW5nLWFzc3VtcHRpb25zLTEucG5nClJBVyA3MDE3OCBiYXl0IHwgU0hBLTI1NiA2ZDFlZmIzZDI5NDJkNmYwM2U4ODJlNmM4MTJiMDFkNGQ4OWU1ZmJiOTg5NTEwODRkZTYwNTJlOWRlYzUzNjRlIHwgMSBkb3N5YTogbmF0aXZlLXIxLXdpdGgtZHVyYXRpb24tMi5wbmcKUkFXIDY1NzI0IGJheXQgfCBTSEEtMjU2IDcxYmJiMWE2Zjk4MjA0YmVhNWM2NTFjODdmODI5NTkzODY5ZDliMGQ0Yjk5YTVmNzNiMmFlNmI3YTEwZjliNDcgfCAxIGRvc3lhOiBuYXRpdmUtcjEtb2ZmbGluZS0yLnBuZwpSQVcgNzk4NjUgYmF5dCB8IFNIQS0yNTYgN2U3MmQ2MzAyZjk0Y2UzNGM2YzE4ZWQxOTI4MzIyZWQ1MjRhYWNjY2VlOTFmMWFkMmM2OTAyOWU0NjI5MmM0MyB8IDEgZG9zeWE6IG5hdGl2ZS1yMS1oZWxkLTAucG5nClJBVyA3NTMxMSBiYXl0IHwgU0hBLTI1NiA4ODY2ZTlmZjEzYzhhM2ViNWIwYjAxNDc2YjdlYTZkNDQ2NzVhZjUzZTI0NTNmZWE5ZTIzMWJkODA3MDMzNTc3IHwgMSBkb3N5YTogbmF0aXZlLXIxLW1pc3NpbmctZXhwZXJpZW5jZS0xLnBuZwpSQVcgNzM0NjkgYmF5dCB8IFNIQS0yNTYgOTVhYzU4NmVhNTY5NzZkYjliMDRiM2EwNDk1OWQwMzRlZTk0YzkwM2Y2ODljMGRkZmVhODc5NTJjODllMjMxZSB8IDEgZG9zeWE6IG5hdGl2ZS1yMS1taXNzaW5nLXNjb3BlLTEucG5nClJBVyA4MTYzMyBiYXl0IHwgU0hBLTI1NiA5OWIwZTY5YjhmZjNiNjRkOGI3NmE3OTllMjBjNzViODZlNGM0NGFlODQ3MTEyOGM1Nzc1NmIxMDA2MzhmNDQ3IHwgNCBkb3N5YTogbmF0aXZlLXIxLXVua25vd24tMS5wbmcsIG5hdGl2ZS1yMS1sb2FkaW5nLTEucG5nLCBuYXRpdmUtcjEtZmFpbGVkLTEucG5nLCBuYXRpdmUtcjEtaGVsZC0xLnBuZwpSQVcgNjU4NTUgYmF5dCB8IFNIQS0yNTYgYTVlM2FiODk5ZDI5MDJkNDUxMDU1MWYzMWJmMzFkNTQxOGVkMTYxNjUxYmVmNTY2OTczNzllNWFlODQ2ZTQyZCB8IDkgZG9zeWE6IG5hdGl2ZS1yMS1taXNzaW5nLXNvdXJjZS0yLnBuZywgbmF0aXZlLXIxLW1pc3NpbmctZXhwZXJpZW5jZS0yLnBuZywgbmF0aXZlLXIxLXdyb25nLW1vdG9yY3ljbGUtMi5wbmcsIG5hdGl2ZS1yMS1uZXctZG9jdW1lbnQtMi5wbmcsIG5hdGl2ZS1yMS1uZXctZXhwZXJpZW5jZS0yLnBuZywgbmF0aXZlLXIxLXN0YWxlLTIucG5nLCBuYXRpdmUtcjEtdW5jb25maXJtZWQtMi5wbmcsIG5hdGl2ZS1yMS1zdGFsZS1zY29wZS0yLnBuZywgbmF0aXZlLXIxLW1pc3Npbmctc2NvcGUtMi5wbmcKUkFXIDc3Mzg4IGJheXQgfCBTSEEtMjU2IGMwMzYxZjE1Y2I0YzNlYjcyN2FlMjk0NjQ1MGQzMzA4Nzc4OGMzZDc4MjIzZmEwNTA4NDI3MmUwOGYzMTg3MDEgfCA0IGRvc3lhOiBuYXRpdmUtcjEtcmVhZHktMC5wbmcsIG5hdGl2ZS1yMS1taXNzaW5nLWFzc3VtcHRpb25zLTAucG5nLCBuYXRpdmUtcjEtZW1wdHktYXNzdW1wdGlvbnMtMC5wbmcsIG5hdGl2ZS1yMS1sb25nLWNvbnRleHQtMC5wbmcKUkFXIDc2NDY3IGJheXQgfCBTSEEtMjU2IGMyMWUxYTJiOGI1ZGMzNmFhN2RlMWEyYjE4ZDE4NTY1OTU3NGRmZGM2Y2ViNWY5NzI3MTVmOTYyNmYxNjg4MTQgfCAxIGRvc3lhOiBuYXRpdmUtcjEtb2ZmbGluZS0xLnBuZwpSQVcgNjc1MzEgYmF5dCB8IFNIQS0yNTYgYzdkNmE4ODQyMThiYmM1ZjhjYmNlNTQ1MzZkNzZkZDViNzhhOGMzYTgxZTgyOWRjMWFhY2FlZmJiNzY1YWQ0YyB8IDEgZG9zeWE6IG5hdGl2ZS1yMS1wcmV2aW91cy1kZWZhdWx0LTEucG5nClJBVyA3NTk2MiBiYXl0IHwgU0hBLTI1NiBkN2U3YTcxYzBkNTE2NzE3ZmM2Y2EyZDUxYjAwZGU3MzE5NGVjYTgxNDM2YWVmZDM5YmU4ZTQzNmVkYmRiOThkIHwgNiBkb3N5YTogbmF0aXZlLXIxLW1pc3Npbmctc291cmNlLTEucG5nLCBuYXRpdmUtcjEtd3JvbmctbW90b3JjeWNsZS0xLnBuZywgbmF0aXZlLXIxLW5ldy1kb2N1bWVudC0xLnBuZywgbmF0aXZlLXIxLW5ldy1leHBlcmllbmNlLTEucG5nLCBuYXRpdmUtcjEtc3RhbGUtMS5wbmcsIG5hdGl2ZS1yMS11bmNvbmZpcm1lZC0xLnBuZwpSQVcgNzk3NDYgYmF5dCB8IFNIQS0yNTYgZGRhNGRlYmE3ZDZmNzNhMDdiNWQ2ODI1NjU0YzgzNTkxOWIxZDg4ZDA0YzgyMzlhZDBlYzEwYjhlZTExYWQ1ZiB8IDEgZG9zeWE6IG5hdGl2ZS1yMS1zdGFsZS1zY29wZS0wLnBuZwpSQVcgODA2NTUgYmF5dCB8IFNIQS0yNTYgZTAyNDMzYTZkMDM2MjYzY2MxYzM0ZDllOGE0NGQ5YWY3ODI1Y2M2NzNlYmIwMjQ2NzkxMTNjMjg0NzdlOWZmOCB8IDEgZG9zeWE6IG5hdGl2ZS1yMS1sb25nLWNvbnRleHQtMS5wbmcKUkFXIDc5OTQwIGJheXQgfCBTSEEtMjU2IGUwOGQzNzc5YTFkYmIzOWY0MTI5MzA5MzUyMGEyMmFlMWY3MmVhYTE1N2IyYzA2OWU0MGQyNzI2Y2YxODBjZjIgfCAxIGRvc3lhOiBuYXRpdmUtcjEtcmVhZHktMS5wbmcKUkFXIDgzMjQ1IGJheXQgfCBTSEEtMjU2IGUyM2VkZDQ4ZjUxNzU2MTBlZmRlMTlkN2JmOWE2ZmM5NTdmNjk5MTY4M2FjMjUxZjNmNDVmMWJiZTQyZGExMTggfCAxIGRvc3lhOiBuYXRpdmUtcjEtbWlzc2luZy1zY29wZS0wLnBuZwpSQVcgNzY2MTMgYmF5dCB8IFNIQS0yNTYgZTcyMzY3N2M2Y2M4ODM4NDdjMmY0ZTM0YzdhYzczNWU3NWE2NzJiYmQ4ZDJkZDkxZGM3YWY2NDY5MjcwN2MxMiB8IDEgZG9zeWE6IG5hdGl2ZS1yMS1lbXB0eS1hc3N1bXB0aW9ucy0xLnBuZwoKIyMgMjAgZHVydW11biBrYXlkxLFybWEga2Fwc2FtxLEKCmVtcHR5LWFzc3VtcHRpb25zOiBvZmZzZXQgMCwgNjAwLCA4OTc7IHNvbiBvZmZzZXQvZW5kIDg5Ny84OTcKZmFpbGVkOiBvZmZzZXQgMCwgNjAwLCA5NzM7IHNvbiBvZmZzZXQvZW5kIDk3My85NzMKaGVsZDogb2Zmc2V0IDAsIDYwMCwgOTczOyBzb24gb2Zmc2V0L2VuZCA5NzMvOTczCmxvYWRpbmc6IG9mZnNldCAwLCA2MDAsIDk3Mzsgc29uIG9mZnNldC9lbmQgOTczLzk3Mwpsb25nLWNvbnRleHQ6IG9mZnNldCAwLCA2MDAsIDEwODc7IHNvbiBvZmZzZXQvZW5kIDEwODcvMTA4NwptaXNzaW5nLWFzc3VtcHRpb25zOiBvZmZzZXQgMCwgNjAwLCA4OTc7IHNvbiBvZmZzZXQvZW5kIDg5Ny84OTcKbWlzc2luZy1leHBlcmllbmNlOiBvZmZzZXQgMCwgNjAwLCA4NTE7IHNvbiBvZmZzZXQvZW5kIDg1MS84NTEKbWlzc2luZy1zY29wZTogb2Zmc2V0IDAsIDYwMCwgNzk4OyBzb24gb2Zmc2V0L2VuZCA3OTgvNzk4Cm1pc3Npbmctc291cmNlOiBvZmZzZXQgMCwgNjAwLCA4NzA7IHNvbiBvZmZzZXQvZW5kIDg3MC84NzAKbmV3LWRvY3VtZW50OiBvZmZzZXQgMCwgNjAwLCA4NzA7IHNvbiBvZmZzZXQvZW5kIDg3MC84NzAKbmV3LWV4cGVyaWVuY2U6IG9mZnNldCAwLCA2MDAsIDg3MDsgc29uIG9mZnNldC9lbmQgODcwLzg3MApvZmZsaW5lOiBvZmZzZXQgMCwgNjAwLCA4OTc7IHNvbiBvZmZzZXQvZW5kIDg5Ny84OTcKcHJldmlvdXMtZGVmYXVsdDogb2Zmc2V0IDAsIDQ5MTsgc29uIG9mZnNldC9lbmQgNDkxLzQ5MQpyZWFkeTogb2Zmc2V0IDAsIDYwMCwgOTczOyBzb24gb2Zmc2V0L2VuZCA5NzMvOTczCnN0YWxlOiBvZmZzZXQgMCwgNjAwLCA4NzA7IHNvbiBvZmZzZXQvZW5kIDg3MC84NzAKc3RhbGUtc2NvcGU6IG9mZnNldCAwLCA2MDAsIDkxNjsgc29uIG9mZnNldC9lbmQgOTE2LzkxNgp1bmNvbmZpcm1lZDogb2Zmc2V0IDAsIDYwMCwgODcwOyBzb24gb2Zmc2V0L2VuZCA4NzAvODcwCnVua25vd246IG9mZnNldCAwLCA2MDAsIDk3Mzsgc29uIG9mZnNldC9lbmQgOTczLzk3Mwp3aXRoLWR1cmF0aW9uOiBvZmZzZXQgMCwgNjAwLCAxMjAwLCAxMzExOyBzb24gb2Zmc2V0L2VuZCAxMzExLzEzMTEKd3JvbmctbW90b3JjeWNsZTogb2Zmc2V0IDAsIDYwMCwgODcwOyBzb24gb2Zmc2V0L2VuZCA4NzAvODcwCgojIyBTYWJpdCBzb3J1bGFyOiBpbGsgb2t1bWFkYSB5YW7EsXQKCjEuICoqQcOnxLFrKiog4oCUIFZhcnNhecSxbSwga2F5bmHEn8SxbiBoYW5naSBtb3Rvc2lrbGV0LCByZWhiZXIgcmV2aXp5b251IHZlIGRlbmV5aW0gacOnaW4gZ2XDp2VybGkgb2xkdcSfdTsgeWFsbsSxeiBiZWxpcnRpbGVuIHBhcsOnYXnEsSBrYXBzYW1hc8SxOyBhbGV0aW4gZWxkZSBvbG1hc8SxIHZlIGnFn8OnaWxpxJ9pbiBrYXluYWsga2Fwc2FtxLFuZGEgYnVsdW5tYXPEsSBnaWJpIGtvxZ91bGxhcsSxIGFubGF0xLF5b3IuCjIuICoqQcOnxLFrKiog4oCUIEhhecSxci4g4oCcS2F5bmFrdGEgb2xtYXlhbiBiaXIgdmFyc2F5xLFtIGVrbGVubWV6LuKAnQozLiAqKkHDp8SxayoqIOKAlCBUYWhtaW5pIG1hbGl5ZXQgacOnaW5kZWtpIOKAnEtheW5hxJ/EsW4gdmFyc2F5xLFtbGFyxLHigJ0gYsO2bMO8bcO8bmRlLgo0LiAqKkHDp8SxayoqIOKAlCDigJxWYXJzYXnEsW1sYXIgYmlsaW5taXlvcjsga2F5bmFrdGEgYnUgYmlsZ2kgeW9rIHZleWEgaGVuw7x6IGt1bGxhbsSxbGFtxLF5b3Iu4oCdCjUuICoqQcOnxLFrKiog4oCUIEhhecSxci4gRWtyYW4sIGtheW5hxJ/EsW4gdmFyc2F5xLFtIGJlbGlydG1lbWVzaW5pbiBrb8WfdWxsYXLEsW4gZGXEn2nFn21leWVjZcSfaSBnYXJhbnRpc2kgb2xtYWTEscSfxLFuxLEgc8O2eWzDvHlvci4KNi4gKipBw6fEsWsqKiDigJQgSGF5xLFyLiBFa3NpayB2YXJzYXnEsW0gYmlsaW5taXlvciB2ZSBrYXluYWt0YSBvbG1heWFuIHZhcnNhecSxbSBla2xlbm1peW9yLgo3LiAqKkHDp8SxayoqIOKAlCBIYXnEsXIuIFR1dGFyIOKAnEJpbGlubWl5b3I7IGtheW5hayB0dXRhcsSxIHlvayB2ZXlhIGhlbsO8eiBrdWxsYW7EsWxhbcSxeW9y4oCdIGRpeWUgZ8O2c3RlcmlsaXlvcjsgZWtyYW5kYSBrYXluYWsgZMSxxZ/EsSBoZXNhcGxhbm3EscWfIGJpciBmaXlhdCBzdW51bG11eW9yLgo4LiAqKkHDp8SxayoqIOKAlCBIYXnEsXIuIE1vdG9zaWtsZXQgdmV5YSByZWhiZXIgZGXEn2nFn2luY2UgZXNraSBrYXluYcSfxLFuIHZhcnNhecSxbWxhcsSxIGt1bGxhbsSxbG1hbWFsxLEuCjkuICoqQcOnxLFrKiog4oCUIEhhecSxci4gRGVuZXlpbSBiaWxnaXNpIGRlxJ9pxZ9pbmNlIGRlIGVza2kgdmFyc2F5xLFtbGFyIGt1bGxhbsSxbG1hbWFsxLEuCjEwLiAqKkHDp8SxayoqIOKAlCBIYXnEsXIuIOKAnERlbmV5aW0gYmlsZ2lzaSB5b2s7IHNhbmEgYmlyIHNldml5ZSBhdGFubWFkxLEu4oCdCjExLiAqKkHDp8SxayoqIOKAlCBIYXnEsXIuIOKAnMOHZXZyaW1kxLHFn8Sxc8Sxbi4gRXNraSBmaXlhdCBnw7xuY2VsIHRhaG1pbiBzYXnEsWxtYXou4oCdCjEyLiAqKkHDp8SxayoqIOKAlCBIYXnEsXIuIFnDvGtsZW1lZGUgaGF6xLFyIHRhaG1pbiBvbG1hZMSxxJ/EsSwgaGF0YWRhIG1hbGl5ZXRpbiBiaWxpbm1lZGnEn2kgdmUgZ8O8bmNlbCBrYXluYcSfxLFuIHllbmlkZW4ga29udHJvbCBlZGlsbWVzaSBnZXJla3RpxJ9pIHlhesSxeW9yLgoxMy4gKipBw6fEsWsqKiDigJQgSGF5xLFyLiBEb8SfcnVsYW5tYW3EscWfIGR1cnVtZGEgbWFsaXlldCBiaWxpbm1peW9yOyBkb8SfcnVsYW5txLHFnyBnw7xuY2VsIGtheW5hayBnZXJla2xpIHZlIG1vdG9zaWtsZXRlIMO2emVsIHV5Z3VsYW1hIGthcGFsxLEuCjE0LiAqKkHDp8SxayoqIOKAlCBUYWhtaW5pIG1hbGl5ZXQgYsO2bMO8bcO8bmRlOiBmaXlhdCB0YXJpaGkgMDEuMTAuMjAyNjsga2F5bmFrIOKAnMOWcm5layBtYWxpeWV0IGtheW5hxJ/EseKAnTsgc8O8csO8bSDigJzDtnJuZWstcjHigJ07IGtvbnRyb2wgdGFyaWhpIDEwLjEwLjIwMjYuCjE1LiAqKkHDp8SxayoqIOKAlCBIYXnEsXIuIMOWcm5layBnw7ZzdGVyaW1pbiBnZXLDp2VrIG1vdG9zaWtsZXQgacOnaW4gZG/En3J1bGFubcSxxZ8gZml5YXQgb2xtYWTEscSfxLEgYcOnxLFrw6dhIHlhesSxeW9yLgoxNi4gKipBw6fEsWsqKiDigJQgSGF5xLFyLiDigJxCaWxpbm1leWVuIHR1dGFyIHPEsWbEsXIgdmV5YSBiZWRhdmEgc2F5xLFsbWF6LuKAnQoxNy4gKipBw6fEsWsqKiDigJQgSGF5xLFyLiBIYXrEsXIgw7ZybmVrdGUgc2VydmlzIHVsYcWfxLFtxLEgdmUgYmVrbGVubWV5ZW4gZWsgcGFyw6dhIGRhaGlsIGRlxJ9pbDsgYmlsaW5tZXllbiBkdXJ1bWRhIHTDvG0gZ2lkZXJsZXJpbiBkYWhpbCBvbGR1xJ91IHZhcnNhecSxbG1hbWFzxLEgc8O2eWxlbml5b3IuCjE4LiAqKkHDp8SxayoqIOKAlCBIYXnEsXIuIEJpbGdpIHBsYW5sYW1hIGnDp2luZGlyOyDDtmRlbWUgdmV5YSBiYWvEsW0gaXpuaSBkZcSfaWxkaXIuIE1vdG9zaWtsZXRlIHV5Z3VubHVrIGF5csSxbcSxIGRhIHlldGVybGkgZGXEn2lsLgoxOS4gKipBw6fEsWsqKiDigJQgSGF5xLFyLCDDtmRlbWUgdmV5YSBiYWvEsW0gYWTEsW3EsSBiYcWfbGF0bcSxeW9yLiBPa3VtYWsgacOnaW4gaGVzYXAgZ2VyZWttaXlvci4KMjAuICoqQcOnxLFrKiog4oCUIEFsdCDDp3VidWs6IEdhcmFqLCBCYWvEsW0sIEFJIFVzdGEsIEdlw6dtacWfLCBUb3BsdWx1ay4gQXlyxLEg4oCcVmFyc2F5xLFtbGFy4oCdIHNla21lc2kgeW9rOyB2YXJzYXnEsW1sYXIgbWFsaXlldCBiw7Zsw7xtw7xuZGUuCgojIyBIw7xrw7xtCgoqKjIwLzIwIFBBU1MuKiogSGVyIHlhbsSxdCBla3JhbiBtZXRuaW5kZW4gYcOnxLFrw6dhIGt1cnVsYWJpbGl5b3I7IGJlbGlyc2l6IHlhbsSxdCB2ZXlhIHRhemUgb2t1bWF5YSBnaWRlY2VrIG1hZGRlIHlvay4=
