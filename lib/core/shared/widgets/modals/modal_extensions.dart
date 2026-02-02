import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/widgets/modals/app_bottom_sheet.dart';
import 'package:testcase_1/core/shared/widgets/modals/app_modal.dart';

/// Extension on BuildContext for easy modal access
extension ModalExtensions on BuildContext {
  /// Show a center dialog modal
  ///
  /// Example:
  /// ```dart
  /// final result = await context.showModal<bool>(
  ///   builder: (context) => ExampleModal(),
  /// );
  /// ```
  Future<T?> showModal<T>({
    required WidgetBuilder builder,
    AppModalConfig config = const AppModalConfig(),
  }) {
    return AppModal.show<T>(context: this, builder: builder, config: config);
  }

  /// Show a bottom sheet modal
  ///
  /// Example:
  /// ```dart
  /// final result = await context.showSheet<String>(
  ///   builder: (context) => ExampleBottomSheet(),
  /// );
  /// ```
  Future<T?> showSheet<T>({
    required WidgetBuilder builder,
    AppBottomSheetConfig config = const AppBottomSheetConfig(),
  }) {
    return AppBottomSheet.show<T>(
      context: this,
      builder: builder,
      config: config,
    );
  }

  /// Show a fullscreen bottom sheet modal
  ///
  /// Example:
  /// ```dart
  /// final result = await context.showFullscreenSheet<void>(
  ///   builder: (context) => FullscreenContent(),
  /// );
  /// ```
  Future<T?> showFullscreenSheet<T>({
    required WidgetBuilder builder,
    bool isDismissible = true,
    bool enableDrag = true,
    bool useRootNavigator = true,
    Color? barrierColor,
  }) {
    return AppBottomSheet.showFullscreen<T>(
      context: this,
      builder: builder,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      useRootNavigator: useRootNavigator,
      barrierColor: barrierColor,
    );
  }

  /// Show a draggable/expandable bottom sheet that grows when scrolling up
  ///
  /// Example:
  /// ```dart
  /// final result = await context.showDraggableSheet<void>(
  ///   builder: (context, scrollController) => AppDraggableBottomSheet(
  ///     scrollController: scrollController,
  ///     title: 'My Sheet',
  ///     child: ListView.builder(
  ///       controller: scrollController,
  ///       itemCount: 50,
  ///       itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
  ///     ),
  ///   ),
  /// );
  /// ```
  Future<T?> showDraggableSheet<T>({
    required Widget Function(BuildContext, ScrollController) builder,
    AppDraggableSheetConfig config = const AppDraggableSheetConfig(),
  }) {
    return AppDraggableBottomSheet.show<T>(
      context: this,
      builder: builder,
      config: config,
    );
  }

  /// Show a fullscreen modal
  ///
  /// Example:
  /// ```dart
  /// final result = await context.showFullscreenModal<void>(
  ///   builder: (context) => AppFullscreenModal(
  ///     title: 'My Fullscreen Modal',
  ///     child: YourContent(),
  ///   ),
  /// );
  /// ```
  Future<T?> showFullscreenModal<T>({
    required WidgetBuilder builder,
    bool barrierDismissible = false,
    bool useRootNavigator = true,
  }) {
    return AppFullscreenModal.show<T>(
      context: this,
      builder: builder,
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
    );
  }

  /// Close current modal/sheet and return result
  void closeModal([Object? result]) {
    Navigator.of(this).pop(result);
  }
}

/// Mixin for widgets that are modals - provides common functionality
mixin ModalMixin<T extends StatefulWidget> on State<T> {
  /// Close this modal with optional result
  void closeWithResult<R>([R? result]) {
    Navigator.of(context).pop(result);
  }

  /// Close this modal
  void close() {
    Navigator.of(context).pop();
  }
}
