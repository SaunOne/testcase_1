import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/app_gradients.dart';
import 'package:testcase_1/core/shared/widgets/backgrounds/woee_line_silhouette_bg.dart';
import 'package:testcase_1/core/shared/widgets/backgrounds/woee_organic_lines_bg.dart';
import 'package:testcase_1/core/shared/widgets/effects/woee_glow_shape.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Line pattern style for background
enum WoeeLineStyle {
  /// Regular grid lines
  grid,

  /// Organic, irregular flowing lines
  organic,

  /// Both grid and organic lines combined
  hybrid,

  /// No lines
  none,
}

/// Reusable glow + gradient background for "soft light" screens.
class WoeeGlowBackground extends StatelessWidget {
  const WoeeGlowBackground({
    required this.child,
    this.glows,
    this.backgroundGradient,
    this.showGrid = true,
    this.lineStyle,
    this.gridOpacity,
    this.gridSpacing = 96,
    this.organicLineCount = 10,
    this.organicSeed = 42,
    this.organicCurveIntensity = 0.25,
    super.key,
  });

  final Widget child;
  final List<WoeeGlowSpec>? glows;
  final Gradient? backgroundGradient;
  @Deprecated('Use lineStyle instead')
  final bool showGrid;

  /// Style of background lines (defaults to grid if showGrid is true)
  final WoeeLineStyle? lineStyle;
  final double? gridOpacity;
  final double gridSpacing;

  /// Number of organic lines (only used with organic/hybrid style)
  final int organicLineCount;

  /// Seed for organic line randomness
  final int organicSeed;

  /// How wavy the organic lines are (0.0 = straight, 1.0 = very wavy)
  final double organicCurveIntensity;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final gradient =
        backgroundGradient ??
        (isDark ? AppGradients.dark : AppGradients.subtleBackground);

    return LayoutBuilder(
      builder: (context, constraints) {
        final shortestSide = constraints.maxWidth < constraints.maxHeight
            ? constraints.maxWidth
            : constraints.maxHeight;
        final glowSpecs = glows ?? _defaultGlows(context, isDark);

        return DecoratedBox(
          decoration: BoxDecoration(gradient: gradient),
          child: Stack(
            children: [
              Positioned.fill(
                child: WoeeGlowCluster(
                  glows: glowSpecs,
                  baseSize: shortestSide,
                ),
              ),
              _buildLinePattern(context, isDark),
              child,
            ],
          ),
        );
      },
    );
  }

  WoeeLineStyle get _effectiveLineStyle {
    if (lineStyle != null) return lineStyle!;
    // ignore: deprecated_member_use_from_same_package
    return showGrid ? WoeeLineStyle.grid : WoeeLineStyle.none;
  }

  Widget _buildLinePattern(BuildContext context, bool isDark) {
    final opacity = gridOpacity ?? (isDark ? 0.08 : 0.05);

    switch (_effectiveLineStyle) {
      case WoeeLineStyle.grid:
        return Positioned.fill(
          child: WoeeLineSilhouetteBg(
            gridSpacing: gridSpacing,
            opacity: opacity,
          ),
        );
      case WoeeLineStyle.organic:
        return Positioned.fill(
          child: WoeeOrganicLinesBg(
            lineCount: organicLineCount,
            seed: organicSeed,
            curveIntensity: organicCurveIntensity,
            opacity: opacity,
          ),
        );
      case WoeeLineStyle.hybrid:
        return Positioned.fill(
          child: WoeeHybridLinesBg(
            gridSpacing: gridSpacing,
            gridOpacity: opacity * 0.6,
            organicOpacity: opacity,
            organicLineCount: organicLineCount,
            seed: organicSeed,
            curveIntensity: organicCurveIntensity,
          ),
        );
      case WoeeLineStyle.none:
        return const SizedBox.shrink();
    }
  }

  List<WoeeGlowSpec> _defaultGlows(BuildContext context, bool isDark) {
    final primary = context.colors.primary;
    final secondary = context.colors.secondary;
    final tertiary = context.colors.tertiary;
    final baseOpacity = isDark ? 0.28 : 0.16;
    final baseBlur = isDark ? 90.0 : 70.0;

    return [
      WoeeGlowSpec(
        alignment: const Alignment(-0.95, -0.85),
        color: primary,
        sizeFactor: 0.9,
        opacity: baseOpacity,
        blurSigma: baseBlur,
      ),
      WoeeGlowSpec(
        alignment: const Alignment(0.85, -0.15),
        color: tertiary,
        sizeFactor: 0.65,
        opacity: baseOpacity * 0.85,
        blurSigma: baseBlur * 0.85,
      ),
      WoeeGlowSpec(
        alignment: const Alignment(-0.6, 0.85),
        color: secondary,
        sizeFactor: 0.8,
        opacity: baseOpacity * 0.75,
        blurSigma: baseBlur * 0.9,
      ),
    ];
  }
}
