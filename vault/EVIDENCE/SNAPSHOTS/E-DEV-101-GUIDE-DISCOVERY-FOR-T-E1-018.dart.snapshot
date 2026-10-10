import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'variant_resolution.dart';

String _required(String value) {
  final text = value.trim();
  if (text.isEmpty)
    throw ArgumentError('Boş arama bağlamı veya kapsam kullanılamaz.');
  return text;
}

/// Arama başlamadan önceki motosiklet bağlamı; rehber veya hak seçmez.
class DiscoveryContext {
  DiscoveryContext({
    required String motorcycleId,
    required String revision,
    required String label,
  }) : motorcycleId = _required(motorcycleId),
       revision = _required(revision),
       label = _required(label);
  final String motorcycleId;
  final String revision;
  final String label;
  bool matches(DiscoveryContext other) =>
      motorcycleId == other.motorcycleId && revision == other.revision;
  bool contains(VariantContext guide) =>
      motorcycleId == guide.motorcycleId && revision == guide.contextRevision;
}

class TaskSearchRequest {
  TaskSearchRequest({required this.context, required String query})
    : query = _required(query);
  final DiscoveryContext context;
  final String query;
}

/// Yalnız mevcut aday önizlemesi; motosiklete uygulanabilirlik kararı değil.
class GuideCandidate {
  GuideCandidate({required this.context, required String description})
    : description = _required(description);
  final VariantContext context;
  final String description;
}

class DiscoveryResults {
  DiscoveryResults({
    required this.context,
    required String query,
    required this.current,
    required List<GuideCandidate> candidates,
  }) : query = query.trim(),
       candidates = List.unmodifiable(candidates) {
    final identities = candidates
        .map(
          (c) => (
            c.context.motorcycleId,
            c.context.guideId,
            c.context.contextRevision,
          ),
        )
        .toSet();
    if (identities.length != candidates.length)
      throw ArgumentError('Aynı rehber adayı iki kez kullanılamaz.');
  }
  final DiscoveryContext context;
  final String query;
  final bool current;
  final List<GuideCandidate> candidates;
}

/// Arama API'si değildir. Taslak yereldir, sonuç/başarı ve bütün gerçeklik dışarıdan gelir.
class TaskDiscoveryView extends StatefulWidget {
  const TaskDiscoveryView({
    super.key,
    required this.context,
    required this.initialQuery,
    required this.results,
    required this.busy,
    required this.errorMessage,
    required this.onSearchRequested,
    required this.onPreviewRequested,
  });
  final DiscoveryContext context;

  /// Yalnız ilk açılış veya başka motosiklet bağlamına geçişte alınan taslak.
  final String initialQuery;
  final DiscoveryResults? results;
  final bool busy;
  final String? errorMessage;
  final ValueChanged<TaskSearchRequest>? onSearchRequested;
  final ValueChanged<GuideCandidate>? onPreviewRequested;
  @override
  State<TaskDiscoveryView> createState() => _TaskDiscoveryViewState();
}

class _TaskDiscoveryViewState extends State<TaskDiscoveryView> {
  late final TextEditingController query;
  final focus = FocusNode();
  String? validation;
  @override
  void initState() {
    super.initState();
    query = TextEditingController(text: widget.initialQuery);
    query.addListener(changed);
  }

  void changed() => setState(() => validation = null);
  @override
  void didUpdateWidget(TaskDiscoveryView old) {
    super.didUpdateWidget(old);
    if (!widget.context.matches(old.context)) {
      query.text = widget.initialQuery;
      validation = null;
    }
  }

  @override
  void dispose() {
    query.removeListener(changed);
    query.dispose();
    focus.dispose();
    super.dispose();
  }

  void search() {
    if (widget.busy || widget.onSearchRequested == null) return;
    if (query.text.trim().isEmpty) {
      setState(
        () => validation =
            'Yapmak istediğin işi yaz; teknik adını bilmen gerekmez.',
      );
      return;
    }
    widget.onSearchRequested!(
      TaskSearchRequest(context: widget.context, query: query.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final result = widget.results;
    final usable =
        result != null &&
        result.current &&
        result.context.matches(widget.context) &&
        result.query == query.text.trim() &&
        !widget.busy &&
        widget.errorMessage == null;
    return _Page(
      children: [
        const Text('Yapmak istediğin işi bul', style: TextStyle(fontSize: 24)),
        Text('Motosikletim: ${widget.context.label}'),
        const Text(
          'İşi kendi sözlerinle yaz. Teknik adını veya bir kodu bilmen gerekmez.',
        ),
        const Text(
          'Bir rehberi seçmek yalnız kapsamını açar. Motosiklete uygunluğu ve hazırlığın ayrıca kontrol edilir.',
        ),
        const Text(
          'İşi bulamazsan farklı sözlerle yeniden ara. Eski sonuçla ilerleme; güncel sonuç iste.',
        ),
        const Text('Ne yapmak istiyorsun?'),
        Semantics(
          label: 'Yapmak istediğin iş',
          textField: true,
          child: Container(
            constraints: const BoxConstraints(minHeight: 52),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: const Color(0xFF5E6E81)),
            ),
            child: EditableText(
              key: const ValueKey('task-query'),
              controller: query,
              focusNode: focus,
              readOnly: widget.busy,
              style: DefaultTextStyle.of(context).style,
              cursorColor: const Color(0xFF0E5BD8),
              backgroundCursorColor: const Color(0xFF5E6E81),
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => search(),
            ),
          ),
        ),
        _Action(
          label: 'İşi ara',
          onPressed: widget.busy || widget.onSearchRequested == null
              ? null
              : search,
        ),
        if (widget.onSearchRequested == null)
          const Text('Arama şu anda kullanılamıyor. Yazdığın iş burada kalır.'),
        if (validation != null)
          Semantics(liveRegion: true, child: Text(validation!)),
        if (widget.busy)
          const Text('İşler aranıyor; sonuç hazır olmadan rehber seçme.'),
        if (widget.errorMessage != null)
          Semantics(liveRegion: true, child: Text(widget.errorMessage!)),
        if (usable) ...[
          if (result.candidates.isEmpty)
            const Text(
              'Bu arama için iş bulunamadı. Farklı sözlerle yazıp İşi ara seçeneğini kullan.',
            ),
          for (final candidate in result.candidates)
            if (widget.context.contains(candidate.context)) ...[
              Text(
                candidate.context.guideLabel,
                style: const TextStyle(fontSize: 20),
              ),
              Text(candidate.description),
              _Action(
                key: ValueKey(candidate.context.guideId),
                label: '${candidate.context.guideLabel}: kapsamını gör',
                onPressed: widget.onPreviewRequested == null
                    ? null
                    : () => widget.onPreviewRequested!(candidate),
              ),
            ] else
              const Text(
                'Bir sonuç bu motosikletin güncel bilgileriyle eşleşmiyor. Yeniden ara; başka motosikletin rehberini seçme.',
              ),
          if (widget.onPreviewRequested == null && result.candidates.isNotEmpty)
            const Text('Rehber kapsamı şu anda açılamıyor.'),
        ] else if (!widget.busy && widget.errorMessage == null)
          const Text(
            'Bu arama için güncel sonuç yok. İşi yazıp İşi ara seçeneğini kullan; eski sonucu doğru sayma.',
          ),
      ],
    );
  }
}

/// Kapsam açıklaması teknik talimat değil; doğrulanmış içerik çağıranın sorumluluğu.
class GuideScope {
  GuideScope({
    required this.context,
    required String includes,
    required String excludes,
    required this.current,
  }) : includes = _required(includes),
       excludes = _required(excludes);
  final VariantContext context;
  final String includes;
  final String excludes;
  final bool current;
}

class GuideScopePreview extends StatelessWidget {
  const GuideScopePreview({
    super.key,
    required this.context,
    required this.scope,
    required this.fit,
    required this.busy,
    required this.errorMessage,
    required this.onPreparationRequested,
    required this.onDistinctionRequested,
    required this.onTeachingRequested,
    required this.onEditRequested,
  });
  final VariantContext context;
  final GuideScope? scope;
  final FitPresentation? fit;
  final bool busy;
  final String? errorMessage;
  final ValueChanged<VariantContext>? onPreparationRequested;
  final ValueChanged<VariantContext>? onDistinctionRequested;
  final ValueChanged<VariantContext>? onTeachingRequested;
  final ValueChanged<VariantContext>? onEditRequested;
  @override
  Widget build(BuildContext context) {
    final s = scope;
    final matches = s != null && this.context.matches(s.context);
    return _Page(
      children: [
        const Text('Rehberin kapsamı', style: TextStyle(fontSize: 24)),
        Text('Rehber: ${this.context.guideLabel}'),
        Text('Motosikletim: ${this.context.motorcycleLabel}'),
        const Text(
          'Bu görünüm rehberi tanıtır; motosiklette uygulama adımı değildir. Açmak yeni rehber hakkı veya hazır olma durumu yaratmaz.',
        ),
        if (matches) ...[
          const Text('Neleri kapsar?', style: TextStyle(fontSize: 20)),
          Text(s.includes),
          const Text('Neleri kapsamaz?', style: TextStyle(fontSize: 20)),
          Text(s.excludes),
          if (!s.current)
            const Text(
              'Kapsam bilgisi güncel değil. Yeniden kontrol edilmeden hazırlığa geçilemez.',
            ),
        ] else
          const Text(
            'Bu motosiklet ve rehberin kapsam bilgisi eksik. Ayrımı ve bilgileri yeniden kontrol et.',
          ),
        MotorcycleFitView(
          context: this.context,
          result: matches && s.current ? fit : null,
          busy: busy,
          errorMessage: errorMessage,
          onPreparationRequested: onPreparationRequested,
          onDistinctionRequested: onDistinctionRequested,
          onTeachingRequested: onTeachingRequested,
          onEditRequested: onEditRequested,
        ),
      ],
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children
            .map(
              (c) =>
                  Padding(padding: const EdgeInsets.only(bottom: 8), child: c),
            )
            .toList(),
      ),
    ),
  );
}

class _Action extends StatefulWidget {
  const _Action({super.key, required this.label, required this.onPressed});
  final String label;
  final VoidCallback? onPressed;
  @override
  State<_Action> createState() => _ActionState();
}

class _ActionState extends State<_Action> {
  bool focused = false;
  @override
  Widget build(BuildContext context) => FocusableActionDetector(
    enabled: widget.onPressed != null,
    onShowFocusHighlight: (v) => setState(() => focused = v),
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
      label: widget.label,
      onTap: widget.onPressed,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: widget.onPressed,
        behavior: HitTestBehavior.opaque,
        child: Container(
          constraints: const BoxConstraints(minHeight: 52),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: focused
                  ? const Color(0xFF0E5BD8)
                  : const Color(0xFF5E6E81),
            ),
          ),
          child: Text(widget.label),
        ),
      ),
    ),
  );
}
