import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/widgets/modals/app_modal.dart';
import 'package:testcase_1/core/shared/widgets/modals/modal_extensions.dart';

/// Base class for creating simple dialog modals
///
/// Extend this class and override [buildContent] to create your modal content.
/// The modal wrapper (title, close button, padding) is handled automatically.
///
/// Usage:
/// ```dart
/// class MyModal extends BaseModal<bool> {
///   const MyModal({super.key});
///
///   @override
///   String? get title => 'My Modal Title';
///
///   @override
///   Widget buildContent(BuildContext context) {
///     return Column(
///       children: [
///         Text('Your content here'),
///         ElevatedButton(
///           onPressed: () => close(context, true),
///           child: Text('Confirm'),
///         ),
///       ],
///     );
///   }
///
///   static Future<bool?> show(BuildContext context) {
///     return context.showModal<bool>(builder: (_) => const MyModal());
///   }
/// }
/// ```
abstract class BaseModal<T> extends StatelessWidget {
  const BaseModal({super.key});

  // ══════════════════════════════════════════════════════════════════════════
  // Configuration - Override these to customize
  // ══════════════════════════════════════════════════════════════════════════

  /// Modal title (optional)
  String? get title => null;

  /// Custom title widget (overrides [title] if provided)
  Widget? get titleWidget => null;

  /// Whether to show close button
  bool get showCloseButton => true;

  /// Content padding
  EdgeInsets? get padding => null;

  /// Modal width
  double? get width => null;

  /// Modal max width
  double get maxWidth => 400;

  /// Modal max height
  double? get maxHeight => null;

  /// Border radius
  BorderRadius? get borderRadius => null;

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
    return AppModal(
      title: title,
      titleWidget: titleWidget,
      showCloseButton: showCloseButton,
      padding: padding,
      width: width,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      child: buildContent(context),
    );
  }
}
