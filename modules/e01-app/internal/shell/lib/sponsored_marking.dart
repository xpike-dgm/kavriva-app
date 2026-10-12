import 'package:flutter/widgets.dart';

import 'variant_resolution.dart';

String _required(String value) {
  final text = value.trim();
  if (text.isEmpty) throw ArgumentError('Boş ticari kaynak kullanılamaz.');
  return text;
}

enum SponsorDisclosure { sponsored, notSponsored, unknown }

enum CommercialDisplayState { available, loading, failed, held }

/// Kaynağın bildirdiği ticari bilgi; teknik öneri veya uygunluk kararı değildir.
class CommercialOption {
  CommercialOption({
    required String id,
    required String name,
    required this.disclosure,
  }) : id = _required(id),
       name = _required(name);
  final String id;
  final String name;
  final SponsorDisclosure disclosure;
}

/// Gerçek kaynağı çağıran sağlar. Bu model satıcı, sponsor veya teklif doğrulamaz.
class CommercialSource {
  CommercialSource({
    required this.context,
    required String sourceName,
    required String revision,
    required String checkedAt,
    required this.current,
    required this.confirmed,
    required List<CommercialOption>? options,
  }) : sourceName = _required(sourceName),
       revision = _required(revision),
       checkedAt = _required(checkedAt),
       options = options == null ? null : List.unmodifiable(options) {
    if (options != null &&
        options.map((o) => o.id).toSet().length != options.length) {
      throw ArgumentError('Aynı ticari seçenek iki kez sunulamaz.');
    }
  }
  final VariantContext context;
  final String sourceName;
  final String revision;
  final String checkedAt;
  final bool current;
  final bool confirmed;

  /// null: kaynak seçenek bilgisini vermedi; boş: kaynakta kayıtlı seçenek yok.
  final List<CommercialOption>? options;
}

class CommercialPresentation {
  const CommercialPresentation({
    required this.source,
    required this.state,
    required this.online,
  });
  final CommercialSource? source;
  final CommercialDisplayState state;
  final bool online;
}

/// Yalnız metin: sıralama, satın alma, analytics, hazırlık veya fit etkisi yok.
class SponsoredMarkingView extends StatelessWidget {
  const SponsoredMarkingView({
    super.key,
    required this.context,
    required this.presentation,
    required this.scopeCurrent,
  });
  final VariantContext context;
  final CommercialPresentation presentation;
  final bool scopeCurrent;

  @override
  Widget build(BuildContext context) {
    final source = presentation.source;
    final usable =
        scopeCurrent &&
        presentation.online &&
        presentation.state == CommercialDisplayState.available &&
        source != null &&
        source.current &&
        source.confirmed &&
        this.context.matches(source.context);
    final List<Widget> children = [
      Semantics(
        header: true,
        child: const Text(
          'Diğer seçenekler ve reklam bilgisi',
          style: TextStyle(fontSize: 20),
        ),
      ),
      const Text(
        'Önce yukarıdaki motosiklete uygunluk bilgisini oku. Bu liste rehberin yerini almaz; bir seçeneğin gösterilmesi teknik olarak en iyi olduğunu kanıtlamaz.',
      ),
      const Text(
        'Sponsor desteği motosiklete uygunluğu veya bakım iznini değiştirmez. Burada satın alma, ödeme ya da servis rezervasyonu başlatılmaz. Okumak hesap veya satın alma gerektirmez.',
      ),
    ];
    if (!usable) {
      children.add(
        Text(
          !presentation.online
              ? 'Çevrimdışısın. Eski liste güncel teklif sayılmaz; bağlantı gelince kaynak yeniden kontrol edilmeli.'
              : switch (presentation.state) {
                  CommercialDisplayState.loading => 'Seçenek bilgisi yükleniyor. Eski liste güncelmiş gibi gösterilmez.',
                  CommercialDisplayState.failed => 'Seçenek bilgisi alınamadı. Kaynak yeniden kontrol edilmeli; rehber ve uygunluk bilgisi ayrı kalır.',
                  CommercialDisplayState.held => 'Seçenek bilgisi bekletiliyor. Kaynak kontrolü tamamlanmadan güncel liste gösterilmez.',
                  CommercialDisplayState.available => 'Bu motosiklet ve rehber için güncel, doğrulanmış seçenek kaynağı yok. Motosiklet, rehber veya bilgi değişince eski listeyi kullanma; kaynak yeniden kontrol edilmeli.',
                },
        ),
      );
    } else {
      children.addAll([
        Text('Seçenek kaynağı: ${source.sourceName}'),
        Text('Kaynak sürümü: ${source.revision}'),
        Text('Kaynak kontrol zamanı: ${source.checkedAt}'),
        const Text(
          'Kaynağın verdiği diğer seçenekler gizlenmez. Bu liste bütün satıcıları veya bütün alternatifleri kapsadığı anlamına gelmez.',
        ),
      ]);
      final options = source.options;
      if (options == null) {
        children.add(
          const Text(
            'Kaynak seçenek ve alternatif bilgisini vermemiş. Alternatif olmadığı sonucuna varılamaz.',
          ),
        );
      } else if (options.isEmpty) {
        children.add(
          const Text(
            'Bu kaynakta kayıtlı seçenek yok. Başka alternatiflerin olmadığı anlamına gelmez.',
          ),
        );
      } else {
        for (final option in options) {
          if (option.disclosure == SponsorDisclosure.unknown) {
            children.add(
              const Text(
                'Bir seçeneğin sponsor bilgisi bilinmiyor. Reklamsız sayılmaz; bilgi açıklanana kadar adı ve ticari ayrıntısı gösterilmez.',
              ),
            );
          } else {
            children.add(
              Text(
                '${option.disclosure == SponsorDisclosure.sponsored ? 'Sponsorlu · ücretli reklam' : 'Kaynağa göre sponsor desteği yok'} — Kaynakta geçen seçenek: ${option.name}',
              ),
            );
          }
        }
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
          .map(
            (child) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: child,
            ),
          )
          .toList(),
    );
  }
}
