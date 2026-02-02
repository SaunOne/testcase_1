import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Configuration for modal appearance
class AppModalConfig {
  const AppModalConfig({
    this.barrierDismissible = true,
    this.barrierColor,
    this.useSafeArea = true,
    this.useRootNavigator = true,
    this.routeSettings,
  });

  final bool barrierDismissible;
  final Color? barrierColor;
  final bool useSafeArea;
  final bool useRootNavigator;
  final RouteSettings? routeSettings;
}

/// Base wrapper for center/dialog modals with consistent styling
class AppModal extends StatelessWidget {
  const AppModal({
    super.key,
    required this.child,
    this.title,
    this.titleWidget,
    this.showCloseButton = true,
    this.onClose,
    this.padding,
    this.width,
    this.maxWidth = 400,
    this.maxHeight,
    this.borderRadius,
    this.backgroundColor,
  });

  final Widget child;
  final String? title;
  final Widget? titleWidget;
  final bool showCloseButton;
  final VoidCallback? onClose;
  final EdgeInsets? padding;
  final double? width;
  final double maxWidth;
  final double? maxHeight;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;

  /// Show this modal as a dialog
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    AppModalConfig config = const AppModalConfig(),
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: config.barrierDismissible,
      barrierColor: config.barrierColor ?? Colors.black54,
      useSafeArea: config.useSafeArea,
      useRootNavigator: config.useRootNavigator,
      routeSettings: config.routeSettings,
      builder: builder,
    );
  }

  /// Close the current modal
  static void close<T>(BuildContext context, [T? result]) {
    Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(16);
    final effectiveBackgroundColor = backgroundColor ?? context.colors.surface;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: AppSpacing.paddingMd,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width ?? maxWidth,
          maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.85,
        ),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: effectiveBackgroundColor,
            borderRadius: effectiveBorderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: effectiveBorderRadius,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (title != null || titleWidget != null || showCloseButton)
                  _buildHeader(context),
                Flexible(
                  child: Padding(
                    padding: padding ?? AppSpacing.paddingMd,
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 8, 0),
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

/// Fullscreen modal that covers the entire screen
///
/// Usage:
/// ```dart
/// context.showFullscreenModal<void>(
///   builder: (context) => AppFullscreenModal(
///     title: 'My Fullscreen Modal',
///     child: YourContent(),
///   ),
/// );
/// ```
class AppFullscreenModal extends StatelessWidget {
  const AppFullscreenModal({
    required this.child,
    super.key,
    this.title,
    this.titleWidget,
    this.showCloseButton = true,
    this.onClose,
    this.padding,
    this.backgroundColor,
    this.leading,
    this.actions,
  });

  final Widget child;
  final String? title;
  final Widget? titleWidget;
  final bool showCloseButton;
  final VoidCallback? onClose;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  /// Leading widget in the app bar (e.g., back button)
  final Widget? leading;

  /// Action widgets in the app bar
  final List<Widget>? actions;

  /// Show a fullscreen modal
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = false,
    bool useRootNavigator = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.transparent,
      useSafeArea: false,
      useRootNavigator: useRootNavigator,
      builder: builder,
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? context.colors.surface;

    // Get safe area padding
    final viewPadding = View.of(context).viewPadding;
    final devicePixelRatio = View.of(context).devicePixelRatio;
    final topSafeArea = viewPadding.top / devicePixelRatio;
    final bottomSafeArea = viewPadding.bottom / devicePixelRatio;

    return Material(
      color: effectiveBackgroundColor,
      child: Column(
        children: [
          // App bar with safe area
          Container(
            padding: EdgeInsets.only(top: topSafeArea),
            decoration: BoxDecoration(
              color: effectiveBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: _buildAppBar(context),
          ),
          // Content
          Expanded(
            child: Padding(
              padding: padding ?? AppSpacing.paddingMd,
              child: child,
            ),
          ),
          // Bottom safe area
          SizedBox(height: bottomSafeArea),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          // Leading / Close button
          if (leading != null)
            leading!
          else if (showCloseButton)
            IconButton(
              onPressed: onClose ?? () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.close_rounded,
                color: context.colors.textPrimary,
              ),
            )
          else
            const SizedBox(width: 16),

          // Title
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

          // Actions
          if (actions != null) ...actions! else const SizedBox(width: 16),
        ],
      ),
    );
  }
}
