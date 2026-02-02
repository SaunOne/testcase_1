import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography tokens - Single source of truth for all text styles
///
/// Uses Plus Jakarta Sans as the default font family.
/// Colors are NOT included - use AppText widget or apply color separately.
///
/// Hierarchy:
/// - display → Very large display text (splash, hero)
/// - h1, h2 → Hero/headline besar
/// - title → Section title
/// - body → Content utama
/// - caption → Helper text, metadata
/// - button → Button text
/// - overline → Labels & tags
abstract final class AppTypography {
  // ═══════════════════════════════════════════════════════════════════════════
  // FONT FAMILY
  // ═══════════════════════════════════════════════════════════════════════════

  /// Default font family - Plus Jakarta Sans
  static String get fontFamily => GoogleFonts.manrope().fontFamily!;

  /// Get TextStyle with Plus Jakarta Sans
  static TextStyle _baseStyle({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w500,
    double height = 1.5,
    double letterSpacing = 0,
  }) {
    return GoogleFonts.manrope(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // DISPLAY - Very Large Text
  // ═══════════════════════════════════════════════════════════════════════════

  /// Display Large - Splash screen, landing hero
  static TextStyle get displayLarge => _baseStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 1.1,
    letterSpacing: -1.0,
  );

  /// Display Medium - Large hero text
  static TextStyle get displayMedium => _baseStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.15,
    letterSpacing: -0.8,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // HEADINGS - Hero & Large Headlines
  // ═══════════════════════════════════════════════════════════════════════════

  /// H1 - Hero headline (welcome screen, onboarding)
  static TextStyle get h1 => _baseStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
  );

  /// H2 - Large section heading
  static TextStyle get h2 => _baseStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: -0.3,
  );

  /// H3 - Medium section heading
  static TextStyle get h3 => _baseStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.35,
    letterSpacing: -0.2,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // TITLES - Section & Card Titles
  // ═══════════════════════════════════════════════════════════════════════════

  /// Title - Card title, dialog title, screen title
  static TextStyle get title => _baseStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.4,
    letterSpacing: -0.2,
  );

  /// Subtitle - Secondary heading
  static TextStyle get subtitle => _baseStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // BODY - Main Content
  // ═══════════════════════════════════════════════════════════════════════════

  /// Body - Default text untuk content
  static TextStyle get body => _baseStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.1,
  );

  /// Body Large - Emphasized body text
  static TextStyle get bodyLarge => _baseStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.1,
  );

  /// Body Small - Compact body text
  static TextStyle get bodySmall => _baseStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.1,
  );

  /// Body Medium Bold - Emphasized medium text
  static TextStyle get bodyMediumBold => _baseStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0.1,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // CAPTION - Helper Text & Metadata
  // ═══════════════════════════════════════════════════════════════════════════

  /// Caption - Helper text, timestamp, metadata
  static TextStyle get caption => _baseStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.2,
  );

  /// Caption Bold - Emphasized caption
  static TextStyle get captionBold => _baseStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0.2,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // BUTTON - Button & Interactive Elements
  // ═══════════════════════════════════════════════════════════════════════════

  /// Button - Text untuk button, tab, chip
  static TextStyle get button => _baseStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.3,
  );

  /// Button Small - Compact button
  static TextStyle get buttonSmall => _baseStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.3,
  );

  /// Button Large - Large button
  static TextStyle get buttonLarge => _baseStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.2,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // OVERLINE - Labels & Tags
  // ═══════════════════════════════════════════════════════════════════════════

  /// Overline - All caps label, category tag
  static TextStyle get overline => _baseStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 1.0,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // INPUT - Form Fields
  // ═══════════════════════════════════════════════════════════════════════════

  /// Input - Text field input
  static TextStyle get input => _baseStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Input Label - Form field label
  static TextStyle get inputLabel => _baseStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0,
  );

  /// Input Helper - Helper/error text
  static TextStyle get inputHelper => _baseStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.1,
  );
}
