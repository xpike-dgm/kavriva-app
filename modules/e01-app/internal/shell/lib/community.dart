import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

String _required(String value) {
  if (value.trim().isEmpty)
    throw ArgumentError('Bağlam veya açıklama boş olamaz.');
  return value;
}

String _identity(String? value) => value == null
    ? '-'
    : '${value.codeUnits.length}:${value.codeUnits.map((x) => x.toRadixString(16).padLeft(4, '0')).join()}';

enum CommunityScreen { discovery, contribution, review }

enum CommunityState {
  unknown,
  ready,
  empty,
  pending,
  needsRevision,
  held,
  dangerous,
  accepted,
  withdrawn,
  failed,
}

enum CommunityReferenceState { unknown, held, confirmed }

enum CommunityReadDimension { context, source, identity, policy }

enum CommunityEffectDimension {
  context,
  source,
  identity,
  policy,
  operation,
  audit,
}

enum CommunityAction {
  contribute,
  publish,
  revise,
  resubmit,
  appeal,
  withdraw,
  report,
  cancel,
  support,
}

class CommunityScope {
  CommunityScope({
    required String localId,
    required String localRevision,
    String? accountId,
    String? accountRevision,
    String? motorcycleId,
    String? motorcycleRevision,
  }) : localId = _required(localId),
       localRevision = _required(localRevision),
       accountId = accountId == null ? null : _required(accountId),
       accountRevision = accountRevision == null
           ? null
           : _required(accountRevision),
       motorcycleId = motorcycleId == null ? null : _required(motorcycleId),
       motorcycleRevision = motorcycleRevision == null
           ? null
           : _required(motorcycleRevision) {
    if ((this.accountId == null) != (this.accountRevision == null) ||
        (this.motorcycleId == null) != (this.motorcycleRevision == null))
      throw ArgumentError('Kimlik ve revizyon birlikte gerekir.');
  }
  final String localId, localRevision;
  final String? accountId, accountRevision, motorcycleId, motorcycleRevision;
  String get localSubject =>
      '${_identity(localId)}/${_identity(localRevision)}';
  String get subject =>
      '$localSubject/${_identity(accountId)}/${_identity(accountRevision)}/${_identity(motorcycleId)}/${_identity(motorcycleRevision)}';
}

class CommunityDocument {
  CommunityDocument({
    required String id,
    required String revision,
    required this.screen,
    required this.state,
    required Map<String, String> publicValues,
    required Map<String, String> privateValues,
  }) : id = _required(id),
       revision = _required(revision),
       publicValues = _copy(publicValues),
       privateValues = _copy(privateValues);
  static Map<String, String> _copy(Map<String, String> input) {
    final normalized = <String>{};
    for (final e in input.entries) {
      _required(e.key);
      _required(e.value);
      if (!normalized.add(e.key.trim()))
        throw ArgumentError('Yinelenen alan anahtarı.');
    }
    return Map.unmodifiable(input);
  }

  final String id, revision;
  final CommunityScreen screen;
  final CommunityState state;
  final Map<String, String> publicValues, privateValues;
  String get subject {
    String fields(Map<String, String> values) {
      final keys = values.keys.toList()..sort();
      return '${keys.length}:${keys.map((k) => '${_identity(k)}=${_identity(values[k])}').join('/')}';
    }

    return '${_identity(id)}/${_identity(revision)}/${screen.name}/${state.name}/public:${fields(publicValues)}/private:${fields(privateValues)}';
  }
}

/// Dış kaynak tarafından sağlanan sunum referansı; karar/yayın otoritesi üretmez.
class CommunityReference {
  CommunityReference({
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
  final CommunityScope scope;
  final String requestId,
      purpose,
      subjectId,
      source,
      version,
      checkedAt,
      reason;
  final bool current;
  final CommunityReferenceState state;
  bool confirms(
    CommunityScope target,
    String request,
    String intendedPurpose,
    String subject,
  ) =>
      current &&
      state == CommunityReferenceState.confirmed &&
      scope.subject == target.subject &&
      requestId == request &&
      purpose == intendedPurpose &&
      subjectId == subject;
}

class CommunitySnapshot {
  CommunitySnapshot({
    required this.scope,
    required String requestId,
    this.document,
    this.authority,
    Map<CommunityReadDimension, CommunityReference> reads = const {},
    Map<String, CommunityReference> fields = const {},
    Map<CommunityAction, CommunityReference> actions = const {},
    Map<CommunityEffectDimension, CommunityReference> effects = const {},
    this.outcome,
    this.offline = false,
  }) : requestId = _required(requestId),
       reads = Map.unmodifiable(reads),
       fields = Map.unmodifiable(fields),
       actions = Map.unmodifiable(actions),
       effects = Map.unmodifiable(effects);
  final CommunityScope scope;
  final String requestId;
  final CommunityDocument? document;
  final CommunityReference? authority, outcome;
  final Map<CommunityReadDimension, CommunityReference> reads;
  final Map<String, CommunityReference> fields;
  final Map<CommunityAction, CommunityReference> actions;
  final Map<CommunityEffectDimension, CommunityReference> effects;
  final bool offline;
  bool _confirmed(CommunityReference? ref, String purpose, String subject) =>
      ref?.confirms(scope, requestId, purpose, subject) ?? false;
  bool readableFor(CommunityScreen screen) {
    final d = document;
    return d != null &&
        d.screen == screen &&
        _confirmed(authority, 'community-read', d.subject) &&
        CommunityReadDimension.values.every(
          (x) => _confirmed(
            reads[x],
            'community-read-dimension',
            '${d.subject}/${x.name}',
          ),
        );
  }

  bool fieldAllowed(CommunityScreen screen, String key) =>
      readableFor(screen) &&
      _confirmed(fields[key], 'community-field', '${document!.subject}/$key');
  bool resultConfirmed(CommunityScreen screen) =>
      readableFor(screen) &&
      {
        CommunityState.accepted,
        CommunityState.withdrawn,
      }.contains(document!.state) &&
      _confirmed(outcome, 'community-outcome', document!.subject);
  bool _allFields(CommunityScreen screen, bool includePrivate) {
    final d = document!;
    return d.publicValues.keys.every(
          (k) => fieldAllowed(screen, 'public/${_identity(k)}'),
        ) &&
        (!includePrivate ||
            d.privateValues.keys.every(
              (k) => fieldAllowed(screen, 'private/${_identity(k)}'),
            ));
  }

  bool actionAllowed(CommunityScreen screen, CommunityAction action) {
    if (action == CommunityAction.cancel || action == CommunityAction.support)
      return true;
    if (!readableFor(screen)) return false;
    final d = document!;
    if (!['context', 'source', 'checkedAt'].every(d.publicValues.containsKey) ||
        !_allFields(screen, false))
      return false;
    final fitting = switch (action) {
      CommunityAction.contribute =>
        screen == CommunityScreen.discovery &&
            {
              CommunityState.ready,
              CommunityState.empty,
              CommunityState.accepted,
            }.contains(d.state),
      CommunityAction.publish =>
        screen == CommunityScreen.contribution &&
            d.state == CommunityState.ready,
      CommunityAction.revise || CommunityAction.resubmit =>
        screen == CommunityScreen.review &&
            {
              CommunityState.needsRevision,
              CommunityState.failed,
            }.contains(d.state),
      CommunityAction.appeal =>
        screen == CommunityScreen.review &&
            {
              CommunityState.needsRevision,
              CommunityState.held,
              CommunityState.dangerous,
            }.contains(d.state),
      CommunityAction.withdraw =>
        screen == CommunityScreen.review &&
            {
              CommunityState.pending,
              CommunityState.needsRevision,
              CommunityState.held,
              CommunityState.dangerous,
              CommunityState.accepted,
            }.contains(d.state),
      CommunityAction.report =>
        screen == CommunityScreen.discovery &&
            d.state == CommunityState.accepted &&
            resultConfirmed(screen),
      _ => false,
    };
    if (!fitting ||
        !_confirmed(
          actions[action],
          'community-action',
          '${d.subject}/${action.name}',
        ))
      return false;
    if ({
          CommunityAction.revise,
          CommunityAction.resubmit,
          CommunityAction.appeal,
        }.contains(action) &&
        !d.publicValues.containsKey('reason'))
      return false;
    if (action == CommunityAction.contribute ||
        action == CommunityAction.revise)
      return true;
    if (scope.accountId == null || offline) return false;
    if ((action == CommunityAction.publish ||
            action == CommunityAction.resubmit) &&
        (![
              'title',
              'experience',
              'sharedScope',
            ].every(d.publicValues.containsKey) ||
            !d.privateValues.containsKey('privateScope') ||
            !_allFields(screen, true)))
      return false;
    return CommunityEffectDimension.values.every(
      (x) =>
          _confirmed(effects[x], 'community-effect', '${d.subject}/${x.name}'),
    );
  }
}

class CommunityIntent {
  const CommunityIntent({
    required this.action,
    required this.localSubject,
    required this.requestId,
    required this.subjectId,
    this.scope,
  });
  final CommunityAction action;
  final String localSubject, requestId, subjectId;
  final CommunityScope? scope;
}

class CommunityView extends StatefulWidget {
  const CommunityView({
    super.key,
    required this.screen,
    required this.snapshot,
    this.onIntent,
  });
  final CommunityScreen screen;
  final CommunitySnapshot snapshot;
  final ValueChanged<CommunityIntent>? onIntent;
  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  final sent = <String>{};
  final sentSubjects = <String, String>{};
  bool optIn = false;
  final query = TextEditingController();
  final queryFocus = FocusNode();
  @override
  void initState() {
    super.initState();
    query.addListener(refreshSearch);
  }

  void refreshSearch() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    query.removeListener(refreshSearch);
    query.dispose();
    queryFocus.dispose();
    super.dispose();
  }

  String presentation(CommunitySnapshot s) =>
      '${s.scope.subject}/${_identity(s.requestId)}/${s.document?.subject}/${widget.screen.name}';
  String lock(CommunitySnapshot s, CommunityAction a) =>
      '${s.scope.localSubject}/${_identity(s.requestId)}/${a.name}';
  bool safe(CommunityAction a) =>
      a == CommunityAction.cancel || a == CommunityAction.support;
  bool shares(CommunityAction a) =>
      a == CommunityAction.publish || a == CommunityAction.resubmit;
  @override
  void didUpdateWidget(covariant CommunityView old) {
    super.didUpdateWidget(old);
    if (old.screen != widget.screen ||
        old.snapshot.scope.subject != widget.snapshot.scope.subject ||
        old.snapshot.requestId != widget.snapshot.requestId ||
        old.snapshot.document?.subject != widget.snapshot.document?.subject) {
      optIn = false;
      query.clear();
    }
  }

  VoidCallback? callback(CommunityAction a) {
    final old = widget.snapshot,
        screen = widget.screen,
        handler = widget.onIntent;
    bool allowed(CommunitySnapshot s) =>
        s.actionAllowed(widget.screen, a) &&
        (safe(a) || !sent.contains(lock(s, a))) &&
        (!shares(a) || optIn);
    if (handler == null || !allowed(old)) return null;
    return () {
      final s = widget.snapshot;
      if (s.scope.localSubject != old.scope.localSubject ||
          s.requestId != old.requestId ||
          widget.onIntent != handler ||
          !allowed(s))
        return;
      if (!safe(a) &&
          (screen != widget.screen ||
              s.scope.subject != old.scope.subject ||
              s.document?.subject != old.document?.subject ||
              s.offline != old.offline))
        return;
      if (!safe(a))
        setState(() {
          sent.add(lock(s, a));
          sentSubjects[lock(s, a)] = presentation(s);
        });
      handler(
        CommunityIntent(
          action: a,
          localSubject: s.scope.localSubject,
          requestId: s.requestId,
          subjectId: safe(a) ? '' : '${s.document!.subject}/${a.name}',
          scope: safe(a) ? null : s.scope,
        ),
      );
    };
  }

  bool consentAllowed(CommunitySnapshot s) =>
      s.readableFor(widget.screen) &&
      s.document!.publicValues.containsKey('sharedScope') &&
      s.document!.privateValues.containsKey('privateScope') &&
      s.fieldAllowed(widget.screen, 'public/${_identity('sharedScope')}') &&
      s.fieldAllowed(widget.screen, 'private/${_identity('privateScope')}');
  VoidCallback consentCallback() {
    final old = widget.snapshot, screen = widget.screen;
    return () {
      final s = widget.snapshot;
      if (screen != widget.screen ||
          s.scope.subject != old.scope.subject ||
          s.requestId != old.requestId ||
          s.document?.subject != old.document?.subject ||
          !consentAllowed(s))
        return;
      setState(() => optIn = !optIn);
    };
  }

  Widget text(
    String v, {
    double size = 16,
    bool heading = false,
    int level = 2,
  }) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Semantics(
      header: heading,
      headingLevel: heading ? level : null,
      child: Text(
        v,
        style: TextStyle(
          color: const Color(0xFF172033),
          fontSize: size,
          height: 1.45,
          fontWeight: heading ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
    ),
  );
  Widget notice(String v) => Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
      color: const Color(0xFFFFF3D6),
      borderRadius: BorderRadius.circular(12),
    ),
    child: text(v),
  );
  Widget button(String label, CommunityAction a, {bool primary = false}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: _CommunityButton(
          key: ValueKey('community-$label'),
          label: label,
          primary: primary,
          onPressed: callback(a),
        ),
      );
  List<Widget> field(String key, String label, {bool private = false}) {
    final s = widget.snapshot,
        d = s.document,
        area = private ? 'private' : 'public';
    final values = private ? d?.privateValues : d?.publicValues;
    if (d == null ||
        values == null ||
        !values.containsKey(key) ||
        !s.fieldAllowed(widget.screen, '$area/${_identity(key)}'))
      return [];
    return [text('$label: ${values[key]}')];
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.snapshot,
        screen = widget.screen,
        readable = s.readableFor(screen),
        d = s.readableFor(screen) ? s.document : null;
    final blockedContent =
        d == null ||
        {
          CommunityState.held,
          CommunityState.dangerous,
          CommunityState.withdrawn,
          CommunityState.unknown,
          CommunityState.empty,
        }.contains(d.state) ||
        (screen == CommunityScreen.discovery && !s.resultConfirmed(screen));
    final title = switch (screen) {
      CommunityScreen.discovery => 'Topluluk',
      CommunityScreen.contribution => 'Deneyimini paylaş',
      CommunityScreen.review => switch (d?.state) {
        CommunityState.needsRevision => 'Düzeltme gerekiyor',
        CommunityState.pending => 'İnceleme bekleniyor',
        CommunityState.held => 'Katkı inceleme için bekletiliyor',
        CommunityState.dangerous => 'Riskli anlatım gösterilmiyor',
        CommunityState.accepted when s.resultConfirmed(screen) =>
          'Toplulukta yayınlandı',
        CommunityState.withdrawn when s.resultConfirmed(screen) =>
          'Gelecekteki görünürlük değişti',
        CommunityState.failed => 'İstek tamamlanmadı',
        _ => 'Güncel inceleme bilgisi gerekli',
      },
    };
    final children = <Widget>[
      text(title, size: 32, heading: true, level: 1),
      text(
        'Bu bir topluluk deneyimidir. Resmî Kavriva rehberi veya doğrulanmış bakım talimatı değildir.',
      ),
      text('Yayınlanması teknik doğruluğunun doğrulandığını göstermez.'),
      ...field('context', 'Motosiklet bağlamı'),
    ];
    if (!readable)
      children.add(
        notice(
          'Güncel kaynak ve okuma izni alınamadı. Özel bilgiler gösterilmiyor; paylaşım ve inceleme işlemleri kapalı.',
        ),
      );
    if (readable &&
        (screen == CommunityScreen.contribution ||
            (screen == CommunityScreen.review &&
                {
                  CommunityState.needsRevision,
                  CommunityState.failed,
                }.contains(d?.state)))) {
      final intended = screen == CommunityScreen.contribution
          ? CommunityAction.publish
          : CommunityAction.resubmit;
      if (!s.actionAllowed(screen, intended) || widget.onIntent == null)
        children.add(
          notice(
            'Yeni yayın veya yeniden gönderme seçeneği şu anda kapalı. Gösterilen paylaşım kapsamı, güncel izin ve işlem bağlantısı tamamlanmalıdır. İtiraz ve geri çekme yalnız desteklenen güncel izinle açılır.',
          ),
        );
    }
    if (screen == CommunityScreen.discovery) {
      children.addAll([
        text('Deneyimler ve sorular', size: 22, heading: true),
        text(
          'Okumak için paylaşım yapman gerekmez. Bu bölüm sosyal puan veya popülerlik sıralaması sunmaz.',
        ),
      ]);
      if (d?.state == CommunityState.empty)
        children.add(text('Henüz gösterilecek deneyim yok.'));
      if (blockedContent && d?.state != CommunityState.empty)
        children.add(
          notice(
            'Bu içerik şu anda normal bir bakım adımı olarak gösterilmiyor. Güncel yayın ve inceleme durumunu kontrol et.',
          ),
        );
      if (!blockedContent)
        children.addAll([
          text('Görünen deneyimde ara', size: 22, heading: true),
          text(
            'Yalnız şu anda gösterilebilen anlatımı süzer; bütün toplulukta arama yapmaz.',
          ),
          Semantics(
            label: 'Görünen deneyim içinde ara',
            child: Container(
              constraints: const BoxConstraints(minHeight: 52),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF526079)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: EditableText(
                key: const ValueKey('community-search'),
                controller: query,
                focusNode: queryFocus,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color: Color(0xFF172033),
                ),
                cursorColor: const Color(0xFF0E5BD8),
                backgroundCursorColor: const Color(0xFF526079),
                textInputAction: TextInputAction.search,
              ),
            ),
          ),
        ]);
      final visibleContent = d == null
          ? ''
          : ['title', 'experience']
                .where((k) => s.fieldAllowed(screen, 'public/${_identity(k)}'))
                .map((k) => d.publicValues[k] ?? '')
                .join(' ')
                .toLowerCase();
      final matches =
          query.text.isEmpty ||
          visibleContent.contains(query.text.toLowerCase());
      if (!blockedContent && !matches)
        children.add(
          text(
            'Görünen deneyimde bu sözcük bulunamadı. Aramayı değiştirebilirsin.',
          ),
        );
      if (!blockedContent && matches)
        children.addAll([
          ...field('title', 'Deneyim'),
          ...field('experience', 'Kullanıcı anlatımı'),
        ]);
      children.addAll([
        button(
          'Deneyim paylaşmayı incele',
          CommunityAction.contribute,
          primary: true,
        ),
        button('Sorunu bildir', CommunityAction.report),
        text(
          'Bildirim yalnızca inceleme isteğidir; teknik karar vermez ve içeriği kendiliğinden kaldırmaz.',
        ),
      ]);
    } else if (screen == CommunityScreen.contribution) {
      children.addAll([
        text('Paylaşmadan önce kapsamı incele', size: 22, heading: true),
        text(
          'Kişisel notlar kendiliğinden topluluğa açılmaz. Fotoğraf eklemek isteğe bağlıdır; fotoğraf teknik doğrulama sağlamaz.',
        ),
        ...field('title', 'Paylaşım başlığı'),
        ...field('experience', 'Paylaşılacak anlatım'),
        ...field('sharedScope', 'Toplulukta görünecek'),
        ...field('privateScope', 'Özel kalacak', private: true),
        text('Vazgeçmek kişisel kaydını silmek veya yayınlamak değildir.'),
      ]);
      if (screen != CommunityScreen.discovery)
        children.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _CommunityButton(
              key: const ValueKey('community-opt-in'),
              label: optIn
                  ? 'Paylaşım seçildi · seçimi kaldır'
                  : 'Gösterilen kapsamı paylaşmayı seç',
              primary: false,
              onPressed: consentAllowed(s) ? consentCallback() : null,
            ),
          ),
        );
      children.add(
        button('Toplulukla paylaş', CommunityAction.publish, primary: true),
      );
    } else {
      children.addAll([
        ...field('reason', 'İnceleme gerekçesi'),
        ...field('repair', 'Yapılabilecek düzeltme'),
        text(
          'Düzeltme, yeniden gönderme ve itiraz bir istektir; yayına kabul edildiğin anlamına gelmez.',
        ),
        ...field('sharedScope', 'Paylaşım kapsamı'),
        ...field('privateScope', 'Özel kalacak', private: true),
        if (readable &&
            {
              CommunityState.needsRevision,
              CommunityState.failed,
            }.contains(d?.state))
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _CommunityButton(
              key: const ValueKey('community-opt-in'),
              label: optIn
                  ? 'Paylaşım seçildi · seçimi kaldır'
                  : 'Gösterilen kapsamı paylaşmayı seç',
              primary: false,
              onPressed: consentAllowed(s) ? consentCallback() : null,
            ),
          ),
        button('Düzenlemeyi aç', CommunityAction.revise, primary: true),
        button('Yeniden gönder', CommunityAction.resubmit),
        button('İtiraz et', CommunityAction.appeal),
        button('Katkıyı geri çek', CommunityAction.withdraw),
        text(
          'Geri çekmek gelecekteki kullanımı ve görünürlüğü değiştirir. Geçmiş katkı, kaynak ve bağlı kanıt izleri sessizce silinmez.',
        ),
      ]);
    }
    if (s.offline)
      children.add(
        text(
          'Çevrimdışısın. Yayın, itiraz ve geri çekme için güncel çevrimiçi kontrol gerekir.',
        ),
      );
    children.addAll([
      ...field('source', 'Kaynak'),
      ...field('checkedAt', 'Kontrol zamanı'),
      ...field('review', 'İnceleme durumu'),
      text(
        'Rol, fotoğraf veya inceleme etiketi teknik uygulama izni sağlamaz.',
      ),
    ]);
    if (CommunityAction.values.any(
      (a) => sentSubjects[lock(s, a)] == presentation(s),
    ))
      children.add(
        Semantics(
          liveRegion: true,
          child: text(
            'İstek iletildi. Güncel sonuç henüz doğrulanmadı; yayın veya değişiklik tamamlanmış sayılmaz.',
          ),
        ),
      );
    children.addAll([
      button('Vazgeç · yerel kullanıma dön', CommunityAction.cancel),
      button('Destek seçenekleri', CommunityAction.support),
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

class _CommunityButton extends StatefulWidget {
  const _CommunityButton({
    super.key,
    required this.label,
    required this.primary,
    required this.onPressed,
  });
  final String label;
  final bool primary;
  final VoidCallback? onPressed;
  @override
  State<_CommunityButton> createState() => _CommunityButtonState();
}

class _CommunityButtonState extends State<_CommunityButton> {
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
