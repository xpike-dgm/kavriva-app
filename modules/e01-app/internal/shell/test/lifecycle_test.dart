import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/history.dart';
import 'package:kavriva_shell/lifecycle.dart';

// Açık GATE sunum test verisi; üretim silme/aktarma/yetki/hukuk kanıtı değil.
const _request = 'lifecycle-example-request';
const _ack = 'Onay ver: Silme kapsamını ve geri alınamayabileceğini anlıyorum';
const _confirmedAck =
    'Onay verdim: Silme kapsamını ve geri alınamayabileceğini anlıyorum';
const _delete = 'Yalnız bu kapsam için silme isteği gönder';
HistoryScope _scope({String bike = 'bike-A', String revision = 'context-r1'}) =>
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
  source: 'Örnek kaynak · açık test verisi',
  version: 'example-r1',
  location: 'Örnek kapsam',
  checkedAt: '2026-10-07',
  reason: 'Yalnız örnek sunum kapısı',
  current: current,
  state: state,
);
LifecyclePlan _plan({
  String id = 'plan-example',
  String revision = 'plan-r1',
  bool inactive = false,
  Map<LifecycleField, String>? values,
}) => LifecyclePlan(
  id: id,
  revision: revision,
  inactive: inactive,
  values:
      values ??
      {
        LifecycleField.motorcycle: 'Örnek motosiklet özel A · kullanıcı beyanı',
        LifecycleField.period: 'Örnek seçilen dönem: 01.01.2025–01.10.2026',
        LifecycleField.included: 'Bakım ve işlem kayıtları; kanıt ve kaynak bilgisi; düzeltmeler ve uyuşmazlık durumu; önceki katkı ve atıf izi.',
        LifecycleField.gaps: 'Seçilmemiş önceki sahiplik dönemi aktarılmaz. Seçili dönemde bulunmayan kayıtlar tamamlanmış bakım sayılmaz.',
        LifecycleField.excluded: 'Özel notlar ve hassas görseller dahil değil. Aktarılmamış özel içerik yeni sahibin geçmişinde görünmez.',
        LifecycleField.attribution: 'Örnek önceki sahip ve katkı izi; eski kabul edilmiş kayıtlar, önerilen değişiklikler ve uyuşmazlıklar ayrı korunur. Her sahiplik dönemi ve boşluğu kaynaklarıyla izlenir.',
        LifecycleField.ownDeletion: 'Sana ait motosiklet bilgileri, kendi not ve görsellerin, bağlı hatırlatmalar ve yalnız sana ait uygulanabilir kayıt kopyaları · örnek kapsam.',
        LifecycleField.independent: 'Başkalarının bağımsız kanıtları, aktarılmış kopyaları ve geçmiş atıfları korunur · örnek kapsam.',
        LifecycleField.reactivation: 'Aynı geçmiş geri açılır. Güncel kilometre, kullanım ve fiziksel durum yeniden değerlendirilmeli; yarım kalan iş eski onaylarla devam ettirilmez.',
        LifecycleField.uncertainty: 'Gerçek kapsam yazıcısı, saklama, yedekler ve hukuk doğrulanmadı. Bu ekran test verisi gösteriyor.',
      },
);
LifecycleSnapshot _snapshot({
  HistoryScope? scope,
  String request = _request,
  LifecyclePlan? plan,
  LifecycleScreen screen = LifecycleScreen.manage,
  LifecycleOperation? operation,
  bool inactive = false,
  bool offline = false,
  bool missing = false,
  bool noSource = false,
  bool noScope = false,
  LifecyclePhase phase = LifecyclePhase.idle,
  bool receipt = false,
  HistoryReference? receiptOverride,
  HistoryReference? authOverride,
  HistoryReference? scopeOverride,
  bool current = true,
  HistoryReferenceState state = HistoryReferenceState.confirmed,
  HistoryReadDimension? deniedRead,
  LifecycleField? deniedField,
  LifecycleEffectDimension? deniedEffect,
  Map<LifecycleField, HistoryReference?>? fieldOverride,
  Map<LifecycleAction, Map<LifecycleEffectDimension, HistoryReference?>>?
  effectOverride,
}) {
  final own = scope ?? _scope(), p = plan ?? _plan(inactive: inactive);
  final op =
      operation ??
      switch (screen) {
        LifecycleScreen.transfer => LifecycleOperation.confirmTransferScope,
        LifecycleScreen.delete => LifecycleOperation.deleteOwnScope,
        _ =>
          p.inactive
              ? LifecycleOperation.reactivate
              : LifecycleOperation.deactivate,
      };
  return LifecycleSnapshot(
    scope: own,
    requestId: request,
    plan: missing ? null : p,
    screen: screen,
    operation: op,
    offline: offline,
    phase: phase,
    authority: noSource
        ? null
        : authOverride ??
              _ref(
                'lifecycle-plan',
                p.subject,
                scope: own,
                request: request,
                current: current,
                state: state,
              ),
    scopeAuthority: noScope
        ? null
        : scopeOverride ??
              _ref('lifecycle-scope', p.subject, scope: own, request: request),
    resultReceipt:
        receiptOverride ??
        (receipt
            ? _ref(
                'lifecycle-request-receipt',
                '${p.subject}/${op.name}',
                scope: own,
                request: request,
              )
            : null),
    readDimensions: {
      for (final d in HistoryReadDimension.values)
        d: d == deniedRead
            ? null
            : _ref(
                'lifecycle-read',
                '${p.subject}/${d.name}',
                scope: own,
                request: request,
              ),
    },
    fields:
        fieldOverride ??
        {
          for (final f in LifecycleField.values)
            f: f == deniedField
                ? null
                : _ref(
                    'lifecycle-field',
                    '${p.subject}/${f.name}',
                    scope: own,
                    request: request,
                  ),
        },
    effects:
        effectOverride ??
        {
          for (final a in LifecycleAction.values)
            a: {
              for (final d in LifecycleEffectDimension.values)
                d: d == deniedEffect
                    ? null
                    : _ref(
                        'lifecycle-effect',
                        '${p.subject}/${op.name}/${a.name}/${d.name}',
                        scope: own,
                        request: request,
                      ),
            },
        },
  );
}

LifecycleView _view({
  LifecycleSnapshot? snapshot,
  ValueChanged<LifecycleIntent>? handler,
  bool noHandler = false,
}) => LifecycleView(
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
        key: const ValueKey('lifecycle-capture'),
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

Future<void> _tap(WidgetTester t, String key) async {
  final finder = find.byKey(ValueKey(key));
  await t.ensureVisible(finder);
  await t.pumpAndSettle();
  await t.tap(finder);
  await t.pumpAndSettle();
}

VoidCallback? _callback(WidgetTester t, String key) =>
    (t.widget(find.byKey(ValueKey(key))) as dynamic).onPressed as VoidCallback?;
String _text(WidgetTester t) => [
  ...t
      .widgetList<Text>(find.byType(Text))
      .map((w) => w.data ?? w.textSpan?.toPlainText() ?? ''),
  ...t
      .widgetList<EditableText>(find.byType(EditableText))
      .map((w) => w.controller.text),
].join('\n');
ScrollableState _scroll(WidgetTester t) => t.state<ScrollableState>(
  find
      .descendant(
        of: find.byKey(const ValueKey('lifecycle-scroll')),
        matching: find.byType(Scrollable),
      )
      .first,
);

Future<void> _press(WidgetTester t, String label) =>
    _tap(t, 'lifecycle-$label');
VoidCallback? _cb(WidgetTester t, String label) =>
    _callback(t, 'lifecycle-$label');
Map<String, LifecycleView> _cases() => {
  'manage-active': _view(),
  'manage-inactive': _view(snapshot: _snapshot(inactive: true)),
  'deactivation-review': _view(),
  'reactivation-review': _view(snapshot: _snapshot(inactive: true)),
  'transfer-context-requested': _view(),
  'delete-context-requested': _view(),
  'transfer': _view(snapshot: _snapshot(screen: LifecycleScreen.transfer)),
  'transfer-long': _view(
    snapshot: _snapshot(
      screen: LifecycleScreen.transfer,
      plan: _plan(
        values: {
          ..._plan().values,
          LifecycleField.period:
              'Örnek uzun dönem: ilk sahiplik dönemi ve başka kullanıcıların bağımsız kayıtları birbirine karıştırılmadan, seçili tarih aralığı ve bilinmeyen boşluklar ayrı gösterilir. ' +
              _plan().values[LifecycleField.period]!,
        },
      ),
    ),
  ),
  'delete-unacknowledged': _view(
    snapshot: _snapshot(screen: LifecycleScreen.delete),
  ),
  'delete-acknowledged': _view(
    snapshot: _snapshot(screen: LifecycleScreen.delete),
  ),
  'delete-alternative': _view(
    snapshot: _snapshot(screen: LifecycleScreen.delete),
  ),
  'transfer-offline': _view(
    snapshot: _snapshot(screen: LifecycleScreen.transfer, offline: true),
  ),
  'delete-offline': _view(
    snapshot: _snapshot(screen: LifecycleScreen.delete, offline: true),
  ),
  'missing': _view(snapshot: _snapshot(missing: true)),
  'source-missing': _view(snapshot: _snapshot(noSource: true)),
  'scope-missing': _view(snapshot: _snapshot(noScope: true)),
  'source-stale': _view(snapshot: _snapshot(current: false)),
  'source-held': _view(snapshot: _snapshot(state: HistoryReferenceState.held)),
  'source-unknown': _view(
    snapshot: _snapshot(state: HistoryReferenceState.unknown),
  ),
  'source-foreign': _view(
    snapshot: _snapshot(
      authOverride: _ref(
        'lifecycle-plan',
        _plan().subject,
        scope: _scope(bike: 'bike-B'),
      ),
    ),
  ),
  'private-period': _view(
    snapshot: _snapshot(
      screen: LifecycleScreen.transfer,
      deniedField: LifecycleField.period,
    ),
  ),
  'no-handler': _view(
    snapshot: _snapshot(screen: LifecycleScreen.transfer),
    noHandler: true,
  ),
  'operation-held': _view(
    snapshot: _snapshot(
      screen: LifecycleScreen.transfer,
      deniedEffect: LifecycleEffectDimension.operationIntent,
    ),
  ),
  'delete-busy': _view(
    snapshot: _snapshot(
      screen: LifecycleScreen.delete,
      phase: LifecyclePhase.submitting,
    ),
  ),
  'transfer-sent': _view(snapshot: _snapshot(screen: LifecycleScreen.transfer)),
  'delete-failed': _view(
    snapshot: _snapshot(
      screen: LifecycleScreen.delete,
      phase: LifecyclePhase.failed,
    ),
  ),
  'transfer-unknown': _view(
    snapshot: _snapshot(
      screen: LifecycleScreen.transfer,
      phase: LifecyclePhase.unknown,
    ),
  ),
  'transfer-query': _view(
    snapshot: _snapshot(
      screen: LifecycleScreen.transfer,
      phase: LifecyclePhase.unknown,
    ),
  ),
  'delete-bare-allow': _view(
    snapshot: _snapshot(
      screen: LifecycleScreen.delete,
      phase: LifecyclePhase.received,
      receiptOverride: _ref('ALLOW', _plan().subject),
    ),
  ),
  'transfer-received': _view(
    snapshot: _snapshot(
      screen: LifecycleScreen.transfer,
      phase: LifecyclePhase.received,
      receipt: true,
    ),
  ),
};
Future<void> _prepare(WidgetTester t, String state) async {
  if (state == 'transfer-context-requested' ||
      state == 'delete-context-requested') {
    await _press(
      t,
      state == 'transfer-context-requested'
          ? 'Geçmişi aktar'
          : 'Motosikleti sil',
    );
    await _press(t, 'Seçilen işlemi gözden geçir');
  }
  if (state == 'deactivation-review' || state == 'reactivation-review')
    await _press(t, 'Seçilen işlemi gözden geçir');
  if (state == 'delete-acknowledged') await _press(t, _ack);
  if (state == 'delete-alternative')
    await _press(t, 'Geçmişi korumak için etkin değil yap');
  if (state == 'transfer-sent') await _press(t, 'Aktarım kapsamını onayla');
  if (state == 'transfer-query')
    await _press(t, 'Aynı isteğin sonucunu sorgula');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    WidgetController.hitTestWarningShouldBeFatal = true;
  });
  tearDown(() {
    WidgetController.hitTestWarningShouldBeFatal = false;
  });
  testWidgets('pasiflik geçmiş ve kritik erişimi korur DEC0053 şekli açıktır', (
    t,
  ) async {
    for (final inactive in [false, true]) {
      await t.pumpWidget(const SizedBox());
      await _pump(t, _view(snapshot: _snapshot(inactive: inactive)));
      expect(_text(t), contains('Pasife alma silme değildir'));
      expect(_text(t), contains('1 motosiklet ücretsizdir'));
      expect(_text(t), contains('toplam 3'));
      expect(_text(t), contains('yalnız 1 seçili'));
      expect(_text(t), contains('haklar üst üste eklenmez'));
      expect(_text(t), contains('paket değişince kilitlenmez'));
    }
  });
  testWidgets('seçim ve gerçek gözden geçir tıklaması etki üretmez', (t) async {
    final calls = <LifecycleIntent>[];
    await _pump(t, _view(handler: calls.add));
    await _press(t, 'Geçmişi aktar');
    await _press(t, 'Seçilen işlemi gözden geçir');
    expect(calls.single.action, LifecycleAction.requestContext);
    expect(calls.single.operation, LifecycleOperation.confirmTransferScope);
    expect(calls.single.requestId, _request);
    expect(calls.single.subject, _plan().subject);
    expect(_text(t), contains('Kısmi geçmiş'));
    expect(_cb(t, 'Aktarım kapsamını onayla'), isNull);
    expect(_text(t), contains('Bu işlem için güncel kapsam'));
  });
  testWidgets(
    'kısmi aktarım kapsam onayı iz ve özel boşlukları doğrulama yapmaz',
    (t) async {
      final calls = <LifecycleIntent>[];
      await _pump(
        t,
        _view(
          snapshot: _snapshot(screen: LifecycleScreen.transfer),
          handler: calls.add,
        ),
      );
      for (final text in [
        'Kısmi geçmiş',
        'Seçilmemiş',
        'hassas görseller dahil değil',
        'uyuşmazlıklar ayrı korunur',
        'Her sahiplik dönemi',
        'doğrulanmış yapmaz',
        'hedefi sonraki adımda',
        'aktarımı tamamlamaz',
      ]) {
        expect(_text(t), contains(text));
      }
      await _press(t, 'Aktarım kapsamını onayla');
      expect(calls.single.action, LifecycleAction.confirmTransferScope);
      expect(calls.single.subject, _plan().subject);
      expect(_text(t), contains('Aynı istek tekrar gönderilemez'));
    },
  );
  testWidgets(
    'alternatif seçim yalnız yeni bağlam ister yeni izin sonra açılır',
    (t) async {
      for (final operation in [
        LifecycleOperation.confirmTransferScope,
        LifecycleOperation.deleteOwnScope,
      ]) {
        final calls = <LifecycleIntent>[];
        await t.pumpWidget(const SizedBox());
        await _pump(t, _view(handler: calls.add));
        final transfer = operation == LifecycleOperation.confirmTransferScope;
        await _press(t, transfer ? 'Geçmişi aktar' : 'Motosikleti sil');
        final preview = _cb(t, 'Seçilen işlemi gözden geçir')!;
        preview();
        preview();
        await t.pump();
        expect(calls.single.action, LifecycleAction.requestContext);
        expect(calls.single.operation, operation);
        expect(calls.single.scope.matches(_scope()), isTrue);
        expect(calls.single.requestId, _request);
        final label = transfer ? 'Aktarım kapsamını onayla' : _delete;
        if (!transfer) await _press(t, _ack);
        expect(_cb(t, label), isNull);
        expect(_text(t), contains('Yeni yanıt gelene kadar'));
        final screen = transfer
            ? LifecycleScreen.transfer
            : LifecycleScreen.delete;
        // Eski request'e farklı operation yazmak yeni bağlam değildir.
        await _pump(
          t,
          _view(
            snapshot: _snapshot(screen: screen),
            handler: calls.add,
          ),
        );
        if (!transfer) await _press(t, _ack);
        expect(_cb(t, label), isNull);
        for (final denied in [
          _snapshot(
            screen: screen,
            request: 'new-context',
            deniedField: LifecycleField.period,
          ),
          _snapshot(
            screen: screen,
            request: 'new-context',
            deniedEffect: LifecycleEffectDimension.authorization,
          ),
          _snapshot(
            screen: screen,
            request: 'new-context',
            authOverride: _ref('lifecycle-plan', _plan().subject),
          ),
        ]) {
          await _pump(t, _view(snapshot: denied, handler: calls.add));
          if (denied.readable) {
            expect(_cb(t, label), isNull);
          } else {
            expect(find.byKey(ValueKey('lifecycle-$label')), findsNothing);
            expect(_text(t), isNot(contains('Örnek seçilen dönem')));
          }
        }
        await _pump(
          t,
          _view(
            snapshot: _snapshot(screen: screen, request: 'fresh-context'),
            handler: calls.add,
          ),
        );
        if (!transfer) {
          expect(_cb(t, _delete), isNull);
          await _press(t, _ack);
        }
        await _press(t, label);
        expect(calls.length, 2);
        expect(calls.last.requestId, 'fresh-context');
        expect(calls.last.operation, operation);
        expect(
          calls.last.action,
          transfer
              ? LifecycleAction.confirmTransferScope
              : LifecycleAction.deleteOwnScope,
        );
      }
    },
  );
  testWidgets(
    'bağlam talebi eski seçim kapsam faz ve handler altında kapanır',
    (t) async {
      final calls = <LifecycleIntent>[];
      for (final next in [
        _snapshot(scope: _scope(bike: 'bike-B')),
        _snapshot(request: 'new-request'),
        _snapshot(plan: _plan(revision: 'new-plan')),
        _snapshot(phase: LifecyclePhase.submitting),
        _snapshot(deniedRead: HistoryReadDimension.authorization),
        _snapshot(offline: true),
      ]) {
        await t.pumpWidget(const SizedBox());
        await _pump(t, _view(handler: calls.add));
        await _press(t, 'Motosikleti sil');
        final stale = _cb(t, 'Seçilen işlemi gözden geçir')!;
        await _pump(t, _view(snapshot: next, handler: calls.add));
        stale();
        await t.pump();
        expect(calls, isEmpty);
      }
      await t.pumpWidget(const SizedBox());
      await _pump(t, _view(handler: calls.add));
      await _press(t, 'Geçmişi aktar');
      final stale = _cb(t, 'Seçilen işlemi gözden geçir')!;
      await _press(t, 'Motosikleti sil');
      stale();
      await t.pump();
      expect(calls, isEmpty);
      await _pump(t, _view(noHandler: true));
      await _press(t, 'Seçilen işlemi gözden geçir');
      expect(calls, isEmpty);
      expect(_cb(t, _delete), isNull);
      await t.pumpWidget(const SizedBox());
      await _pump(t, _view(handler: calls.add));
      await _press(t, 'Motosikleti sil');
      await _press(t, 'Seçilen işlemi gözden geçir');
      await _press(t, 'Geçmişi korumak için etkin değil yap');
      expect(calls.length, 2);
      expect(
        calls.every((x) => x.action == LifecycleAction.requestContext),
        isTrue,
      );
      expect(calls.last.operation, LifecycleOperation.deactivate);
      expect(_cb(t, 'Etkin değil yapma isteğini gönder'), isNull);
    },
  );
  testWidgets('silme açık kendi kapsam onayı olmadan gönderilemez', (t) async {
    final calls = <LifecycleIntent>[];
    await _pump(
      t,
      _view(
        snapshot: _snapshot(screen: LifecycleScreen.delete),
        handler: calls.add,
      ),
    );
    expect(_text(t), contains('yalnız sana ait uygulanabilir'));
    expect(_text(t), contains('otomatik silinmez'));
    expect(_cb(t, _delete), isNull);
    await _press(t, _ack);
    expect(_cb(t, _delete), isNotNull);
    await _press(t, _delete);
    expect(calls.single.action, LifecycleAction.deleteOwnScope);
    expect(calls.single.subject, _plan().subject);
    expect(calls.single.operation, LifecycleOperation.deleteOwnScope);
  });
  testWidgets(
    'onay geri çekilir ve geçmişi koruyan alternatif silme göndermez',
    (t) async {
      final calls = <LifecycleIntent>[];
      await _pump(
        t,
        _view(
          snapshot: _snapshot(screen: LifecycleScreen.delete),
          handler: calls.add,
        ),
      );
      await _press(t, _ack);
      await _press(t, _confirmedAck);
      expect(_cb(t, _delete), isNull);
      await _press(t, 'Geçmişi korumak için etkin değil yap');
      expect(calls.single.action, LifecycleAction.requestContext);
      expect(calls.single.operation, LifecycleOperation.deactivate);
      expect(_text(t), contains('Etkin değil yapmadan önce'));
      expect(_text(t), isNot(contains('Silme kapsamını ve geri')));
      expect(_cb(t, 'Etkin değil yapma isteğini gönder'), isNull);
      await _pump(
        t,
        _view(
          snapshot: _snapshot(request: 'preservation-context'),
          handler: calls.add,
        ),
      );
      await _press(t, 'Seçilen işlemi gözden geçir');
      await _press(t, 'Etkin değil yapma isteğini gönder');
      expect(calls.length, 2);
      expect(calls.last.action, LifecycleAction.deactivate);
      expect(calls.last.requestId, 'preservation-context');
    },
  );
  testWidgets(
    'etkinlik değişimi yalnız güncel işlem sunar fiziksel uygunluk değil',
    (t) async {
      for (final inactive in [false, true]) {
        final calls = <LifecycleIntent>[];
        await t.pumpWidget(const SizedBox());
        await _pump(
          t,
          _view(
            snapshot: _snapshot(inactive: inactive),
            handler: calls.add,
          ),
        );
        await _press(t, 'Seçilen işlemi gözden geçir');
        expect(_text(t), contains('fiziksel durum yeniden değerlendirilmeli'));
        await _press(
          t,
          inactive
              ? 'Yeniden etkinleştirme isteğini gönder'
              : 'Etkin değil yapma isteğini gönder',
        );
        expect(
          calls.single.action,
          inactive ? LifecycleAction.reactivate : LifecycleAction.deactivate,
        );
      }
    },
  );
  testWidgets(
    'her okuma boyutu eksikse boyanmış ve yardımcı özel metin kapalı',
    (t) async {
      final semantics = t.ensureSemantics();
      try {
        for (final d in HistoryReadDimension.values) {
          await _pump(t, _view(snapshot: _snapshot(deniedRead: d)));
          expect(_text(t), isNot(contains('Örnek motosiklet özel A')));
          expect(
            find.byWidgetPredicate(
              (w) =>
                  w is Semantics &&
                  (w.properties.label ?? '').contains(
                    'Örnek motosiklet özel A',
                  ),
            ),
            findsNothing,
          );
          expect(_text(t), contains('Özel ayrıntılar kapalı'));
        }
      } finally {
        semantics.dispose();
      }
    },
  );
  testWidgets(
    'her alan eksik eski yanlış hedef ya da yanlış amaç ise özel kapsam kapanır',
    (t) async {
      for (final f in LifecycleField.values) {
        final valid = _snapshot();
        for (final replacement in <HistoryReference?>[
          null,
          _ref(
            'lifecycle-field',
            '${_plan().subject}/${f.name}',
            current: false,
          ),
          _ref('lifecycle-field', 'foreign/${f.name}'),
          _ref('ALLOW', '${_plan().subject}/${f.name}'),
        ]) {
          await _pump(
            t,
            _view(
              snapshot: _snapshot(
                fieldOverride: {...valid.fields, f: replacement},
              ),
            ),
          );
          expect(_text(t), contains('Özel ayrıntılar kapalı'));
          expect(_text(t), isNot(contains('Örnek motosiklet özel A')));
        }
      }
    },
  );
  testWidgets(
    'plan kapsam ve request kimliği stale foreign held bilinmeyen ayrı kapanır',
    (t) async {
      final refs = <HistoryReference?>[
        null,
        _ref('lifecycle-plan', _plan().subject, current: false),
        _ref(
          'lifecycle-plan',
          _plan().subject,
          state: HistoryReferenceState.held,
        ),
        _ref(
          'lifecycle-plan',
          _plan().subject,
          state: HistoryReferenceState.unknown,
        ),
        _ref('lifecycle-plan', _plan().subject, scope: _scope(bike: 'bike-B')),
        _ref('lifecycle-plan', _plan().subject, request: 'old'),
        _ref('ALLOW', _plan().subject),
        _ref('lifecycle-plan', 'other'),
      ];
      for (final ref in refs) {
        await _pump(
          t,
          _view(
            snapshot: _snapshot(noSource: ref == null, authOverride: ref),
          ),
        );
        expect(_text(t), contains('Özel ayrıntılar kapalı'));
      }
      await _pump(
        t,
        _view(
          snapshot: _snapshot(scopeOverride: _ref('lifecycle-scope', 'other')),
        ),
      );
      expect(_text(t), contains('Özel ayrıntılar kapalı'));
      await _pump(t, _view(snapshot: _snapshot(noScope: true)));
      expect(_text(t), contains('Özel ayrıntılar kapalı'));
    },
  );
  testWidgets('her işlem boyutu ve handler ayrı gerekir çıplak ALLOW yok', (
    t,
  ) async {
    for (final d in LifecycleEffectDimension.values) {
      await _pump(
        t,
        _view(
          snapshot: _snapshot(
            screen: LifecycleScreen.transfer,
            deniedEffect: d,
          ),
        ),
      );
      expect(_cb(t, 'Aktarım kapsamını onayla'), isNull);
      expect(_text(t), contains('Kısmi geçmiş'));
    }
    final good = _snapshot(screen: LifecycleScreen.transfer);
    await _pump(
      t,
      _view(
        snapshot: _snapshot(
          screen: LifecycleScreen.transfer,
          effectOverride: {
            ...good.effects,
            LifecycleAction.confirmTransferScope: {
              for (final d in LifecycleEffectDimension.values)
                d: _ref(
                  'ALLOW',
                  '${_plan().subject}/confirmTransferScope/confirmTransferScope/${d.name}',
                ),
            },
          },
        ),
      ),
    );
    expect(_cb(t, 'Aktarım kapsamını onayla'), isNull);
    await _pump(t, _view(snapshot: good, noHandler: true));
    expect(_cb(t, 'Aktarım kapsamını onayla'), isNull);
  });
  testWidgets('onay yeni scope içerik request veya izin kaybında sıfırlanır', (
    t,
  ) async {
    for (final next in [
      _snapshot(
        screen: LifecycleScreen.delete,
        scope: _scope(bike: 'bike-B'),
      ),
      _snapshot(screen: LifecycleScreen.delete, request: 'new-request'),
      _snapshot(
        screen: LifecycleScreen.delete,
        plan: _plan(
          values: {
            ..._plan().values,
            LifecycleField.ownDeletion: 'Yeni kendi kapsamı',
          },
        ),
      ),
      _snapshot(
        screen: LifecycleScreen.delete,
        deniedField: LifecycleField.period,
      ),
    ]) {
      await t.pumpWidget(const SizedBox());
      await _pump(
        t,
        _view(snapshot: _snapshot(screen: LifecycleScreen.delete)),
      );
      await _press(t, _ack);
      await _pump(t, _view(snapshot: next));
      if (next.readable) {
        expect(_cb(t, _delete), isNull);
      } else {
        expect(_text(t), contains('Özel ayrıntılar kapalı'));
      }
    }
  });
  testWidgets('eski callback güncel kapsam faz ve işlem iznini ödünç alamaz', (
    t,
  ) async {
    final calls = <LifecycleIntent>[];
    for (final next in [
      _snapshot(
        screen: LifecycleScreen.transfer,
        scope: _scope(bike: 'bike-B'),
      ),
      _snapshot(
        screen: LifecycleScreen.transfer,
        phase: LifecyclePhase.submitting,
      ),
      _snapshot(
        screen: LifecycleScreen.transfer,
        deniedEffect: LifecycleEffectDimension.audit,
      ),
      _snapshot(
        screen: LifecycleScreen.transfer,
        deniedField: LifecycleField.period,
      ),
      _snapshot(
        screen: LifecycleScreen.transfer,
        plan: _plan(revision: 'r2'),
      ),
    ]) {
      await t.pumpWidget(const SizedBox());
      await _pump(
        t,
        _view(
          snapshot: _snapshot(screen: LifecycleScreen.transfer),
          handler: calls.add,
        ),
      );
      final stale = _cb(t, 'Aktarım kapsamını onayla')!;
      await _pump(t, _view(snapshot: next, handler: calls.add));
      stale();
      await t.pump();
      expect(calls, isEmpty);
    }
  });
  testWidgets(
    'aynı request gönderim kilidi içerik idle güncellemesinde sürer',
    (t) async {
      final calls = <LifecycleIntent>[];
      await _pump(
        t,
        _view(
          snapshot: _snapshot(screen: LifecycleScreen.transfer),
          handler: calls.add,
        ),
      );
      final stale = _cb(t, 'Aktarım kapsamını onayla')!;
      stale();
      stale();
      await t.pump();
      expect(calls.length, 1);
      await _pump(
        t,
        _view(
          snapshot: _snapshot(
            screen: LifecycleScreen.transfer,
            plan: _plan(revision: 'r2'),
          ),
          handler: calls.add,
        ),
      );
      expect(_text(t), contains('Aynı istek tekrar gönderilemez'));
      await _pump(
        t,
        _view(
          snapshot: _snapshot(screen: LifecycleScreen.transfer, request: 'new'),
          handler: calls.add,
        ),
      );
      await _press(t, 'Aktarım kapsamını onayla');
      expect(calls.length, 2);
    },
  );
  testWidgets(
    'başarısız bilinmeyen ve kanıtsızreceived sadece aynıistek sorgular',
    (t) async {
      for (final phase in [
        LifecyclePhase.failed,
        LifecyclePhase.unknown,
        LifecyclePhase.received,
      ]) {
        final calls = <LifecycleIntent>[];
        await t.pumpWidget(const SizedBox());
        await _pump(
          t,
          _view(
            snapshot: _snapshot(screen: LifecycleScreen.transfer, phase: phase),
            handler: calls.add,
          ),
        );
        expect(
          find.byKey(const ValueKey('lifecycle-Aktarım kapsamını onayla')),
          findsNothing,
        );
        final stale = _cb(t, 'Aynı isteğin sonucunu sorgula')!;
        stale();
        stale();
        await t.pump();
        expect(calls.single.action, LifecycleAction.reconcile);
        await _pump(
          t,
          _view(
            snapshot: _snapshot(
              screen: LifecycleScreen.transfer,
              phase: phase,
              plan: _plan(revision: 'r2'),
            ),
            handler: calls.add,
          ),
        );
        expect(_cb(t, 'Aynı isteğin sonucunu sorgula'), isNull);
      }
    },
  );
  testWidgets(
    'makbuz yalnız exact request operation kapsam içindir tamamlanma değil',
    (t) async {
      for (final receipt in [
        _ref('ALLOW', _plan().subject),
        _ref('lifecycle-request-receipt', '${_plan().subject}/deleteOwnScope'),
        _ref(
          'lifecycle-request-receipt',
          '${_plan().subject}/confirmTransferScope',
          request: 'old',
        ),
        _ref(
          'lifecycle-request-receipt',
          '${_plan().subject}/confirmTransferScope',
          current: false,
        ),
      ]) {
        await _pump(
          t,
          _view(
            snapshot: _snapshot(
              screen: LifecycleScreen.transfer,
              phase: LifecyclePhase.received,
              receiptOverride: receipt,
            ),
          ),
        );
        expect(_text(t), contains('sonucu kesinleşmedi'));
      }
      await _pump(
        t,
        _view(
          snapshot: _snapshot(
            screen: LifecycleScreen.transfer,
            phase: LifecyclePhase.received,
            receipt: true,
          ),
        ),
      );
      expect(_text(t), contains('tamamlandığını kanıtlamaz'));
      expect(_text(t), contains('İsteğin alındığı'));
      expect(find.text('Aynı isteğin sonucunu sorgula'), findsNothing);
    },
  );
  testWidgets(
    'çevrimdışı özel okuma sürdürülebilir ama etki ve sorgu kapanır',
    (t) async {
      await _pump(
        t,
        _view(
          snapshot: _snapshot(screen: LifecycleScreen.transfer, offline: true),
        ),
      );
      expect(_text(t), contains('Kısmi geçmiş'));
      expect(_cb(t, 'Aktarım kapsamını onayla'), isNull);
      await _pump(
        t,
        _view(
          snapshot: _snapshot(
            screen: LifecycleScreen.transfer,
            offline: true,
            phase: LifecyclePhase.unknown,
          ),
        ),
      );
      expect(_cb(t, 'Aynı isteğin sonucunu sorgula'), isNull);
    },
  );
  test(
    'immutable tam subject alan üyeliği bozukUnicode ve yanlış screen bağları',
    () {
      final values = {..._plan().values};
      final a = _plan(id: '\ud800', values: values),
          b = _plan(id: '\ufffd', values: values);
      expect(a.subject, isNot(b.subject));
      values[LifecycleField.period] = 'mutasyon';
      expect(a.values[LifecycleField.period], isNot('mutasyon'));
      expect(() => a.values.clear(), throwsUnsupportedError);
      final s = _snapshot();
      expect(() => s.fields.clear(), throwsUnsupportedError);
      expect(
        () => s.effects[LifecycleAction.deactivate]!.clear(),
        throwsUnsupportedError,
      );
      expect(_plan(revision: 'r2').subject, isNot(_plan().subject));
      expect(_plan(inactive: true).subject, isNot(_plan().subject));
      expect(() => _plan(id: ' '), throwsArgumentError);
      expect(
        () => _snapshot(
          screen: LifecycleScreen.delete,
          operation: LifecycleOperation.confirmTransferScope,
        ),
        throwsArgumentError,
      );
    },
  );
  testWidgets('gerçek klavye başlık onay kapalıbutton ve liveregion anlamlı', (
    t,
  ) async {
    final semantics = t.ensureSemantics();
    try {
      final calls = <LifecycleIntent>[];
      await _pump(
        t,
        _view(
          snapshot: _snapshot(screen: LifecycleScreen.transfer),
          handler: calls.add,
        ),
      );
      for (final title in [
        'Aktarım kapsamını gözden geçir',
        'Seçilen dönem',
        'Aktarıma dahil',
        'Kapsam boşlukları ve hariç bilgiler',
        'Kaynak ve katkı izi',
      ]) {
        expect(
          t.getSemantics(find.text(title)).flagsCollection.isHeader,
          isTrue,
        );
      }
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pumpAndSettle();
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.pumpAndSettle();
      expect(calls.single.action, LifecycleAction.confirmTransferScope);
      expect(
        find.byWidgetPredicate(
          (w) => w is Semantics && w.properties.liveRegion == true,
        ),
        findsOneWidget,
      );
      await t.pumpWidget(const SizedBox());
      await _pump(
        t,
        _view(snapshot: _snapshot(screen: LifecycleScreen.delete)),
      );
      final button = find.byKey(const ValueKey('lifecycle-' + _delete));
      final node = find
          .descendant(
            of: button,
            matching: find.byWidgetPredicate(
              (w) => w is Semantics && w.properties.button == true,
            ),
          )
          .first;
      await t.ensureVisible(button);
      expect(
        t.getSemantics(node).flagsCollection.isEnabled,
        ui.Tristate.isFalse,
      );
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pumpAndSettle();
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pumpAndSettle();
      await t.sendKeyEvent(LogicalKeyboardKey.space);
      await t.pumpAndSettle();
      expect(_cb(t, _delete), isNotNull);
    } finally {
      semantics.dispose();
    }
  });
  testWidgets('çizilmiş metin gerçek birincil kırmızı ikincil odak kontrastı', (
    t,
  ) async {
    double contrast(Color a, Color b) {
      final x = a.computeLuminance(), y = b.computeLuminance();
      return (x > y ? x + .05 : y + .05) / (x > y ? y + .05 : x + .05);
    }

    BoxDecoration paint(Finder f) =>
        t
                .widget<DecoratedBox>(
                  find
                      .descendant(of: f, matching: find.byType(DecoratedBox))
                      .first,
                )
                .decoration
            as BoxDecoration;
    Color foreground(Finder f) =>
        (t
                    .renderObject<RenderParagraph>(
                      find
                          .descendant(of: f, matching: find.byType(RichText))
                          .first,
                    )
                    .text
                as TextSpan)
            .style!
            .color!;
    await _pump(
      t,
      _view(snapshot: _snapshot(screen: LifecycleScreen.transfer)),
    );
    final primary = find.byKey(
      const ValueKey('lifecycle-Aktarım kapsamını onayla'),
    );
    await t.ensureVisible(primary);
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pumpAndSettle();
    expect((paint(primary).border! as Border).top.width, 3);
    expect(
      contrast(
        (paint(primary).border! as Border).top.color,
        paint(primary).color!,
      ),
      greaterThanOrEqualTo(3),
    );
    expect(
      contrast(foreground(primary), paint(primary).color!),
      greaterThanOrEqualTo(4.5),
    );
    final secondary = find.byKey(const ValueKey('lifecycle-Destek'));
    await t.ensureVisible(secondary);
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pumpAndSettle();
    expect((paint(secondary).border! as Border).top.width, 3);
    expect(
      contrast(foreground(secondary), paint(secondary).color!),
      greaterThanOrEqualTo(4.5),
    );
    await t.pumpWidget(const SizedBox());
    await _pump(t, _view(snapshot: _snapshot(screen: LifecycleScreen.delete)));
    await _press(t, _ack);
    final destructive = find.byKey(const ValueKey('lifecycle-' + _delete));
    expect(
      contrast(foreground(destructive), paint(destructive).color!),
      greaterThanOrEqualTo(4.5),
    );
    final canvas = t
        .widget<ColoredBox>(
          find
              .descendant(
                of: find.byType(LifecycleView),
                matching: find.byType(ColoredBox),
              )
              .first,
        )
        .color;
    for (final text in t.widgetList<Text>(
      find.descendant(
        of: find.byType(LifecycleView),
        matching: find.byType(Text),
      ),
    )) {
      if (text.style?.color != null) {
        expect(
          contrast(
            text.style!.color!,
            text == t.widget<Text>(find.text(_delete))
                ? paint(destructive).color!
                : text.style!.color == const Color(0xFFAA1830)
                ? const Color(0xFFFFFFFF)
                : canvas,
          ),
          greaterThanOrEqualTo(4.5),
        );
      }
    }
  });
  testWidgets(
    'bütün durumlar dar geniş büyük yazıda gerçek kaydırma ve çıkış',
    (t) async {
      for (final entry in _cases().entries) {
        for (final width in [320.0, 390.0, 768.0]) {
          for (final scale in [1.0, 2.0, 3.0]) {
            await t.pumpWidget(const SizedBox());
            await _pump(
              t,
              KeyedSubtree(key: ValueKey(entry.key), child: entry.value),
              width: width,
              scale: scale,
            );
            await _prepare(t, entry.key);
            final scroll = _scroll(t);
            final end = scroll.position.maxScrollExtent;
            for (double offset = 0; ; offset = (offset + 620).clamp(0, end)) {
              scroll.position.jumpTo(offset);
              await t.pumpAndSettle();
              expect(
                t.takeException(),
                isNull,
                reason: '${entry.key}/$width/$scale/$offset',
              );
              if (offset >= end) break;
            }
            final exit = find.byKey(const ValueKey('lifecycle-Vazgeç'));
            expect(t.getSize(exit).height, greaterThanOrEqualTo(52));
            await t.tap(exit);
            expect(t.takeException(), isNull);
            for (final target
                in t
                    .widgetList<Semantics>(find.byType(Semantics))
                    .where((w) => w.properties.button == true)) {
              expect(target.properties.label, isNotEmpty);
              expect(
                t.getSize(find.byWidget(target)).height,
                greaterThanOrEqualTo(52),
              );
            }
          }
        }
      }
    },
  );
  final preview = Platform.environment['KAVRIVA_LIFECYCLE_PREVIEW'];
  if (preview != null)
    testWidgets(
      'gerçek doğal çizim bütün örnek durumları tam kaydırmayla kaydeder',
      (t) async {
        final font = Platform.environment['KAVRIVA_LIFECYCLE_FONT'];
        if (font == null) throw StateError('Sabit SDK font yolu gerekli.');
        await t.runAsync(() async {
          final bytes = await File(font).readAsBytes();
          final loader = FontLoader('KavrivaLifecycleNative')
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
            font: 'KavrivaLifecycleNative',
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
              find.byKey(const ValueKey('lifecycle-capture')),
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
