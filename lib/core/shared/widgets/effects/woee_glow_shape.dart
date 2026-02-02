import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

enum WoeeGlowIntensity { soft, medium, strong }

enum WoeeGlowPreset {
  primary,
  secondary,
  tertiary,
  success,
  warning,
  error,
  info,
}

enum WoeeGlowShapeType { circle, roundedRect }

class WoeeGlowSpec {
  const WoeeGlowSpec({
    required this.alignment,
    this.preset,
    this.color,
    this.colors,
    this.size,
    this.sizeFactor = 0.6,
    this.intensity = WoeeGlowIntensity.soft,
    this.opacity,
    this.blurSigma,
    this.shape = WoeeGlowShapeType.circle,
    this.borderRadius,
  });

  final Alignment alignment;
  final WoeeGlowPreset? preset;
  final Color? color;
  final List<Color>? colors;
  final Size? size;
  final double sizeFactor;
  final WoeeGlowIntensity intensity;
  final double? opacity;
  final double? blurSigma;
  final WoeeGlowShapeType shape;
  final BorderRadius? borderRadius;
}

/// Reusable glow effect widget (circle or rounded rect).
class WoeeGlowShape extends StatelessWidget {
  const WoeeGlowShape({
    this.preset,
    this.color,
    this.colors,
    this.size,
    this.diameter,
    this.intensity = WoeeGlowIntensity.soft,
    this.opacity,
    this.blurSigma,
    this.shape = WoeeGlowShapeType.circle,
    this.borderRadius,
    this.alignment,
    super.key,
  }) : assert(
         size != null || diameter != null,
         'Provide either size or diameter for WoeeGlowShape.',
       );

  final WoeeGlowPreset? preset;
  final Color? color;
  final List<Color>? colors;
  final Size? size;
  final double? diameter;
  final WoeeGlowIntensity intensity;
  final double? opacity;
  final double? blurSigma;
  final WoeeGlowShapeType shape;
  final BorderRadius? borderRadius;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    final resolvedSize = size ?? Size.square(diameter ?? 0);
    final isDark = context.isDarkMode;
    final resolvedOpacity = opacity ?? _opacityFor(intensity, isDark);
    final resolvedBlur = blurSigma ?? _blurFor(intensity, isDark);
    final resolvedColors = _resolveColors(context, resolvedOpacity);
    final resolvedBorderRadius = shape == WoeeGlowShapeType.circle
        ? null
        : borderRadius ?? BorderRadius.circular(resolvedSize.shortestSide / 2);

    final glow = ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: resolvedBlur, sigmaY: resolvedBlur),
      child: Container(
        width: resolvedSize.width,
        height: resolvedSize.height,
        decoration: BoxDecoration(
          shape: shape == WoeeGlowShapeType.circle
              ? BoxShape.circle
              : BoxShape.rectangle,
          borderRadius: resolvedBorderRadius,
          gradient: RadialGradient(colors: resolvedColors, stops: const [0, 1]),
        ),
      ),
    );

    final widget = IgnorePointer(child: glow);

    return alignment == null
        ? widget
        : Align(alignment: alignment!, child: widget);
  }

  List<Color> _resolveColors(BuildContext context, double resolvedOpacity) {
    if (colors != null && colors!.isNotEmpty) {
      return _applyOpacity(colors!, resolvedOpacity);
    }

    final baseColor = color ?? _colorForPreset(context, preset);
    return [
      baseColor.withValues(alpha: resolvedOpacity),
      baseColor.withValues(alpha: 0),
    ];
  }

  List<Color> _applyOpacity(List<Color> input, double alpha) {
    if (alpha >= 1) {
      return input;
    }
    return input.map((c) => c.withValues(alpha: c.opacity * alpha)).toList();
  }

  Color _colorForPreset(BuildContext context, WoeeGlowPreset? preset) {
    switch (preset) {
      case WoeeGlowPreset.secondary:
        return context.colors.secondary;
      case WoeeGlowPreset.tertiary:
        return context.colors.tertiary;
      case WoeeGlowPreset.success:
        return context.colors.success;
      case WoeeGlowPreset.warning:
        return context.colors.warning;
      case WoeeGlowPreset.error:
        return context.colors.error;
      case WoeeGlowPreset.info:
        return context.colors.info;
      case WoeeGlowPreset.primary:
      case null:
        return context.colors.primary;
    }
  }

  double _opacityFor(WoeeGlowIntensity intensity, bool isDark) {
    switch (intensity) {
      case WoeeGlowIntensity.strong:
        return isDark ? 0.36 : 0.24;
      case WoeeGlowIntensity.medium:
        return isDark ? 0.28 : 0.18;
      case WoeeGlowIntensity.soft:
        return isDark ? 0.22 : 0.14;
    }
  }

  double _blurFor(WoeeGlowIntensity intensity, bool isDark) {
    switch (intensity) {
      case WoeeGlowIntensity.strong:
        return isDark ? 55 : 45;
      case WoeeGlowIntensity.medium:
        return isDark ? 70 : 55;
      case WoeeGlowIntensity.soft:
        return isDark ? 90 : 70;
    }
  }
}

/// Multiple glows as a reusable cluster (sizeFactor relative to base size).
class WoeeGlowCluster extends StatelessWidget {
  const WoeeGlowCluster({required this.glows, this.baseSize, super.key});

  final List<WoeeGlowSpec> glows;
  final double? baseSize;

  @override
  Widget build(BuildContext context) {
    if (baseSize != null) {
      return _buildCluster(context, baseSize!);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final resolvedBase = _resolveBaseSize(constraints);
        return _buildCluster(context, resolvedBase);
      },
    );
  }

  Widget _buildCluster(BuildContext context, double resolvedBase) {
    return Stack(
      children: [
        for (final glow in glows)
          WoeeGlowShape(
            alignment: glow.alignment,
            preset: glow.preset,
            color: glow.color,
            colors: glow.colors,
            size: glow.size ?? Size.square(resolvedBase * glow.sizeFactor),
            intensity: glow.intensity,
            opacity: glow.opacity,
            blurSigma: glow.blurSigma,
            shape: glow.shape,
            borderRadius: glow.borderRadius,
          ),
      ],
    );
  }

  double _resolveBaseSize(BoxConstraints constraints) {
    if (constraints.hasBoundedWidth && constraints.hasBoundedHeight) {
      final shortest = constraints.maxWidth < constraints.maxHeight
          ? constraints.maxWidth
          : constraints.maxHeight;
      return shortest;
    }
    if (constraints.hasBoundedWidth) {
      return constraints.maxWidth;
    }
    if (constraints.hasBoundedHeight) {
      return constraints.maxHeight;
    }
    return 360;
  }
}
