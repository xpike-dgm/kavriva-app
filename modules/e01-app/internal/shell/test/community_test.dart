import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/community.dart';

String identity(String value) =>
    '${value.codeUnits.length}:${value.codeUnits.map((x) => x.toRadixString(16).padLeft(4, '0')).join()}';
CommunityScope scope({
  String local = 'local-A',
  String? account = 'account-A',
}) => CommunityScope(
  localId: local,
  localRevision: 'r1',
  accountId: account,
  accountRevision: account == null ? null : 'r1',
  motorcycleId: 'bike-A',
  motorcycleRevision: 'r1',
);
CommunityDocument document(
  CommunityScreen screen, {
  CommunityState? state,
  String experience =
      'Örnek deneyim: parçanın durumunu gözlemledim; bu kişisel anlatımdır.',
  String revision = 'r1',
}) => CommunityDocument(
  id: 'example-A',
  revision: revision,
  screen: screen,
  state:
      state ??
      (screen == CommunityScreen.discovery
          ? CommunityState.accepted
          : screen == CommunityScreen.review
          ? CommunityState.needsRevision
          : CommunityState.ready),
  publicValues: {
    'context': 'Örnek motosiklet · kullanıcı beyanı',
    'source': 'Örnek topluluk kaynağı',
    'checkedAt': '2026-10-07',
    'title': 'Kişisel gözlem örneği',
    'experience': experience,
    'sharedScope':
        'Yalnız gösterilen anlatım ve seçilen açıklama; isteğe bağlı fotoğraf',
    'review': 'İnceleme örneği · teknik doğrulama değil',
    'reason': 'Örnek anlatımın kaynağı açıklanmamış; şu anda yayınlanamıyor.',
    'repair': 'Anlatımın kaynağını açıklayıp yeniden inceleme isteyebilirsin.',
  },
  privateValues: {
    'privateScope': 'Kişisel bakım notları ve hesap bilgileri özel kalır.',
  },
);
CommunityReference reference(
  CommunityScope s,
  String request,
  String purpose,
  String subject, {
  bool current = true,
  CommunityReferenceState state = CommunityReferenceState.confirmed,
}) => CommunityReference(
  scope: s,
  requestId: request,
  purpose: purpose,
  subjectId: subject,
  source: 'Açık test kaynağı',
  version: 'r1',
  checkedAt: '2026-10-07',
  reason: 'Sunum örneği',
  current: current,
  state: state,
);
CommunitySnapshot snapshot(
  CommunityScreen screen, {
  CommunityDocument? doc,
  CommunityScope? target,
  String request = 'request-A',
  bool absent = false,
  bool current = true,
  bool offline = false,
  bool outcome = true,
  CommunityReadDimension? missingRead,
  CommunityEffectDimension? missingEffect,
  String? missingField,
  CommunityAction? missingAction,
}) {
  final d = doc ?? document(screen), s = target ?? scope();
  CommunityReference ref(String p, String subject) =>
      reference(s, request, p, subject, current: current);
  return CommunitySnapshot(
    scope: s,
    requestId: request,
    document: absent ? null : d,
    authority: ref('community-read', d.subject),
    reads: {
      for (final x in CommunityReadDimension.values)
        if (x != missingRead)
          x: ref('community-read-dimension', '${d.subject}/${x.name}'),
    },
    fields: {
      for (final k in d.publicValues.keys)
        if (k != missingField)
          'public/${identity(k)}': ref(
            'community-field',
            '${d.subject}/public/${identity(k)}',
          ),
      for (final k in d.privateValues.keys)
        if (k != missingField)
          'private/${identity(k)}': ref(
            'community-field',
            '${d.subject}/private/${identity(k)}',
          ),
    },
    actions: {
      for (final a in CommunityAction.values)
        if (a != missingAction)
          a: ref('community-action', '${d.subject}/${a.name}'),
    },
    effects: {
      for (final x in CommunityEffectDimension.values)
        if (x != missingEffect)
          x: ref('community-effect', '${d.subject}/${x.name}'),
    },
    outcome: outcome ? ref('community-outcome', d.subject) : null,
    offline: offline,
  );
}

CommunitySnapshot rebound(
  CommunitySnapshot old, {
  CommunityDocument? doc,
  CommunityScope? target,
  String? request,
  bool? offline,
}) => CommunitySnapshot(
  scope: target ?? old.scope,
  requestId: request ?? old.requestId,
  document: doc ?? old.document,
  authority: old.authority,
  reads: old.reads,
  fields: old.fields,
  actions: old.actions,
  effects: old.effects,
  outcome: old.outcome,
  offline: offline ?? old.offline,
);
Widget host(
  CommunityScreen screen,
  CommunitySnapshot s, {
  ValueChanged<CommunityIntent>? handler,
  Key? key,
  double scale = 1,
}) => WidgetsApp(
  color: const Color(0xFFFFFFFF),
  builder: (context, child) => MediaQuery(
    data: MediaQueryData(
      size: const Size(390, 844),
      textScaler: TextScaler.linear(scale),
    ),
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: CommunityView(
        key: key,
        screen: screen,
        snapshot: s,
        onIntent: handler,
      ),
    ),
  ),
);
Future<void> press(WidgetTester t, String label) async {
  final f = find.byKey(ValueKey('community-$label'));
  await t.ensureVisible(f);
  await t.tap(f);
  await t.pump();
}

Map<String, CommunitySnapshot> cases() => {
  'contribution-selected': snapshot(CommunityScreen.contribution),
  'contribution-requested': snapshot(CommunityScreen.contribution),
  'review-selected': snapshot(CommunityScreen.review),
  for (final screen in CommunityScreen.values) ...{
    '${screen.name}-ready': snapshot(screen),
    '${screen.name}-unknown': snapshot(screen, absent: true),
    '${screen.name}-stale': snapshot(screen, current: false),
    '${screen.name}-offline': snapshot(screen, offline: true),
    '${screen.name}-field-held': snapshot(screen, missingField: 'context'),
  },
  for (final state in [
    CommunityState.pending,
    CommunityState.held,
    CommunityState.dangerous,
    CommunityState.accepted,
    CommunityState.withdrawn,
    CommunityState.failed,
  ])
    'review-${state.name}': snapshot(
      CommunityScreen.review,
      doc: document(CommunityScreen.review, state: state),
    ),
  'discovery-empty': snapshot(
    CommunityScreen.discovery,
    doc: document(CommunityScreen.discovery, state: CommunityState.empty),
  ),
  'discovery-dangerous': snapshot(
    CommunityScreen.discovery,
    doc: document(CommunityScreen.discovery, state: CommunityState.dangerous),
  ),
  'discovery-outcome-held': snapshot(CommunityScreen.discovery, outcome: false),
  'contribution-private-held': snapshot(
    CommunityScreen.contribution,
    missingField: 'privateScope',
  ),
  'contribution-long': snapshot(
    CommunityScreen.contribution,
    doc: document(
      CommunityScreen.contribution,
      experience: List.filled(
        8,
        'Uzun kişisel anlatım örneği: bu gözlemler başka motosiklette uygulanabilirliği veya teknik doğruluğu kanıtlamaz; güncel kaynak ve uygunluk ayrıca değerlendirilmelidir.',
      ).join(' '),
    ),
  ),
};
Future<void> pumpSized(
  WidgetTester t,
  CommunityScreen screen,
  CommunitySnapshot s, {
  double width = 390,
  double scale = 1,
  String? font,
}) async {
  t.view.devicePixelRatio = 1;
  t.view.physicalSize = Size(width, 844);
  addTearDown(t.view.resetPhysicalSize);
  addTearDown(t.view.resetDevicePixelRatio);
  await t.pumpWidget(
    Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: MediaQueryData(
          size: Size(width, 844),
          textScaler: TextScaler.linear(scale),
        ),
        child: DefaultTextStyle(
          style: TextStyle(fontFamily: font),
          child: RepaintBoundary(
            key: const ValueKey('community-capture'),
            child: CommunityView(screen: screen, snapshot: s, onIntent: (_) {}),
          ),
        ),
      ),
    ),
  );
  await t.pumpAndSettle();
}

ScrollPosition position(WidgetTester t) =>
    t.state<ScrollableState>(find.byType(Scrollable).first).position;
Future<void> prepare(WidgetTester t, String name) async {
  if (name == 'contribution-selected' ||
      name == 'contribution-requested' ||
      name == 'review-selected') {
    await press(t, 'opt-in');
    if (name == 'contribution-requested') await press(t, 'Toplulukla paylaş');
    position(t).jumpTo(0);
    await t.pumpAndSettle();
  }
}

void main() {
  test('lossless identity and blank validation', () {
    final a = document(CommunityScreen.contribution, experience: 'abc'),
        b = document(CommunityScreen.contribution, experience: ' abc\n');
    expect(a.subject, isNot(b.subject));
    expect(b.publicValues['experience'], ' abc\n');
    expect(
      () => document(CommunityScreen.contribution, experience: ' \t'),
      throwsArgumentError,
    );
  });
  test('immutable maps and ambiguous normalized keys rejected', () {
    final values = {'context': 'A'};
    final d = CommunityDocument(
      id: 'a',
      revision: 'r1',
      screen: CommunityScreen.discovery,
      state: CommunityState.empty,
      publicValues: values,
      privateValues: {},
    );
    values['context'] = 'B';
    expect(d.publicValues['context'], 'A');
    expect(() => d.publicValues['context'] = 'C', throwsUnsupportedError);
    expect(
      () => CommunityDocument(
        id: 'a',
        revision: 'r1',
        screen: CommunityScreen.discovery,
        state: CommunityState.empty,
        publicValues: {'a': 'x', ' a ': 'y'},
        privateValues: {},
      ),
      throwsArgumentError,
    );
  });
  test('paired scope revisions required', () {
    expect(
      () => CommunityScope(localId: 'a', localRevision: 'r1', accountId: 'a'),
      throwsArgumentError,
    );
    expect(scope(account: null).accountId, isNull);
  });
  test('all read dimensions required; datafree exit unaffected', () {
    for (final x in CommunityReadDimension.values) {
      final s = snapshot(CommunityScreen.contribution, missingRead: x);
      expect(s.readableFor(CommunityScreen.contribution), false);
      expect(
        s.actionAllowed(CommunityScreen.contribution, CommunityAction.publish),
        false,
      );
      expect(
        s.actionAllowed(CommunityScreen.contribution, CommunityAction.cancel),
        true,
      );
    }
  });
  test('all six effect dimensions required for external actions', () {
    for (final x in CommunityEffectDimension.values) {
      expect(
        snapshot(
          CommunityScreen.contribution,
          missingEffect: x,
        ).actionAllowed(CommunityScreen.contribution, CommunityAction.publish),
        false,
      );
    }
  });
  test(
    'changed content, private scope, request and account cannot borrow grants',
    () {
      final s = snapshot(CommunityScreen.contribution);
      for (final n in [
        rebound(
          s,
          doc: document(CommunityScreen.contribution, experience: 'Different'),
        ),
        rebound(s, request: 'request-B'),
        rebound(s, target: scope(account: 'B')),
        rebound(s, doc: document(CommunityScreen.contribution, revision: 'r2')),
      ]) {
        expect(n.readableFor(CommunityScreen.contribution), false);
        expect(
          n.actionAllowed(
            CommunityScreen.contribution,
            CommunityAction.publish,
          ),
          false,
        );
      }
    },
  );
  test('unknown held stale wrong-purpose and foreign refs fail closed', () {
    final s = scope(), d = document(CommunityScreen.contribution);
    for (final r in [
      reference(s, 'request-A', 'community-read', d.subject, current: false),
      reference(
        s,
        'request-A',
        'community-read',
        d.subject,
        state: CommunityReferenceState.held,
      ),
      reference(s, 'request-A', 'wrong', d.subject),
      reference(scope(account: 'B'), 'request-A', 'community-read', d.subject),
    ]) {
      expect(
        CommunitySnapshot(
          scope: s,
          requestId: 'request-A',
          document: d,
          authority: r,
        ).readableFor(CommunityScreen.contribution),
        false,
      );
    }
  });
  test(
    'missing private scope prevents publication, public read can remain',
    () {
      final s = snapshot(
        CommunityScreen.contribution,
        missingField: 'privateScope',
      );
      expect(s.readableFor(CommunityScreen.contribution), true);
      expect(
        s.actionAllowed(CommunityScreen.contribution, CommunityAction.publish),
        false,
      );
    },
  );
  test(
    'state and online constraints are independent from role or photo text',
    () {
      for (final state in CommunityState.values) {
        final s = snapshot(
          CommunityScreen.contribution,
          doc: document(CommunityScreen.contribution, state: state),
        );
        expect(
          s.actionAllowed(
            CommunityScreen.contribution,
            CommunityAction.publish,
          ),
          state == CommunityState.ready,
        );
      }
      expect(
        snapshot(
          CommunityScreen.contribution,
          offline: true,
        ).actionAllowed(CommunityScreen.contribution, CommunityAction.publish),
        false,
      );
      expect(
        snapshot(
          CommunityScreen.contribution,
          target: scope(account: null),
        ).actionAllowed(CommunityScreen.contribution, CommunityAction.publish),
        false,
      );
    },
  );
  test(
    'outcome requires separate current reference and cannot reopen writes',
    () {
      final s = snapshot(
        CommunityScreen.review,
        doc: document(CommunityScreen.review, state: CommunityState.withdrawn),
      );
      expect(s.resultConfirmed(CommunityScreen.review), true);
      expect(
        s.actionAllowed(CommunityScreen.review, CommunityAction.withdraw),
        false,
      );
      expect(
        snapshot(
          CommunityScreen.review,
          doc: s.document,
          outcome: false,
        ).resultConfirmed(CommunityScreen.review),
        false,
      );
    },
  );
  test('appeal withdrawal report each need their own current action', () {
    for (final a in [CommunityAction.appeal, CommunityAction.withdraw])
      expect(
        snapshot(
          CommunityScreen.review,
          missingAction: a,
        ).actionAllowed(CommunityScreen.review, a),
        false,
      );
    expect(
      snapshot(
        CommunityScreen.discovery,
        missingAction: CommunityAction.report,
      ).actionAllowed(CommunityScreen.discovery, CommunityAction.report),
      false,
    );
  });
  testWidgets(
    'explicit opt-in before single publication intent, never success',
    (t) async {
      final events = <CommunityIntent>[];
      await t.pumpWidget(
        host(
          CommunityScreen.contribution,
          snapshot(CommunityScreen.contribution),
          handler: events.add,
        ),
      );
      await press(t, 'Toplulukla paylaş');
      expect(events, isEmpty);
      await press(t, 'opt-in');
      await press(t, 'Toplulukla paylaş');
      await press(t, 'Toplulukla paylaş');
      expect(events.length, 1);
      expect(events.single.action, CommunityAction.publish);
      expect(find.textContaining('İstek iletildi.'), findsOneWidget);
      expect(find.text('Toplulukta yayınlandı'), findsNothing);
    },
  );
  testWidgets('private values never appear in public discovery', (t) async {
    await t.pumpWidget(
      host(
        CommunityScreen.discovery,
        snapshot(CommunityScreen.discovery),
        handler: (_) {},
      ),
    );
    expect(find.textContaining('Kişisel bakım notları'), findsNothing);
    expect(find.textContaining('Kullanıcı anlatımı:'), findsOneWidget);
    expect(find.textContaining('teknik doğruluğunun'), findsOneWidget);
  });
  testWidgets('held dangerous unknown and absent content stay hidden', (
    t,
  ) async {
    for (final state in [
      CommunityState.held,
      CommunityState.dangerous,
      CommunityState.unknown,
      CommunityState.withdrawn,
    ]) {
      await t.pumpWidget(
        host(
          CommunityScreen.discovery,
          snapshot(
            CommunityScreen.discovery,
            doc: document(CommunityScreen.discovery, state: state),
          ),
          handler: (_) {},
        ),
      );
      expect(find.textContaining('Kullanıcı anlatımı:'), findsNothing);
    }
    await t.pumpWidget(
      host(
        CommunityScreen.discovery,
        snapshot(CommunityScreen.discovery, absent: true),
        handler: (_) {},
      ),
    );
    expect(find.textContaining('Güncel kaynak ve okuma izni'), findsOneWidget);
  });
  testWidgets(
    'fresh doc resets consent and old publication callback rejects new context',
    (t) async {
      final events = <CommunityIntent>[], key = GlobalKey();
      await t.pumpWidget(
        host(
          CommunityScreen.contribution,
          snapshot(CommunityScreen.contribution),
          handler: events.add,
          key: key,
        ),
      );
      await press(t, 'opt-in');
      final old = t
          .widget<GestureDetector>(
            find.descendant(
              of: find.byKey(const ValueKey('community-Toplulukla paylaş')),
              matching: find.byType(GestureDetector),
            ),
          )
          .onTap!;
      await t.pumpWidget(
        host(
          CommunityScreen.contribution,
          snapshot(
            CommunityScreen.contribution,
            doc: document(CommunityScreen.contribution, experience: ' abc\n'),
          ),
          handler: events.add,
          key: key,
        ),
      );
      old();
      await t.pump();
      expect(events, isEmpty);
      expect(find.text('Gösterilen kapsamı paylaşmayı seç'), findsOneWidget);
    },
  );
  testWidgets(
    'same request sent lock survives content change and fresh grants',
    (t) async {
      final events = <CommunityIntent>[], key = GlobalKey();
      await t.pumpWidget(
        host(
          CommunityScreen.contribution,
          snapshot(CommunityScreen.contribution),
          handler: events.add,
          key: key,
        ),
      );
      await press(t, 'opt-in');
      await press(t, 'Toplulukla paylaş');
      await t.pumpWidget(
        host(
          CommunityScreen.contribution,
          snapshot(
            CommunityScreen.contribution,
            doc: document(CommunityScreen.contribution, revision: 'r2'),
          ),
          handler: events.add,
          key: key,
        ),
      );
      await press(t, 'opt-in');
      await press(t, 'Toplulukla paylaş');
      expect(events.length, 1);
      expect(find.textContaining('İstek iletildi.'), findsNothing);
    },
  );
  testWidgets(
    'datafree cancellation works without document or publication authority',
    (t) async {
      final events = <CommunityIntent>[];
      await t.pumpWidget(
        host(
          CommunityScreen.contribution,
          snapshot(CommunityScreen.contribution, absent: true, current: false),
          handler: events.add,
        ),
      );
      await press(t, 'Vazgeç · yerel kullanıma dön');
      expect(events.single.scope, isNull);
      expect(events.single.subjectId, isEmpty);
    },
  );
  testWidgets('no handler disables actions, including safe route', (t) async {
    await t.pumpWidget(
      host(
        CommunityScreen.contribution,
        snapshot(CommunityScreen.contribution),
      ),
    );
    await press(t, 'Vazgeç · yerel kullanıma dön');
    expect(t.takeException(), isNull);
    final node = t.widget<Semantics>(
      find.byWidgetPredicate(
        (w) =>
            w is Semantics &&
            w.properties.label == 'Vazgeç · yerel kullanıma dön',
      ),
    );
    expect(node.properties.enabled, false);
  });
  testWidgets('accepted without outcome never claims publication', (t) async {
    await t.pumpWidget(
      host(
        CommunityScreen.review,
        snapshot(
          CommunityScreen.review,
          doc: document(CommunityScreen.review, state: CommunityState.accepted),
          outcome: false,
        ),
        handler: (_) {},
      ),
    );
    expect(find.text('Toplulukta yayınlandı'), findsNothing);
  });
  testWidgets('real keyboard activation and accessible headings', (t) async {
    final events = <CommunityIntent>[];
    await t.pumpWidget(
      WidgetsApp(
        color: const Color(0xFFFFFFFF),
        onGenerateRoute: (_) => PageRouteBuilder<void>(
          pageBuilder: (_, __, ___) => Directionality(
            textDirection: TextDirection.ltr,
            child: CommunityView(
              screen: CommunityScreen.discovery,
              snapshot: snapshot(CommunityScreen.discovery),
              onIntent: events.add,
            ),
          ),
        ),
      ),
    );
    await t.pumpAndSettle();
    final semantics = t.ensureSemantics();
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pumpAndSettle();
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pumpAndSettle();
    await t.sendKeyEvent(LogicalKeyboardKey.enter);
    await t.pump();
    expect(events.single.action, CommunityAction.contribute);
    expect(
      find.byWidgetPredicate(
        (w) => w is Semantics && w.properties.header == true,
      ),
      findsWidgets,
    );
    semantics.dispose();
  });
  testWidgets(
    'visible search never searches private or denied fields and resets across scope',
    (t) async {
      final key = GlobalKey();
      await t.pumpWidget(
        host(
          CommunityScreen.discovery,
          snapshot(CommunityScreen.discovery),
          handler: (_) {},
          key: key,
        ),
      );
      await t.enterText(
        find.byKey(const ValueKey('community-search')),
        'Kişisel bakım notları',
      );
      await t.pump();
      expect(find.textContaining('Kullanıcı anlatımı:'), findsNothing);
      expect(find.textContaining('bu sözcük bulunamadı'), findsOneWidget);
      await t.pumpWidget(
        host(
          CommunityScreen.discovery,
          snapshot(CommunityScreen.discovery, target: scope(account: 'B')),
          handler: (_) {},
          key: key,
        ),
      );
      expect(
        t
            .widget<EditableText>(
              find.byKey(const ValueKey('community-search')),
            )
            .controller
            .text,
        isEmpty,
      );
      expect(find.textContaining('Kullanıcı anlatımı:'), findsOneWidget);
    },
  );
  testWidgets(
    'Bütün durumlar küçük geniş ekran ve büyük yazıda kaydırılır; çıkış hedefi kullanılabilir',
    (t) async {
      for (final entry in cases().entries) {
        final screen =
            entry.value.document?.screen ??
            CommunityScreen.values.firstWhere(
              (s) => entry.key.startsWith(s.name),
            );
        for (final width in [320.0, 390.0, 768.0]) {
          for (final scale in [1.0, 2.0, 3.0]) {
            await t.pumpWidget(const SizedBox());
            await pumpSized(t, screen, entry.value, width: width, scale: scale);
            await prepare(t, entry.key);
            final pos = position(t), end = pos.maxScrollExtent;
            for (double offset = 0; ; offset = (offset + 620).clamp(0, end)) {
              pos.jumpTo(offset);
              await t.pumpAndSettle();
              expect(
                t.takeException(),
                isNull,
                reason: '${entry.key}/$width/$scale/$offset',
              );
              if (offset >= end) break;
            }
            for (final w
                in t
                    .widgetList<Semantics>(find.byType(Semantics))
                    .where((w) => w.properties.button == true)) {
              expect(
                t.getSize(find.byWidget(w)).height,
                greaterThanOrEqualTo(52),
              );
            }
            const label = 'Vazgeç · yerel kullanıma dön';
            await t.ensureVisible(find.text(label));
            await t.pumpAndSettle();
            await t.tap(find.text(label));
            await t.pumpAndSettle();
            expect(t.takeException(), isNull);
          }
        }
      }
    },
  );
  final preview = Platform.environment['KAVRIVA_COMMUNITY_PREVIEW'];
  if (preview != null)
    testWidgets(
      'Doğal Flutter çizimi bütün durumları tam kaydırmayla kaydeder',
      (t) async {
        final font = Platform.environment['KAVRIVA_COMMUNITY_FONT'];
        if (font == null) throw StateError('Sabit SDK font yolu gerekli.');
        await t.runAsync(() async {
          final bytes = await File(font).readAsBytes();
          final loader = FontLoader('KavrivaCommunityNative')
            ..addFont(Future.value(ByteData.sublistView(bytes)));
          await loader.load();
        });
        final rows = <String>[];
        for (final entry in cases().entries) {
          await t.pumpWidget(const SizedBox());
          final screen =
              entry.value.document?.screen ??
              CommunityScreen.values.firstWhere(
                (s) => entry.key.startsWith(s.name),
              );
          await pumpSized(
            t,
            screen,
            entry.value,
            font: 'KavrivaCommunityNative',
          );
          await prepare(t, entry.key);
          final pos = position(t), end = pos.maxScrollExtent;
          var index = 0;
          for (double offset = 0; ; offset = (offset + 620).clamp(0, end)) {
            pos.jumpTo(offset);
            await t.pumpAndSettle();
            final boundary = t.renderObject<RenderRepaintBoundary>(
              find.byKey(const ValueKey('community-capture')),
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
  testWidgets('missing privacy scope cannot be silently selected', (t) async {
    await t.pumpWidget(
      host(
        CommunityScreen.contribution,
        snapshot(CommunityScreen.contribution, missingField: 'privateScope'),
        handler: (_) {},
      ),
    );
    await press(t, 'opt-in');
    expect(find.text('Paylaşım seçildi · seçimi kaldır'), findsNothing);
    expect(
      find.textContaining(
        'Yeni yayın veya yeniden gönderme seçeneği şu anda kapalı',
      ),
      findsOneWidget,
    );
  });
  testWidgets('Çizilmiş metin renkleri okunabilir; gerçek odak belirgin', (
    t,
  ) async {
    double contrast(Color a, Color b) {
      final x = a.computeLuminance(), y = b.computeLuminance();
      return ((x > y ? x : y) + .05) / ((x > y ? y : x) + .05);
    }

    await t.pumpWidget(
      WidgetsApp(
        color: const Color(0xFFFFFFFF),
        onGenerateRoute: (_) => PageRouteBuilder<void>(
          pageBuilder: (_, __, ___) => CommunityView(
            screen: CommunityScreen.contribution,
            snapshot: snapshot(CommunityScreen.contribution),
            onIntent: (_) {},
          ),
        ),
      ),
    );
    await t.pumpAndSettle();
    for (final text in t.widgetList<Text>(find.byType(Text))) {
      final f = find.byWidget(text);
      final paragraph = t.renderObject<RenderParagraph>(f);
      final fg = (paragraph.text as TextSpan).style!.color!;
      Color bg = const Color(0xFFF8FAFC);
      final ancestors = find.ancestor(
        of: f,
        matching: find.byType(DecoratedBox),
      );
      if (ancestors.evaluate().isNotEmpty)
        bg =
            (t.widget<DecoratedBox>(ancestors.first).decoration
                    as BoxDecoration)
                .color ??
            bg;
      expect(contrast(fg, bg), greaterThanOrEqualTo(4.5), reason: text.data);
    }
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pumpAndSettle();
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
  });

  testWidgets('old consent callback cannot select changed content', (t) async {
    final key = GlobalKey();
    await t.pumpWidget(
      host(
        CommunityScreen.contribution,
        snapshot(CommunityScreen.contribution),
        handler: (_) {},
        key: key,
      ),
    );
    final old = t
        .widget<GestureDetector>(
          find.descendant(
            of: find.byKey(const ValueKey('community-opt-in')),
            matching: find.byType(GestureDetector),
          ),
        )
        .onTap!;
    await t.pumpWidget(
      host(
        CommunityScreen.contribution,
        snapshot(
          CommunityScreen.contribution,
          doc: document(CommunityScreen.contribution, revision: 'r2'),
        ),
        handler: (_) {},
        key: key,
      ),
    );
    old();
    await t.pump();
    expect(find.text('Paylaşım seçildi · seçimi kaldır'), findsNothing);
  });
  testWidgets('old write callback rejects changed handler or offline state', (
    t,
  ) async {
    final events = <CommunityIntent>[], key = GlobalKey();
    final handler = events.add;
    await t.pumpWidget(
      host(
        CommunityScreen.contribution,
        snapshot(CommunityScreen.contribution),
        handler: handler,
        key: key,
      ),
    );
    await press(t, 'opt-in');
    final old = t
        .widget<GestureDetector>(
          find.descendant(
            of: find.byKey(const ValueKey('community-Toplulukla paylaş')),
            matching: find.byType(GestureDetector),
          ),
        )
        .onTap!;
    await t.pumpWidget(
      host(
        CommunityScreen.contribution,
        snapshot(CommunityScreen.contribution, offline: true),
        handler: handler,
        key: key,
      ),
    );
    old();
    await t.pump();
    expect(events, isEmpty);
    await t.pumpWidget(
      host(
        CommunityScreen.contribution,
        snapshot(CommunityScreen.contribution),
        handler: (_) {},
        key: key,
      ),
    );
    old();
    await t.pump();
    expect(events, isEmpty);
  });
}
