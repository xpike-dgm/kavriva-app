import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

enum GarageActivity { active, inactive }

enum GarageInformation { available, cached, unavailable }

/// Çağıranın sağladığı sunum bilgisi; yetki veya fiziksel doğruluk üretmez.
class GarageNotice {
  GarageNotice({required this.motorcycleId, required this.description}) {
    if (motorcycleId.trim().isEmpty || description.trim().isEmpty) {
      throw ArgumentError('Uyarı motosikleti ve açıklaması gerekli.');
    }
  }
  final String motorcycleId;
  final String description;
}

class GarageMotorcycle {
  GarageMotorcycle({
    required this.id,
    required this.name,
    required this.activity,
    required this.variantDescription,
    this.criticalCorrection,
    this.interruptedWork,
  }) {
    if (id.trim().isEmpty || name.trim().isEmpty) {
      throw ArgumentError('Motosiklet kimliği ve adı gerekli.');
    }
    for (final notice in [criticalCorrection, interruptedWork]) {
      if (notice != null && notice.motorcycleId != id) {
        throw ArgumentError('Uyarı farklı motosiklete ait.');
      }
    }
  }
  final String id;
  final String name;
  final GarageActivity activity;
  final String? variantDescription;
  final GarageNotice? criticalCorrection;
  final GarageNotice? interruptedWork;
}

/// Immutable E1 girdisi. Seçim isteği bu girdiyi değiştirmez.
class GarageSnapshot {
  GarageSnapshot({
    required List<GarageMotorcycle> motorcycles,
    required this.selectedId,
    required this.information,
  }) : motorcycles = List.unmodifiable(motorcycles) {
    final ids = motorcycles.map((bike) => bike.id).toSet();
    if (ids.length != motorcycles.length ||
        (selectedId != null && !ids.contains(selectedId)) ||
        (information == GarageInformation.unavailable &&
            (motorcycles.isNotEmpty || selectedId != null))) {
      throw ArgumentError('Motosiklet bağlamı tutarsız.');
    }
  }
  final List<GarageMotorcycle> motorcycles;
  final String? selectedId;
  final GarageInformation information;

  GarageMotorcycle? get selected => selectedId == null
      ? null
      : motorcycles.firstWhere((bike) => bike.id == selectedId);
}

/// SCR-005/008 bağlamı. Bütün eylemler kimlikli istektir; E3/E5/E4 dışarıda.
/// Aktiflik, uygunluk, kalıcı kayıt veya fiziksel yeniden giriş kararı vermez.
class GarageContextView extends StatelessWidget {
  const GarageContextView({
    super.key,
    required this.snapshot,
    required this.onSelectionRequested,
    required this.onLifecycleRequested,
    required this.onHistoryRequested,
    required this.onCriticalCorrectionRequested,
    required this.onInterruptedWorkRequested,
  });

  final GarageSnapshot snapshot;
  final ValueChanged<String>? onSelectionRequested;
  final ValueChanged<String>? onLifecycleRequested;
  final ValueChanged<String>? onHistoryRequested;
  final ValueChanged<String>? onCriticalCorrectionRequested;
  final ValueChanged<String>? onInterruptedWorkRequested;

  @override
  Widget build(BuildContext context) {
    final bike = snapshot.selected;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Garaj', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            if (snapshot.information == GarageInformation.unavailable)
              const Text('Motosiklet bilgisi şu anda alınamıyor.'),
            if (snapshot.information == GarageInformation.cached)
              const Text(
                'Son alınan bilgi gösteriliyor. Güncel durum ayrıca kontrol edilmelidir.',
              ),
            if (bike != null) ...[
              Semantics(
                header: true,
                child: Text(
                  'Seçili motosiklet: ${bike.name}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Text(
                bike.activity == GarageActivity.active ? 'Aktif motosiklet' : 'İnaktif motosiklet. Geçmiş ve güvenlik bilgileri korunur.',
              ),
              Text(
                bike.variantDescription?.trim().isNotEmpty == true
                    ? bike.variantDescription!
                    : 'Varyant bilgisi henüz net değil.',
              ),
              const Text('Uygulama uygunluğu ayrıca kontrol edilir.'),
              if (bike.criticalCorrection case final notice?)
                _notice(
                  title: 'Önemli güvenlik düzeltmesi',
                  notice: notice,
                  action: 'Güvenlik bilgisini aç',
                  onRequested: onCriticalCorrectionRequested,
                  urgent: true,
                ),
              if (bike.interruptedWork case final notice?)
                _notice(
                  title: 'Yarım kalan çalışma',
                  notice: notice,
                  action: 'Çalışmanın durumunu kontrol et',
                  onRequested: onInterruptedWorkRequested,
                  urgent: false,
                ),
              _GarageAction(
                label: 'Motosikleti yönet',
                onPressed: onLifecycleRequested == null
                    ? null
                    : () => onLifecycleRequested!(bike.id),
              ),
              _GarageAction(
                label: 'Bu motosikletin geçmişini aç',
                onPressed: onHistoryRequested == null
                    ? null
                    : () => onHistoryRequested!(bike.id),
              ),
            ] else if (snapshot.information != GarageInformation.unavailable)
              Text(
                snapshot.motorcycles.isEmpty
                    ? 'Henüz motosiklet bilgisi yok.'
                    : 'Görüntülemek istediğin motosikleti seç.',
              ),
            if (snapshot.motorcycles.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text('Motosiklet değiştir'),
              for (final candidate in snapshot.motorcycles)
                _GarageAction(
                  key: ValueKey('select:${candidate.id}'),
                  label:
                      '${candidate.name} · ${candidate.activity == GarageActivity.active ? 'Aktif' : 'İnaktif'}'
                      '${candidate.criticalCorrection != null ? ' · Güvenlik düzeltmesi var' : ''}',
                  selected: candidate.id == snapshot.selectedId,
                  onPressed: onSelectionRequested == null
                      ? null
                      : () => onSelectionRequested!(candidate.id),
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _notice({
    required String title,
    required GarageNotice notice,
    required String action,
    required ValueChanged<String>? onRequested,
    required bool urgent,
  }) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Semantics(
      liveRegion: urgent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
          Text(notice.description),
          if (!urgent)
            const Text(
              'Kaydedilmiş ilerleme fiziksel durumun doğrulandığı anlamına gelmez.',
            ),
          _GarageAction(
            label: action,
            onPressed: onRequested == null
                ? null
                : () => onRequested(notice.motorcycleId),
          ),
          if (onRequested == null)
            Text(
              urgent
                  ? 'Güvenlik bilgisi şu anda açılamıyor. Uyarıyı göz ardı etmeyin.'
                  : 'Çalışmanın ayrıntıları şu anda açılamıyor. Kaydedilmiş ilerleme devam izni değildir.',
            ),
        ],
      ),
    ),
  );
}

class _GarageAction extends StatefulWidget {
  const _GarageAction({
    super.key,
    required this.label,
    required this.onPressed,
    this.selected = false,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool selected;
  @override
  State<_GarageAction> createState() => _GarageActionState();
}

class _GarageActionState extends State<_GarageAction> {
  bool focused = false;
  @override
  Widget build(BuildContext context) => FocusableActionDetector(
    enabled: widget.onPressed != null,
    onShowFocusHighlight: (value) => setState(() => focused = value),
    shortcuts: const {
      SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
      SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
    },
    actions: {
      ActivateIntent: CallbackAction<ActivateIntent>(
        onInvoke: (_) {
          widget.onPressed?.call();
          return null;
        },
      ),
    },
    child: Semantics(
      button: true,
      enabled: widget.onPressed != null,
      selected: widget.selected,
      label: widget.label,
      onTap: widget.onPressed,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: widget.onPressed,
        behavior: HitTestBehavior.opaque,
        child: Container(
          constraints: const BoxConstraints(minHeight: 52),
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: focused
                  ? const Color(0xFF0E5BD8)
                  : const Color(0xFFCCD5E0),
            ),
          ),
          child: Text(widget.label),
        ),
      ),
    ),
  );
}
