import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Configuration for bottom sheet appearance
class AppBottomSheetConfig {
  const AppBottomSheetConfig({
    this.isDismissible = true,
    this.enableDrag = true,
    this.showDragHandle = true,
    this.isScrollControlled = true,
    this.useSafeArea = true,
    this.useRootNavigator =
        true, // Default true to show above bottom navigation
    this.barrierColor,
    this.routeSettings,
    this.constraints,
  });

  final bool isDismissible;
  final bool enableDrag;
  final bool showDragHandle;
  final bool isScrollControlled;
  final bool useSafeArea;
  final bool useRootNavigator;
  final Color? barrierColor;
  final RouteSettings? routeSettings;
  final BoxConstraints? constraints;
}

/// Configuration for draggable/expandable bottom sheet
class AppDraggableSheetConfig {
  const AppDraggableSheetConfig({
    this.isDismissible = true,
    this.enableDrag = true,
    this.useSafeArea = true,
    this.useRootNavigator = true,
    this.barrierColor,
    this.routeSettings,
    this.initialChildSize = 0.5,
    this.minChildSize = 0.25,
    this.maxChildSize = 0.95,
    this.expand = false,
    this.snap = false,
    this.snapSizes,
  });

  final bool isDismissible;
  final bool enableDrag;
  final bool useSafeArea;
  final bool useRootNavigator;
  final Color? barrierColor;
  final RouteSettings? routeSettings;

  /// Initial height as fraction of screen (0.0 to 1.0)
  final double initialChildSize;

  /// Minimum height as fraction of screen (0.0 to 1.0)
  final double minChildSize;

  /// Maximum height as fraction of screen (0.0 to 1.0)
  final double maxChildSize;

  /// Whether the sheet should expand to fill available space
  final bool expand;

  /// Whether to snap to snap sizes
  final bool snap;

  /// Sizes to snap to (e.g., [0.25, 0.5, 1.0])
  final List<double>? snapSizes;
}

/// Base wrapper for bottom sheet modals with consistent styling
class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    required this.child,
    super.key,
    this.title,
    this.titleWidget,
    this.showCloseButton = false,
    this.showDragHandle = true,
    this.onClose,
    this.padding,
    this.maxHeight,
    this.borderRadius,
    this.backgroundColor,
  });

  final Widget child;
  final String? title;
  final Widget? titleWidget;
  final bool showCloseButton;
  final bool showDragHandle;
  final VoidCallback? onClose;
  final EdgeInsets? padding;
  final double? maxHeight;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;

  /// Show this bottom sheet
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    AppBottomSheetConfig config = const AppBottomSheetConfig(),
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: config.isDismissible,
      enableDrag: config.enableDrag,
      showDragHandle: false, // We handle this ourselves
      isScrollControlled: config.isScrollControlled,
      useSafeArea: config.useSafeArea,
      useRootNavigator: config.useRootNavigator,
      barrierColor: config.barrierColor ?? Colors.black54,
      routeSettings: config.routeSettings,
      constraints: config.constraints,
      backgroundColor: Colors.transparent,
      builder: builder,
    );
  }

  /// Close the current bottom sheet
  static void close<T>(BuildContext context, [T? result]) {
    Navigator.of(context).pop(result);
  }

  /// Show a fullscreen bottom sheet
  static Future<T?> showFullscreen<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool isDismissible = true,
    bool enableDrag = true,
    bool useRootNavigator = true,
    Color? barrierColor,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: false,
      isScrollControlled: true,
      useSafeArea: false, // Fullscreen ignores safe area
      useRootNavigator: useRootNavigator,
      barrierColor: barrierColor ?? Colors.black54,
      backgroundColor: Colors.transparent,
      builder: builder,
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius =
        borderRadius ?? const BorderRadius.vertical(top: Radius.circular(20));
    final effectiveBackgroundColor = backgroundColor ?? context.colors.surface;

    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.9,
      ),
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: effectiveBorderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showDragHandle) _buildDragHandle(context),
            if (title != null || titleWidget != null || showCloseButton)
              _buildHeader(context),
            Flexible(
              child: Padding(
                padding: padding ?? AppSpacing.paddingMd,
                child: child,
              ),
            ),
            // Bottom safe area padding
            SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
          ],
        ),
      ),
    );
  }

  Widget _buildDragHandle(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 12, bottom: 8),
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: context.colors.textSecondary.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        showDragHandle ? 0 : 16,
        showCloseButton ? 8 : 20,
        8,
      ),
      child: Row(
        children: [
          Expanded(
            child:
                titleWidget ??
                (title != null
                    ? Text(
                        title!,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : const SizedBox.shrink()),
          ),
          if (showCloseButton)
            IconButton(
              onPressed: onClose ?? () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.close_rounded,
                color: context.colors.textSecondary,
              ),
              splashRadius: 20,
            ),
        ],
      ),
    );
  }
}

/// Draggable/expandable bottom sheet that grows when scrolling up
///
/// When expanded to fullscreen (maxChildSize = 1.0), the border radius
/// animates to 0 for a seamless fullscreen experience.
///
/// Usage:
/// ```dart
/// context.showDraggableSheet<void>(
///   builder: (context, scrollController) => AppDraggableBottomSheet(
///     scrollController: scrollController,
///     title: 'My Sheet',
///     child: ListView.builder(...),
///   ),
/// );
/// ```
class AppDraggableBottomSheet extends StatefulWidget {
  const AppDraggableBottomSheet({
    required this.child,
    required this.scrollController,
    super.key,
    this.title,
    this.titleWidget,
    this.showCloseButton = false,
    this.showDragHandle = true,
    this.onClose,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
  });

  final Widget child;
  final ScrollController scrollController;
  final String? title;
  final Widget? titleWidget;
  final bool showCloseButton;
  final bool showDragHandle;
  final VoidCallback? onClose;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;

  /// Show a draggable/expandable bottom sheet
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget Function(BuildContext, ScrollController) builder,
    AppDraggableSheetConfig config = const AppDraggableSheetConfig(),
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: config.isDismissible,
      enableDrag: config.enableDrag,
      showDragHandle: false,
      isScrollControlled: true,
      useSafeArea: false, // We handle safe area ourselves for fullscreen
      useRootNavigator: config.useRootNavigator,
      barrierColor: config.barrierColor ?? Colors.black54,
      routeSettings: config.routeSettings,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: config.initialChildSize,
        minChildSize: config.minChildSize,
        maxChildSize: config.maxChildSize,
        expand: config.expand,
        snap: config.snap,
        snapSizes: config.snapSizes,
        builder: (context, scrollController) =>
            builder(context, scrollController),
      ),
    );
  }

  @override
  State<AppDraggableBottomSheet> createState() =>
      _AppDraggableBottomSheetState();
}

class _AppDraggableBottomSheetState extends State<AppDraggableBottomSheet> {
  double _currentExtent = 0.5;

  @override
  Widget build(BuildContext context) {
    // Calculate border radius based on extent (0 when fullscreen)
    final isFullscreen = _currentExtent >= 0.98;
    final effectiveBorderRadius = isFullscreen
        ? BorderRadius.zero
        : (widget.borderRadius ??
              const BorderRadius.vertical(top: Radius.circular(20)));
    final effectiveBackgroundColor =
        widget.backgroundColor ?? context.colors.surface;

    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        setState(() {
          _currentExtent = notification.extent;
        });
        return false;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: effectiveBorderRadius,
          boxShadow: isFullscreen
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
        ),
        child: ClipRRect(
          borderRadius: effectiveBorderRadius,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Fixed header section with safe area when fullscreen
              if (widget.showDragHandle && !isFullscreen)
                _buildDragHandle(context),
              _buildHeader(context, isFullscreen: isFullscreen),
              // Scrollable content
              Expanded(
                child: Padding(
                  padding: widget.padding ?? AppSpacing.paddingMd,
                  child: widget.child,
                ),
              ),
              // Bottom safe area padding
              SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDragHandle(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 12, bottom: 8),
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: context.colors.textSecondary.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, {required bool isFullscreen}) {
    final hasHeader =
        widget.title != null ||
        widget.titleWidget != null ||
        widget.showCloseButton;

    if (!hasHeader && !isFullscreen) {
      return const SizedBox.shrink();
    }

    // Get the actual system padding from View, not MediaQuery
    // This ensures we get the real safe area even when useSafeArea is false
    final viewPadding = View.of(context).viewPadding;
    final devicePixelRatio = View.of(context).devicePixelRatio;
    final topSafeArea = viewPadding.top / devicePixelRatio;

    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        // Add safe area top padding when fullscreen
        isFullscreen ? topSafeArea + 16 : (widget.showDragHandle ? 0 : 16),
        widget.showCloseButton ? 8 : 20,
        0,
      ),
      child: Row(
        children: [
          Expanded(
            child:
                widget.titleWidget ??
                (widget.title != null
                    ? Text(
                        widget.title!,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : const SizedBox.shrink()),
          ),
          if (widget.showCloseButton)
            IconButton(
              onPressed: widget.onClose ?? () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.close_rounded,
                color: context.colors.textSecondary,
              ),
              splashRadius: 20,
            ),
        ],
      ),
    );
  }
}
