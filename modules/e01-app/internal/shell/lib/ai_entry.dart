import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

String _required(String value) {
  if (value.trim().isEmpty) throw ArgumentError('Boş kimlik veya metin.');
  return value;
}

String _identity(Iterable<String> values) => values
    .map(
      (v) =>
          '${v.length}:${v.codeUnits.map((c) => c.toRadixString(16).padLeft(4, '0')).join()}',
    )
    .join('|');

enum AiEntryPath {
  knownTask('Bir iş yapmak istiyorum', 'SCR-009'),
  symptom('Motorda bir sorun var', 'SCR-019');

  const AiEntryPath(this.label, this.target);
  final String label;
  final String target;
}

enum AiEntryState { ready, loading, unknown, held, safetyHold, failed }

enum AiEntryReferenceState { current, stale, unknown, held }

enum AiEntryIntentKind { knownTask, symptom, garage, support }

/// Seçili yerel bağlam; hesap, uygunluk veya fiziksel çalışma izni değildir.
class AiEntryScope {
  AiEntryScope({
    required String localId,
    required String localRevision,
    required String motorcycleId,
    required String motorcycleRevision,
  }) : localId = _required(localId),
       localRevision = _required(localRevision),
       motorcycleId = _required(motorcycleId),
       motorcycleRevision = _required(motorcycleRevision);

  final String localId, localRevision, motorcycleId, motorcycleRevision;
  String get identity =>
      _identity([localId, localRevision, motorcycleId, motorcycleRevision]);
}

/// Dış sınırın kaynak işareti. Bu sınıf gerçek üretici veya imza doğrulayıcı değil.
class AiEntryReference {
  AiEntryReference({
    required this.scope,
    required String requestId,
    required String subjectId,
    required String purpose,
    required String source,
    required String version,
    required String checkedAt,
    required String reason,
    required this.state,
    required this.confirmed,
  }) : requestId = _required(requestId),
       subjectId = _required(subjectId),
       purpose = _required(purpose),
       source = _required(source),
       version = _required(version),
       checkedAt = _required(checkedAt),
       reason = _required(reason);

  final AiEntryScope scope;
  final String requestId,
      subjectId,
      purpose,
      source,
      version,
      checkedAt,
      reason;
  final AiEntryReferenceState state;
  final bool confirmed;

  bool matches(AiEntrySnapshot snapshot, String expectedPurpose) =>
      state == AiEntryReferenceState.current &&
      confirmed &&
      scope.identity == snapshot.scope?.identity &&
      requestId == snapshot.requestId &&
      subjectId == snapshot.subjectId &&
      purpose == expectedPurpose;

  String get identity => _identity([
    scope.identity,
    requestId,
    subjectId,
    purpose,
    source,
    version,
    checkedAt,
    reason,
    state.name,
    '$confirmed',
  ]);
}

/// Immutable E1 girdisi. E9 önerir, E3 doğrular; burada hiçbir üretici çalışmaz.
class AiEntrySnapshot {
  AiEntrySnapshot({
    required String localSubject,
    required String requestId,
    required String documentId,
    required String documentRevision,
    required this.state,
    required this.offline,
    this.scope,
    this.motorcycleLabel,
    this.reason,
    this.consequence,
    this.immediateAction,
    this.reentry,
    this.contextReference,
    this.statusReference,
    Map<AiEntryPath, AiEntryReference> routes = const {},
  }) : localSubject = _required(localSubject),
       requestId = _required(requestId),
       documentId = _required(documentId),
       documentRevision = _required(documentRevision),
       routes = Map.unmodifiable(routes) {
    for (final text in [
      motorcycleLabel,
      reason,
      consequence,
      immediateAction,
      reentry,
    ]) {
      if (text != null) _required(text);
    }
  }

  final String localSubject, requestId, documentId, documentRevision;
  final AiEntryScope? scope;
  final String? motorcycleLabel, reason, consequence, immediateAction, reentry;
  final AiEntryState state;
  final bool offline;
  final AiEntryReference? contextReference, statusReference;
  final Map<AiEntryPath, AiEntryReference> routes;

  String get subjectId => _identity([
    localSubject,
    requestId,
    documentId,
    documentRevision,
    scope?.identity ?? '',
    motorcycleLabel ?? '',
    state.name,
    '$offline',
    reason ?? '',
    consequence ?? '',
    immediateAction ?? '',
    reentry ?? '',
  ]);

  String get presentationId => _identity([
    subjectId,
    contextReference?.identity ?? '',
    statusReference?.identity ?? '',
    for (final path in AiEntryPath.values) routes[path]?.identity ?? '',
  ]);

  bool get contextReadable =>
      !offline &&
      scope != null &&
      motorcycleLabel != null &&
      (contextReference?.matches(this, 'ai-entry:context') ?? false);

  bool get statusReadable =>
      !offline &&
      scope != null &&
      (statusReference?.matches(this, 'ai-entry:status') ?? false);

  bool canRequest(AiEntryPath path) =>
      contextReadable &&
      state == AiEntryState.ready &&
      AiEntryPath.values.every(
        (p) => routes[p]?.matches(this, 'ai-entry:${p.target}') ?? false,
      );

  bool get completeStop =>
      statusReadable &&
      reason != null &&
      consequence != null &&
      immediateAction != null &&
      reentry != null;
}

/// Niyet gerçekleşmiş yönlendirme, teknik karar veya çalışma izni değildir.
class AiEntryIntent {
  const AiEntryIntent({
    required this.kind,
    required this.localSubject,
    required this.requestId,
    required this.subjectId,
    required this.scope,
    required this.target,
  });

  final AiEntryIntentKind kind;
  final String localSubject, requestId, subjectId;
  final AiEntryScope? scope;
  final String? target;
}

class AiEntryView extends StatefulWidget {
  const AiEntryView({
    super.key,
    required this.snapshot,
    required this.onIntent,
  });
  final AiEntrySnapshot snapshot;
  final ValueChanged<AiEntryIntent>? onIntent;

  @override
  State<AiEntryView> createState() => _AiEntryViewState();
}

class _AiEntryViewState extends State<AiEntryView> {
  final Set<String> _sentRequests = {};
  bool _helpOpen = false;
  String? _ackPresentation;
  String? _ackText;

  String _requestKey(AiEntrySnapshot s) =>
      _identity([s.localSubject, s.requestId]);

  @override
  void didUpdateWidget(AiEntryView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.snapshot.presentationId != widget.snapshot.presentationId ||
        oldWidget.onIntent != widget.onIntent) {
      _helpOpen = false;
      _ackPresentation = null;
      _ackText = null;
    }
  }

  void _request(
    AiEntrySnapshot captured,
    ValueChanged<AiEntryIntent>? handler,
    AiEntryIntentKind kind,
  ) {
    final current = widget.snapshot;
    if (handler == null ||
        !identical(handler, widget.onIntent) ||
        captured.presentationId != current.presentationId)
      return;
    final path = switch (kind) {
      AiEntryIntentKind.knownTask => AiEntryPath.knownTask,
      AiEntryIntentKind.symptom => AiEntryPath.symptom,
      _ => null,
    };
    if (path != null &&
        (!current.canRequest(path) ||
            _sentRequests.contains(_requestKey(current)))) {
      return;
    }
    final safe = path == null;
    setState(() {
      if (!safe) _sentRequests.add(_requestKey(current));
      _ackPresentation = current.presentationId;
      _ackText = safe
          ? '${kind == AiEntryIntentKind.garage ? 'Garaj’a' : 'Destek yoluna'} geçiş isteği gönderildi. Bu girişin durumu değişmedi; geçiş henüz doğrulanmış değil.'
          : 'Seçim isteği gönderildi. Sonraki akış henüz açılmış sayılmaz.';
    });
    handler(
      AiEntryIntent(
        kind: kind,
        localSubject: safe ? '' : current.localSubject,
        requestId: safe ? '' : current.requestId,
        subjectId: safe ? '' : current.subjectId,
        scope: safe ? null : current.scope,
        target: path?.target,
      ),
    );
  }

  Widget _text(
    String text, {
    double size = 16,
    bool heading = false,
    bool bold = false,
  }) => Semantics(
    header: heading,
    child: Text(
      text,
      style: TextStyle(
        fontSize: size,
        height: 1.35,
        color: const Color(0xFF101827),
        fontWeight: bold || heading ? FontWeight.w700 : FontWeight.w400,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final s = widget.snapshot, handler = widget.onIntent;
    final sent = _sentRequests.contains(_requestKey(s));
    final blocked =
        handler == null ||
        s.state != AiEntryState.ready ||
        !s.contextReadable ||
        AiEntryPath.values.any((p) => !s.canRequest(p));
    final blockedTitle = handler == null || !s.statusReadable
        ? 'Giriş şu anda açılamıyor'
        : switch (s.state) {
            AiEntryState.loading => 'Giriş bilgisi kontrol ediliyor',
            AiEntryState.held => 'Giriş değerlendirmesi bekletiliyor',
            AiEntryState.failed => 'Giriş bilgisi alınamadı',
            AiEntryState.unknown => 'Giriş durumu doğrulanmadı',
            AiEntryState.safetyHold =>
              s.completeStop
                  ? 'Güvenlik nedeniyle duruldu'
                  : 'Güvenlik açıklaması henüz tamamlanmadı',
            AiEntryState.ready => 'Giriş şu anda açılamıyor',
          };
    final blockedDescription = handler == null
        ? 'Bu girişte seçim şu anda gönderilemiyor. Garaj ve destek geçişleri de burada kapalı.'
        : s.offline
        ? 'Çevrimdışıyken güncel yönlendirme doğrulanamaz.'
        : !s.statusReadable
        ? 'Bağlam veya yönlendirme için güncel kaynak yok.'
        : switch (s.state) {
            AiEntryState.loading => 'Kontrol tamamlanmadan seçim gönderilmez.',
            AiEntryState.held =>
              'Bekletme henüz kaldırılmadı; yeni değerlendirme sonucu gerekir.',
            AiEntryState.failed =>
              'Bilgi alma işlemi tamamlanmadı; başarılı sonuç varsayılmaz.',
            AiEntryState.unknown =>
              'Güncel giriş durumu bilinmiyor; seçim gönderilmez.',
            AiEntryState.safetyHold => 'Sebep ve yeniden giriş koşullarının güncel açıklaması eksik. İşleme başlama.',
            AiEntryState.ready =>
              !s.contextReadable
                  ? 'Motosiklet bağlamı güncel olarak doğrulanamadı.'
                  : 'Seçeneklerin güncel yönlendirmesi doğrulanamadı.',
          };
    return ColoredBox(
      color: const Color(0xFFF8FAFC),
      child: SafeArea(
        child: FocusTraversalGroup(
          policy: WidgetOrderTraversalPolicy(),
          child: SingleChildScrollView(
            key: const ValueKey('ai-entry-scroll'),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _text('AI Usta', size: 22, heading: true),
                      const SizedBox(height: 14),
                      _text(
                        s.contextReadable
                            ? 'Motosikletim: ${s.motorcycleLabel}'
                            : 'Motosiklet bağlamı yeniden doğrulanmalı.',
                      ),
                      _EntryButton(
                        label: handler == null
                            ? 'Garaj geçişi burada kapalı'
                            : 'Bağlamı Garaj’da yönet',
                        quiet: true,
                        onPressed: handler == null
                            ? null
                            : () => _request(
                                s,
                                handler,
                                AiEntryIntentKind.garage,
                              ),
                      ),
                      const SizedBox(height: 18),
                      _text('Nasıl yardımcı olayım?', size: 32, heading: true),
                      const SizedBox(height: 24),
                      for (final path in AiEntryPath.values) ...[
                        _EntryButton(
                          key: ValueKey('ai-entry-${path.name}'),
                          label: path.label,
                          onPressed:
                              handler != null && !sent && s.canRequest(path)
                              ? () => _request(s, handler, switch (path) {
                                  AiEntryPath.knownTask =>
                                    AiEntryIntentKind.knownTask,
                                  AiEntryPath.symptom =>
                                    AiEntryIntentKind.symptom,
                                })
                              : null,
                        ),
                        const SizedBox(height: 12),
                      ],
                      if (blocked) ...[
                        const SizedBox(height: 8),
                        _text(blockedTitle, heading: true, size: 22),
                        const SizedBox(height: 8),
                        if (s.completeStop) ...[
                          _text('Sebep: ${s.reason}'),
                          _text('Sonucu: ${s.consequence}'),
                          _text('Şimdi: ${s.immediateAction}'),
                          _text('Yeniden giriş: ${s.reentry}'),
                        ] else ...[
                          _text(blockedDescription),
                          _text(
                            handler == null
                                ? 'Normal iş akışı açılmaz. Giriş yeniden kullanılabilir olduğunda güncel bilgilerle tekrar dene.'
                                : 'Normal iş akışı açılmaz. Garaj’da bağlamı değerlendir veya destek yolunu kullan; sonra güncel kaynakla yeniden dene.',
                          ),
                        ],
                        _EntryButton(
                          label: handler == null
                              ? 'Destek geçişi burada kapalı'
                              : 'Destek yoluna git',
                          quiet: true,
                          onPressed: handler == null
                              ? null
                              : () => _request(
                                  s,
                                  handler,
                                  AiEntryIntentKind.support,
                                ),
                        ),
                      ],
                      if (_ackPresentation == s.presentationId &&
                          _ackText != null)
                        Semantics(liveRegion: true, child: _text(_ackText!)),
                      const SizedBox(height: 18),
                      _EntryButton(
                        label: _helpOpen
                            ? 'Açıklamayı kapat'
                            : 'Hangisini seçmeliyim?',
                        quiet: true,
                        onPressed: () => setState(() => _helpOpen = !_helpOpen),
                      ),
                      if (_helpOpen) ...[
                        _text(
                          'Yapacağın işi biliyorsan ilk yolu seç. Önce iş bulunur; ardından Rehber kapsamı ve uygunluk ekranında motosiklete uygunluğu, Hazırlık ekranında hazırlık koşulları değerlendirilir.',
                        ),
                        const SizedBox(height: 12),
                        _text(
                          'Bir belirti ya da arıza şüphen varsa ikinci yolu seç. Belirti ve gözlemler toplanır; yeterli kanıt yoksa sonuç belirsiz kalabilir. Bu seçim kesin teşhis veya parça değiştirme kararı değildir.',
                        ),
                        const SizedBox(height: 12),
                        _text(
                          'Bu giriş tamir adımı veya serbest metin sohbeti sunmaz. Seçim isteği uygulama izni değildir; uygunluk, hazırlık ve güvenlik ayrıca değerlendirilir. AI önerisi doğrulanmış resmî rehberin yerine geçmez. Hesap veya profil zorunlu değildir.',
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EntryButton extends StatefulWidget {
  const _EntryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.quiet = false,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool quiet;

  @override
  State<_EntryButton> createState() => _EntryButtonState();
}

class _EntryButtonState extends State<_EntryButton> {
  bool _focused = false;
  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;
    return FocusableActionDetector(
      enabled: enabled,
      onShowFocusHighlight: (value) => setState(() => _focused = value),
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
        label: widget.label,
        button: true,
        enabled: enabled,
        onTap: widget.onPressed,
        excludeSemantics: true,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onPressed,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: widget.quiet
                  ? const Color(0xFFF8FAFC)
                  : const Color(0xFFFFFFFF),
              border: Border.all(
                width: _focused ? 2 : 1,
                color: _focused
                    ? const Color(0xFF0E5BD8)
                    : widget.quiet
                    ? const Color(0xFFF8FAFC)
                    : const Color(0xFF596579),
              ),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 52),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                child: Text(
                  widget.label,
                  style: TextStyle(
                    color: enabled
                        ? const Color(0xFF0E5BD8)
                        : const Color(0xFF596579),
                    fontSize: widget.quiet ? 16 : 20,
                    height: 1.35,
                    fontWeight: widget.quiet
                        ? FontWeight.w400
                        : FontWeight.w600,
                    decoration: widget.quiet
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
