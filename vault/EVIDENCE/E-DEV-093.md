---
test_id: E-DEV-093
contract_id_version: "ADR011 Decision1; C8.1/F8.1.1/FL8.1.1 v1"
subject_file: vault/PROFILES/content-authority-references.md
subject_digest: 3431f350fa4906c64341ab3e101f64220223eb5595f5fdf2b6b5714011b2132b
result: "RECORDED sekiz başlığın tam kaynak referansı; bağımsız kabul bekleniyor"
evidence_links:
  - "vault/PROFILES/content-authority-references.md"
  - "vault/PACKS/P-E8-001.md"
  - "vault/REGISTRY/T-E8-001.md"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-092-E10-GOVERNED-PATHS-FOR-T-E8-001.md.snapshot"
gate_verdict: "RECORDED referans görevi REVIEW; gerçek ürün yetkisi HELD"
reviewer: none
timestamp: 2026-10-04
purpose: İçerik yetkilerinin sekiz kanonik başlığına sahiplik değiştirmeden referans vermek
domain: content-authority-references
module: e08-content
owner: E8
implements: [ADR-011, ADR-001, ADR-003, ADR-004, ADR-007, C8.1, F8.1.1, R-001, R-003, R-004, R-007, R-011, R-013, R-014]
public_contracts: []
internal_scope: content-authority-references
tasks: [T-E8-001]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [V-E8-AUTH-REF-001]
used_by: [V-E8-AUTH-REF-001, P-E8-001, T-E8-001]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-093 sekiz yetki başlığına kanonik referans

Kabul edilmiş taban 7827ee630dfcd23a9aa68d2353c51fefda0d0f80/v60; plan fa914f013fdcd032faed876689092da245989459. Artifact öncesi pack867d4fc14alan/13sabitkaynak/11yol. Kanonik ADR011R1 tam cümle ve bütün nitelikler kaynak referansıyla korunur; tablo sekiz başlığı görünür kılar, yeni yetki/policy/rol/permit üretmez. E3/E6 sahipliği, E5 currentauthorize sınırı/E8derive/E2render korunur. Bypass altı vektör ve gerçek rebuild farklı görev kabulüdür; DONE sayılmaz. Gerçek ürün kaynak/yazıcı/kimlik/insan-yayın/audit/floor/CMS hazır oluşu HELD.

LF profil SHA256 3431f350fa4906c64341ab3e101f64220223eb5595f5fdf2b6b5714011b2132b. Ham v60 snapshot `vault/EVIDENCE/SNAPSHOTS/E-DEV-092-E10-GOVERNED-PATHS-FOR-T-E8-001.md.snapshot`: 186951 byte, rawSHA256 269f4d74f24adb33fb7752381c889e9f361d1cf0651279b3048e7251a1030657; kabul edilmiş 7827ee630dfcd23a9aa68d2353c51fefda0d0f80 envanter Git blobuyla bayt eşit. v61 yalnız yeni kabul yollarını genişletir; 401dosya79klasör/pending13-23-25 ve önceki bütün kabuller korunur. EDEV092 birincil subject/reviewer/hüküm/geçmiş değişmez; yalnız gerçek PR94 ikincil makbuzu ve tüketici referansı eklenir.

Yazar kaynak doğrulaması ve bütün kanonik kabulün bağımsız gpt-6-luna/max incelemesi/aynı başlık CI bekleniyor. Ortak kör nokta sekiz başlık sayısını nitelik tamlığı sanmak veya mantıksal ACTIVE kaydını fiziksel geçerli izin sanmak; incelemeci tüm kaynak cümlesini/owner/seam/pin/raw/diff/actualHELD sınırını bağımsız denetlemelidir. Pack `vault/PACKS/P-E8-001.md`; görev `vault/REGISTRY/T-E8-001.md`; profil `vault/PROFILES/content-authority-references.md`.

## Gerçek yazar kontrolü

run_all12kontrol+42regresyonPASS0.475s/worst0; build86REVIEW/routingREVIEW; git diff --check temiz. Tam11yol/13pin/sekizbaşlık/kanonikADR011R1tamcümlesatırboşluğunormalizeeşitliği/rawv60byteeşitliği/önceki birincil alan koruması ayrı denetlendi. Bunlar gerçek yetki veya bypass testi değildir.
