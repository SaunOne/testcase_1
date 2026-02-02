import 'package:flutter/material.dart';

/// Border radius tokens - Single source of truth
///
/// Gunakan tokens ini untuk semua border radius di aplikasi.
/// Jangan hardcode nilai radius.
abstract final class AppRadius {
  const AppRadius._();

  // ═══════════════════════════════════════════════════════════════════════════
  // RAW VALUES
  // ═══════════════════════════════════════════════════════════════════════════

  /// None - No radius (sharp corners)
  static const double none = 0;

  /// Extra small - Subtle rounding (chips, tags)
  static const double xs = 4;

  /// Small - Light rounding (buttons, inputs)
  static const double sm = 8;

  /// Medium - Standard rounding (cards, dialogs)
  static const double md = 12;

  /// Large - Pronounced rounding (bottom sheets, large cards)
  static const double lg = 16;

  /// Extra large - Very rounded (modals, floating elements)
  static const double xl = 24;

  /// Full - Pill shape (pills, avatars)
  static const double full = 999;

  // ═══════════════════════════════════════════════════════════════════════════
  // SEMANTIC DEFAULTS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Default radius untuk buttons
  static const double button = sm;

  /// Default radius untuk cards
  static const double card = md;

  /// Default radius untuk input fields
  static const double input = sm;

  /// Default radius untuk modals/dialogs
  static const double modal = lg;

  /// Default radius untuk bottom sheets
  static const double sheet = xl;

  /// Default radius untuk chips/tags
  static const double chip = full;

  /// Default radius untuk avatars
  static const double avatar = full;

  /// Default radius untuk containers
  static const double container = md;

  // ═══════════════════════════════════════════════════════════════════════════
  // BORDER RADIUS OBJECTS
  // ═══════════════════════════════════════════════════════════════════════════

  static BorderRadius get borderNone => BorderRadius.zero;
  static BorderRadius get borderXs => BorderRadius.circular(xs);
  static BorderRadius get borderSm => BorderRadius.circular(sm);
  static BorderRadius get borderMd => BorderRadius.circular(md);
  static BorderRadius get borderLg => BorderRadius.circular(lg);
  static BorderRadius get borderXl => BorderRadius.circular(xl);
  static BorderRadius get borderFull => BorderRadius.circular(full);

  // Semantic border radius
  static BorderRadius get borderButton => BorderRadius.circular(button);
  static BorderRadius get borderCard => BorderRadius.circular(card);
  static BorderRadius get borderInput => BorderRadius.circular(input);
  static BorderRadius get borderModal => BorderRadius.circular(modal);
  static BorderRadius get borderSheet => BorderRadius.circular(sheet);
  static BorderRadius get borderChip => BorderRadius.circular(chip);
  static BorderRadius get borderAvatar => BorderRadius.circular(avatar);
  static BorderRadius get borderContainer => BorderRadius.circular(container);

  // ═══════════════════════════════════════════════════════════════════════════
  // RADIUS OBJECTS (for individual corners)
  // ═══════════════════════════════════════════════════════════════════════════

  static const Radius radiusNone = Radius.zero;
  static const Radius radiusXs = Radius.circular(xs);
  static const Radius radiusSm = Radius.circular(sm);
  static const Radius radiusMd = Radius.circular(md);
  static const Radius radiusLg = Radius.circular(lg);
  static const Radius radiusXl = Radius.circular(xl);

  // ═══════════════════════════════════════════════════════════════════════════
  // SPECIAL SHAPES
  // ═══════════════════════════════════════════════════════════════════════════

  /// Top-only radius (untuk bottom sheets)
  static BorderRadius topOnly(double radius) =>
      BorderRadius.vertical(top: Radius.circular(radius));

  /// Bottom-only radius
  static BorderRadius bottomOnly(double radius) =>
      BorderRadius.vertical(bottom: Radius.circular(radius));

  /// Left-only radius
  static BorderRadius leftOnly(double radius) =>
      BorderRadius.horizontal(left: Radius.circular(radius));

  /// Right-only radius
  static BorderRadius rightOnly(double radius) =>
      BorderRadius.horizontal(right: Radius.circular(radius));
}
