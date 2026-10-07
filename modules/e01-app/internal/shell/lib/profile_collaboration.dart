import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

String _required(String value) {
  final result = value.trim();
  if (result.isEmpty) throw ArgumentError('Bağlam veya açıklama boş olamaz.');
  return result;
}

String _identity(String? value) => value == null
    ? '-'
    : '${value.codeUnits.length}:${value.codeUnits.map((x) => x.toRadixString(16).padLeft(4, '0')).join()}';

class ProfileLocalScope {
  ProfileLocalScope({required String id, required String revision})
    : id = _required(id),
      revision = _required(revision);
  final String id, revision;
  String get subject => '${_identity(id)}/${_identity(revision)}';
  bool matches(ProfileLocalScope other) =>
      id == other.id && revision == other.revision;
}

class ProfileScope {
  ProfileScope({
    required this.local,
    String? accountId,
    String? accountRevision,
    String? motorcycleId,
    String? contextRevision,
  }) : accountId = accountId == null ? null : _required(accountId),
       accountRevision = accountRevision == null
           ? null
           : _required(accountRevision),
       motorcycleId = motorcycleId == null ? null : _required(motorcycleId),
       contextRevision = contextRevision == null
           ? null
           : _required(contextRevision) {
    if ((this.accountId == null) != (this.accountRevision == null) ||
        (this.motorcycleId == null) != (this.contextRevision == null)) {
      throw ArgumentError('Hedef kimliği ve revizyonu birlikte gerekir.');
    }
  }
  final ProfileLocalScope local;
  final String? accountId, accountRevision, motorcycleId, contextRevision;
  String get subject =>
      '${local.subject}/${_identity(accountId)}/${_identity(accountRevision)}/'
      '${_identity(motorcycleId)}/${_identity(contextRevision)}';
  bool matches(ProfileScope other) =>
      local.matches(other.local) &&
      accountId == other.accountId &&
      accountRevision == other.accountRevision &&
      motorcycleId == other.motorcycleId &&
      contextRevision == other.contextRevision;
}

enum ProfileReferenceState { unknown, held, confirmed }

enum ProfileReadDimension { context, source, identity, policy }

enum ProfileEffectDimension {
  context,
  source,
  identity,
  policy,
  operation,
  audit,
}

enum ProfileScreen { intro, migration, collaboration }

enum ProfileState {
  unknown,
  ready,
  conflict,
  partial,
  failed,
  rollback,
  completed,
  revoked,
}

enum ProfileAction {
  localContinue,
  createProfile,
  reviewConflict,
  requestTransfer,
  invite,
  revoke,
  support,
}

/// Güvenilir dış üreticinin sunum referansı; E1 izin veya sonuç üretmez.
class ProfileReference {
  ProfileReference({
    required this.scope,
    required String requestId,
    required String purpose,
    required String subjectId,
    required String source,
    required String version,
    required String checkedAt,
    required String reason,
    required this.current,
    required this.state,
  }) : requestId = _required(requestId),
       purpose = _required(purpose),
       subjectId = _required(subjectId),
       source = _required(source),
       version = _required(version),
       checkedAt = _required(checkedAt),
       reason = _required(reason);
  final ProfileScope scope;
  final String requestId,
      purpose,
      subjectId,
      source,
      version,
      checkedAt,
      reason;
  final bool current;
  final ProfileReferenceState state;
  bool confirmed(
    ProfileScope target,
    String request,
    String use,
    String subject,
  ) =>
      state == ProfileReferenceState.confirmed &&
      current &&
      scope.matches(target) &&
      requestId == request &&
      purpose == use &&
      subjectId == subject;
}

class ProfileEntry {
  ProfileEntry({
    required String id,
    required String label,
    required String source,
    required String date,
    required String detail,
  }) : id = _required(id),
       label = _required(label),
       source = _required(source),
       date = _required(date),
       detail = _required(detail);
  final String id, label, source, date, detail;
  String get key => 'entry/${_identity(id)}';
  List<String> get identity => [id, label, source, date, detail];
}

class ProfileDocument {
  ProfileDocument({
    required String id,
    required String revision,
    required this.screen,
    required this.state,
    required Map<String, String> values,
    required List<ProfileEntry> entries,
    String? targetId,
  }) : id = _required(id),
       revision = _required(revision),
       targetId = targetId == null ? null : _required(targetId),
       values = Map.unmodifiable(
         values.map((k, v) => MapEntry(_required(k), _required(v))),
       ),
       entries = List.unmodifiable(entries) {
    if (this.values.length != values.length ||
        this.entries.map((e) => e.id).toSet().length != this.entries.length) {
      throw ArgumentError('Kayıt kimliği tekrarlanamaz.');
    }
  }
  final String id, revision;
  final String? targetId;
  final ProfileScreen screen;
  final ProfileState state;
  final Map<String, String> values;
  final List<ProfileEntry> entries;
  String get subject {
    final keys = values.keys.toList()..sort();
    return [
      id,
      revision,
      screen.name,
      state.name,
      _identity(targetId),
      'values:${values.length}',
      for (final k in keys) ...[k, values[k]!],
      'entries:${entries.length}',
      for (final e in entries) ...e.identity,
    ].map(_identity).join('/');
  }

  Iterable<String> get privateKeys => [
    for (final k in values.keys) 'value/${_identity(k)}',
    for (final e in entries) e.key,
  ];
}

class ProfileSnapshot {
  ProfileSnapshot({
    required this.scope,
    required String requestId,
    required this.document,
    this.authority,
    this.outcome,
    required Map<ProfileReadDimension, ProfileReference?> reads,
    required Map<String, ProfileReference?> fields,
    required Map<ProfileAction, ProfileReference?> actions,
    required Map<ProfileEffectDimension, ProfileReference?> effects,
    this.offline = false,
  }) : requestId = _required(requestId),
       reads = Map.unmodifiable(reads),
       fields = Map.unmodifiable(fields),
       actions = Map.unmodifiable(actions),
       effects = Map.unmodifiable(effects);
  final ProfileScope scope;
  final String requestId;
  final ProfileDocument? document;
  final ProfileReference? authority, outcome;
  final Map<ProfileReadDimension, ProfileReference?> reads;
  final Map<String, ProfileReference?> fields;
  final Map<ProfileAction, ProfileReference?> actions;
  final Map<ProfileEffectDimension, ProfileReference?> effects;
  final bool offline;

  bool readableFor(ProfileScreen screen) {
    final d = document;
    if (d == null ||
        d.screen != screen ||
        (screen != ProfileScreen.intro && scope.accountId == null) ||
        (screen == ProfileScreen.collaboration && scope.motorcycleId == null))
      return false;
    return (authority?.confirmed(
              scope,
              requestId,
              'profile-document',
              d.subject,
            ) ??
            false) &&
        ProfileReadDimension.values.every(
          (x) =>
              reads[x]?.confirmed(
                scope,
                requestId,
                'profile-read',
                '${d.subject}/${x.name}',
              ) ??
              false,
        );
  }

  bool fieldAllowed(ProfileScreen screen, String key) =>
      readableFor(screen) &&
      (fields[key]?.confirmed(
            scope,
            requestId,
            'profile-field',
            '${document!.subject}/$key',
          ) ??
          false);
  bool get allPrivateReadable =>
      document != null &&
      document!.privateKeys.every((key) => fieldAllowed(document!.screen, key));
  bool resultConfirmed(ProfileScreen screen) =>
      readableFor(screen) &&
      (outcome?.confirmed(
            scope,
            requestId,
            'profile-outcome',
            '${document!.subject}/${document!.state.name}',
          ) ??
          false);
  bool actionAllowed(ProfileScreen screen, ProfileAction action) {
    if (action == ProfileAction.localContinue ||
        action == ProfileAction.support)
      return true;
    if (!readableFor(screen) ||
        !allPrivateReadable ||
        document!.state == ProfileState.unknown)
      return false;
    final d = document!;
    if (!{'context', 'source', 'checkedAt'}.every(d.values.containsKey) ||
        (screen == ProfileScreen.migration && d.entries.isEmpty) ||
        (screen == ProfileScreen.collaboration &&
            (d.targetId == null ||
                !{
                  'owner',
                  'person',
                  'role',
                  'access',
                  'attribution',
                  'privateScope',
                }.every(d.values.containsKey))))
      return false;
    final fitting = switch (action) {
      ProfileAction.createProfile =>
        screen == ProfileScreen.intro && d.state == ProfileState.ready,
      ProfileAction.reviewConflict =>
        screen == ProfileScreen.migration &&
            {
              ProfileState.conflict,
              ProfileState.partial,
              ProfileState.failed,
              ProfileState.rollback,
            }.contains(d.state),
      ProfileAction.requestTransfer =>
        screen == ProfileScreen.migration && d.state == ProfileState.ready,
      ProfileAction.invite || ProfileAction.revoke =>
        screen == ProfileScreen.collaboration && d.state == ProfileState.ready,
      _ => false,
    };
    if (!fitting ||
        !(actions[action]?.confirmed(
              scope,
              requestId,
              'profile-action',
              '${d.subject}/${action.name}',
            ) ??
            false))
      return false;
    // İnceleme okuma niyeti; yazma isteği değildir. Diğerleri yalnız çevrimiçi
    // güncel altı etki referansıyla dış değerlendirme isteği olabilir.
    return action == ProfileAction.reviewConflict ||
        (!offline &&
            ProfileEffectDimension.values.every(
              (x) =>
                  effects[x]?.confirmed(
                    scope,
                    requestId,
                    'profile-effect',
                    '${d.subject}/${x.name}',
                  ) ??
                  false,
            ));
  }
}

class ProfileIntent {
  const ProfileIntent({
    required this.action,
    required this.local,
    required this.requestId,
    required this.subjectId,
    this.target,
    this.targetId,
  });
  final ProfileAction action;
  final ProfileLocalScope local;
  final String requestId, subjectId;
  final ProfileScope? target;
  final String? targetId;
}

class ProfileCollaborationView extends StatefulWidget {
  const ProfileCollaborationView({
    super.key,
    required this.screen,
    required this.snapshot,
    this.onIntent,
  });
  final ProfileScreen screen;
  final ProfileSnapshot snapshot;
  final ValueChanged<ProfileIntent>? onIntent;
  @override
  State<ProfileCollaborationView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileCollaborationView> {
  final sent = <String>{};
  final sentSubjects = <String, String>{};
  bool expanded = false;
  String presentationKey(ProfileSnapshot s) =>
      '${s.scope.subject}/${s.document?.subject}/${widget.screen.name}';
  @override
  void didUpdateWidget(covariant ProfileCollaborationView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.screen != widget.screen ||
        !oldWidget.snapshot.scope.matches(widget.snapshot.scope) ||
        oldWidget.snapshot.requestId != widget.snapshot.requestId ||
        oldWidget.snapshot.document?.subject !=
            widget.snapshot.document?.subject) {
      expanded = false;
    }
  }

  VoidCallback detailsCallback() {
    final old = widget.snapshot, screen = widget.screen;
    return () {
      final s = widget.snapshot;
      if (screen != widget.screen ||
          !s.scope.matches(old.scope) ||
          s.requestId != old.requestId ||
          s.document?.subject != old.document?.subject)
        return;
      setState(() => expanded = !expanded);
    };
  }

  String lockKey(ProfileSnapshot s, ProfileAction a) =>
      '${s.scope.local.subject}/${_identity(s.requestId)}/${a.name}';
  bool safe(ProfileAction a) =>
      a == ProfileAction.localContinue || a == ProfileAction.support;
  VoidCallback? callback(ProfileAction action) {
    final old = widget.snapshot,
        screen = widget.screen,
        handler = widget.onIntent;
    bool allowed(ProfileSnapshot s) =>
        s.actionAllowed(widget.screen, action) &&
        (safe(action) || !sent.contains(lockKey(s, action)));
    if (handler == null || !allowed(old)) return null;
    return () {
      final s = widget.snapshot;
      if (!s.scope.local.matches(old.scope.local) ||
          s.requestId != old.requestId ||
          widget.onIntent != handler ||
          !allowed(s))
        return;
      if (!safe(action) &&
          (screen != widget.screen ||
              !s.scope.matches(old.scope) ||
              s.document?.subject != old.document?.subject ||
              s.offline != old.offline))
        return;
      if (!safe(action))
        setState(() {
          final key = lockKey(s, action);
          sent.add(key);
          sentSubjects[key] = presentationKey(s);
        });
      handler(
        ProfileIntent(
          action: action,
          local: s.scope.local,
          requestId: s.requestId,
          subjectId: safe(action)
              ? ''
              : '${s.document!.subject}/${action.name}',
          target: safe(action) ? null : s.scope,
          targetId: safe(action) ? null : s.document!.targetId,
        ),
      );
    };
  }

  Widget text(
    String value, {
    double size = 16,
    bool heading = false,
    int level = 2,
  }) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Semantics(
      header: heading,
      headingLevel: heading ? level : null,
      child: Text(
        value,
        style: TextStyle(
          color: const Color(0xFF172033),
          fontSize: size,
          height: 1.45,
          fontWeight: heading ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
    ),
  );
  Widget button(String label, ProfileAction action, {bool primary = false}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: _ProfileButton(
          key: ValueKey('profile-$label'),
          label: label,
          primary: primary,
          onPressed: callback(action),
        ),
      );
  Widget notice(String message) => Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
      color: const Color(0xFFFFF3D6),
      borderRadius: BorderRadius.circular(12),
    ),
    child: text(message),
  );
  List<Widget> value(String key, String label) {
    final s = widget.snapshot, d = s.document;
    if (d == null ||
        !s.fieldAllowed(widget.screen, 'value/${_identity(key)}') ||
        !d.values.containsKey(key))
      return [];
    return [text('$label: ${d.values[key]}')];
  }

  List<Widget> entries() {
    final s = widget.snapshot, d = s.document;
    if (!s.readableFor(widget.screen) || d == null) return [];
    return [
      for (final e in d.entries)
        if (s.fieldAllowed(widget.screen, e.key)) ...[
          text(e.label, size: 18, heading: true, level: 3),
          text('Kaynak: ${e.source} · Tarih: ${e.date}'),
          text(e.detail),
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: SizedBox(
              height: 1,
              child: ColoredBox(color: Color(0xFFCBD3E0)),
            ),
          ),
        ] else
          text(
            'Bir kaydın güncel okuma izni alınamadı. Özel içeriği gösterilmiyor.',
          ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.snapshot, screen = widget.screen;
    final readable = s.readableFor(screen), d = readable ? s.document : null;
    final children = <Widget>[];
    if (screen == ProfileScreen.intro) {
      children.addAll([
        text('İstersen profil oluştur', size: 32, heading: true, level: 1),
        text(
          'Profil isteğe bağlı. Mevcut yerel kullanımına devam edebilirsin.',
        ),
        text(
          'Profil, kayıtlarını taşımayı ve sınırlı paylaşımı değerlendirmek için bir sonraki adımdır.',
        ),
        text(
          'Dil, ölçü birimleri ve erişilebilirlik için hesap açman gerekmez.',
        ),
        ...value('context', 'Yerel bağlam'),
        if (!readable)
          notice(
            'Güncel profil seçeneği alınamadı. Yerel devam yolu profil bilgisine bağlı değildir.',
          ),
        button('Profil oluştur', ProfileAction.createProfile, primary: true),
        button('Şimdilik yerel devam et', ProfileAction.localContinue),
        text(
          'Profil isteği göndermek hesabın oluşturulduğu anlamına gelmez. Güncel sonuç ayrıca kontrol edilir.',
        ),
        text(
          'Kayıtları taşımadan önce kapsamı ve çakışmaları inceleyeceksin. Güvenli tamamlanma doğrulanana kadar yerel kaynak korunmalıdır.',
        ),
      ]);
    } else if (screen == ProfileScreen.migration) {
      final status = switch (d?.state) {
        ProfileState.ready => 'Taşıma kapsamını incele',
        ProfileState.conflict => 'Taşımadan önce inceleme gerekli',
        ProfileState.partial => 'Taşıma kısmi kaldı',
        ProfileState.failed => 'Taşıma tamamlanmadı',
        ProfileState.rollback => 'Yerel kaynağa dönüş',
        ProfileState.completed when s.resultConfirmed(screen) =>
          'Taşıma tamamlandı',
        _ => 'Güncel taşıma bilgisi alınamadı',
      };
      children.addAll([
        text(status, size: 32, heading: true, level: 1),
        text(
          'Yerel kayıtlardan profile geçiş. Devam etmeden önce taşınacak kapsamı gör ve incele.',
        ),
        ...value('context', 'Kaynak ve hedef'),
        if (!readable)
          notice(
            'Güncel kaynak ve okuma izni alınamadı; özel kayıtlar gösterilmiyor.',
          ),
        if (d?.state == ProfileState.conflict)
          notice(
            'Çakışan kayıtlar ayrı kalır. Uygulama kendiliğinden bir kazanan seçip diğerinin üstüne yazmaz.',
          ),
        if ({
          ProfileState.partial,
          ProfileState.failed,
          ProfileState.rollback,
        }.contains(d?.state))
          notice(
            'Bu durum tamamlanmış taşıma değildir. Yerel kaynak kullanılabilir kalmalı; kısmi sonuç başarı diye gösterilmez.',
          ),
        text('Taşıma kapsamı', size: 22, heading: true),
        ...entries(),
        if (d != null && d.entries.isEmpty) text('Henüz taşınacak kayıt yok.'),
        if (d?.state == ProfileState.completed && s.resultConfirmed(screen))
          notice(
            'Tamamlanma sonucu güncel kaynaktan doğrulandı. Aktarılan kapsamı ve kaynağı inceleyebilirsin.',
          ),
        if (d?.state == ProfileState.conflict ||
            d?.state == ProfileState.partial ||
            d?.state == ProfileState.failed ||
            d?.state == ProfileState.rollback)
          button(
            'Çakışma ve kapsamı incele',
            ProfileAction.reviewConflict,
            primary: true,
          )
        else
          button(
            'Taşıma için güncel kontrol iste',
            ProfileAction.requestTransfer,
            primary: true,
          ),
        button('İptal et · yerel devam et', ProfileAction.localContinue),
        text(
          'İnceleme veya taşıma isteği, taşımanın tamamlandığı anlamına gelmez. Güvenli sonuç doğrulanana kadar yerel kaynak korunmalıdır.',
        ),
        text(
          'İptal etmek ya da yerel kullanıma dönmek kayıtları silmek değildir.',
        ),
      ]);
    } else {
      children.addAll([
        text(
          d?.state == ProfileState.revoked && s.resultConfirmed(screen)
              ? 'Gelecekteki erişim kaldırıldı'
              : 'Paylaşım ve erişim',
          size: 32,
          heading: true,
          level: 1,
        ),
        text(
          'Motosiklet sahibi ile davet edilen yardımcı farklı rollerdir. Rol etiketi, katkının doğrulanmış gerçek olduğunu göstermez.',
        ),
        ...value('context', 'Paylaşılan motosiklet'),
        ...value('owner', 'Sahibi'),
        ...value('person', 'Davet edilen kişi'),
        ...value('role', 'Rol'),
        ...value('access', 'Sınırlı erişim'),
        if (!readable)
          notice(
            'Güncel kaynak ve izin alınamadı. Kişisel bilgiler ile paylaşım işlemleri kapalı kalır.',
          ),
        text('Katkı ve geçmiş', size: 22, heading: true),
        ...value('attribution', 'Kim ve ne zaman'),
        ...entries(),
        text(
          'Erişimi kaldırmak gelecekteki erişimi durdurur; önceki katkıların kişisi, zamanı, kanıtı ve geçmişi silinmez.',
        ),
        text(
          'Kişisel özel bilgiler ile paylaşılan motosiklet bağlamı ayrı erişim alanlarıdır. Paylaşılacak kapsamı incele.',
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _ProfileButton(
            key: const ValueKey('profile-permissions'),
            label: expanded ? 'Ayrıntıları kapat' : 'İzin ayrıntılarını gör',
            primary: false,
            onPressed: detailsCallback(),
          ),
        ),
        if (expanded) ...[
          text('Paylaşım sınırı', size: 18, heading: true),
          ...value('privateScope', 'Kapsam'),
          text(
            'Bir rol adı güncel okuma veya değişiklik izni sağlamaz. Her işlem için kişinin ve kapsamın güncel izni gerekir.',
          ),
        ],
        button('Bir kişiyi davet et', ProfileAction.invite, primary: true),
        button('Erişimi kaldır', ProfileAction.revoke),
        button('Yerel kullanıma dön', ProfileAction.localContinue),
        text(
          'Davet veya erişimi kaldırma isteği, gerçek işlemin tamamlandığı anlamına gelmez. Güncel sonuç ayrıca kontrol edilir.',
        ),
      ]);
    }
    children.addAll([
      if (s.offline)
        text(
          'Çevrimdışısın. Yeni profil, taşıma veya paylaşım isteği için güncel çevrimiçi kontrol gerekir.',
        ),
      ...value('source', 'Bilginin kaynağı'),
      ...value('checkedAt', 'Kontrol zamanı'),
      if (ProfileAction.values.any(
        (a) => sentSubjects[lockKey(s, a)] == presentationKey(s),
      ))
        Semantics(
          liveRegion: true,
          child: text(
            'İstek iletildi. Güncel sonuç henüz doğrulanmadı; işlem tamamlanmış sayılmaz.',
          ),
        ),
      button('Destek seçenekleri', ProfileAction.support),
    ]);
    return ColoredBox(
      color: const Color(0xFFF8FAFC),
      child: SafeArea(
        child: FocusTraversalGroup(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: children,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileButton extends StatefulWidget {
  const _ProfileButton({
    super.key,
    required this.label,
    required this.primary,
    required this.onPressed,
  });
  final String label;
  final bool primary;
  final VoidCallback? onPressed;
  @override
  State<_ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<_ProfileButton> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    final active = widget.onPressed != null;
    final background = !active
        ? const Color(0xFFE3E8F0)
        : widget.primary
        ? const Color(0xFF0E5BD8)
        : const Color(0xFFFFFFFF);
    final foreground = active && widget.primary
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF172033);
    return FocusableActionDetector(
      enabled: active,
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
      onShowFocusHighlight: (value) {
        if (focused != value) setState(() => focused = value);
      },
      child: Semantics(
        button: true,
        enabled: active,
        label: widget.label,
        onTap: widget.onPressed,
        excludeSemantics: true,
        child: GestureDetector(
          onTap: widget.onPressed,
          behavior: HitTestBehavior.opaque,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 52),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: focused
                      ? widget.primary
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF172033)
                      : const Color(0xFFCBD3E0),
                  width: focused ? 3 : 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: foreground,
                    fontSize: 16,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
