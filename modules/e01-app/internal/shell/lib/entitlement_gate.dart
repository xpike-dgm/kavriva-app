import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'history.dart';

String _required(String value) {
  final result = value.trim();
  if (result.isEmpty) throw ArgumentError('Bağlam veya açıklama boş olamaz.');
  return result;
}

// UTF16 uzunluk/hex: bozuk Unicode ve ayraçlar da kayıpsız ayrılır.
String _identity(String value) =>
    '${value.codeUnits.length}:${value.codeUnits.map((u) => u.toRadixString(16).padLeft(4, '0')).join()}';

enum EntitlementDecision { denied, held, allowed }

enum EntitlementField { motorcycle, reason, source, checkedAt }

enum EntitlementPath { history, evidence, correction, export, safety, recovery }

enum EntitlementAction {
  garage,
  support,
  read,
  requestContext,
  checkNewActivity,
}

enum EntitlementEffectDimension {
  motorcycle,
  source,
  authorization,
  policy,
  operationIntent,
  audit,
}

/// Dış kaynak girdisi; E1 abonelikten veya yerel sayıdan izin türetmez.
class EntitlementPlan {
  EntitlementPlan({
    required String id,
    required String revision,
    required this.decision,
    required this.inactive,
    required this.startedWork,
    required Map<EntitlementField, String> values,
  }) : id = _required(id),
       revision = _required(revision),
       values = Map.unmodifiable({
         for (final e in values.entries) e.key: _required(e.value),
       });
  final String id, revision;
  final EntitlementDecision decision;
  final bool inactive, startedWork;
  final Map<EntitlementField, String> values;
  String get subject =>
      '${_identity(id)}/${_identity(revision)}/${decision.name}/$inactive/$startedWork/'
      '${EntitlementField.values.map((f) => '${f.name}:${values.containsKey(f) ? _identity(values[f]!) : "missing"}').join('/')}';
}

class EntitlementSnapshot {
  EntitlementSnapshot({
    required this.scope,
    required String requestId,
    required this.plan,
    this.authority,
    required Map<HistoryReadDimension, HistoryReference?> readDimensions,
    required Map<EntitlementField, HistoryReference?> fields,
    required Map<EntitlementPath, HistoryReference?> paths,
    required Map<EntitlementEffectDimension, HistoryReference?> effects,
    this.offline = false,
  }) : requestId = _required(requestId),
       readDimensions = Map.unmodifiable(readDimensions),
       fields = Map.unmodifiable(fields),
       paths = Map.unmodifiable(paths),
       effects = Map.unmodifiable(effects);
  final HistoryScope scope;
  final String requestId;
  final EntitlementPlan? plan;
  final HistoryReference? authority;
  final Map<HistoryReadDimension, HistoryReference?> readDimensions;
  final Map<EntitlementField, HistoryReference?> fields;
  final Map<EntitlementPath, HistoryReference?> paths;
  final Map<EntitlementEffectDimension, HistoryReference?> effects;
  final bool offline;

  bool get readable {
    final p = plan;
    return p != null &&
        (authority?.confirmed(
              scope,
              requestId,
              'entitlement-plan',
              p.subject,
            ) ??
            false) &&
        HistoryReadDimension.values.every(
          (d) =>
              readDimensions[d]?.confirmed(
                scope,
                requestId,
                'entitlement-read',
                '${p.subject}/${d.name}',
              ) ??
              false,
        ) &&
        EntitlementField.values.every(
          (f) =>
              p.values.containsKey(f) &&
              (fields[f]?.confirmed(
                    scope,
                    requestId,
                    'entitlement-field',
                    '${p.subject}/${f.name}',
                  ) ??
                  false),
        );
  }

  // Korunan erişimin lisans kararıyla ilgisi yok. Her yol kendi güncel
  // okuma yetkisini ister; etiketin görünmesi özel veriye izin değildir.
  bool pathAllowed(EntitlementPath path) =>
      readable &&
      (paths[path]?.confirmed(
            scope,
            requestId,
            'entitlement-path',
            '${plan!.subject}/${path.name}',
          ) ??
          false);

  bool get newActivityCheckAllowed =>
      readable &&
      !offline &&
      plan!.decision == EntitlementDecision.allowed &&
      !plan!.inactive &&
      EntitlementEffectDimension.values.every(
        (d) =>
            effects[d]?.confirmed(
              scope,
              requestId,
              'entitlement-check-new',
              '${plan!.subject}/${d.name}',
            ) ??
            false,
      );
}

class EntitlementIntent {
  const EntitlementIntent({
    required this.action,
    required this.scope,
    required this.requestId,
    required this.subjectId,
    this.path,
  });
  final EntitlementAction action;
  final HistoryScope scope;
  final String requestId, subjectId;
  final EntitlementPath? path;
}

class EntitlementGateView extends StatefulWidget {
  const EntitlementGateView({super.key, required this.snapshot, this.onIntent});
  final EntitlementSnapshot snapshot;
  final ValueChanged<EntitlementIntent>? onIntent;
  @override
  State<EntitlementGateView> createState() => _EntitlementGateState();
}

class _EntitlementGateState extends State<EntitlementGateView> {
  final Set<String> sent = {};
  final Set<String> requested = {};
  String keyFor(EntitlementSnapshot s) =>
      '${_identity(s.scope.motorcycleId)}/${_identity(s.scope.contextRevision)}/'
      '${_identity(s.scope.catalogId)}/${_identity(s.scope.catalogRevision)}/${_identity(s.requestId)}';
  bool same(EntitlementSnapshot old) {
    final s = widget.snapshot;
    return old.scope.matches(s.scope) &&
        old.requestId == s.requestId &&
        old.plan?.subject == s.plan?.subject &&
        old.offline == s.offline &&
        old.readable == s.readable;
  }

  VoidCallback? callback(EntitlementAction action, {EntitlementPath? path}) {
    final old = widget.snapshot, capturedHandler = widget.onIntent;
    bool allowed(EntitlementSnapshot s) => switch (action) {
      EntitlementAction.garage || EntitlementAction.support => true,
      EntitlementAction.read => path != null && s.pathAllowed(path),
      EntitlementAction.requestContext =>
        s.readable && !s.offline && !requested.contains(keyFor(s)),
      EntitlementAction.checkNewActivity =>
        s.newActivityCheckAllowed && !sent.contains(keyFor(s)),
    };
    if (capturedHandler == null || !allowed(old)) return null;
    return () {
      final s = widget.snapshot;
      if (!same(old) || widget.onIntent != capturedHandler || !allowed(s))
        return;
      if (action == EntitlementAction.requestContext) {
        setState(() => requested.add(keyFor(s)));
      } else if (action == EntitlementAction.checkNewActivity) {
        setState(() => sent.add(keyFor(s)));
      }
      capturedHandler(
        EntitlementIntent(
          action: action,
          scope: s.scope,
          requestId: s.requestId,
          path: path,
          subjectId:
              action == EntitlementAction.garage ||
                  action == EntitlementAction.support
              ? ''
              : s.plan!.subject,
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
    EntitlementAction action, {
    bool primary = false,
    EntitlementPath? path,
  }) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: _EntitlementButton(
      key: ValueKey('entitlement-$label'),
      label: label,
      primary: primary,
      onPressed: callback(action, path: path),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final s = widget.snapshot, p = s.plan;
    final readable = s.readable;
    final title = !readable
        ? 'Güncel izin bilgisi alınamadı'
        : p!.inactive
        ? 'Yeni bakım kapalı'
        : p.decision == EntitlementDecision.denied
        ? 'Yeni işlem kapalı'
        : p.decision == EntitlementDecision.held
        ? 'Yeni işlem beklemede'
        : 'Yeni işlem için izin kontrolü';
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
                      text('Yalnızca yeni işlem etkilenir.'),
                      if (readable) ...[
                        text(p!.values[EntitlementField.motorcycle]!, size: 18),
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
                              text(
                                'Güncel işlem durumu',
                                size: 18,
                                heading: true,
                              ),
                              text(p.values[EntitlementField.reason]!),
                              text(
                                'Kaynak: ${p.values[EntitlementField.source]}',
                              ),
                              text(
                                'Kontrol zamanı: ${p.values[EntitlementField.checkedAt]}',
                              ),
                            ],
                          ),
                        ),
                      ] else
                        text(
                          'Özel motosiklet ve izin bilgileri gösterilmiyor. Güncel kimlik ve okuma izni gerekir.',
                        ),
                      if (s.offline)
                        text(
                          'Çevrimdışısın. Yeni işlem için güncel sunucu kontrolü gerekir.',
                        ),
                      text('Mevcut erişimin korunur', size: 22, heading: true),
                      text(
                        'Yeni işlem sınırı geçmişini silmez. Aşağıdaki yollar paket satın almaya bağlı değildir; her biri için güncel kimlik ve okuma izni yine gerekir.',
                      ),
                      button(
                        'Geçmiş kayıtları',
                        EntitlementAction.read,
                        path: EntitlementPath.history,
                      ),
                      button(
                        'Kanıt ve kaynak bilgisi',
                        EntitlementAction.read,
                        path: EntitlementPath.evidence,
                      ),
                      button(
                        'Düzeltme ve itiraz',
                        EntitlementAction.read,
                        path: EntitlementPath.correction,
                      ),
                      button(
                        'Kayıtları dışa aktar',
                        EntitlementAction.read,
                        path: EntitlementPath.export,
                      ),
                      text(
                        'Güvenlik ve yarım kalan iş',
                        size: 22,
                        heading: true,
                      ),
                      text(
                        'Kritik güvenlik bilgisi ile başlanmış işin güvenli dönüşü paket nedeniyle kapatılmaz. Önceki izinler işi sürdürmek için yeterli değildir; güncel fiziksel durum ayrıca değerlendirilir.',
                      ),
                      button(
                        'Kritik güvenlik bilgisi',
                        EntitlementAction.read,
                        path: EntitlementPath.safety,
                      ),
                      button(
                        'Başlanmış işin güvenli dönüşü',
                        EntitlementAction.read,
                        path: EntitlementPath.recovery,
                      ),
                      if (readable && p!.startedWork)
                        text(
                          'Bu kapsamda başlanmış iş var. Yeni iş açılması ile mevcut işin güvenli dönüşü ayrı değerlendirilir.',
                        ),
                      button(
                        'Garaja dön',
                        EntitlementAction.garage,
                        primary: true,
                      ),
                      text(
                        'Motosiklet ve rehber hakkı',
                        size: 22,
                        heading: true,
                      ),
                      text(
                        'Ücretsiz 1 motosiklet. Abonelikle toplam 3 motosiklet. Aynı anda yalnızca seçili 1 motosiklette tam rehber.',
                      ),
                      text(
                        'Tam rehber için başka motosiklet seçildiğinde hak taşınır; önceki hakkın üstüne eklenmez. Her motosikletin kayıtları ayrı kalır.',
                      ),
                      text(
                        'Fiyat, ödeme, seçim değiştirme sıklığı ve deneme koşulları burada kesinleştirilmiş değil.',
                      ),
                      text(
                        'Hak veya abonelik bakımın doğruluğunu ve motosikletin güncel fiziksel uygunluğunu kanıtlamaz. Yeniden etkinleştirme de fiziksel kontrolün yerine geçmez.',
                      ),
                      if (readable) ...[
                        button(
                          p!.inactive
                              ? 'Yeniden etkinleştirme seçeneklerini kontrol et'
                              : 'Güncel işlem seçeneklerini kontrol et',
                          EntitlementAction.requestContext,
                        ),
                        if (p.decision == EntitlementDecision.allowed &&
                            !p.inactive)
                          button(
                            'Yeni işlem için sunucu kontrolü iste',
                            EntitlementAction.checkNewActivity,
                          ),
                        text(
                          'Bu eylemler yalnızca güncel değerlendirme isteğidir; ödeme yapmaz, hak vermez ve bakım başlatmaz.',
                        ),
                      ],
                      if (requested.contains(keyFor(s)) ||
                          sent.contains(keyFor(s)))
                        Semantics(
                          liveRegion: true,
                          child: text(
                            'Kontrol isteği iletildi. Güncel sonuç henüz doğrulanmadı; işlem başlamadı.',
                          ),
                        ),
                      button('Destek seçenekleri', EntitlementAction.support),
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

class _EntitlementButton extends StatefulWidget {
  const _EntitlementButton({
    super.key,
    required this.label,
    required this.primary,
    required this.onPressed,
  });
  final String label;
  final bool primary;
  final VoidCallback? onPressed;
  @override
  State<_EntitlementButton> createState() => _EntitlementButtonState();
}

class _EntitlementButtonState extends State<_EntitlementButton> {
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
      onShowFocusHighlight: (value) {
        if (focused != value) setState(() => focused = value);
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
                color: background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: focused
                      ? widget.primary
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF172033)
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
      ),
    );
  }
}
