import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'entitlement_gate.dart';
import 'history.dart';

String _required(String value) {
  final result = value.trim();
  if (result.isEmpty) throw ArgumentError('Seçim bilgisi boş olamaz.');
  return result;
}

String _token(String value) =>
    value.codeUnits.length.toString() +
    ':' +
    value.codeUnits.map((u) => u.toRadixString(16).padLeft(4, '0')).join();

String _history(HistoryScope s) => [
  s.motorcycleId,
  s.contextRevision,
  s.catalogId,
  s.catalogRevision,
].map(_token).join('/');

String _reference(HistoryReference? r) => r == null
    ? 'missing'
    : [
        _history(r.scope),
        r.requestId,
        r.purpose,
        r.subjectId,
        r.source,
        r.version,
        r.location,
        r.checkedAt,
        r.reason,
        r.current.toString(),
        r.state.name,
      ].map(_token).join('/');

/// Hesap ve seçimin tam kimliği. Bir motosiklet değişimi yeni hak yaratmaz.
class ReplacementScope {
  ReplacementScope({
    required String accountId,
    required this.history,
    required String selectionId,
    required String selectionRevision,
    required String guideId,
    required String guideVersion,
  }) : accountId = _required(accountId),
       selectionId = _required(selectionId),
       selectionRevision = _required(selectionRevision),
       guideId = _required(guideId),
       guideVersion = _required(guideVersion);
  final String accountId, selectionId, selectionRevision, guideId, guideVersion;
  final HistoryScope history;
  String get subject => [
    accountId,
    _history(history),
    selectionId,
    selectionRevision,
    guideId,
    guideVersion,
  ].map(_token).join('/');
  bool matches(ReplacementScope other) => subject == other.subject;
}

enum ReplacementPurpose { preStepCorrection, replacementSelection }

enum ReplacementDecision { unknown, held, denied, mayRequest }

enum ReplacementPhysicalStart { unknown, notStarted, started }

enum ReplacementCause {
  unknown,
  wrongSelection,
  withdrawnWithoutUserFault,
  other,
}

enum ReplacementPhase { idle, submitting, failed, unknown, received }

enum ReplacementEffect {
  motorcycle,
  source,
  authorization,
  policy,
  operationIntent,
  audit,
}

enum ReplacementAction { request, refresh, read, garage, support }

/// Dış E3/E5 üreticisinin sunum girdisi. E1 bu veriden gerçek hak üretmez.
/// Üretim sağlayıcısı bağlı değilse plan ve referanslar yok/HELD kalmalıdır.
class ReplacementPlan {
  ReplacementPlan({
    required this.scope,
    required String id,
    required String revision,
    required this.purpose,
    required this.decision,
    required this.physicalStart,
    required this.cause,
    required String guideLabel,
    required String reason,
  }) : id = _required(id),
       revision = _required(revision),
       guideLabel = _required(guideLabel),
       reason = _required(reason);
  final ReplacementScope scope;
  final String id, revision, guideLabel, reason;
  final ReplacementPurpose purpose;
  final ReplacementDecision decision;
  final ReplacementPhysicalStart physicalStart;
  final ReplacementCause cause;
  String get subject => [
    scope.subject,
    scope.history.motorcycleLabel,
    id,
    revision,
    purpose.name,
    decision.name,
    physicalStart.name,
    cause.name,
    guideLabel,
    reason,
  ].map(_token).join('/');
}

class ReplacementSnapshot {
  ReplacementSnapshot({
    required this.scope,
    required String requestId,
    required this.purpose,
    this.plan,
    this.authority,
    required Map<HistoryReadDimension, HistoryReference?> readDimensions,
    required Map<ReplacementEffect, HistoryReference?> effects,
    this.preserved,
    this.preservedAccountReference,
    this.offline = false,
    this.phase = ReplacementPhase.idle,
  }) : requestId = _required(requestId),
       readDimensions = Map.unmodifiable(readDimensions),
       effects = Map.unmodifiable(effects);
  final ReplacementScope scope;
  final String requestId;
  final ReplacementPurpose purpose;
  final ReplacementPlan? plan;
  final HistoryReference? authority, preservedAccountReference;
  final Map<HistoryReadDimension, HistoryReference?> readDimensions;
  final Map<ReplacementEffect, HistoryReference?> effects;
  final EntitlementSnapshot? preserved;
  final bool offline;
  final ReplacementPhase phase;

  bool get readable {
    final p = plan;
    return p != null &&
        p.scope.matches(scope) &&
        p.purpose == purpose &&
        (authority?.confirmed(
              scope.history,
              requestId,
              'replacement-decision',
              p.subject,
            ) ??
            false) &&
        HistoryReadDimension.values.every(
          (d) =>
              readDimensions[d]?.confirmed(
                scope.history,
                requestId,
                'replacement-read',
                p.subject + '/' + d.name,
              ) ??
              false,
        );
  }

  /// Bu yalnız isteği sunma koşuludur, hak/seçim yazımı veya bakım izni değildir.
  bool get requestAllowed {
    final p = plan;
    if (!readable ||
        offline ||
        phase != ReplacementPhase.idle ||
        p!.decision != ReplacementDecision.mayRequest)
      return false;
    final suitable = switch (purpose) {
      ReplacementPurpose.preStepCorrection =>
        p.physicalStart == ReplacementPhysicalStart.notStarted &&
            p.cause == ReplacementCause.wrongSelection,
      ReplacementPurpose.replacementSelection =>
        p.cause == ReplacementCause.withdrawnWithoutUserFault,
    };
    return suitable &&
        ReplacementEffect.values.every(
          (d) =>
              effects[d]?.confirmed(
                scope.history,
                requestId,
                'replacement-request',
                p.subject + '/' + d.name,
              ) ??
              false,
        );
  }

  String get preservedAccountSubject =>
      scope.subject +
      '/preserved-account/' +
      (preserved?.preservedSubject ?? 'missing');

  /// Eski erişim kendi guardlarıyla ve ayrıca aynı hesapla bağlanır.
  bool pathAllowed(EntitlementPath path) {
    final p = preserved;
    return p != null &&
        p.scope.matches(scope.history) &&
        (preservedAccountReference?.confirmed(
              scope.history,
              requestId,
              'replacement-preserved-account',
              preservedAccountSubject,
            ) ??
            false) &&
        p.pathAllowed(path);
  }

  String get intentKey =>
      scope.subject +
      '/' +
      _token(requestId) +
      '/' +
      purpose.name +
      '/' +
      _token(plan?.subject ?? 'missing');

  String get fingerprint {
    final p = preserved;
    return [
      intentKey,
      offline.toString(),
      phase.name,
      _reference(authority),
      ...HistoryReadDimension.values.map((d) => _reference(readDimensions[d])),
      ...ReplacementEffect.values.map((d) => _reference(effects[d])),
      _reference(preservedAccountReference),
      p == null ? 'missing' : _history(p.scope),
      p?.requestId ?? 'missing',
      ...HistoryReadDimension.values.map(
        (d) => _reference(p?.preservedReadDimensions[d]),
      ),
      ...EntitlementPath.values.map((d) => _reference(p?.paths[d])),
    ].map(_token).join('/');
  }
}

class ReplacementIntent {
  const ReplacementIntent({
    required this.action,
    required this.scope,
    required this.requestId,
    required this.purpose,
    required this.subjectId,
    this.path,
  });
  final ReplacementAction action;
  final ReplacementScope scope;
  final String requestId, subjectId;
  final ReplacementPurpose purpose;
  final EntitlementPath? path;
}

class ReplacementRightView extends StatefulWidget {
  const ReplacementRightView({
    super.key,
    required this.snapshot,
    this.onIntent,
  });
  final ReplacementSnapshot snapshot;
  final ValueChanged<ReplacementIntent>? onIntent;
  @override
  State<ReplacementRightView> createState() => _ReplacementRightState();
}

class _ReplacementRightState extends State<ReplacementRightView> {
  final Set<String> sent = {}, refreshed = {};
  int generation = 0;

  @override
  void didUpdateWidget(covariant ReplacementRightView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.snapshot.fingerprint != widget.snapshot.fingerprint ||
        oldWidget.onIntent != widget.onIntent) {
      generation++;
    }
  }

  VoidCallback? callback(ReplacementAction action, {EntitlementPath? path}) {
    final captured = widget.snapshot,
        handler = widget.onIntent,
        epoch = generation;
    bool allowed(ReplacementSnapshot s) => switch (action) {
      ReplacementAction.garage || ReplacementAction.support => true,
      ReplacementAction.read => path != null && s.pathAllowed(path),
      ReplacementAction.refresh =>
        !s.offline &&
            s.phase != ReplacementPhase.submitting &&
            !refreshed.contains(s.intentKey),
      ReplacementAction.request =>
        s.requestAllowed && !sent.contains(s.intentKey),
    };
    if (handler == null || !allowed(captured)) return null;
    return () {
      final s = widget.snapshot;
      if (epoch != generation ||
          handler != widget.onIntent ||
          captured.fingerprint != s.fingerprint ||
          !allowed(s))
        return;
      if (action == ReplacementAction.request) {
        setState(() => sent.add(s.intentKey));
      } else if (action == ReplacementAction.refresh) {
        setState(() => refreshed.add(s.intentKey));
      }
      handler(
        ReplacementIntent(
          action: action,
          scope: s.scope,
          requestId: s.requestId,
          purpose: s.purpose,
          path: path,
          subjectId: switch (action) {
            ReplacementAction.request => s.plan!.subject,
            ReplacementAction.read =>
              s.preservedAccountSubject + '/' + path!.name,
            ReplacementAction.refresh => s.scope.subject,
            _ => '',
          },
        ),
      );
    };
  }

  Widget text(
    String value, {
    double size = 16,
    bool heading = false,
    int level = 2,
  }) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Semantics(
      header: heading,
      headingLevel: heading ? level : null,
      child: Text(
        value,
        style: TextStyle(
          color: const Color(0xFF172033),
          fontSize: size,
          height: 1.45,
          fontWeight: heading ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
    ),
  );

  Widget button(
    String label,
    ReplacementAction action, {
    EntitlementPath? path,
    bool primary = false,
  }) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: _ReplacementButton(
      key: ValueKey('replacement-' + action.name + '-' + (path?.name ?? '')),
      label: label,
      primary: primary,
      onPressed: callback(action, path: path),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final s = widget.snapshot, p = s.plan;
    final readable = s.readable;
    final correction = s.purpose == ReplacementPurpose.preStepCorrection;
    final requestLabel = correction
        ? 'Yanlış seçimi düzeltmek için kontrol iste'
        : 'Yeniden seçim için kontrol iste';
    final title = correction
        ? 'Yanlış rehber seçimini düzeltme'
        : 'Yeniden rehber seçimi';
    final canSend =
        s.requestAllowed &&
        widget.onIntent != null &&
        !sent.contains(s.intentKey);
    final String statusTitle;
    if (!readable) {
      statusTitle = 'Güncel seçim bilgisi doğrulanamadı';
    } else if (canSend) {
      statusTitle = 'Kontrol isteği gönderebilirsin';
    } else if (sent.contains(s.intentKey)) {
      statusTitle = 'Kontrol isteği iletildi; sonuç bekleniyor';
    } else if (s.offline) {
      statusTitle = 'Yeni seçim talebi çevrimdışıyken kapalı';
    } else if (s.phase == ReplacementPhase.submitting) {
      statusTitle = 'Seçim kontrolü sürüyor';
    } else if (correction &&
        p!.physicalStart == ReplacementPhysicalStart.started) {
      statusTitle = 'Yanlış seçim düzeltmesi kapalı';
    } else if (widget.onIntent == null) {
      statusTitle = 'Yeni seçim talebi gönderilemiyor';
    } else if (p!.decision == ReplacementDecision.denied) {
      statusTitle = 'Yeni seçim talebi kapalı';
    } else {
      statusTitle = 'Yeni seçim talebi beklemede';
    }
    return ColoredBox(
      color: const Color(0xFFF8FAFC),
      child: SafeArea(
        child: FocusTraversalGroup(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      text(title, size: 32, heading: true, level: 1),
                      text(
                        'Bu ekran yalnız seçim talebi içindir; bakım başlatmaz.',
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3D6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            text(statusTitle, size: 18, heading: true),
                            if (readable) ...[
                              text(s.scope.history.motorcycleLabel, size: 18),
                              text('Seçili rehber: ' + p!.guideLabel),
                              text(
                                'Rehber sürümü: ' +
                                    s.scope.guideVersion +
                                    ' · Seçim sürümü: ' +
                                    s.scope.selectionRevision,
                              ),
                              text(p.reason),
                              text('Kaynak: ' + s.authority!.source),
                              text('Karar sürümü: ' + s.authority!.version),
                              text('Kaynak konumu: ' + s.authority!.location),
                              text('Kontrol zamanı: ' + s.authority!.checkedAt),
                            ] else
                              text(
                                'Özel motosiklet ve rehber ayrıntıları gösterilmiyor. Güncel kimlik ve okuma izni gerekir.',
                              ),
                          ],
                        ),
                      ),
                      text('İki farklı durum', size: 22, heading: true),
                      text(
                        'Yanlış rehber seçimi ilk fiziksel adımdan önce düzeltilebilir. '
                        'Başlangıç durumu bilinmiyorsa veya işe başlanmışsa bu düzeltme açılmaz.',
                      ),
                      text(
                        'Rehber senin hatan olmadan geri çekilip kullanılamaz hâle geldiyse '
                        'yeniden seçim hakkı sunucu kararına göre açılabilir. Kendiliğinden yenilenmez.',
                      ),
                      if (readable)
                        text(switch (p!.physicalStart) {
                          ReplacementPhysicalStart.unknown => 'İlk fiziksel adıma başlanıp başlanmadığı doğrulanmadı.',
                          ReplacementPhysicalStart.notStarted =>
                            'Kaynağa göre ilk fiziksel adıma başlanmamış.',
                          ReplacementPhysicalStart.started => 'Kaynağa göre fiziksel işe başlanmış. Yanlış seçim düzeltmesi kapalı.',
                        }),
                      if (s.offline)
                        text(
                          'Çevrimdışısın. Yeni seçim için güncel sunucu kontrolü gerekir.',
                        ),
                      if (s.phase != ReplacementPhase.idle)
                        Semantics(
                          liveRegion: true,
                          child: text(switch (s.phase) {
                            ReplacementPhase.submitting =>
                              'Kontrol sürüyor. Yeni istek gönderilmiyor.',
                            ReplacementPhase.failed =>
                              'Kontrol tamamlanamadı. Seçim değişmiş sayılmaz.',
                            ReplacementPhase.received => 'İstek alındı. Hakkın verildiği veya seçimin değiştiği henüz doğrulanmadı.',
                            _ => 'İstek sonucu doğrulanamadı. Yeni seçim yapılmış sayılmaz.',
                          }),
                        ),
                      button(
                        requestLabel,
                        ReplacementAction.request,
                        primary: true,
                      ),
                      if (sent.contains(s.intentKey))
                        Semantics(
                          liveRegion: true,
                          child: text(
                            'Kontrol isteği iletildi. Hakkın verildiği veya seçimin değiştiği henüz doğrulanmadı; bakım başlamış sayılmaz.',
                          ),
                        ),
                      button(
                        'Güncel seçimi tekrar kontrol et',
                        ReplacementAction.refresh,
                      ),
                      if (refreshed.contains(s.intentKey))
                        Semantics(
                          liveRegion: true,
                          child: text(
                            'Güncel bilgi istendi. Sonuç henüz doğrulanmadı.',
                          ),
                        ),
                      text('Hakkın nasıl taşınır?', size: 22, heading: true),
                      text(
                        'Tam rehber hakkı aynı anda bir seçili motosiklette açılır. '
                        'Başka motosiklet seçildiğinde hak taşınır; öncekinin üstüne eklenmez.',
                      ),
                      text(
                        'Motosiklet değiştirmek veya rehberi tamamlamak yeni bir ücretsiz seçim hakkı üretmez. '
                        'Düzeltmenin kesin süresi, seçim sıklığı ve ücret koşulları burada belirlenmiş değil.',
                      ),
                      text('Kayıtların açık kalır', size: 22, heading: true),
                      text(
                        'Eski işlem kaydı, kullanılan rehber sürümü ve güvenlik düzeltmeleri yeni seçimle silinmez. '
                        'Bu yollar satın almaya bağlı değildir; güncel kimlik ve her yolun okuma izni yine gerekir.',
                      ),
                      for (final entry in const {
                        EntitlementPath.history: 'Geçmiş kayıtları',
                        EntitlementPath.evidence: 'Kanıt ve kaynak bilgisi',
                        EntitlementPath.correction: 'Düzeltme ve itiraz',
                        EntitlementPath.export: 'Kayıtları dışa aktar',
                      }.entries)
                        button(
                          entry.value,
                          ReplacementAction.read,
                          path: entry.key,
                        ),
                      text(
                        'Güvenlik ve yarım kalan iş',
                        size: 22,
                        heading: true,
                      ),
                      text(
                        'Yeni seçim kararı kritik güvenlik bilgisini ve başlanmış işin güvenli dönüşünü satın almaya bağlamaz. '
                        'Bu yollara erişim, işi sürdürme izni veya güvenli sonuç kaydı değildir.',
                      ),
                      button(
                        'Kritik güvenlik bilgisi',
                        ReplacementAction.read,
                        path: EntitlementPath.safety,
                      ),
                      button(
                        'Başlanmış işin güvenli dönüşü',
                        ReplacementAction.read,
                        path: EntitlementPath.recovery,
                      ),
                      text(
                        'Rehber hakkı bakımın doğru olduğunu veya motosikletin sürüşe güvenli olduğunu kanıtlamaz. '
                        'Güncel fiziksel uygunluk ayrıca değerlendirilir.',
                      ),
                      button('Garaja dön', ReplacementAction.garage),
                      button('Destek seçenekleri', ReplacementAction.support),
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

class _ReplacementButton extends StatefulWidget {
  const _ReplacementButton({
    super.key,
    required this.label,
    required this.primary,
    required this.onPressed,
  });
  final String label;
  final bool primary;
  final VoidCallback? onPressed;
  @override
  State<_ReplacementButton> createState() => _ReplacementButtonState();
}

class _ReplacementButtonState extends State<_ReplacementButton> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    final active = widget.onPressed != null;
    return FocusableActionDetector(
      enabled: active,
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
      onShowFocusHighlight: (v) {
        if (v != focused) setState(() => focused = v);
      },
      child: Semantics(
        button: true,
        enabled: active,
        label: widget.label,
        onTap: widget.onPressed,
        excludeSemantics: true,
        child: GestureDetector(
          onTap: widget.onPressed,
          behavior: HitTestBehavior.opaque,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 52),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: !active
                    ? const Color(0xFFE3E8F0)
                    : widget.primary
                    ? const Color(0xFF0E5BD8)
                    : const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: focused
                      ? (widget.primary
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF172033))
                      : const Color(0xFFCBD3E0),
                  width: focused ? 3 : 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: active && widget.primary
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFF172033),
                    fontSize: 16,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
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
