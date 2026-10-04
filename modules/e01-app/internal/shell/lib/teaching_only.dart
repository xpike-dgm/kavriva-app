import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'variant_resolution.dart';

String _required(String value) {
  final result = value.trim();
  if (result.isEmpty) throw ArgumentError('Boş konu veya kaynak kullanılamaz.');
  return result;
}

enum TeachingScope { generalReference, motorcycleContext }

enum TeachingFreshness { current, stale, unknown }

/// Sağlayıcının kaynak açıklaması; E1 teknik doğrulama veya garanti üretmez.
class TeachingSourceReference {
  TeachingSourceReference({
    required String source,
    required String version,
    required String location,
    required String checkedAt,
    required this.freshness,
  }) : source = _required(source),
       version = _required(version),
       location = _required(location),
       checkedAt = _required(checkedAt);
  final String source, version, location, checkedAt;
  final TeachingFreshness freshness;
}

/// Yalnız açıklayıcı kavram; fiziksel adım, işlem komutu veya tamamlanma alanı yok.
class TeachingConcept {
  TeachingConcept({
    required String id,
    required String title,
    required String explanation,
  }) : id = _required(id),
       title = _required(title),
       explanation = _required(explanation);
  final String id, title, explanation;
}

class TeachingTopic {
  TeachingTopic({
    required String id,
    required String revision,
    required String title,
    required String purpose,
    required String applicationUnavailableReason,
    required this.scope,
    required this.context,
    required this.source,
    required List<TeachingConcept> concepts,
  }) : id = _required(id),
       revision = _required(revision),
       title = _required(title),
       purpose = _required(purpose),
       applicationUnavailableReason = _required(applicationUnavailableReason),
       concepts = List.unmodifiable(concepts) {
    if ((scope == TeachingScope.generalReference && context != null) ||
        (scope == TeachingScope.motorcycleContext && context == null)) {
      throw ArgumentError(
        'Genel bilgi ve motosiklet bağlamı ayrı tutulmalıdır.',
      );
    }
    if (concepts.isEmpty ||
        concepts.map((c) => c.id).toSet().length != concepts.length) {
      throw ArgumentError('Ayrı kimlikli açıklayıcı kavramlar gerekli.');
    }
  }
  final String id, revision, title, purpose, applicationUnavailableReason;
  final TeachingScope scope;
  final VariantContext? context;
  final TeachingSourceReference? source;
  final List<TeachingConcept> concepts;
}

/// Yeniden değerlendirme niyeti; kaynak, fit, hazırlık veya izin sonucu değildir.
class TeachingRecheckRequest {
  const TeachingRecheckRequest({
    required this.context,
    required this.topicId,
    required this.topicRevision,
  });
  final VariantContext context;
  final String? topicId, topicRevision;
}

class TeachingOnlyView extends StatelessWidget {
  const TeachingOnlyView({
    super.key,
    required this.context,
    required this.topic,
    required this.offline,
    required this.busy,
    required this.errorMessage,
    required this.onRecheckRequested,
    required this.onBackRequested,
  });
  final VariantContext context;
  final TeachingTopic? topic;
  final bool offline, busy;
  final String? errorMessage;
  final ValueChanged<TeachingRecheckRequest>? onRecheckRequested;
  final ValueChanged<VariantContext>? onBackRequested;

  @override
  Widget build(BuildContext context) {
    final t = topic;
    final matched =
        t != null &&
        (t.scope == TeachingScope.generalReference ||
            this.context.matches(t.context!));
    final source = matched ? t.source : null;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:
              [
                    const Text(
                      'Yalnız öğrenme ve bilgi',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text('Motosikletim: ${this.context.motorcycleLabel}'),
                    Text('Konu bağlamı: ${this.context.guideLabel}'),
                    const Text(
                      'Bu görünüm motosiklette uygulama adımı değildir. Okumak veya geri dönmek işlem başlatmaz, hazırlığı doğrulamaz ve işi tamamlanmış saymaz.',
                    ),
                    const Text(
                      'Motosiklete uygunluk ve bütün zorunlu hazırlık koşulları güncel olarak ayrıca doğrulanmalıdır. Kaynağın bulunması veya güncel olması başarı garantisi değildir.',
                    ),
                    if (offline)
                      const Text(
                        'Çevrimdışısın. Açıklama okunabilir; bağlantı yokken güncel değerlendirme yapılmış sayılmaz.',
                      ),
                    if (matched) ...[
                      Text(t.title, style: const TextStyle(fontSize: 20)),
                      Text('Bu konuyu neden okuyorum? ${t.purpose}'),
                      Text(
                        t.scope == TeachingScope.generalReference
                            ? 'Genel öğrenme bilgisi; bu motosiklete özel doğrulanmış uygulama değildir.'
                            : 'Açıklama seçili motosiklet ve konu bağlamına aittir; yine de fiziksel işlem talimatı veya uygunluk izni değildir.',
                      ),
                      Semantics(
                        liveRegion: true,
                        child: Text(
                          'Uygulama kapalı: ${t.applicationUnavailableReason}',
                        ),
                      ),
                      if (source != null) ...[
                        Text('Kaynak: ${source.source}'),
                        Text('Sürüm: ${source.version} · ${source.location}'),
                        Text('Kontrol zamanı: ${source.checkedAt}'),
                        Text(switch (source.freshness) {
                          TeachingFreshness.current => 'Kaynak bilgisi: güncel. Bu, motosiklette uygulamaya hazır olduğun anlamına gelmez.',
                          TeachingFreshness.stale => 'Kaynak bilgisi eski. Önceki açıklama güncel uygunluk veya hazırlık kanıtı değildir; yeniden kontrol gerekir.',
                          TeachingFreshness.unknown => 'Kaynağın güncelliği bilinmiyor; motosiklette uygulama için kullanma.',
                        }),
                      ] else
                        const Text(
                          'Kaynak bilgisi eksik; bu açıklama teknik doğrulama veya uygulama izni değildir.',
                        ),
                      const Text(
                        'Konuyu anlamak için açıklamalar',
                        style: TextStyle(fontSize: 20),
                      ),
                      for (final concept in t.concepts) ...[
                        Text(
                          concept.title,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(concept.explanation),
                      ],
                    ] else ...[
                      const Text(
                        'Bu bağlam için açıklama yok',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Konu bilgisi eksik veya seçili motosiklet ve rehberle eşleşmiyor. Başka motosikletin açıklamasını veya yakın model tahminini burada doğru sayma.',
                      ),
                    ],
                    const Text(
                      'Yeni risk veya uyuşmazlık varsa fiziksel uygulama kapalı kalır. Öğrenme bilgisi zorunlu güvenlik kontrolünün yerine geçmez.',
                    ),
                    if (busy)
                      const Text(
                        'Yeniden değerlendirme sürüyor. Açıklamayı okumak sonucu değiştirmez.',
                      ),
                    if (errorMessage != null)
                      Semantics(liveRegion: true, child: Text(errorMessage!)),
                    const Text(
                      'Güncel uygunluk ve hazırlık için yeniden kontrol isteyebilirsin. İstek göndermek kendiliğinden doğrulama veya işlem başlatma değildir.',
                    ),
                    _Action(
                      label: 'Uygunluğu ve hazırlığı yeniden kontrol et',
                      onPressed: busy || onRecheckRequested == null
                          ? null
                          : () => onRecheckRequested!(
                              TeachingRecheckRequest(
                                context: this.context,
                                topicId: matched ? t.id : null,
                                topicRevision: matched ? t.revision : null,
                              ),
                            ),
                    ),
                    if (onRecheckRequested == null)
                      const Text(
                        'Yeniden kontrol şu anda kullanılamıyor; uygulama izni oluşmaz.',
                      ),
                    _Action(
                      label: 'Önceki ekrana dön',
                      onPressed: busy || onBackRequested == null
                          ? null
                          : () => onBackRequested!(this.context),
                    ),
                    if (onBackRequested == null)
                      const Text('Geri dönüş şu anda kullanılamıyor.'),
                    const Text(
                      'Bu ekran yalnız bilgi içindir; başlatma, adım atlama veya tamamlandı seçeneği içermez.',
                    ),
                  ]
                  .map(
                    (w) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: w,
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}

class _Action extends StatefulWidget {
  const _Action({required this.label, required this.onPressed});
  final String label;
  final VoidCallback? onPressed;
  @override
  State<_Action> createState() => _ActionState();
}

class _ActionState extends State<_Action> {
  bool focused = false;
  @override
  Widget build(BuildContext context) => FocusableActionDetector(
    enabled: widget.onPressed != null,
    onShowFocusHighlight: (v) => setState(() => focused = v),
    shortcuts: const {
      SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
      SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
    },
    actions: {
      ActivateIntent: CallbackAction<ActivateIntent>(
        onInvoke: (_) {
          widget.onPressed?.call();
          return null;
        },
      ),
    },
    child: Semantics(
      button: true,
      enabled: widget.onPressed != null,
      label: widget.label,
      onTap: widget.onPressed,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: widget.onPressed,
        behavior: HitTestBehavior.opaque,
        child: Container(
          constraints: const BoxConstraints(minHeight: 52),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: focused
                  ? const Color(0xFF0E5BD8)
                  : const Color(0xFF5E6E81),
            ),
          ),
          child: Text(widget.label),
        ),
      ),
    ),
  );
}
