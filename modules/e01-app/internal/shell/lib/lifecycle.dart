import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'history.dart';

String _required(String value) {
  if (value.trim().isEmpty) throw ArgumentError('Kapsam bilgisi boş olamaz.');
  return value.trim();
}

String _identity(String value) =>
    '${value.codeUnits.length}:${value.codeUnits.map((v) => v.toRadixString(16).padLeft(4, '0')).join()}';

enum LifecycleScreen { manage, transfer, delete }

enum LifecycleOperation {
  deactivate,
  reactivate,
  confirmTransferScope,
  deleteOwnScope,
}

enum LifecycleAction {
  deactivate,
  reactivate,
  confirmTransferScope,
  deleteOwnScope,
  reconcile,
  support,
  exit,
}

enum LifecyclePhase { idle, submitting, failed, unknown, received }

enum LifecycleField {
  motorcycle,
  period,
  included,
  gaps,
  excluded,
  attribution,
  ownDeletion,
  independent,
  reactivation,
  uncertainty,
}

enum LifecycleEffectDimension {
  motorcycle,
  source,
  authorization,
  policy,
  operationIntent,
  audit,
}

/// Dış üreticinin uygulanabilir kapsamı; E1 kapsam/yetki/hukuk kararı vermez.
class LifecyclePlan {
  LifecyclePlan({
    required String id,
    required String revision,
    required this.inactive,
    required Map<LifecycleField, String> values,
  }) : id = _required(id),
       revision = _required(revision),
       values = Map.unmodifiable({
         for (final entry in values.entries) entry.key: _required(entry.value),
       });
  final String id, revision;
  final bool inactive;
  final Map<LifecycleField, String> values;
  String get subject =>
      '${_identity(id)}/${_identity(revision)}/$inactive/${LifecycleField.values.map((f) => '${f.name}:${_identity(values[f] ?? '')}').join('/')}';
}

class LifecycleSnapshot {
  LifecycleSnapshot({
    required this.scope,
    required String requestId,
    required this.plan,
    required this.screen,
    required this.operation,
    required this.offline,
    required this.phase,
    this.authority,
    this.scopeAuthority,
    this.resultReceipt,
    required Map<HistoryReadDimension, HistoryReference?> readDimensions,
    required Map<LifecycleField, HistoryReference?> fields,
    required Map<
      LifecycleAction,
      Map<LifecycleEffectDimension, HistoryReference?>
    >
    effects,
  }) : requestId = _required(requestId),
       readDimensions = Map.unmodifiable(readDimensions),
       fields = Map.unmodifiable(fields),
       effects = Map.unmodifiable({
         for (final entry in effects.entries)
           entry.key:
               Map<LifecycleEffectDimension, HistoryReference?>.unmodifiable(
                 entry.value,
               ),
       }) {
    if (screen == LifecycleScreen.transfer &&
            operation != LifecycleOperation.confirmTransferScope ||
        screen == LifecycleScreen.delete &&
            operation != LifecycleOperation.deleteOwnScope) {
      throw ArgumentError('Ekran ve istek işlemi aynı kapsama ait olmalı.');
    }
  }
  final HistoryScope scope;
  final String requestId;
  final LifecyclePlan? plan;
  final LifecycleScreen screen;
  final LifecycleOperation operation;
  final bool offline;
  final LifecyclePhase phase;
  final HistoryReference? authority, scopeAuthority, resultReceipt;
  final Map<HistoryReadDimension, HistoryReference?> readDimensions;
  final Map<LifecycleField, HistoryReference?> fields;
  final Map<LifecycleAction, Map<LifecycleEffectDimension, HistoryReference?>>
  effects;
  bool get readable {
    final p = plan;
    return p != null &&
        (authority?.confirmed(scope, requestId, 'lifecycle-plan', p.subject) ??
            false) &&
        (scopeAuthority?.confirmed(
              scope,
              requestId,
              'lifecycle-scope',
              p.subject,
            ) ??
            false) &&
        HistoryReadDimension.values.every(
          (d) =>
              readDimensions[d]?.confirmed(
                scope,
                requestId,
                'lifecycle-read',
                '${p.subject}/${d.name}',
              ) ??
              false,
        ) &&
        LifecycleField.values.every(
          (f) =>
              p.values.containsKey(f) &&
              (fields[f]?.confirmed(
                    scope,
                    requestId,
                    'lifecycle-field',
                    '${p.subject}/${f.name}',
                  ) ??
                  false),
        );
  }

  bool effectAllowed(LifecycleAction action) =>
      readable &&
      !offline &&
      LifecycleEffectDimension.values.every(
        (d) =>
            effects[action]?[d]?.confirmed(
              scope,
              requestId,
              'lifecycle-effect',
              '${plan!.subject}/${operation.name}/${action.name}/${d.name}',
            ) ??
            false,
      );

  bool get receiptConfirmed =>
      readable &&
      phase == LifecyclePhase.received &&
      (resultReceipt?.confirmed(
            scope,
            requestId,
            'lifecycle-request-receipt',
            '${plan!.subject}/${operation.name}',
          ) ??
          false);
}

class LifecycleIntent {
  const LifecycleIntent(
    this.scope,
    this.requestId,
    this.subject,
    this.operation,
    this.action,
  );
  final HistoryScope scope;
  final String requestId, subject;
  final LifecycleOperation operation;
  final LifecycleAction action;
}

/// Yalnız özel E1 sunumu; typed niyet DB/router/silme/aktarım yürütmez.
class LifecycleView extends StatefulWidget {
  const LifecycleView({super.key, required this.snapshot, this.onIntent});
  final LifecycleSnapshot snapshot;
  final ValueChanged<LifecycleIntent>? onIntent;
  @override
  State<LifecycleView> createState() => _LifecycleState();
}

class _LifecycleState extends State<LifecycleView> {
  late LifecycleScreen screen;
  late LifecycleOperation selected;
  bool reviewed = false, acknowledged = false;
  final Set<String> sent = {}, queried = {};
  @override
  void initState() {
    super.initState();
    _reset();
  }

  void _reset() {
    screen = widget.snapshot.screen;
    selected = widget.snapshot.operation;
    reviewed = false;
    acknowledged = false;
  }

  String _request(LifecycleSnapshot s) =>
      '${_identity(s.scope.motorcycleId)}/${_identity(s.scope.contextRevision)}/${_identity(s.scope.catalogId)}/${_identity(s.scope.catalogRevision)}/${_identity(s.requestId)}';
  bool _same(LifecycleSnapshot old) {
    final s = widget.snapshot;
    return s.scope.matches(old.scope) &&
        s.requestId == old.requestId &&
        s.plan?.subject == old.plan?.subject &&
        s.operation == old.operation &&
        s.screen == old.screen;
  }

  @override
  void didUpdateWidget(LifecycleView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_same(oldWidget.snapshot) || !widget.snapshot.readable) _reset();
  }

  LifecycleAction get _action => switch (selected) {
    LifecycleOperation.deactivate => LifecycleAction.deactivate,
    LifecycleOperation.reactivate => LifecycleAction.reactivate,
    LifecycleOperation.confirmTransferScope =>
      LifecycleAction.confirmTransferScope,
    LifecycleOperation.deleteOwnScope => LifecycleAction.deleteOwnScope,
  };

  bool _uncertain(LifecycleSnapshot s) =>
      s.phase == LifecyclePhase.failed ||
      s.phase == LifecyclePhase.unknown ||
      s.phase == LifecyclePhase.received && !s.receiptConfirmed;

  bool _canSend(LifecycleSnapshot s, LifecycleAction action) =>
      widget.onIntent != null &&
      s.effectAllowed(action) &&
      (action == LifecycleAction.reconcile
          ? _uncertain(s) && !queried.contains(_request(s))
          : s.phase == LifecyclePhase.idle &&
                selected == s.operation &&
                !sent.contains(_request(s)) &&
                (selected != LifecycleOperation.deleteOwnScope ||
                    acknowledged) &&
                (selected != LifecycleOperation.deactivate ||
                    !s.plan!.inactive) &&
                (selected != LifecycleOperation.reactivate ||
                    s.plan!.inactive));

  VoidCallback? _send(LifecycleSnapshot captured, LifecycleAction action) {
    if (!_canSend(captured, action)) return null;
    final operation = selected;
    final page = screen;
    final ack = acknowledged;
    return () {
      final now = widget.snapshot;
      if (!_same(captured) ||
          now.phase != captured.phase ||
          selected != operation ||
          screen != page ||
          acknowledged != ack ||
          !_canSend(now, action))
        return;
      setState(
        () => (action == LifecycleAction.reconcile ? queried : sent).add(
          _request(now),
        ),
      );
      widget.onIntent?.call(
        LifecycleIntent(
          now.scope,
          now.requestId,
          now.plan!.subject,
          now.operation,
          action,
        ),
      );
    };
  }

  VoidCallback? _local(LifecycleSnapshot captured, VoidCallback callback) =>
      captured.readable
      ? () {
          if (!_same(captured) ||
              !widget.snapshot.readable ||
              widget.snapshot.phase != captured.phase)
            return;
          setState(callback);
        }
      : null;

  Widget _line(String text, {int level = 0, Color? color}) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Semantics(
      header: level > 0,
      child: Text(
        text,
        style: TextStyle(
          fontSize: level == 2
              ? 32
              : level == 1
              ? 22
              : 16,
          height: 1.45,
          fontWeight: level > 0 ? FontWeight.w700 : FontWeight.w400,
          color: color ?? const Color(0xFF172033),
        ),
      ),
    ),
  );

  Widget _button(
    String label,
    VoidCallback? onPressed, {
    bool primary = false,
    bool destructive = false,
    bool? checked,
  }) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: _LifecycleButton(
      key: ValueKey('lifecycle-$label'),
      label: label,
      primary: primary,
      destructive: destructive,
      checked: checked,
      onPressed: onPressed,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final s = widget.snapshot;
    final p = s.readable ? s.plan : null;
    final waiting =
        s.phase == LifecyclePhase.submitting ||
        sent.contains(_request(s)) && s.phase == LifecyclePhase.idle;
    final uncertain = _uncertain(s);
    final activeFlow = !waiting && !uncertain && !s.receiptConfirmed;
    final rows = <Widget>[
      _line(
        p == null
            ? 'Motosiklet kapsamı şu an açılamıyor'
            : switch (screen) {
                LifecycleScreen.manage => 'Motosikleti yönet',
                LifecycleScreen.transfer => 'Aktarım kapsamını gözden geçir',
                LifecycleScreen.delete => 'Silmeden önce kapsamı kontrol et',
              },
        level: 2,
      ),
    ];
    if (p == null) {
      rows.add(
        _line(
          'Güncel kapsam ve erişim bilgisi gerekli. Özel ayrıntılar kapalı; silme veya aktarım isteği gönderilemez.',
        ),
      );
    } else {
      rows.add(_line(p.values[LifecycleField.motorcycle]!));
      if (s.offline)
        rows.add(
          _line(
            'Çevrimdışısınız. Son alınan kapsam güncel işlem izni değildir; yeni istek gönderilemez.',
          ),
        );
      if (screen == LifecycleScreen.manage) {
        rows.addAll([
          _line(
            p.inactive
                ? 'Motosiklet etkin değil. Geçmiş, kanıtlar ve düzeltmeler korunur.'
                : 'Motosiklet etkin. İşlem seçmeden önce etkisini gözden geçir.',
          ),
          _line(
            'Pasife alma silme değildir. Yeniden etkinleştirme geçmişi korur; eski bakım onayları güncel fiziksel uygunluğu kanıtlamaz.',
          ),
          _line(
            'Kritik düzeltmeler, izinli geçmiş ve başlamış işin güvenli dönüşü paket değişince kilitlenmez.',
          ),
          _line('Motosiklet ve rehber hakkı', level: 1),
          _line(
            '1 motosiklet ücretsizdir; ek motosikletler ücretlidir. Abonelikle toplam 3 motosiklet eklenebilir. Tam rehber aynı anda yalnız 1 seçili motosiklette açılır; başka motosiklet seçmek hakkı taşır, haklar üst üste eklenmez.',
          ),
          _line(
            'Fiyatlar, paket adları, ödeme dönemi ve seçim değişikliği koşulları henüz kesinleşmedi.',
          ),
        ]);
        if (activeFlow && !reviewed) {
          final preservation = p.inactive
              ? LifecycleOperation.reactivate
              : LifecycleOperation.deactivate;
          rows.add(
            _button(
              '${selected == preservation ? 'Seçili: ' : ''}${p.inactive ? 'Yeniden etkinleştir' : 'Etkin değil yap'}',
              _local(s, () {
                selected = preservation;
                acknowledged = false;
              }),
            ),
          );
          rows.add(
            _button(
              '${selected == LifecycleOperation.confirmTransferScope ? 'Seçili: ' : ''}Geçmişi aktar',
              _local(s, () {
                selected = LifecycleOperation.confirmTransferScope;
                acknowledged = false;
              }),
            ),
          );
          rows.add(_line('Kalıcı işlem', level: 1));
          rows.add(
            _button(
              '${selected == LifecycleOperation.deleteOwnScope ? 'Seçili: ' : ''}Motosikleti sil',
              _local(s, () {
                selected = LifecycleOperation.deleteOwnScope;
                acknowledged = false;
              }),
              destructive: true,
            ),
          );
          rows.add(
            _button(
              'Seçilen işlemi gözden geçir',
              _local(s, () {
                reviewed = true;
                screen = switch (selected) {
                  LifecycleOperation.confirmTransferScope =>
                    LifecycleScreen.transfer,
                  LifecycleOperation.deleteOwnScope => LifecycleScreen.delete,
                  _ => LifecycleScreen.manage,
                };
              }),
              primary: true,
            ),
          );
        } else if (reviewed) {
          rows.add(
            _line(
              selected == LifecycleOperation.reactivate
                  ? 'Yeniden etkinleştirmeden önce'
                  : 'Etkin değil yapmadan önce',
              level: 1,
            ),
          );
          rows.add(_line(p.values[LifecycleField.reactivation]!));
          rows.add(
            _line(
              'Geçmiş, bağımsız kanıtlar, kaynak ve düzeltmeler korunur. Rutin hatırlatmaların güncel durumu ayrıca değerlendirilir.',
            ),
          );
        }
      } else if (screen == LifecycleScreen.transfer) {
        rows.addAll([
          _line(
            'Kısmi geçmiş — bu kapsam motosikletin bütün geçmişi değildir.',
            color: const Color(0xFF7A4100),
          ),
          _line('Seçilen dönem', level: 1),
          _line(p.values[LifecycleField.period]!),
          _line('Aktarıma dahil', level: 1),
          _line(p.values[LifecycleField.included]!),
          _line('Kapsam boşlukları ve hariç bilgiler', level: 1),
          _line(p.values[LifecycleField.gaps]!),
          _line(p.values[LifecycleField.excluded]!),
          _line('Kaynak ve katkı izi', level: 1),
          _line(p.values[LifecycleField.attribution]!),
          _line(
            'Aktarım bir kaydı doğrulanmış yapmaz. Düzeltme, uyuşmazlık, önceki katkı ve kaynak izi korunur; seçilmeyen özel içerik aktarılmaz.',
          ),
          _line(
            'Burada yalnız kapsamı onaylama isteği hazırlanır. Aktarım hedefi sonraki adımda seçilir; bu ekrandaki onay aktarımı tamamlamaz.',
          ),
        ]);
      } else {
        rows.addAll([
          _line('Sana ait kaldırılacak kapsam', level: 1),
          _line(p.values[LifecycleField.ownDeletion]!),
          _line('Silinmeyecek bağımsız kayıtlar', level: 1),
          _line(p.values[LifecycleField.independent]!),
          _line(
            'Başka kişilerin bağımsız kanıtları, aktarılmış kopyalar ve geçmiş atıfları bu istekle otomatik silinmez.',
          ),
          _line(
            'Saklama, yedekler ve hukuki sınırlar ayrıca değerlendirilmelidir. Bu ekran bunların tümünün silineceğini garanti etmez.',
          ),
        ]);
        if (activeFlow) {
          rows.add(
            _button(
              'Geçmişi korumak için etkin değil yap',
              _local(s, () {
                selected = LifecycleOperation.deactivate;
                screen = LifecycleScreen.manage;
                reviewed = true;
                acknowledged = false;
              }),
            ),
          );
          rows.add(
            _button(
              acknowledged
                  ? 'Onay verdim: Silme kapsamını ve geri alınamayabileceğini anlıyorum'
                  : 'Onay ver: Silme kapsamını ve geri alınamayabileceğini anlıyorum',
              _local(s, () {
                acknowledged = !acknowledged;
              }),
              checked: acknowledged,
            ),
          );
        }
      }
      rows.add(_line('Açık kalan: ${p.values[LifecycleField.uncertainty]}'));
      if (waiting || uncertain || s.receiptConfirmed) {
        rows.add(
          Semantics(
            liveRegion: true,
            child: _line(
              waiting
                  ? 'İstek gönderiliyor. Aynı istek tekrar gönderilemez.'
                  : s.receiptConfirmed
                  ? 'İsteğin alındığı bildirildi. Bu, silmenin, aktarımın veya etkinlik değişiminin tamamlandığını kanıtlamaz.'
                  : queried.contains(_request(s))
                  ? 'Aynı isteğin sonucu sorgulanıyor. Yeni işlem gönderilmedi.'
                  : 'İşlemin sonucu kesinleşmedi. Yeni istek göndermeden aynı isteğin sonucunu sorgulayın.',
            ),
          ),
        );
      }
      if (uncertain) {
        rows.add(
          _button(
            'Aynı isteğin sonucunu sorgula',
            _send(s, LifecycleAction.reconcile),
            primary: true,
          ),
        );
      } else if (activeFlow && (screen != LifecycleScreen.manage || reviewed)) {
        final label = switch (selected) {
          LifecycleOperation.deactivate => 'Etkin değil yapma isteğini gönder',
          LifecycleOperation.reactivate =>
            'Yeniden etkinleştirme isteğini gönder',
          LifecycleOperation.confirmTransferScope => 'Aktarım kapsamını onayla',
          LifecycleOperation.deleteOwnScope =>
            'Yalnız bu kapsam için silme isteği gönder',
        };
        rows.add(
          _button(
            label,
            _send(s, _action),
            primary: true,
            destructive: selected == LifecycleOperation.deleteOwnScope,
          ),
        );
        if (!_canSend(s, _action))
          rows.add(
            _line(
              'İstek şu an gönderilemez. Bu işlem için güncel kapsam, işlem izni, bağlantı ve gereken açık onay gerekli.',
            ),
          );
      }
    }
    for (final action in [LifecycleAction.support, LifecycleAction.exit]) {
      rows.add(
        _button(
          action == LifecycleAction.support ? 'Destek' : 'Vazgeç',
          widget.onIntent == null
              ? null
              : () {
                  final now = widget.snapshot;
                  widget.onIntent?.call(
                    LifecycleIntent(
                      now.scope,
                      now.requestId,
                      '',
                      now.operation,
                      action,
                    ),
                  );
                },
        ),
      );
    }
    return ColoredBox(
      color: const Color(0xFFF5F7FB),
      child: FocusTraversalGroup(
        policy: ReadingOrderTraversalPolicy(),
        child: SingleChildScrollView(
          key: const ValueKey('lifecycle-scroll'),
          padding: const EdgeInsets.all(24),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: rows,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LifecycleButton extends StatefulWidget {
  const _LifecycleButton({
    super.key,
    required this.label,
    required this.primary,
    required this.destructive,
    required this.checked,
    required this.onPressed,
  });
  final String label;
  final bool primary, destructive;
  final bool? checked;
  final VoidCallback? onPressed;
  @override
  State<_LifecycleButton> createState() => _LifecycleButtonState();
}

class _LifecycleButtonState extends State<_LifecycleButton> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    final active = widget.onPressed != null;
    final background = !active
        ? const Color(0xFFE3E8F0)
        : widget.primary
        ? widget.destructive
              ? const Color(0xFFAA1830)
              : const Color(0xFF0E5BD8)
        : const Color(0xFFFFFFFF);
    final foreground = active && widget.primary
        ? const Color(0xFFFFFFFF)
        : widget.destructive && active
        ? const Color(0xFFAA1830)
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
        checked: widget.checked,
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
