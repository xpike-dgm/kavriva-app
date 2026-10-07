import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/history.dart';
import 'package:kavriva_shell/entitlement_gate.dart';

// Açık örnek GATE sunum girdisi; gerçek üretim yetki/billing/cihaz kanıtı değil.
const _request = 'entitlement-example-request';
const _check = 'Yeni işlem için sunucu kontrolü iste';
const _context = 'Güncel işlem seçeneklerini kontrol et';
HistoryScope _scope({String bike = 'bike-A', String revision = 'r1'}) =>
    HistoryScope(
      motorcycleId: bike,
      contextRevision: revision,
      catalogId: 'example-catalog',
      catalogRevision: 'catalog-r1',
      motorcycleLabel: 'Örnek motosiklet özel A',
    );
HistoryReference _ref(
  String purpose,
  String subject, {
  HistoryScope? scope,
  String request = _request,
  bool current = true,
  HistoryReferenceState state = HistoryReferenceState.confirmed,
}) => HistoryReference(
  scope: scope ?? _scope(),
  requestId: request,
  purpose: purpose,
  subjectId: subject,
  source: 'Örnek test kaynağı',
  version: 'example-r1',
  location: 'Örnek kapsam',
  checkedAt: '2026-10-07',
  reason: 'Yalnız örnek sunum',
  current: current,
  state: state,
);
EntitlementPlan _plan({
  String id = 'plan-example',
  String revision = 'r1',
  EntitlementDecision decision = EntitlementDecision.denied,
  bool inactive = false,
  bool startedWork = false,
  Map<EntitlementField, String>? values,
}) => EntitlementPlan(
  id: id,
  revision: revision,
  decision: decision,
  inactive: inactive,
  startedWork: startedWork,
  values:
      values ??
      {
        EntitlementField.motorcycle:
            'Örnek motosiklet özel A · kullanıcı beyanı',
        EntitlementField.reason: inactive
            ? 'Motosiklet etkin değil. Yeni bakım için güncel etkinlik ve izin değerlendirmesi gerekir.'
            : decision == EntitlementDecision.denied
            ? 'Bu motosiklet için yeni işlem hakkı açık değil. Mevcut kayıtlar korunur.'
            : decision == EntitlementDecision.held
            ? 'Güncel karar bekleniyor. Yeni işleme izin verilmiş değil.'
            : 'Örnek güncel izin kararı mevcut. Gerçek işlem öncesi sunucu ve fiziksel hazırlık kontrolü yine gerekir.',
        EntitlementField.source: 'Örnek E3/E5 kararı · test verisi',
        EntitlementField.checkedAt: '2026-10-07 · örnek kontrol',
      },
);
EntitlementSnapshot _snapshot({
  EntitlementPlan? plan,
  HistoryScope? scope,
  String request = _request,
  bool missing = false,
  bool noSource = false,
  bool offline = false,
  bool current = true,
  HistoryReferenceState state = HistoryReferenceState.confirmed,
  HistoryReference? authority,
  HistoryReadDimension? deniedRead,
  HistoryReadDimension? deniedPreservedRead,
  EntitlementField? deniedField,
  EntitlementPath? deniedPath,
  EntitlementEffectDimension? deniedEffect,
  Map<EntitlementField, HistoryReference?>? fields,
  Map<HistoryReadDimension, HistoryReference?>? preservedRead,
  Map<EntitlementPath, HistoryReference?>? paths,
  Map<EntitlementEffectDimension, HistoryReference?>? effects,
}) {
  final p = plan ?? _plan(), s = scope ?? _scope();
  final ownRead = EntitlementSnapshot(
    scope: s,
    requestId: request,
    plan: null,
    readDimensions: const {},
    preservedReadDimensions: const {},
    fields: const {},
    paths: const {},
    effects: const {},
  ).preservedSubject;
  return EntitlementSnapshot(
    scope: s,
    requestId: request,
    plan: missing ? null : p,
    offline: offline,
    authority: noSource
        ? null
        : authority ??
              _ref(
                'entitlement-plan',
                p.subject,
                scope: s,
                request: request,
                current: current,
                state: state,
              ),
    readDimensions: {
      for (final d in HistoryReadDimension.values)
        d: d == deniedRead
            ? null
            : _ref(
                'entitlement-read',
                '${p.subject}/${d.name}',
                scope: s,
                request: request,
              ),
    },
    preservedReadDimensions:
        preservedRead ??
        {
          for (final d in HistoryReadDimension.values)
            d: d == deniedPreservedRead
                ? null
                : _ref(
                    'entitlement-preserved-read',
                    '$ownRead/${d.name}',
                    scope: s,
                    request: request,
                  ),
        },
    fields:
        fields ??
        {
          for (final f in EntitlementField.values)
            f: f == deniedField
                ? null
                : _ref(
                    'entitlement-field',
                    '${p.subject}/${f.name}',
                    scope: s,
                    request: request,
                  ),
        },
    paths:
        paths ??
        {
          for (final a in EntitlementPath.values)
            a: a == deniedPath
                ? null
                : _ref(
                    'entitlement-preserved-path',
                    '$ownRead/${a.name}',
                    scope: s,
                    request: request,
                  ),
        },
    effects:
        effects ??
        {
          for (final d in EntitlementEffectDimension.values)
            d: d == deniedEffect
                ? null
                : _ref(
                    'entitlement-check-new',
                    '${p.subject}/${d.name}',
                    scope: s,
                    request: request,
                  ),
        },
  );
}

Widget _view({
  EntitlementSnapshot? snapshot,
  ValueChanged<EntitlementIntent>? handler,
  bool noHandler = false,
}) => EntitlementGateView(
  snapshot: snapshot ?? _snapshot(),
  onIntent: noHandler ? null : handler ?? (_) {},
);

class _Input extends InheritedWidget {
  const _Input({
    required this.content,
    required this.scale,
    this.font,
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
    final input = context.dependOnInheritedWidgetOfExactType<_Input>()!;
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: TextScaler.linear(input.scale)),
      child: RepaintBoundary(
        key: const ValueKey('entitlement-capture'),
        child: DefaultTextStyle(
          style: TextStyle(
            fontFamily: input.font,
            color: const Color(0xFF172033),
          ),
          child: input.content,
        ),
      ),
    );
  }
}

Future<void> _pump(
  WidgetTester t,
  Widget content, {
  double width = 390,
  double scale = 1,
  String? font,
}) async {
  t.view.physicalSize = Size(width, 844);
  t.view.devicePixelRatio = 1;
  await t.pumpWidget(
    _Input(
      content: content,
      scale: scale,
      font: font,
      child: WidgetsApp(
        color: const Color(0xFFFFFFFF),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (_) =>
            PageRouteBuilder<void>(pageBuilder: (_, __, ___) => const _Scene()),
      ),
    ),
  );
  await t.pumpAndSettle();
}

Map<String, Widget> _cases() => {
  'preserved-source-missing': _view(
    snapshot: _snapshot(preservedRead: const {}),
  ),
  'preserved-dimension-missing': _view(
    snapshot: _snapshot(
      deniedPreservedRead: HistoryReadDimension.authorization,
    ),
  ),
  'preserved-stale': _view(
    snapshot: _snapshot(
      preservedRead: {
        HistoryReadDimension.motorcycle: _ref(
          'entitlement-preserved-read',
          '${_snapshot().preservedSubject}/motorcycle',
          current: false,
        ),
      },
    ),
  ),
  'preserved-held': _view(
    snapshot: _snapshot(
      paths: {
        EntitlementPath.safety: _ref(
          'entitlement-preserved-path',
          '${_snapshot().preservedSubject}/safety',
          state: HistoryReferenceState.held,
        ),
      },
    ),
  ),
  'preserved-unknown': _view(
    snapshot: _snapshot(
      paths: {
        EntitlementPath.safety: _ref(
          'entitlement-preserved-path',
          '${_snapshot().preservedSubject}/safety',
          state: HistoryReferenceState.unknown,
        ),
      },
    ),
  ),
  'preserved-foreign': _view(
    snapshot: _snapshot(
      paths: {
        EntitlementPath.history: _ref(
          'entitlement-preserved-path',
          '${_snapshot().preservedSubject}/history',
          scope: _scope(bike: 'B'),
        ),
      },
    ),
  ),
  'context-requested': _view(),
  'check-requested': _view(
    snapshot: _snapshot(plan: _plan(decision: EntitlementDecision.allowed)),
  ),
  'inactive': _view(snapshot: _snapshot(plan: _plan(inactive: true))),
  'denied': _view(),
  'held': _view(
    snapshot: _snapshot(plan: _plan(decision: EntitlementDecision.held)),
  ),
  'allowed': _view(
    snapshot: _snapshot(plan: _plan(decision: EntitlementDecision.allowed)),
  ),
  'started': _view(
    snapshot: _snapshot(plan: _plan(startedWork: true, inactive: true)),
  ),
  'offline': _view(
    snapshot: _snapshot(
      offline: true,
      plan: _plan(decision: EntitlementDecision.allowed),
    ),
  ),
  'missing': _view(snapshot: _snapshot(missing: true)),
  'source-missing': _view(snapshot: _snapshot(noSource: true)),
  'stale': _view(snapshot: _snapshot(current: false)),
  'authority-held': _view(
    snapshot: _snapshot(state: HistoryReferenceState.held),
  ),
  'authority-unknown': _view(
    snapshot: _snapshot(state: HistoryReferenceState.unknown),
  ),
  'foreign': _view(
    snapshot: _snapshot(
      authority: _ref(
        'entitlement-plan',
        _plan().subject,
        scope: _scope(bike: 'bike-B'),
      ),
    ),
  ),
  'field-private': _view(
    snapshot: _snapshot(deniedField: EntitlementField.reason),
  ),
  'path-private': _view(
    snapshot: _snapshot(deniedPath: EntitlementPath.history),
  ),
  'effect-held': _view(
    snapshot: _snapshot(
      plan: _plan(decision: EntitlementDecision.allowed),
      deniedEffect: EntitlementEffectDimension.audit,
    ),
  ),
  'no-handler': _view(noHandler: true),
  'long': _view(
    snapshot: _snapshot(
      plan: _plan(
        values: {
          ..._plan().values,
          EntitlementField.reason: 'Örnek kapsam açıklaması. ' * 20,
        },
      ),
    ),
  ),
};
ScrollPosition _position(WidgetTester t) =>
    t.state<ScrollableState>(find.byType(Scrollable).first).position;
String _text(WidgetTester t) =>
    t.widgetList<Text>(find.byType(Text)).map((w) => w.data ?? '').join('\n');
ScrollableState _scroll(WidgetTester t) =>
    t.state<ScrollableState>(find.byType(Scrollable).first);
VoidCallback? _cb(WidgetTester t, String label) {
  final f = find.byWidgetPredicate(
    (w) => w is Semantics && w.properties.label == label,
  );
  return f.evaluate().isEmpty ? null : t.widget<Semantics>(f).properties.onTap;
}

Future<void> _tap(WidgetTester t, String label) async {
  final f = find.byKey(ValueKey('entitlement-$label'));
  await t.ensureVisible(f);
  await t.pumpAndSettle();
  await t.tap(f);
  await t.pumpAndSettle();
}

Future<void> _prepare(WidgetTester t, String state) async {
  if (state == 'context-requested') await _tap(t, _context);
  if (state == 'check-requested') await _tap(t, _check);
  _position(t).jumpTo(0);
  await t.pumpAndSettle();
}

void main() {
  testWidgets(
    'F01 lisans planı yokken altı kendi izinli okuma yolu gerçek tap ve private lisans kapalı',
    (t) async {
      final calls = <EntitlementIntent>[];
      final labels = [
        'Geçmiş kayıtları',
        'Kanıt ve kaynak bilgisi',
        'Düzeltme ve itiraz',
        'Kayıtları dışa aktar',
        'Kritik güvenlik bilgisi',
        'Başlanmış işin güvenli dönüşü',
      ];
      for (final s in [
        _snapshot(missing: true),
        _snapshot(noSource: true),
        _snapshot(current: false),
        _snapshot(state: HistoryReferenceState.held),
        _snapshot(state: HistoryReferenceState.unknown),
        _snapshot(deniedField: EntitlementField.reason),
        _snapshot(deniedRead: HistoryReadDimension.authorization),
      ]) {
        await _pump(t, _view(snapshot: s, handler: calls.add));
        expect(_text(t), isNot(contains('Örnek motosiklet özel A')));
        expect(_cb(t, _context), isNull);
        expect(_cb(t, _check), isNull);
        for (var i = 0; i < labels.length; i++) {
          await _tap(t, labels[i]);
          expect(calls.last.action, EntitlementAction.read);
          expect(calls.last.path, EntitlementPath.values[i]);
          expect(
            calls.last.subjectId,
            '${s.preservedSubject}/${EntitlementPath.values[i].name}',
          );
          expect(calls.last.subjectId, isNot(contains(_plan().subject)));
          expect(t.takeException(), isNull);
        }
      }
      expect(calls.length, 42);
    },
  );
  testWidgets(
    'F01 kendi dört okuma boyutunda eksik stale foreign held unknown purpose subject request kapanır',
    (t) async {
      final target = _snapshot().preservedSubject;
      for (final d in HistoryReadDimension.values) {
        final good = {
          for (final x in HistoryReadDimension.values)
            x: _ref('entitlement-preserved-read', '$target/${x.name}'),
        };
        for (final bad in [
          null,
          _ref('ALLOW', '$target/${d.name}'),
          _ref(
            'entitlement-preserved-read',
            '$target/${d.name}',
            request: 'old',
          ),
          _ref(
            'entitlement-preserved-read',
            '$target/${d.name}',
            scope: _scope(bike: 'B'),
          ),
          _ref('entitlement-preserved-read', 'wrong'),
          _ref(
            'entitlement-preserved-read',
            '$target/${d.name}',
            current: false,
          ),
          _ref(
            'entitlement-preserved-read',
            '$target/${d.name}',
            state: HistoryReferenceState.held,
          ),
          _ref(
            'entitlement-preserved-read',
            '$target/${d.name}',
            state: HistoryReferenceState.unknown,
          ),
        ]) {
          final s = _snapshot(missing: true, preservedRead: {...good, d: bad});
          expect(EntitlementPath.values.any(s.pathAllowed), isFalse);
          await _pump(t, _view(snapshot: s));
          expect(_cb(t, 'Geçmiş kayıtları'), isNull);
          expect(_cb(t, 'Kritik güvenlik bilgisi'), isNull);
          expect(_cb(t, 'Garaja dön'), isNotNull);
        }
      }
    },
  );
  testWidgets(
    'F01 eski read callback lisans değişiminde geçerli own izinle çalışır scope request revoketa kapanır',
    (t) async {
      final calls = <EntitlementIntent>[];
      final handler = calls.add;
      for (final s in [
        _snapshot(missing: true),
        _snapshot(noSource: true),
        _snapshot(
          plan: _plan(revision: 'new', decision: EntitlementDecision.allowed),
          offline: true,
        ),
      ]) {
        await t.pumpWidget(const SizedBox());
        await _pump(t, _view(handler: handler));
        final cb = _cb(t, 'Geçmiş kayıtları')!;
        await _pump(t, _view(snapshot: s, handler: handler));
        cb();
        expect(calls.last.subjectId, '${s.preservedSubject}/history');
        expect(t.takeException(), isNull);
      }
      expect(calls.length, 3);
      for (final s in [
        _snapshot(scope: _scope(bike: 'B')),
        _snapshot(request: 'new'),
        _snapshot(deniedPreservedRead: HistoryReadDimension.policy),
        _snapshot(deniedPath: EntitlementPath.history),
      ]) {
        await t.pumpWidget(const SizedBox());
        await _pump(t, _view(handler: handler));
        final cb = _cb(t, 'Geçmiş kayıtları')!;
        await _pump(t, _view(snapshot: s, handler: handler));
        cb();
        expect(calls.length, 3);
      }
      expect(
        () => _snapshot().preservedReadDimensions.clear(),
        throwsUnsupportedError,
      );
      expect(
        _snapshot(scope: _scope(revision: 'new')).preservedSubject,
        isNot(_snapshot().preservedSubject),
      );
    },
  );
  testWidgets(
    'DEC0053 hak şekli fiziksel gerçeklik değil ve güvenli çıkış baskın',
    (t) async {
      await _pump(t, _view());
      final txt = _text(t);
      expect(txt, contains('Ücretsiz 1 motosiklet'));
      expect(txt, contains('Abonelikle toplam 3 motosiklet'));
      expect(txt, contains('seçili 1 motosiklette'));
      expect(txt, contains('hak taşınır'));
      expect(txt, contains('fiziksel uygunluğunu kanıtlamaz'));
      expect(txt, contains('kesinleştirilmiş değil'));
      expect(_cb(t, 'Garaja dön'), isNotNull);
      expect(_cb(t, _check), isNull);
    },
  );
  testWidgets('lisans yeni işlemi kapatır korunan altı yol lisansla kapanmaz', (
    t,
  ) async {
    final calls = <EntitlementIntent>[];
    for (final decision in EntitlementDecision.values) {
      await _pump(
        t,
        _view(
          snapshot: _snapshot(plan: _plan(decision: decision, inactive: true)),
          handler: calls.add,
        ),
      );
      for (final label in [
        'Geçmiş kayıtları',
        'Kanıt ve kaynak bilgisi',
        'Düzeltme ve itiraz',
        'Kayıtları dışa aktar',
        'Kritik güvenlik bilgisi',
        'Başlanmış işin güvenli dönüşü',
      ]) {
        await _tap(t, label);
        expect(calls.last.action, EntitlementAction.read);
      }
      expect(_text(t), contains('paket nedeniyle kapatılmaz'));
      expect(_cb(t, _check), isNull);
    }
    expect(calls.length, 18);
    expect(calls.map((i) => i.path).toSet(), EntitlementPath.values.toSet());
  });
  testWidgets('korunan lisans erişimi kendi güncel okuma iznini üretmez', (
    t,
  ) async {
    for (final a in EntitlementPath.values) {
      final s = _snapshot(deniedPath: a);
      expect(s.pathAllowed(a), isFalse);
      for (final other in EntitlementPath.values.where((x) => x != a))
        expect(s.pathAllowed(other), isTrue);
    }
    await _pump(
      t,
      _view(snapshot: _snapshot(deniedPath: EntitlementPath.safety)),
    );
    expect(_cb(t, 'Kritik güvenlik bilgisi'), isNull);
    expect(_cb(t, 'Başlanmış işin güvenli dönüşü'), isNotNull);
  });
  testWidgets('eksik eski held unknown yabancı kaynak özel metni kapatır', (
    t,
  ) async {
    for (final s in [
      _snapshot(missing: true),
      _snapshot(noSource: true),
      _snapshot(current: false),
      _snapshot(state: HistoryReferenceState.held),
      _snapshot(state: HistoryReferenceState.unknown),
      _snapshot(
        authority: _ref(
          'entitlement-plan',
          _plan().subject,
          scope: _scope(bike: 'B'),
        ),
      ),
      _snapshot(authority: _ref('ALLOW', _plan().subject)),
      _snapshot(
        authority: _ref('entitlement-plan', _plan().subject, request: 'old'),
      ),
    ]) {
      await _pump(t, _view(snapshot: s));
      expect(_text(t), isNot(contains('Örnek motosiklet özel A')));
      expect(_cb(t, 'Geçmiş kayıtları'), isNotNull);
      expect(_cb(t, 'Garaja dön'), isNotNull);
    }
  });
  testWidgets('dört okuma boyutu ve her özel alan eksikse özel metin kapanır', (
    t,
  ) async {
    for (final d in HistoryReadDimension.values) {
      await _pump(t, _view(snapshot: _snapshot(deniedRead: d)));
      expect(_text(t), isNot(contains('Örnek motosiklet özel A')));
      expect(_cb(t, 'Düzeltme ve itiraz'), isNotNull);
    }
    for (final f in EntitlementField.values) {
      await _pump(t, _view(snapshot: _snapshot(deniedField: f)));
      expect(_text(t), isNot(contains('Örnek motosiklet özel A')));
    }
  });
  testWidgets('tam içerik değişiminde eski yetki yeni gerekçeyi açamaz', (
    t,
  ) async {
    final original = _plan(),
        changed = _plan(
          values: {
            ..._plan().values,
            EntitlementField.reason: 'özel değişmiş gerekçe',
          },
        );
    await _pump(
      t,
      _view(
        snapshot: _snapshot(
          plan: changed,
          authority: _ref('entitlement-plan', original.subject),
        ),
      ),
    );
    expect(_text(t), isNot(contains('özel değişmiş gerekçe')));
    expect(_cb(t, _context), isNull);
    for (final f in EntitlementField.values) {
      final fields = {
        for (final a in EntitlementField.values)
          a: _ref('entitlement-field', '${original.subject}/${a.name}'),
      };
      fields[f] = _ref('entitlement-field', 'wrong/${f.name}');
      expect(_snapshot(plan: original, fields: fields).readable, isFalse);
    }
  });
  testWidgets(
    'path eski request purpose scope subject ve held izin ödünç alamaz',
    (t) async {
      final subject = _snapshot().preservedSubject;
      for (final bad in [
        _ref('entitlement-preserved-path', '$subject/history', request: 'old'),
        _ref(
          'entitlement-preserved-path',
          '$subject/history',
          scope: _scope(bike: 'B'),
        ),
        _ref('ALLOW', '$subject/history'),
        _ref('entitlement-preserved-path', 'wrong'),
        _ref(
          'entitlement-preserved-path',
          '$subject/history',
          state: HistoryReferenceState.held,
        ),
      ]) {
        await _pump(
          t,
          _view(snapshot: _snapshot(paths: {EntitlementPath.history: bad})),
        );
        expect(_cb(t, 'Geçmiş kayıtları'), isNull);
      }
    },
  );
  testWidgets(
    'yeni işlem sadece allowed aktif altı etki ve handler ile kontrol isteği',
    (t) async {
      final calls = <EntitlementIntent>[],
          p = _plan(decision: EntitlementDecision.allowed);
      for (final d in EntitlementEffectDimension.values) {
        await _pump(
          t,
          _view(
            snapshot: _snapshot(plan: p, deniedEffect: d),
            handler: calls.add,
          ),
        );
        expect(_cb(t, _check), isNull);
      }
      await _pump(t, _view(snapshot: _snapshot(plan: p), noHandler: true));
      expect(_cb(t, _check), isNull);
      await _pump(
        t,
        _view(
          snapshot: _snapshot(plan: p),
          handler: calls.add,
        ),
      );
      await _tap(t, _check);
      expect(calls.single.action, EntitlementAction.checkNewActivity);
      expect(calls.single.subjectId, p.subject);
      expect(_text(t), contains('işlem başlamadı'));
      expect(_cb(t, _check), isNull);
    },
  );
  testWidgets(
    'altı etki purpose scope request subject current ayrı güncel bağlı',
    (t) async {
      final p = _plan(decision: EntitlementDecision.allowed);
      for (final d in EntitlementEffectDimension.values) {
        final good = {
          for (final x in EntitlementEffectDimension.values)
            x: _ref('entitlement-check-new', '${p.subject}/${x.name}'),
        };
        for (final bad in [
          _ref('ALLOW', '${p.subject}/${d.name}'),
          _ref(
            'entitlement-check-new',
            '${p.subject}/${d.name}',
            request: 'old',
          ),
          _ref(
            'entitlement-check-new',
            '${p.subject}/${d.name}',
            current: false,
          ),
          _ref(
            'entitlement-check-new',
            '${p.subject}/${d.name}',
            scope: _scope(bike: 'B'),
          ),
          _ref('entitlement-check-new', 'wrong'),
        ])
          expect(
            _snapshot(
              plan: p,
              effects: {...good, d: bad},
            ).newActivityCheckAllowed,
            isFalse,
          );
      }
    },
  );
  testWidgets(
    'çevrimdışı yeni kontrol kapalı korunan güncel okuma ve garaj açık',
    (t) async {
      await _pump(
        t,
        _view(
          snapshot: _snapshot(
            offline: true,
            plan: _plan(decision: EntitlementDecision.allowed),
          ),
        ),
      );
      expect(_cb(t, _check), isNull);
      expect(_cb(t, _context), isNull);
      expect(_cb(t, 'Kritik güvenlik bilgisi'), isNotNull);
      expect(_cb(t, 'Garaja dön'), isNotNull);
    },
  );
  testWidgets(
    'seçenek kontrolü dışarı typed niyet iletir çift gönderilmez yeni request ayrı',
    (t) async {
      final calls = <EntitlementIntent>[];
      final handler = calls.add;
      await _pump(t, _view(handler: handler));
      final cb = _cb(t, _context)!;
      cb();
      cb();
      await t.pump();
      expect(calls.length, 1);
      expect(calls.single.action, EntitlementAction.requestContext);
      expect(_cb(t, _context), isNull);
      await _pump(
        t,
        _view(
          snapshot: _snapshot(request: 'new'),
          handler: handler,
        ),
      );
      await _tap(t, _context);
      expect(calls.length, 2);
    },
  );
  testWidgets('aynı request içerik revizyonu gönderim kilidini açmaz', (
    t,
  ) async {
    final calls = <EntitlementIntent>[];
    final handler = calls.add;
    await _pump(
      t,
      _view(
        snapshot: _snapshot(plan: _plan(decision: EntitlementDecision.allowed)),
        handler: handler,
      ),
    );
    await _tap(t, _check);
    await _pump(
      t,
      _view(
        snapshot: _snapshot(
          plan: _plan(decision: EntitlementDecision.allowed, revision: 'r2'),
        ),
        handler: handler,
      ),
    );
    expect(_cb(t, _check), isNull);
    expect(calls.length, 1);
  });
  testWidgets(
    'eski callback yeni scope request plan offline ve izin ödünç alamaz',
    (t) async {
      final calls = <EntitlementIntent>[];
      final handler = calls.add;
      final p = _plan(decision: EntitlementDecision.allowed);
      for (final s in [
        _snapshot(
          scope: _scope(bike: 'B'),
          plan: p,
        ),
        _snapshot(request: 'new', plan: p),
        _snapshot(
          plan: _plan(decision: EntitlementDecision.allowed, revision: 'r2'),
        ),
        _snapshot(plan: p, offline: true),
        _snapshot(plan: p, deniedRead: HistoryReadDimension.policy),
        _snapshot(plan: p, deniedEffect: EntitlementEffectDimension.audit),
      ]) {
        await t.pumpWidget(const SizedBox());
        await _pump(
          t,
          _view(
            snapshot: _snapshot(plan: p),
            handler: handler,
          ),
        );
        final cb = _cb(t, _check)!;
        await _pump(t, _view(snapshot: s, handler: handler));
        cb();
        await t.pump();
        expect(calls, isEmpty);
      }
    },
  );
  testWidgets('handler değişimi ve path izin kaybında eski callback çalışmaz', (
    t,
  ) async {
    final calls = <EntitlementIntent>[];
    final handler = calls.add;
    await _pump(t, _view(handler: handler));
    final cb = _cb(t, 'Geçmiş kayıtları')!;
    await _pump(
      t,
      _view(
        snapshot: _snapshot(deniedPath: EntitlementPath.history),
        handler: handler,
      ),
    );
    cb();
    expect(calls, isEmpty);
    await _pump(t, _view(handler: handler));
    final cb2 = _cb(t, _context)!;
    await _pump(
      t,
      _view(
        handler: (_) {
          throw StateError('Eski callback yeni handler kullanamaz');
        },
      ),
    );
    cb2();
    expect(calls, isEmpty);
  });
  testWidgets(
    'garaj ve destek niyeti özel subject taşımaz veri yokken çalışır',
    (t) async {
      final calls = <EntitlementIntent>[];
      await _pump(
        t,
        _view(snapshot: _snapshot(missing: true), handler: calls.add),
      );
      await _tap(t, 'Garaja dön');
      await _tap(t, 'Destek seçenekleri');
      expect(calls.map((i) => i.subjectId), everyElement(''));
      expect(calls.map((i) => i.path), everyElement(isNull));
    },
  );
  test('immutable tam subject bozukunicode karar ve içerik ayrılır', () {
    final values = {..._plan().values}, p = _plan(values: values);
    values.clear();
    expect(p.values, isNotEmpty);
    expect(() => p.values.clear(), throwsUnsupportedError);
    expect(() => _snapshot().paths.clear(), throwsUnsupportedError);
    expect(_plan(id: '\ud800').subject, isNot(_plan(id: '\ufffd').subject));
    expect(_plan(inactive: true).subject, isNot(p.subject));
    expect(_plan(startedWork: true).subject, isNot(p.subject));
    expect(
      _plan(decision: EntitlementDecision.allowed).subject,
      isNot(p.subject),
    );
    expect(() => _plan(id: ' '), throwsArgumentError);
  });
  testWidgets('gerçek Tab Enter Space başlık disabled button liveRegion', (
    t,
  ) async {
    final calls = <EntitlementIntent>[];
    final semantics = t.ensureSemantics();
    try {
      await _pump(t, _view(handler: calls.add));
      final title = find.byWidgetPredicate(
        (w) => w is Semantics && w.properties.headingLevel == 1,
      );
      expect(title, findsOneWidget);
      expect(t.widget<Semantics>(title).properties.header, isTrue);
      for (final label in [
        'Yeni işlem kapalı',
        'Güncel işlem durumu',
        'Mevcut erişimin korunur',
        'Güvenlik ve yarım kalan iş',
        'Motosiklet ve rehber hakkı',
      ]) {
        await t.ensureVisible(find.text(label));
        expect(
          t.getSemantics(find.text(label)).flagsCollection.isHeader,
          isTrue,
        );
      }
      _position(t).jumpTo(0);
      await t.pumpAndSettle();
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.pump();
      expect(calls.single.path, EntitlementPath.history);
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.sendKeyEvent(LogicalKeyboardKey.space);
      await t.pump();
      expect(calls.last.path, EntitlementPath.evidence);
      await _tap(t, _context);
      expect(
        t
            .widgetList<Semantics>(find.byType(Semantics))
            .any((w) => w.properties.liveRegion == true),
        isTrue,
      );
      final disabled = t.widget<Semantics>(
        find.byWidgetPredicate(
          (w) => w is Semantics && w.properties.label == _context,
        ),
      );
      expect(disabled.properties.enabled, isFalse);
      expect(disabled.properties.onTap, isNull);
    } finally {
      semantics.dispose();
    }
  });
  testWidgets('çizilmiş metin ve gerçek klavye odak renkleri kontrastlı', (
    t,
  ) async {
    double luminance(Color c) => c.computeLuminance();
    double contrast(Color a, Color b) {
      final x = luminance(a), y = luminance(b);
      return ((x > y ? x : y) + .05) / ((x > y ? y : x) + .05);
    }

    await _pump(t, _view());
    for (final text in t.widgetList<Text>(find.byType(Text))) {
      final f = find.byWidget(text);
      final paragraph = t.renderObject<RenderParagraph>(f);
      final fg = (paragraph.text as TextSpan).style!.color!;
      Color bg = const Color(0xFFF8FAFC);
      final decorations = find.ancestor(
        of: f,
        matching: find.byType(DecoratedBox),
      );
      if (decorations.evaluate().isNotEmpty)
        bg =
            (t.widget<DecoratedBox>(decorations.first).decoration
                    as BoxDecoration)
                .color ??
            bg;
      expect(contrast(fg, bg), greaterThanOrEqualTo(4.5), reason: text.data);
    }
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pump();
    final focused = t
        .widgetList<DecoratedBox>(find.byType(DecoratedBox))
        .where(
          (w) =>
              w.decoration is BoxDecoration &&
              ((w.decoration as BoxDecoration).border as Border?)?.top.width ==
                  3,
        );
    expect(focused, isNotEmpty);
    for (final box in focused) {
      final d = box.decoration as BoxDecoration;
      expect(
        contrast((d.border as Border).top.color, d.color!),
        greaterThanOrEqualTo(3),
      );
    }
    // Altı korunan yolun ardından baskın Garaja dön gerçek klavye odağı.
    for (var i = 0; i < 6; i++) await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pumpAndSettle();
    final garage = find.byKey(const ValueKey('entitlement-Garaja dön'));
    final primary = t.widget<DecoratedBox>(
      find.descendant(of: garage, matching: find.byType(DecoratedBox)),
    );
    final d = primary.decoration as BoxDecoration;
    expect((d.border as Border).top.width, 3);
    expect(
      contrast((d.border as Border).top.color, d.color!),
      greaterThanOrEqualTo(3),
    );
  });
  testWidgets(
    'bütün durumlar 320390768 büyük yazı tam kaydırma 52hedef güvenli çıkış',
    (t) async {
      for (final e in _cases().entries)
        for (final width in [320.0, 390.0, 768.0])
          for (final scale in [1.0, 2.0, 3.0]) {
            await t.pumpWidget(const SizedBox());
            await _pump(
              t,
              KeyedSubtree(key: ValueKey(e.key), child: e.value),
              width: width,
              scale: scale,
            );
            await _prepare(t, e.key);
            final pos = _position(t), end = pos.maxScrollExtent;
            for (double offset = 0; ; offset = (offset + 620).clamp(0, end)) {
              pos.jumpTo(offset);
              await t.pumpAndSettle();
              expect(
                t.takeException(),
                isNull,
                reason: '${e.key}/$width/$scale/$offset',
              );
              if (offset >= end) break;
            }
            for (final w
                in t
                    .widgetList<Semantics>(find.byType(Semantics))
                    .where((w) => w.properties.button == true)) {
              expect(w.properties.label, isNotEmpty);
              expect(
                t.getSize(find.byWidget(w)).height,
                greaterThanOrEqualTo(52),
              );
            }
            await _tap(t, 'Garaja dön');
            expect(t.takeException(), isNull);
          }
    },
  );
  final preview = Platform.environment['KAVRIVA_ENTITLEMENT_PREVIEW'];
  if (preview != null)
    testWidgets(
      'gerçek doğal çizim bütün örnek durumları tam kaydırmayla kaydeder',
      (t) async {
        final font = Platform.environment['KAVRIVA_ENTITLEMENT_FONT'];
        if (font == null) throw StateError('Sabit SDK font yolu gerekli.');
        await t.runAsync(() async {
          final bytes = await File(font).readAsBytes();
          final loader = FontLoader('KavrivaEntitlementNative')
            ..addFont(Future.value(ByteData.sublistView(bytes)));
          await loader.load();
        });
        final rows = <String>[];
        for (final entry in _cases().entries) {
          await t.pumpWidget(const SizedBox());
          await t.pump();
          await _pump(
            t,
            KeyedSubtree(key: ValueKey(entry.key), child: entry.value),
            font: 'KavrivaEntitlementNative',
          );
          await _prepare(t, entry.key);
          final scroll = _scroll(t);
          scroll.position.jumpTo(0);
          await t.pumpAndSettle();
          final end = scroll.position.maxScrollExtent;
          var index = 0;
          for (double offset = 0; ; offset = (offset + 620).clamp(0, end)) {
            scroll.position.jumpTo(offset);
            await t.pumpAndSettle();
            final boundary = t.renderObject<RenderRepaintBoundary>(
              find.byKey(const ValueKey('entitlement-capture')),
            );
            final path = '$preview-${entry.key}-$index.png';
            await t.runAsync(() async {
              final image = await boundary.toImage(pixelRatio: 1);
              final bytes = (await image.toByteData(
                format: ui.ImageByteFormat.png,
              ))!;
              await File(path).writeAsBytes(
                bytes.buffer.asUint8List(
                  bytes.offsetInBytes,
                  bytes.lengthInBytes,
                ),
              );
              image.dispose();
            });
            rows.add('${entry.key}\t$path\t$offset\t$end\t$index');
            index++;
            if (offset >= end) break;
          }
          expect(t.takeException(), isNull, reason: entry.key);
        }
        await t.runAsync(
          () => File('$preview-manifest.txt').writeAsString(rows.join('\n')),
        );
      },
    );
}
