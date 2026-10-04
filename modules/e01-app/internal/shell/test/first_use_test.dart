import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/first_use.dart';
import 'package:kavriva_shell/kavriva_shell.dart';

Widget _app(Widget child, {double scale = 1, String? font}) => _Input(
  content: child,
  scale: scale,
  font: font,
  child: WidgetsApp(
    color: const Color(0xFFFFFFFF),
    onGenerateRoute: (_) =>
        PageRouteBuilder<void>(pageBuilder: (_, _, _) => const _Scene()),
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
    final input = context.dependOnInheritedWidgetOfExactType<_Input>()!;
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: TextScaler.linear(input.scale)),
      child: ColoredBox(
        color: const Color(0xFFF8FAFC),
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 16,
            color: const Color(0xFF101827),
            fontFamily: input.font,
          ),
          child: input.content,
        ),
      ),
    );
  }
}

Widget _form({
  ValueChanged<MotorcycleDraft>? submit,
  bool busy = false,
  String? error,
  VoidCallback? back,
}) => AddMotorcycleForm(
  onCreationRequested: submit,
  onBackRequested: back,
  busy: busy,
  errorMessage: error,
);
Future<void> _tap(WidgetTester tester, String label) async {
  final target = find.bySemanticsLabel(label);
  await tester.ensureVisible(target);
  await tester.pumpAndSettle();
  await tester.tap(target);
  await tester.pump();
}

Future<void> _enter(WidgetTester tester, String label, String value) async {
  final target = find.byKey(ValueKey(label));
  await tester.ensureVisible(target);
  await tester.pumpAndSettle();
  await tester.enterText(target, value);
  await tester.pump();
}

void main() {
  test(
    'taslak boş temel bilgiyi ve geçersiz yılı reddeder, belirsizliği korur',
    () {
      expect(
        () => MotorcycleDraft(brand: ' ', model: 'M', year: null),
        throwsArgumentError,
      );
      expect(
        () => MotorcycleDraft(brand: 'B', model: ' ', year: 2020),
        throwsArgumentError,
      );
      expect(
        () => MotorcycleDraft(brand: 'B', model: 'M', year: 0),
        throwsArgumentError,
      );
      final draft = MotorcycleDraft(brand: ' B ', model: ' M ', year: null);
      expect(draft.brand, 'B');
      expect(draft.model, 'M');
      expect(draft.year, isNull);
    },
  );
  testWidgets('üç niyet hesap veya izin istemeden doğru istek gönderir', (
    tester,
  ) async {
    final requests = <FirstUseIntent>[];
    await tester.pumpWidget(
      _app(FirstValueEntry(onIntentRequested: requests.add)),
    );
    for (final intent in FirstUseIntent.values) {
      final target = find.byKey(ValueKey(intent));
      await tester.ensureVisible(target);
      await tester.pumpAndSettle();
      await tester.tap(target);
      await tester.pump();
    }
    expect(requests, FirstUseIntent.values);
    expect(
      find.text('İlk seçenekleri görmek için hesap açman gerekmez.'),
      findsOneWidget,
    );
    expect(find.text('Hesap oluştur'), findsNothing);
    expect(find.text('Bildirim izni ver'), findsNothing);
    expect(find.byType(AddMotorcycleForm), findsNothing);
  });
  testWidgets('bağlı olmayan niyet hesabı çözüm diye dayatmaz', (tester) async {
    await tester.pumpWidget(
      _app(const FirstValueEntry(onIntentRequested: null)),
    );
    expect(
      find.text('Seçenekler şu anda açılamıyor. Hesap açman istenmiyor.'),
      findsOneWidget,
    );
    expect(
      tester
          .getSemantics(find.bySemanticsLabel('Yapmak istediğim işi biliyorum'))
          .flagsCollection
          .isEnabled,
      ui.Tristate.isFalse,
    );
  });
  testWidgets('geçerli form yalnız kullanıcı beyanı isteği gönderir', (
    tester,
  ) async {
    final drafts = <MotorcycleDraft>[];
    await tester.pumpWidget(_app(_form(submit: drafts.add)));
    await _enter(tester, 'Marka', ' Deneme marka ');
    await _enter(tester, 'Model', ' Deneme model ');
    await _enter(tester, 'Yıl', '2020');
    await _tap(tester, 'Devam');
    expect(drafts.length, 1);
    expect(drafts.single.brand, 'Deneme marka');
    expect(drafts.single.model, 'Deneme model');
    expect(drafts.single.year, 2020);
    expect(find.text('Motosikletini ekle'), findsOneWidget);
    expect(
      find.textContaining('teknik varyantı veya rehber uygunluğunu doğrulamaz'),
      findsOneWidget,
    );
    expect(find.text('Motosiklet eklendi'), findsNothing);
  });
  testWidgets(
    'boş veya karışık yıl gönderilmez, kesin tarih aralığı uydurulmaz',
    (tester) async {
      final drafts = <MotorcycleDraft>[];
      await tester.pumpWidget(_app(_form(submit: drafts.add)));
      await _tap(tester, 'Devam');
      expect(drafts, isEmpty);
      expect(find.text('Marka ve modeli yaz.'), findsOneWidget);
      await _enter(tester, 'Marka', 'A');
      await _enter(tester, 'Model', 'B');
      for (final invalid in ['', '0', '-1', '2020x', '20.2']) {
        await _enter(tester, 'Yıl', invalid);
        await _tap(tester, 'Devam');
        expect(drafts, isEmpty);
        expect(
          find.text('Yılı sayıyla yaz veya bilmiyorum seçeneğini seç.'),
          findsOneWidget,
        );
      }
    },
  );
  testWidgets('bilinmeyen yıl seçeneği eski yıl yazısını kanıt yapmaz', (
    tester,
  ) async {
    final drafts = <MotorcycleDraft>[];
    await tester.pumpWidget(_app(_form(submit: drafts.add)));
    await _enter(tester, 'Marka', 'A');
    await _enter(tester, 'Model', 'B');
    await _enter(tester, 'Yıl', '2020');
    await _tap(tester, 'Yılı bilmiyorum');
    await _tap(tester, 'Devam');
    expect(drafts.single.year, isNull);
    expect(
      find.text('Yıl bilinmiyor; bu belirsizlik korunacak.'),
      findsOneWidget,
    );
    await _tap(tester, 'Yılı bilmiyorum');
    await _tap(tester, 'Devam');
    expect(drafts.last.year, 2020);
  });
  testWidgets('parent hata ve busy taslağı korur, tekrar göndermez', (
    tester,
  ) async {
    final drafts = <MotorcycleDraft>[];
    await tester.pumpWidget(_app(_form(submit: drafts.add)));
    await _enter(tester, 'Marka', 'A');
    await _enter(tester, 'Model', 'B');
    await _enter(tester, 'Yıl', '2020');
    await _tap(tester, 'Devam');
    await tester.pumpWidget(_app(_form(submit: drafts.add, busy: true)));
    expect(
      tester
          .widget<EditableText>(find.byKey(const ValueKey('Marka')))
          .controller
          .text,
      'A',
    );
    await _tap(tester, 'Devam');
    expect(drafts.length, 1);
    await tester.pumpWidget(
      _app(
        _form(submit: drafts.add, error: 'İstek kaydedilemedi; tekrar dene.'),
      ),
    );
    expect(find.text('İstek kaydedilemedi; tekrar dene.'), findsOneWidget);
    expect(
      tester
          .widget<EditableText>(find.byKey(const ValueKey('Model')))
          .controller
          .text,
      'B',
    );
    await _tap(tester, 'Devam');
    expect(drafts.length, 2);
  });
  testWidgets('geri yalnız callback ve bağlı olmayan yaratma açıkça kapalı', (
    tester,
  ) async {
    var backs = 0;
    await tester.pumpWidget(_app(_form(back: () => backs++)));
    await _enter(tester, 'Marka', 'A');
    await _tap(tester, 'Geri');
    expect(backs, 1);
    expect(
      tester
          .widget<EditableText>(find.byKey(const ValueKey('Marka')))
          .controller
          .text,
      'A',
    );
    expect(
      find.textContaining('Motosiklet ekleme şu anda kullanılamıyor.'),
      findsOneWidget,
    );
    expect(
      tester
          .getSemantics(find.bySemanticsLabel('Devam'))
          .flagsCollection
          .isEnabled,
      ui.Tristate.isFalse,
    );
  });
  testWidgets('klavye niyet seçer; yıl done aynı doğrulamayı uygular', (
    tester,
  ) async {
    final requests = <FirstUseIntent>[];
    await tester.pumpWidget(
      _app(FirstValueEntry(onIntentRequested: requests.add)),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(requests, [FirstUseIntent.knownTask]);
    final drafts = <MotorcycleDraft>[];
    await tester.pumpWidget(_app(_form(submit: drafts.add)));
    await _enter(tester, 'Marka', 'A');
    await _enter(tester, 'Model', 'B');
    await _enter(tester, 'Yıl', '2020');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    expect(drafts.single.year, 2020);
  });
  testWidgets('ilk kullanım ve form büyük yazıyla kayar, alanlar en az48', (
    tester,
  ) async {
    for (final width in [320.0, 390.0, 768.0]) {
      for (final scale in [1.0, 2.0, 3.0]) {
        await tester.binding.setSurfaceSize(Size(width, 844));
        for (final page in [
          const FirstValueEntry(onIntentRequested: null),
          _form(),
        ]) {
          await tester.pumpWidget(_app(page, scale: scale));
          await tester.pump();
          expect(tester.takeException(), isNull, reason: '$width/$scale');
          final target = page is FirstValueEntry
              ? find.byKey(const ValueKey(FirstUseIntent.record))
              : find.bySemanticsLabel('Devam');
          await tester.ensureVisible(target);
          await tester.pumpAndSettle();
          expect(tester.getSize(target).height, greaterThanOrEqualTo(48));
          expect(tester.takeException(), isNull);
        }
      }
    }
    await tester.binding.setSurfaceSize(null);
  });
  testWidgets('form alanı ve kontrol boyası gerçek zemin üzerinde okunur', (
    tester,
  ) async {
    await tester.pumpWidget(_app(_form(submit: (_) {})));
    final containers = tester
        .widgetList<Container>(find.byType(Container))
        .where((w) => w.decoration is BoxDecoration)
        .toList();
    expect(containers.length, 6);
    for (final container in containers) {
      final finder = find.byWidget(container);
      final element = tester.element(finder);
      Color? background;
      element.visitAncestorElements((a) {
        if (a.widget case ColoredBox(:final color)) {
          background = color;
          return false;
        }
        return true;
      });
      expect(background, isNotNull);
      final border = (container.decoration! as BoxDecoration).border! as Border;
      final light = background!.computeLuminance();
      final dark = border.top.color.computeLuminance();
      expect((light + .05) / (dark + .05), greaterThanOrEqualTo(3));
      final ink = DefaultTextStyle.of(element).style.color!.computeLuminance();
      expect((light + .05) / (ink + .05), greaterThanOrEqualTo(4.5));
    }
  });
  final preview = Platform.environment['KAVRIVA_FIRSTUSE_PREVIEW'];
  if (preview != null) {
    testWidgets('yalnız yerel ilk kullanım ve form görselleri', (tester) async {
      final loader = FontLoader('FirstUsePreview');
      loader.addFont(
        Future.value(
          ByteData.sublistView(
            File(Platform.environment['KAVRIVA_FIRSTUSE_FONT']!)
                .readAsBytesSync(),
          ),
        ),
      );
      await tester.runAsync(loader.load);
      await tester.binding.setSurfaceSize(const Size(390, 844));
      for (final page in [
        ('entry', FirstValueEntry(onIntentRequested: (_) {})),
        ('form', _form(submit: (_) {}, back: () {})),
      ]) {
        final key = GlobalKey();
        await tester.pumpWidget(
          _app(
            RepaintBoundary(
              key: key,
              child: KavrivaShell(
                selectedSection: KavrivaSection.garage,
                showNavigation: false,
                onSectionRequested: null,
                pages: {
                  KavrivaSection.garage: page.$2,
                  for (final s in KavrivaSection.values.where(
                    (s) => s != KavrivaSection.garage,
                  ))
                    s: const SizedBox.shrink(),
                },
              ),
            ),
            font: 'FirstUsePreview',
          ),
        );
        await tester.pumpAndSettle();
        await tester.runAsync(() async {
          final image =
              await (key.currentContext!.findRenderObject()!
                      as RenderRepaintBoundary)
                  .toImage();
          final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
          await File('$preview-${page.$1}.png')
              .writeAsBytes(bytes!.buffer.asUint8List());
          image.dispose();
        });
      }
      await tester.binding.setSurfaceSize(null);
    }, timeout: const Timeout(Duration(seconds: 30)));
  }
}
