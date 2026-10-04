import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

String _required(String value) {
  final result = value.trim();
  if (result.isEmpty)
    throw ArgumentError('Boş bağlam veya kaynak kullanılamaz.');
  return result;
}

/// Yalnız çağıranın sunum bağlamı; gerçek motosiklet veya rehber yaratmaz.
class VariantContext {
  VariantContext({
    required String motorcycleId,
    required String guideId,
    required String contextRevision,
    required String motorcycleLabel,
    required String guideLabel,
  }) : motorcycleId = _required(motorcycleId),
       guideId = _required(guideId),
       contextRevision = _required(contextRevision),
       motorcycleLabel = _required(motorcycleLabel),
       guideLabel = _required(guideLabel);
  final String motorcycleId;
  final String guideId;
  final String contextRevision;
  final String motorcycleLabel;
  final String guideLabel;

  bool matches(VariantContext other) =>
      motorcycleId == other.motorcycleId &&
      guideId == other.guideId &&
      contextRevision == other.contextRevision;
}

class DistinctionOption {
  DistinctionOption({required String id, required String label})
    : id = _required(id),
      label = _required(label);
  final String id;
  final String label;
}

/// Tek anlamlı soru; seçenek ve gözlem yönergesini gerçek kaynak sağlar.
class DistinctionQuestion {
  DistinctionQuestion({
    required this.context,
    required String id,
    required String revision,
    required String prompt,
    required String observationHint,
    required List<DistinctionOption> options,
  }) : id = _required(id),
       revision = _required(revision),
       prompt = _required(prompt),
       observationHint = _required(observationHint),
       options = List.unmodifiable(options) {
    if (options.isEmpty ||
        options.map((o) => o.id).toSet().length != options.length) {
      throw ArgumentError('Soru için ayrı kimlikli seçenekler gerekli.');
    }
  }
  final VariantContext context;
  final String id;
  final String revision;
  final String prompt;
  final String observationHint;
  final List<DistinctionOption> options;
}

/// Cevap kullanıcı beyanıdır; null seçenek açık belirsizliktir, fit kararı değil.
class DistinctionAnswerRequest {
  const DistinctionAnswerRequest({
    required this.question,
    required this.option,
  });
  final DistinctionQuestion question;
  final DistinctionOption? option;
}

class VariantDistinctionView extends StatelessWidget {
  const VariantDistinctionView({
    super.key,
    required this.context,
    required this.question,
    required this.busy,
    required this.errorMessage,
    required this.onAnswerRequested,
    required this.onPhotoRequested,
    required this.onEditRequested,
  });
  final VariantContext context;
  final DistinctionQuestion? question;
  final bool busy;
  final String? errorMessage;
  final ValueChanged<DistinctionAnswerRequest>? onAnswerRequested;
  final ValueChanged<DistinctionQuestion>? onPhotoRequested;
  final ValueChanged<VariantContext>? onEditRequested;

  @override
  Widget build(BuildContext context) {
    final q = question;
    final usable = q != null && this.context.matches(q.context);
    void answer(DistinctionOption? option) => onAnswerRequested!(
      DistinctionAnswerRequest(question: q!, option: option),
    );
    return _Page(
      children: [
        const Text('Bir ayrımı netleştirelim', style: TextStyle(fontSize: 24)),
        ..._context(this.context),
        const Text(
          'Bir seferde tek ayrımı kontrol et. Emin değilsen bunu söyle; yakın yıl veya model tahmini yapma.',
        ),
        if (usable) ...[
          Text(q.prompt, style: const TextStyle(fontSize: 20)),
          Text(q.observationHint),
          for (final option in q.options)
            _Action(
              key: ValueKey('option-${option.id}'),
              label: option.label,
              onPressed: busy || onAnswerRequested == null
                  ? null
                  : () => answer(option),
            ),
          _Action(
            label: 'Emin değilim',
            onPressed: busy || onAnswerRequested == null
                ? null
                : () => answer(null),
          ),
          const Text('Yanıtın uygunluğu kendiliğinden doğrulamaz.'),
          const Text(
            'Fotoğraf yalnız destekleyici bilgidir; tek başına teknik doğrulama değildir.',
          ),
          _Action(
            label: 'Fotoğrafla destekle',
            onPressed: busy || onPhotoRequested == null
                ? null
                : () => onPhotoRequested!(q),
          ),
          if (onPhotoRequested == null)
            const Text('Fotoğraf ekleme şu anda kullanılamıyor.'),
          if (onAnswerRequested == null)
            const Text('Yanıt gönderme şu anda kullanılamıyor.'),
        ] else
          const Text(
            'Bu motosiklet ve rehber için güncel ayrım sorusu yok. Uygunluk belirlenemedi; bilgilerini kontrol edip yeniden dene.',
          ),
        if (busy)
          const Text('Yanıt kontrol ediliyor. Henüz uygunluk sonucu yok.'),
        if (errorMessage != null)
          Semantics(liveRegion: true, child: Text(errorMessage!)),
        _Action(
          label: 'Motosiklet bilgilerini düzenle',
          onPressed: busy || onEditRequested == null
              ? null
              : () => onEditRequested!(this.context),
        ),
        if (onEditRequested == null)
          const Text('Bilgi düzenleme şu anda kullanılamıyor.'),
      ],
    );
  }
}

enum FitDisplayStatus { confirmed, missingDistinction }

/// Çağıranın kaynak ve güncellik beyanı. E1 gerçek kaynağı doğrulamaz.
class FitEvidenceReference {
  FitEvidenceReference({
    required this.context,
    required String source,
    required String version,
    required String location,
    required String checkedAt,
    required this.current,
  }) : source = _required(source),
       version = _required(version),
       location = _required(location),
       checkedAt = _required(checkedAt);
  final VariantContext context;
  final String source;
  final String version;
  final String location;
  final String checkedAt;
  final bool current;
}

class FitPresentation {
  FitPresentation({
    required this.context,
    required this.status,
    required String reason,
    required this.evidence,
  }) : reason = _required(reason);
  final VariantContext context;
  final FitDisplayStatus status;
  final String reason;
  final FitEvidenceReference? evidence;
}

/// Yalnız güncel çağıran sonucunu sunar; uygulama yetkisi veya readiness üretmez.
class MotorcycleFitView extends StatelessWidget {
  const MotorcycleFitView({
    super.key,
    required this.context,
    required this.result,
    required this.busy,
    required this.errorMessage,
    required this.onPreparationRequested,
    required this.onDistinctionRequested,
    required this.onTeachingRequested,
    required this.onEditRequested,
  });
  final VariantContext context;
  final FitPresentation? result;
  final bool busy;
  final String? errorMessage;
  final ValueChanged<VariantContext>? onPreparationRequested;
  final ValueChanged<VariantContext>? onDistinctionRequested;
  final ValueChanged<VariantContext>? onTeachingRequested;
  final ValueChanged<VariantContext>? onEditRequested;

  @override
  Widget build(BuildContext context) {
    final r = result;
    final sameContext = r != null && this.context.matches(r.context);
    final e = sameContext ? r.evidence : null;
    final currentEvidence =
        e != null && e.current && this.context.matches(e.context);
    final confirmed =
        sameContext &&
        r.status == FitDisplayStatus.confirmed &&
        currentEvidence &&
        !busy &&
        errorMessage == null;
    return _Page(
      children: [
        const Text('Motosiklete uygunluk', style: TextStyle(fontSize: 24)),
        ..._context(this.context),
        Semantics(
          liveRegion: true,
          child: Text(
            confirmed ? 'Uygunluk doğrulandı' : 'Ayrım henüz yeterli değil',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        if (sameContext) Text(r.reason),
        if (e != null && this.context.matches(e.context)) ...[
          Text('Kaynak: ${e.source}'),
          Text('Sürüm: ${e.version} · ${e.location}'),
          Text('Kontrol zamanı: ${e.checkedAt}'),
          Text(
            e.current
                ? 'Kaynak durumu: güncel'
                : 'Kaynak durumu: güncel değil; yeniden kontrol gerekli',
          ),
        ] else
          const Text('Bu motosiklet ve rehber için güncel kaynak bilgisi yok.'),
        if (confirmed) ...[
          const Text(
            'Bu sonuç yalnız bu motosiklet ve rehberin uygunluğunu gösterir. İşin başarılı olacağını veya şimdi hazır olduğunu garanti etmez.',
          ),
          const Text(
            'Hazırlık ve gerekli güvenlik kontrolleri ayrıca tamamlanmalı.',
          ),
          _Action(
            label: 'Hazırlığı görüntüle',
            onPressed: onPreparationRequested == null
                ? null
                : () => onPreparationRequested!(this.context),
          ),
          if (onPreparationRequested == null)
            const Text('Hazırlık görünümü şu anda açılamıyor.'),
          _Action(
            label: 'Ayrımı yeniden gözden geçir',
            onPressed: onDistinctionRequested == null
                ? null
                : () => onDistinctionRequested!(this.context),
          ),
        ] else ...[
          const Text(
            'Bilgi yetersiz veya güncelliği doğrulanmadı. Bu motosiklete özel uygulama kapalı. Gözlenebilir ayrımı yeniden kontrol et; yakın yılın adımlarını kullanma.',
          ),
          if (busy) const Text('Uygunluk kontrol ediliyor; sonucu bekle.'),
          _Action(
            label: 'Ayrımı yeniden çöz',
            onPressed: busy || onDistinctionRequested == null
                ? null
                : () => onDistinctionRequested!(this.context),
          ),
          const Text(
            'Öğrenme görünümü yalnız bilgi içindir; motosiklette uygulama adımı değildir.',
          ),
          _Action(
            label: 'Öğrenme görünümünü aç',
            onPressed: onTeachingRequested == null
                ? null
                : () => onTeachingRequested!(this.context),
          ),
          if (onTeachingRequested == null)
            const Text('Öğrenme görünümü şu anda açılamıyor.'),
          _Action(
            label: 'Motosiklet bilgilerini düzenle',
            onPressed: busy || onEditRequested == null
                ? null
                : () => onEditRequested!(this.context),
          ),
          if (onEditRequested == null)
            const Text('Bilgi düzenleme şu anda kullanılamıyor.'),
        ],
        if (onDistinctionRequested == null)
          const Text('Ayrım kontrolü şu anda açılamıyor.'),
        if (errorMessage != null)
          Semantics(liveRegion: true, child: Text(errorMessage!)),
      ],
    );
  }
}

List<Widget> _context(VariantContext context) => [
  Text('Motosikletim: ${context.motorcycleLabel}'),
  Text('Rehber: ${context.guideLabel}'),
];

class _Page extends StatelessWidget {
  const _Page({required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children
            .map(
              (c) =>
                  Padding(padding: const EdgeInsets.only(bottom: 8), child: c),
            )
            .toList(),
      ),
    ),
  );
}

class _Action extends StatefulWidget {
  const _Action({super.key, required this.label, required this.onPressed});
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
    onShowFocusHighlight: (value) => setState(() => focused = value),
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
