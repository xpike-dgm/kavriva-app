import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'variant_resolution.dart';

String _required(String value) {
  final text = value.trim();
  if (text.isEmpty) throw ArgumentError('Hazırlık bilgisi boş olamaz.');
  return text;
}

enum PreparationImportance {
  critical('Kritik ve zorunlu'),
  mandatory('Zorunlu'),
  optional('İsteğe bağlı');

  const PreparationImportance(this.label);
  final String label;
}

enum PreparationConditionState {
  verified('Doğrulandı'),
  pending('Kontrol bekleniyor'),
  missing('Eksik'),
  unknown('Henüz bilinmiyor'),
  stale('Önceki kontrol güncel değil'),
  failed('Kontrol başarısız');

  const PreparationConditionState(this.label);
  final String label;
}

enum ReadinessDisplayStatus { ready, held }

enum ReadinessCheckKind { fresh, photo, measurement, alternative }

/// Çağıranın gerçek kaynak değerlendirmesi; E1 bu referansı doğrulamaz.
/// null conditionId bütün değerlendirmeyi, diğer değer tek koşulu adlandırır.
class ReadinessEvidenceReference {
  ReadinessEvidenceReference({
    required this.context,
    required String evaluationRevision,
    required String source,
    required String version,
    required String location,
    required String checkedAt,
    required this.current,
    String? conditionId,
  }) : evaluationRevision = _required(evaluationRevision),
       source = _required(source),
       version = _required(version),
       location = _required(location),
       checkedAt = _required(checkedAt),
       conditionId = conditionId == null ? null : _required(conditionId);
  final VariantContext context;
  final String evaluationRevision, source, version, location, checkedAt;
  final String? conditionId;
  final bool current;
  bool matches(VariantContext c, String revision, String? id) =>
      context.matches(c) && evaluationRevision == revision && conditionId == id;
}

/// Araç/parça/ekipman/ortam/ön kontrol sınıflaması gerçek içeriği sağlayana aittir.
class PreparationCondition {
  PreparationCondition({
    required String id,
    required String label,
    required this.importance,
    required this.state,
    required String reason,
    required String remediation,
    required this.evidence,
  }) : id = _required(id),
       label = _required(label),
       reason = _required(reason),
       remediation = _required(remediation);
  final String id, label, reason, remediation;
  final PreparationImportance importance;
  final PreparationConditionState state;
  final ReadinessEvidenceReference? evidence;
}

/// Kaynakta verilen risk, önleme ve durma koşulu; teknik talimat uydurmaz.
class SafetyPreparation {
  SafetyPreparation({
    required String risk,
    required String prevention,
    required String stopCondition,
  }) : risk = _required(risk),
       prevention = _required(prevention),
       stopCondition = _required(stopCondition);
  final String risk, prevention, stopCondition;
}

class ReadinessPresentation {
  ReadinessPresentation({
    required this.context,
    required String revision,
    required this.status,
    required this.evidence,
    required List<PreparationCondition> conditions,
    required List<SafetyPreparation> risks,
  }) : revision = _required(revision),
       conditions = List.unmodifiable(conditions),
       risks = List.unmodifiable(risks) {
    if (conditions.map((c) => c.id).toSet().length != conditions.length)
      throw ArgumentError('Hazırlık koşulları ayrı kimlikli olmalı.');
  }
  final VariantContext context;
  final String revision;
  final ReadinessDisplayStatus status;
  final ReadinessEvidenceReference? evidence;
  final List<PreparationCondition> conditions;
  final List<SafetyPreparation> risks;
}

/// Yeni kanıt isteme niyeti; fotoğraf/ölçüm/kontrol yapmaz veya doğrulama yazmaz.
class ReadinessRecheckRequest {
  const ReadinessRecheckRequest({
    required this.context,
    required this.evaluationRevision,
    required this.conditionId,
    required this.kind,
  });
  final VariantContext context;
  final String? evaluationRevision, conditionId;
  final ReadinessCheckKind kind;
}

class PreparationReadinessView extends StatelessWidget {
  const PreparationReadinessView({
    super.key,
    required this.context,
    required this.result,
    required this.fit,
    required this.busy,
    required this.errorMessage,
    required this.onStartRequested,
    required this.onRecheckRequested,
    required this.onTeachingRequested,
  });
  final VariantContext context;
  final ReadinessPresentation? result;
  final FitPresentation? fit;
  final bool busy;
  final String? errorMessage;
  final ValueChanged<ReadinessPresentation>? onStartRequested;
  final ValueChanged<ReadinessRecheckRequest>? onRecheckRequested;
  final ValueChanged<VariantContext>? onTeachingRequested;
  @override
  Widget build(BuildContext context) => _ReadinessPage(
    context: this.context,
    result: result,
    fit: fit,
    busy: busy,
    errorMessage: errorMessage,
    onStartRequested: onStartRequested,
    onRecheckRequested: onRecheckRequested,
    onTeachingRequested: onTeachingRequested,
    hold: false,
    onPreparationRequested: null,
  );
}

class ReadinessHoldView extends StatelessWidget {
  const ReadinessHoldView({
    super.key,
    required this.context,
    required this.result,
    required this.fit,
    required this.busy,
    required this.errorMessage,
    required this.onRecheckRequested,
    required this.onTeachingRequested,
    required this.onPreparationRequested,
  });
  final VariantContext context;
  final ReadinessPresentation? result;
  final FitPresentation? fit;
  final bool busy;
  final String? errorMessage;
  final ValueChanged<ReadinessRecheckRequest>? onRecheckRequested;
  final ValueChanged<VariantContext>? onTeachingRequested;
  final ValueChanged<ReadinessPresentation>? onPreparationRequested;
  @override
  Widget build(BuildContext context) => _ReadinessPage(
    context: this.context,
    result: result,
    fit: fit,
    busy: busy,
    errorMessage: errorMessage,
    onStartRequested: null,
    onRecheckRequested: onRecheckRequested,
    onTeachingRequested: onTeachingRequested,
    hold: true,
    onPreparationRequested: onPreparationRequested,
  );
}

class _ReadinessPage extends StatelessWidget {
  const _ReadinessPage({
    required this.context,
    required this.result,
    required this.fit,
    required this.busy,
    required this.errorMessage,
    required this.onStartRequested,
    required this.onRecheckRequested,
    required this.onTeachingRequested,
    required this.hold,
    required this.onPreparationRequested,
  });
  final VariantContext context;
  final ReadinessPresentation? result;
  final FitPresentation? fit;
  final bool busy, hold;
  final String? errorMessage;
  final ValueChanged<ReadinessPresentation>? onStartRequested,
      onPreparationRequested;
  final ValueChanged<ReadinessRecheckRequest>? onRecheckRequested;
  final ValueChanged<VariantContext>? onTeachingRequested;

  @override
  Widget build(BuildContext context) {
    final r = result;
    final matched = r != null && this.context.matches(r.context);
    final e = matched ? r.evidence : null;
    final current =
        matched &&
        e != null &&
        e.current &&
        e.matches(this.context, r.revision, null);
    final f = fit;
    final fitCurrent =
        f != null &&
        this.context.matches(f.context) &&
        f.status == FitDisplayStatus.confirmed &&
        f.evidence != null &&
        f.evidence!.current &&
        this.context.matches(f.evidence!.context);
    bool verified(PreparationCondition c) =>
        matched &&
        current &&
        c.state == PreparationConditionState.verified &&
        c.evidence != null &&
        c.evidence!.current &&
        c.evidence!.matches(this.context, r.revision, c.id);
    final mandatory = matched
        ? r.conditions
              .where((c) => c.importance != PreparationImportance.optional)
              .toList()
        : <PreparationCondition>[];
    final ready =
        matched &&
        current &&
        fitCurrent &&
        r.status == ReadinessDisplayStatus.ready &&
        mandatory.isNotEmpty &&
        r.risks.isNotEmpty &&
        mandatory.every(verified) &&
        !busy &&
        errorMessage == null;
    void recheck(ReadinessCheckKind kind, String? id) => onRecheckRequested!(
      ReadinessRecheckRequest(
        context: this.context,
        evaluationRevision: matched ? r.revision : null,
        conditionId: id,
        kind: kind,
      ),
    );
    final controlsEnabled = !busy && onRecheckRequested != null;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:
              [
                    Text(
                      hold
                          ? 'Hazırlık eksikliğini gider'
                          : 'İşe başlamadan hazırlığını kontrol et',
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text('Motosikletim: ${this.context.motorcycleLabel}'),
                    Text('Rehber: ${this.context.guideLabel}'),
                    const Text(
                      'Bu ekran fiziksel işlem adımı değildir. Uygunluk ve bütün zorunlu koşullar güncel olarak doğrulanmadan işe başlanmaz.',
                    ),
                    Text(
                      fitCurrent
                          ? 'Bu motosiklet ve rehberin uygunluğu güncel olarak doğrulandı.'
                          : 'Motosiklete uygunluk eksik veya güncel değil; işe başlama kapalı.',
                    ),
                    const Text(
                      'Hazırım veya deneyimliyim demek kritik kontrolün yerine geçmez. Yeni bilgi göndermek de koşulu kendiliğinden doğrulamaz.',
                    ),
                    if (matched) ...[
                      if (e != null &&
                          e.matches(this.context, r.revision, null)) ...[
                        Text('Hazırlık kaynağı: ${e.source}'),
                        Text('Sürüm: ${e.version} · ${e.location}'),
                        Text('Kontrol zamanı: ${e.checkedAt}'),
                        Text(
                          current ? 'Hazırlık bilgisi: güncel' : 'Hazırlık bilgisi eski; önceki kontrol şimdi hazır olduğun anlamına gelmez.',
                        ),
                      ] else
                        const Text(
                          'Bu değerlendirme için güncel hazırlık kaynağı yok.',
                        ),
                      const Text(
                        'Araç, parça, ekipman ve diğer ön koşullar',
                        style: TextStyle(fontSize: 20),
                      ),
                      if (r.conditions.isEmpty)
                        const Text(
                          'Hazırlık koşulları eksik. Boş liste hazır sayılmaz.',
                        ),
                      for (final c in r.conditions) ...[
                        Text(
                          '${c.importance.label}: ${c.label}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Durum: ${verified(c)
                              ? "Doğrulandı"
                              : c.state == PreparationConditionState.verified
                              ? "Doğrulama güncel veya bu koşula ait değil"
                              : c.state.label}',
                        ),
                        Text('Neden önemli: ${c.reason}'),
                        if (!verified(c)) ...[
                          Text('Eksikliği giderme yolu: ${c.remediation}'),
                          if (c.importance == PreparationImportance.optional)
                            const Text(
                              'Bu kalem isteğe bağlıdır; eksikliği tek başına zorunlu koşul yerine geçmez.',
                            )
                          else
                            const Text(
                              'Bu zorunlu koşul yeniden doğrulanmadan işe başlanmaz.',
                            ),
                          _Action(
                            label: '${c.label}: yeniden kontrol iste',
                            onPressed: controlsEnabled
                                ? () => recheck(ReadinessCheckKind.fresh, c.id)
                                : null,
                          ),
                        ],
                        if (c.evidence != null &&
                            c.evidence!.matches(this.context, r.revision, c.id))
                          Text(
                            'Koşul kaynağı: ${c.evidence!.source} · ${c.evidence!.version} · ${c.evidence!.location} · ${c.evidence!.checkedAt}',
                          ),
                      ],
                      const Text(
                        'İşten önce güvenlik ve ortam koşulları',
                        style: TextStyle(fontSize: 20),
                      ),
                      if (r.risks.isEmpty)
                        const Text(
                          'Güvenlik ve ortam değerlendirmesi eksik; işe başlama kapalı.',
                        ),
                      for (final risk in r.risks) ...[
                        Text('Risk: ${risk.risk}'),
                        Text('Önleme: ${risk.prevention}'),
                        Text('Durma koşulu: ${risk.stopCondition}'),
                      ],
                    ] else
                      const Text(
                        'Hazırlık bilgisi eksik veya bu motosiklet ve rehberle eşleşmiyor. Güncel kontrol iste; eski sonucu doğru sayma.',
                      ),
                    Semantics(
                      liveRegion: true,
                      child: Text(
                        ready
                            ? hold
                                  ? 'Güncel kontrol tamamlandı; hazırlık ekranında sonucu yeniden gözden geçir.'
                                  : 'Uygulamaya hazır'
                            : 'İşe başlama kapalı; eksik veya güncel olmayan koşulları yeniden kontrol ettir.',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    if (busy)
                      const Text(
                        'Kontrol sürüyor; sonuç gelmeden işe başlama.',
                      ),
                    if (errorMessage != null)
                      Semantics(liveRegion: true, child: Text(errorMessage!)),
                    if (ready && !hold) ...[
                      const Text(
                        'Bu sonuç başarı garantisi değildir. İş sırasında yeni risk veya uyuşmazlık çıkarsa durup yeniden kontrol gerekir.',
                      ),
                      _Action(
                        label: 'Rehberi başlat',
                        onPressed: onStartRequested == null
                            ? null
                            : () => onStartRequested!(r),
                      ),
                      if (onStartRequested == null)
                        const Text('Rehber şu anda başlatılamıyor.'),
                    ] else if (ready && hold) ...[
                      _Action(
                        label: 'Hazırlık ekranına dön',
                        onPressed: onPreparationRequested == null
                            ? null
                            : () => onPreparationRequested!(r),
                      ),
                      if (onPreparationRequested == null)
                        const Text('Hazırlık ekranı şu anda açılamıyor.'),
                    ],
                    _Action(
                      label: 'Güncel hazırlık kontrolü iste',
                      onPressed: controlsEnabled
                          ? () => recheck(ReadinessCheckKind.fresh, null)
                          : null,
                    ),
                    const Text(
                      'Eksik bilgiyi yeni fotoğraf, ölçüm veya başka bir kontrolle destekleyip yeniden değerlendirme isteyebilirsin. Bunlar doğrulama isteğidir; geçiş izni değildir.',
                    ),
                    _Action(
                      label: 'Fotoğrafla yeniden kontrol iste',
                      onPressed: controlsEnabled
                          ? () => recheck(ReadinessCheckKind.photo, null)
                          : null,
                    ),
                    _Action(
                      label: 'Ölçümle yeniden kontrol iste',
                      onPressed: controlsEnabled
                          ? () => recheck(ReadinessCheckKind.measurement, null)
                          : null,
                    ),
                    _Action(
                      label: 'Başka bir kontrolle yeniden değerlendir',
                      onPressed: controlsEnabled
                          ? () => recheck(ReadinessCheckKind.alternative, null)
                          : null,
                    ),
                    if (onRecheckRequested == null)
                      const Text(
                        'Yeniden kontrol şu anda kullanılamıyor; eksik koşul geçmiş sayılmaz.',
                      ),
                    const Text(
                      'Öğrenme görünümü yalnız bilgi içindir; motosiklette uygulama adımı değildir.',
                    ),
                    _Action(
                      label: 'Öğrenme görünümünü aç',
                      onPressed: busy || onTeachingRequested == null
                          ? null
                          : () => onTeachingRequested!(this.context),
                    ),
                    if (onTeachingRequested == null)
                      const Text('Öğrenme görünümü şu anda açılamıyor.'),
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
