import 'package:flutter/material.dart';

/// Raw color palette - DO NOT use directly in UI
/// Use [AppColorTokens] instead via `context.colors`
///
/// Palette ini hanya dipakai oleh [AppColorTokens] dan [AppTheme]
abstract final class AppPalette {
  // ═══════════════════════════════════════════════════════════════════════════
  // BRAND COLORS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Primary Blue - CTA utama, button primary, link utama
  static const Color primaryBlue = Color(0xFF2F80ED);

  /// Deep Blue - Header, gradient partner, emphasis
  static const Color deepBlue = Color(0xFF1B4F9C);

  /// Earth Green - Aksi alternatif, chip aktif, highlight positif
  static const Color earthGreen = Color(0xFF27AE60);

  /// Sky Light Blue - Highlight ringan, info non-critical, badge
  static const Color skyBlue = Color(0xFF6EC1FF);

  // ═══════════════════════════════════════════════════════════════════════════
  // NEUTRAL COLORS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Pure white
  static const Color white = Color(0xFFFFFFFF);

  /// Soft Gray - background ringan (light mode)
  static const Color softGray = Color(0xFFF2F4F7);

  /// Medium Gray - borders, dividers
  static const Color mediumGray = Color(0xFFD0D5DD);

  /// Dark Gray - secondary text (light mode)
  static const Color darkGray = Color(0xFF667085);

  /// Neutral Dark - primary text (light mode), background (dark mode)
  static const Color neutralDark = Color(0xFF111827);

  /// Neutral Darker - surface dark mode
  static const Color neutralDarker = Color(0xFF1F2937);

  /// Neutral Mid Dark - surface alt dark mode
  static const Color neutralMidDark = Color(0xFF374151);

  // ═══════════════════════════════════════════════════════════════════════════
  // SEMANTIC COLORS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Success Green (berbeda dari earthGreen untuk semantic)
  static const Color successGreen = Color(0xFF12B76A);
  static const Color successGreenLight = Color(0xFFD1FADF);

  /// Warning Orange
  static const Color warningOrange = Color(0xFFF79009);
  static const Color warningOrangeLight = Color(0xFFFEF0C7);

  /// Error Red
  static const Color errorRed = Color(0xFFF04438);
  static const Color errorRedLight = Color(0xFFFEE4E2);

  /// Info Blue
  static const Color infoBlue = Color(0xFF0BA5EC);
  static const Color infoBlueLight = Color(0xFFE0F2FE);
}
