import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// AppCard - Consistent card widget using design tokens
///
/// Features:
/// - Automatic border radius from tokens
/// - Consistent padding and shadows
/// - Optional onTap for interactive cards
///
/// Usage:
/// ```dart
/// AppCard(
///   child: Text('Card content'),
/// )
///
/// AppCard(
///   onTap: () => print('tapped'),
///   child: Text('Tappable card'),
/// )
/// ```
class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    super.key,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.shadow,
    this.onTap,
    this.onLongPress,
    this.elevation,
    this.clipBehavior = Clip.antiAlias,
  });

  /// Outlined card (no background fill)
  const factory AppCard.outlined({
    required Widget child,
    Key? key,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BorderRadius? borderRadius,
    Color? borderColor,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
  }) = _AppCardOutlined;

  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final List<BoxShadow>? shadow;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double? elevation;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectiveBorderRadius = borderRadius ?? AppRadius.borderCard;

    Widget card = Container(
      margin: margin,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.surface,
        borderRadius: effectiveBorderRadius,
        border: Border.all(color: borderColor ?? colors.border),
        boxShadow: shadow ?? AppShadows.card,
      ),
      child: Padding(padding: padding ?? AppSpacing.card, child: child),
    );

    if (onTap != null || onLongPress != null) {
      card = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          borderRadius: effectiveBorderRadius,
          child: card,
        ),
      );
    }

    return card;
  }
}

class _AppCardOutlined extends AppCard {
  const _AppCardOutlined({
    required super.child,
    super.key,
    super.padding,
    super.margin,
    super.borderRadius,
    super.borderColor,
    super.onTap,
    super.onLongPress,
  }) : super(backgroundColor: Colors.transparent, shadow: AppShadows.none);
}
