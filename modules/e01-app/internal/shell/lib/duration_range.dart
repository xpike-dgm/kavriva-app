import 'package:flutter/widgets.dart';

import 'variant_resolution.dart';

String _required(String value) {
  if (value.trim().isEmpty) {
    throw ArgumentError('Süre bilgisinin bağlamı ve kaynağı boş olamaz.');
  }
  return value;
}

String _date(String value) {
  final match = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$').firstMatch(value);
  if (match == null) throw ArgumentError('Bilgi tarihi gerçek bir gün olmalı.');
  final year = int.parse(match[1]!);
  final month = int.parse(match[2]!);
  final day = int.parse(match[3]!);
  final date = DateTime.utc(year, month, day);
  if (year < 1 || date.year != year || date.month != month || date.day != day) {
    throw ArgumentError('Bilgi tarihi gerçek bir gün olmalı.');
  }
  return value;
}

String _displayDate(String value) =>
    '${value.substring(8)}.${value.substring(5, 7)}.${value.substring(0, 4)}';

/// Deneyim çağıranın mevcut beyanıdır; bu sunum seviye atamaz.
class DurationExperience {
  DurationExperience({
    required String id,
    required String revision,
    required String label,
  }) : id = _required(id),
       revision = _required(revision),
       label = _required(label);
  final String id;
  final String revision;
  final String label;
  bool matches(DurationExperience other) =>
      id == other.id && revision == other.revision && label == other.label;
}

/// Kaynaktaki aralık; bu sınıf süre hesabı veya kesin bitiş üretmez.
class DurationMinutes {
  DurationMinutes({required this.lower, required this.upper}) {
    if (lower <= 0 || upper <= lower) {
      throw ArgumentError(
        'Süre pozitif alt ve daha büyük üst sınır gerektirir.',
      );
    }
  }
  final int lower;
  final int upper;
}

enum DurationRangeState { ready, loading, unknown, held, failed }

/// Kaynak doğrulaması E1 dışında yapılır; bool alanlar sunum girdisidir.
class DurationRangeSource {
  DurationRangeSource({
    required this.context,
    required String documentRevision,
    required this.experience,
    required String source,
    required String version,
    required String informationDate,
    required String checkedDate,
    required this.current,
    required this.confirmed,
    required this.state,
    required this.range,
    required this.illustrative,
  }) : documentRevision = _required(documentRevision),
       source = _required(source),
       version = _required(version),
       informationDate = _date(informationDate),
       checkedDate = _date(checkedDate) {
    if (informationDate.compareTo(checkedDate) > 0) {
      throw ArgumentError('Bilgi tarihi kaynak kontrolünden sonra olamaz.');
    }
  }
  final VariantContext context;
  final String documentRevision;
  final DurationExperience experience;
  final String source;
  final String version;
  final String informationDate;
  final String checkedDate;
  final bool current;
  final bool confirmed;
  final DurationRangeState state;
  final DurationMinutes? range;
  final bool illustrative;
}

/// Geçerli sunum bağlamı; oturum/uygunluk/hazırlık/deneyim seçimi yapmaz.
class DurationRangePresentation {
  DurationRangePresentation({
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
  final DurationRangeSource? source;

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

/// SCR010 içinde salt bilgi altbölümü; düğme, fiziksel talimat veya izin yok.
class DurationRangeView extends StatelessWidget {
  const DurationRangeView({
    super.key,
    required this.context,
    required this.presentation,
    required this.scopeCurrent,
  });
  final VariantContext context;
  final DurationRangePresentation presentation;
  final bool scopeCurrent;

  @override
  Widget build(BuildContext context) {
    final readable = presentation.readableFor(
      this.context,
      scopeCurrent: scopeCurrent,
    );
    final s = readable ? presentation.source : null;
    final range = s?.state == DurationRangeState.ready ? s?.range : null;
    final experience = presentation.experience;
    final message = !readable
        ? 'Süre bilinmiyor. Bu motosiklet, rehber ve deneyim bilgisi için güncel kaynak yok. Güncel bilgi gelmeden bir süre tahmini kullanma.'
        : switch (s!.state) {
            DurationRangeState.loading =>
              'Süre bilgisi yükleniyor. Hazır bir tahmin henüz yok.',
            DurationRangeState.failed => 'Süre bilgisi alınamadı. Süre bilinmiyor; güncel kaynak yeniden kontrol edilmeli.',
            DurationRangeState.held => 'Süre bilgisi henüz doğrulanmadı. Süre bilinmiyor; doğrulanmış güncel kaynak gerekli.',
            DurationRangeState.unknown =>
              'Kaynakta bu deneyim için süre aralığı yok. Süre bilinmiyor.',
            DurationRangeState.ready =>
              range == null
                  ? 'Kaynakta bu deneyim için süre aralığı yok. Süre bilinmiyor.'
                  : '${range.lower}–${range.upper} dakika',
          };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(
          header: true,
          child: const Text('Tahmini süre', style: TextStyle(fontSize: 20)),
        ),
        const SizedBox(height: 8),
        const Text('Planlama bilgisi · uygulama izni değildir.'),
        const SizedBox(height: 8),
        Text(
          experience == null
              ? 'Deneyim bilgisi yok; sana bir seviye atanmadı.'
              : 'Deneyim bilgisi: ${experience.label}',
        ),
        const SizedBox(height: 8),
        Semantics(liveRegion: true, child: Text(message)),
        if (s != null) ...[
          const SizedBox(height: 8),
          Text('Bilgi tarihi: ${_displayDate(s.informationDate)}'),
          Text('Kaynak: ${s.source} · sürüm: ${s.version}'),
          Text('Kaynak kontrol tarihi: ${_displayDate(s.checkedDate)}'),
          if (s.illustrative)
            const Text(
              'Örnek gösterim: bu değerler gerçek motosiklet için doğrulanmış tahmin değildir.',
            ),
        ],
        if (!presentation.online) ...[
          const SizedBox(height: 8),
          const Text('Çevrimdışısın. Eski bilgi güncel süre tahmini sayılmaz.'),
        ],
        const SizedBox(height: 8),
        const Text(
          'Kesin bitiş sözü değildir; işin koşullarına göre süre değişebilir. Motosiklet uygunluğu ve hazırlık ayrıca değerlendirilir. Deneyim güvenlik kontrollerini kaldırmaz. Bu bilgiyi okumak için hesap gerekmez.',
        ),
      ],
    );
  }
}
