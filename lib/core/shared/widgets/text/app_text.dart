import 'package:flutter/material.dart';
import 'package:testcase_1/app/theme/app_typography.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// AppText - Widget utama untuk semua teks di aplikasi
///
/// **ATURAN PENTING:**
/// - Jangan pakai `Text()` langsung di UI
/// - Selalu pakai `AppText` atau variant-nya
/// - Warna otomatis ikut theme (light/dark)
///
/// **Usage:**
/// ```dart
/// AppText('Hello')                    // default = body
/// AppText.h1('Welcome Back')
/// AppText.h2('Dashboard')
/// AppText.title('Profile Settings')
/// AppText.body('Description text')
/// AppText.caption('Helper text')
/// AppText.button('Submit')
///
/// // Custom color
/// AppText.body(
///   'Error message',
///   color: context.colors.error,
/// )
///
/// // Custom weight
/// AppText.body(
///   'Bold text',
///   fontWeight: FontWeight.w600,
/// )
/// ```
class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    this.style,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    super.key,
  }) : _variant = _TextVariant.body;

  const AppText.h1(
    this.text, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    super.key,
  }) : style = null,
       _variant = _TextVariant.h1;

  const AppText.h2(
    this.text, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    super.key,
  }) : style = null,
       _variant = _TextVariant.h2;

  const AppText.title(
    this.text, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    super.key,
  }) : style = null,
       _variant = _TextVariant.title;

  const AppText.subtitle(
    this.text, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    super.key,
  }) : style = null,
       _variant = _TextVariant.subtitle;

  const AppText.body(
    this.text, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    super.key,
  }) : style = null,
       _variant = _TextVariant.body;

  const AppText.bodyLarge(
    this.text, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    super.key,
  }) : style = null,
       _variant = _TextVariant.bodyLarge;

  const AppText.bodySmall(
    this.text, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    super.key,
  }) : style = null,
       _variant = _TextVariant.bodySmall;

  const AppText.caption(
    this.text, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    super.key,
  }) : style = null,
       _variant = _TextVariant.caption;

  const AppText.captionBold(
    this.text, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    super.key,
  }) : style = null,
       _variant = _TextVariant.captionBold;

  const AppText.button(
    this.text, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    super.key,
  }) : style = null,
       _variant = _TextVariant.button;

  const AppText.buttonSmall(
    this.text, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    super.key,
  }) : style = null,
       _variant = _TextVariant.buttonSmall;

  const AppText.overline(
    this.text, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    super.key,
  }) : style = null,
       _variant = _TextVariant.overline;

  final String text;
  final TextStyle? style;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final double? fontSize;
  final _TextVariant _variant;

  @override
  Widget build(BuildContext context) {
    // Get base style dari variant
    final baseStyle = _getBaseStyle();

    // Get default color dari theme jika tidak ada custom color
    final defaultColor = color ?? context.colors.textPrimary;

    // Merge dengan custom overrides
    final finalStyle = (style ?? baseStyle).copyWith(
      color: defaultColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );

    return Text(
      text,
      style: finalStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  TextStyle _getBaseStyle() {
    return switch (_variant) {
      _TextVariant.h1 => AppTypography.h1,
      _TextVariant.h2 => AppTypography.h2,
      _TextVariant.title => AppTypography.title,
      _TextVariant.subtitle => AppTypography.subtitle,
      _TextVariant.body => AppTypography.body,
      _TextVariant.bodyLarge => AppTypography.bodyLarge,
      _TextVariant.bodySmall => AppTypography.bodySmall,
      _TextVariant.caption => AppTypography.caption,
      _TextVariant.captionBold => AppTypography.captionBold,
      _TextVariant.button => AppTypography.button,
      _TextVariant.buttonSmall => AppTypography.buttonSmall,
      _TextVariant.overline => AppTypography.overline,
    };
  }
}

enum _TextVariant {
  h1,
  h2,
  title,
  subtitle,
  body,
  bodyLarge,
  bodySmall,
  caption,
  captionBold,
  button,
  buttonSmall,
  overline,
}
