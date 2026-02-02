import 'package:flutter/material.dart';
import 'package:testcase_1/app/theme/app_typography.dart';

/// Extension untuk akses mudah ke typography tokens
///
/// Usage:
/// ```dart
/// context.typo.h1
/// context.typo.body
/// context.typo.caption
/// ```
extension TextExtension on BuildContext {
  /// Akses typography tokens
  AppTypographyTokens get typo => const AppTypographyTokens();
}

/// Typography tokens wrapper untuk extension
class AppTypographyTokens {
  const AppTypographyTokens();

  TextStyle get h1 => AppTypography.h1;
  TextStyle get h2 => AppTypography.h2;
  TextStyle get title => AppTypography.title;
  TextStyle get subtitle => AppTypography.subtitle;
  TextStyle get body => AppTypography.body;
  TextStyle get bodyLarge => AppTypography.bodyLarge;
  TextStyle get bodySmall => AppTypography.bodySmall;
  TextStyle get caption => AppTypography.caption;
  TextStyle get captionBold => AppTypography.captionBold;
  TextStyle get button => AppTypography.button;
  TextStyle get buttonSmall => AppTypography.buttonSmall;
  TextStyle get overline => AppTypography.overline;
}
