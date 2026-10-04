import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

enum FirstUseIntent { knownTask, symptom, record }

/// Niyet seçimi rehber, fiziksel uygulama veya hesap yetkisi üretmez.
class FirstValueEntry extends StatelessWidget {
  const FirstValueEntry({super.key, required this.onIntentRequested});
  final ValueChanged<FirstUseIntent>? onIntentRequested;

  @override
  Widget build(BuildContext context) => _Page(
    children: [
      const Text('Bugün ne yapmak istiyorsun?', style: TextStyle(fontSize: 24)),
      const Text('İlk seçenekleri görmek için hesap açman gerekmez.'),
      for (final item in const [
        (
          FirstUseIntent.knownTask,
          'Yapmak istediğim işi biliyorum',
          'İşini bul; motosiklete uygunluğu ve hazırlığı ayrıca kontrol edilir.',
        ),
        (
          FirstUseIntent.symptom,
          'Bir belirtiyi anlamak istiyorum',
          'Belirtini anlat; nedeni doğrulanmadan işlem önerisi kesinleşmez.',
        ),
        (
          FirstUseIntent.record,
          'Bakım kaydı tutmak istiyorum',
          'Motosikletini ekleyip yapılan işi kaydetme yolunu aç.',
        ),
      ]) ...[
        _Action(
          key: ValueKey(item.$1),
          label: item.$2,
          onPressed: onIntentRequested == null
              ? null
              : () => onIntentRequested!(item.$1),
        ),
        Text(item.$3),
      ],
      if (onIntentRequested == null)
        const Text('Seçenekler şu anda açılamıyor. Hesap açman istenmiyor.'),
    ],
  );
}

/// Yalnız kullanıcı beyanı. Kimlik, uygunluk veya kayıt yaratma kararı değildir.
class MotorcycleDraft {
  MotorcycleDraft({
    required String brand,
    required String model,
    required this.year,
  }) : brand = brand.trim(),
       model = model.trim() {
    if (this.brand.isEmpty ||
        this.model.isEmpty ||
        (year != null && year! <= 0)) {
      throw ArgumentError('Marka, model ve biliniyorsa pozitif yıl gerekli.');
    }
  }
  final String brand;
  final String model;
  final int? year;
}

/// Yerel form taslağı; kalıcılık ve gerçek yaratma sonucu çağıranın sorumluluğu.
class AddMotorcycleForm extends StatefulWidget {
  const AddMotorcycleForm({
    super.key,
    required this.onCreationRequested,
    required this.onBackRequested,
    required this.busy,
    required this.errorMessage,
  });
  final ValueChanged<MotorcycleDraft>? onCreationRequested;
  final VoidCallback? onBackRequested;
  final bool busy;
  final String? errorMessage;
  @override
  State<AddMotorcycleForm> createState() => _AddMotorcycleFormState();
}

class _AddMotorcycleFormState extends State<AddMotorcycleForm> {
  final brand = TextEditingController();
  final model = TextEditingController();
  final year = TextEditingController();
  bool unknownYear = false;
  String? validationError;

  @override
  void dispose() {
    brand.dispose();
    model.dispose();
    year.dispose();
    brandFocus.dispose();
    modelFocus.dispose();
    yearFocus.dispose();
    super.dispose();
  }

  void submit() {
    if (widget.busy || widget.onCreationRequested == null) return;
    final parsedYear = int.tryParse(year.text.trim());
    if (brand.text.trim().isEmpty || model.text.trim().isEmpty) {
      setState(() => validationError = 'Marka ve modeli yaz.');
      return;
    }
    if (!unknownYear &&
        (parsedYear == null ||
            parsedYear <= 0 ||
            !RegExp(r'^[0-9]+$').hasMatch(year.text.trim()))) {
      setState(
        () => validationError =
            'Yılı sayıyla yaz veya bilmiyorum seçeneğini seç.',
      );
      return;
    }
    setState(() => validationError = null);
    widget.onCreationRequested!(
      MotorcycleDraft(
        brand: brand.text,
        model: model.text,
        year: unknownYear ? null : parsedYear,
      ),
    );
  }

  Widget field(
    String label,
    TextEditingController controller, {
    bool numeric = false,
    bool enabled = true,
  }) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label),
        Container(
          constraints: const BoxConstraints(minHeight: 52),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: const Color(0xFF5E6E81)),
          ),
          child: Semantics(
            label: label,
            textField: true,
            child: EditableText(
              key: ValueKey(label),
              controller: controller,
              focusNode: label == 'Marka'
                  ? brandFocus
                  : label == 'Model'
                  ? modelFocus
                  : yearFocus,
              style: DefaultTextStyle.of(context).style,
              cursorColor: const Color(0xFF0E5BD8),
              backgroundCursorColor: const Color(0xFF5E6E81),
              keyboardType: numeric ? TextInputType.number : TextInputType.text,
              readOnly: !enabled || widget.busy,
              textInputAction: numeric || (label == 'Model' && unknownYear)
                  ? TextInputAction.done
                  : TextInputAction.next,
              onSubmitted: (_) {
                if (numeric || (label == 'Model' && unknownYear)) {
                  submit();
                } else if (label == 'Marka') {
                  modelFocus.requestFocus();
                } else if (!unknownYear) {
                  yearFocus.requestFocus();
                }
              },
            ),
          ),
        ),
      ],
    ),
  );

  final brandFocus = FocusNode();
  final modelFocus = FocusNode();
  final yearFocus = FocusNode();

  @override
  Widget build(BuildContext context) => _Page(
    children: [
      const Text('Motosikletini ekle', style: TextStyle(fontSize: 24)),
      const Text(
        'Bu bilgiler senin beyanındır; teknik varyantı veya rehber uygunluğunu doğrulamaz.',
      ),
      field('Marka', brand),
      field('Model', model),
      field('Yıl', year, numeric: true, enabled: !unknownYear),
      _Action(
        label: 'Yılı bilmiyorum',
        selected: unknownYear,
        onPressed: widget.busy
            ? null
            : () => setState(() {
                unknownYear = !unknownYear;
                yearFocus.canRequestFocus = !unknownYear;
                validationError = null;
                if (unknownYear) yearFocus.unfocus();
              }),
      ),
      Text(
        unknownYear
            ? 'Yıl bilinmiyor; bu belirsizlik korunacak.'
            : 'Yıl biliniyorsa sayıyla yaz.',
      ),
      if (validationError != null)
        Semantics(liveRegion: true, child: Text(validationError!)),
      if (widget.errorMessage != null)
        Semantics(liveRegion: true, child: Text(widget.errorMessage!)),
      if (widget.busy)
        const Text('İstek işleniyor; henüz tamamlanmış sayılmaz.'),
      if (widget.onCreationRequested == null)
        const Text(
          'Motosiklet ekleme şu anda kullanılamıyor. Bilgiler burada taslak olarak kalır.',
        ),
      _Action(
        label: 'Devam',
        onPressed: widget.busy || widget.onCreationRequested == null
            ? null
            : submit,
      ),
      _Action(
        label: 'Geri',
        onPressed: widget.busy ? null : widget.onBackRequested,
      ),
      const Text(
        'Her motosikletin bağlamı ayrı tutulur. Ekleme isteği, uygulama izni değildir.',
      ),
    ],
  );
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
              (child) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: child,
              ),
            )
            .toList(),
      ),
    ),
  );
}

class _Action extends StatefulWidget {
  const _Action({
    super.key,
    required this.label,
    required this.onPressed,
    this.selected,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool? selected;
  @override
  State<_Action> createState() => _ActionState();
}

class _ActionState extends State<_Action> {
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
