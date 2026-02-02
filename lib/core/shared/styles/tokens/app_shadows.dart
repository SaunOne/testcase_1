import 'package:flutter/material.dart';

/// Shadow tokens - Single source of truth
///
/// Gunakan tokens ini untuk semua shadows/elevation.
abstract final class AppShadows {
  const AppShadows._();

  // ═══════════════════════════════════════════════════════════════════════════
  // ELEVATION VALUES
  // ═══════════════════════════════════════════════════════════════════════════

  /// No elevation
  static const double elevationNone = 0;

  /// Extra small - subtle lift
  static const double elevationXs = 1;

  /// Small - cards, buttons hover
  static const double elevationSm = 2;

  /// Medium - dialogs, dropdowns
  static const double elevationMd = 4;

  /// Large - modals, sheets
  static const double elevationLg = 8;

  /// Extra large - floating elements
  static const double elevationXl = 16;

  // ═══════════════════════════════════════════════════════════════════════════
  // BOX SHADOWS - Light Mode
  // ═══════════════════════════════════════════════════════════════════════════

  /// No shadow
  static const List<BoxShadow> none = [];

  /// Extra small shadow (cards at rest)
  static List<BoxShadow> get xs => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ];

  /// Small shadow (cards hover, buttons)
  static List<BoxShadow> get sm => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  /// Medium shadow (dropdowns, popovers)
  static List<BoxShadow> get md => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  /// Large shadow (modals, dialogs)
  static List<BoxShadow> get lg => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.1),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  /// Extra large shadow (floating elements)
  static List<BoxShadow> get xl => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      blurRadius: 24,
      offset: const Offset(0, 12),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 12,
      offset: const Offset(0, 6),
    ),
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  // SEMANTIC SHADOWS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Card shadow (at rest)
  static List<BoxShadow> get card => xs;

  /// Card shadow (hover/pressed)
  static List<BoxShadow> get cardHover => sm;

  /// Button shadow
  static List<BoxShadow> get button => sm;

  /// Dropdown shadow
  static List<BoxShadow> get dropdown => md;

  /// Modal/dialog shadow
  static List<BoxShadow> get modal => lg;

  /// Bottom sheet shadow
  static List<BoxShadow> get sheet => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.1),
      blurRadius: 10,
      offset: const Offset(0, -5),
    ),
  ];

  /// FAB shadow
  static List<BoxShadow> get fab => lg;
}
