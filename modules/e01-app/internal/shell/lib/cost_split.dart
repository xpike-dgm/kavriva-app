import 'package:flutter/widgets.dart';

import 'duration_range.dart';
import 'variant_resolution.dart';

String _required(String value) {
  if (value.trim().isEmpty) {
    throw ArgumentError('Maliyet bilgisinin bağlamı ve kaynağı boş olamaz.');
  }
  return value;
}

String _date(String value) {
  final match = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$').firstMatch(value);
  if (match == null) throw ArgumentError('Fiyat tarihi gerçek bir gün olmalı.');
  final year = int.parse(match[1]!);
  final month = int.parse(match[2]!);
  final day = int.parse(match[3]!);
  final date = DateTime.utc(year, month, day);
  if (year < 1 || date.year != year || date.month != month || date.day != day) {
    throw ArgumentError('Fiyat tarihi gerçek bir gün olmalı.');
  }
  return value;
}

String _displayDate(String value) =>
    '${value.substring(8)}.${value.substring(5, 7)}.${value.substring(0, 4)}';

enum CostCategory {
  parts('Parça'),
  consumables('Sarf malzemesi'),
  tools('Alet'),
  labor('İşçilik');

  const CostCategory(this.label);
  final String label;
}

/// Kaynaktaki tutar: sıfır açık bir değerdir, eksik tutar null ile ayrılır.
class CostAmount {
  CostAmount({required this.lowerMinor, this.upperMinor}) {
    if (lowerMinor < 0 || (upperMinor != null && upperMinor! < lowerMinor)) {
      throw ArgumentError('Kaynak tutarı negatif veya ters aralık olamaz.');
    }
  }
  final int lowerMinor;
  final int? upperMinor;

  String display({required int fractionDigits, required String currency}) {
    if (fractionDigits < 0 || fractionDigits > 6) {
      throw ArgumentError('Kaynak para hassasiyeti desteklenmiyor.');
    }
    _required(currency);
    String value(int minor) {
      if (fractionDigits == 0) return '$minor';
      final digits = minor.toString().padLeft(fractionDigits + 1, '0');
      final split = digits.length - fractionDigits;
      return '${digits.substring(0, split)},${digits.substring(split)}';
    }

    final upper = upperMinor;
    return '${value(lowerMinor)}${upper == null || upper == lowerMinor ? '' : '–${value(upper)}'} $currency';
  }
}

enum CostSplitState { ready, loading, unknown, held, failed }

/// E1 fiyat üretmez/doğrulamaz; güncellik ve onay çağıranın sunum girdisidir.
class CostSplitSource {
  CostSplitSource({
    required this.context,
    required String documentRevision,
    required this.experience,
    required String source,
    required String version,
    required String priceDate,
    required String checkedDate,
    required String currency,
    required this.fractionDigits,
    required this.current,
    required this.confirmed,
    required this.state,
    required Map<CostCategory, CostAmount?> amounts,
    required List<String>? exclusions,
    required List<String>? assumptions,
    required this.illustrative,
  }) : documentRevision = _required(documentRevision),
       source = _required(source),
       version = _required(version),
       priceDate = _date(priceDate),
       checkedDate = _date(checkedDate),
       currency = _required(currency),
       amounts = Map.unmodifiable(amounts),
       exclusions = exclusions == null
           ? null
           : List.unmodifiable(exclusions.map(_required)),
       assumptions = assumptions == null
           ? null
           : List.unmodifiable(assumptions.map(_required)) {
    if (priceDate.compareTo(checkedDate) > 0) {
      throw ArgumentError('Fiyat tarihi kaynak kontrolünden sonra olamaz.');
    }
    if (fractionDigits < 0 || fractionDigits > 6) {
      throw ArgumentError('Kaynak para hassasiyeti desteklenmiyor.');
    }
  }
  final VariantContext context;
  final String documentRevision;
  final DurationExperience experience;
  final String source;
  final String version;
  final String priceDate;
  final String checkedDate;
  final String currency;
  final int fractionDigits;
  final bool current;
  final bool confirmed;
  final CostSplitState state;
  final Map<CostCategory, CostAmount?> amounts;
  final List<String>? exclusions;
  final List<String>? assumptions;
  final bool illustrative;
}

class CostSplitPresentation {
  CostSplitPresentation({
    required this.context,
    required String documentRevision,
    required this.experience,
    required this.online,
    required this.source,
  }) : documentRevision = _required(documentRevision);
  final VariantContext context;
  final String documentRevision;
  final DurationExperience? experience;
  final bool online;
  final CostSplitSource? source;

  bool readableFor(VariantContext target, {required bool scopeCurrent}) {
    final e = experience;
    final s = source;
    return scopeCurrent &&
        online &&
        context.matches(target) &&
        e != null &&
        s != null &&
        s.current &&
        s.confirmed &&
        target.matches(s.context) &&
        s.documentRevision == documentRevision &&
        e.matches(s.experience);
  }
}

/// Mevcut SCR010 içinde salt bilgi; satın alma, ödeme veya bakım talebi yok.
class CostSplitView extends StatelessWidget {
  const CostSplitView({
    super.key,
    required this.context,
    required this.presentation,
    required this.scopeCurrent,
  });
  final VariantContext context;
  final CostSplitPresentation presentation;
  final bool scopeCurrent;

  @override
  Widget build(BuildContext context) {
    final readable = presentation.readableFor(
      this.context,
      scopeCurrent: scopeCurrent,
    );
    final s = readable ? presentation.source : null;
    final ready = s?.state == CostSplitState.ready;
    final message = !readable
        ? 'Maliyet bilinmiyor. Bu motosiklet, rehber ve deneyim bilgisi için güncel kaynak yok.'
        : switch (s!.state) {
            CostSplitState.ready => 'Kalemler ayrı gösterilir; toplam gider veya kesin fiyat sözü değildir.',
            CostSplitState.loading =>
              'Maliyet bilgisi yükleniyor. Hazır bir tahmin henüz yok.',
            CostSplitState.unknown => 'Kaynakta kullanılabilir maliyet tahmini yok. Maliyet bilinmiyor.',
            CostSplitState.held => 'Maliyet bilgisi henüz doğrulanmadı. Maliyet bilinmiyor; doğrulanmış güncel kaynak gerekli.',
            CostSplitState.failed => 'Maliyet bilgisi alınamadı. Maliyet bilinmiyor; güncel kaynak yeniden kontrol edilmeli.',
          };
    final exclusions = ready ? s!.exclusions : null;
    final assumptions = ready ? s!.assumptions : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(
          header: true,
          child: const Text('Tahmini maliyet', style: TextStyle(fontSize: 20)),
        ),
        const SizedBox(height: 8),
        const Text('Planlama bilgisi · ödeme veya bakım izni değildir.'),
        const SizedBox(height: 8),
        Text(
          presentation.experience == null
              ? 'Deneyim bilgisi yok; sana bir seviye atanmadı.'
              : 'Deneyim bilgisi: ${presentation.experience!.label}',
        ),
        const SizedBox(height: 8),
        Semantics(liveRegion: true, child: Text(message)),
        const SizedBox(height: 8),
        const Text(
          'Motosiklet, rehber veya deneyim bilgisi değişirse önceki fiyat tahmini geçersiz olur. Yeni bilgiler için güncel kaynak kontrol edilmeden eski tahmini kullanma.',
        ),
        for (final category in CostCategory.values) ...[
          const SizedBox(height: 8),
          Text(
            '${category.label}: ${ready && s!.amounts[category] != null ? s.amounts[category]!.display(fractionDigits: s.fractionDigits, currency: s.currency) : 'Bilinmiyor; kaynak tutarı yok veya henüz kullanılamıyor.'}',
          ),
        ],
        const SizedBox(height: 8),
        const Text('Bilinmeyen tutar sıfır veya bedava sayılmaz.'),
        const SizedBox(height: 8),
        Semantics(
          header: true,
          child: const Text('Tahmine dahil olmayan giderler'),
        ),
        if (exclusions == null)
          const Text(
            'Dahil olmayan giderler bilinmiyor; tüm giderlerin dahil olduğunu varsayma.',
          )
        else if (exclusions.isEmpty)
          const Text(
            'Kaynak dahil olmayan bir gider belirtmemiş. Bu, tüm giderlerin dahil olduğu garantisi değildir.',
          )
        else
          for (final item in exclusions) Text('Dahil değil: $item'),
        const SizedBox(height: 8),
        Semantics(header: true, child: const Text('Kaynağın varsayımları')),
        const Text(
          'Kaynakta olmayan bir varsayım eklenmez. Motosiklet, rehber veya deneyim bilgisi değişince eski kaynağın varsayımlarını kullanma.',
        ),
        if (assumptions == null)
          const Text(
            'Varsayımlar bilinmiyor; kaynakta bu bilgi yok veya henüz kullanılamıyor.',
          )
        else if (assumptions.isEmpty)
          const Text(
            'Kaynak bir varsayım belirtmemiş; koşulların değişmeyeceği garantisi değildir.',
          )
        else
          for (final item in assumptions) Text('Varsayım: $item'),
        if (s != null) ...[
          const SizedBox(height: 8),
          Text('Fiyat tarihi: ${_displayDate(s.priceDate)}'),
          Text('Kaynak: ${s.source} · sürüm: ${s.version}'),
          Text('Kaynak kontrol tarihi: ${_displayDate(s.checkedDate)}'),
          if (s.illustrative)
            const Text(
              'Örnek gösterim: tutarlar gerçek motosiklet için doğrulanmış fiyat değildir.',
            ),
        ],
        if (!presentation.online) ...[
          const SizedBox(height: 8),
          const Text('Çevrimdışısın. Eski fiyat güncel tahmin sayılmaz.'),
        ],
        const SizedBox(height: 8),
        const Text(
          'Bu bilgiyi okumak için hesap gerekmez. Motosiklet uygunluğu ve hazırlık ayrıca değerlendirilir; bu alan ödeme veya bakım adımı başlatmaz.',
        ),
      ],
    );
  }
}
