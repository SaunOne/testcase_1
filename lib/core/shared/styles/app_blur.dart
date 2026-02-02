import 'dart:ui';

import 'package:flutter/material.dart';

/// Blur and glassmorphism utilities
/// Provides helpers for creating glass-like effects throughout the app
abstract final class AppBlur {
  // ═══════════════════════════════════════════════════════════════════════════
  // BLUR VALUES
  // ═══════════════════════════════════════════════════════════════════════════

  /// Subtle blur - for light glass effects
  static const double subtle = 4.0;

  /// Light blur - for standard glass effects
  static const double light = 8.0;

  /// Medium blur - for prominent glass effects
  static const double medium = 16.0;

  /// Heavy blur - for strong glass effects
  static const double heavy = 24.0;

  /// Extreme blur - for background overlays
  static const double extreme = 40.0;

  // ═══════════════════════════════════════════════════════════════════════════
  // GLASS COLORS
  // ═══════════════════════════════════════════════════════════════════════════

  /// White glass color with opacity
  static Color whiteGlass([double opacity = 0.7]) =>
      Colors.white.withValues(alpha: opacity);

  /// Black glass color with opacity
  static Color blackGlass([double opacity = 0.3]) =>
      Colors.black.withValues(alpha: opacity);

  /// Primary glass color with opacity
  static Color primaryGlass([double opacity = 0.1]) =>
      const Color(0xFF2F80ED).withValues(alpha: opacity);
}

/// A widget that applies a frosted glass effect to its child
class GlassContainer extends StatelessWidget {
  const GlassContainer({
    required this.child,
    this.blur = AppBlur.light,
    this.color,
    this.borderRadius,
    this.border,
    this.padding,
    this.margin,
    super.key,
  });

  final Widget child;
  final double blur;
  final Color? color;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(16);
    final effectiveColor = color ?? AppBlur.whiteGlass(0.7);

    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: effectiveColor,
              borderRadius: effectiveBorderRadius,
              border:
                  border ??
                  Border.all(color: Colors.white.withValues(alpha: 0.2)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// A widget that applies blur effect behind it
class BlurredBackground extends StatelessWidget {
  const BlurredBackground({
    required this.child,
    this.blur = AppBlur.medium,
    this.color,
    super.key,
  });

  final Widget child;
  final double blur;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(color: color ?? Colors.transparent, child: child),
      ),
    );
  }
}
