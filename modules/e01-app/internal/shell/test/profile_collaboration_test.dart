import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/profile_collaboration.dart';

// Açık sunum örnekleri; üretim hesabı veya taşıma kanıtı değildir.
String identity(String value) =>
    '${value.codeUnits.length}:${value.codeUnits.map((x) => x.toRadixString(16).padLeft(4, '0')).join()}';
ProfileScope scope({String account = 'account-A', String local = 'local-A'}) =>
    ProfileScope(
      local: ProfileLocalScope(id: local, revision: 'r1'),
      accountId: account,
      accountRevision: 'r1',
      motorcycleId: 'bike-A',
      contextRevision: 'r1',
    );
ProfileDocument document(
  ProfileScreen screen, {
  ProfileState state = ProfileState.ready,
  String revision = 'r1',
}) => ProfileDocument(
  id: 'example-document',
  revision: revision,
  screen: screen,
  state: state,
  targetId: switch (screen) {
    ProfileScreen.intro => null,
    ProfileScreen.migration => 'account-A',
    ProfileScreen.collaboration => 'person-A',
  },
  values: {
    'context': 'Özel örnek motosiklet A',
    'source': 'Örnek test kaynağı',
    'checkedAt': '2026-10-07',
    'owner': 'Özel sahip A',
    'person': 'Özel yardımcı A',
    'role': 'Yardımcı',
    'access': 'Yalnız bakım kayıtları',
    'attribution': 'Özel katkı A · 2026-10-06',
    'privateScope': 'Özel hesap bilgileri paylaşılmaz',
  },
  entries: [
    ProfileEntry(
      id: 'entry-A',
      label: screen == ProfileScreen.migration
          ? 'Yerel kayıt · yağ bakımı'
          : 'Özel kayıt A',
      source: screen == ProfileScreen.migration
          ? 'Yerel cihaz · kullanıcı beyanı'
          : 'Kullanıcı beyanı',
      date: '2026-10-06',
      detail: screen == ProfileScreen.migration
          ? 'Kilometre: 12.400. Bu kayıt yerel kaynaktan geliyor.'
          : 'Özel kayıt ayrıntısı A',
    ),
    if (screen == ProfileScreen.migration)
      ProfileEntry(
        id: 'entry-B',
        label: 'Profil kaydı · yağ bakımı',
        source: 'Profil · kullanıcı beyanı',
        date: '2026-10-05',
        detail: 'Kilometre: 12.000. Tarih ve kilometre yerel kayıtla farklı; iki kaynak ayrı gösterilir.',
      ),
  ],
);
ProfileReference reference(
  ProfileScope s,
  String request,
  String purpose,
  String subject, {
  bool current = true,
  ProfileReferenceState state = ProfileReferenceState.confirmed,
}) => ProfileReference(
  scope: s,
  requestId: request,
  purpose: purpose,
  subjectId: subject,
  source: 'Örnek dış kaynak',
  version: 'r1',
  checkedAt: '2026-10-07',
  reason: 'Sunum testi',
  current: current,
  state: state,
);
ProfileSnapshot snapshot(
  ProfileScreen screen, {
  ProfileDocument? doc,
  ProfileScope? target,
  String request = 'request-A',
  bool absent = false,
  bool noAuthority = false,
  bool offline = false,
  bool current = true,
  bool outcome = false,
  ProfileReadDimension? missingRead,
  ProfileEffectDimension? missingEffect,
  String? missingField,
  ProfileAction? missingAction,
}) {
  final d = doc ?? document(screen), s = target ?? scope();
  ProfileReference ref(String p, String v) =>
      reference(s, request, p, v, current: current);
  return ProfileSnapshot(
    scope: s,
    requestId: request,
    document: absent ? null : d,
    authority: noAuthority ? null : ref('profile-document', d.subject),
    outcome: outcome
        ? ref('profile-outcome', '${d.subject}/${d.state.name}')
        : null,
    reads: {
      for (final x in ProfileReadDimension.values)
        x: x == missingRead
            ? null
            : ref('profile-read', '${d.subject}/${x.name}'),
    },
    fields: {
      for (final k in d.privateKeys)
        k: k == missingField ? null : ref('profile-field', '${d.subject}/$k'),
    },
    actions: {
      for (final a in ProfileAction.values)
        a: a == missingAction
            ? null
            : ref('profile-action', '${d.subject}/${a.name}'),
    },
    effects: {
      for (final x in ProfileEffectDimension.values)
        x: x == missingEffect
            ? null
            : ref('profile-effect', '${d.subject}/${x.name}'),
    },
    offline: offline,
  );
}

Widget view(
  ProfileScreen screen,
  ProfileSnapshot s, {
  ValueChanged<ProfileIntent>? handler,
}) => Directionality(
  textDirection: TextDirection.ltr,
  child: MediaQuery(
    data: const MediaQueryData(size: Size(390, 844)),
    child: ProfileCollaborationView(
      screen: screen,
      snapshot: s,
      onIntent: handler,
    ),
  ),
);
VoidCallback? press(WidgetTester tester, String label) => tester
    .widget<Semantics>(
      find.byWidgetPredicate(
        (w) => w is Semantics && w.properties.label == label,
      ),
    )
    .properties
    .onTap;

Map<String, ProfileSnapshot> cases() => {
  'intro-requested': snapshot(ProfileScreen.intro),
  'collaboration-expanded': snapshot(ProfileScreen.collaboration),
  for (final screen in ProfileScreen.values) ...{
    '${screen.name}-ready': snapshot(screen),
    '${screen.name}-unknown': snapshot(screen, absent: true),
    '${screen.name}-stale': snapshot(screen, current: false),
    '${screen.name}-offline': snapshot(screen, offline: true),
    '${screen.name}-private-held': snapshot(
      screen,
      missingField: 'value/${identity('context')}',
    ),
  },
  for (final state in [
    ProfileState.conflict,
    ProfileState.partial,
    ProfileState.failed,
    ProfileState.rollback,
    ProfileState.completed,
  ])
    'migration-${state.name}': snapshot(
      ProfileScreen.migration,
      doc: document(ProfileScreen.migration, state: state),
      outcome: true,
    ),
  'collaboration-revoked': snapshot(
    ProfileScreen.collaboration,
    doc: document(ProfileScreen.collaboration, state: ProfileState.revoked),
    outcome: true,
  ),
};
Future<void> pumpSized(
  WidgetTester t,
  ProfileScreen screen,
  ProfileSnapshot s, {
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
            key: const ValueKey('profile-capture'),
            child: ProfileCollaborationView(
              screen: screen,
              snapshot: s,
              onIntent: (_) {},
            ),
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
  final label = name == 'intro-requested'
      ? 'Profil oluştur'
      : name == 'collaboration-expanded'
      ? 'İzin ayrıntılarını gör'
      : null;
  if (label == null) return;
  await t.ensureVisible(find.text(label));
  await t.pumpAndSettle();
  await t.tap(find.text(label));
  await t.pumpAndSettle();
  position(t).jumpTo(0);
  await t.pumpAndSettle();
}

void main() {
  test('Yabancı kapsam istek amaç konu ve HELD referansları okunamaz', () {
    final d = document(ProfileScreen.collaboration), s = scope();
    final good = snapshot(d.screen);
    for (final bad in [
      reference(
        scope(account: 'B'),
        good.requestId,
        'profile-document',
        d.subject,
      ),
      reference(s, 'old-request', 'profile-document', d.subject),
      reference(s, good.requestId, 'ALLOW', d.subject),
      reference(s, good.requestId, 'profile-document', 'different-subject'),
      reference(
        s,
        good.requestId,
        'profile-document',
        d.subject,
        state: ProfileReferenceState.held,
      ),
      reference(
        s,
        good.requestId,
        'profile-document',
        d.subject,
        state: ProfileReferenceState.unknown,
      ),
    ]) {
      final changed = ProfileSnapshot(
        scope: s,
        requestId: good.requestId,
        document: d,
        authority: bad,
        reads: good.reads,
        fields: good.fields,
        actions: good.actions,
        effects: good.effects,
      );
      expect(changed.readableFor(d.screen), isFalse);
      expect(changed.actionAllowed(d.screen, ProfileAction.invite), isFalse);
    }
  });
  test(
    'Profil seçeneği hesapsız sunulabilir; paylaşım ve taşıma hesap ister',
    () {
      final local = ProfileScope(local: scope().local);
      expect(
        snapshot(
          ProfileScreen.intro,
          target: local,
        ).readableFor(ProfileScreen.intro),
        isTrue,
      );
      expect(
        snapshot(
          ProfileScreen.migration,
          target: local,
        ).readableFor(ProfileScreen.migration),
        isFalse,
      );
      expect(
        snapshot(
          ProfileScreen.collaboration,
          target: local,
        ).readableFor(ProfileScreen.collaboration),
        isFalse,
      );
    },
  );
  test('Bozuk Unicode ve veri değişiklikleri birbirinin iznini kullanamaz; koleksiyonlar sabit', () {
    ProfileDocument d(String id) => ProfileDocument(
      id: id,
      revision: 'r',
      screen: ProfileScreen.intro,
      state: ProfileState.ready,
      values: {},
      entries: [],
    );
    expect(d('\ud800').subject, isNot(d('\ufffd').subject));
    final s = snapshot(ProfileScreen.intro);
    expect(() => s.fields.clear(), throwsUnsupportedError);
    expect(() => s.document!.values.clear(), throwsUnsupportedError);
    expect(() => s.document!.entries.clear(), throwsUnsupportedError);
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
          pageBuilder: (_, __, ___) => view(
            ProfileScreen.intro,
            snapshot(ProfileScreen.intro),
            handler: (_) {},
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
  testWidgets(
    'Gerçek klavyeyle istek iletilir; tekrar kapalı ve sonuç doğrulanmamış kalır',
    (t) async {
      final calls = <ProfileIntent>[];
      final semantics = t.ensureSemantics();
      try {
        await t.pumpWidget(
          WidgetsApp(
            color: const Color(0xFFFFFFFF),
            onGenerateRoute: (_) => PageRouteBuilder<void>(
              pageBuilder: (_, __, ___) => view(
                ProfileScreen.intro,
                snapshot(ProfileScreen.intro),
                handler: calls.add,
              ),
            ),
          ),
        );
        expect(
          t
              .widgetList<Semantics>(find.byType(Semantics))
              .where((w) => w.properties.headingLevel == 1),
          hasLength(1),
        );
        await t.pumpAndSettle();
        await t.sendKeyEvent(LogicalKeyboardKey.tab);
        await t.pumpAndSettle();
        await t.sendKeyEvent(LogicalKeyboardKey.enter);
        await t.pumpAndSettle();
        expect(calls.single.action, ProfileAction.createProfile);
        expect(press(t, 'Profil oluştur'), isNull);
        expect(
          t
              .widgetList<Semantics>(find.byType(Semantics))
              .any((w) => w.properties.liveRegion == true),
          isTrue,
        );
        await t.sendKeyEvent(LogicalKeyboardKey.tab);
        await t.sendKeyEvent(LogicalKeyboardKey.space);
        await t.pumpAndSettle();
        expect(calls.last.action, ProfileAction.localContinue);
      } finally {
        semantics.dispose();
      }
    },
  );
  testWidgets(
    'Bütün durumlar küçük geniş ekran ve büyük yazıda kaydırılır; çıkış hedefi kullanılabilir',
    (t) async {
      for (final entry in cases().entries) {
        final screen =
            entry.value.document?.screen ??
            ProfileScreen.values.firstWhere(
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
            final label = switch (screen) {
              ProfileScreen.intro => 'Şimdilik yerel devam et',
              ProfileScreen.migration => 'İptal et · yerel devam et',
              ProfileScreen.collaboration => 'Yerel kullanıma dön',
            };
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
  final preview = Platform.environment['KAVRIVA_PROFILE_PREVIEW'];
  if (preview != null)
    testWidgets(
      'Doğal Flutter çizimi bütün durumları tam kaydırmayla kaydeder',
      (t) async {
        final font = Platform.environment['KAVRIVA_PROFILE_FONT'];
        if (font == null) throw StateError('Sabit SDK font yolu gerekli.');
        await t.runAsync(() async {
          final bytes = await File(font).readAsBytes();
          final loader = FontLoader('KavrivaProfileNative')
            ..addFont(Future.value(ByteData.sublistView(bytes)));
          await loader.load();
        });
        final rows = <String>[];
        for (final entry in cases().entries) {
          await t.pumpWidget(const SizedBox());
          final screen =
              entry.value.document?.screen ??
              ProfileScreen.values.firstWhere(
                (s) => entry.key.startsWith(s.name),
              );
          await pumpSized(t, screen, entry.value, font: 'KavrivaProfileNative');
          await prepare(t, entry.key);
          final pos = position(t), end = pos.maxScrollExtent;
          var index = 0;
          for (double offset = 0; ; offset = (offset + 620).clamp(0, end)) {
            pos.jumpTo(offset);
            await t.pumpAndSettle();
            final boundary = t.renderObject<RenderRepaintBoundary>(
              find.byKey(const ValueKey('profile-capture')),
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
  test('Bağlamın yarım kimlikleri ve tekrarlanan kayıtlar kabul edilmez', () {
    expect(
      () => ProfileScope(local: scope().local, accountId: 'A'),
      throwsArgumentError,
    );
    final d = document(ProfileScreen.intro);
    expect(
      () => ProfileDocument(
        id: 'd',
        revision: 'r',
        screen: d.screen,
        state: d.state,
        values: {'x': '1', ' x ': '2'},
        entries: [],
      ),
      throwsArgumentError,
    );
    expect(
      () => ProfileDocument(
        id: 'd',
        revision: 'r',
        screen: d.screen,
        state: d.state,
        values: {},
        entries: [d.entries.first, d.entries.first],
      ),
      throwsArgumentError,
    );
  });
  test('Belgenin tam içeriği ve hedefi değişince eski izin taşınamaz', () {
    final d = document(ProfileScreen.collaboration);
    ProfileDocument copy({
      String? target,
      Map<String, String>? values,
      List<ProfileEntry>? entries,
    }) => ProfileDocument(
      id: d.id,
      revision: d.revision,
      screen: d.screen,
      state: d.state,
      targetId: target ?? d.targetId,
      values: values ?? d.values,
      entries: entries ?? d.entries,
    );
    expect(
      copy(values: Map.fromEntries(d.values.entries.toList().reversed)).subject,
      d.subject,
    );
    expect(copy(target: 'person-B').subject, isNot(d.subject));
    expect(
      copy(values: {...d.values, 'owner': 'Başka sahip'}).subject,
      isNot(d.subject),
    );
    expect(copy(entries: []).subject, isNot(d.subject));
  });
  for (final screen in ProfileScreen.values) {
    test('$screen eksik veya eski kaynak özel okumayı ve işlemi kapatır', () {
      for (final s in [
        snapshot(screen, absent: true),
        snapshot(screen, noAuthority: true),
        snapshot(screen, current: false),
        for (final dim in ProfileReadDimension.values)
          snapshot(screen, missingRead: dim),
      ]) {
        expect(s.readableFor(screen), isFalse);
        expect(s.allPrivateReadable, isFalse);
        for (final a in ProfileAction.values.where(
          (a) => a != ProfileAction.localContinue && a != ProfileAction.support,
        )) {
          expect(s.actionAllowed(screen, a), isFalse);
        }
        expect(s.actionAllowed(screen, ProfileAction.localContinue), isTrue);
      }
    });
    testWidgets(
      '$screen güncel okuma yokken kişisel veriyi gizler; yerel çıkış açık',
      (tester) async {
        final intents = <ProfileIntent>[];
        await tester.pumpWidget(
          view(
            screen,
            snapshot(screen, noAuthority: true),
            handler: intents.add,
          ),
        );
        expect(find.textContaining('Özel sahip A'), findsNothing);
        expect(find.textContaining('Özel kayıt A'), findsNothing);
        expect(find.textContaining('Özel örnek motosiklet A'), findsNothing);
        final label = switch (screen) {
          ProfileScreen.intro => 'Şimdilik yerel devam et',
          ProfileScreen.migration => 'İptal et · yerel devam et',
          ProfileScreen.collaboration => 'Yerel kullanıma dön',
        };
        press(tester, label)!();
        expect(intents.single.action, ProfileAction.localContinue);
        expect(intents.single.subjectId, isEmpty);
        expect(intents.single.target, isNull);
        expect(intents.single.targetId, isNull);
        expect(tester.takeException(), isNull);
      },
    );
  }
  test('Her yazma isteği altı güncel etki kaynağına bağlıdır', () {
    final cases = {
      ProfileScreen.intro: ProfileAction.createProfile,
      ProfileScreen.migration: ProfileAction.requestTransfer,
      ProfileScreen.collaboration: ProfileAction.invite,
    };
    for (final item in cases.entries) {
      expect(snapshot(item.key).actionAllowed(item.key, item.value), isTrue);
      expect(
        snapshot(item.key, offline: true).actionAllowed(item.key, item.value),
        isFalse,
      );
      expect(
        snapshot(
          item.key,
          missingAction: item.value,
        ).actionAllowed(item.key, item.value),
        isFalse,
      );
      for (final dim in ProfileEffectDimension.values) {
        expect(
          snapshot(
            item.key,
            missingEffect: dim,
          ).actionAllowed(item.key, item.value),
          isFalse,
        );
      }
    }
  });
  test('Çakışma incelemesi yazma yetkisi değildir; çevrimdışı okunabilir', () {
    final s = snapshot(
      ProfileScreen.migration,
      doc: document(ProfileScreen.migration, state: ProfileState.conflict),
      offline: true,
      missingEffect: ProfileEffectDimension.audit,
    );
    expect(
      s.actionAllowed(ProfileScreen.migration, ProfileAction.reviewConflict),
      isTrue,
    );
    expect(
      s.actionAllowed(ProfileScreen.migration, ProfileAction.requestTransfer),
      isFalse,
    );
  });
  test('Tek alanın izni eksikse o alan gizlenir ve yazma isteği kapanır', () {
    final s = snapshot(
      ProfileScreen.collaboration,
      missingField: 'value/${identity('owner')}',
    );
    expect(s.readableFor(ProfileScreen.collaboration), isTrue);
    expect(
      s.fieldAllowed(ProfileScreen.collaboration, 'value/${identity('owner')}'),
      isFalse,
    );
    expect(
      s.fieldAllowed(
        ProfileScreen.collaboration,
        'value/${identity('person')}',
      ),
      isTrue,
    );
    expect(
      s.actionAllowed(ProfileScreen.collaboration, ProfileAction.revoke),
      isFalse,
    );
  });
  testWidgets('Tamamlanma yalnız ayrı güncel sonuçla gösterilir', (
    tester,
  ) async {
    final d = document(ProfileScreen.migration, state: ProfileState.completed);
    await tester.pumpWidget(view(d.screen, snapshot(d.screen, doc: d)));
    expect(find.text('Taşıma tamamlandı'), findsNothing);
    await tester.pumpWidget(
      view(d.screen, snapshot(d.screen, doc: d, outcome: true)),
    );
    expect(find.text('Taşıma tamamlandı'), findsOneWidget);
    expect(press(tester, 'Taşıma için güncel kontrol iste'), isNull);
  });
  testWidgets('Erişim kaldırıldı sonucu istek veya rol adından üretilmez', (
    tester,
  ) async {
    final d = document(
      ProfileScreen.collaboration,
      state: ProfileState.revoked,
    );
    await tester.pumpWidget(view(d.screen, snapshot(d.screen, doc: d)));
    expect(find.text('Gelecekteki erişim kaldırıldı'), findsNothing);
    await tester.pumpWidget(
      view(d.screen, snapshot(d.screen, doc: d, outcome: true)),
    );
    expect(find.text('Gelecekteki erişim kaldırıldı'), findsOneWidget);
    expect(press(tester, 'Erişimi kaldır'), isNull);
  });
  testWidgets('Eski hesap callbacki yeni hesaba işlem gönderemez', (
    tester,
  ) async {
    final intents = <ProfileIntent>[];
    final handler = intents.add;
    await tester.pumpWidget(
      view(
        ProfileScreen.collaboration,
        snapshot(ProfileScreen.collaboration),
        handler: handler,
      ),
    );
    final old = press(tester, 'Erişimi kaldır')!;
    await tester.pumpWidget(
      view(
        ProfileScreen.collaboration,
        snapshot(
          ProfileScreen.collaboration,
          target: scope(account: 'account-B'),
        ),
        handler: handler,
      ),
    );
    old();
    expect(intents, isEmpty);
    press(tester, 'Erişimi kaldır')!();
    expect(intents.single.target!.accountId, 'account-B');
  });
  testWidgets('Aynı istek bir kez gider; belge değişikliği kilidi açmaz', (
    tester,
  ) async {
    final intents = <ProfileIntent>[];
    final handler = intents.add;
    await tester.pumpWidget(
      view(
        ProfileScreen.intro,
        snapshot(ProfileScreen.intro),
        handler: handler,
      ),
    );
    final old = press(tester, 'Profil oluştur')!;
    old();
    old();
    await tester.pump();
    expect(intents, hasLength(1));
    await tester.pumpWidget(
      view(
        ProfileScreen.intro,
        snapshot(
          ProfileScreen.intro,
          doc: document(ProfileScreen.intro, revision: 'r2'),
        ),
        handler: handler,
      ),
    );
    expect(press(tester, 'Profil oluştur'), isNull);
    expect(find.textContaining('İstek iletildi.'), findsNothing);
    await tester.pumpWidget(
      view(
        ProfileScreen.intro,
        snapshot(ProfileScreen.intro, request: 'request-B'),
        handler: handler,
      ),
    );
    press(tester, 'Profil oluştur')!();
    expect(intents, hasLength(2));
  });
  testWidgets(
    'Yerel devam hesap verisi olmadan çalışır; eski yerel bağlamdan çalışmaz',
    (tester) async {
      final intents = <ProfileIntent>[];
      final handler = intents.add;
      await tester.pumpWidget(
        view(
          ProfileScreen.intro,
          snapshot(ProfileScreen.intro),
          handler: handler,
        ),
      );
      final old = press(tester, 'Şimdilik yerel devam et')!;
      await tester.pumpWidget(
        view(
          ProfileScreen.intro,
          snapshot(
            ProfileScreen.intro,
            absent: true,
            offline: true,
            target: scope(account: 'account-B'),
          ),
          handler: handler,
        ),
      );
      old();
      expect(intents.single.target, isNull);
      await tester.pumpWidget(
        view(
          ProfileScreen.intro,
          snapshot(ProfileScreen.intro, target: scope(local: 'local-B')),
          handler: handler,
        ),
      );
      old();
      expect(intents, hasLength(1));
    },
  );
  testWidgets(
    'Ayrıntı ekranı hesap değişiminde kapanır; eski açma callbacki yeni hesabı açmaz',
    (tester) async {
      await tester.pumpWidget(
        view(
          ProfileScreen.collaboration,
          snapshot(ProfileScreen.collaboration),
        ),
      );
      final old = press(tester, 'İzin ayrıntılarını gör')!;
      old();
      await tester.pump();
      expect(find.text('Paylaşım sınırı'), findsOneWidget);
      await tester.pumpWidget(
        view(
          ProfileScreen.collaboration,
          snapshot(
            ProfileScreen.collaboration,
            target: scope(account: 'account-B'),
          ),
        ),
      );
      old();
      await tester.pump();
      expect(find.text('Paylaşım sınırı'), findsNothing);
    },
  );
  testWidgets('Gerçek işlem sağlayıcısı yoksa işlem düğmeleri kapalı kalır', (
    tester,
  ) async {
    await tester.pumpWidget(
      view(ProfileScreen.intro, snapshot(ProfileScreen.intro)),
    );
    expect(press(tester, 'Profil oluştur'), isNull);
    expect(press(tester, 'Şimdilik yerel devam et'), isNull);
  });
}
