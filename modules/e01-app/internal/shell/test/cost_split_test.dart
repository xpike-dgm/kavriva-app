import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/cost_split.dart';
import 'package:kavriva_shell/duration_range.dart';
import 'package:kavriva_shell/guide_discovery.dart';
import 'package:kavriva_shell/kavriva_shell.dart';
import 'package:kavriva_shell/variant_resolution.dart';

import 'duration_range_test.dart' as existing;

CostSplitSource source({
  VariantContext? context,
  String doc = 'd1',
  DurationExperience? exp,
  bool current = true,
  bool confirmed = true,
  CostSplitState state = CostSplitState.ready,
  Map<CostCategory, CostAmount?>? amounts,
  List<String>? exclusions = const ['Servise ulaşım', 'Beklenmeyen ek parça'],
  List<String>? assumptions = const [
    'Kaynakta belirtilen örnek parça ve iş kapsamı',
  ],
  String date = '2026-10-01',
  String checked = '2026-10-10',
  String name = 'Örnek maliyet kaynağı',
  String version = 'örnek-r1',
  String currency = 'TL',
  int fractionDigits = 2,
}) => CostSplitSource(
  context: context ?? existing.guide(),
  documentRevision: doc,
  experience: exp ?? existing.experience(),
  source: name,
  version: version,
  priceDate: date,
  checkedDate: checked,
  currency: currency,
  fractionDigits: fractionDigits,
  current: current,
  confirmed: confirmed,
  state: state,
  amounts:
      amounts ??
      {
        CostCategory.parts: CostAmount(lowerMinor: 25000, upperMinor: 35000),
        CostCategory.consumables: CostAmount(
          lowerMinor: 5000,
          upperMinor: 8000,
        ),
        CostCategory.tools: CostAmount(lowerMinor: 0),
        CostCategory.labor: CostAmount(lowerMinor: 60000, upperMinor: 80000),
      },
  exclusions: exclusions,
  assumptions: assumptions,
  illustrative: true,
);

CostSplitPresentation frame({
  VariantContext? context,
  String doc = 'd1',
  DurationExperience? exp,
  bool missingExp = false,
  bool online = true,
  CostSplitSource? value,
  bool missingSource = false,
}) => CostSplitPresentation(
  context: context ?? existing.guide(),
  documentRevision: doc,
  experience: missingExp ? null : exp ?? existing.experience(),
  online: online,
  source: missingSource ? null : value ?? source(),
);

Widget preview(
  CostSplitPresentation? input, {
  bool current = true,
  bool missingScope = false,
  bool busy = false,
  String? error,
  VariantContext? target,
  DurationRangePresentation? duration,
  FitPresentation? fit,
  ValueChanged<VariantContext>? prepare,
}) {
  final context = target ?? existing.guide();
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
    duration: duration,
    cost: input,
    onPreparationRequested:
        prepare ?? (_) => throw StateError('Maliyet hazırlık izni veremez.'),
    onDistinctionRequested: null,
    onTeachingRequested: null,
    onEditRequested: null,
  );
}

Map<String, Widget> cases() {
  final other = existing.experience(
    id: 'familiar',
    label: 'Bu işi daha önce yaptım · kullanıcı beyanı',
  );
  return {
    'ready': preview(frame()),
    'partial': preview(
      frame(
        value: source(
          amounts: {
            CostCategory.parts: CostAmount(
              lowerMinor: 25000,
              upperMinor: 35000,
            ),
          },
        ),
      ),
    ),
    'unknown': preview(
      frame(
        value: source(state: CostSplitState.unknown, amounts: {}),
      ),
    ),
    'loading': preview(frame(value: source(state: CostSplitState.loading))),
    'failed': preview(frame(value: source(state: CostSplitState.failed))),
    'held': preview(frame(value: source(state: CostSplitState.held))),
    'missing-source': preview(frame(missingSource: true)),
    'missing-experience': preview(frame(missingExp: true)),
    'missing-exclusions': preview(frame(value: source(exclusions: null))),
    'empty-exclusions': preview(frame(value: source(exclusions: []))),
    'missing-assumptions': preview(frame(value: source(assumptions: null))),
    'stale': preview(frame(value: source(current: false))),
    'unconfirmed': preview(frame(value: source(confirmed: false))),
    'offline': preview(frame(online: false)),
    'wrong-motorcycle': preview(
      frame(
        value: source(context: existing.guide(bike: 'other')),
      ),
    ),
    'new-document': preview(frame(doc: 'd2')),
    'new-experience': preview(frame(exp: other)),
    'stale-scope': preview(frame(), current: false),
    'missing-scope': preview(frame(), missingScope: true),
    'long-context': preview(
      frame(
        value: source(
          exclusions: [
            'Örnek kaynak yalnız belirtilen konu kapsamındaki giderleri içerir; sonradan ortaya çıkabilecek başka parça ihtiyaçları, ulaşım ve kapsam dışı servis işlemleri bu tahmine dahil değildir.',
          ],
          assumptions: [
            'Örnek kaynakta yalnız belirtilen iş kapsamı ve belirtilen parçalar dikkate alınmış; başka motosiklet, farklı malzeme veya değişen iş koşulu için aynı tutarlar kullanılamaz.',
          ],
        ),
      ),
    ),
    'with-duration': preview(frame(), duration: existing.frame()),
    'previous-default': preview(null, duration: existing.frame()),
  };
}

void main() {
  WidgetController.hitTestWarningShouldBeFatal = true;
  test('kaynak tutarı negatif veya ters olamaz; hassasiyet ve birim kaynaktan gelir, toplam üretilmez', () {
    expect(() => CostAmount(lowerMinor: -1), throwsArgumentError);
    expect(
      () => CostAmount(lowerMinor: 100, upperMinor: 99),
      throwsArgumentError,
    );
    expect(
      CostAmount(lowerMinor: 0).display(fractionDigits: 2, currency: 'TL'),
      '0,00 TL',
    );
    expect(
      CostAmount(
        lowerMinor: 25000,
        upperMinor: 35000,
      ).display(fractionDigits: 2, currency: 'TL'),
      '250,00–350,00 TL',
    );
    expect(
      CostAmount(lowerMinor: 2300).display(fractionDigits: 0, currency: 'JPY'),
      '2300 JPY',
    );
    expect(
      CostAmount(lowerMinor: 1500).display(fractionDigits: 3, currency: 'BHD'),
      '1,500 BHD',
    );
    expect(
      CostAmount(
        lowerMinor: 1,
        upperMinor: 1,
      ).display(fractionDigits: 2, currency: 'TL'),
      '0,01 TL',
    );
    expect(
      () =>
          CostAmount(lowerMinor: 1).display(fractionDigits: -1, currency: 'TL'),
      throwsArgumentError,
    );
    expect(
      () =>
          CostAmount(lowerMinor: 1).display(fractionDigits: 7, currency: 'TL'),
      throwsArgumentError,
    );
    expect(
      () => CostAmount(lowerMinor: 1).display(fractionDigits: 2, currency: ''),
      throwsArgumentError,
    );
  });
  test(
    'gerçek tarih ve dolu kaynak gerekli; bugün damgası veya kaynak uydurulmaz',
    () {
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
      for (final invalid in [
        () => source(name: ' '),
        () => source(version: ''),
        () => source(doc: ''),
        () => source(currency: ''),
        () => source(fractionDigits: -1),
        () => source(fractionDigits: 7),
        () => source(checked: 'unknown'),
        () => source(exclusions: [' ']),
        () => source(assumptions: ['']),
        () => frame(doc: ' '),
      ]) {
        expect(invalid, throwsArgumentError);
      }
      final exact = source(doc: ' d1 ', currency: ' TL ');
      expect(exact.documentRevision, ' d1 ');
      expect(exact.currency, ' TL ');
      expect(
        frame(value: exact).readableFor(existing.guide(), scopeCurrent: true),
        isFalse,
      );
    },
  );
  test(
    'çağıran harita veya listeleri sonradan değiştirince kayıt değişmez',
    () {
      final amounts = {CostCategory.parts: CostAmount(lowerMinor: 25000)};
      final excluded = ['Kaynakta hariç tutulan örnek gider'];
      final assumed = ['Kaynak varsayımı'];
      final s = source(
        amounts: amounts,
        exclusions: excluded,
        assumptions: assumed,
      );
      amounts.clear();
      excluded.clear();
      assumed.clear();
      expect(s.amounts[CostCategory.parts]!.lowerMinor, 25000);
      expect(s.exclusions, ['Kaynakta hariç tutulan örnek gider']);
      expect(s.assumptions, ['Kaynak varsayımı']);
      expect(() => s.amounts.clear(), throwsUnsupportedError);
      expect(() => s.exclusions!.clear(), throwsUnsupportedError);
      expect(() => s.assumptions!.clear(), throwsUnsupportedError);
    },
  );
  testWidgets(
    'dört kalem hariçler fiyat tarihi kaynak ve örnek sınırı ayrı görünür',
    (t) async {
      final semantics = t.ensureSemantics();
      await existing.pump(t, preview(frame()));
      expect(find.text('Parça: 250,00–350,00 TL'), findsOneWidget);
      expect(find.text('Sarf malzemesi: 50,00–80,00 TL'), findsOneWidget);
      expect(find.text('Alet: 0,00 TL'), findsOneWidget);
      expect(find.text('İşçilik: 600,00–800,00 TL'), findsOneWidget);
      expect(find.text('Dahil değil: Servise ulaşım'), findsOneWidget);
      expect(find.text('Dahil değil: Beklenmeyen ek parça'), findsOneWidget);
      expect(find.text('Fiyat tarihi: 01.10.2026'), findsOneWidget);
      expect(
        find.text('Kaynak: Örnek maliyet kaynağı · sürüm: örnek-r1'),
        findsOneWidget,
      );
      expect(
        find.textContaining('toplam gider veya kesin fiyat sözü değildir'),
        findsOneWidget,
      );
      expect(
        find.text('Planlama bilgisi · ödeme veya bakım izni değildir.'),
        findsOneWidget,
      );
      expect(find.textContaining('Örnek gösterim:'), findsOneWidget);
      expect(find.textContaining('Toplam:'), findsNothing);
      expect(find.textContaining('hesap gerekmez'), findsOneWidget);
      expect(
        t
            .widgetList<Semantics>(find.byType(Semantics))
            .any((s) => s.properties.header == true),
        isTrue,
      );
      expect(
        t
            .widgetList<Semantics>(find.byType(Semantics))
            .any((s) => s.properties.liveRegion == true),
        isTrue,
      );
      semantics.dispose();
    },
  );
  testWidgets(
    'tam kaynak bağlamı deneyim belge güncellik ve online negatifleri eski tutar ve hariçleri gizler',
    (t) async {
      final inputs = [
        frame(missingSource: true),
        frame(missingExp: true),
        frame(online: false),
        frame(value: source(current: false)),
        frame(value: source(confirmed: false)),
        frame(context: existing.guide(bike: 'other')),
        frame(
          value: source(context: existing.guide(bike: 'other')),
        ),
        frame(
          value: source(context: existing.guide(id: 'other')),
        ),
        frame(
          value: source(context: existing.guide(rev: 'r2')),
        ),
        frame(doc: 'd2'),
        frame(exp: existing.experience(id: 'other')),
        frame(exp: existing.experience(rev: 'e2')),
        frame(exp: existing.experience(label: 'Başka beyan')),
        frame(value: source(doc: 'd2')),
      ];
      expect(frame().readableFor(existing.guide(), scopeCurrent: true), isTrue);
      for (final input in inputs) {
        expect(
          input.readableFor(existing.guide(), scopeCurrent: true),
          isFalse,
        );
        await t.pumpWidget(const SizedBox());
        await existing.pump(t, preview(input));
        expect(find.text('Parça: 250,00–350,00 TL'), findsNothing);
        expect(find.text('Alet: 0,00 TL'), findsNothing);
        expect(find.text('Dahil değil: Servise ulaşım'), findsNothing);
        expect(find.textContaining('Maliyet bilinmiyor.'), findsOneWidget);
        expect(find.textContaining('Fiyat tarihi:'), findsNothing);
        expect(t.takeException(), isNull);
      }
    },
  );
  testWidgets(
    'kapsam eksik eski busy veya hatalıyken iyi kaynak tutarı da görünmez',
    (t) async {
      for (final content in [
        preview(frame(), current: false),
        preview(frame(), missingScope: true),
        preview(frame(), busy: true),
        preview(frame(), error: 'Örnek kaynak hatası'),
        preview(frame(), target: existing.guide(id: 'other')),
      ]) {
        await t.pumpWidget(const SizedBox());
        await existing.pump(t, content);
        expect(find.text('Parça: 250,00–350,00 TL'), findsNothing);
        expect(find.textContaining('Maliyet bilinmiyor.'), findsOneWidget);
        expect(t.takeException(), isNull);
      }
    },
  );
  testWidgets(
    'nonready veya boş fiyat kaynağı bilinmiyor kalır; sıfır ya da tamamlanma olmaz',
    (t) async {
      for (final state in CostSplitState.values) {
        await t.pumpWidget(const SizedBox());
        await existing.pump(
          t,
          preview(
            frame(
              value: source(
                state: state,
                amounts: state == CostSplitState.ready ? {} : null,
              ),
            ),
          ),
        );
        expect(find.text('Parça: 250,00–350,00 TL'), findsNothing);
        expect(find.text('Alet: 0,00 TL'), findsNothing);
        for (final category in CostCategory.values) {
          expect(
            find.text(
              '${category.label}: Bilinmiyor; kaynak tutarı yok veya henüz kullanılamıyor.',
            ),
            findsOneWidget,
          );
        }
        expect(find.textContaining('tamamlandı'), findsNothing);
        expect(find.text('Fiyat tarihi: 01.10.2026'), findsOneWidget);
        if (state == CostSplitState.loading)
          expect(find.textContaining('yükleniyor'), findsOneWidget);
        if (state == CostSplitState.failed)
          expect(find.textContaining('alınamadı'), findsOneWidget);
        if (state == CostSplitState.held)
          expect(find.textContaining('henüz doğrulanmadı'), findsOneWidget);
      }
    },
  );
  testWidgets(
    'eksik kalem sıfıra dönüşmez; eksik ve boş hariç listeleri tüm giderler dahil sayılmaz',
    (t) async {
      await existing.pump(t, cases()['partial']!);
      expect(find.text('Parça: 250,00–350,00 TL'), findsOneWidget);
      expect(find.text('Alet: 0,00 TL'), findsNothing);
      expect(
        find.text(
          'Alet: Bilinmiyor; kaynak tutarı yok veya henüz kullanılamıyor.',
        ),
        findsOneWidget,
      );
      await existing.pump(t, cases()['missing-exclusions']!);
      expect(
        find.textContaining('Dahil olmayan giderler bilinmiyor'),
        findsOneWidget,
      );
      expect(find.text('Dahil değil: Servise ulaşım'), findsNothing);
      await existing.pump(t, cases()['empty-exclusions']!);
      expect(
        find.textContaining('tüm giderlerin dahil olduğu garantisi değildir'),
        findsOneWidget,
      );
      await existing.pump(t, cases()['missing-assumptions']!);
      expect(find.textContaining('Varsayımlar bilinmiyor'), findsOneWidget);
      expect(find.textContaining('Varsayım:'), findsNothing);
    },
  );
  testWidgets(
    'null maliyet varsayılanı değiştirmez; süre ve maliyet birbirinin uygunluk kapısı değildir',
    (t) async {
      await existing.pump(t, preview(null, duration: existing.frame()));
      expect(find.byType(CostSplitView), findsNothing);
      expect(find.text('40–80 dakika'), findsOneWidget);
      expect(find.byType(MotorcycleFitView), findsOneWidget);
      await existing.pump(
        t,
        preview(frame(doc: 'd2'), duration: existing.frame()),
      );
      expect(find.text('40–80 dakika'), findsOneWidget);
      expect(find.text('Parça: 250,00–350,00 TL'), findsNothing);
      expect(find.text('Hazırlığı görüntüle'), findsNothing);
      await existing.pump(
        t,
        preview(frame(), duration: existing.frame(doc: 'd2')),
      );
      expect(find.text('40–80 dakika'), findsNothing);
      expect(find.text('Parça: 250,00–350,00 TL'), findsOneWidget);
      expect(find.text('Hazırlığı görüntüle'), findsNothing);
      await existing.pump(t, preview(null));
      expect(find.byType(CostSplitView), findsNothing);
      expect(find.byType(DurationRangeView), findsNothing);
      expect(find.text('Rehberin kapsamı'), findsOneWidget);
    },
  );
  testWidgets(
    'gerçek parent güncellemesi eski belge ve deneyim tutarını kapatır; yeni kaynak ayrı tarihle gelir',
    (t) async {
      await existing.pump(t, preview(frame()));
      expect(find.text('Parça: 250,00–350,00 TL'), findsOneWidget);
      await existing.pump(t, preview(frame(doc: 'd2')));
      expect(find.text('Parça: 250,00–350,00 TL'), findsNothing);
      final e = existing.experience(
        id: 'other',
        rev: 'e2',
        label: 'Başka deneyim beyanı',
      );
      await existing.pump(t, preview(frame(exp: e)));
      expect(find.text('Parça: 250,00–350,00 TL'), findsNothing);
      await existing.pump(
        t,
        preview(
          frame(
            doc: 'd2',
            exp: e,
            value: source(
              doc: 'd2',
              exp: e,
              date: '2026-10-08',
              amounts: {CostCategory.parts: CostAmount(lowerMinor: 50000)},
            ),
          ),
        ),
      );
      expect(find.text('Parça: 500,00 TL'), findsOneWidget);
      expect(find.text('Fiyat tarihi: 08.10.2026'), findsOneWidget);
      expect(find.text('Parça: 250,00–350,00 TL'), findsNothing);
    },
  );
  testWidgets(
    '22 durum üç genişlik üç yazı ölçeğinde tam kaydırılır; son sekme gerçek dokunma hedefidir',
    (t) async {
      expect(cases(), hasLength(22));
      for (final entry in cases().entries) {
        for (final width in [320.0, 390.0, 768.0]) {
          for (final scale in [1.0, 2.0, 3.0]) {
            await t.pumpWidget(const SizedBox());
            await existing.pump(t, entry.value, width: width, scale: scale);
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
    'maliyet güncel veya bilinmiyor olsa da hazırlık mevcut fit kanıtına bağlıdır; gerçek klavye odak ve kontrast korunur',
    (t) async {
      final semantics = t.ensureSemantics();
      final requests = <VariantContext>[];
      final context = existing.guide();
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
        await existing.pump(t, preview(input, fit: fit, prepare: requests.add));
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
      await existing.pump(t, preview(frame()));
      expect(find.text('Hazırlığı görüntüle'), findsNothing);
      expect(requests, hasLength(4));
      semantics.dispose();
    },
  );
  final prefix = Platform.environment['KAVRIVA_COST_PREVIEW'];
  if (prefix != null)
    testWidgets('doğal Flutter tam kaydırma görselleri', (t) async {
      final font = Platform.environment['KAVRIVA_COST_FONT'];
      if (font == null) throw StateError('Sabit font yolu gerekli.');
      await t.runAsync(() async {
        final loader = FontLoader('KavrivaCostNative')
          ..addFont(
            Future.value(ByteData.sublistView(await File(font).readAsBytes())),
          );
        await loader.load();
      });
      final rows = <String>[];
      for (final entry in cases().entries) {
        await t.pumpWidget(const SizedBox());
        await existing.pump(t, entry.value, font: 'KavrivaCostNative');
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
