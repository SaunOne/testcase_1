import 'package:flutter/material.dart';
import 'package:testcase_1/app/theme/app_palette.dart';
import 'package:testcase_1/app/theme/app_typography.dart';

/// AppGradientText - Text dengan gradient untuk branding/hero sections
///
/// **Usage:**
/// ```dart
/// AppGradientText.h1('Welcome Back')
/// AppGradientText.h2('Premium Feature')
///
/// // Custom gradient
/// AppGradientText(
///   'Custom',
///   style: AppTypography.title,
///   gradient: LinearGradient(
///     colors: [Colors.red, Colors.blue],
///   ),
/// )
/// ```
class AppGradientText extends StatelessWidget {
  const AppGradientText(
    this.text, {
    required this.style,
    this.gradient,
    this.textAlign,
    this.maxLines,
    this.overflow,
    super.key,
  }) : _variant = null;

  const AppGradientText.h1(
    this.text, {
    this.gradient,
    this.textAlign,
    this.maxLines,
    this.overflow,
    super.key,
  }) : style = null,
       _variant = _GradientTextVariant.h1;

  const AppGradientText.h2(
    this.text, {
    this.gradient,
    this.textAlign,
    this.maxLines,
    this.overflow,
    super.key,
  }) : style = null,
       _variant = _GradientTextVariant.h2;

  const AppGradientText.title(
    this.text, {
    this.gradient,
    this.textAlign,
    this.maxLines,
    this.overflow,
    super.key,
  }) : style = null,
       _variant = _GradientTextVariant.title;

  final String text;
  final TextStyle? style;
  final Gradient? gradient;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final _GradientTextVariant? _variant;

  @override
  Widget build(BuildContext context) {
    final textStyle = style ?? _getBaseStyle();
    final gradientColors = gradient ?? _defaultGradient;

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradientColors.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: textStyle,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }

  TextStyle _getBaseStyle() {
    if (_variant == null) return AppTypography.body;

    return switch (_variant) {
      _GradientTextVariant.h1 => AppTypography.h1,
      _GradientTextVariant.h2 => AppTypography.h2,
      _GradientTextVariant.title => AppTypography.title,
    };
  }

  static const Gradient _defaultGradient = LinearGradient(
    colors: [AppPalette.primaryBlue, AppPalette.skyBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

enum _GradientTextVariant { h1, h2, title }
