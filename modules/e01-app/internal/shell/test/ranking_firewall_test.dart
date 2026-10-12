import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/guide_discovery.dart';
import 'package:kavriva_shell/kavriva_shell.dart';
import 'package:kavriva_shell/ranking_firewall.dart';
import 'package:kavriva_shell/sponsored_marking.dart';
import 'package:kavriva_shell/variant_resolution.dart';

import 'duration_range_test.dart' as existing;
import 'sponsored_marking_test.dart' as prior;

CommercialSource source({
  VariantContext? context,
  List<CommercialOption>? options,
}) => CommercialSource(
  context: context ?? existing.guide(),
  sourceName:
      'Örnek amaç beyanı; gerçek satıcı veya üretim doğrulaması değildir.',
  revision: 'ayrim-r1',
  checkedAt: '2026-10-13',
  current: true,
  confirmed: true,
  options: options ?? prior.mixed(),
);

FitPresentation fit(
  VariantContext context, {
  FitDisplayStatus status = FitDisplayStatus.confirmed,
  bool current = true,
  VariantContext? evidenceContext,
}) => FitPresentation(
  context: context,
  status: status,
  reason: 'Bu gösterim örnektir; gerçek motosiklet için verilmiş karar değildir. Örnek teknik kaynak; ticari listeden türetilmemiştir.',
  evidence: FitEvidenceReference(
    context: evidenceContext ?? context,
    source: 'Örnek teknik kaynak',
    version: 'fit-r1',
    location: 'Örnek bölüm',
    checkedAt: '2026-10-13',
    current: current,
  ),
);

Widget preview(
  CommercialPresentation? input, {
  CommercialPurpose purpose = CommercialPurpose.supplement,
  VariantContext? target,
  bool current = true,
  bool busy = false,
  String? error,
  FitPresentation? result,
  ValueChanged<VariantContext>? prepare,
}) {
  final context = target ?? existing.guide();
  return GuideScopePreview(
    context: context,
    scope: GuideScope(
      context: context,
      includes: 'Örnek konunun kapsamı.',
      excludes: 'Fiziksel uygulama adımı değildir.',
      current: current,
    ),
    fit: result,
    busy: busy,
    errorMessage: error,
    commercial: input,
    commercialPurpose: purpose,
    onPreparationRequested:
        prepare ?? (_) => throw StateError('Ticari bilgi izin üretemez.'),
    onDistinctionRequested: null,
    onTeachingRequested: null,
    onEditRequested: null,
  );
}

Widget screen(
  CommercialPurpose purpose, {
  FitPresentation? result,
  VariantContext? target,
  List<CommercialOption>? options,
  ValueChanged<VariantContext>? prepare,
}) => preview(
  prior.frame(
    value: source(context: target, options: options),
  ),
  purpose: purpose,
  target: target,
  result: result,
  prepare: prepare,
);

Map<String, Widget> cases() {
  final values = prior.cases();
  for (final key in [
    'mixed-unknown',
    'unconfirmed',
    'wrong-guide',
    'missing-scope',
  ]) {
    values.remove(key);
  }
  for (final purpose in CommercialPurpose.values.where(
    (p) => p != CommercialPurpose.supplement,
  )) {
    final target = existing.guide();
    values[purpose.name] = screen(purpose, target: target, result: fit(target));
  }
  return values;
}

void main() {
  testWidgets(
    'yasak amaçlarda ticari adlar gizlenir; teknik rehber ve mevcut uygunluk sonucu korunur',
    (t) async {
      final target = existing.guide();
      final result = fit(target);
      final requests = <VariantContext>[];
      for (final purpose in CommercialPurpose.values) {
        await existing.pump(
          t,
          screen(
            purpose,
            target: target,
            result: result,
            prepare: requests.add,
          ),
        );
        final rendered = t.widget<MotorcycleFitView>(
          find.byType(MotorcycleFitView),
        );
        expect(identical(rendered.result, result), isTrue);
        expect(rendered.context.matches(target), isTrue);
        expect(find.text('Rehberin kapsamı'), findsOneWidget);
        expect(find.text('Uygunluk doğrulandı'), findsOneWidget);
        expect(find.text('Hazırlığı görüntüle'), findsOneWidget);
        expect(requests, isEmpty);
        if (purpose != CommercialPurpose.supplement) {
          expect(find.textContaining('Kaynakta geçen seçenek:'), findsNothing);
          expect(find.textContaining('Bu engel rehberi'), findsOneWidget);
        } else {
          expect(
            find.textContaining('Kaynakta geçen seçenek:'),
            findsNWidgets(2),
          );
        }
      }
    },
  );
  testWidgets(
    'parent amaç değişiminde önceki liste sızmaz; teknik sonuç aynı kalır',
    (t) async {
      final target = existing.guide();
      final result = fit(target);
      await existing.pump(
        t,
        screen(CommercialPurpose.supplement, target: target, result: result),
      );
      expect(find.textContaining('Kaynakta geçen seçenek:'), findsNWidgets(2));
      for (final purpose in [
        CommercialPurpose.salesTarget,
        CommercialPurpose.unknown,
        CommercialPurpose.replaceGuide,
      ]) {
        await existing.pump(t, screen(purpose, target: target, result: result));
        expect(find.textContaining('Kaynakta geçen seçenek:'), findsNothing);
        expect(
          identical(
            t.widget<MotorcycleFitView>(find.byType(MotorcycleFitView)).result,
            result,
          ),
          isTrue,
        );
      }
      await existing.pump(
        t,
        screen(CommercialPurpose.supplement, target: target, result: result),
      );
      expect(find.textContaining('Kaynakta geçen seçenek:'), findsNWidgets(2));
    },
  );
  testWidgets(
    'sponsor sırası veya engel teknik seçimi ve meşru hazırlık isteğinin kimliğini değiştiremez',
    (t) async {
      final target = existing.guide();
      final result = fit(target);
      final requests = <VariantContext>[];
      for (final purpose in CommercialPurpose.values) {
        for (final options in [
          prior.mixed(),
          prior.mixed().reversed.toList(),
        ]) {
          await t.pumpWidget(const SizedBox());
          await existing.pump(
            t,
            screen(
              purpose,
              target: target,
              result: result,
              options: options,
              prepare: requests.add,
            ),
          );
          final texts = t
              .widgetList<Text>(find.byType(Text))
              .map((x) => x.data)
              .whereType<String>()
              .toList();
          expect(
            texts.indexOf('Motosiklete uygunluk'),
            lessThan(texts.indexOf('Ticari bilgi ayrı tutulur')),
          );
          expect(
            identical(
              t
                  .widget<MotorcycleFitView>(find.byType(MotorcycleFitView))
                  .result,
              result,
            ),
            isTrue,
          );
          final before = requests.length;
          await t.ensureVisible(find.text('Hazırlığı görüntüle'));
          await t.tap(find.text('Hazırlığı görüntüle'));
          await t.pump();
          expect(requests.length, before + 1);
          expect(identical(requests.last, target), isTrue);
        }
      }
      expect(requests, hasLength(10));
    },
  );
  testWidgets(
    'ticari amaç veya sponsor eksik eski ve yanlış uygunluk kaynağından hazırlık izni üretemez',
    (t) async {
      final target = existing.guide();
      final requests = <VariantContext>[];
      for (final purpose in CommercialPurpose.values) {
        for (final result in <FitPresentation?>[
          null,
          fit(target, status: FitDisplayStatus.missingDistinction),
          fit(target, current: false),
          fit(target, evidenceContext: existing.guide(bike: 'other')),
          fit(existing.guide(id: 'other')),
        ]) {
          await existing.pump(
            t,
            screen(
              purpose,
              target: target,
              result: result,
              prepare: requests.add,
            ),
          );
          expect(find.text('Hazırlığı görüntüle'), findsNothing);
          expect(find.text('Ayrım henüz yeterli değil'), findsOneWidget);
          expect(requests, isEmpty);
        }
      }
    },
  );
  testWidgets(
    'geçersiz bağlam ve bağlantı sırasında amaç kontrolü eski ticari listeyi geri getirmez',
    (t) async {
      for (final purpose in CommercialPurpose.values) {
        final input = prior.frame(value: source());
        for (final child in [
          preview(
            input,
            purpose: purpose,
            target: existing.guide(bike: 'changed'),
          ),
          preview(
            input,
            purpose: purpose,
            target: existing.guide(rev: 'changed'),
          ),
          preview(input, purpose: purpose, current: false),
          preview(input, purpose: purpose, busy: true),
          preview(input, purpose: purpose, error: 'Kaynak hatası'),
          preview(
            prior.frame(value: source(), online: false),
            purpose: purpose,
          ),
        ]) {
          await existing.pump(t, child);
          expect(find.textContaining('Kaynakta geçen seçenek:'), findsNothing);
          expect(find.text('Hazırlığı görüntüle'), findsNothing);
        }
      }
    },
  );
  testWidgets(
    '20 ticari amaç durumu üç genişlik ve üç ölçekte sona kaydırılır; meşru yollar korunur',
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
    'engellenen ticari alanda okunabilir başlık ve meşru klavye yolu korunur',
    (t) async {
      final semantics = t.ensureSemantics();
      final target = existing.guide();
      final requests = <VariantContext>[];
      await existing.pump(
        t,
        screen(
          CommercialPurpose.salesTarget,
          target: target,
          result: fit(target),
          prepare: requests.add,
        ),
      );
      expect(
        t
            .widgetList<Semantics>(find.byType(Semantics))
            .where(
              (x) =>
                  x.properties.header == true &&
                  x.child is Text &&
                  (x.child! as Text).data == 'Ticari bilgi ayrı tutulur',
            ),
        hasLength(1),
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
      expect(requests.every((x) => identical(x, target)), isTrue);
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
  final prefix = Platform.environment['KAVRIVA_RANKING_PREVIEW'];
  if (prefix != null)
    testWidgets('doğal Flutter ticari ayrım tam kaydırma görselleri', (
      t,
    ) async {
      final font = Platform.environment['KAVRIVA_RANKING_FONT'];
      if (font == null) throw StateError('Sabit font yolu gerekli.');
      await t.runAsync(() async {
        final loader = FontLoader('KavrivaRankingNative')
          ..addFont(
            Future.value(ByteData.sublistView(await File(font).readAsBytes())),
          );
        await loader.load();
      });
      final rows = <String>[];
      for (final entry in cases().entries) {
        await t.pumpWidget(const SizedBox());
        await existing.pump(t, entry.value, font: 'KavrivaRankingNative');
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
