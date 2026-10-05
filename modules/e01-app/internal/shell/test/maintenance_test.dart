import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/maintenance.dart';
import 'package:kavriva_shell/kavriva_shell.dart';

// Bütün kaynaklar fixture; gerçek bakım üreticisi veya kalıcı kayıt yoktur.
const _request = 'maintenance-request-example';
MaintenanceScope _scope({
  String bike = 'bike-example',
  String context = 'context-r1',
  String plan = 'plan-example',
  String revision = 'plan-r1',
}) => MaintenanceScope(
  motorcycleId: bike,
  contextRevision: context,
  planId: plan,
  planRevision: revision,
  motorcycleLabel: 'Örnek motosiklet · kullanıcı beyanı',
);
MaintenanceReference _ref(
  String purpose,
  String subject, {
  MaintenanceScope? scope,
  String request = _request,
  bool current = true,
  MaintenanceReferenceState state = MaintenanceReferenceState.confirmed,
  String source = 'Örnek bakım kaynağı · test verisi',
}) => MaintenanceReference(
  scope: scope ?? _scope(),
  requestId: request,
  purpose: purpose,
  subjectId: subject,
  source: source,
  version: 'örnek-r1',
  location: 'Örnek bölüm · test verisi',
  checkedAt: '2026-10-05',
  current: current,
  state: state,
  reason: 'Yalnız sunum testi için örnek değerlendirme.',
);
const _gated = [
  MaintenanceAction.previewGuide,
  MaintenanceAction.recordEntry,
  MaintenanceAction.postponeReminder,
];
MaintenancePermit _permit(
  MaintenanceAction action,
  String subject, {
  Map<MaintenanceDimension, MaintenanceReference?> overrides = const {},
}) => MaintenancePermit(
  action: action,
  dimensions: {
    for (final d in MaintenanceDimension.values)
      d: overrides.containsKey(d)
          ? overrides[d]
          : _ref('maintenance-action:${action.name}', '$subject/${d.name}'),
  },
);
MaintenanceItem _item({
  String id = 'item-example',
  String revision = 'item-r1',
  MaintenanceScope? scope,
  String title = 'Fren kontrolü',
  MaintenanceReference? source,
  bool missingSource = false,
  MaintenanceHistoryKind historyKind = MaintenanceHistoryKind.verified,
  MaintenanceReference? historyRef,
  bool missingHistory = false,
  String? historyText,
  MaintenanceTimingKind timingKind = MaintenanceTimingKind.supported,
  MaintenanceReference? timingRef,
  bool missingTiming = false,
  bool missingPermits = false,
  Map<MaintenanceAction, MaintenancePermit> overrides = const {},
}) {
  final subject = '${Uri.encodeComponent(id)}/${Uri.encodeComponent(revision)}';
  return MaintenanceItem(
    scope: scope ?? _scope(),
    id: id,
    revision: revision,
    title: title,
    whyShown: 'Örnek bakım kaynağı bu işi seçili motosikletin bakım planına bağlıyor.',
    source: missingSource
        ? null
        : source ?? _ref('maintenance-source', subject),
    history: MaintenanceHistory(
      id: 'work-example',
      revision: 'work-r1',
      kind: historyKind,
      explanation:
          historyText ??
          (historyKind == MaintenanceHistoryKind.userReported
              ? 'Bu bilgi kullanıcının beyanıdır; işin doğrulanmış olduğu anlamına gelmez.'
              : historyKind == MaintenanceHistoryKind.unknown
              ? 'Bu örnek kayıtta bakımın yapılmış olduğunu destekleyen doğrulanmış bilgi yok.'
              : 'Örnek yapılmış bakım kaydının kaynağı ve inceleme bilgisi korunur.'),
      authority: missingHistory
          ? null
          : historyRef ??
                _ref('maintenance-history', '$subject/work-example/work-r1'),
    ),
    timing: MaintenanceTiming(
      kind: timingKind,
      label: 'Takip zamanı yaklaşıyor',
      explanation:
          'Kaynak ve doğrulanmış geçmiş bu takip durumunu destekliyor.',
      authority: missingTiming
          ? null
          : timingRef ?? _ref('maintenance-timing', subject),
    ),
    priorityReason: 'Örnek kaynak bu iş için kontrol edilmesi gereken kullanım etkisi bildiriyor.',
    knownAge: null,
    nextCheck: 'Güncel kaynağı ve ilgili geçmiş kaydını kontrol et.',
    permits: missingPermits
        ? {}
        : {for (final a in _gated) a: overrides[a] ?? _permit(a, subject)},
  );
}

MaintenancePlan _plan({
  MaintenanceScope? scope,
  String request = _request,
  List<MaintenanceItem>? items,
  MaintenanceReference? catalog,
  bool missingCatalog = false,
  MaintenanceReference? priority,
  bool missingPriority = false,
  List<String>? order,
  List<MaintenanceNotice> notices = const [],
}) {
  final values =
      items ??
      [
        _item(),
        _item(id: 'visibility-example', title: 'Görüş sistemi kontrolü'),
      ];
  final sorted = order ?? values.reversed.map((i) => i.id).toList();
  final own = scope ?? _scope();
  final subject =
      '${own.subject}/members:${values.where((i) => i.scope.matches(own)).map((i) => i.subject).join(',')}/order:${sorted.map((id) => values.firstWhere((i) => i.id == id).subject).join(',')}';
  return MaintenancePlan(
    scope: own,
    requestId: request,
    items: values,
    priorityOrder: sorted,
    notices: notices,
    catalogAuthority: missingCatalog
        ? null
        : catalog ?? _ref('maintenance-plan', own.subject),
    priorityAuthority: missingPriority
        ? null
        : priority ?? _ref('maintenance-priority', subject),
  );
}

MaintenanceNotice _notice({
  bool held = false,
  bool foreign = false,
  String message = 'Örnek güvenlik kaynağından önemli uyarı. Güncel destek yolunu kontrol et.',
}) => MaintenanceNotice(
  id: 'notice-example',
  revision: 'notice-r1',
  message: message,
  authority: _ref(
    'maintenance-notice',
    'notice-example/notice-r1',
    scope: foreign ? _scope(bike: 'other') : null,
    state: held
        ? MaintenanceReferenceState.held
        : MaintenanceReferenceState.confirmed,
  ),
);
MaintenanceView _view({
  MaintenancePlan? plan,
  bool missingPlan = false,
  MaintenanceScope? scope,
  String request = _request,
  MaintenancePage page = MaintenancePage.detail,
  String? selected = 'item-example',
  MaintenanceRequestPhase phase = MaintenanceRequestPhase.idle,
  bool noHandler = false,
  ValueChanged<MaintenanceIntent>? record,
}) => MaintenanceView(
  scope: scope ?? _scope(),
  requestId: request,
  brandLabel: 'Kavriva · test örneği',
  plan: missingPlan ? null : plan ?? _plan(),
  initialPage: page,
  initialItemId: selected,
  phase: phase,
  onIntent: noHandler ? null : record ?? (_) {},
);
Widget _app(Widget content, {double scale = 1, String? font}) => _Input(
  content: content,
  scale: scale,
  font: font,
  child: WidgetsApp(
    color: const Color(0xFFFFFFFF),
    debugShowCheckedModeBanner: false,
    onGenerateRoute: (_) =>
        PageRouteBuilder<void>(pageBuilder: (_, __, ___) => const _Scene()),
  ),
);

class _Input extends InheritedWidget {
  const _Input({
    required this.content,
    required this.scale,
    required this.font,
    required super.child,
  });
  final Widget content;
  final double scale;
  final String? font;
  @override
  bool updateShouldNotify(_Input old) =>
      content != old.content || scale != old.scale || font != old.font;
}

class _Scene extends StatelessWidget {
  const _Scene();
  @override
  Widget build(BuildContext context) {
    final v = context.dependOnInheritedWidgetOfExactType<_Input>()!;
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: TextScaler.linear(v.scale)),
      child: DefaultTextStyle(
        style: TextStyle(
          fontFamily: v.font,
          fontSize: 16,
          color: const Color(0xFF172033),
        ),
        child: KavrivaShell(
          pages: {
            for (final s in KavrivaSection.values)
              s: s == KavrivaSection.maintenance ? v.content : const SizedBox(),
          },
          selectedSection: KavrivaSection.maintenance,
          showNavigation: false,
          onSectionRequested: null,
        ),
      ),
    );
  }
}

Future<void> _pump(WidgetTester t, Widget v, {double scale = 1}) async {
  await t.pumpWidget(_app(v, scale: scale));
  await t.pumpAndSettle();
}

Finder _action(MaintenanceAction action) => find.byWidgetPredicate(
  (widget) =>
      widget.key is ValueKey<String> &&
      (widget.key! as ValueKey<String>).value.startsWith(
        'maintenance-action-${action.name}',
      ),
);
bool _enabled(WidgetTester t, MaintenanceAction action) => t
    .widget<FocusableActionDetector>(
      find
          .descendant(
            of: _action(action).first,
            matching: find.byType(FocusableActionDetector),
          )
          .first,
    )
    .enabled;
Future<void> _tap(WidgetTester t, Finder f) async {
  await t.ensureVisible(f);
  await t.pumpAndSettle();
  await t.tap(f);
  await t.pumpAndSettle();
}

MaintenancePlan _otherItemsPlan() => _plan(
  items: [
    _item(),
    _item(id: 'visibility-example', title: 'Görüş sistemi kontrolü'),
    _item(
      id: 'routine-example',
      title: 'Diğer rutin bakım',
      historyKind: MaintenanceHistoryKind.unknown,
    ),
  ],
  order: ['visibility-example', 'item-example'],
);
Map<String, MaintenanceView> _states() => {
  'plan': _view(page: MaintenancePage.plan),
  'empty-plan': _view(
    page: MaintenancePage.plan,
    plan: _plan(items: []),
  ),
  'missing-plan': _view(page: MaintenancePage.plan, missingPlan: true),
  'foreign-plan': _view(
    page: MaintenancePage.plan,
    plan: _plan(scope: _scope(bike: 'other')),
  ),
  'loading-plan': _view(
    page: MaintenancePage.plan,
    missingPlan: true,
    phase: MaintenanceRequestPhase.submitting,
  ),
  'detail-supported': _view(),
  'detail-source-open': _view(),
  'detail-unknown-source': _view(
    plan: _plan(items: [_item(missingSource: true)]),
  ),
  'detail-user-reported': _view(
    plan: _plan(
      items: [_item(historyKind: MaintenanceHistoryKind.userReported)],
    ),
  ),
  'detail-unknown-history': _view(
    plan: _plan(items: [_item(missingHistory: true)]),
  ),
  'detail-held-history': _view(
    plan: _plan(
      items: [
        _item(
          historyRef: _ref(
            'maintenance-history',
            'item-example/item-r1/work-example/work-r1',
            state: MaintenanceReferenceState.held,
          ),
        ),
      ],
    ),
  ),
  'detail-stale-source': _view(
    plan: _plan(
      items: [
        _item(
          source: _ref(
            'maintenance-source',
            'item-example/item-r1',
            current: false,
          ),
        ),
      ],
    ),
  ),
  'detail-stale-history': _view(
    plan: _plan(
      items: [
        _item(
          historyRef: _ref(
            'maintenance-history',
            'item-example/item-r1/work-example/work-r1',
            current: false,
          ),
        ),
      ],
    ),
  ),
  'detail-uncertain-timing': _view(
    plan: _plan(items: [_item(timingKind: MaintenanceTimingKind.uncertain)]),
  ),
  'detail-stale-timing-revision': _view(
    plan: _plan(
      items: [
        _item(
          timingRef: _ref('maintenance-timing', 'item-example/old-revision'),
        ),
      ],
    ),
  ),
  'detail-foreign-source': _view(
    plan: _plan(
      items: [
        _item(
          source: _ref(
            'maintenance-source',
            'item-example/item-r1',
            scope: _scope(bike: 'other'),
          ),
        ),
      ],
    ),
  ),
  'detail-missing-permit': _view(
    plan: _plan(items: [_item(missingPermits: true)]),
  ),
  'detail-held-permit': _view(
    plan: _plan(
      items: [
        _item(
          overrides: {
            MaintenanceAction.postponeReminder: _permit(
              MaintenanceAction.postponeReminder,
              'item-example/item-r1',
              overrides: {MaintenanceDimension.authorization: null},
            ),
          },
        ),
      ],
    ),
  ),
  'detail-outcome-unknown': _view(
    phase: MaintenanceRequestPhase.outcomeUnknown,
  ),
  'detail-error': _view(phase: MaintenanceRequestPhase.failed),
  'detail-submitting': _view(phase: MaintenanceRequestPhase.submitting),
  'detail-no-handler': _view(noHandler: true),
  'detail-critical': _view(plan: _plan(notices: [_notice()])),
  'detail-critical-held': _view(
    plan: _plan(notices: [_notice(held: true, message: 'PRIVATE-NOTICE')]),
  ),
  'detail-critical-foreign': _view(
    plan: _plan(notices: [_notice(foreign: true, message: 'PRIVATE-NOTICE')]),
  ),
  'detail-postpone-sent': _view(plan: _plan(notices: [_notice()])),
  'catchup': _view(page: MaintenancePage.catchUp),
  'catchup-with-other-items': _view(
    page: MaintenancePage.catchUp,
    plan: _otherItemsPlan(),
  ),
  'catchup-unknown-priority': _view(
    page: MaintenancePage.catchUp,
    plan: _plan(missingPriority: true),
  ),
  'catchup-foreign-priority': _view(
    page: MaintenancePage.catchUp,
    plan: _plan(
      priority: _ref(
        'maintenance-priority',
        'private',
        scope: _scope(bike: 'other'),
      ),
    ),
  ),
  'catchup-stale-priority': _view(
    page: MaintenancePage.catchUp,
    plan: _plan(
      priority: _ref(
        'maintenance-priority',
        'plan-example/plan-r1/visibility-example/item-r1,item-example/old-revision',
      ),
    ),
  ),
};
Future<void> _prepareState(WidgetTester t, String name) async {
  if (name == 'detail-source-open')
    await _tap(t, find.byKey(const ValueKey('maintenance-source-details')));
  if (name == 'detail-postpone-sent')
    await _tap(t, _action(MaintenanceAction.postponeReminder));
}

void main() {
  test('R7 virgüllü kimlik eski öncelik kanıtını başka listeye taşıyamaz', () {
    final original = _plan(
      items: [_item(id: 'a', revision: 'b,c/d')],
    );
    final changed = _plan(
      items: [
        _item(id: 'a', revision: 'b'),
        _item(id: 'c', revision: 'd'),
      ],
      order: ['a', 'c'],
      priority: original.priorityAuthority,
    );
    expect(changed.priorityConfirmed(_scope(), _request), isFalse);
    final fresh = _plan(items: changed.items, order: changed.priorityOrder);
    expect(fresh.priorityConfirmed(_scope(), _request), isTrue);
  });

  testWidgets(
    'R7 sıralanmamış üyelik değişince eski öncelik kanıtı reddedilir',
    (t) async {
      final original = _otherItemsPlan();
      final variants = [
        original.items.take(2).toList(),
        [...original.items, _item(id: 'added-item')],
        [
          ...original.items.take(2),
          _item(id: original.items.last.id, revision: 'new-revision'),
        ],
      ];
      for (final values in variants) {
        final changed = _plan(
          items: values,
          order: original.priorityOrder,
          priority: original.priorityAuthority,
        );
        await _pump(t, _view(page: MaintenancePage.catchUp, plan: changed));
        expect(find.text('Öncelik sırası henüz doğrulanmadı'), findsOneWidget);
      }
    },
  );
  testWidgets('R7 eski düğme yeni isteğin olumlu izinlerini kullanamaz', (
    t,
  ) async {
    final sent = <MaintenanceIntent>[];
    final action = MaintenanceAction.previewGuide;
    await _pump(t, _view(record: sent.add));
    final oldTap = t
        .widget<GestureDetector>(
          find
              .descendant(
                of: _action(action),
                matching: find.byType(GestureDetector),
              )
              .first,
        )
        .onTap!;
    const next = 'request-next';
    final current = _item(
      overrides: {
        action: _permit(
          action,
          'item-example/item-r1',
          overrides: {
            for (final dimension in MaintenanceDimension.values)
              dimension: _ref(
                'maintenance-action:${action.name}',
                'item-example/item-r1/${dimension.name}',
                request: next,
              ),
          },
        ),
      },
    );
    final plan = _plan(
      request: next,
      items: [current],
      catalog: _ref('maintenance-plan', _scope().subject, request: next),
    );
    await _pump(t, _view(request: next, plan: plan, record: sent.add));
    expect(_enabled(t, action), isTrue);
    oldTap();
    await t.pumpAndSettle();
    expect(sent, isEmpty);
    await _tap(t, _action(action));
    expect(sent.single.requestId, next);
    await t.pumpWidget(const SizedBox());
    oldTap();
    expect(sent.length, 1);
  });
  testWidgets('R7 ayraç içeren farklı işlerin kaynak ve izinleri karışmaz', (
    t,
  ) async {
    final sourceItem = _item(id: 'x/y', revision: 'z');
    final other = _item(
      id: 'x',
      revision: 'y/z',
      source: sourceItem.source,
      timingRef: sourceItem.timing.authority,
      historyRef: sourceItem.history.authority,
      overrides: sourceItem.permits,
    );
    expect(other.sourceConfirmed(_scope(), _request), isFalse);
    expect(other.historyConfirmed(_scope(), _request), isFalse);
    expect(other.timingConfirmed(_scope(), _request), isFalse);
    final sent = <MaintenanceIntent>[];
    await _pump(
      t,
      _view(
        plan: _plan(items: [other]),
        selected: 'x',
        record: sent.add,
      ),
    );
    expect(find.text('Bakım zamanı net değil'), findsOneWidget);
    for (final action in _gated) {
      expect(_enabled(t, action), isFalse);
      await _tap(t, _action(action));
    }
    expect(sent, isEmpty);
  });

  WidgetController.hitTestWarningShouldBeFatal = true;
  testWidgets(
    'Plan ayrıntıya gider; rehber, kayıt ve erteleme farklı niyetlerdir',
    (t) async {
      final sent = <MaintenanceIntent>[];
      await _pump(t, _view(page: MaintenancePage.plan, record: sent.add));
      await _tap(
        t,
        find.byKey(const ValueKey('maintenance-item-item-example')),
      );
      for (final action in _gated) await _tap(t, _action(action));
      expect(sent.map((i) => i.action), _gated);
      expect(
        sent.every(
          (i) =>
              i.scope.matches(_scope()) &&
              i.requestId == _request &&
              i.itemId == 'item-example' &&
              i.itemRevision == 'item-r1',
        ),
        isTrue,
      );
      expect(find.text('İstek gönderildi'), findsOneWidget);
      expect(
        find.textContaining('bakım tamamlandı diye kabul edilmedi'),
        findsOneWidget,
      );
      expect(_enabled(t, MaintenanceAction.postponeReminder), isFalse);
    },
  );
  testWidgets('Kaynak ve doğrulanmış geçmiş olmadan bakım zamanı üretilmez', (
    t,
  ) async {
    final cases = [
      _item(missingSource: true),
      _item(missingHistory: true),
      _item(historyKind: MaintenanceHistoryKind.userReported),
      _item(missingTiming: true),
      _item(timingKind: MaintenanceTimingKind.uncertain),
      _item(source: _ref('wrong-purpose', 'item-example/item-r1')),
      _item(
        historyRef: _ref(
          'maintenance-history',
          'item-example/item-r1/work-example/old',
        ),
      ),
      _item(timingRef: _ref('maintenance-timing', 'item-example/old')),
    ];
    for (final item in cases) {
      await _pump(t, _view(plan: _plan(items: [item])));
      expect(find.text('Bakım zamanı net değil'), findsOneWidget);
      expect(find.text('Takip zamanı yaklaşıyor'), findsNothing);
      expect(
        find.textContaining(
          'Tarih, kilometre veya gecikme durumu tahmin edilmiyor',
        ),
        findsOneWidget,
      );
    }
    await _pump(t, _view());
    expect(find.text('Takip zamanı yaklaşıyor'), findsOneWidget);
  });
  testWidgets('Kullanıcı beyanı kayıtlı olsa bile verified bakım olmaz', (
    t,
  ) async {
    await _pump(
      t,
      _view(
        plan: _plan(
          items: [_item(historyKind: MaintenanceHistoryKind.userReported)],
        ),
      ),
    );
    expect(find.textContaining('Yalnız kaydedilmiş olması'), findsOneWidget);
    expect(
      find.text('Kullanılabilir doğrulanmış yapılmış bakım geçmişi sunuldu.'),
      findsNothing,
    );
    expect(_enabled(t, MaintenanceAction.previewGuide), isTrue);
    expect(
      find.textContaining(
        'Bugün bakım gerekliliği veya uygulama izni değildir',
      ),
      findsOneWidget,
    );
    expect(
      find.textContaining('hazırlık koşulları ayrıca kontrol edilir'),
      findsOneWidget,
    );
  });
  testWidgets('Yabancı veya eski plan hiçbir özel iş bilgisi göstermez', (
    t,
  ) async {
    final foreign = [
      _scope(bike: 'other'),
      _scope(context: 'old'),
      _scope(plan: 'other'),
      _scope(revision: 'old'),
    ];
    for (final scope in foreign) {
      await _pump(
        t,
        _view(
          plan: _plan(
            scope: scope,
            items: [_item(title: 'PRIVATE-ITEM')],
          ),
        ),
      );
      expect(find.textContaining('PRIVATE'), findsNothing);
      expect(
        find.textContaining('Bu bakım işi henüz doğrulanamadı'),
        findsOneWidget,
      );
      expect(_action(MaintenanceAction.postponeReminder), findsNothing);
    }
  });
  testWidgets('Yabancı, held veya unknown geçmiş ayrıntısı ve kaynak sızmaz', (
    t,
  ) async {
    final refs = [
      _ref(
        'maintenance-history',
        'item-example/item-r1/work-example/work-r1',
        scope: _scope(bike: 'other'),
      ),
      _ref(
        'maintenance-history',
        'item-example/item-r1/work-example/work-r1',
        state: MaintenanceReferenceState.held,
      ),
      _ref(
        'maintenance-history',
        'item-example/item-r1/work-example/work-r1',
        state: MaintenanceReferenceState.unknown,
      ),
    ];
    for (final ref in refs) {
      await _pump(
        t,
        _view(
          plan: _plan(
            items: [
              _item(
                historyRef: ref,
                historyText: 'PRIVATE-HISTORY',
                source: _ref(
                  'maintenance-source',
                  'item-example/item-r1',
                  scope: _scope(bike: 'other'),
                  source: 'PRIVATE-SOURCE',
                ),
              ),
            ],
          ),
        ),
      );
      expect(find.textContaining('PRIVATE'), findsNothing);
      expect(
        find.byKey(const ValueKey('maintenance-source-details')),
        findsNothing,
      );
    }
  });
  testWidgets('Her eksik veya olumsuz işlem boyutu ilgili eylemi kapatır', (
    t,
  ) async {
    for (final action in _gated)
      for (final dimension in MaintenanceDimension.values) {
        for (final state in [
          null,
          MaintenanceReferenceState.held,
          MaintenanceReferenceState.unknown,
        ]) {
          final permit = _permit(
            action,
            'item-example/item-r1',
            overrides: {
              dimension: state == null
                  ? null
                  : _ref(
                      'maintenance-action:${action.name}',
                      'item-example/item-r1/${dimension.name}',
                      state: state,
                    ),
            },
          );
          await _pump(
            t,
            _view(
              plan: _plan(
                items: [
                  _item(overrides: {action: permit}),
                ],
              ),
            ),
          );
          expect(
            _enabled(t, action),
            isFalse,
            reason: '$action/$dimension/$state',
          );
        }
      }
  });
  testWidgets('Eski kapsam, istek, amaç ve item revizyonu izin sayılmaz', (
    t,
  ) async {
    final action = MaintenanceAction.postponeReminder;
    final refs = [
      _ref(
        'maintenance-action:${action.name}',
        'item-example/item-r1/audit',
        current: false,
      ),
      _ref(
        'maintenance-action:${action.name}',
        'item-example/item-r1/audit',
        scope: _scope(context: 'old'),
      ),
      _ref(
        'maintenance-action:${action.name}',
        'item-example/item-r1/audit',
        request: 'old-request',
      ),
      _ref('wrong-purpose', 'item-example/item-r1/audit'),
      _ref('maintenance-action:${action.name}', 'item-example/old/audit'),
    ];
    for (final ref in refs) {
      final sent = <MaintenanceIntent>[];
      await _pump(
        t,
        _view(
          record: sent.add,
          plan: _plan(
            items: [
              _item(
                overrides: {
                  action: _permit(
                    action,
                    'item-example/item-r1',
                    overrides: {MaintenanceDimension.audit: ref},
                  ),
                },
              ),
            ],
          ),
        ),
      );
      expect(_enabled(t, action), isFalse);
      await _tap(t, _action(action));
      expect(sent, isEmpty);
    }
  });
  testWidgets(
    'Gecikmiş eski düğme olayı güncel kapalı izni veya silinmiş işi kullanamaz',
    (t) async {
      final action = MaintenanceAction.postponeReminder;
      final replacement = [
        _plan(
          items: [
            _item(
              overrides: {
                action: _permit(
                  action,
                  'item-example/item-r1',
                  overrides: {MaintenanceDimension.authorization: null},
                ),
              },
            ),
          ],
        ),
        _plan(items: [_item(revision: 'item-r2')]),
        _plan(items: []),
      ];
      for (final currentPlan in replacement) {
        await t.pumpWidget(const SizedBox());
        final sent = <MaintenanceIntent>[];
        await _pump(t, _view(record: sent.add));
        final oldTap = t
            .widget<GestureDetector>(
              find
                  .descendant(
                    of: _action(action),
                    matching: find.byType(GestureDetector),
                  )
                  .first,
            )
            .onTap!;
        await _pump(t, _view(plan: currentPlan, record: sent.add));
        oldTap();
        await t.pumpAndSettle();
        expect(sent, isEmpty);
      }
    },
  );
  testWidgets(
    'Erteleme kritik uyarıyı gizlemez ve aynı isteği tekrar göndermez',
    (t) async {
      final sent = <MaintenanceIntent>[];
      final plan = _plan(notices: [_notice()]);
      await _pump(t, _view(plan: plan, record: sent.add));
      await _tap(t, _action(MaintenanceAction.postponeReminder));
      await _tap(t, _action(MaintenanceAction.postponeReminder));
      expect(sent.length, 1);
      expect(find.text('Önemli güvenlik bilgisi'), findsOneWidget);
      await _pump(
        t,
        _view(
          plan: _plan(notices: [_notice()]),
          record: sent.add,
        ),
      );
      expect(_enabled(t, MaintenanceAction.postponeReminder), isFalse);
      expect(find.text('Önemli güvenlik bilgisi'), findsOneWidget);
    },
  );
  testWidgets(
    'Unknown istek başarı değildir; yalnız aynı istek uzlaştırma niyeti',
    (t) async {
      final sent = <MaintenanceIntent>[];
      await _pump(
        t,
        _view(phase: MaintenanceRequestPhase.outcomeUnknown, record: sent.add),
      );
      for (final action in _gated) {
        expect(_enabled(t, action), isFalse);
        await _tap(t, _action(action));
      }
      await _tap(t, _action(MaintenanceAction.reconcile));
      expect(sent.single.action, MaintenanceAction.reconcile);
      expect(sent.single.requestId, _request);
      expect(sent.single.itemId, isNull);
      expect(
        find.textContaining('başarılı veya başarısız olduğu doğrulanmadı'),
        findsOneWidget,
      );
    },
  );
  testWidgets('Busy, hata ve işleyici yokluğu normal etki yolunu kapatır', (
    t,
  ) async {
    for (final phase in [
      MaintenanceRequestPhase.submitting,
      MaintenanceRequestPhase.failed,
    ]) {
      await _pump(t, _view(phase: phase));
      for (final a in _gated) expect(_enabled(t, a), isFalse);
    }
    await _pump(t, _view(noHandler: true));
    for (final a in _gated) expect(_enabled(t, a), isFalse);
  });
  testWidgets('Öncelik destekli kullanım etkisidir; fren daima önce değil', (
    t,
  ) async {
    await _pump(t, _view(page: MaintenancePage.catchUp));
    final visibility = t.getTopLeft(find.text('Görüş sistemi kontrolü').first);
    final brake = t.getTopLeft(find.textContaining('Fren kontrolü').first);
    expect(visibility.dy, lessThan(brake.dy));
    final firstButton = t.widget<Container>(
      find
          .descendant(
            of: find.byKey(
              const ValueKey('maintenance-item-visibility-example'),
            ),
            matching: find.byType(Container),
          )
          .first,
    );
    expect(
      (firstButton.decoration! as BoxDecoration).color,
      const Color(0xFF0E5BD8),
    );
    expect(
      find.textContaining('Konunun yaşı için yeterli bilgi yok'),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('maintenance-return-plan')),
      findsOneWidget,
    );
    await _tap(t, find.byKey(const ValueKey('maintenance-return-plan')));
    expect(find.text('Bakım planı'), findsOneWidget);
  });
  testWidgets(
    'Öncelik listesine girmeyen rutin iş ve belirsiz zamanı kaybolmaz',
    (t) async {
      await _pump(
        t,
        _view(page: MaintenancePage.catchUp, plan: _otherItemsPlan()),
      );
      expect(find.text('Plandaki diğer işler'), findsOneWidget);
      expect(find.textContaining('Diğer rutin bakım'), findsOneWidget);
      await _tap(
        t,
        find.byKey(const ValueKey('maintenance-item-routine-example')),
      );
      expect(find.text('Bakım zamanı net değil'), findsOneWidget);
      expect(find.text('Diğer rutin bakım'), findsOneWidget);
      expect(find.text('Takip zamanı yaklaşıyor'), findsNothing);
      await _tap(t, find.byKey(const ValueKey('maintenance-return-plan')));
      expect(find.text('Bakım planı'), findsOneWidget);
      expect(
        find.byKey(const ValueKey('maintenance-item-routine-example')),
        findsOneWidget,
      );
    },
  );
  testWidgets('Öncelik desteklenmiyorsa sıra ve neden tahmin edilmez', (
    t,
  ) async {
    await _pump(
      t,
      _view(page: MaintenancePage.catchUp, plan: _plan(missingPriority: true)),
    );
    expect(find.text('Öncelik sırası henüz doğrulanmadı'), findsOneWidget);
    expect(find.text('Önce kontrol edilecek iş'), findsNothing);
    expect(find.textContaining('Örnek kaynak bu iş için'), findsNothing);
  });
  testWidgets('Item revizyonu değişince eski öncelik kararı kullanılamaz', (
    t,
  ) async {
    final old = _plan();
    final changed = _plan(
      items: [
        _item(revision: 'item-r2'),
        _item(id: 'visibility-example'),
      ],
      priority: old.priorityAuthority,
    );
    await _pump(t, _view(page: MaintenancePage.catchUp, plan: changed));
    expect(find.text('Öncelik sırası henüz doğrulanmadı'), findsOneWidget);
  });
  testWidgets(
    'Private kritik uyarının kendisi değil dürüst kontrol gereği görünür',
    (t) async {
      for (final n in [
        _notice(held: true, message: 'PRIVATE-NOTICE'),
        _notice(foreign: true, message: 'PRIVATE-NOTICE'),
      ]) {
        await _pump(t, _view(plan: _plan(notices: [n])));
        expect(find.textContaining('PRIVATE'), findsNothing);
        expect(find.text('Güvenlik bilgisi kontrol edilmeli'), findsOneWidget);
      }
    },
  );
  testWidgets('Kaynak ayrıntısı isteğe bağlı; değişen kaynakta kapanır', (
    t,
  ) async {
    await _pump(t, _view());
    await _tap(t, find.byKey(const ValueKey('maintenance-source-details')));
    expect(find.textContaining('Kaynak: Örnek bakım kaynağı'), findsOneWidget);
    await _pump(t, _view(plan: _plan(items: [_item(missingSource: true)])));
    expect(find.textContaining('Kaynak: Örnek bakım kaynağı'), findsNothing);
    expect(find.text('Bakım zamanı net değil'), findsOneWidget);
  });
  testWidgets(
    'Aynı bağlamdaki kaynak yenilenince seçili iş kalır; eski ayrıntı kapanır',
    (t) async {
      await _pump(t, _view(page: MaintenancePage.plan));
      await _tap(
        t,
        find.byKey(const ValueKey('maintenance-item-item-example')),
      );
      await _tap(t, find.byKey(const ValueKey('maintenance-source-details')));
      expect(
        find.textContaining('Kaynak: Örnek bakım kaynağı'),
        findsOneWidget,
      );
      await _pump(
        t,
        _view(
          page: MaintenancePage.plan,
          plan: _plan(items: [_item(missingSource: true)]),
        ),
      );
      expect(find.text('Bakım zamanı net değil'), findsOneWidget);
      expect(find.text('Fren kontrolü'), findsOneWidget);
      expect(
        find.byKey(const ValueKey('maintenance-return-plan')),
        findsOneWidget,
      );
      expect(find.textContaining('Kaynak: Örnek bakım kaynağı'), findsNothing);
      await _pump(
        t,
        _view(
          page: MaintenancePage.plan,
          scope: _scope(context: 'context-r2'),
        ),
      );
      expect(find.text('Bakım planı'), findsOneWidget);
      expect(find.textContaining('Fren kontrolü'), findsNothing);
    },
  );
  testWidgets('Yeni istek eski planı veya izni tekrar kullanamaz', (t) async {
    final sent = <MaintenanceIntent>[];
    await _pump(t, _view(record: sent.add));
    await _tap(t, _action(MaintenanceAction.postponeReminder));
    await _pump(t, _view(request: 'new-request', record: sent.add));
    expect(_action(MaintenanceAction.postponeReminder), findsNothing);
    expect(sent.length, 1);
  });
  testWidgets('Geçmiş, destek ve çıkış belirsizlikte erişilebilir kalır', (
    t,
  ) async {
    final sent = <MaintenanceIntent>[];
    await _pump(
      t,
      _view(
        missingPlan: true,
        phase: MaintenanceRequestPhase.outcomeUnknown,
        record: sent.add,
      ),
    );
    for (final a in [
      MaintenanceAction.history,
      MaintenanceAction.support,
      MaintenanceAction.exit,
    ]) {
      expect(_enabled(t, a), isTrue);
      await _tap(t, _action(a).last);
    }
    expect(sent.map((i) => i.action), [
      MaintenanceAction.history,
      MaintenanceAction.support,
      MaintenanceAction.exit,
    ]);
    expect(
      sent.every((i) => i.scope.matches(_scope()) && i.itemId == null),
      isTrue,
    );
  });
  testWidgets('Disabled semantics ve belirsizlik canlı alanı doğru', (t) async {
    final semantics = t.ensureSemantics();
    try {
      await _pump(t, _view(phase: MaintenanceRequestPhase.submitting));
      final node = t.getSemantics(
        find
            .descendant(
              of: _action(MaintenanceAction.postponeReminder),
              matching: find.byType(Semantics),
            )
            .first,
      );
      expect(
        node.getSemanticsData().flagsCollection.isEnabled,
        ui.Tristate.isFalse,
      );
      expect(
        t
            .widgetList<Semantics>(find.byType(Semantics))
            .where((s) => s.properties.liveRegion == true),
        isNotEmpty,
      );
    } finally {
      semantics.dispose();
    }
  });
  testWidgets('Gerçek Tab, Enter ve Space yalnız odaktaki eylemi çalıştırır', (
    t,
  ) async {
    final sent = <MaintenanceIntent>[];
    await _pump(t, _view(record: sent.add));
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pumpAndSettle();
    await t.sendKeyEvent(LogicalKeyboardKey.enter);
    await t.pumpAndSettle();
    await t.sendKeyEvent(LogicalKeyboardKey.space);
    await t.pumpAndSettle();
    expect(sent.length, 2);
    expect(
      sent.every((i) => i.action == MaintenanceAction.previewGuide),
      isTrue,
    );
    await _pump(
      t,
      _view(record: sent.add, phase: MaintenanceRequestPhase.outcomeUnknown),
    );
    expect(_enabled(t, MaintenanceAction.postponeReminder), isFalse);
  });
  testWidgets(
    'Odaktaki normal eylem kapanınca eski tuş etkinleşmesi gönderilemez',
    (t) async {
      final sent = <MaintenanceIntent>[];
      await _pump(t, _view(record: sent.add));
      for (var step = 0; step < 1; step++) {
        await t.sendKeyEvent(LogicalKeyboardKey.tab);
        await t.pumpAndSettle();
      }
      final container = t.widget<Container>(
        find
            .descendant(
              of: _action(MaintenanceAction.previewGuide),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(
        ((container.decoration! as BoxDecoration).border! as Border).top.width,
        3,
      );
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.pumpAndSettle();
      expect(sent.single.action, MaintenanceAction.previewGuide);
      sent.clear();
      await _pump(
        t,
        _view(record: sent.add, phase: MaintenanceRequestPhase.outcomeUnknown),
      );
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.sendKeyEvent(LogicalKeyboardKey.space);
      await t.pumpAndSettle();
      expect(sent.where((i) => _gated.contains(i.action)), isEmpty);
      expect(_enabled(t, MaintenanceAction.previewGuide), isFalse);
    },
  );
  testWidgets('Boyanmış metin ve odak kontrastı sınırları karşılar', (t) async {
    double contrast(Color a, Color b) {
      final x = a.computeLuminance(), y = b.computeLuminance();
      return (x > y ? x + .05 : y + .05) / (x > y ? y + .05 : x + .05);
    }

    await _pump(t, _view());
    for (final a in [
      MaintenanceAction.previewGuide,
      MaintenanceAction.recordEntry,
      MaintenanceAction.postponeReminder,
    ]) {
      final paragraph = t.renderObject<RenderParagraph>(
        find.descendant(of: _action(a), matching: find.byType(RichText)).first,
      );
      final container = t.widget<Container>(
        find.descendant(of: _action(a), matching: find.byType(Container)).first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(
        contrast((paragraph.text as TextSpan).style!.color!, decoration.color!),
        greaterThanOrEqualTo(4.5),
      );
    }
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pumpAndSettle();
    final container = t.widget<Container>(
      find
          .descendant(
            of: _action(MaintenanceAction.previewGuide).first,
            matching: find.byType(Container),
          )
          .first,
    );
    final decoration = container.decoration as BoxDecoration;
    final border = decoration.border! as Border;
    expect(border.top.width, 3);
    expect(
      contrast(border.top.color, decoration.color!),
      greaterThanOrEqualTo(3),
    );
  });
  testWidgets(
    'Tüm durumlar küçük ekranda büyük Türkçe yazıyla kaydırılır; hedef52',
    (t) async {
      t.view.devicePixelRatio = 1;
      addTearDown(t.view.resetDevicePixelRatio);
      addTearDown(t.view.resetPhysicalSize);
      for (final width in [320.0, 390.0, 768.0])
        for (final scale in [1.0, 2.0, 3.0])
          for (final entry in _states().entries) {
            await t.pumpWidget(const SizedBox());
            t.view.physicalSize = Size(width, 844);
            await _pump(t, entry.value, scale: scale);
            await _prepareState(t, entry.key);
            final pos = t
                .state<ScrollableState>(find.byType(Scrollable).first)
                .position;
            pos.jumpTo(pos.maxScrollExtent);
            await t.pumpAndSettle();
            expect(
              t.takeException(),
              isNull,
              reason: '${entry.key}/$width/$scale',
            );
            for (final f in find.byType(FocusableActionDetector).evaluate())
              expect(
                (f.findRenderObject()! as RenderBox).size.height,
                greaterThanOrEqualTo(52),
              );
            expect(pos.pixels, pos.maxScrollExtent);
            expect(_action(MaintenanceAction.exit), findsOneWidget);
          }
    },
  );
  final capture = Platform.environment['KAVRIVA_MAINTENANCE_PREVIEW'];
  if (capture != null)
    testWidgets('Capture complete actual maintenance states', (t) async {
      final fontPath = Platform.environment['KAVRIVA_MAINTENANCE_FONT'];
      String? font;
      if (fontPath != null) {
        font = 'MaintenancePreview';
        await t.runAsync(() async {
          final bytes = await File(fontPath).readAsBytes();
          final loader = FontLoader(font!)
            ..addFont(Future.value(ByteData.sublistView(bytes)));
          await loader.load();
        });
      }
      t.view.physicalSize = const Size(390, 844);
      t.view.devicePixelRatio = 1;
      addTearDown(t.view.resetPhysicalSize);
      addTearDown(t.view.resetDevicePixelRatio);
      for (final entry in _states().entries) {
        await t.pumpWidget(const SizedBox());
        final key = GlobalKey();
        await t.pumpWidget(
          _app(
            RepaintBoundary(key: key, child: entry.value),
            font: font,
          ),
        );
        await t.pumpAndSettle();
        await _prepareState(t, entry.key);
        final pos = t
            .state<ScrollableState>(find.byType(Scrollable).first)
            .position;
        pos.jumpTo(0);
        await t.pumpAndSettle();
        var index = 0;
        while (true) {
          final boundary =
              key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
          await t.runAsync(() async {
            final image = await boundary.toImage(pixelRatio: 1);
            final bytes = await image.toByteData(
              format: ui.ImageByteFormat.png,
            );
            await File('$capture-${entry.key}-$index.png')
                .writeAsBytes(bytes!.buffer.asUint8List());
            image.dispose();
          });
          index++;
          if (pos.pixels >= pos.maxScrollExtent) break;
          pos.jumpTo((pos.pixels + 620).clamp(0, pos.maxScrollExtent));
          await t.pump();
        }
      }
    });
}
