import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/garage_context.dart';
import 'package:kavriva_shell/kavriva_shell.dart';

GarageMotorcycle _bike(
  String id,
  String name, {
  bool notices = false,
  GarageActivity activity = GarageActivity.active,
}) => GarageMotorcycle(
  id: id,
  name: name,
  activity: activity,
  variantDescription: null,
  criticalCorrection: notices
      ? GarageNotice(motorcycleId: id, description: '$name güvenlik bilgisi')
      : null,
  interruptedWork: notices
      ? GarageNotice(motorcycleId: id, description: '$name yarım iş bilgisi')
      : null,
);

GarageSnapshot _snapshot({
  String? selected = 'a',
  GarageInformation information = GarageInformation.available,
}) => GarageSnapshot(
  motorcycles: [
    _bike(
      'a',
      'Deneme motosikleti A',
      notices: true,
      activity: GarageActivity.inactive,
    ),
    _bike('b', 'Deneme motosikleti B'),
  ],
  selectedId: selected,
  information: information,
);

Widget _app(Widget child, {double scale = 1, String? fontFamily}) =>
    _FixtureInput(
      content: child,
      scale: scale,
      fontFamily: fontFamily,
      child: WidgetsApp(
        color: const Color(0xFFFFFFFF),
        onGenerateRoute: (_) => PageRouteBuilder<void>(
          pageBuilder: (_, _, _) => const _FixtureScene(),
        ),
      ),
    );

class _FixtureInput extends InheritedWidget {
  const _FixtureInput({
    required this.content,
    required this.scale,
    required this.fontFamily,
    required super.child,
  });
  final Widget content;
  final double scale;
  final String? fontFamily;
  @override
  bool updateShouldNotify(_FixtureInput old) =>
      content != old.content ||
      scale != old.scale ||
      fontFamily != old.fontFamily;
}

class _FixtureScene extends StatelessWidget {
  const _FixtureScene();
  @override
  Widget build(BuildContext context) {
    final input = context.dependOnInheritedWidgetOfExactType<_FixtureInput>()!;
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: TextScaler.linear(input.scale)),
      child: ColoredBox(
        color: const Color(0xFFF8FAFC),
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 16,
            color: const Color(0xFF101827),
            fontFamily: input.fontFamily,
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: input.content,
          ),
        ),
      ),
    );
  }
}

Widget _view(
  GarageSnapshot snapshot, {
  ValueChanged<String>? selection,
  ValueChanged<String>? lifecycle,
  ValueChanged<String>? history,
  ValueChanged<String>? critical,
  ValueChanged<String>? work,
}) => GarageContextView(
  snapshot: snapshot,
  onSelectionRequested: selection,
  onLifecycleRequested: lifecycle,
  onHistoryRequested: history,
  onCriticalCorrectionRequested: critical,
  onInterruptedWorkRequested: work,
);

Future<void> _show(WidgetTester tester, Finder target) async {
  await tester.ensureVisible(target);
  await tester.pumpAndSettle();
}

void main() {
  test('boş, çift, kayıp ve başka motosiklete bağlı girdiler reddedilir', () {
    expect(() => _bike('', 'Ad'), throwsArgumentError);
    expect(() => _bike('a', ''), throwsArgumentError);
    expect(
      () => GarageNotice(motorcycleId: 'a', description: ''),
      throwsArgumentError,
    );
    expect(
      () => GarageMotorcycle(
        id: 'a',
        name: 'A',
        activity: GarageActivity.active,
        variantDescription: null,
        criticalCorrection: GarageNotice(motorcycleId: 'b', description: 'B'),
      ),
      throwsArgumentError,
    );
    expect(
      () => GarageSnapshot(
        motorcycles: [_bike('a', 'A'), _bike('a', 'B')],
        selectedId: 'a',
        information: GarageInformation.available,
      ),
      throwsArgumentError,
    );
    expect(
      () => GarageSnapshot(
        motorcycles: [_bike('a', 'A')],
        selectedId: 'b',
        information: GarageInformation.available,
      ),
      throwsArgumentError,
    );
    expect(
      () => _snapshot(information: GarageInformation.unavailable),
      throwsArgumentError,
    );
  });

  test('çağıranın listesi değişse de snapshot ve seçim sessizce değişmez', () {
    final bikes = [_bike('a', 'A')];
    final snapshot = GarageSnapshot(
      motorcycles: bikes,
      selectedId: 'a',
      information: GarageInformation.available,
    );
    bikes.clear();
    expect(snapshot.selected!.id, 'a');
    expect(() => snapshot.motorcycles.clear(), throwsUnsupportedError);
  });

  testWidgets('seçim isteği kendiliğinden seçili motosikleti değiştirmez', (
    tester,
  ) async {
    final requests = <String>[];
    await tester.pumpWidget(_app(_view(_snapshot(), selection: requests.add)));
    final target = find.byKey(const ValueKey('select:b'));
    await _show(tester, target);
    await tester.tap(target);
    await tester.pumpAndSettle();
    expect(requests, ['b']);
    expect(
      find.text('Seçili motosiklet: Deneme motosikleti A'),
      findsOneWidget,
    );
    expect(find.text('Seçili motosiklet: Deneme motosikleti B'), findsNothing);
  });

  testWidgets(
    'parent değiştirince eski güvenlik ve yarım iş diğer motosiklete taşınmaz',
    (tester) async {
      final history = <String>[];
      await tester.pumpWidget(_app(_view(_snapshot(), history: history.add)));
      expect(
        find.text('Deneme motosikleti A güvenlik bilgisi'),
        findsOneWidget,
      );
      await tester.pumpWidget(
        _app(_view(_snapshot(selected: 'b'), history: history.add)),
      );
      expect(
        find.text('Seçili motosiklet: Deneme motosikleti B'),
        findsOneWidget,
      );
      expect(find.text('Deneme motosikleti A güvenlik bilgisi'), findsNothing);
      expect(find.text('Deneme motosikleti A yarım iş bilgisi'), findsNothing);
      final target = find.text('Bu motosikletin geçmişini aç');
      await _show(tester, target);
      await tester.tap(target);
      expect(history, ['b']);
    },
  );

  testWidgets(
    'inaktif motosikletin geçmiş, güvenlik, yarım iş ve yönetim girişleri korunur',
    (tester) async {
      final events = <String>[];
      await tester.pumpWidget(
        _app(
          _view(
            _snapshot(),
            history: (id) => events.add('history:$id'),
            critical: (id) => events.add('critical:$id'),
            work: (id) => events.add('work:$id'),
            lifecycle: (id) => events.add('lifecycle:$id'),
          ),
        ),
      );
      for (final label in [
        'Güvenlik bilgisini aç',
        'Çalışmanın durumunu kontrol et',
        'Motosikleti yönet',
        'Bu motosikletin geçmişini aç',
      ]) {
        final target = find.text(label);
        await _show(tester, target);
        expect(
          tester
              .getSemantics(target)
              .getSemanticsData()
              .flagsCollection
              .isEnabled,
          ui.Tristate.isTrue,
        );
        await tester.tap(target);
        await tester.pump();
      }
      expect(events, ['critical:a', 'work:a', 'lifecycle:a', 'history:a']);
      expect(
        find.text(
          'Kaydedilmiş ilerleme fiziksel durumun doğrulandığı anlamına gelmez.',
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'kritik bilgi yönetimden önce görünür ve sadece renkle anlatılmaz',
    (tester) async {
      await tester.pumpWidget(_app(_view(_snapshot())));
      final warning = find.text('Önemli güvenlik düzeltmesi');
      expect(warning, findsOneWidget);
      expect(
        tester.getTopLeft(warning).dy,
        lessThan(tester.getTopLeft(find.text('Motosikleti yönet')).dy),
      );
      expect(
        find.text('Deneme motosikleti A güvenlik bilgisi'),
        findsOneWidget,
      );
      expect(
        find.text(
          'Güvenlik bilgisi şu anda açılamıyor. Uyarıyı göz ardı etmeyin.',
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'cache ve bilinmeyen varyant güncel yetki veya uygunluk sayılmaz',
    (tester) async {
      await tester.pumpWidget(
        _app(_view(_snapshot(information: GarageInformation.cached))),
      );
      expect(
        find.text(
          'Son alınan bilgi gösteriliyor. Güncel durum ayrıca kontrol edilmelidir.',
        ),
        findsOneWidget,
      );
      expect(find.text('Varyant bilgisi henüz net değil.'), findsOneWidget);
      expect(
        find.text('Uygulama uygunluğu ayrıca kontrol edilir.'),
        findsOneWidget,
      );
      expect(find.text('Uygulamaya başla'), findsNothing);
    },
  );

  testWidgets(
    'boş veya erişilemeyen bağlam hesap istemez ve motosiklet uydurmaz',
    (tester) async {
      for (final information in [
        GarageInformation.available,
        GarageInformation.unavailable,
      ]) {
        await tester.pumpWidget(
          _app(
            _view(
              GarageSnapshot(
                motorcycles: [],
                selectedId: null,
                information: information,
              ),
            ),
          ),
        );
        expect(
          find.text(
            information == GarageInformation.available
                ? 'Henüz motosiklet bilgisi yok.'
                : 'Motosiklet bilgisi şu anda alınamıyor.',
          ),
          findsOneWidget,
        );
        expect(find.textContaining('Seçili motosiklet:'), findsNothing);
        expect(find.text('Hesap oluştur'), findsNothing);
      }
    },
  );

  testWidgets('ilk motosiklet varsayılmaz, seçim açık çağıran girdisidir', (
    tester,
  ) async {
    await tester.pumpWidget(_app(_view(_snapshot(selected: null))));
    expect(
      find.text('Görüntülemek istediğin motosikleti seç.'),
      findsOneWidget,
    );
    expect(find.textContaining('Seçili motosiklet:'), findsNothing);
  });

  testWidgets('klavye isteği yalnız doğru motosiklet kimliğini taşır', (
    tester,
  ) async {
    final requests = <String>[];
    await tester.pumpWidget(_app(_view(_snapshot(), selection: requests.add)));
    final target = find.byKey(const ValueKey('select:b'));
    await _show(tester, target);
    for (var i = 0; i < 15; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      if (tester
              .getSemantics(target)
              .getSemanticsData()
              .flagsCollection
              .isFocused ==
          ui.Tristate.isTrue)
        break;
    }
    expect(
      tester.getSemantics(target).getSemanticsData().flagsCollection.isFocused,
      ui.Tristate.isTrue,
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(requests, ['b']);
  });

  testWidgets(
    'dar ekran ve büyük metinde bütün bağlam okunabilir, kontrol kesilmez',
    (tester) async {
      for (final width in [320.0, 390.0, 768.0]) {
        for (final scale in [1.0, 2.0, 3.0]) {
          await tester.binding.setSurfaceSize(Size(width, 844));
          await tester.pumpWidget(_app(_view(_snapshot()), scale: scale));
          await tester.pump();
          expect(tester.takeException(), isNull, reason: '$width/$scale');
          final target = find.byKey(const ValueKey('select:b'));
          await _show(tester, target);
          expect(tester.getSize(target).height, greaterThanOrEqualTo(48));
          expect(
            tester.takeException(),
            isNull,
            reason: '$width/$scale scroll',
          );
        }
      }
      await tester.binding.setSurfaceSize(null);
    },
  );

  testWidgets(
    'gerçek shell içinde sekme değişimi seçili motosiklet bağlamını değiştirmez',
    (tester) async {
      Widget shell(KavrivaSection section) => KavrivaShell(
        selectedSection: section,
        showNavigation: true,
        onSectionRequested: (_) {},
        pages: {
          KavrivaSection.garage: _view(_snapshot()),
          for (final s in KavrivaSection.values.where(
            (s) => s != KavrivaSection.garage,
          ))
            s: Text('Deneme bölüm: ${s.label}'),
        },
      );
      await tester.pumpWidget(_app(shell(KavrivaSection.garage)));
      await tester.pumpWidget(_app(shell(KavrivaSection.history)));
      expect(
        tester
            .getSemantics(find.bySemanticsLabel('Geçmiş'))
            .flagsCollection
            .isSelected,
        ui.Tristate.isTrue,
      );
      await tester.pumpWidget(_app(shell(KavrivaSection.garage)));
      expect(
        find.text('Seçili motosiklet: Deneme motosikleti A'),
        findsOneWidget,
      );
      expect(
        find.text('Deneme motosikleti A güvenlik bilgisi'),
        findsOneWidget,
      );
    },
  );

  final preview = Platform.environment['KAVRIVA_GARAGE_PREVIEW'];
  if (preview != null) {
    testWidgets('yalnız yerel fixture görseli', (tester) async {
      final font = Platform.environment['KAVRIVA_GARAGE_FONT']!;
      final loader = FontLoader('GaragePreview');
      loader.addFont(
        Future.value(ByteData.sublistView(File(font).readAsBytesSync())),
      );
      await tester.runAsync(loader.load);
      await tester.binding.setSurfaceSize(const Size(390, 844));
      final key = GlobalKey();
      await tester.pumpWidget(
        _app(
          RepaintBoundary(
            key: key,
            child: KavrivaShell(
              selectedSection: KavrivaSection.garage,
              showNavigation: true,
              onSectionRequested: (_) {},
              pages: {
                KavrivaSection.garage: _view(
                  _snapshot(selected: 'b'),
                  selection: (_) {},
                  lifecycle: (_) {},
                  history: (_) {},
                ),
                for (final section in KavrivaSection.values.where(
                  (s) => s != KavrivaSection.garage,
                ))
                  section: Text('Deneme bölüm: ${section.label}'),
              },
            ),
          ),
          fontFamily: 'GaragePreview',
        ),
      );
      await tester.pumpAndSettle();
      await tester.runAsync(() async {
        final boundary =
            key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
        final image = await boundary.toImage();
        final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
        await File(preview).writeAsBytes(bytes!.buffer.asUint8List());
        image.dispose();
      });
      await tester.binding.setSurfaceSize(null);
    }, timeout: const Timeout(Duration(seconds: 30)));
  }
}
