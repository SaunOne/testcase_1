import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/widgets/modals/app_modal.dart';
import 'package:testcase_1/core/shared/widgets/modals/modal_extensions.dart';

/// Base class for creating fullscreen modals
///
/// Extend this class and override [buildContent] to create your modal content.
/// The modal wrapper (app bar, safe area, padding) is handled automatically.
///
/// Usage:
/// ```dart
/// class MyFullscreenModal extends BaseFullscreenModal<String> {
///   const MyFullscreenModal({super.key});
///
///   @override
///   String? get title => 'Create Post';
///
///   @override
///   List<Widget>? get actions => [
///     TextButton(
///       onPressed: () => close(context, 'saved'),
///       child: Text('Save'),
///     ),
///   ];
///
///   @override
///   Widget buildContent(BuildContext context) {
///     return SingleChildScrollView(
///       child: Column(
///         children: [
///           TextField(decoration: InputDecoration(labelText: 'Title')),
///           TextField(decoration: InputDecoration(labelText: 'Content')),
///         ],
///       ),
///     );
///   }
///
///   static Future<String?> show(BuildContext context) {
///     return context.showFullscreenModal<String>(
///       builder: (_) => const MyFullscreenModal(),
///     );
///   }
/// }
/// ```
abstract class BaseFullscreenModal<T> extends StatelessWidget {
  const BaseFullscreenModal({super.key});

  // ══════════════════════════════════════════════════════════════════════════
  // Configuration - Override these to customize
  // ══════════════════════════════════════════════════════════════════════════

  /// Modal title (optional)
  String? get title => null;

  /// Custom title widget (overrides [title] if provided)
  Widget? get titleWidget => null;

  /// Whether to show close button
  bool get showCloseButton => true;

  /// Leading widget in app bar (overrides close button if provided)
  Widget? get leading => null;

  /// Action widgets in app bar
  List<Widget>? get actions => null;

  /// Content padding
  EdgeInsets? get padding => null;

  /// Background color
  Color? get backgroundColor => null;

  // ══════════════════════════════════════════════════════════════════════════
  // Abstract - Must implement
  // ══════════════════════════════════════════════════════════════════════════

  /// Build the modal content
  Widget buildContent(BuildContext context);

  // ══════════════════════════════════════════════════════════════════════════
  // Helpers
  // ══════════════════════════════════════════════════════════════════════════

  /// Close this modal with optional result
  void close(BuildContext context, [T? result]) {
    context.closeModal(result);
  }

  @override
  Widget build(BuildContext context) {
    return AppFullscreenModal(
      title: title,
      titleWidget: titleWidget,
      showCloseButton: showCloseButton,
      leading: leading,
      actions: actions,
      padding: padding,
      backgroundColor: backgroundColor,
      child: buildContent(context),
    );
  }
}
