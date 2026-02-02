import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/app_palette.dart';

/// Color tokens untuk UI - gunakan via `context.colors`
///
/// Tokens adalah sumber warna untuk UI (bukan palette langsung)
/// Sudah ada light & dark mode variant
@immutable
class AppColorTokens {
  const AppColorTokens._({
    // Surface & Layout
    required this.background,
    required this.surface,
    required this.surfaceAlt,
    required this.border,
    required this.divider,
    // Text
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.textInverse,
    // Brand
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    // Semantic
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.info,
    required this.onInfo,
    required this.infoContainer,
  });

  // ═══════════════════════════════════════════════════════════════════════════
  // SURFACE & LAYOUT
  // ═══════════════════════════════════════════════════════════════════════════

  /// Background utama aplikasi
  final Color background;

  /// Surface untuk card, dialog, bottom sheet
  final Color surface;

  /// Surface alternatif (elevated atau nested)
  final Color surfaceAlt;

  /// Warna border
  final Color border;

  /// Warna divider/separator
  final Color divider;

  // ═══════════════════════════════════════════════════════════════════════════
  // TEXT
  // ═══════════════════════════════════════════════════════════════════════════

  /// Text utama (heading, body)
  final Color textPrimary;

  /// Text sekunder (subtitle, caption)
  final Color textSecondary;

  /// Text disabled
  final Color textDisabled;

  /// Text di atas warna gelap (untuk button primary, dll)
  final Color textInverse;

  // ═══════════════════════════════════════════════════════════════════════════
  // BRAND COLORS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Primary - CTA utama, button primary, link utama
  final Color primary;

  /// Text/icon di atas primary
  final Color onPrimary;

  /// Container dengan tint primary (untuk chip, badge)
  final Color primaryContainer;

  /// Text/icon di atas primaryContainer
  final Color onPrimaryContainer;

  /// Secondary - Aksi alternatif, chip aktif, highlight positif
  final Color secondary;

  /// Text/icon di atas secondary
  final Color onSecondary;

  /// Container dengan tint secondary
  final Color secondaryContainer;

  /// Text/icon di atas secondaryContainer
  final Color onSecondaryContainer;

  /// Tertiary/Accent - Highlight ringan, info non-critical, decorative
  final Color tertiary;

  /// Text/icon di atas tertiary
  final Color onTertiary;

  // ═══════════════════════════════════════════════════════════════════════════
  // SEMANTIC COLORS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Success - status berhasil
  final Color success;
  final Color onSuccess;
  final Color successContainer;

  /// Warning - peringatan
  final Color warning;
  final Color onWarning;
  final Color warningContainer;

  /// Error - error state
  final Color error;
  final Color onError;
  final Color errorContainer;

  /// Info - informational
  final Color info;
  final Color onInfo;
  final Color infoContainer;

  // ═══════════════════════════════════════════════════════════════════════════
  // LIGHT MODE TOKENS
  // ═══════════════════════════════════════════════════════════════════════════

  static const AppColorTokens light = AppColorTokens._(
    // Surface & Layout
    background: AppPalette.softGray,
    surface: AppPalette.white,
    surfaceAlt: AppPalette.softGray,
    border: AppPalette.mediumGray,
    divider: Color(0xFFE4E7EC),
    // Text
    textPrimary: AppPalette.neutralDark,
    textSecondary: AppPalette.darkGray,
    textDisabled: Color(0xFF98A2B3),
    textInverse: AppPalette.white,
    // Brand - Primary
    primary: AppPalette.primaryBlue,
    onPrimary: AppPalette.white,
    primaryContainer: Color(0xFFE3F2FD),
    onPrimaryContainer: AppPalette.deepBlue,
    // Brand - Secondary
    secondary: AppPalette.earthGreen,
    onSecondary: AppPalette.white,
    secondaryContainer: Color(0xFFE8F5E9),
    onSecondaryContainer: Color(0xFF1B5E20),
    // Brand - Tertiary
    tertiary: AppPalette.skyBlue,
    onTertiary: AppPalette.neutralDark,
    // Semantic - Success
    success: AppPalette.successGreen,
    onSuccess: AppPalette.white,
    successContainer: AppPalette.successGreenLight,
    // Semantic - Warning
    warning: AppPalette.warningOrange,
    onWarning: AppPalette.white,
    warningContainer: AppPalette.warningOrangeLight,
    // Semantic - Error
    error: AppPalette.errorRed,
    onError: AppPalette.white,
    errorContainer: AppPalette.errorRedLight,
    // Semantic - Info
    info: AppPalette.infoBlue,
    onInfo: AppPalette.white,
    infoContainer: AppPalette.infoBlueLight,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // DARK MODE TOKENS
  // ═══════════════════════════════════════════════════════════════════════════

  static const AppColorTokens dark = AppColorTokens._(
    // Surface & Layout
    background: AppPalette.neutralDark,
    surface: AppPalette.neutralDarker,
    surfaceAlt: AppPalette.neutralMidDark,
    border: Color(0xFF475467),
    divider: Color(0xFF344054),
    // Text
    textPrimary: AppPalette.white,
    textSecondary: Color(0xFF98A2B3),
    textDisabled: Color(0xFF667085),
    textInverse: AppPalette.neutralDark,
    // Brand - Primary (slightly brighter for dark mode)
    primary: Color(0xFF5C9EF0),
    onPrimary: AppPalette.neutralDark,
    primaryContainer: Color(0xFF1E3A5F),
    onPrimaryContainer: Color(0xFFB3D4FC),
    // Brand - Secondary
    secondary: Color(0xFF4ADE80),
    onSecondary: AppPalette.neutralDark,
    secondaryContainer: Color(0xFF14532D),
    onSecondaryContainer: Color(0xFFBBF7D0),
    // Brand - Tertiary
    tertiary: AppPalette.skyBlue,
    onTertiary: AppPalette.neutralDark,
    // Semantic - Success
    success: Color(0xFF34D399),
    onSuccess: AppPalette.neutralDark,
    successContainer: Color(0xFF064E3B),
    // Semantic - Warning
    warning: Color(0xFFFBBF24),
    onWarning: AppPalette.neutralDark,
    warningContainer: Color(0xFF78350F),
    // Semantic - Error
    error: Color(0xFFF87171),
    onError: AppPalette.neutralDark,
    errorContainer: Color(0xFF7F1D1D),
    // Semantic - Info
    info: Color(0xFF38BDF8),
    onInfo: AppPalette.neutralDark,
    infoContainer: Color(0xFF0C4A6E),
  );
}
