import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// AppDivider - Consistent divider using design tokens
///
/// Features:
/// - Uses color from tokens
/// - Consistent thickness
/// - Optional label for sectioned dividers
///
/// Usage:
/// ```dart
/// AppDivider()
///
/// AppDivider.withLabel('OR')
///
/// AppDivider(indent: 16)
/// ```
class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
  });

  /// Vertical divider
  const factory AppDivider.vertical({
    Key? key,
    double? width,
    double? thickness,
    double? indent,
    double? endIndent,
    Color? color,
  }) = _AppDividerVertical;

  /// Divider with label in the middle
  const factory AppDivider.withLabel(
    String label, {
    Key? key,
    double? height,
    double? thickness,
    Color? color,
    TextStyle? labelStyle,
    double? spacing,
  }) = _AppDividerWithLabel;

  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Divider(
      height: height ?? AppSpacing.md,
      thickness: thickness ?? AppSizes.divider,
      indent: indent,
      endIndent: endIndent,
      color: color ?? colors.divider,
    );
  }
}

class _AppDividerVertical extends AppDivider {
  const _AppDividerVertical({
    super.key,
    this.width,
    super.thickness,
    super.indent,
    super.endIndent,
    super.color,
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return VerticalDivider(
      width: width ?? AppSpacing.md,
      thickness: thickness ?? AppSizes.divider,
      indent: indent,
      endIndent: endIndent,
      color: color ?? colors.divider,
    );
  }
}

class _AppDividerWithLabel extends AppDivider {
  const _AppDividerWithLabel(
    this.label, {
    super.key,
    super.height,
    super.thickness,
    super.color,
    this.labelStyle,
    this.spacing,
  });

  final String label;
  final TextStyle? labelStyle;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectiveSpacing = spacing ?? AppSpacing.md;

    return Row(
      children: [
        Expanded(
          child: Divider(
            height: height ?? AppSpacing.md,
            thickness: thickness ?? AppSizes.divider,
            color: color ?? colors.divider,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: effectiveSpacing),
          child: Text(
            label,
            style:
                labelStyle ??
                AppTypography.caption.copyWith(color: colors.textSecondary),
          ),
        ),
        Expanded(
          child: Divider(
            height: height ?? AppSpacing.md,
            thickness: thickness ?? AppSizes.divider,
            color: color ?? colors.divider,
          ),
        ),
      ],
    );
  }
}
