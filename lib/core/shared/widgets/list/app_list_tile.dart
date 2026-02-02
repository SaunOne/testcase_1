import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// AppListTile - Consistent list tile widget
///
/// Usage:
/// ```dart
/// AppListTile(
///   title: 'Settings',
///   subtitle: 'Configure your preferences',
///   leading: Icon(Icons.settings),
///   onTap: () => openSettings(),
/// )
///
/// AppListTile.simple(
///   title: 'Notifications',
///   trailing: Switch(value: true, onChanged: (_) {}),
/// )
/// ```
class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.subtitleWidget,
    this.leading,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.contentPadding,
    this.leadingSpacing,
    this.trailingSpacing,
    this.dense = false,
    this.enabled = true,
    this.selected = false,
    this.selectedColor,
    this.backgroundColor,
    this.borderRadius,
  });

  /// Simple list tile without leading
  const factory AppListTile.simple({
    Key? key,
    String? title,
    Widget? titleWidget,
    String? subtitle,
    Widget? subtitleWidget,
    Widget? trailing,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    EdgeInsets? contentPadding,
    bool dense,
    bool enabled,
  }) = _AppListTileSimple;

  final String? title;
  final Widget? titleWidget;
  final String? subtitle;
  final Widget? subtitleWidget;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsets? contentPadding;
  final double? leadingSpacing;
  final double? trailingSpacing;
  final bool dense;
  final bool enabled;
  final bool selected;
  final Color? selectedColor;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectivePadding = contentPadding ?? AppSpacing.listTilePadding;
    final effectiveLeadingSpacing = leadingSpacing ?? AppSpacing.md;
    final effectiveTrailingSpacing = trailingSpacing ?? AppSpacing.sm;

    final titleStyle = (dense ? AppTypography.body : AppTypography.subtitle)
        .copyWith(color: enabled ? colors.textPrimary : colors.textDisabled);

    final subtitleStyle = AppTypography.caption.copyWith(
      color: enabled ? colors.textSecondary : colors.textDisabled,
    );

    Widget content = Padding(
      padding: effectivePadding,
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            SizedBox(width: effectiveLeadingSpacing),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                titleWidget ??
                    (title != null
                        ? Text(title!, style: titleStyle)
                        : const SizedBox.shrink()),
                if (subtitleWidget != null || subtitle != null) ...[
                  SizedBox(height: dense ? AppSpacing.xxs : AppSpacing.xs),
                  subtitleWidget ?? Text(subtitle!, style: subtitleStyle),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            SizedBox(width: effectiveTrailingSpacing),
            trailing!,
          ],
        ],
      ),
    );

    if (onTap != null || onLongPress != null) {
      content = Material(
        color: selected
            ? (selectedColor ?? colors.primaryContainer)
            : (backgroundColor ?? Colors.transparent),
        borderRadius: borderRadius,
        child: InkWell(
          onTap: enabled ? onTap : null,
          onLongPress: enabled ? onLongPress : null,
          borderRadius: borderRadius,
          child: content,
        ),
      );
    } else if (backgroundColor != null || selected) {
      content = Container(
        decoration: BoxDecoration(
          color: selected
              ? (selectedColor ?? colors.primaryContainer)
              : backgroundColor,
          borderRadius: borderRadius,
        ),
        child: content,
      );
    }

    return content;
  }
}

class _AppListTileSimple extends AppListTile {
  const _AppListTileSimple({
    super.key,
    super.title,
    super.titleWidget,
    super.subtitle,
    super.subtitleWidget,
    super.trailing,
    super.onTap,
    super.onLongPress,
    super.contentPadding,
    super.dense = false,
    super.enabled = true,
  });
}
