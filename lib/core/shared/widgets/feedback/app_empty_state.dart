import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// AppEmptyState - Consistent empty state widget
///
/// Usage:
/// ```dart
/// AppEmptyState(
///   icon: Icons.inbox_rounded,
///   title: 'No messages',
///   message: 'You have no messages yet',
/// )
///
/// AppEmptyState.withAction(
///   icon: Icons.search_off_rounded,
///   title: 'No results',
///   message: 'Try a different search',
///   actionLabel: 'Clear Search',
///   onAction: () => clearSearch(),
/// )
/// ```
class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    this.icon,
    this.iconWidget,
    this.title,
    this.message,
    this.actionLabel,
    this.onAction,
    this.iconSize,
    this.iconColor,
    this.padding,
  });

  /// Empty state with action button
  factory AppEmptyState.withAction({
    Key? key,
    IconData? icon,
    Widget? iconWidget,
    String? title,
    String? message,
    required String actionLabel,
    required VoidCallback onAction,
    double? iconSize,
    Color? iconColor,
    EdgeInsets? padding,
  }) {
    return AppEmptyState(
      key: key,
      icon: icon,
      iconWidget: iconWidget,
      title: title,
      message: message,
      actionLabel: actionLabel,
      onAction: onAction,
      iconSize: iconSize,
      iconColor: iconColor,
      padding: padding,
    );
  }

  final IconData? icon;
  final Widget? iconWidget;
  final String? title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: padding ?? AppSpacing.paddingLg,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconWidget != null)
              iconWidget!
            else if (icon != null)
              Icon(
                icon,
                size: iconSize ?? AppSizes.iconXxl,
                color: iconColor ?? colors.textSecondary,
              ),
            if (icon != null || iconWidget != null) AppSpacing.heightMd,
            if (title != null)
              Text(
                title!,
                style: AppTypography.title.copyWith(color: colors.textPrimary),
                textAlign: TextAlign.center,
              ),
            if (title != null && message != null) AppSpacing.heightSm,
            if (message != null)
              Text(
                message!,
                style: AppTypography.body.copyWith(color: colors.textSecondary),
                textAlign: TextAlign.center,
              ),
            if (actionLabel != null && onAction != null) ...[
              AppSpacing.heightLg,
              ElevatedButton(onPressed: onAction, child: Text(actionLabel!)),
            ],
          ],
        ),
      ),
    );
  }
}
