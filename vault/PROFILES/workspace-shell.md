---
record_id: V-E2-SHELL-001
version: 1
purpose: Bağlantı ve erişim açmayan masaüstü çalışma alanı kabuğu adayı
domain: internal-operations
module: e02-panel
owner: E2
implements: [ADR-010, ADR-015, C2.1, F2.1.1, FL2.1.1]
public_contracts: []
internal_scope: closed-workspace-shell-candidate
tasks: [T-E2-001]
tests: [modules/e02-panel/internal/workspace-shell/tests/browser.mjs, modules/e02-panel/internal/workspace-shell/tests/orca.py]
superseded_by: []
last_verified: 2026-10-18
depends_on: [M-E2-001, V-E2-FRAMEWORK-001]
used_by: [P-E2-001, T-E2-001, E-DEV-125]
evidence: [E-DEV-125]
supersedes: []
status: IN_PROGRESS
---

# Çalışma alanı kabuğu adayı

C2.1/F2.1.1/FL2.1.1 için gezinme, ana içerik ve üç panel. Bu kayıt bir çatı seçimi veya üretim etkinleştirmesi değildir. Önceki karşılaştırmanın kaynakları ve20 sorusu aynıdır; React önerisinin bağlayıcı olması ADR010un kayıtlı seçim kapısına bağlıdır.

Ürün dizini `modules/e02-panel/internal/workspace-shell/` ayrı paket/kilitle kurulur. Karşılaştırma örneğinin modelini, özel verisini, oturum çerezini veya sunucusunu tüketmez. Başlangıç yalnız bağlantı doğrulanmadı durumudur; kayıt/rol/onay/yayın işlemi yok. Sorgu ve yerel saklamaya yazılan ALLOW/rol/aktör özel kayıt açamaz. Bu sınırlı olumsuz, üretim E3/E5 kimlik doğrulaması kanıtı değildir. Gerçek inceleme kuyruğu API sözleşmesi bu görevde uydurulmaz; sonraki ekranlar kendi görevleriyle gelir.

Temel1440x900 paneller, semantik başlık/landmark, klavye hedef odağı, yalnız renk dışı durum anlamı ve gerçek200% zoom sınanır. Tam responsive ve son E2 tasarım tokenleri bu görevde kilitlenmez. Kabul edilmiş E2 görsel referansı bulunmadı; tüketici mobil referansı yerine kullanılmadı.

Yerel ilk8 tarayıcı kontrolü ve ayrı build başarılı. Root ilk altı doğal PNGyi original açtı; bağlamdaki gereksiz politika cümleleri kısaltıldı. Kopya onarımı sonrası R2 tekrar8PASS; Root altı R2 görüntüsünü üç yeni özgün okuma ve üç tam bayt eşliğiyle kapsadı; Linux gerçek Orca/CI sonucu beklenir. Windows için ekran okuyucu PASS iddia edilmez. Ayrı paket ağacı, CycloneDX ve audit gerçek yerel araçlarla üretildi; audit0. Sonuçlar `vault/EVIDENCE/E-DEV-125.md` kaydında topluca tutulur.

Bağlayıcı kapsam `vault/PACKS/P-E2-001.md` ve `vault/REGISTRY/T-E2-001.md`; görev IN_PROGRESS. Görev sonu bağımsız gpt-6-luna/max inceleme ve kayıtlı çatı kararı olmadan DONE olmaz.
