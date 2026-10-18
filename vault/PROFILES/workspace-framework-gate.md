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
used_by: [P-E2-001, T-E2-001, E-DEV-125]
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
