import 'package:flutter/widgets.dart';

/// İç sunum amacı beyanıdır; gerçek kaynağı veya üretim kararını doğrulamaz.
enum CommercialPurpose {
  supplement,
  replaceGuide,
  salesTarget,
  technicalRanking,
  unknown,
}

/// Yalnız yardımcı ticari içerik. Fit, rehber, ölçüm veya eylem girdisi yoktur.
class RankingFirewallView extends StatelessWidget {
  const RankingFirewallView({
    super.key,
    required this.purpose,
    required this.child,
  });
  final CommercialPurpose purpose;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final allowed = purpose == CommercialPurpose.supplement;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: const Text(
            'Ticari bilgi ayrı tutulur',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Rehber ve motosiklete uygunluk bilgisi yukarıda. Ticari liste bunların yerini almaz; ücret veya sponsor desteği teknik uygunluğu değiştiremez.',
        ),
        const SizedBox(height: 8),
        const Text(
          'Satışı artırmak için rehber değiştirilmez. Davranış ve satış ölçümleri teknik uygunluk seçimine katılmaz.',
        ),
        const SizedBox(height: 8),
        if (allowed)
          child
        else ...[
          Text(switch (purpose) {
            CommercialPurpose.replaceGuide => 'Bu liste rehberin yerine sunulmaya çalışıyor; ticari ayrıntıları gösterilmiyor.',
            CommercialPurpose.salesTarget =>
              'Satışı artırma amacı taşıyan yönlendirme gösterilmiyor.',
            CommercialPurpose.technicalRanking => 'Ticari sıralama teknik uygunluk kararı gibi sunulamaz; ticari ayrıntıları gösterilmiyor.',
            CommercialPurpose.unknown => 'Listenin kullanım amacı belli değil. Amaç netleşmeden ticari ayrıntıları gösterilmez.',
            CommercialPurpose.supplement => throw StateError(
              'Yardımcı içerik ayrı sunulur.',
            ),
          }),
          const SizedBox(height: 8),
          const Text(
            'Bu engel rehberi ve motosiklete uygunluk bilgisini gizlemez. Önceden kullanılabilen rehber yolları bu engelle kapanmaz; kullanılamayan bir yol da bu listeyle açılmaz. Yukarıdaki bilgileri okuyabilirsin; satın alma veya yeni bir uygulama izni başlatılmaz.',
          ),
        ],
      ],
    );
  }
}
