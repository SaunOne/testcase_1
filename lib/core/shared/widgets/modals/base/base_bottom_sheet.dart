import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/widgets/modals/app_bottom_sheet.dart';
import 'package:testcase_1/core/shared/widgets/modals/modal_extensions.dart';

/// Base class for creating simple bottom sheet modals
///
/// Extend this class and override [buildContent] to create your sheet content.
/// The sheet wrapper (title, drag handle, padding) is handled automatically.
///
/// Usage:
/// ```dart
/// class MySheet extends BaseBottomSheet<String> {
///   const MySheet({super.key});
///
///   @override
///   String? get title => 'Select Option';
///
///   @override
///   Widget buildContent(BuildContext context) {
///     return Column(
///       children: [
///         ListTile(
///           title: Text('Option 1'),
///           onTap: () => close(context, 'option1'),
///         ),
///       ],
///     );
///   }
///
///   static Future<String?> show(BuildContext context) {
///     return context.showSheet<String>(builder: (_) => const MySheet());
///   }
/// }
/// ```
abstract class BaseBottomSheet<T> extends StatelessWidget {
  const BaseBottomSheet({super.key});

  // ══════════════════════════════════════════════════════════════════════════
  // Configuration - Override these to customize
  // ══════════════════════════════════════════════════════════════════════════

  /// Sheet title (optional)
  String? get title => null;

  /// Custom title widget (overrides [title] if provided)
  Widget? get titleWidget => null;

  /// Whether to show close button
  bool get showCloseButton => false;

  /// Whether to show drag handle
  bool get showDragHandle => true;

  /// Content padding
  EdgeInsets? get padding => null;

  /// Max height as fraction of screen (0.0 to 1.0)
  double? get maxHeight => null;

  /// Border radius
  BorderRadius? get borderRadius => null;

  /// Background color
  Color? get backgroundColor => null;

  // ══════════════════════════════════════════════════════════════════════════
  // Abstract - Must implement
  // ══════════════════════════════════════════════════════════════════════════

  /// Build the sheet content
  Widget buildContent(BuildContext context);

  // ══════════════════════════════════════════════════════════════════════════
  // Helpers
  // ══════════════════════════════════════════════════════════════════════════

  /// Close this sheet with optional result
  void close(BuildContext context, [T? result]) {
    context.closeModal(result);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return AppBottomSheet(
      title: title,
      titleWidget: titleWidget,
      showCloseButton: showCloseButton,
      showDragHandle: showDragHandle,
      padding: padding,
      maxHeight: maxHeight != null ? screenHeight * maxHeight! : null,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      child: buildContent(context),
    );
  }
}

/// Base class for creating draggable/expandable bottom sheets
///
/// Extend this class and override [buildContent] to create your sheet content.
/// The sheet automatically expands when scrolling up and shrinks when scrolling down.
///
/// Usage:
/// ```dart
/// class MyDraggableSheet extends BaseDraggableSheet<String> {
///   const MyDraggableSheet({required super.scrollController, super.key});
///
///   @override
///   String? get title => 'Select Items';
///
///   @override
///   Widget buildContent(BuildContext context) {
///     return ListView.builder(
///       controller: scrollController,
///       itemCount: 50,
///       itemBuilder: (context, index) => ListTile(
///         title: Text('Item $index'),
///         onTap: () => close(context, 'item_$index'),
///       ),
///     );
///   }
///
///   static Future<String?> show(BuildContext context) {
///     return context.showDraggableSheet<String>(
///       config: const AppDraggableSheetConfig(
///         initialChildSize: 0.5,
///         maxChildSize: 1.0,
///         snap: true,
///         snapSizes: [0.25, 0.5, 1.0],
///       ),
///       builder: (_, controller) => MyDraggableSheet(scrollController: controller),
///     );
///   }
/// }
/// ```
abstract class BaseDraggableSheet<T> extends StatelessWidget {
  const BaseDraggableSheet({required this.scrollController, super.key});

  final ScrollController scrollController;

  // ══════════════════════════════════════════════════════════════════════════
  // Configuration - Override these to customize
  // ══════════════════════════════════════════════════════════════════════════

  /// Sheet title (optional)
  String? get title => null;

  /// Custom title widget (overrides [title] if provided)
  Widget? get titleWidget => null;

  /// Whether to show close button
  bool get showCloseButton => false;

  /// Whether to show drag handle (hidden when fullscreen)
  bool get showDragHandle => true;

  /// Content padding
  EdgeInsets? get padding => null;

  /// Border radius (animates to 0 when fullscreen)
  BorderRadius? get borderRadius => null;

  /// Background color
  Color? get backgroundColor => null;

  // ══════════════════════════════════════════════════════════════════════════
  // Abstract - Must implement
  // ══════════════════════════════════════════════════════════════════════════

  /// Build the sheet content (use [scrollController] for ListView/ScrollView)
  Widget buildContent(BuildContext context);

  // ══════════════════════════════════════════════════════════════════════════
  // Helpers
  // ══════════════════════════════════════════════════════════════════════════

  /// Close this sheet with optional result
  void close(BuildContext context, [T? result]) {
    context.closeModal(result);
  }

  @override
  Widget build(BuildContext context) {
    return AppDraggableBottomSheet(
      scrollController: scrollController,
      title: title,
      titleWidget: titleWidget,
      showCloseButton: showCloseButton,
      showDragHandle: showDragHandle,
      padding: padding,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      child: buildContent(context),
    );
  }
}
