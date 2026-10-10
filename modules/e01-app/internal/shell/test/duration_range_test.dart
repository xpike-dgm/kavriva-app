import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/duration_range.dart';
import 'package:kavriva_shell/guide_discovery.dart';
import 'package:kavriva_shell/kavriva_shell.dart';
import 'package:kavriva_shell/variant_resolution.dart';

VariantContext guide({
  String bike = 'bike-a',
  String id = 'guide-a',
  String rev = 'r1',
}) => VariantContext(
  motorcycleId: bike,
  guideId: id,
  contextRevision: rev,
  motorcycleLabel: 'Örnek motosiklet · kullanıcı beyanı',
  guideLabel: 'Örnek bakım konusu',
);
DurationExperience experience({
  String id = 'beginner',
  String rev = 'e1',
  String label = 'Bu işi ilk kez yapıyorum · kullanıcı beyanı',
}) => DurationExperience(id: id, revision: rev, label: label);
DurationRangeSource source({
  VariantContext? context,
  String doc = 'd1',
  DurationExperience? exp,
  bool current = true,
  bool confirmed = true,
  DurationRangeState state = DurationRangeState.ready,
  bool missing = false,
  int lower = 40,
  int upper = 80,
  String date = '2026-10-01',
  String checked = '2026-10-10',
  String name = 'Örnek süre kaynağı',
  String version = 'örnek-r1',
}) => DurationRangeSource(
  context: context ?? guide(),
  documentRevision: doc,
  experience: exp ?? experience(),
  source: name,
  version: version,
  informationDate: date,
  checkedDate: checked,
  current: current,
  confirmed: confirmed,
  state: state,
  range: missing ? null : DurationMinutes(lower: lower, upper: upper),
  illustrative: true,
);
DurationRangePresentation frame({
  VariantContext? context,
  String doc = 'd1',
  DurationExperience? exp,
  bool missingExp = false,
  bool online = true,
  DurationRangeSource? value,
  bool missingSource = false,
}) => DurationRangePresentation(
  context: context ?? guide(),
  documentRevision: doc,
  experience: missingExp ? null : exp ?? experience(),
  online: online,
  source: missingSource ? null : value ?? source(),
);
Widget preview(
  DurationRangePresentation? input, {
  bool current = true,
  bool missingScope = false,
  bool busy = false,
  String? error,
  VariantContext? target,
  ValueChanged<VariantContext>? resolve,
  FitPresentation? fit,
  ValueChanged<VariantContext>? prepare,
}) {
  final context = target ?? guide();
  return GuideScopePreview(
    context: context,
    scope: missingScope
        ? null
        : GuideScope(
            context: context,
            includes: 'Örnek konunun kapsamını tanımak.',
            excludes: 'Fiziksel müdahale adımları değildir.',
            current: current,
          ),
    fit: fit,
    busy: busy,
    errorMessage: error,
    duration: input,
    onPreparationRequested:
        prepare ?? (_) => throw StateError('Tahmin hazırlık izni veremez.'),
    onDistinctionRequested: resolve,
    onTeachingRequested: null,
    onEditRequested: null,
  );
}

Widget app(Widget content, {double scale = 1, String? font}) => _Input(
  content: content,
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
      child: RepaintBoundary(
        key: const ValueKey('range-capture'),
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 16,
            color: const Color(0xFF101827),
            fontFamily: input.font,
          ),
          child: KavrivaShell(
            pages: {
              for (final section in KavrivaSection.values)
                section: section == KavrivaSection.assistance
                    ? input.content
                    : const SizedBox(),
            },
            selectedSection: KavrivaSection.assistance,
            showNavigation: true,
            onSectionRequested: (_) {},
          ),
        ),
      ),
    );
  }
}

Future<void> pump(
  WidgetTester t,
  Widget child, {
  double width = 390,
  double scale = 1,
  String? font,
}) async {
  t.view.physicalSize = Size(width, 844);
  t.view.devicePixelRatio = 1;
  addTearDown(t.view.resetPhysicalSize);
  addTearDown(t.view.resetDevicePixelRatio);
  await t.pumpWidget(app(child, scale: scale, font: font));
  await t.pumpAndSettle();
}

Map<String, Widget> cases() {
  final advanced = experience(
    id: 'familiar',
    label: 'Bu işi daha önce yaptım · kullanıcı beyanı',
  );
  final long = experience(
    label: 'Bu bakım konusu benim için yeni; başka motosikletlerde benzer işler görmüş olsam da bu rehberdeki iş için deneyimim olduğunu söylemiyorum · kullanıcı beyanı',
  );
  return {
    'beginner': preview(frame()),
    'familiar': preview(
      frame(
        exp: advanced,
        value: source(exp: advanced, lower: 20, upper: 45),
      ),
    ),
    'unknown': preview(
      frame(value: source(state: DurationRangeState.unknown, missing: true)),
    ),
    'loading': preview(frame(value: source(state: DurationRangeState.loading))),
    'failed': preview(frame(value: source(state: DurationRangeState.failed))),
    'held': preview(frame(value: source(state: DurationRangeState.held))),
    'missing-source': preview(frame(missingSource: true)),
    'missing-experience': preview(frame(missingExp: true)),
    'stale': preview(frame(value: source(current: false))),
    'unconfirmed': preview(frame(value: source(confirmed: false))),
    'offline': preview(frame(online: false)),
    'wrong-motorcycle': preview(
      frame(
        value: source(context: guide(bike: 'bike-b')),
      ),
    ),
    'new-document': preview(frame(doc: 'd2')),
    'new-experience': preview(frame(exp: advanced)),
    'missing-range': preview(frame(value: source(missing: true))),
    'stale-scope': preview(frame(), current: false),
    'missing-scope': preview(frame(), missingScope: true),
    'long-context': preview(
      frame(
        exp: long,
        value: source(exp: long),
      ),
    ),
    'previous-default': preview(null),
  };
}

void main() {
  WidgetController.hitTestWarningShouldBeFatal = true;
  test(
    'aralık pozitif ve iki sınırdır; sıfır tek sayı veya ters tahmin üretilmez',
    () {
      for (final pair in [(0, 5), (-1, 10), (20, 20), (50, 30)]) {
        expect(
          () => DurationMinutes(lower: pair.$1, upper: pair.$2),
          throwsArgumentError,
        );
      }
      final valid = DurationMinutes(lower: 20, upper: 45);
      expect((valid.lower, valid.upper), (20, 45));
    },
  );
  test('boş kaynak alanları ve gerçek olmayan tarih reddedilir; ham kimlik korunur', () {
    for (final date in [
      '',
      ' ',
      '2026-02-30',
      '2025-02-29',
      '2026-13-01',
      '2026-01-00',
      '0000-01-01',
      '2026-1-1',
      '2026-10-11',
    ]) {
      expect(() => source(date: date), throwsArgumentError, reason: date);
    }
    expect(() => source(date: '2024-02-29'), returnsNormally);
    expect(() => source(name: ' '), throwsArgumentError);
    expect(() => source(version: ''), throwsArgumentError);
    expect(() => source(doc: ''), throwsArgumentError);
    expect(() => source(checked: 'unknown'), throwsArgumentError);
    for (final entry in [
      (id: '', rev: 'r', label: 'l'),
      (id: 'i', rev: '', label: 'l'),
      (id: 'i', rev: 'r', label: ' '),
    ]) {
      expect(
        () => DurationExperience(
          id: entry.id,
          revision: entry.rev,
          label: entry.label,
        ),
        throwsArgumentError,
      );
    }
    final e = experience(id: ' id ', rev: ' rev ');
    expect(e.id, ' id ');
    expect(e.revision, ' rev ');
    expect(e.matches(experience(id: 'id', rev: 'rev')), isFalse);
    expect(() => frame(doc: ' '), throwsArgumentError);
  });
  testWidgets(
    'iki deneyim aynı işte kaynak aralığı ve tarihini aynen gösterir; izin üretmez',
    (t) async {
      final s = t.ensureSemantics();
      await pump(t, cases()['beginner']!);
      expect(find.text('40–80 dakika'), findsOneWidget);
      expect(find.text('Bilgi tarihi: 01.10.2026'), findsOneWidget);
      expect(find.textContaining('ilk kez'), findsOneWidget);
      expect(find.textContaining('Örnek gösterim:'), findsOneWidget);
      expect(find.textContaining('Kesin bitiş sözü değildir'), findsOneWidget);
      expect(
        find.text('Planlama bilgisi · uygulama izni değildir.'),
        findsOneWidget,
      );
      expect(
        t
            .widgetList<Semantics>(find.byType(Semantics))
            .any((x) => x.properties.header == true),
        isTrue,
      );
      expect(
        t
            .widgetList<Semantics>(find.byType(Semantics))
            .any((x) => x.properties.liveRegion == true),
        isTrue,
      );
      await t.pumpWidget(const SizedBox());
      await pump(t, cases()['familiar']!);
      expect(find.text('20–45 dakika'), findsOneWidget);
      expect(find.text('40–80 dakika'), findsNothing);
      expect(find.textContaining('daha önce'), findsOneWidget);
      expect(find.text('Bilgi tarihi: 01.10.2026'), findsOneWidget);
      s.dispose();
    },
  );
  testWidgets(
    'tam bağlam deneyim belge ve güncellik negatifleri modelde ve gerçek sunumda sayıları gizler',
    (t) async {
      final inputs = [
        frame(missingSource: true),
        frame(missingExp: true),
        frame(online: false),
        frame(value: source(current: false)),
        frame(value: source(confirmed: false)),
        frame(context: guide(bike: 'bike-b')),
        frame(
          value: source(context: guide(bike: 'bike-b')),
        ),
        frame(
          value: source(context: guide(id: 'guide-b')),
        ),
        frame(
          value: source(context: guide(rev: 'r2')),
        ),
        frame(doc: 'd2'),
        frame(exp: experience(id: 'other')),
        frame(exp: experience(rev: 'e2')),
        frame(exp: experience(label: 'Diğer beyan')),
        frame(value: source(doc: 'd2')),
      ];
      expect(frame().readableFor(guide(), scopeCurrent: true), isTrue);
      for (final input in inputs) {
        expect(input.readableFor(guide(), scopeCurrent: true), isFalse);
        await t.pumpWidget(const SizedBox());
        await pump(t, preview(input));
        expect(find.text('40–80 dakika'), findsNothing);
        expect(find.textContaining('Süre bilinmiyor.'), findsOneWidget);
        expect(find.textContaining('Bilgi tarihi:'), findsNothing);
        expect(t.takeException(), isNull);
      }
    },
  );
  testWidgets(
    'güncel kapsam eksik eski busy veya hatalıyken iyi süre de bilgi yerine geçmez',
    (t) async {
      for (final content in [
        preview(frame(), current: false),
        preview(frame(), missingScope: true),
        preview(frame(), busy: true),
        preview(frame(), error: 'Örnek kaynak hatası'),
        preview(frame(), target: guide(id: 'other')),
      ]) {
        await t.pumpWidget(const SizedBox());
        await pump(t, content);
        expect(find.text('40–80 dakika'), findsNothing);
        expect(find.textContaining('Süre bilinmiyor.'), findsOneWidget);
        expect(t.takeException(), isNull);
      }
    },
  );
  testWidgets(
    'kaynaklı nonready durumlar ve eksik aralık tahmini veya tamamlanmayı göstermez',
    (t) async {
      for (final state in DurationRangeState.values) {
        await t.pumpWidget(const SizedBox());
        await pump(
          t,
          preview(
            frame(
              value: source(
                state: state,
                missing: state == DurationRangeState.ready,
              ),
            ),
          ),
        );
        expect(find.text('40–80 dakika'), findsNothing);
        expect(find.text('Bilgi tarihi: 01.10.2026'), findsOneWidget);
        if (state == DurationRangeState.loading)
          expect(find.textContaining('yükleniyor'), findsOneWidget);
        if (state == DurationRangeState.failed)
          expect(find.textContaining('alınamadı'), findsOneWidget);
        if (state == DurationRangeState.held)
          expect(find.textContaining('henüz doğrulanmadı'), findsOneWidget);
        expect(find.textContaining('tamamlandı'), findsNothing);
      }
    },
  );
  testWidgets(
    'mevcut çağıran opsiyonel alan olmadan aynı kapsam ve fit yolu kalır',
    (t) async {
      await pump(t, preview(null));
      expect(find.byType(DurationRangeView), findsNothing);
      expect(find.byType(MotorcycleFitView), findsOneWidget);
      expect(find.text('Rehberin kapsamı'), findsOneWidget);
      expect(find.text('Neleri kapsar?'), findsOneWidget);
      expect(find.text('Neleri kapsamaz?'), findsOneWidget);
      expect(t.takeException(), isNull);
    },
  );
  testWidgets(
    'yenilenen belge ve deneyimde eski aralık kaybolur; yeni kaynak geldiğinde ayrı tarih görünür',
    (t) async {
      await pump(t, preview(frame()));
      expect(find.text('40–80 dakika'), findsOneWidget);
      await pump(t, preview(frame(doc: 'd2')));
      expect(find.text('40–80 dakika'), findsNothing);
      final e = experience(
        id: 'other',
        rev: 'e2',
        label: 'Başka deneyim beyanı',
      );
      await pump(
        t,
        preview(
          frame(
            doc: 'd2',
            exp: e,
            value: source(
              doc: 'd2',
              exp: e,
              lower: 55,
              upper: 95,
              date: '2026-10-08',
            ),
          ),
        ),
      );
      expect(find.text('55–95 dakika'), findsOneWidget);
      expect(find.text('Bilgi tarihi: 08.10.2026'), findsOneWidget);
      expect(find.text('40–80 dakika'), findsNothing);
    },
  );
  testWidgets(
    'bütün durumlar 3 genişlik 3 yazı ölçeğiyle tam kaydırılır; 5 sekme ve son metin korunur',
    (t) async {
      for (final entry in cases().entries) {
        for (final width in [320.0, 390.0, 768.0]) {
          for (final scale in [1.0, 2.0, 3.0]) {
            await t.pumpWidget(const SizedBox());
            await pump(t, entry.value, width: width, scale: scale);
            final pos = t
                .state<ScrollableState>(find.byType(Scrollable).first)
                .position;
            for (
              double offset = 0;
              ;
              offset = (offset + 500).clamp(0, pos.maxScrollExtent)
            ) {
              pos.jumpTo(offset);
              await t.pumpAndSettle();
              expect(
                t.takeException(),
                isNull,
                reason: '${entry.key}/$width/$scale/$offset',
              );
              if (offset >= pos.maxScrollExtent) break;
            }
            expect(find.byType(MotorcycleFitView), findsOneWidget);
            for (final section in KavrivaSection.values)
              expect(find.text(section.label), findsOneWidget);
            for (final button in t.widgetList<GestureDetector>(
              find.byType(GestureDetector),
            )) {
              expect(
                t.getSize(find.byWidget(button)).height,
                greaterThanOrEqualTo(52),
              );
            }
            await t.tap(find.text('Topluluk').hitTestable());
            await t.pumpAndSettle();
            expect(t.takeException(), isNull);
          }
        }
      }
    },
  );
  testWidgets(
    'süre güncel ya da bilinmiyor olsa da hazırlık yalnız mevcut fit kanıtından gelir; gerçek klavye ve odak korunur',
    (t) async {
      final semantics = t.ensureSemantics();
      final requests = <VariantContext>[];
      final context = guide();
      final fit = FitPresentation(
        context: context,
        status: FitDisplayStatus.confirmed,
        reason: 'Örnek uyum kanıtı; fiziksel çalışma izni değildir.',
        evidence: FitEvidenceReference(
          context: context,
          source: 'Örnek uygunluk kaynağı',
          version: 'f1',
          location: 'Örnek bölüm',
          checkedAt: '2026-10-10',
          current: true,
        ),
      );
      for (final input in [frame(), frame(missingSource: true)]) {
        await t.pumpWidget(const SizedBox());
        await pump(t, preview(input, fit: fit, prepare: requests.add));
        await t.ensureVisible(find.text('Hazırlığı görüntüle'));
        await t.pumpAndSettle();
        await t.sendKeyEvent(LogicalKeyboardKey.tab);
        await t.pumpAndSettle();
        final focus = t
            .widgetList<Container>(find.byType(Container))
            .where((c) => c.decoration is BoxDecoration)
            .map((c) => (c.decoration! as BoxDecoration).border)
            .whereType<Border>()
            .where((b) => b.top.color == const Color(0xFF0E5BD8));
        expect(focus, isNotEmpty);
        expect(focus.every((b) => b.top.width == 2), isTrue);
        expect(
          (const Color(0xFFF8FAFC).computeLuminance() + 0.05) /
              (const Color(0xFF0E5BD8).computeLuminance() + 0.05),
          greaterThanOrEqualTo(3),
        );
        await t.sendKeyEvent(LogicalKeyboardKey.enter);
        await t.pump();
        await t.sendKeyEvent(LogicalKeyboardKey.space);
        await t.pump();
        expect(requests.last.matches(context), isTrue);
        for (final element in find.byType(Text).evaluate()) {
          final text = element.widget as Text;
          final color =
              text.style?.color ?? DefaultTextStyle.of(element).style.color!;
          expect(
            (const Color(0xFFF8FAFC).computeLuminance() + 0.05) /
                (color.computeLuminance() + 0.05),
            greaterThanOrEqualTo(4.5),
          );
        }
      }
      expect(requests, hasLength(4));
      await t.pumpWidget(const SizedBox());
      await pump(t, preview(frame()));
      expect(find.text('Hazırlığı görüntüle'), findsNothing);
      expect(requests, hasLength(4));
      semantics.dispose();
    },
  );
  final prefix = Platform.environment['KAVRIVA_RANGE_PREVIEW'];
  if (prefix != null)
    testWidgets('doğal Flutter tam kaydırma görselleri', (t) async {
      final font = Platform.environment['KAVRIVA_RANGE_FONT'];
      if (font == null) throw StateError('Sabit font yolu gerekli.');
      await t.runAsync(() async {
        final loader = FontLoader('KavrivaRangeNative')
          ..addFont(
            Future.value(ByteData.sublistView(await File(font).readAsBytes())),
          );
        await loader.load();
      });
      final rows = <String>[];
      for (final entry in cases().entries) {
        await t.pumpWidget(const SizedBox());
        await pump(t, entry.value, font: 'KavrivaRangeNative');
        final pos = t
            .state<ScrollableState>(find.byType(Scrollable).first)
            .position;
        final end = pos.maxScrollExtent;
        var index = 0;
        for (double offset = 0; ; offset = (offset + 600).clamp(0, end)) {
          pos.jumpTo(offset);
          await t.pumpAndSettle();
          final boundary = t.renderObject<RenderRepaintBoundary>(
            find.byKey(const ValueKey('range-capture')),
          );
          final path = '$prefix-${entry.key}-$index.png';
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
          expect(t.takeException(), isNull, reason: entry.key);
          if (offset >= end) break;
        }
      }
      await t.runAsync(
        () => File('$prefix-manifest.txt').writeAsString(rows.join('\n')),
      );
    });
}
