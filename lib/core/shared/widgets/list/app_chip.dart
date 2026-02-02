import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// AppChip - Consistent chip/tag widget
///
/// Usage:
/// ```dart
/// AppChip(label: 'Technology')
///
/// AppChip.status(label: 'Active', color: Colors.green)
///
/// AppChip.filter(
///   label: 'Popular',
///   selected: isSelected,
///   onSelected: (selected) => toggleFilter(),
/// )
/// ```
class AppChip extends StatelessWidget {
  const AppChip({
    required this.label,
    super.key,
    this.labelWidget,
    this.avatar,
    this.deleteIcon,
    this.onDeleted,
    this.onTap,
    this.backgroundColor,
    this.labelColor,
    this.borderColor,
    this.padding,
    this.borderRadius,
    this.elevation,
  });

  /// Status chip with colored background
  factory AppChip.status({
    required String label,
    Key? key,
    Color? color,
    Color? labelColor,
  }) {
    return _AppChipStatus(
      label: label,
      key: key,
      statusColor: color,
      labelColor: labelColor,
    );
  }

  /// Filter chip (selectable)
  factory AppChip.filter({
    required String label,
    Key? key,
    bool selected = false,
    ValueChanged<bool>? onSelected,
    Widget? avatar,
  }) {
    return _AppChipFilter(
      label: label,
      key: key,
      selected: selected,
      onSelected: onSelected,
      avatar: avatar,
    );
  }

  /// Input chip (with optional delete)
  factory AppChip.input({
    required String label,
    Key? key,
    Widget? avatar,
    VoidCallback? onDeleted,
    VoidCallback? onTap,
  }) {
    return _AppChipInput(
      label: label,
      key: key,
      avatar: avatar,
      onDeleted: onDeleted,
      onTap: onTap,
    );
  }

  final String label;
  final Widget? labelWidget;
  final Widget? avatar;
  final Widget? deleteIcon;
  final VoidCallback? onDeleted;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectivePadding =
        padding ??
        const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        );
    final effectiveBorderRadius = borderRadius ?? AppRadius.borderChip;

    Widget chip = Container(
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.surfaceAlt,
        borderRadius: effectiveBorderRadius,
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (avatar != null) ...[avatar!, SizedBox(width: AppSpacing.xs)],
          labelWidget ??
              Text(
                label,
                style: AppTypography.caption.copyWith(
                  color: labelColor ?? colors.textPrimary,
                ),
              ),
          if (onDeleted != null) ...[
            SizedBox(width: AppSpacing.xs),
            GestureDetector(
              onTap: onDeleted,
              child:
                  deleteIcon ??
                  Icon(
                    Icons.close_rounded,
                    size: AppSizes.iconSm,
                    color: labelColor ?? colors.textSecondary,
                  ),
            ),
          ],
        ],
      ),
    );

    if (onTap != null) {
      chip = GestureDetector(onTap: onTap, child: chip);
    }

    return chip;
  }
}

class _AppChipStatus extends AppChip {
  const _AppChipStatus({
    required super.label,
    super.key,
    this.statusColor,
    super.labelColor,
  });

  final Color? statusColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectiveColor = statusColor ?? colors.primary;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: effectiveColor.withValues(alpha: 0.15),
        borderRadius: AppRadius.borderChip,
      ),
      child: Text(
        label,
        style: AppTypography.captionBold.copyWith(
          color: labelColor ?? effectiveColor,
        ),
      ),
    );
  }
}

class _AppChipFilter extends AppChip {
  const _AppChipFilter({
    required super.label,
    super.key,
    this.selected = false,
    this.onSelected,
    super.avatar,
  });

  final bool selected;
  final ValueChanged<bool>? onSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return FilterChip(
      label: Text(label),
      avatar: avatar,
      selected: selected,
      onSelected: onSelected,
      labelStyle: AppTypography.caption.copyWith(
        color: selected ? colors.onPrimary : colors.textPrimary,
      ),
      backgroundColor: colors.surfaceAlt,
      selectedColor: colors.primary,
      checkmarkColor: colors.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.borderChip),
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
    );
  }
}

class _AppChipInput extends AppChip {
  const _AppChipInput({
    required super.label,
    super.key,
    super.avatar,
    super.onDeleted,
    super.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InputChip(
      label: Text(label),
      avatar: avatar,
      onDeleted: onDeleted,
      onPressed: onTap,
      labelStyle: AppTypography.caption.copyWith(color: colors.textPrimary),
      backgroundColor: colors.surfaceAlt,
      deleteIconColor: colors.textSecondary,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.borderChip),
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
    );
  }
}
