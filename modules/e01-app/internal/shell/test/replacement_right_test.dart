import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart' show RenderRepaintBoundary;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/entitlement_gate.dart';
import 'package:kavriva_shell/history.dart';
import 'package:kavriva_shell/replacement_right.dart';

ReplacementScope scope({
  String account = 'account-a',
  String motorcycle = 'bike-a',
  String context = 'ctx-1',
  String catalog = 'cat-a',
  String catalogRevision = 'cat-r1',
  String selection = 'selection-a',
  String selectionRevision = 'sel-r1',
  String guide = 'guide-a',
  String guideVersion = 'guide-v1',
}) => ReplacementScope(
  accountId: account,
  history: HistoryScope(
    motorcycleId: motorcycle,
    contextRevision: context,
    catalogId: catalog,
    catalogRevision: catalogRevision,
    motorcycleLabel: 'Örnek motosiklet · gerçek karar değildir',
  ),
  selectionId: selection,
  selectionRevision: selectionRevision,
  guideId: guide,
  guideVersion: guideVersion,
);

HistoryReference reference(
  HistoryScope s,
  String request,
  String purpose,
  String subject, {
  bool current = true,
  HistoryReferenceState state = HistoryReferenceState.confirmed,
}) => HistoryReference(
  scope: s,
  requestId: request,
  purpose: purpose,
  subjectId: subject,
  source: 'Örnek sunucu kaynağı · üretim bağlı değil',
  version: 'karar-v1',
  location: 'Örnek seçim kaydı',
  checkedAt: '2026-10-17 örnek zamanı',
  reason: 'Yalnız test girdisi',
  current: current,
  state: state,
);

ReplacementSnapshot sample({
  ReplacementScope? expected,
  ReplacementScope? planScope,
  ReplacementPurpose purpose = ReplacementPurpose.preStepCorrection,
  ReplacementPurpose? planPurpose,
  ReplacementDecision decision = ReplacementDecision.mayRequest,
  ReplacementPhysicalStart physical = ReplacementPhysicalStart.notStarted,
  ReplacementCause? cause,
  ReplacementPhase phase = ReplacementPhase.idle,
  bool offline = false,
  bool absent = false,
  bool noRead = false,
  bool stale = false,
  bool wrongAccountProof = false,
  bool noPreservedAccount = false,
  ReplacementEffect? missingEffect,
  HistoryReadDimension? missingRead,
  String request = 'request-a',
  String revision = 'decision-r1',
  String reason =
      'Örnek karar: yalnız kontrol isteği. Bu bir üretim kararı değildir.',
}) {
  final s = expected ?? scope();
  final p = ReplacementPlan(
    scope: planScope ?? s,
    id: 'decision-a',
    revision: revision,
    purpose: planPurpose ?? purpose,
    decision: decision,
    physicalStart: physical,
    cause:
        cause ??
        (purpose == ReplacementPurpose.preStepCorrection
            ? ReplacementCause.wrongSelection
            : ReplacementCause.withdrawnWithoutUserFault),
    guideLabel: 'Örnek rehber · teknik uygulama içeriği değildir',
    reason: reason,
  );
  final old = EntitlementSnapshot(
    scope: s.history,
    requestId: 'preserved-r1',
    plan: null,
    readDimensions: const {},
    fields: const {},
    effects: const {},
    preservedReadDimensions: {
      for (final d in HistoryReadDimension.values)
        d: reference(
          s.history,
          'preserved-r1',
          'entitlement-preserved-read',
          _preservedSubject(s.history) + '/' + d.name,
        ),
    },
    paths: {
      for (final d in EntitlementPath.values)
        d: reference(
          s.history,
          'preserved-r1',
          'entitlement-preserved-path',
          _preservedSubject(s.history) + '/' + d.name,
        ),
    },
  );
  final bare = ReplacementSnapshot(
    scope: s,
    requestId: request,
    purpose: purpose,
    readDimensions: const {},
    effects: const {},
    preserved: old,
  );
  final accountSubject = wrongAccountProof
      ? ReplacementSnapshot(
          scope: scope(account: 'foreign-account'),
          requestId: request,
          purpose: purpose,
          readDimensions: const {},
          effects: const {},
          preserved: old,
        ).preservedAccountSubject
      : bare.preservedAccountSubject;
  return ReplacementSnapshot(
    scope: s,
    requestId: request,
    purpose: purpose,
    plan: absent ? null : p,
    offline: offline,
    phase: phase,
    preserved: old,
    authority: reference(
      s.history,
      request,
      'replacement-decision',
      p.subject,
      current: !stale,
    ),
    readDimensions: {
      for (final d in HistoryReadDimension.values)
        if (!noRead && d != missingRead)
          d: reference(
            s.history,
            request,
            'replacement-read',
            p.subject + '/' + d.name,
          ),
    },
    effects: {
      for (final d in ReplacementEffect.values)
        if (d != missingEffect)
          d: reference(
            s.history,
            request,
            'replacement-request',
            p.subject + '/' + d.name,
          ),
    },
    preservedAccountReference: noPreservedAccount
        ? null
        : reference(
            s.history,
            request,
            'replacement-preserved-account',
            accountSubject,
          ),
  );
}

// Uses the existing presentation model's public stable subject; never copies its private identity codec.
String _preservedSubject(HistoryScope s) => EntitlementSnapshot(
  scope: s,
  requestId: 'placeholder',
  plan: null,
  readDimensions: const {},
  preservedReadDimensions: const {},
  fields: const {},
  paths: const {},
  effects: const {},
).preservedSubject;

class _Input extends InheritedWidget {
  const _Input({
    required this.snapshot,
    required this.handler,
    required this.width,
    required this.scale,
    required super.child,
  });
  final ReplacementSnapshot snapshot;
  final ValueChanged<ReplacementIntent>? handler;
  final double width, scale;
  @override
  bool updateShouldNotify(_Input old) =>
      snapshot != old.snapshot ||
      handler != old.handler ||
      width != old.width ||
      scale != old.scale;
}

class _Scene extends StatelessWidget {
  const _Scene();
  @override
  Widget build(BuildContext context) {
    final input = context.dependOnInheritedWidgetOfExactType<_Input>()!;
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: TextScaler.linear(input.scale)),
      child: DefaultTextStyle(
        style: const TextStyle(fontFamily: 'Roboto', color: Color(0xFF172033)),
        child: ReplacementRightView(
          snapshot: input.snapshot,
          onIntent: input.handler,
        ),
      ),
    );
  }
}

final boundary = GlobalKey();
Future<void> show(
  WidgetTester tester,
  ReplacementSnapshot s, {
  ValueChanged<ReplacementIntent>? handler,
  double width = 390,
  double scale = 1,
}) async {
  tester.view.physicalSize = Size(width, 844);
  tester.view.devicePixelRatio = 1;
  await tester.pumpWidget(
    _Input(
      snapshot: s,
      handler: handler,
      width: width,
      scale: scale,
      child: RepaintBoundary(
        key: boundary,
        child: WidgetsApp(
          color: const Color(0xFFF8FAFC),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (_) =>
              PageRouteBuilder<void>(pageBuilder: (_, _, _) => const _Scene()),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Finder control(ReplacementAction action, [EntitlementPath? path]) => find.byKey(
  ValueKey('replacement-' + action.name + '-' + (path?.name ?? '')),
);
VoidCallback? action(
  WidgetTester tester,
  ReplacementAction a, [
  EntitlementPath? p,
]) => tester
    .widget<GestureDetector>(
      find.descendant(
        of: control(a, p),
        matching: find.byType(GestureDetector),
      ),
    )
    .onTap;

void main() {
  tearDown(() {
    TestWidgetsFlutterBinding.instance.platformDispatcher.clearAllTestValues();
  });
  setUpAll(() async {
    final font = Platform.environment['KAVRIVA_ROBOTO'];
    if (font != null) {
      final bytes = File(font).readAsBytesSync();
      await (FontLoader(
        'Roboto',
      )..addFont(Future.value(ByteData.sublistView(bytes)))).load();
    }
  });

  test('Complete account-selection tuple, hostile delimiters and immutable proof maps', () {
    final a = scope();
    final variants = [
      scope(account: 'other'),
      scope(motorcycle: 'other'),
      scope(context: 'other'),
      scope(catalog: 'other'),
      scope(catalogRevision: 'other'),
      scope(selection: 'other'),
      scope(selectionRevision: 'other'),
      scope(guide: 'other'),
      scope(guideVersion: 'other'),
    ];
    expect(a.matches(scope()), isTrue);
    for (final b in variants) {
      expect(a.matches(b), isFalse);
      expect(sample(expected: a, planScope: b).readable, isFalse);
      expect(sample(expected: a, planScope: b).requestAllowed, isFalse);
    }
    expect(
      scope(account: 'a/b', selection: 'c').subject,
      isNot(scope(account: 'a', selection: 'b/c').subject),
    );
    expect(
      scope(account: String.fromCharCode(0xd800)).subject,
      isNot(scope(account: '\uFFFD').subject),
    );
    expect(() => scope(account: ' '), throwsArgumentError);
    final s = sample();
    expect(() => s.effects.clear(), throwsUnsupportedError);
    expect(() => s.readDimensions.clear(), throwsUnsupportedError);
  });

  test(
    'Correction needs current pre-step decision and every read/effect guard',
    () {
      expect(sample().requestAllowed, isTrue);
      for (final d in HistoryReadDimension.values) {
        expect(sample(missingRead: d).readable, isFalse);
        expect(sample(missingRead: d).requestAllowed, isFalse);
      }
      for (final d in ReplacementEffect.values) {
        expect(sample(missingEffect: d).readable, isTrue);
        expect(sample(missingEffect: d).requestAllowed, isFalse);
      }
      for (final s in [
        sample(stale: true),
        sample(absent: true),
        sample(noRead: true),
        sample(offline: true),
        sample(physical: ReplacementPhysicalStart.unknown),
        sample(physical: ReplacementPhysicalStart.started),
        sample(cause: ReplacementCause.unknown),
        sample(cause: ReplacementCause.other),
        sample(cause: ReplacementCause.withdrawnWithoutUserFault),
        sample(planPurpose: ReplacementPurpose.replacementSelection),
        for (final d in ReplacementDecision.values)
          if (d != ReplacementDecision.mayRequest) sample(decision: d),
        for (final p in ReplacementPhase.values)
          if (p != ReplacementPhase.idle) sample(phase: p),
      ]) {
        expect(s.requestAllowed, isFalse);
      }
    },
  );

  test('MAY-open replacement is separate and never derived from completion or bike switch', () {
    expect(
      sample(purpose: ReplacementPurpose.replacementSelection).requestAllowed,
      isTrue,
    );
    expect(
      sample(
        purpose: ReplacementPurpose.replacementSelection,
        physical: ReplacementPhysicalStart.started,
      ).requestAllowed,
      isTrue,
    );
    for (final c in ReplacementCause.values) {
      if (c != ReplacementCause.withdrawnWithoutUserFault) {
        expect(
          sample(
            purpose: ReplacementPurpose.replacementSelection,
            cause: c,
          ).requestAllowed,
          isFalse,
        );
      }
    }
    expect(
      sample(
        purpose: ReplacementPurpose.replacementSelection,
        planPurpose: ReplacementPurpose.preStepCorrection,
      ).requestAllowed,
      isFalse,
    );
    final s = sample(
      expected: scope(motorcycle: 'new-bike'),
      planScope: scope(),
    );
    expect(s.requestAllowed, isFalse);
  });

  testWidgets(
    'Submit once; truthful request message; captured callbacks reject replay and ABA',
    (t) async {
      addTearDown(t.view.resetPhysicalSize);
      addTearDown(t.view.resetDevicePixelRatio);
      final events = <ReplacementIntent>[];
      final handler = events.add;
      await show(t, sample(), handler: handler);
      final old = action(t, ReplacementAction.request)!;
      old();
      await t.pump();
      old();
      await t.pump();
      expect(events, hasLength(1));
      expect(events.single.scope.accountId, 'account-a');
      expect(events.single.purpose, ReplacementPurpose.preStepCorrection);
      expect(events.single.subjectId, sample().plan!.subject);
      expect(
        find.text(
          'Kontrol isteği iletildi. Hakkın verildiği veya seçimin değiştiği henüz doğrulanmadı; bakım başlamış sayılmaz.',
        ),
        findsOneWidget,
      );
      await show(
        t,
        sample(expected: scope(account: 'other')),
        handler: handler,
      );
      await show(t, sample(), handler: handler);
      old();
      await t.pump();
      expect(events, hasLength(1));
      expect(action(t, ReplacementAction.request), isNull);
      await show(t, sample(request: 'request-b'), handler: handler);
      final second = action(t, ReplacementAction.request)!;
      await show(
        t,
        sample(request: 'request-b', phase: ReplacementPhase.submitting),
        handler: handler,
      );
      second();
      await t.pump();
      expect(events, hasLength(1));
      expect(action(t, ReplacementAction.request), isNull);
      await show(t, sample(request: 'request-c'), handler: handler);
      final other = action(t, ReplacementAction.request)!;
      await show(t, sample(request: 'request-c'), handler: (_) {});
      other();
      expect(events, hasLength(1));
    },
  );

  testWidgets(
    'Missing/stale/foreign private data and failure states stay closed',
    (t) async {
      addTearDown(t.view.resetPhysicalSize);
      addTearDown(t.view.resetDevicePixelRatio);
      for (final s in [
        sample(physical: ReplacementPhysicalStart.started),
        sample(physical: ReplacementPhysicalStart.unknown),
        sample(missingEffect: ReplacementEffect.audit),
        sample(absent: true),
        sample(stale: true),
        sample(noRead: true),
        sample(
          expected: scope(account: 'foreign'),
          planScope: scope(),
        ),
        sample(offline: true),
        sample(phase: ReplacementPhase.failed),
        sample(phase: ReplacementPhase.unknown),
        sample(phase: ReplacementPhase.received),
        sample(decision: ReplacementDecision.denied),
        sample(decision: ReplacementDecision.held),
      ]) {
        await show(t, s, handler: (_) => fail('No selection request expected'));
        expect(action(t, ReplacementAction.request), isNull);
        expect(find.text('Kontrol isteği gönderebilirsin'), findsNothing);
        expect(
          find.text('Sunucu değerlendirmesi: talep gönderilebilir'),
          findsNothing,
        );
        if (s.phase == ReplacementPhase.failed) {
          expect(
            find.text(
              'Kontrol tamamlanamadı. Yeni seçim talebi gönderilmiyor. Seçim değişmiş sayılmaz. Güncel bilgiyi tekrar istemek yeni seçim talebi değildir.',
            ),
            findsOneWidget,
          );
          expect(action(t, ReplacementAction.refresh), isNotNull);
        }
        if (!s.readable) {
          expect(find.text(s.scope.history.motorcycleLabel), findsNothing);
          expect(
            find.textContaining(
              'Başka bir hesaba, motosiklete veya rehbere ait karar bu seçimde kullanılmaz.',
            ),
            findsOneWidget,
          );
          expect(find.textContaining('Seçili rehber:'), findsNothing);
          expect(find.textContaining('Kaynak konumu:'), findsNothing);
        }
        expect(t.takeException(), isNull);
      }
      await show(t, sample());
      expect(action(t, ReplacementAction.request), isNull);
      expect(find.text('Kontrol isteği gönderebilirsin'), findsNothing);
      expect(
        find.text('Sunucu değerlendirmesi: talep gönderilebilir'),
        findsNothing,
      );
      expect(action(t, ReplacementAction.refresh), isNull);
    },
  );

  testWidgets(
    'Preserved paths remain independent, account-bound and subject to their own read guard',
    (t) async {
      addTearDown(t.view.resetPhysicalSize);
      addTearDown(t.view.resetDevicePixelRatio);
      final events = <ReplacementIntent>[];
      await show(
        t,
        sample(noRead: true, decision: ReplacementDecision.denied),
        handler: events.add,
      );
      for (final p in EntitlementPath.values) {
        final callback = action(t, ReplacementAction.read, p);
        expect(callback, isNotNull);
        callback!();
        await t.pump();
      }
      expect(events, hasLength(6));
      expect(events.every((e) => e.action == ReplacementAction.read), isTrue);
      expect(events.map((e) => e.path).toSet(), EntitlementPath.values.toSet());
      for (final s in [
        sample(wrongAccountProof: true),
        sample(noPreservedAccount: true),
      ]) {
        await show(t, s, handler: events.add);
        for (final p in EntitlementPath.values) {
          expect(action(t, ReplacementAction.read, p), isNull);
        }
      }
      await show(t, sample(), handler: events.add);
      final capturedRead = action(
        t,
        ReplacementAction.read,
        EntitlementPath.safety,
      )!;
      await show(t, sample(wrongAccountProof: true), handler: events.add);
      capturedRead();
      expect(events, hasLength(6));
    },
  );

  testWidgets(
    'Fresh read request is once per source; offline and submitting block refresh',
    (t) async {
      addTearDown(t.view.resetPhysicalSize);
      addTearDown(t.view.resetDevicePixelRatio);
      final events = <ReplacementIntent>[];
      final handler = events.add;
      await show(t, sample(absent: true), handler: handler);
      action(t, ReplacementAction.refresh)!();
      await t.pump();
      expect(events.single.action, ReplacementAction.refresh);
      expect(action(t, ReplacementAction.refresh), isNull);
      await show(t, sample(absent: true), handler: handler);
      expect(action(t, ReplacementAction.refresh), isNull);
      for (final s in [
        sample(offline: true),
        sample(phase: ReplacementPhase.submitting),
      ]) {
        await show(t, s, handler: handler);
        expect(action(t, ReplacementAction.refresh), isNull);
      }
      await show(t, sample(revision: 'decision-r2'), handler: handler);
      expect(action(t, ReplacementAction.refresh), isNotNull);
      expect(events, hasLength(1));
    },
  );

  testWidgets('Actual Tab Enter Space, accessible labels and 52px controls', (
    t,
  ) async {
    addTearDown(t.view.resetPhysicalSize);
    addTearDown(t.view.resetDevicePixelRatio);
    final semantics = t.ensureSemantics();
    try {
      final events = <ReplacementIntent>[];
      await show(t, sample(), handler: events.add);
      await t.ensureVisible(control(ReplacementAction.request));
      await t.pump();
      expect(
        t.getSize(control(ReplacementAction.request)).height,
        greaterThanOrEqualTo(52),
      );
      expect(
        find.bySemanticsLabel('Yanlış seçimi düzeltmek için kontrol iste'),
        findsOneWidget,
      );
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pump();
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.pump();
      expect(
        events.where((e) => e.action == ReplacementAction.request),
        hasLength(1),
      );
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pump();
      await t.sendKeyEvent(LogicalKeyboardKey.space);
      await t.pump();
      expect(
        events.where((e) => e.action == ReplacementAction.refresh),
        hasLength(1),
      );
    } finally {
      semantics.dispose();
    }
  });

  testWidgets(
    '36 narrow-wide-large-text cases expose the complete natural scroll',
    (t) async {
      addTearDown(t.view.resetPhysicalSize);
      addTearDown(t.view.resetDevicePixelRatio);
      var cases = 0;
      for (final width in [320.0, 390.0, 768.0]) {
        for (final scale in [1.0, 2.0, 3.0]) {
          for (final s in [
            sample(),
            sample(purpose: ReplacementPurpose.replacementSelection),
            sample(absent: true, offline: true),
            sample(
              reason: List.filled(
                6,
                'Uzun örnek gerekçe: güncel kontrol bekleniyor; bu metin bakım izni değildir.',
              ).join(' '),
            ),
          ]) {
            await show(t, s, width: width, scale: scale, handler: (_) {});
            final position = t
                .state<ScrollableState>(find.byType(Scrollable).first)
                .position;
            position.jumpTo(0);
            await t.pump();
            var offset = 0.0;
            while (offset < position.maxScrollExtent) {
              offset = math.min(position.maxScrollExtent, offset + 600);
              position.jumpTo(offset);
              await t.pump();
              expect(t.takeException(), isNull);
            }
            expect(find.text('Destek seçenekleri'), findsOneWidget);
            expect(
              t
                  .getRect(find.text('Destek seçenekleri'))
                  .overlaps(Rect.fromLTWH(0, 0, width, 844)),
              isTrue,
            );
            expect(t.takeException(), isNull);
            cases++;
          }
        }
      }
      expect(cases, 36);
      final q = jsonDecode(
        File('test/fixtures/replacement_right_reading_questions.json')
            .readAsStringSync(),
      ) as List;
      expect(q, hasLength(20));
    },
  );

  if (Platform.environment['KAVRIVA_NATIVE_CAPTURE_DIR'] != null) {
    testWidgets(
      'Capture natural example states with original PNG byte receipts',
      (t) async {
        addTearDown(t.view.resetPhysicalSize);
        addTearDown(t.view.resetDevicePixelRatio);
        final out = Directory(
          Platform.environment['KAVRIVA_NATIVE_CAPTURE_DIR']!,
        )..createSync(recursive: true);
        final scenarios =
            <
              ({String name, ReplacementSnapshot s, double scale, bool handler})
            >[
              (name: 'correction', s: sample(), scale: 1, handler: true),
              (
                name: 'replacement',
                s: sample(purpose: ReplacementPurpose.replacementSelection),
                scale: 1,
                handler: true,
              ),
              (
                name: 'started',
                s: sample(physical: ReplacementPhysicalStart.started),
                scale: 1,
                handler: true,
              ),
              (
                name: 'unknown-start',
                s: sample(physical: ReplacementPhysicalStart.unknown),
                scale: 1,
                handler: true,
              ),
              (
                name: 'renew-started',
                s: sample(
                  purpose: ReplacementPurpose.replacementSelection,
                  physical: ReplacementPhysicalStart.started,
                ),
                scale: 1,
                handler: true,
              ),
              (
                name: 'user-fault',
                s: sample(
                  purpose: ReplacementPurpose.replacementSelection,
                  cause: ReplacementCause.other,
                ),
                scale: 1,
                handler: true,
              ),
              (
                name: 'held',
                s: sample(decision: ReplacementDecision.held),
                scale: 1,
                handler: true,
              ),
              (
                name: 'denied',
                s: sample(decision: ReplacementDecision.denied),
                scale: 1,
                handler: true,
              ),
              (
                name: 'missing',
                s: sample(absent: true),
                scale: 1,
                handler: true,
              ),
              (
                name: 'no-read',
                s: sample(noRead: true),
                scale: 1,
                handler: true,
              ),
              (
                name: 'foreign',
                s: sample(
                  expected: scope(account: 'foreign'),
                  planScope: scope(),
                ),
                scale: 1,
                handler: true,
              ),
              (name: 'stale', s: sample(stale: true), scale: 1, handler: true),
              (
                name: 'offline',
                s: sample(offline: true),
                scale: 1,
                handler: true,
              ),
              (
                name: 'busy',
                s: sample(phase: ReplacementPhase.submitting),
                scale: 1,
                handler: true,
              ),
              (
                name: 'error',
                s: sample(phase: ReplacementPhase.failed),
                scale: 1,
                handler: true,
              ),
              (
                name: 'received',
                s: sample(phase: ReplacementPhase.received),
                scale: 1,
                handler: true,
              ),
              (name: 'no-handler', s: sample(), scale: 1, handler: false),
              (
                name: 'no-intent',
                s: sample(missingEffect: ReplacementEffect.operationIntent),
                scale: 1,
                handler: true,
              ),
              (
                name: 'no-account-read',
                s: sample(wrongAccountProof: true),
                scale: 1,
                handler: true,
              ),
              (
                name: 'long',
                s: sample(
                  reason: List.filled(
                    6,
                    'Uzun örnek gerekçe: güncel kontrol bekleniyor; bu metin bakım izni değildir.',
                  ).join(' '),
                ),
                scale: 1,
                handler: true,
              ),
              (name: 'large-correction', s: sample(), scale: 3, handler: true),
              (
                name: 'large-replacement',
                s: sample(purpose: ReplacementPurpose.replacementSelection),
                scale: 3,
                handler: true,
              ),
            ];
        final frames = <Map<String, Object?>>[];
        final caseRows = <Map<String, Object?>>[];
        for (final c in scenarios) {
          await show(
            t,
            c.s,
            scale: c.scale,
            handler: c.handler ? (_) {} : null,
          );
          final position = t
              .state<ScrollableState>(find.byType(Scrollable).first)
              .position;
          position.jumpTo(0);
          await t.pump();
          final max = position.maxScrollExtent;
          var offset = 0.0, index = 0;
          while (true) {
            position.jumpTo(offset);
            await t.pump();
            final repaint = t.renderObject<RenderRepaintBoundary>(
              find.byKey(boundary),
            );
            final png = await t.runAsync(() async {
              final img = await repaint.toImage(pixelRatio: 1);
              try {
                return (await img.toByteData(format: ui.ImageByteFormat.png))!
                    .buffer
                    .asUint8List();
              } finally {
                img.dispose();
              }
            });
            final name =
                'native-r3-' + c.name + '-' + index.toString() + '.png';
            final file = File(out.path + '/' + name)..writeAsBytesSync(png!);
            frames.add({
              'case': c.name,
              'index': index,
              'scale': c.scale,
              'offset': offset,
              'maxScrollExtent': max,
              'file': file.path,
              'bytes': png.length,
              'width': 390,
              'height': 844,
            });
            expect(t.takeException(), isNull);
            if (offset >= max) break;
            offset = math.min(max, offset + 600);
            index++;
          }
          caseRows.add({
            'name': c.name,
            'scale': c.scale,
            'frames': index + 1,
            'maxScrollExtent': max,
          });
        }
        File(out.path + '/native-r3-manifest.json').writeAsStringSync(
          const JsonEncoder.withIndent('  ')
                  .convert({'cases': caseRows, 'frames': frames}) +
              '\n',
        );
      },
    );
  }
}
