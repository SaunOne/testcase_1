import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// AppSection - Section with title and content
///
/// Features:
/// - Consistent title styling
/// - Optional subtitle and trailing action
/// - Automatic spacing
///
/// Usage:
/// ```dart
/// AppSection(
///   title: 'Recent Items',
///   child: ListView(...),
/// )
///
/// AppSection(
///   title: 'Settings',
///   subtitle: 'Customize your experience',
///   trailing: TextButton(onPressed: () {}, child: Text('See All')),
///   child: SettingsList(),
/// )
/// ```
class AppSection extends StatelessWidget {
  const AppSection({
    required this.child,
    super.key,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.trailing,
    this.padding,
    this.titlePadding,
    this.contentPadding,
    this.spacing,
  });

  final Widget child;
  final String? title;
  final Widget? titleWidget;
  final String? subtitle;
  final Widget? trailing;
  final EdgeInsets? padding;
  final EdgeInsets? titlePadding;
  final EdgeInsets? contentPadding;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final hasHeader = title != null || titleWidget != null || trailing != null;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasHeader)
            Padding(
              padding: titlePadding ?? AppSpacing.pageHorizontal,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleWidget ??
                            (title != null
                                ? Text(
                                    title!,
                                    style: AppTypography.title.copyWith(
                                      color: colors.textPrimary,
                                    ),
                                  )
                                : const SizedBox.shrink()),
                        if (subtitle != null) ...[
                          SizedBox(height: AppSpacing.xxs),
                          Text(
                            subtitle!,
                            style: AppTypography.caption.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (trailing != null) trailing!,
                ],
              ),
            ),
          if (hasHeader) SizedBox(height: spacing ?? AppSpacing.sm),
          Padding(padding: contentPadding ?? EdgeInsets.zero, child: child),
        ],
      ),
    );
  }
}
