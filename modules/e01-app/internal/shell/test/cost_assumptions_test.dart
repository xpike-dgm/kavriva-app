import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/cost_split.dart';
import 'package:kavriva_shell/kavriva_shell.dart';
import 'package:kavriva_shell/variant_resolution.dart';

import 'cost_split_test.dart' as cost;
import 'duration_range_test.dart' as existing;

const conditions = [
  'Bu örnek yalnız kaynakta belirtilen parçayı kapsar.',
  'Örnek aletin zaten elde olduğu kaynakta kabul edilmiş.',
  'Örnek işçilik bu kaynak kapsamına aittir.',
];

Map<String, Widget> cases() => {
  'ready': cost.preview(
    cost.frame(value: cost.source(assumptions: conditions)),
  ),
  'missing-assumptions': cost.preview(
    cost.frame(value: cost.source(assumptions: null)),
  ),
  'empty-assumptions': cost.preview(
    cost.frame(value: cost.source(assumptions: [])),
  ),
  'unknown': cost.preview(
    cost.frame(
      value: cost.source(
        state: CostSplitState.unknown,
        assumptions: conditions,
      ),
    ),
  ),
  'loading': cost.preview(
    cost.frame(
      value: cost.source(
        state: CostSplitState.loading,
        assumptions: conditions,
      ),
    ),
  ),
  'failed': cost.preview(
    cost.frame(
      value: cost.source(state: CostSplitState.failed, assumptions: conditions),
    ),
  ),
  'held': cost.preview(
    cost.frame(
      value: cost.source(state: CostSplitState.held, assumptions: conditions),
    ),
  ),
  'missing-source': cost.preview(cost.frame(missingSource: true)),
  'missing-experience': cost.preview(
    cost.frame(missingExp: true, value: cost.source(assumptions: conditions)),
  ),
  'offline': cost.preview(
    cost.frame(online: false, value: cost.source(assumptions: conditions)),
  ),
  'wrong-motorcycle': cost.preview(
    cost.frame(
      context: existing.guide(bike: 'another'),
      value: cost.source(assumptions: conditions),
    ),
  ),
  'new-document': cost.preview(
    cost.frame(
      doc: 'd2',
      value: cost.source(assumptions: conditions),
    ),
  ),
  'new-experience': cost.preview(
    cost.frame(
      exp: existing.experience(rev: 'e2'),
      value: cost.source(assumptions: conditions),
    ),
  ),
  'stale': cost.preview(
    cost.frame(value: cost.source(current: false, assumptions: conditions)),
  ),
  'unconfirmed': cost.preview(
    cost.frame(value: cost.source(confirmed: false, assumptions: conditions)),
  ),
  'stale-scope': cost.preview(
    cost.frame(value: cost.source(assumptions: conditions)),
    current: false,
  ),
  'missing-scope': cost.preview(
    cost.frame(value: cost.source(assumptions: conditions)),
    missingScope: true,
  ),
  'long-context': cost.preview(
    cost.frame(
      value: cost.source(
        assumptions: [
          'Örnek kaynağın hesabı yalnız belirtilen motosiklet, rehber revizyonu ve kullanıcı deneyimi içindir. Başka bir motosiklet, parça, alet, deneyim veya iş koşulu için aynı koşulların geçerli olduğu söylenemez; kaynakta bulunmayan bilgi eklenmez.',
          ...conditions,
        ],
      ),
    ),
  ),
  'with-duration': cost.preview(
    cost.frame(value: cost.source(assumptions: conditions)),
    duration: existing.frame(),
  ),
  'previous-default': cost.preview(null, duration: existing.frame()),
};

void main() {
  testWidgets(
    'verilmiş koşullar kaynaktan aynen görünür; yeni bir koşul veya kesin sonuç eklenmez',
    (t) async {
      await existing.pump(t, cases()['ready']!);
      for (final item in conditions)
        expect(find.text('Varsayım: $item'), findsOneWidget);
      expect(
        find.textContaining('Kaynakta olmayan bir varsayım eklenmez'),
        findsOneWidget,
      );
      expect(
        find.textContaining('eski kaynağın varsayımlarını kullanma'),
        findsOneWidget,
      );
      expect(find.textContaining('Örnek gösterim:'), findsOneWidget);
      expect(find.text('Fiyat tarihi: 01.10.2026'), findsOneWidget);
      expect(find.text('Hazırlığı görüntüle'), findsNothing);
    },
  );
  testWidgets(
    'bilinen fiyat eksik veya boş kaynak koşulunu doldurmaz ve garantiye dönüşmez',
    (t) async {
      await existing.pump(t, cases()['missing-assumptions']!);
      expect(find.text('Parça: 250,00–350,00 TL'), findsOneWidget);
      expect(find.textContaining('Varsayımlar bilinmiyor'), findsOneWidget);
      for (final item in conditions)
        expect(find.text('Varsayım: $item'), findsNothing);
      await existing.pump(t, cases()['empty-assumptions']!);
      expect(
        find.textContaining('Kaynak bir varsayım belirtmemiş'),
        findsOneWidget,
      );
      expect(
        find.textContaining('koşulların değişmeyeceği garantisi değildir'),
        findsOneWidget,
      );
      expect(find.textContaining('Varsayımlar bilinmiyor'), findsNothing);
    },
  );
  testWidgets(
    'yükleme hata held ve unknown kaynakta verilmiş koşulları hazır bilgiye çeviremez',
    (t) async {
      for (final state in CostSplitState.values.where(
        (x) => x != CostSplitState.ready,
      )) {
        await existing.pump(
          t,
          cost.preview(
            cost.frame(
              value: cost.source(state: state, assumptions: conditions),
            ),
          ),
        );
        for (final item in conditions)
          expect(
            find.text('Varsayım: $item'),
            findsNothing,
            reason: state.name,
          );
        expect(find.textContaining('Varsayımlar bilinmiyor'), findsOneWidget);
        expect(find.text('Parça: 250,00–350,00 TL'), findsNothing);
        expect(find.text('Hazırlığı görüntüle'), findsNothing);
      }
    },
  );
  testWidgets(
    'kaynak belge deneyim motor ve scope değişimleri eski koşulları taşımaz',
    (t) async {
      final original = cost.source(assumptions: conditions);
      final inputs = [
        cost.frame(missingSource: true),
        cost.frame(missingExp: true, value: original),
        cost.frame(online: false, value: original),
        cost.frame(
          context: existing.guide(bike: 'other'),
          value: original,
        ),
        cost.frame(doc: 'd2', value: original),
        cost.frame(
          exp: existing.experience(id: 'other'),
          value: original,
        ),
        cost.frame(
          exp: existing.experience(rev: 'e2'),
          value: original,
        ),
        cost.frame(
          exp: existing.experience(label: 'Başka beyan'),
          value: original,
        ),
        cost.frame(
          value: cost.source(
            context: existing.guide(rev: 'v2'),
            assumptions: conditions,
          ),
        ),
        cost.frame(
          value: cost.source(
            context: existing.guide(id: 'other'),
            assumptions: conditions,
          ),
        ),
        cost.frame(value: cost.source(current: false, assumptions: conditions)),
        cost.frame(
          value: cost.source(confirmed: false, assumptions: conditions),
        ),
      ];
      for (final input in inputs) {
        await existing.pump(t, cost.preview(input));
        for (final item in conditions)
          expect(find.text('Varsayım: $item'), findsNothing);
        expect(find.textContaining('Varsayımlar bilinmiyor'), findsOneWidget);
      }
      for (final widget in [
        cost.preview(cost.frame(value: original), current: false),
        cost.preview(cost.frame(value: original), missingScope: true),
        cost.preview(cost.frame(value: original), busy: true),
        cost.preview(cost.frame(value: original), error: 'Örnek hata'),
        cost.preview(
          cost.frame(value: original),
          target: existing.guide(bike: 'other'),
        ),
      ]) {
        await existing.pump(t, widget);
        for (final item in conditions)
          expect(find.text('Varsayım: $item'), findsNothing);
      }
    },
  );
  testWidgets(
    'gerçek parent güncellemesi eski varsayımı kapatır; yeni kaynak ayrı koşulla gelir',
    (t) async {
      final original = cost.source(assumptions: conditions);
      await existing.pump(t, cost.preview(cost.frame(value: original)));
      expect(find.text('Varsayım: ${conditions.first}'), findsOneWidget);
      await existing.pump(
        t,
        cost.preview(cost.frame(doc: 'd2', value: original)),
      );
      expect(find.text('Varsayım: ${conditions.first}'), findsNothing);
      final experience = existing.experience(rev: 'e2');
      await existing.pump(
        t,
        cost.preview(cost.frame(exp: experience, value: original)),
      );
      expect(find.text('Varsayım: ${conditions.first}'), findsNothing);
      await existing.pump(
        t,
        cost.preview(
          cost.frame(
            doc: 'd2',
            exp: experience,
            value: cost.source(
              doc: 'd2',
              exp: experience,
              assumptions: ['Yeni örnek kaynağın ayrı koşulu'],
              date: '2026-10-08',
            ),
          ),
        ),
      );
      expect(
        find.text('Varsayım: Yeni örnek kaynağın ayrı koşulu'),
        findsOneWidget,
      );
      expect(find.text('Varsayım: ${conditions.first}'), findsNothing);
      expect(find.text('Fiyat tarihi: 08.10.2026'), findsOneWidget);
      await existing.pump(t, cost.preview(cost.frame(missingSource: true)));
      expect(
        find.text('Varsayım: Yeni örnek kaynağın ayrı koşulu'),
        findsNothing,
      );
    },
  );
  testWidgets(
    'çağıranın liste mutasyonu kabul edilmiş koşul metnini değiştiremez',
    (t) async {
      final supplied = List<String>.of(conditions);
      final s = cost.source(assumptions: supplied);
      supplied[0] = 'Sonradan eklenen koşul';
      supplied.clear();
      await existing.pump(t, cost.preview(cost.frame(value: s)));
      for (final item in conditions)
        expect(find.text('Varsayım: $item'), findsOneWidget);
      expect(find.textContaining('Sonradan eklenen koşul'), findsNothing);
      expect(() => s.assumptions!.add('Ek'), throwsUnsupportedError);
    },
  );
  testWidgets(
    'kaynak metni kimliği ve Türkçe işaretleri aynen korunur; boş alan reddedilir',
    (t) async {
      const item = '  Örnek kaynak koşulu: işçilik ≠ parça; A/B · sürüm 2.  ';
      await existing.pump(
        t,
        cost.preview(cost.frame(value: cost.source(assumptions: [item]))),
      );
      expect(find.text('Varsayım: $item'), findsOneWidget);
      expect(() => cost.source(assumptions: ['  ']), throwsArgumentError);
      expect(
        () => cost.source(assumptions: ['Verilmiş', '']),
        throwsArgumentError,
      );
    },
  );
  testWidgets(
    'süre fiyat deneyim ve hariç bilgi birbirinin bilinmeyenini doldurmaz',
    (t) async {
      await existing.pump(
        t,
        cost.preview(
          cost.frame(value: cost.source(assumptions: null)),
          duration: existing.frame(),
        ),
      );
      expect(find.text('40–80 dakika'), findsOneWidget);
      expect(find.text('Parça: 250,00–350,00 TL'), findsOneWidget);
      expect(find.textContaining('Varsayımlar bilinmiyor'), findsOneWidget);
      await existing.pump(
        t,
        cost.preview(
          cost.frame(
            value: cost.source(
              amounts: {},
              exclusions: null,
              assumptions: conditions,
            ),
          ),
        ),
      );
      for (final category in CostCategory.values)
        expect(
          find.text(
            '${category.label}: Bilinmiyor; kaynak tutarı yok veya henüz kullanılamıyor.',
          ),
          findsOneWidget,
        );
      for (final item in conditions)
        expect(find.text('Varsayım: $item'), findsOneWidget);
      expect(
        find.textContaining('Dahil olmayan giderler bilinmiyor'),
        findsOneWidget,
      );
      await existing.pump(t, cases()['missing-experience']!);
      expect(find.textContaining('sana bir seviye atanmadı'), findsOneWidget);
      for (final item in conditions)
        expect(find.text('Varsayım: $item'), findsNothing);
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
    'kaynak başlığı erişilebilir; eksik koşul hazırlık yetkisi vermez ve mevcut klavye hedefi korunur',
    (t) async {
      final semantics = t.ensureSemantics();
      await existing.pump(t, cases()['missing-assumptions']!);
      expect(
        t
            .widgetList<Semantics>(find.byType(Semantics))
            .where(
              (x) =>
                  x.properties.header == true &&
                  x.child is Text &&
                  (x.child! as Text).data == 'Kaynağın varsayımları',
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
      await existing.pump(
        t,
        cost.preview(
          cost.frame(value: cost.source(assumptions: null)),
          fit: fit,
          prepare: requests.add,
        ),
      );
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
  final prefix = Platform.environment['KAVRIVA_ASSUMPTIONS_PREVIEW'];
  if (prefix != null)
    testWidgets('doğal Flutter varsayımlar tam kaydırma görselleri', (t) async {
      final font = Platform.environment['KAVRIVA_ASSUMPTIONS_FONT'];
      if (font == null) throw StateError('Sabit font yolu gerekli.');
      await t.runAsync(() async {
        final loader = FontLoader('KavrivaAssumptionsNative')
          ..addFont(
            Future.value(ByteData.sublistView(await File(font).readAsBytes())),
          );
        await loader.load();
      });
      final rows = <String>[];
      for (final entry in cases().entries) {
        await t.pumpWidget(const SizedBox());
        await existing.pump(t, entry.value, font: 'KavrivaAssumptionsNative');
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
