import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// AppContainer - Reusable container with consistent styling
///
/// Features:
/// - Default padding from tokens
/// - Optional border radius, background, border
/// - Respects design tokens for consistency
///
/// Usage:
/// ```dart
/// AppContainer(
///   child: Text('Content'),
/// )
///
/// AppContainer.card(
///   child: Text('Card content'),
/// )
/// ```
class AppContainer extends StatelessWidget {
  const AppContainer({
    required this.child,
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.constraints,
    this.decoration,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.shadow,
    this.clipBehavior = Clip.none,
  });

  /// Card-style container with surface background and border
  const factory AppContainer.card({
    required Widget child,
    Key? key,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? width,
    double? height,
    BoxConstraints? constraints,
    BorderRadius? borderRadius,
    List<BoxShadow>? shadow,
    Clip clipBehavior,
  }) = _AppContainerCard;

  /// Surface container (elevated look)
  const factory AppContainer.surface({
    required Widget child,
    Key? key,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? width,
    double? height,
    BoxConstraints? constraints,
    BorderRadius? borderRadius,
    Clip clipBehavior,
  }) = _AppContainerSurface;

  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final BoxDecoration? decoration;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Border? border;
  final List<BoxShadow>? shadow;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? AppSpacing.paddingMd,
      margin: margin,
      constraints: constraints,
      clipBehavior: clipBehavior,
      decoration:
          decoration ??
          BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
            border: border,
            boxShadow: shadow,
          ),
      child: child,
    );
  }
}

class _AppContainerCard extends AppContainer {
  const _AppContainerCard({
    required super.child,
    super.key,
    super.padding,
    super.margin,
    super.width,
    super.height,
    super.constraints,
    super.borderRadius,
    super.shadow,
    super.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: width,
      height: height,
      padding: padding ?? AppSpacing.card,
      margin: margin,
      constraints: constraints,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: borderRadius ?? AppRadius.borderCard,
        border: Border.all(color: colors.border),
        boxShadow: shadow ?? AppShadows.card,
      ),
      child: child,
    );
  }
}

class _AppContainerSurface extends AppContainer {
  const _AppContainerSurface({
    required super.child,
    super.key,
    super.padding,
    super.margin,
    super.width,
    super.height,
    super.constraints,
    super.borderRadius,
    super.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: width,
      height: height,
      padding: padding ?? AppSpacing.card,
      margin: margin,
      constraints: constraints,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: borderRadius ?? AppRadius.borderContainer,
        boxShadow: AppShadows.sm,
      ),
      child: child,
    );
  }
}
