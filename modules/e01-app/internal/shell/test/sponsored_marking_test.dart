import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/guide_discovery.dart';
import 'package:kavriva_shell/kavriva_shell.dart';
import 'package:kavriva_shell/sponsored_marking.dart';
import 'package:kavriva_shell/variant_resolution.dart';

import 'duration_range_test.dart' as existing;

CommercialOption option({
  String id = 'sponsor',
  String name = 'Örnek sponsorlu seçenek',
  SponsorDisclosure disclosure = SponsorDisclosure.sponsored,
}) => CommercialOption(id: id, name: name, disclosure: disclosure);

List<CommercialOption> mixed() => [
  option(),
  option(
    id: 'other',
    name: 'Örnek diğer seçenek',
    disclosure: SponsorDisclosure.notSponsored,
  ),
];

CommercialSource source({
  VariantContext? context,
  bool current = true,
  bool confirmed = true,
  List<CommercialOption>? options,
  bool missingOptions = false,
  String name = 'Örnek gösterim; gerçek satıcı veya teklif değildir.',
}) => CommercialSource(
  context: context ?? existing.guide(),
  sourceName: name,
  revision: 'ticari-kaynak-r1',
  checkedAt: '2026-10-12',
  current: current,
  confirmed: confirmed,
  options: missingOptions ? null : options ?? mixed(),
);

CommercialPresentation frame({
  CommercialSource? value,
  bool missing = false,
  bool online = true,
  CommercialDisplayState state = CommercialDisplayState.available,
}) => CommercialPresentation(
  source: missing ? null : value ?? source(),
  state: state,
  online: online,
);

Widget preview(
  CommercialPresentation? input, {
  VariantContext? target,
  bool current = true,
  bool missingScope = false,
  bool busy = false,
  String? error,
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
    commercial: input,
    onPreparationRequested:
        prepare ?? (_) => throw StateError('Reklam hazırlık izni veremez.'),
    onDistinctionRequested: null,
    onTeachingRequested: null,
    onEditRequested: null,
  );
}

Map<String, Widget> cases() => {
  'mixed': preview(frame()),
  'only-sponsored': preview(frame(value: source(options: [option()]))),
  'unknown-disclosure': preview(
    frame(
      value: source(options: [option(disclosure: SponsorDisclosure.unknown)]),
    ),
  ),
  'mixed-unknown': preview(
    frame(
      value: source(
        options: [
          ...mixed(),
          option(
            id: 'hidden',
            name: 'Gizlenmesi gereken ticari ad',
            disclosure: SponsorDisclosure.unknown,
          ),
        ],
      ),
    ),
  ),
  'missing-alternatives': preview(frame(value: source(missingOptions: true))),
  'empty': preview(frame(value: source(options: []))),
  'loading': preview(frame(state: CommercialDisplayState.loading)),
  'failed': preview(frame(state: CommercialDisplayState.failed)),
  'held': preview(frame(state: CommercialDisplayState.held)),
  'missing-source': preview(frame(missing: true)),
  'offline': preview(frame(online: false)),
  'stale': preview(frame(value: source(current: false))),
  'unconfirmed': preview(frame(value: source(confirmed: false))),
  'wrong-motorcycle': preview(
    frame(
      value: source(context: existing.guide(bike: 'other')),
    ),
  ),
  'wrong-guide': preview(
    frame(
      value: source(context: existing.guide(id: 'other')),
    ),
  ),
  'new-revision': preview(
    frame(
      value: source(context: existing.guide(rev: 'new')),
    ),
  ),
  'stale-scope': preview(frame(), current: false),
  'missing-scope': preview(frame(), missingScope: true),
  'long': preview(
    frame(
      value: source(
        options: [
          option(
            name: 'Örnek kaynakta geçen uzun Türkçe ticari seçenek adı; bu adın görünmesi motosiklete uygunluk, doğrulanmış teknik öneri, garanti, gerçek satıcı veya satın alma izni değildir.',
          ),
          option(
            id: 'long-other',
            name: 'Örnek kaynakta verilen diğer seçenek; sponsor desteği bulunmadığı kaynak tarafından bildirilmiştir ve teknik bakımdan en iyi olduğu söylenmemektedir.',
            disclosure: SponsorDisclosure.notSponsored,
          ),
        ],
      ),
    ),
  ),
  'previous-default': preview(null),
};

void main() {
  testWidgets(
    'her seçenek sponsor bilgisini kendi metninde taşır ve diğer seçenek gizlenmez',
    (t) async {
      await existing.pump(t, cases()['mixed']!);
      expect(
        find.text(
          'Sponsorlu · ücretli reklam — Kaynakta geçen seçenek: Örnek sponsorlu seçenek',
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          'Kaynağa göre sponsor desteği yok — Kaynakta geçen seçenek: Örnek diğer seçenek',
        ),
        findsOneWidget,
      );
      expect(
        find.textContaining('teknik olarak en iyi olduğunu kanıtlamaz'),
        findsOneWidget,
      );
      expect(find.text('Kaynak sürümü: ticari-kaynak-r1'), findsOneWidget);
      expect(find.text('Kaynak kontrol zamanı: 2026-10-12'), findsOneWidget);
      final names = t
          .widgetList<Text>(find.byType(Text))
          .map((x) => x.data)
          .toList();
      expect(
        names.indexOf('Motosiklete uygunluk'),
        lessThan(names.indexOf('Diğer seçenekler ve reklam bilgisi')),
      );
      expect(find.text('Hazırlığı görüntüle'), findsNothing);
    },
  );
  testWidgets(
    'bilinmeyen sponsor reklamsız sayılmaz; adı gizlenir, bilinen alternatif korunur',
    (t) async {
      await existing.pump(t, cases()['mixed-unknown']!);
      expect(find.textContaining('sponsor bilgisi bilinmiyor'), findsOneWidget);
      expect(find.textContaining('Reklamsız sayılmaz'), findsOneWidget);
      expect(find.textContaining('Gizlenmesi gereken ticari ad'), findsNothing);
      expect(
        find.textContaining('Kaynakta geçen seçenek: Örnek diğer seçenek'),
        findsOneWidget,
      );
      expect(
        find.textContaining('Kaynakta geçen seçenek: Örnek sponsorlu seçenek'),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'tek sponsor bütün pazar değildir; boş ve bilinmeyen alternatif farklıdır',
    (t) async {
      for (final key in ['only-sponsored', 'missing-alternatives', 'empty']) {
        await existing.pump(t, cases()[key]!);
        expect(
          find.textContaining('bütün alternatifleri kapsadığı anlamına gelmez'),
          findsOneWidget,
        );
        if (key == 'missing-alternatives')
          expect(find.textContaining('bilgisini vermemiş'), findsOneWidget);
        if (key == 'empty')
          expect(find.textContaining('kayıtlı seçenek yok'), findsOneWidget);
      }
      await existing.pump(
        t,
        preview(
          frame(
            value: source(
              options: [
                option(id: 'other', disclosure: SponsorDisclosure.notSponsored),
              ],
            ),
          ),
        ),
      );
      expect(find.textContaining('Sponsorlu · ücretli reklam'), findsNothing);
      expect(
        find.textContaining('Kaynağa göre sponsor desteği yok'),
        findsOneWidget,
      );
    },
  );
  testWidgets('kaynak ve bağlam geçersizken eski ticari seçenek gösterilmez', (
    t,
  ) async {
    for (final key in [
      'loading',
      'failed',
      'held',
      'missing-source',
      'offline',
      'stale',
      'unconfirmed',
      'wrong-motorcycle',
      'wrong-guide',
      'new-revision',
      'stale-scope',
      'missing-scope',
    ]) {
      await existing.pump(t, cases()[key]!);
      expect(
        find.textContaining('Kaynakta geçen seçenek:'),
        findsNothing,
        reason: key,
      );
      expect(
        find.text('Kaynak sürümü: ticari-kaynak-r1'),
        findsNothing,
        reason: key,
      );
      expect(find.text('Hazırlığı görüntüle'), findsNothing, reason: key);
    }
    for (final w in [
      preview(frame(), busy: true),
      preview(frame(), error: 'Kaynak hatası'),
    ]) {
      await existing.pump(t, w);
      expect(find.textContaining('Kaynakta geçen seçenek:'), findsNothing);
    }
  });
  testWidgets(
    'gerçek parent bağlam veya kaynak değişiminde eski listeden yeni listeye sızıntı olmaz',
    (t) async {
      await existing.pump(t, preview(frame()));
      await existing.pump(
        t,
        preview(frame(), target: existing.guide(bike: 'new')),
      );
      expect(find.textContaining('Örnek sponsorlu seçenek'), findsNothing);
      await existing.pump(
        t,
        preview(
          frame(
            value: source(
              context: existing.guide(bike: 'new'),
              options: [
                option(
                  id: 'new',
                  name: 'Yeni kaynağın seçeneği',
                  disclosure: SponsorDisclosure.notSponsored,
                ),
              ],
            ),
          ),
          target: existing.guide(bike: 'new'),
        ),
      );
      expect(find.textContaining('Yeni kaynağın seçeneği'), findsOneWidget);
      expect(find.textContaining('Örnek sponsorlu seçenek'), findsNothing);
    },
  );
  test(
    'listeler kopyalanır ve kimlik/kaynak boşluğu veya aynı kimlik reddedilir',
    () {
      final input = mixed();
      final value = source(options: input);
      input.clear();
      expect(value.options, hasLength(2));
      expect(() => value.options!.clear(), throwsUnsupportedError);
      expect(() => source(options: [option(), option()]), throwsArgumentError);
      expect(() => option(id: ' '), throwsArgumentError);
      expect(() => option(name: ' '), throwsArgumentError);
      expect(() => source(name: ' '), throwsArgumentError);
      expect(
        () => CommercialSource(
          context: existing.guide(),
          sourceName: 's',
          revision: ' ',
          checkedAt: 'date',
          current: true,
          confirmed: true,
          options: [],
        ),
        throwsArgumentError,
      );
      expect(
        () => CommercialSource(
          context: existing.guide(),
          sourceName: 's',
          revision: 'r',
          checkedAt: ' ',
          current: true,
          confirmed: true,
          options: [],
        ),
        throwsArgumentError,
      );
    },
  );
  testWidgets(
    'null yeni alan oluşturmaz; ticari girdiler yokken mevcut rehber aynıdır',
    (t) async {
      await existing.pump(t, cases()['previous-default']!);
      expect(find.text('Diğer seçenekler ve reklam bilgisi'), findsNothing);
      expect(find.text('Rehberin kapsamı'), findsOneWidget);
      expect(find.text('Motosiklete uygunluk'), findsOneWidget);
      expect(find.text('Hazırlığı görüntüle'), findsNothing);
    },
  );
  testWidgets(
    'liste verilen sırayı korur ve sponsor bulunması uygunluk kapısını açmaz',
    (t) async {
      await existing.pump(
        t,
        preview(frame(value: source(options: mixed().reversed.toList()))),
      );
      final names = t
          .widgetList<Text>(find.byType(Text))
          .map((x) => x.data)
          .whereType<String>()
          .toList();
      expect(
        names.indexWhere(
          (x) => x.contains('Kaynakta geçen seçenek: Örnek diğer seçenek'),
        ),
        lessThan(
          names.indexWhere(
            (x) =>
                x.contains('Kaynakta geçen seçenek: Örnek sponsorlu seçenek'),
          ),
        ),
      );
      expect(find.text('Hazırlığı görüntüle'), findsNothing);
      expect(
        find.textContaining(
          'satın alma, ödeme ya da servis rezervasyonu başlatılmaz',
        ),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    '20 durum üç genişlik ve üç yazı ölçeğinde sona kaydırılır; shell hedefleri korunur',
    (t) async {
      expect(cases(), hasLength(20));
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
            for (final section in KavrivaSection.values)
              expect(find.text(section.label), findsOneWidget);
            for (final button in t.widgetList<GestureDetector>(
              find.byType(GestureDetector),
            ))
              expect(
                t.getSize(find.byWidget(button)).height,
                greaterThanOrEqualTo(52),
              );
            await t.tap(find.text('Topluluk').hitTestable());
            await t.pumpAndSettle();
            expect(t.takeException(), isNull);
          }
        }
      }
    },
  );
  testWidgets(
    'reklam başlığı ve kaynak metni erişilebilir; sponsor uygunluk ve klavye davranışını değiştirmez',
    (t) async {
      final semantics = t.ensureSemantics();
      await existing.pump(t, cases()['mixed']!);
      expect(
        t
            .widgetList<Semantics>(find.byType(Semantics))
            .where(
              (x) =>
                  x.properties.header == true &&
                  x.child is Text &&
                  (x.child! as Text).data ==
                      'Diğer seçenekler ve reklam bilgisi',
            ),
        hasLength(1),
      );
      expect(find.text('Hazırlığı görüntüle'), findsNothing);
      final target = existing.guide();
      final requests = <VariantContext>[];
      final fit = FitPresentation(
        context: target,
        status: FitDisplayStatus.confirmed,
        reason: 'Örnek uygunluk kanıtı; fiziksel izin değil.',
        evidence: FitEvidenceReference(
          context: target,
          source: 'Örnek uygunluk kaynağı',
          version: 'f1',
          location: 'Örnek bölüm',
          checkedAt: '2026-10-12',
          current: true,
        ),
      );
      await t.pumpWidget(const SizedBox());
      await existing.pump(t, preview(frame(), fit: fit, prepare: requests.add));
      await t.ensureVisible(find.text('Hazırlığı görüntüle'));
      await t.pumpAndSettle();
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pumpAndSettle();
      final borders = t
          .widgetList<Container>(find.byType(Container))
          .where((x) => x.decoration is BoxDecoration)
          .map((x) => (x.decoration! as BoxDecoration).border)
          .whereType<Border>()
          .where((x) => x.top.color == const Color(0xFF0E5BD8));
      expect(borders, isNotEmpty);
      expect(borders.every((x) => x.top.width == 2), isTrue);
      expect(
        (const Color(0xFFF8FAFC).computeLuminance() + 0.05) /
            (const Color(0xFF0E5BD8).computeLuminance() + 0.05),
        greaterThanOrEqualTo(3),
      );
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.pump();
      await t.sendKeyEvent(LogicalKeyboardKey.space);
      await t.pump();
      expect(requests, hasLength(2));
      expect(requests.every((x) => x.matches(target)), isTrue);
      for (final element in find.byType(Text).evaluate()) {
        final x = element.widget as Text;
        final color =
            x.style?.color ?? DefaultTextStyle.of(element).style.color!;
        expect(
          (const Color(0xFFF8FAFC).computeLuminance() + 0.05) /
              (color.computeLuminance() + 0.05),
          greaterThanOrEqualTo(4.5),
        );
      }
      semantics.dispose();
    },
  );
  final prefix = Platform.environment['KAVRIVA_SPONSOR_PREVIEW'];
  if (prefix != null)
    testWidgets('doğal Flutter reklam bilgisi tam kaydırma görselleri', (
      t,
    ) async {
      final font = Platform.environment['KAVRIVA_SPONSOR_FONT'];
      if (font == null) throw StateError('Sabit font yolu gerekli.');
      await t.runAsync(() async {
        final loader = FontLoader('KavrivaSponsorNative')
          ..addFont(
            Future.value(ByteData.sublistView(await File(font).readAsBytes())),
          );
        await loader.load();
      });
      final rows = <String>[];
      for (final entry in cases().entries) {
        await t.pumpWidget(const SizedBox());
        await existing.pump(t, entry.value, font: 'KavrivaSponsorNative');
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
