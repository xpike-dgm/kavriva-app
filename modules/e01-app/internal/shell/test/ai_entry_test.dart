import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/ai_entry.dart';
import 'package:kavriva_shell/kavriva_shell.dart';

AiEntryScope scope({String revision = 'r1'}) => AiEntryScope(
  localId: 'local-A',
  localRevision: 'r1',
  motorcycleId: 'bike-A',
  motorcycleRevision: revision,
);

AiEntryReference ref(AiEntrySnapshot s, String purpose, {String defect = ''}) =>
    AiEntryReference(
      scope: defect == 'scope' ? scope(revision: 'other') : s.scope!,
      requestId: defect == 'request' ? 'other' : s.requestId,
      subjectId: defect == 'subject' ? 'other' : s.subjectId,
      purpose: defect == 'purpose' ? 'other' : purpose,
      source: 'Açık test kaynağı',
      version: 'r1',
      checkedAt: '2026-10-09',
      reason: 'Yalnız sunum fikstürü',
      confirmed: defect != 'unconfirmed',
      state: switch (defect) {
        'stale' => AiEntryReferenceState.stale,
        'unknown' => AiEntryReferenceState.unknown,
        'held' => AiEntryReferenceState.held,
        _ => AiEntryReferenceState.current,
      },
    );

AiEntrySnapshot snapshot({
  AiEntryState state = AiEntryState.ready,
  bool offline = false,
  bool absent = false,
  String request = 'request-A',
  String revision = 'r1',
  String bikeRevision = 'r1',
  String? badDimension,
  String defect = '',
  bool stop = false,
  String? missingStop,
  bool long = false,
}) {
  final s = absent ? null : scope(revision: bikeRevision);
  final label = long
      ? 'Örnek motosiklet · kullanıcı beyanı — uzun model ve donanım adıyla kayıtlı, ek tanımlayıcı metni bulunan yerel motosiklet bağlamı; bu ad kimlik veya uygunluk doğrulaması değildir.'
      : 'Örnek motosiklet · kullanıcı beyanı';
  AiEntrySnapshot build({
    AiEntryReference? context,
    AiEntryReference? status,
    Map<AiEntryPath, AiEntryReference> routes = const {},
  }) => AiEntrySnapshot(
    localSubject: 'entry-A',
    requestId: request,
    documentId: 'example-A',
    documentRevision: revision,
    state: state,
    offline: offline,
    scope: s,
    motorcycleLabel: absent ? null : label,
    reason: stop && missingStop != 'reason'
        ? 'Örnek: güncel güvenlik değerlendirmesi bekliyor; işe başlama koşulları doğrulanmadı.'
        : null,
    consequence: stop && missingStop != 'consequence'
        ? 'Normal akış açılmaz.'
        : null,
    immediateAction: stop && missingStop != 'action'
        ? 'İşleme başlama; destek yolunu kullan.'
        : null,
    reentry: stop && missingStop != 'reentry'
        ? 'Güncel değerlendirme ile yeniden dene.'
        : null,
    contextReference: context,
    statusReference: status,
    routes: routes,
  );
  final seed = build();
  if (absent) return seed;
  AiEntryReference? dimension(String key, String purpose) =>
      badDimension == key && defect == 'missing'
      ? null
      : ref(seed, purpose, defect: badDimension == key ? defect : '');
  return build(
    context: dimension('context', 'ai-entry:context'),
    status: dimension('status', 'ai-entry:status'),
    routes: {
      for (final p in AiEntryPath.values)
        if (!(badDimension == p.name && defect == 'missing'))
          p: dimension(p.name, 'ai-entry:${p.target}')!,
    },
  );
}

Map<String, AiEntrySnapshot> cases() => {
  'ready': snapshot(),
  'knownTask-requested': snapshot(),
  'symptom-requested': snapshot(),
  'garage-requested': snapshot(),
  'support-requested': snapshot(state: AiEntryState.held),
  'no-handler': snapshot(),
  for (final state in AiEntryState.values)
    if (state != AiEntryState.ready) state.name: snapshot(state: state),
  'absent-context': snapshot(absent: true),
  'offline': snapshot(offline: true),
  'stale-context': snapshot(badDimension: 'context', defect: 'stale'),
  'missing-task-route': snapshot(badDimension: 'knownTask', defect: 'missing'),
  'unknown-symptom-route': snapshot(badDimension: 'symptom', defect: 'unknown'),
  'safety-explained': snapshot(state: AiEntryState.safetyHold, stop: true),
  'safety-unverified': snapshot(
    state: AiEntryState.safetyHold,
    stop: true,
    badDimension: 'status',
    defect: 'unconfirmed',
  ),
  'safety-incomplete': snapshot(
    state: AiEntryState.safetyHold,
    stop: true,
    missingStop: 'action',
  ),
  'long-context': snapshot(long: true),
};

Widget host(
  AiEntrySnapshot s, {
  ValueChanged<AiEntryIntent>? handler,
  double width = 390,
  double scale = 1,
  String? font,
  bool shell = false,
}) {
  final page = AiEntryView(snapshot: s, onIntent: handler);
  return Directionality(
    textDirection: TextDirection.ltr,
    child: MediaQuery(
      data: MediaQueryData(
        size: Size(width, 844),
        textScaler: TextScaler.linear(scale),
      ),
      child: DefaultTextStyle(
        style: TextStyle(fontFamily: font),
        child: RepaintBoundary(
          key: const ValueKey('ai-entry-capture'),
          child: shell
              ? KavrivaShell(
                  pages: {
                    for (final section in KavrivaSection.values)
                      section: section == KavrivaSection.assistance
                          ? page
                          : const SizedBox(),
                  },
                  selectedSection: KavrivaSection.assistance,
                  showNavigation: true,
                  onSectionRequested: (_) {},
                )
              : page,
        ),
      ),
    ),
  );
}

Future<void> pumpSized(
  WidgetTester t,
  AiEntrySnapshot s, {
  double width = 390,
  double scale = 1,
  String? font,
  ValueChanged<AiEntryIntent>? handler,
  bool shell = false,
}) async {
  t.view.devicePixelRatio = 1;
  t.view.physicalSize = Size(width, 844);
  addTearDown(t.view.resetPhysicalSize);
  addTearDown(t.view.resetDevicePixelRatio);
  await t.pumpWidget(
    host(
      s,
      handler: handler,
      width: width,
      scale: scale,
      font: font,
      shell: shell,
    ),
  );
  await t.pumpAndSettle();
}

Future<void> press(WidgetTester t, String label) async {
  final f = find.text(label);
  await t.ensureVisible(f);
  await t.pumpAndSettle();
  await t.tap(f);
  await t.pumpAndSettle();
}

Future<void> prepare(WidgetTester t, String name) async {
  final label = switch (name) {
    'knownTask-requested' => AiEntryPath.knownTask.label,
    'symptom-requested' => AiEntryPath.symptom.label,
    'garage-requested' => 'Bağlamı Garaj’da yönet',
    'support-requested' => 'Destek yoluna git',
    _ => null,
  };
  if (label != null) await press(t, label);
}

VoidCallback callback(WidgetTester t, String label) => t
    .widget<GestureDetector>(
      find
          .ancestor(
            of: find.text(label),
            matching: find.byType(GestureDetector),
          )
          .first,
    )
    .onTap!;

void main() {
  WidgetController.hitTestWarningShouldBeFatal = true;
  test('giriş ve kaynak zorunlu alanlarında boş değer geçerli sayılmaz', () {
    for (final i in [0, 1, 2, 3]) {
      final v = ['local', 'request', 'document', 'r1']..[i] = ' \t';
      expect(
        () => AiEntrySnapshot(
          localSubject: v[0],
          requestId: v[1],
          documentId: v[2],
          documentRevision: v[3],
          state: AiEntryState.ready,
          offline: false,
        ),
        throwsArgumentError,
      );
    }
    final seed = snapshot();
    for (final i in List.generate(7, (i) => i)) {
      final v = [
        'request',
        'subject',
        'purpose',
        'source',
        'version',
        'date',
        'reason',
      ]..[i] = ' \t';
      expect(
        () => AiEntryReference(
          scope: seed.scope!,
          requestId: v[0],
          subjectId: v[1],
          purpose: v[2],
          source: v[3],
          version: v[4],
          checkedAt: v[5],
          reason: v[6],
          state: AiEntryReferenceState.current,
          confirmed: true,
        ),
        throwsArgumentError,
      );
    }
  });
  test('kimlikler kayıpsız; boş bağlam alanları reddedilir', () {
    final a = scope(), b = scope(revision: ' r1\n');
    expect(a.identity, isNot(b.identity));
    expect(b.motorcycleRevision, ' r1\n');
    for (final i in [0, 1, 2, 3]) {
      final v = ['local', 'r1', 'bike', 'r1']..[i] = ' \t';
      expect(
        () => AiEntryScope(
          localId: v[0],
          localRevision: v[1],
          motorcycleId: v[2],
          motorcycleRevision: v[3],
        ),
        throwsArgumentError,
      );
    }
    expect(snapshot(revision: ' r1').subjectId, isNot(snapshot().subjectId));
    expect(
      snapshot(bikeRevision: 'other').subjectId,
      isNot(snapshot().subjectId),
    );
  });
  test(
    'iki yolu açan kontrol geçerli; her yanlış kaynak boyutu ayrı kapanır',
    () {
      final valid = snapshot();
      expect(valid.contextReadable, isTrue);
      for (final p in AiEntryPath.values) {
        expect(valid.canRequest(p), isTrue);
      }
      for (final dimension in ['context', 'knownTask', 'symptom']) {
        for (final defect in [
          'missing',
          'scope',
          'request',
          'subject',
          'purpose',
          'stale',
          'unknown',
          'held',
          'unconfirmed',
        ]) {
          final bad = snapshot(badDimension: dimension, defect: defect);
          for (final p in AiEntryPath.values) {
            expect(
              bad.canRequest(p),
              isFalse,
              reason: '$dimension/$defect/${p.name}',
            );
          }
        }
      }
    },
  );
  test(
    'tüm bekleme durumları, eksik bağlam ve çevrimdışı iki yolu kapatır',
    () {
      for (final s in [
        snapshot(offline: true),
        snapshot(absent: true),
        for (final state in AiEntryState.values)
          if (state != AiEntryState.ready) snapshot(state: state),
      ]) {
        for (final p in AiEntryPath.values) {
          expect(s.canRequest(p), isFalse);
        }
      }
      expect(snapshot(offline: true).contextReadable, isFalse);
      expect(snapshot(offline: true).statusReadable, isFalse);
    },
  );
  test('durma açıklaması dört alanı ve aynı güncel durumu gerektirir', () {
    expect(snapshot(stop: true).completeStop, isTrue);
    for (final key in ['reason', 'consequence', 'action', 'reentry']) {
      expect(snapshot(stop: true, missingStop: key).completeStop, isFalse);
    }
    for (final defect in [
      'missing',
      'scope',
      'request',
      'subject',
      'purpose',
      'stale',
      'unknown',
      'held',
      'unconfirmed',
    ]) {
      expect(
        snapshot(
          stop: true,
          badDimension: 'status',
          defect: defect,
        ).completeStop,
        isFalse,
        reason: defect,
      );
    }
  });
  test('kaynak haritası dış değişiklikten etkilenmez', () {
    final s = snapshot(),
        routes = Map<AiEntryPath, AiEntryReference>.of(snapshot().routes);
    final copy = AiEntrySnapshot(
      localSubject: s.localSubject,
      requestId: s.requestId,
      documentId: s.documentId,
      documentRevision: s.documentRevision,
      state: s.state,
      offline: false,
      scope: s.scope,
      motorcycleLabel: s.motorcycleLabel,
      contextReference: s.contextReference,
      routes: routes,
    );
    routes.clear();
    expect(copy.canRequest(AiEntryPath.knownTask), isTrue);
    expect(() => copy.routes.clear(), throwsUnsupportedError);
  });
  for (final path in AiEntryPath.values) {
    testWidgets(
      '${path.name}: yalnız doğru hedefe niyet, gerçekleşmiş iş değil',
      (t) async {
        final events = <AiEntryIntent>[];
        await pumpSized(t, snapshot(), handler: events.add);
        await press(t, path.label);
        final e = events.single;
        expect(e.target, path.target);
        expect(e.scope!.identity, scope().identity);
        expect(e.subjectId, snapshot().subjectId);
        expect(e.requestId, 'request-A');
        expect(
          find.textContaining('Sonraki akış henüz açılmış sayılmaz'),
          findsOneWidget,
        );
        await press(t, path.label);
        await press(t, AiEntryPath.values.firstWhere((p) => p != path).label);
        expect(events, hasLength(1));
      },
    );
  }
  testWidgets('kök yalnız soru ve iki yol; açıklama üçüncü eşit yol değildir', (
    t,
  ) async {
    await pumpSized(t, snapshot(), handler: (_) {});
    expect(find.text('Nasıl yardımcı olayım?'), findsOneWidget);
    for (final p in AiEntryPath.values) {
      expect(find.text(p.label), findsOneWidget);
    }
    expect(find.byType(EditableText), findsNothing);
    expect(find.textContaining('Yapacağın işi biliyorsan'), findsNothing);
    await press(t, 'Hangisini seçmeliyim?');
    expect(
      find.textContaining('Rehber kapsamı ve uygunluk ekranında'),
      findsOneWidget,
    );
    expect(find.textContaining('Hazırlık ekranında hazırlık'), findsOneWidget);
    expect(find.textContaining('sonuç belirsiz kalabilir'), findsOneWidget);
    expect(
      find.textContaining('Hesap veya profil zorunlu değildir'),
      findsOneWidget,
    );
    await press(t, 'Açıklamayı kapat');
    expect(find.textContaining('Yapacağın işi biliyorsan'), findsNothing);
  });
  testWidgets(
    'eksik kaynak kullanıcıya doğrulanmış motosiklet veya etkin yol göstermez',
    (t) async {
      final events = <AiEntryIntent>[];
      await pumpSized(
        t,
        snapshot(badDimension: 'context', defect: 'missing'),
        handler: events.add,
      );
      expect(find.textContaining('Örnek motosiklet'), findsNothing);
      expect(find.text('Giriş şu anda açılamıyor'), findsOneWidget);
      for (final p in AiEntryPath.values) {
        await press(t, p.label);
      }
      expect(events, isEmpty);
    },
  );
  testWidgets('her hatalı giriş kaynağı gerçek iki düğmeyi ayrı kapatır', (
    t,
  ) async {
    final events = <AiEntryIntent>[];
    for (final dimension in ['context', 'knownTask', 'symptom']) {
      for (final defect in [
        'missing',
        'scope',
        'request',
        'subject',
        'purpose',
        'stale',
        'unknown',
        'held',
        'unconfirmed',
      ]) {
        await t.pumpWidget(const SizedBox());
        await pumpSized(
          t,
          snapshot(badDimension: dimension, defect: defect),
          handler: events.add,
        );
        for (final p in AiEntryPath.values) {
          await press(t, p.label);
        }
        expect(events, isEmpty, reason: '$dimension/$defect');
        expect(find.text('Giriş şu anda açılamıyor'), findsOneWidget);
      }
    }
  });
  testWidgets('Garaj ve destek eski iç kimlikleri dışa taşımaz', (t) async {
    final events = <AiEntryIntent>[];
    await pumpSized(t, snapshot(state: AiEntryState.held), handler: events.add);
    await press(t, 'Bağlamı Garaj’da yönet');
    await press(t, 'Destek yoluna git');
    expect(events.map((e) => e.kind), [
      AiEntryIntentKind.garage,
      AiEntryIntentKind.support,
    ]);
    for (final e in events) {
      expect(e.localSubject, isEmpty);
      expect(e.requestId, isEmpty);
      expect(e.subjectId, isEmpty);
      expect(e.scope, isNull);
      expect(e.target, isNull);
    }
  });
  testWidgets(
    'bağlı alıcı yoksa tüm dış yollar kapanır; yerel açıklama çalışır',
    (t) async {
      await pumpSized(t, snapshot(state: AiEntryState.held));
      expect(
        find.textContaining('Garaj ve destek geçişleri de burada kapalı'),
        findsOneWidget,
      );
      for (final label in [
        'Garaj geçişi burada kapalı',
        'Destek geçişi burada kapalı',
        ...AiEntryPath.values.map((p) => p.label),
      ]) {
        final g = t.widget<GestureDetector>(
          find
              .ancestor(
                of: find.text(label),
                matching: find.byType(GestureDetector),
              )
              .first,
        );
        expect(g.onTap, isNull, reason: label);
      }
      await press(t, 'Hangisini seçmeliyim?');
      expect(
        find.textContaining('Seçim isteği uygulama izni değildir'),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'doğrulanmış güvenlik duruşunda sebep, sonuç, eylem ve dönüş görünür',
    (t) async {
      await pumpSized(
        t,
        snapshot(state: AiEntryState.safetyHold, stop: true),
        handler: (_) {},
      );
      expect(find.text('Güvenlik nedeniyle duruldu'), findsOneWidget);
      for (final prefix in ['Sebep:', 'Sonucu:', 'Şimdi:', 'Yeniden giriş:']) {
        expect(find.textContaining(prefix), findsOneWidget);
      }
    },
  );
  testWidgets('doğrulanmamış güvenlik iddiası sebep olarak sunulmaz', (
    t,
  ) async {
    await pumpSized(
      t,
      snapshot(
        state: AiEntryState.safetyHold,
        stop: true,
        badDimension: 'status',
        defect: 'subject',
      ),
      handler: (_) {},
    );
    expect(find.text('Güvenlik nedeniyle duruldu'), findsNothing);
    expect(
      find.textContaining('işe başlama koşulları doğrulanmadı'),
      findsNothing,
    );
    expect(find.textContaining('güncel kaynakla yeniden dene'), findsOneWidget);
  });
  testWidgets(
    'ayrı bekleme ve hata metni yalnız güncel durum kaynağından okunur',
    (t) async {
      final labels = {
        AiEntryState.loading: 'Giriş bilgisi kontrol ediliyor',
        AiEntryState.held: 'Giriş değerlendirmesi bekletiliyor',
        AiEntryState.failed: 'Giriş bilgisi alınamadı',
        AiEntryState.unknown: 'Giriş durumu doğrulanmadı',
        AiEntryState.safetyHold: 'Güvenlik açıklaması henüz tamamlanmadı',
      };
      for (final entry in labels.entries) {
        await t.pumpWidget(const SizedBox());
        await pumpSized(t, snapshot(state: entry.key), handler: (_) {});
        expect(find.text(entry.value), findsOneWidget);
        for (final defect in [
          'missing',
          'scope',
          'request',
          'subject',
          'purpose',
          'stale',
          'unknown',
          'held',
          'unconfirmed',
        ]) {
          await pumpSized(
            t,
            snapshot(state: entry.key, badDimension: 'status', defect: defect),
            handler: (_) {},
          );
          expect(
            find.text(entry.value),
            findsNothing,
            reason: '${entry.key}/$defect',
          );
          expect(find.text('Giriş şu anda açılamıyor'), findsOneWidget);
        }
      }
    },
  );
  for (final change in [
    'document',
    'bike',
    'request',
    'offline',
    'status',
    'route',
    'handler',
  ]) {
    testWidgets('eski callback $change değişimini ödünç alamaz', (t) async {
      final events = <AiEntryIntent>[], other = <AiEntryIntent>[];
      final handler = events.add;
      await pumpSized(t, snapshot(), handler: handler);
      final oldTask = callback(t, AiEntryPath.knownTask.label);
      final oldGarage = callback(t, 'Bağlamı Garaj’da yönet');
      final next = switch (change) {
        'document' => snapshot(revision: 'r2'),
        'bike' => snapshot(bikeRevision: 'r2'),
        'request' => snapshot(request: 'request-B'),
        'offline' => snapshot(offline: true),
        'status' => snapshot(badDimension: 'status', defect: 'held'),
        'route' => snapshot(badDimension: 'knownTask', defect: 'held'),
        _ => snapshot(),
      };
      await pumpSized(
        t,
        next,
        handler: change == 'handler' ? other.add : handler,
      );
      oldTask();
      oldGarage();
      await t.pump();
      expect(events, isEmpty);
      expect(other, isEmpty);
    });
  }
  testWidgets(
    'aynı istekte belge değişimi yeniden göndermez; yeni isteğe izin verir',
    (t) async {
      final events = <AiEntryIntent>[], handler = <AiEntryIntent>[];
      final send = events.add;
      await pumpSized(t, snapshot(), handler: send);
      await press(t, AiEntryPath.knownTask.label);
      await pumpSized(t, snapshot(revision: 'r2'), handler: send);
      await press(t, AiEntryPath.symptom.label);
      expect(events, hasLength(1));
      expect(find.textContaining('Seçim isteği gönderildi'), findsNothing);
      await pumpSized(t, snapshot(request: 'request-B'), handler: handler.add);
      await press(t, AiEntryPath.symptom.label);
      expect(handler.single.requestId, 'request-B');
    },
  );
  testWidgets('gerçek Tab Enter Space ve seçili AI Usta kabuğu', (t) async {
    final events = <AiEntryIntent>[];
    await t.pumpWidget(
      WidgetsApp(
        color: const Color(0xFFFFFFFF),
        onGenerateRoute: (_) => PageRouteBuilder<void>(
          pageBuilder: (_, __, ___) =>
              AiEntryView(snapshot: snapshot(), onIntent: events.add),
        ),
      ),
    );
    await t.pumpAndSettle();
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pumpAndSettle();
    final focused = t.widgetList<DecoratedBox>(find.byType(DecoratedBox)).where(
      (w) {
        final d = w.decoration;
        return d is BoxDecoration &&
            d.border is Border &&
            (d.border! as Border).top.width == 2 &&
            (d.border! as Border).top.color == const Color(0xFF0E5BD8);
      },
    );
    expect(focused, hasLength(1));
    await t.sendKeyEvent(LogicalKeyboardKey.enter);
    await t.pumpAndSettle();
    expect(events.single.kind, AiEntryIntentKind.garage);
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pumpAndSettle();
    await t.sendKeyEvent(LogicalKeyboardKey.space);
    await t.pumpAndSettle();
    expect(events.last.kind, AiEntryIntentKind.knownTask);
    await pumpSized(t, snapshot(), handler: (_) {}, shell: true);
    for (final s in KavrivaSection.values) {
      expect(find.text(s.label), findsWidgets);
    }
    final selected = t
        .widgetList<Semantics>(find.byType(Semantics))
        .where((w) => w.properties.selected == true)
        .toList();
    expect(selected, hasLength(1));
    expect(selected.single.properties.label, 'AI Usta');
  });
  testWidgets('başlık, kapalı düğme, canlı sonuç ve gerçek metin kontrastı', (
    t,
  ) async {
    final semantics = t.ensureSemantics();
    await pumpSized(t, snapshot(), handler: (_) {});
    expect(
      t
          .widgetList<Semantics>(find.byType(Semantics))
          .where((s) => s.properties.header == true),
      hasLength(2),
    );
    double contrast(Color a, Color b) {
      final x = a.computeLuminance(), y = b.computeLuminance();
      return ((x > y ? x : y) + .05) / ((x > y ? y : x) + .05);
    }

    for (final text in t.widgetList<Text>(find.byType(Text))) {
      final c = text.style?.color ?? const Color(0xFF101827);
      expect(contrast(c, const Color(0xFFF8FAFC)), greaterThanOrEqualTo(4.5));
    }
    expect(
      contrast(const Color(0xFF0E5BD8), const Color(0xFFFFFFFF)),
      greaterThanOrEqualTo(3),
    );
    await press(t, AiEntryPath.knownTask.label);
    for (final text in t.widgetList<Text>(find.byType(Text))) {
      final c = text.style?.color ?? const Color(0xFF101827);
      expect(contrast(c, const Color(0xFFF8FAFC)), greaterThanOrEqualTo(4.5));
    }
    expect(
      t
          .widgetList<Semantics>(find.byType(Semantics))
          .any((s) => s.properties.liveRegion == true),
      isTrue,
    );
    final disabled = t
        .widgetList<Semantics>(find.byType(Semantics))
        .where(
          (s) => s.properties.button == true && s.properties.enabled == false,
        );
    expect(disabled, hasLength(2));
    semantics.dispose();
  });
  testWidgets(
    'tüm durumlar 3 genişlik ve 3 ölçekle tam kaydırılır; gerçek son hedef erişilir',
    (t) async {
      for (final entry in cases().entries) {
        for (final width in [320.0, 390.0, 768.0]) {
          for (final scale in [1.0, 2.0, 3.0]) {
            await t.pumpWidget(const SizedBox());
            await pumpSized(
              t,
              entry.value,
              width: width,
              scale: scale,
              handler: entry.key == 'no-handler' ? null : (_) {},
              shell: true,
            );
            await prepare(t, entry.key);
            await press(t, 'Hangisini seçmeliyim?');
            final pos = t
                .state<ScrollableState>(find.byType(Scrollable).first)
                .position;
            for (
              double offset = 0;
              offset < pos.maxScrollExtent;
              offset += 500
            ) {
              pos.jumpTo(offset.clamp(0, pos.maxScrollExtent));
              await t.pumpAndSettle();
              expect(
                t.takeException(),
                isNull,
                reason: '${entry.key}/$width/$scale/$offset',
              );
            }
            pos.jumpTo(pos.maxScrollExtent);
            await t.pumpAndSettle();
            await press(t, 'Açıklamayı kapat');
            for (final g in t.widgetList<GestureDetector>(
              find.byType(GestureDetector),
            )) {
              expect(
                t.getSize(find.byWidget(g)).height,
                greaterThanOrEqualTo(52),
              );
            }
            expect(
              t.takeException(),
              isNull,
              reason: '${entry.key}/$width/$scale',
            );
          }
        }
      }
    },
  );
  final preview = Platform.environment['KAVRIVA_AI_ENTRY_PREVIEW'];
  if (preview != null)
    testWidgets('doğal Flutter tam kaydırma görselleri', (t) async {
      final font = Platform.environment['KAVRIVA_AI_ENTRY_FONT'];
      if (font == null) throw StateError('Sabit font yolu gerekli.');
      await t.runAsync(() async {
        final bytes = await File(font).readAsBytes();
        final loader = FontLoader('KavrivaAiEntryNative')
          ..addFont(Future.value(ByteData.sublistView(bytes)));
        await loader.load();
      });
      final rows = <String>[];
      for (final entry in cases().entries) {
        for (final mode in ['root', 'help']) {
          await t.pumpWidget(const SizedBox());
          await pumpSized(
            t,
            entry.value,
            handler: entry.key == 'no-handler' ? null : (_) {},
            font: 'KavrivaAiEntryNative',
            shell: true,
          );
          await prepare(t, entry.key);
          if (mode == 'help') await press(t, 'Hangisini seçmeliyim?');
          final pos = t
              .state<ScrollableState>(find.byType(Scrollable).first)
              .position;
          final end = pos.maxScrollExtent;
          var index = 0;
          for (double offset = 0; ; offset = (offset + 600).clamp(0, end)) {
            pos.jumpTo(offset);
            await t.pumpAndSettle();
            final boundary = t.renderObject<RenderRepaintBoundary>(
              find.byKey(const ValueKey('ai-entry-capture')),
            );
            final path = '$preview-${entry.key}-$mode-$index.png';
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
            rows.add('${entry.key}\t$mode\t$path\t$offset\t$end\t$index');
            index++;
            if (offset >= end) break;
          }
          expect(t.takeException(), isNull, reason: entry.key);
        }
      }
      await t.runAsync(
        () => File('$preview-manifest.txt').writeAsString(rows.join('\n')),
      );
    });
}
