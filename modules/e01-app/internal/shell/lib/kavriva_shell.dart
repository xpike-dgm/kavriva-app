import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Sunum etiketleri; kayıt, yetki veya fiziksel durum değildir.
enum KavrivaSection {
  garage('Garaj'),
  maintenance('Bakım'),
  assistance('AI Usta'),
  history('Geçmiş'),
  community('Topluluk');

  const KavrivaSection(this.label);
  final String label;
}

/// Yalnız beş bölümün kabuğu. İçerik ve gezinme kararı çağıran E1 sunumundadır.
///
/// İlk sekme varsayılmaz. Aktif fiziksel işte alt-bar davranışı seçilmez;
/// çağıran görünürlüğü ve değişim isteğini açıkça belirler. Yerel widget state'i
/// kanonik kayıt, güvenlik kanıtı veya işlem izni değildir.
class KavrivaShell extends StatelessWidget {
  KavrivaShell({
    super.key,
    required Map<KavrivaSection, Widget> pages,
    required this.selectedSection,
    required this.showNavigation,
    required this.onSectionRequested,
  }) : pages = Map.unmodifiable(pages) {
    if (pages.length != KavrivaSection.values.length ||
        !KavrivaSection.values.every(pages.containsKey)) {
      throw ArgumentError('Beş bölümün tamamı gerekli.');
    }
  }

  final Map<KavrivaSection, Widget> pages;
  final KavrivaSection selectedSection;
  final bool showNavigation;
  final ValueChanged<KavrivaSection>? onSectionRequested;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFF8FAFC),
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: Color(0xFF101827), fontSize: 16),
        child: Column(
          children: [
            Expanded(
              child: SafeArea(
                bottom: !showNavigation,
                child: IndexedStack(
                  index: KavrivaSection.values.indexOf(selectedSection),
                  sizing: StackFit.expand,
                  children: [
                    for (final section in KavrivaSection.values)
                      KeyedSubtree(
                        key: ValueKey(section),
                        child: ExcludeFocus(
                          excluding: section != selectedSection,
                          child: ExcludeSemantics(
                            excluding: section != selectedSection,
                            child: TickerMode(
                              enabled: section == selectedSection,
                              child: pages[section]!,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (showNavigation)
              SafeArea(
                top: false,
                child: ColoredBox(
                  color: const Color(0xFFFFFFFF),
                  child: FocusTraversalGroup(
                    policy: WidgetOrderTraversalPolicy(),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (final section in KavrivaSection.values)
                            Expanded(
                              child: _SectionButton(
                                section: section,
                                selected: section == selectedSection,
                                onRequested: onSectionRequested,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SectionButton extends StatefulWidget {
  const _SectionButton({
    required this.section,
    required this.selected,
    required this.onRequested,
  });

  final KavrivaSection section;
  final bool selected;
  final ValueChanged<KavrivaSection>? onRequested;

  @override
  State<_SectionButton> createState() => _SectionButtonState();
}

class _SectionButtonState extends State<_SectionButton> {
  bool _focusVisible = false;

  void _request() => widget.onRequested?.call(widget.section);

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onRequested != null;
    return FocusableActionDetector(
      enabled: enabled,
      onShowFocusHighlight: (value) => setState(() => _focusVisible = value),
      shortcuts: const {
        SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
      },
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            _request();
            return null;
          },
        ),
      },
      child: Semantics(
        label: widget.section.label,
        button: true,
        selected: widget.selected,
        enabled: enabled,
        onTap: enabled ? _request : null,
        excludeSemantics: true,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: enabled ? _request : null,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: widget.selected
                  ? const Color(0xFFEAF0FF)
                  : const Color(0xFFFFFFFF),
              border: Border.all(
                color: _focusVisible
                    ? const Color(0xFF0E5BD8)
                    : const Color(0xFFFFFFFF),
                width: 2,
              ),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 56),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 12,
                ),
                child: Center(
                  child: Text(
                    widget.section.label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF101827),
                      fontSize: 13,
                      fontWeight: widget.selected
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
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
