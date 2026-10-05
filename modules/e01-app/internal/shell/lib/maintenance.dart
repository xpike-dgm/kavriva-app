import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

String _identity(String value) => Uri.encodeComponent(value);

String _required(String value) {
  final result = value.trim();
  if (result.isEmpty) throw ArgumentError('Bağlam veya açıklama boş olamaz.');
  return result;
}

class MaintenanceScope {
  MaintenanceScope({
    required String motorcycleId,
    required String contextRevision,
    required String planId,
    required String planRevision,
    required String motorcycleLabel,
  }) : motorcycleId = _required(motorcycleId),
       contextRevision = _required(contextRevision),
       planId = _required(planId),
       planRevision = _required(planRevision),
       motorcycleLabel = _required(motorcycleLabel);
  final String motorcycleId,
      contextRevision,
      planId,
      planRevision,
      motorcycleLabel;
  String get subject => '${_identity(planId)}/${_identity(planRevision)}';
  bool matches(MaintenanceScope other) =>
      motorcycleId == other.motorcycleId &&
      contextRevision == other.contextRevision &&
      planId == other.planId &&
      planRevision == other.planRevision;
}

enum MaintenanceReferenceState { unknown, held, confirmed }

/// E3 tarafından sunulan değerlendirme referansı; istemci gerçeklik üretmez.
class MaintenanceReference {
  MaintenanceReference({
    required this.scope,
    required String requestId,
    required String purpose,
    required String subjectId,
    required String source,
    required String version,
    required String location,
    required String checkedAt,
    required String reason,
    required this.current,
    required this.state,
  }) : requestId = _required(requestId),
       purpose = _required(purpose),
       subjectId = _required(subjectId),
       source = _required(source),
       version = _required(version),
       location = _required(location),
       checkedAt = _required(checkedAt),
       reason = _required(reason);
  final MaintenanceScope scope;
  final String requestId,
      purpose,
      subjectId,
      source,
      version,
      location,
      checkedAt,
      reason;
  final bool current;
  final MaintenanceReferenceState state;
  bool relevant(
    MaintenanceScope expected,
    String request,
    String purpose,
    String subject,
  ) =>
      scope.matches(expected) &&
      requestId == request &&
      current &&
      this.purpose == purpose &&
      subjectId == subject;
  bool confirmed(
    MaintenanceScope expected,
    String request,
    String purpose,
    String subject,
  ) =>
      relevant(expected, request, purpose, subject) &&
      state == MaintenanceReferenceState.confirmed;
}

enum MaintenanceHistoryKind { unknown, userReported, verified }

class MaintenanceHistory {
  MaintenanceHistory({
    required String id,
    required String revision,
    required this.kind,
    required String explanation,
    this.authority,
  }) : id = _required(id),
       revision = _required(revision),
       explanation = _required(explanation);
  final String id, revision, explanation;
  final MaintenanceHistoryKind kind;
  final MaintenanceReference? authority;
  String subject(String item) =>
      '$item/${_identity(id)}/${_identity(revision)}';
}

enum MaintenanceTimingKind { uncertain, supported }

class MaintenanceTiming {
  MaintenanceTiming({
    required this.kind,
    required String label,
    required String explanation,
    this.authority,
  }) : label = _required(label),
       explanation = _required(explanation);
  final MaintenanceTimingKind kind;
  final String label, explanation;
  final MaintenanceReference? authority;
}

enum MaintenanceAction {
  previewGuide,
  recordEntry,
  postponeReminder,
  history,
  source,
  refresh,
  reconcile,
  support,
  exit,
}

enum MaintenanceDimension {
  motorcycle,
  source,
  authorization,
  policy,
  operationIntent,
  audit,
}

/// Yalnız eylem sunumu. Gerçek işlemde E3/E5 kontrolleri tekrar uygulanır.
class MaintenancePermit {
  MaintenancePermit({
    required this.action,
    required Map<MaintenanceDimension, MaintenanceReference?> dimensions,
  }) : dimensions = Map.unmodifiable(dimensions);
  final MaintenanceAction action;
  final Map<MaintenanceDimension, MaintenanceReference?> dimensions;
  bool confirmed(MaintenanceScope scope, String request, String item) =>
      MaintenanceDimension.values.every(
        (dimension) =>
            dimensions[dimension]?.confirmed(
              scope,
              request,
              'maintenance-action:${action.name}',
              '$item/${dimension.name}',
            ) ??
            false,
      );
}

class MaintenanceItem {
  MaintenanceItem({
    required this.scope,
    required String id,
    required String revision,
    required String title,
    required String whyShown,
    required this.timing,
    required this.history,
    this.source,
    required Map<MaintenanceAction, MaintenancePermit> permits,
    String? priorityReason,
    String? knownAge,
    String? nextCheck,
  }) : id = _required(id),
       revision = _required(revision),
       title = _required(title),
       whyShown = _required(whyShown),
       permits = Map.unmodifiable(permits),
       priorityReason = priorityReason == null
           ? null
           : _required(priorityReason),
       knownAge = knownAge == null ? null : _required(knownAge),
       nextCheck = nextCheck == null ? null : _required(nextCheck);
  final MaintenanceScope scope;
  final String id, revision, title, whyShown;
  final MaintenanceTiming timing;
  final MaintenanceHistory history;
  final MaintenanceReference? source;
  final Map<MaintenanceAction, MaintenancePermit> permits;
  final String? priorityReason, knownAge, nextCheck;
  String get subject => '${_identity(id)}/${_identity(revision)}';
  bool sourceConfirmed(MaintenanceScope expected, String request) =>
      scope.matches(expected) &&
      (source?.confirmed(expected, request, 'maintenance-source', subject) ??
          false);
  bool historyConfirmed(MaintenanceScope expected, String request) =>
      history.kind == MaintenanceHistoryKind.verified &&
      (history.authority?.confirmed(
            expected,
            request,
            'maintenance-history',
            history.subject(subject),
          ) ??
          false);
  bool timingConfirmed(MaintenanceScope expected, String request) =>
      sourceConfirmed(expected, request) &&
      historyConfirmed(expected, request) &&
      timing.kind == MaintenanceTimingKind.supported &&
      (timing.authority?.confirmed(
            expected,
            request,
            'maintenance-timing',
            subject,
          ) ??
          false);
  bool permit(
    MaintenanceAction action,
    MaintenanceScope expected,
    String request,
  ) =>
      scope.matches(expected) &&
      permits[action]?.action == action &&
      (permits[action]?.confirmed(expected, request, subject) ?? false);
}

class MaintenanceNotice {
  MaintenanceNotice({
    required String id,
    required String revision,
    required String message,
    required this.authority,
  }) : id = _required(id),
       revision = _required(revision),
       message = _required(message);
  final String id, revision, message;
  final MaintenanceReference? authority;
  String get subject => '${_identity(id)}/${_identity(revision)}';
}

class MaintenancePlan {
  MaintenancePlan({
    required this.scope,
    required String requestId,
    required List<MaintenanceItem> items,
    this.catalogAuthority,
    this.priorityAuthority,
    required List<String> priorityOrder,
    required List<MaintenanceNotice> notices,
  }) : requestId = _required(requestId),
       items = List.unmodifiable(items),
       priorityOrder = List.unmodifiable(priorityOrder),
       notices = List.unmodifiable(notices) {
    if (items.map((v) => v.id).toSet().length != items.length ||
        priorityOrder.toSet().length != priorityOrder.length)
      throw ArgumentError('İş ve öncelik kimlikleri farklı olmalı.');
  }
  final MaintenanceScope scope;
  final String requestId;
  final List<MaintenanceItem> items;
  final List<String> priorityOrder;
  final List<MaintenanceNotice> notices;
  final MaintenanceReference? catalogAuthority, priorityAuthority;
  bool valid(MaintenanceScope expected, String request) =>
      scope.matches(expected) &&
      requestId == request &&
      (catalogAuthority?.confirmed(
            expected,
            request,
            'maintenance-plan',
            expected.subject,
          ) ??
          false);
  List<MaintenanceItem> ownItems(MaintenanceScope expected) =>
      items.where((i) => i.scope.matches(expected)).toList();
  bool priorityConfirmed(MaintenanceScope expected, String request) =>
      valid(expected, request) &&
      priorityOrder.isNotEmpty &&
      priorityOrder.every(
        (id) => ownItems(expected).any(
          (i) =>
              i.id == id &&
              i.sourceConfirmed(expected, request) &&
              i.priorityReason != null,
        ),
      ) &&
      (priorityAuthority?.confirmed(
            expected,
            request,
            'maintenance-priority',
            '${expected.subject}/members:${ownItems(expected).map((i) => i.subject).join(',')}/order:${priorityOrder.map((id) => ownItems(expected).firstWhere((i) => i.id == id).subject).join(',')}',
          ) ??
          false);
}

enum MaintenancePage { plan, detail, catchUp }

enum MaintenanceRequestPhase { idle, submitting, failed, outcomeUnknown }

class MaintenanceIntent {
  const MaintenanceIntent({
    required this.action,
    required this.scope,
    required this.requestId,
    this.itemId,
    this.itemRevision,
  });
  final MaintenanceAction action;
  final MaintenanceScope scope;
  final String requestId;
  final String? itemId, itemRevision;
}

class MaintenanceView extends StatefulWidget {
  MaintenanceView({
    super.key,
    required this.scope,
    required String requestId,
    required String brandLabel,
    required this.plan,
    this.initialPage = MaintenancePage.plan,
    this.initialItemId,
    this.phase = MaintenanceRequestPhase.idle,
    this.onIntent,
  }) : requestId = _required(requestId),
       brandLabel = _required(brandLabel);
  final MaintenanceScope scope;
  final String requestId, brandLabel;
  final MaintenancePlan? plan;
  final MaintenancePage initialPage;
  final String? initialItemId;
  final MaintenanceRequestPhase phase;
  final ValueChanged<MaintenanceIntent>? onIntent;
  @override
  State<MaintenanceView> createState() => _MaintenanceViewState();
}

class _MaintenanceViewState extends State<MaintenanceView> {
  late MaintenancePage page;
  String? selectedItem;
  bool sourceExpanded = false, sent = false;
  @override
  void initState() {
    super.initState();
    page = widget.initialPage;
    selectedItem = widget.initialItemId;
  }

  @override
  void didUpdateWidget(MaintenanceView oldWidget) {
    super.didUpdateWidget(oldWidget);
    final contextChanged =
        !oldWidget.scope.matches(widget.scope) ||
        oldWidget.requestId != widget.requestId;
    final navigationChanged =
        oldWidget.initialItemId != widget.initialItemId ||
        oldWidget.initialPage != widget.initialPage;
    if (contextChanged || navigationChanged) {
      page = widget.initialPage;
      selectedItem = widget.initialItemId;
      sourceExpanded = false;
    }
    if (!identical(oldWidget.plan, widget.plan)) sourceExpanded = false;
    if (contextChanged) sent = false;
  }

  bool get planValid =>
      widget.plan?.valid(widget.scope, widget.requestId) ?? false;
  List<MaintenanceItem> get items =>
      planValid ? widget.plan!.ownItems(widget.scope) : const [];
  MaintenanceItem? get item {
    for (final i in items) {
      if (i.id == selectedItem) return i;
    }
    return null;
  }

  VoidCallback boundEvent(VoidCallback callback) {
    final originalScope = widget.scope;
    final originalRequest = widget.requestId;
    return () {
      if (!mounted ||
          !originalScope.matches(widget.scope) ||
          originalRequest != widget.requestId)
        return;
      callback();
    };
  }

  bool get normal => widget.phase == MaintenanceRequestPhase.idle && !sent;
  void emit(MaintenanceAction action, [MaintenanceItem? target]) {
    if (widget.onIntent == null) return;
    if (action == MaintenanceAction.previewGuide ||
        action == MaintenanceAction.recordEntry ||
        action == MaintenanceAction.postponeReminder) {
      MaintenanceItem? currentTarget;
      if (target != null && target.scope.matches(widget.scope)) {
        for (final candidate in items) {
          if (candidate.id == target.id &&
              candidate.revision == target.revision) {
            currentTarget = candidate;
            break;
          }
        }
      }
      if (!normal ||
          !planValid ||
          currentTarget == null ||
          !currentTarget.permit(action, widget.scope, widget.requestId))
        return;
      target = currentTarget;
      if (action == MaintenanceAction.postponeReminder)
        setState(() => sent = true);
    }
    if (action == MaintenanceAction.reconcile &&
        widget.phase != MaintenanceRequestPhase.outcomeUnknown)
      return;
    widget.onIntent!(
      MaintenanceIntent(
        action: action,
        scope: widget.scope,
        requestId: widget.requestId,
        itemId: target?.id,
        itemRevision: target?.revision,
      ),
    );
  }

  Widget text(
    String value, {
    double size = 16,
    FontWeight weight = FontWeight.normal,
  }) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(
      value,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        height: 1.35,
        color: const Color(0xFF172033),
      ),
    ),
  );
  Widget heading(String value) => Semantics(
    header: true,
    child: text(value, size: 22, weight: FontWeight.w700),
  );
  Widget panel(List<Widget> children, {bool caution = false}) => Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 16),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: caution ? const Color(0xFFFAF4E9) : const Color(0xFFF4F7FB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    ),
  );
  Widget action(
    String label,
    MaintenanceAction action, {
    MaintenanceItem? target,
    bool primary = false,
    bool gated = false,
  }) {
    final available =
        widget.onIntent != null &&
        (!gated ||
            normal &&
                planValid &&
                target != null &&
                target.permit(action, widget.scope, widget.requestId));
    return _MaintenanceAction(
      key: ValueKey(
        'maintenance-action-${action.name}${target == null ? '' : '-${target.id}'}',
      ),
      label: label,
      primary: primary,
      onActivate: available ? boundEvent(() => emit(action, target)) : null,
    );
  }

  List<Widget> notices() {
    final notices = planValid
        ? widget.plan!.notices
        : const <MaintenanceNotice>[];
    return notices.map((n) {
      final valid =
          n.authority?.confirmed(
            widget.scope,
            widget.requestId,
            'maintenance-notice',
            n.subject,
          ) ??
          false;
      return panel([
        heading(
          valid
              ? 'Önemli güvenlik bilgisi'
              : 'Güvenlik bilgisi kontrol edilmeli',
        ),
        text(
          valid
              ? n.message
              : 'Bu motosiklete ait güncel uyarı bilgisi henüz doğrulanamadı.',
        ),
        text(
          'Rutin hatırlatmayı ertelemek bu uyarıyı kaldırmaz. Bu ekran sürüş izni vermez.',
        ),
        action('Güvenli destek yolları', MaintenanceAction.support),
      ], caution: true);
    }).toList();
  }

  List<Widget> requestStatus() => switch (widget.phase) {
    MaintenanceRequestPhase.outcomeUnknown => [
      panel([
        heading('İşlem sonucu henüz net değil'),
        text(
          'İsteğin başarılı veya başarısız olduğu doğrulanmadı. İşlemi yeniden başlatma; önce aynı isteğin sonucunu kontrol et.',
        ),
        action('Aynı isteğin sonucunu kontrol et', MaintenanceAction.reconcile),
      ], caution: true),
    ],
    MaintenanceRequestPhase.submitting => [
      Semantics(
        liveRegion: true,
        child: panel([
          heading('İstek işleniyor'),
          text(
            'Sonuç doğrulanana kadar yeni işlem başlatılamaz. Bakım tamamlanmış sayılmaz.',
          ),
        ]),
      ),
    ],
    MaintenanceRequestPhase.failed => [
      Semantics(
        liveRegion: true,
        child: panel([
          heading('İşlem başlatılamadı'),
          text(
            'Bilgileri yeniden kontrol ederek devam yolunu öğrenebilirsin. Bu hata bakımın tamamlandığı anlamına gelmez; geçerli iş kaydı ayrıca kontrol edilmelidir.',
          ),
          action('Bilgileri yeniden kontrol et', MaintenanceAction.refresh),
        ], caution: true),
      ),
    ],
    MaintenanceRequestPhase.idle =>
      sent
          ? [
              Semantics(
                liveRegion: true,
                child: panel([
                  heading('İstek gönderildi'),
                  text(
                    'Sonuç bekleniyor. Hatırlatma değişti veya bakım tamamlandı diye kabul edilmedi.',
                  ),
                ]),
              ),
            ]
          : [],
  };
  Widget itemRow(
    MaintenanceItem target, {
    bool primary = false,
  }) => _MaintenanceAction(
    key: ValueKey('maintenance-item-${target.id}'),
    primary: primary,
    label: primary
        ? 'Bu işin ayrıntısını aç'
        : '${target.title}\n${target.timingConfirmed(widget.scope, widget.requestId) ? target.timing.label : 'Bakım zamanı net değil'}',
    onActivate: boundEvent(
      () => setState(() {
        page = MaintenancePage.detail;
        selectedItem = target.id;
        sourceExpanded = false;
      }),
    ),
  );
  List<Widget> planBody() {
    if (!planValid)
      return [
        panel([
          heading('Bakım bilgisi henüz hazır değil'),
          text(
            'Bu motosikletin güncel bakım planı doğrulanamadı. Tarih, kilometre veya gecikmiş bakım tahmini gösterilmiyor.',
          ),
          action('Geçmiş kaydını incele', MaintenanceAction.history),
          action('Bilgileri yeniden kontrol et', MaintenanceAction.refresh),
        ], caution: true),
      ];
    if (items.isEmpty)
      return [
        panel([
          heading('Bu planda gösterilebilen bakım işi yok'),
          text(
            'Bu, bütün bakımların tamamlandığı anlamına gelmez. Geçmiş kaydı ve bakım kaynağı ayrıca kontrol edilebilir.',
          ),
        ]),
      ];
    return [
      text(
        'Bakım işini açarak neden burada olduğunu ve sıradaki yolu görebilirsin.',
      ),
      for (final target in items) itemRow(target),
      _MaintenanceAction(
        key: const ValueKey('maintenance-open-catchup'),
        label: 'Biriken işleri ve öncelikleri incele',
        onActivate: boundEvent(
          () => setState(() {
            page = MaintenancePage.catchUp;
            selectedItem = null;
            sourceExpanded = false;
          }),
        ),
      ),
    ];
  }

  List<Widget> detailBody() {
    final target = item;
    if (target == null)
      return [
        panel([
          heading('Bu bakım işi henüz doğrulanamadı'),
          text(
            'Güncel motosiklet ve planla eşleşmeyen ayrıntılar gösterilmiyor.',
          ),
        ], caution: true),
        returnPlan(),
      ];
    final supported = target.timingConfirmed(widget.scope, widget.requestId);
    final source = target.sourceConfirmed(widget.scope, widget.requestId);
    final verified = target.historyConfirmed(widget.scope, widget.requestId);
    final historyReadable =
        target.history.authority?.confirmed(
          widget.scope,
          widget.requestId,
          'maintenance-history',
          target.history.subject(target.subject),
        ) ??
        false;
    final preview = <Widget>[
      const SizedBox(height: 12),
      text(
        'Bu yalnız önizleme. Bugün bakım gerekliliği veya uygulama izni değildir. Motosiklete uygunluk ve bütün hazırlık koşulları ayrıca kontrol edilir.',
      ),
      action(
        'Rehber önizlemesini aç',
        MaintenanceAction.previewGuide,
        target: target,
        primary: supported,
        gated: true,
      ),
    ];
    final history = <Widget>[
      const SizedBox(height: 18),
      heading(
        supported ? 'Kaynak ve geçmiş bilgisi' : 'Eksik bilgiyi kontrol et',
      ),
      text(
        verified
            ? 'Kullanılabilir doğrulanmış yapılmış bakım geçmişi sunuldu.'
            : target.history.kind == MaintenanceHistoryKind.userReported &&
                  historyReadable
            ? 'Kullanıcı beyanı var. Yalnız kaydedilmiş olması, bakımın doğrulandığı anlamına gelmez.'
            : 'Kullanılabilir doğrulanmış bakım geçmişi henüz yok.',
      ),
      if (historyReadable) text(target.history.explanation),
      action(
        'Geçmiş ve kanıtı incele',
        MaintenanceAction.history,
        target: target,
        primary: !supported && source && !verified,
      ),
      action(
        'Bakım kaynağını kontrol et',
        MaintenanceAction.source,
        target: target,
        primary: !supported && (!source || verified),
      ),
      if (source) ...[
        _MaintenanceAction(
          key: const ValueKey('maintenance-source-details'),
          label: sourceExpanded
              ? 'Kaynak ayrıntılarını kapat'
              : 'Kaynak ayrıntılarını göster',
          onActivate: boundEvent(
            () => setState(() => sourceExpanded = !sourceExpanded),
          ),
        ),
        if (sourceExpanded)
          panel([
            text('Kaynak: ${target.source!.source}'),
            text(
              'Sürüm: ${target.source!.version} · ${target.source!.location}',
            ),
            text('Kontrol zamanı: ${target.source!.checkedAt}'),
            text(
              'Kaynak bilgisi bakımın yapıldığını veya sürüş güvenliğini tek başına doğrulamaz.',
            ),
          ]),
      ],
    ];
    return [
      if (!supported) heading(target.title),
      panel([
        heading(
          supported
              ? target.timing.label
              : 'Zaman bilgisi henüz desteklenmiyor',
        ),
        text(
          supported ? target.timing.explanation : 'Uygulanabilir bakım kaynağı ve doğrulanmış yapılmış bakım geçmişi yeterli değil. Tarih, kilometre veya gecikme durumu tahmin edilmiyor.',
        ),
        if (!supported)
          text(
            !source
                ? 'Bakım kaynağı güncel ve bu motosiklete uygulanabilir olarak doğrulanamadı.'
                : !verified
                ? 'Yapılan bakım geçmişi kullanılabilir doğrulanmış kayıtla desteklenmiyor.'
                : 'Bakım zamanına ait güncel değerlendirme henüz desteklenmiyor.',
          ),
      ], caution: !supported),
      heading('Bu işi neden görüyorsun?'),
      text(
        source ? target.whyShown : 'Bu işin bakım kaynağı kontrol edilmeli. Kaynağı doğrulanmadan kesin bakım gerekliliği söylenemez.',
      ),
      if (supported) ...[
        ...preview,
        ...history,
      ] else ...[
        ...history,
        const SizedBox(height: 18),
        heading('Bilgi için rehber önizlemesi'),
        ...preview,
      ],
      const SizedBox(height: 18),
      heading('Gerçekte yapılan bakım'),
      text(
        'Bu ayrı yol yalnız gerçekte yapılan işi ve kaydın kimden geldiğini belirtmek içindir. Burada bir düğmeye basmak bakım yapıldığı anlamına gelmez.',
      ),
      action(
        'Yapılan bakımı kaydetme yolunu aç',
        MaintenanceAction.recordEntry,
        target: target,
        gated: true,
      ),
      const SizedBox(height: 18),
      heading('Rutin hatırlatma'),
      text(
        'Daha sonra hatırlat yalnız rutin hatırlatma isteğidir. Bakımı tamamlanmış yapmaz; kritik güvenlik uyarısını gizlemez. Hatırlatma değişikliği ancak sonucu doğrulandığında geçerli olur.',
      ),
      action(
        'Daha sonra hatırlat',
        MaintenanceAction.postponeReminder,
        target: target,
        gated: true,
      ),
      if (!target.permit(
        MaintenanceAction.postponeReminder,
        widget.scope,
        widget.requestId,
      ))
        text('Hatırlatmayı değiştirmek için güncel işlem kontrolü gerekir.'),
      returnPlan(),
    ];
  }

  Widget returnPlan() => _MaintenanceAction(
    key: const ValueKey('maintenance-return-plan'),
    label: 'Tüm bakım planına dön',
    onActivate: boundEvent(
      () => setState(() {
        page = MaintenancePage.plan;
        selectedItem = null;
        sourceExpanded = false;
      }),
    ),
  );
  List<Widget> catchUpBody() {
    final confirmed =
        widget.plan?.priorityConfirmed(widget.scope, widget.requestId) ?? false;
    if (!confirmed)
      return [
        panel([
          heading('Öncelik sırası henüz doğrulanmadı'),
          text(
            'Sırf gecikme veya işin adı yeterli değildir. Güncel güvenlik ve kullanım etkisiyle desteklenmiş sıra gerekir. Eksik bilgilere dayanarak ilk iş seçilmiyor.',
          ),
        ], caution: true),
        for (final target in items) itemRow(target),
        returnPlan(),
      ];
    final ordered = widget.plan!.priorityOrder
        .map((id) => items.firstWhere((i) => i.id == id))
        .toList();
    final first = ordered.first;
    return [
      text(
        'Biriken işler sakin bir sırayla gösterilir. İlk iş yalnız güncel kaynakla desteklenen güvenlik ve kullanım etkisine göre sunulur.',
      ),
      panel([
        text('Önce kontrol edilecek iş', weight: FontWeight.w600),
        heading(first.title),
        text(first.priorityReason!),
        text(
          first.knownAge ??
              'Konunun yaşı için yeterli bilgi yok; değer tahmin edilmiyor.',
        ),
        text(
          first.nextCheck ?? 'Sonraki kontrol bilgisi henüz desteklenmiyor; güncel kaynak kontrol edilmeli.',
        ),
        text('Öncelik sırası, bakımın zamanı veya yapıldığı anlamına gelmez.'),
        itemRow(first, primary: true),
      ]),
      heading('Sıradaki işler'),
      for (final target in ordered.skip(1)) ...[
        text(target.priorityReason!),
        itemRow(target),
      ],
      if (items.any((i) => !widget.plan!.priorityOrder.contains(i.id))) ...[
        heading('Plandaki diğer işler'),
        for (final target in items.where(
          (i) => !widget.plan!.priorityOrder.contains(i.id),
        ))
          itemRow(target),
      ],
      returnPlan(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final title = page == MaintenancePage.plan
        ? 'Bakım planı'
        : page == MaintenancePage.catchUp
        ? 'Biriken işler ve öncelikler'
        : item == null
        ? 'Bakım ayrıntısı'
        : item!.timingConfirmed(widget.scope, widget.requestId)
        ? item!.title
        : 'Bakım zamanı net değil';
    return ColoredBox(
      color: const Color(0xFFFFFFFF),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: SingleChildScrollView(
            key: const ValueKey('maintenance-scroll'),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(widget.brandLabel, size: 14),
                text('Motosikletim: ${widget.scope.motorcycleLabel}', size: 14),
                const SizedBox(height: 18),
                Semantics(
                  header: true,
                  child: text(title, size: 32, weight: FontWeight.w700),
                ),
                ...notices(),
                ...requestStatus(),
                ...switch (page) {
                  MaintenancePage.plan => planBody(),
                  MaintenancePage.detail => detailBody(),
                  MaintenancePage.catchUp => catchUpBody(),
                },
                const SizedBox(height: 24),
                action(
                  'Motosikletimin geçmişini incele',
                  MaintenanceAction.history,
                ),
                action(
                  'Güvenli destek yollarına git',
                  MaintenanceAction.support,
                ),
                action('Bu ekrandan çık', MaintenanceAction.exit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MaintenanceAction extends StatefulWidget {
  const _MaintenanceAction({
    super.key,
    required this.label,
    required this.onActivate,
    this.primary = false,
  });
  final String label;
  final VoidCallback? onActivate;
  final bool primary;
  @override
  State<_MaintenanceAction> createState() => _MaintenanceActionState();
}

class _MaintenanceActionState extends State<_MaintenanceAction> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    final enabled = widget.onActivate != null;
    final filled = widget.primary && enabled;
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: FocusableActionDetector(
        enabled: enabled,
        onShowFocusHighlight: (value) => setState(() => focused = value),
        shortcuts: const {
          SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
          SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
        },
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              widget.onActivate?.call();
              return null;
            },
          ),
        },
        child: Semantics(
          button: true,
          enabled: enabled,
          onTap: widget.onActivate,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onActivate,
            child: Container(
              constraints: const BoxConstraints(minHeight: 52),
              padding: const EdgeInsets.all(16),
              alignment: widget.primary
                  ? Alignment.center
                  : Alignment.centerLeft,
              decoration: BoxDecoration(
                color: filled
                    ? const Color(0xFF0E5BD8)
                    : const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  width: focused ? 3 : 1,
                  color: focused
                      ? filled
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF0E5BD8)
                      : const Color(0xFFC5CFDF),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      '${widget.label}${enabled ? '' : ' — şu anda kapalı'}',
                      style: TextStyle(
                        fontSize: widget.primary ? 18 : 16,
                        height: 1.35,
                        color: filled
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF172033),
                        fontWeight: widget.primary
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  if (!widget.primary)
                    const ExcludeSemantics(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          '›',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF526079),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
