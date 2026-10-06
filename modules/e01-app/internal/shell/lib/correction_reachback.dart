import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'history.dart';

String _required(String value) {
  if (value.trim().isEmpty) throw ArgumentError('Kaynak bağlamı boş olamaz.');
  return value.trim();
}

// UTF-16 kod birimleri uzunluk önekiyle ayrılır; bozuk surrogate dahil
// farklı dış kimlikler aynı sunum yetki hedefini paylaşamaz.
String _identity(String value) =>
    '${value.codeUnits.length}:${value.codeUnits.map((v) => v.toRadixString(16).padLeft(4, '0')).join()}';

enum CorrectionImpact { safetyWarning, technicalValue, criticalStep, narrative }

enum CorrectionField {
  summary,
  before,
  after,
  source,
  changedAt,
  reason,
  reviewer,
  uncertainty,
}

enum CorrectionAction { recheck, reconcile, openRecord, support, exit }

enum CorrectionEffectDimension {
  motorcycle,
  source,
  authorization,
  policy,
  operationIntent,
  audit,
}

enum CorrectionPhase { idle, submitting, failed, unknown, received }

/// Dış üreticinin değişmez sunum girdisi; E1 etki veya izin üretmez.
class CorrectionNotice {
  CorrectionNotice({
    required String id,
    required String revision,
    required String classificationRevision,
    required this.record,
    required this.impact,
    required Map<CorrectionField, String> values,
  }) : id = _required(id),
       revision = _required(revision),
       classificationRevision = _required(classificationRevision),
       values = Map.unmodifiable({
         for (final v in values.entries) v.key: _required(v.value),
       });
  final String id, revision, classificationRevision;
  final HistoryRecord record;
  final CorrectionImpact impact;
  final Map<CorrectionField, String> values;
  String get subject =>
      '${_identity(id)}/${_identity(revision)}/${_identity(classificationRevision)}/${impact.name}/${_identity(record.memberSubject)}/${CorrectionField.values.map((f) => '${f.name}:${_identity(values[f] ?? '')}').join('/')}';
}

class CorrectionSnapshot {
  CorrectionSnapshot({
    required this.scope,
    required String requestId,
    required this.notice,
    required this.inactive,
    required this.entitlementChanged,
    required this.offline,
    required this.phase,
    this.authority,
    this.classificationAuthority,
    this.resultReceipt,
    required Map<HistoryReadDimension, HistoryReference?> readDimensions,
    required Map<CorrectionField, HistoryReference?> fields,
    required Map<
      CorrectionAction,
      Map<CorrectionEffectDimension, HistoryReference?>
    >
    effects,
  }) : requestId = _required(requestId),
       readDimensions = Map.unmodifiable(readDimensions),
       fields = Map.unmodifiable(fields),
       effects = Map.unmodifiable({
         for (final e in effects.entries)
           e.key:
               Map<CorrectionEffectDimension, HistoryReference?>.unmodifiable(
                 e.value,
               ),
       });
  final HistoryScope scope;
  final String requestId;
  final CorrectionNotice? notice;
  final bool inactive, entitlementChanged, offline;
  final CorrectionPhase phase;
  final HistoryReference? authority, classificationAuthority, resultReceipt;
  final Map<HistoryReadDimension, HistoryReference?> readDimensions;
  final Map<CorrectionField, HistoryReference?> fields;
  final Map<CorrectionAction, Map<CorrectionEffectDimension, HistoryReference?>>
  effects;
  bool get readable {
    final n = notice;
    return n != null &&
        n.record.readable(scope, requestId) &&
        (authority?.confirmed(
              scope,
              requestId,
              'correction-notice',
              n.subject,
            ) ??
            false) &&
        (classificationAuthority?.confirmed(
              scope,
              requestId,
              'correction-impact',
              n.subject,
            ) ??
            false) &&
        HistoryReadDimension.values.every(
          (d) =>
              readDimensions[d]?.confirmed(
                scope,
                requestId,
                'correction-read',
                '${n.subject}/${d.name}',
              ) ??
              false,
        ) &&
        CorrectionField.values.every(
          (f) =>
              n.values.containsKey(f) &&
              (fields[f]?.confirmed(
                    scope,
                    requestId,
                    'correction-field',
                    '${n.subject}/${f.name}',
                  ) ??
                  false),
        );
  }

  bool effectAllowed(CorrectionAction action) =>
      readable &&
      !offline &&
      CorrectionEffectDimension.values.every(
        (d) =>
            effects[action]?[d]?.confirmed(
              scope,
              requestId,
              'correction-effect',
              '${notice!.subject}/${action.name}/${d.name}',
            ) ??
            false,
      );
  bool get receiptConfirmed =>
      readable &&
      phase == CorrectionPhase.received &&
      (resultReceipt?.confirmed(
            scope,
            requestId,
            'correction-recheck-receipt',
            notice!.subject,
          ) ??
          false);
}

class CorrectionIntent {
  const CorrectionIntent(this.scope, this.requestId, this.subject, this.action);
  final HistoryScope scope;
  final String requestId, subject;
  final CorrectionAction action;
}

class CorrectionReachbackView extends StatefulWidget {
  const CorrectionReachbackView({
    super.key,
    required this.snapshot,
    this.onIntent,
  });
  final CorrectionSnapshot snapshot;
  final ValueChanged<CorrectionIntent>? onIntent;
  @override
  State<CorrectionReachbackView> createState() => _CorrectionReachbackState();
}

class _CorrectionReachbackState extends State<CorrectionReachbackView> {
  bool details = false;
  final Set<String> sent = {}, queried = {};
  String _request(CorrectionSnapshot s) =>
      '${_identity(s.scope.motorcycleId)}/${_identity(s.scope.contextRevision)}/${_identity(s.scope.catalogId)}/${_identity(s.scope.catalogRevision)}/${_identity(s.requestId)}';

  @override
  void didUpdateWidget(CorrectionReachbackView oldWidget) {
    super.didUpdateWidget(oldWidget);
    final old = oldWidget.snapshot, now = widget.snapshot;
    if (!old.scope.matches(now.scope) ||
        old.requestId != now.requestId ||
        old.notice?.subject != now.notice?.subject) {
      details = false;
    }
  }

  bool _bound(CorrectionSnapshot old) {
    final now = widget.snapshot;
    return now.scope.matches(old.scope) &&
        now.requestId == old.requestId &&
        now.notice?.subject == old.notice?.subject &&
        now.phase == old.phase;
  }

  bool _can(CorrectionSnapshot s, CorrectionAction action) {
    if (widget.onIntent == null) return false;
    if (action == CorrectionAction.support || action == CorrectionAction.exit) {
      return true;
    }
    if (!s.readable) return false;
    if (action == CorrectionAction.openRecord) return true;
    if (!s.effectAllowed(action)) return false;
    if (action == CorrectionAction.recheck) {
      return s.notice!.impact != CorrectionImpact.narrative &&
          s.phase == CorrectionPhase.idle &&
          !sent.contains(_request(s));
    }
    return (s.phase == CorrectionPhase.failed ||
            s.phase == CorrectionPhase.unknown ||
            (s.phase == CorrectionPhase.received && !s.receiptConfirmed)) &&
        !queried.contains(_request(s));
  }

  VoidCallback? _action(CorrectionSnapshot s, CorrectionAction action) =>
      _can(s, action)
      ? () {
          final now = widget.snapshot;
          if (!_bound(s) || !_can(now, action)) return;
          if (action == CorrectionAction.recheck) {
            setState(() => sent.add(_request(now)));
          } else if (action == CorrectionAction.reconcile) {
            setState(() => queried.add(_request(now)));
          }
          widget.onIntent!(
            CorrectionIntent(
              now.scope,
              now.requestId,
              now.readable ? now.notice!.subject : '',
              action,
            ),
          );
        }
      : null;

  @override
  Widget build(BuildContext context) {
    final s = widget.snapshot;
    final n = s.readable ? s.notice! : null;
    Widget line(String value, {int level = 0}) => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Semantics(
        header: level > 0,
        child: Text(
          value,
          style: TextStyle(
            fontSize: level == 2
                ? 32
                : level == 1
                ? 22
                : 16,
            height: 1.4,
            fontWeight: level > 0 ? FontWeight.w700 : FontWeight.w400,
            color: const Color(0xFF172033),
          ),
        ),
      ),
    );
    Widget button(
      String label,
      CorrectionAction action, {
      bool primary = false,
    }) => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: _CorrectionButton(
        key: ValueKey('correction-${action.name}'),
        label: label,
        primary: primary,
        onPressed: _action(s, action),
      ),
    );
    final waiting =
        s.phase == CorrectionPhase.submitting ||
        sent.contains(_request(s)) && s.phase == CorrectionPhase.idle;
    final uncertain =
        s.phase == CorrectionPhase.failed ||
        s.phase == CorrectionPhase.unknown ||
        s.phase == CorrectionPhase.received && !s.receiptConfirmed;
    return ColoredBox(
      color: const Color(0xFFF5F7FB),
      child: FocusTraversalGroup(
        policy: ReadingOrderTraversalPolicy(),
        child: SingleChildScrollView(
          key: const ValueKey('correction-scroll'),
          padding: const EdgeInsets.all(24),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  line(
                    n == null
                        ? 'Düzeltme bilgisi şu an açılamıyor'
                        : n.impact == CorrectionImpact.narrative
                        ? 'Bu kaydın anlatımı güncellendi'
                        : 'Bu kayıt yeniden kontrol edilmeli',
                    level: 2,
                  ),
                  if (n == null) ...[
                    line(
                      'Güncel kayıt ve erişim bilgisi gerekli. Özel ayrıntılar kapalı; bilginin yokluğu düzeltmenin önemsiz olduğu anlamına gelmez.',
                    ),
                  ] else ...[
                    line(s.scope.motorcycleLabel),
                    line(switch (n.impact) {
                      CorrectionImpact.safetyWarning =>
                        'Güvenlik uyarısını etkileyen düzeltme',
                      CorrectionImpact.technicalValue =>
                        'Kullanılmış teknik değeri etkileyen düzeltme',
                      CorrectionImpact.criticalStep =>
                        'Uygulanmış önemli adımı etkileyen düzeltme',
                      CorrectionImpact.narrative => 'Kaynak bu değişikliği anlatım düzeltmesi olarak bildiriyor.',
                    }),
                    line(n.values[CorrectionField.summary]!),
                    line('Etkilenen kayıt', level: 1),
                    line(n.record.values[HistoryField.title]!),
                    line(n.record.values[HistoryField.date]!),
                    line(n.record.values[HistoryField.outcome]!),
                    line(
                      n.impact == CorrectionImpact.narrative
                          ? 'Değişen anlatımı ve kayıt geçmişini inceleyebilirsiniz.'
                          : 'Devam etmeden önce bu kaydın mevcut duruma etkisi yeniden değerlendirilmeli.',
                    ),
                    line(
                      'Kayda veya ayrıntılara bakmak bir bakım işlemi başlatmaz. Bu mesaj veya düğmeye basmak, bakımın yeniden kontrol edildiğini ya da motosikletin güvenli olduğunu kanıtlamaz.',
                    ),
                    if (s.inactive)
                      line(
                        'Motosiklet pasif. Bu düzeltme ve izinli kayıt geçmişi okunabilir.',
                      ),
                    if (s.entitlementChanged)
                      line(
                        'Paketiniz değişmiş olsa da bu düzeltme ve izinli kayıt geçmişi ücret kapısına alınmaz.',
                      ),
                    if (s.offline)
                      line(
                        'Çevrimdışısınız. Yeni kontrol isteği kapalı; eski bilgi güncel kontrol veya riskin geçtiği anlamına gelmez.',
                      ),
                    if (waiting || uncertain || s.receiptConfirmed)
                      Semantics(
                        liveRegion: true,
                        child: line(
                          waiting
                              ? 'Kontrol isteği gönderiliyor. Aynı istek tekrar gönderilemez.'
                              : s.receiptConfirmed
                              ? 'Kontrol isteğinin alındığı bildirildi. Fiziksel kontrol ve güvenlik sonucu henüz doğrulanmadı.'
                              : queried.contains(_request(s))
                              ? 'Aynı isteğin sonucu sorgulanıyor. Yeni kontrol isteği gönderilmedi.'
                              : 'İsteğin sonucu kesinleşmedi. Yeni istek göndermeden aynı isteğin sonucunu sorgulayın.',
                        ),
                      ),
                    if (uncertain)
                      button(
                        'Aynı isteğin sonucunu sorgula',
                        CorrectionAction.reconcile,
                        primary: true,
                      )
                    else if (n.impact == CorrectionImpact.narrative)
                      button(
                        'Kayda bak',
                        CorrectionAction.openRecord,
                        primary: true,
                      )
                    else
                      button(
                        'Yeniden kontrol et',
                        CorrectionAction.recheck,
                        primary: true,
                      ),
                    if (!waiting &&
                        !uncertain &&
                        !s.receiptConfirmed &&
                        n.impact != CorrectionImpact.narrative &&
                        !_can(s, CorrectionAction.recheck))
                      line(
                        'Yeni kontrol isteği şu an açılamıyor. Kaydı okuyabilirsiniz; güncel işlem izni ve bağlantı gerekli.',
                      ),
                    _CorrectionButton(
                      key: const ValueKey('correction-details'),
                      label: details
                          ? 'Ayrıntıları kapat'
                          : 'Düzeltmenin ayrıntıları',
                      primary: false,
                      onPressed: () {
                        if (!_bound(s) || !widget.snapshot.readable) return;
                        setState(() => details = !details);
                      },
                    ),
                    const SizedBox(height: 12),
                    if (details) ...[
                      line('Değişen bilgi ve korunan iz', level: 1),
                      line('Önce: ${n.values[CorrectionField.before]}'),
                      line('Şimdi: ${n.values[CorrectionField.after]}'),
                      line('Zaman: ${n.values[CorrectionField.changedAt]}'),
                      line('Gerekçe: ${n.values[CorrectionField.reason]}'),
                      line('Kaynak: ${n.values[CorrectionField.source]}'),
                      line('İnceleyen: ${n.values[CorrectionField.reviewer]}'),
                      line(
                        'Açık kalan: ${n.values[CorrectionField.uncertainty]}',
                      ),
                      line(
                        'Düzeltme önceki kayıt ve bağımsız kanıt izini silmez; bir iddiayı kendiliğinden kazanan veya doğrulanmış tamamlanma yapmaz.',
                      ),
                    ],
                    if (n.impact != CorrectionImpact.narrative || uncertain)
                      button(
                        'Etkilenen kayda bak',
                        CorrectionAction.openRecord,
                      ),
                  ],
                  button('Destek', CorrectionAction.support),
                  button('Çık', CorrectionAction.exit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CorrectionButton extends StatefulWidget {
  const _CorrectionButton({
    super.key,
    required this.label,
    required this.primary,
    required this.onPressed,
  });
  final String label;
  final bool primary;
  final VoidCallback? onPressed;
  @override
  State<_CorrectionButton> createState() => _CorrectionButtonState();
}

class _CorrectionButtonState extends State<_CorrectionButton> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    final active = widget.onPressed != null;
    final background = !active
        ? const Color(0xFFE3E8F0)
        : widget.primary
        ? const Color(0xFF0E5BD8)
        : const Color(0xFFFFFFFF);
    final foreground = active && widget.primary
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF172033);
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
      onShowFocusHighlight: (v) => setState(() => focused = v),
      child: Semantics(
        button: true,
        enabled: active,
        label: widget.label,
        onTap: widget.onPressed,
        child: ExcludeSemantics(
          child: GestureDetector(
            onTap: widget.onPressed,
            behavior: HitTestBehavior.opaque,
            child: Container(
              constraints: const BoxConstraints(minHeight: 52),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: focused
                      ? active && widget.primary
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF172033)
                      : const Color(0xFF5E6E81),
                  width: focused ? 3 : 1,
                ),
              ),
              child: Text(
                widget.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: foreground,
                  fontSize: 16,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
