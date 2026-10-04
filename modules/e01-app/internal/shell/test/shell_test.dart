import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/kavriva_shell.dart';

void main() {
  test('eksik görünüm sessizce boş bir bölüme dönüşmez', () {
    expect(
      () => KavrivaShell(
        pages: {KavrivaSection.garage: const Text('test')},
        selectedSection: KavrivaSection.garage,
        showNavigation: true,
        onSectionRequested: null,
      ),
      throwsArgumentError,
    );
  });

  testWidgets('beş Türkçe etiket sırayla gelir; ilk sekmeyi çağıran seçer', (
    tester,
  ) async {
    await tester.pumpWidget(_app(initial: KavrivaSection.history));
    final texts = tester.widgetList<Text>(find.byType(Text)).map((t) => t.data);
    expect(texts.where((t) => KavrivaSection.values.any((s) => s.label == t)), [
      'Garaj',
      'Bakım',
      'AI Usta',
      'Geçmiş',
      'Topluluk',
    ]);
    final node = tester.getSemantics(find.bySemanticsLabel('Geçmiş'));
    expect(node.flagsCollection.isSelected == ui.Tristate.isTrue, isTrue);
    expect(node.flagsCollection.isButton, isTrue);
    expect(
      tester
              .getSemantics(find.bySemanticsLabel('Garaj'))
              .flagsCollection
              .isSelected ==
          ui.Tristate.isTrue,
      isFalse,
    );
    expect(find.text('Hesap aç'), findsNothing);
  });

  testWidgets('istek bir seçim kararı değildir; çağıran onaylamadan değişmez', (
    tester,
  ) async {
    KavrivaSection? requested;
    await tester.pumpWidget(
      _app(
        initial: KavrivaSection.history,
        acceptRequests: false,
        onRequested: (section) => requested = section,
      ),
    );
    await tester.tap(find.text('Bakım'));
    await tester.pump();
    expect(requested, KavrivaSection.maintenance);
    expect(
      tester.widget<KavrivaShell>(find.byType(KavrivaShell)).selectedSection,
      KavrivaSection.history,
    );
  });

  testWidgets('sekmeden çıkıp dönmek yerel editör state kaybı yaratmaz', (
    tester,
  ) async {
    await tester.pumpWidget(_app());
    await tester.enterText(find.byType(EditableText), 'Yerel taslak — test');
    await tester.tap(find.text('Topluluk'));
    await tester.pump();
    await tester.tap(find.text('Garaj'));
    await tester.pump();
    expect(
      tester.widget<EditableText>(find.byType(EditableText)).controller.text,
      'Yerel taslak — test',
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('gizli sayfa semantics ve klavye odağına sızmaz', (tester) async {
    final hiddenFocus = FocusNode(debugLabel: 'gizli-test-odak');
    addTearDown(hiddenFocus.dispose);
    await tester.pumpWidget(_app(hiddenFocus: hiddenFocus));
    hiddenFocus.requestFocus();
    await tester.pump();
    expect(hiddenFocus.hasFocus, isFalse);
    final trees = <String>[];
    void visit(PipelineOwner owner) {
      final root = owner.semanticsOwner?.rootSemanticsNode;
      if (root != null) trees.add(root.toStringDeep());
      owner.visitChildren(visit);
    }

    visit(tester.binding.rootPipelineOwner);
    expect(trees, isNotEmpty);
    expect(trees.join().contains('Gizli test içeriği'), isFalse);
  });

  testWidgets('klavye Tab ve Enter ile bölüm isteği gönderir', (tester) async {
    KavrivaSection? requested;
    await tester.pumpWidget(
      _app(
        initial: KavrivaSection.history,
        onRequested: (section) => requested = section,
      ),
    );
    expect(await _tabTo(tester, 'Garaj'), isTrue);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(requested, KavrivaSection.garage);
    expect(await _tabTo(tester, 'Bakım'), isTrue);
    await tester.sendKeyEvent(LogicalKeyboardKey.space);
    await tester.pump();
    expect(requested, KavrivaSection.maintenance);
  });

  testWidgets('çağıran gezinmeyi açmadığında kabuk kendiliğinden açmaz', (
    tester,
  ) async {
    await tester.pumpWidget(_app(showNavigation: false));
    for (final section in KavrivaSection.values) {
      expect(find.text(section.label), findsNothing);
    }
    expect(find.byType(EditableText), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('devre dışı istek tıklama veya klavye ile etkinleşmez', (
    tester,
  ) async {
    await tester.pumpWidget(_app(requestsEnabled: false));
    await tester.tap(find.text('Bakım'));
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(
      tester.widget<KavrivaShell>(find.byType(KavrivaShell)).selectedSection,
      KavrivaSection.garage,
    );
  });

  testWidgets(
    'dar ve geniş ekranda büyüyen metin kesilmez; dokunma alanı korunur',
    (tester) async {
      for (final width in [320.0, 390.0, 768.0]) {
        for (final scale in [1.0, 2.0, 3.0]) {
          tester.view.physicalSize = Size(width, 900);
          tester.view.devicePixelRatio = 1;
          await tester.pumpWidget(
            _app(initial: KavrivaSection.history, textScale: scale),
          );
          await tester.pump();
          expect(
            tester.takeException(),
            isNull,
            reason: 'genişlik=$width ölçek=$scale',
          );
          for (final section in KavrivaSection.values) {
            final text = tester.widget<Text>(find.text(section.label));
            expect(text.maxLines, isNull);
            final target = find.ancestor(
              of: find.text(section.label),
              matching: find.byType(GestureDetector),
            );
            expect(tester.getSize(target).height, greaterThanOrEqualTo(48));
            expect(tester.getSize(target).width, greaterThanOrEqualTo(48));
          }
        }
      }
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
    },
  );

  test('sunum yazısı ve seçili yüzey kontrastı yeterli', () {
    const ink = Color(0xFF101827);
    for (final background in [
      const Color(0xFFFFFFFF),
      const Color(0xFFEAF0FF),
    ]) {
      final ratio =
          (background.computeLuminance() + 0.05) /
          (ink.computeLuminance() + 0.05);
      expect(ratio, greaterThanOrEqualTo(4.5));
    }
  });

  if (Platform.environment.containsKey('KAVRIVA_SHELL_PREVIEW')) {
    testWidgets('yerel test görünümünü PNG olarak üretir', (tester) async {
      final path = Platform.environment['KAVRIVA_SHELL_PREVIEW'];
      final fontPath = Platform.environment['KAVRIVA_SHELL_FONT'];
      if (fontPath == null) throw StateError('Test font kaynağı gerekli.');
      await tester.runAsync(() async {
        final font = FontLoader('KavrivaTestFont')
          ..addFont(
            File(fontPath).readAsBytes().then((b) => b.buffer.asByteData()),
          );
        await font.load();
      });
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final capture = GlobalKey();
      await tester.pumpWidget(
        RepaintBoundary(
          key: capture,
          child: _app(initial: KavrivaSection.maintenance),
        ),
      );
      await tester.pump();
      final boundary =
          capture.currentContext!.findRenderObject()! as RenderRepaintBoundary;
      await tester.runAsync(() async {
        final image = await boundary.toImage();
        try {
          final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
          if (bytes == null) throw StateError('PNG verisi üretilemedi.');
          await File(path!).writeAsBytes(bytes.buffer.asUint8List());
        } finally {
          image.dispose();
        }
      });
    }, timeout: const Timeout(Duration(seconds: 30)));
  }
}

Future<bool> _tabTo(WidgetTester tester, String label) async {
  // Sayfadaki odaklanabilir öğeler sekmelerden önce gelebilir; doğal sıra korunur.
  for (var i = 0; i < 12; i++) {
    if (tester
            .getSemantics(find.bySemanticsLabel(label))
            .flagsCollection
            .isFocused ==
        ui.Tristate.isTrue)
      return true;
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
  }
  return false;
}

Widget _app({
  KavrivaSection initial = KavrivaSection.garage,
  bool acceptRequests = true,
  bool showNavigation = true,
  bool requestsEnabled = true,
  double textScale = 1,
  ValueChanged<KavrivaSection>? onRequested,
  FocusNode? hiddenFocus,
}) => WidgetsApp(
  color: const Color(0xFFF8FAFC),
  debugShowCheckedModeBanner: false,
  onGenerateRoute: (settings) => PageRouteBuilder<void>(
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) => MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: TextScaler.linear(textScale)),
      child: DefaultTextStyle(
        style: const TextStyle(fontFamily: 'KavrivaTestFont'),
        child: _Harness(
          key: ValueKey((
            initial,
            acceptRequests,
            showNavigation,
            requestsEnabled,
            textScale,
          )),
          initial: initial,
          acceptRequests: acceptRequests,
          showNavigation: showNavigation,
          requestsEnabled: requestsEnabled,
          onRequested: onRequested,
          hiddenFocus: hiddenFocus,
        ),
      ),
    ),
  ),
);

// Fixture sunumları; gerçek motor, bakım, kimlik veya güvenlik kanıtı içermez.
class _Harness extends StatefulWidget {
  const _Harness({
    super.key,
    required this.initial,
    required this.acceptRequests,
    required this.showNavigation,
    required this.requestsEnabled,
    this.onRequested,
    this.hiddenFocus,
  });
  final KavrivaSection initial;
  final bool acceptRequests;
  final bool showNavigation;
  final bool requestsEnabled;
  final ValueChanged<KavrivaSection>? onRequested;
  final FocusNode? hiddenFocus;

  @override
  State<_Harness> createState() => _HarnessState();
}

class _HarnessState extends State<_Harness> {
  late KavrivaSection selected = widget.initial;
  @override
  Widget build(BuildContext context) => KavrivaShell(
    selectedSection: selected,
    showNavigation: widget.showNavigation,
    onSectionRequested: !widget.requestsEnabled
        ? null
        : (section) {
            widget.onRequested?.call(section);
            if (widget.acceptRequests) setState(() => selected = section);
          },
    pages: {
      KavrivaSection.garage: const _Editor(),
      for (final section in KavrivaSection.values.where(
        (s) => s != KavrivaSection.garage,
      ))
        section: SingleChildScrollView(
          child: Focus(
            canRequestFocus:
                section == KavrivaSection.community &&
                widget.hiddenFocus != null,
            focusNode: section == KavrivaSection.community
                ? widget.hiddenFocus
                : null,
            child: Semantics(
              label: section == KavrivaSection.community
                  ? 'Gizli test içeriği'
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  '${section.label} içeriği\n\nKabuk test girdisi; gerçek kayıt yok.',
                ),
              ),
            ),
          ),
        ),
    },
  );
}

class _Editor extends StatefulWidget {
  const _Editor();
  @override
  State<_Editor> createState() => _EditorState();
}

class _EditorState extends State<_Editor> {
  final controller = TextEditingController();
  final focus = FocusNode();
  @override
  void dispose() {
    controller.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: EditableText(
        controller: controller,
        focusNode: focus,
        style: const TextStyle(fontSize: 16, color: Color(0xFF101827)),
        cursorColor: const Color(0xFF0E5BD8),
        backgroundCursorColor: const Color(0xFFD7DEE8),
      ),
    ),
  );
}
