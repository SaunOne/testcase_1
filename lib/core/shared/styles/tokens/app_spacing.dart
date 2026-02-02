import 'package:flutter/material.dart';

/// Spacing tokens - Single source of truth for all spacing
///
/// Gunakan tokens ini untuk semua padding, margin, dan gap.
/// Jangan hardcode nilai spacing.
abstract final class AppSpacing {
  const AppSpacing._();

  // ═══════════════════════════════════════════════════════════════════════════
  // RAW VALUES
  // ═══════════════════════════════════════════════════════════════════════════

  /// None - No spacing
  static const double none = 0;

  /// Extra extra small - 2px
  static const double xxs = 2;

  /// Extra small - 4px
  static const double xs = 4;

  /// Small - 8px
  static const double sm = 8;

  /// Medium - 16px (default)
  static const double md = 16;

  /// Large - 24px
  static const double lg = 24;

  /// Extra large - 32px
  static const double xl = 32;

  /// Extra extra large - 48px
  static const double xxl = 48;

  /// Extra extra extra large - 64px
  static const double xxxl = 64;

  // ═══════════════════════════════════════════════════════════════════════════
  // SEMANTIC DEFAULTS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Default page padding
  static const double pagePadding = md;

  /// Default card padding
  static const double cardPadding = md;

  /// Default section spacing
  static const double sectionSpacing = lg;

  /// Default item spacing in lists
  static const double itemSpacing = sm;

  /// Default gap between inline elements
  static const double inlineGap = sm;

  /// Default gap between form fields
  static const double formFieldGap = md;

  /// Default icon-text gap
  static const double iconTextGap = sm;

  // ═══════════════════════════════════════════════════════════════════════════
  // EDGE INSETS - All Sides
  // ═══════════════════════════════════════════════════════════════════════════

  static const EdgeInsets paddingNone = EdgeInsets.zero;
  static const EdgeInsets paddingXxs = EdgeInsets.all(xxs);
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);
  static const EdgeInsets paddingXxl = EdgeInsets.all(xxl);

  // ═══════════════════════════════════════════════════════════════════════════
  // EDGE INSETS - Horizontal
  // ═══════════════════════════════════════════════════════════════════════════

  static const EdgeInsets horizontalXs = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets horizontalXl = EdgeInsets.symmetric(horizontal: xl);

  // ═══════════════════════════════════════════════════════════════════════════
  // EDGE INSETS - Vertical
  // ═══════════════════════════════════════════════════════════════════════════

  static const EdgeInsets verticalXs = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets verticalSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets verticalXl = EdgeInsets.symmetric(vertical: xl);

  // ═══════════════════════════════════════════════════════════════════════════
  // SEMANTIC EDGE INSETS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Page padding - untuk SafeArea content
  static const EdgeInsets page = EdgeInsets.all(pagePadding);

  /// Page horizontal only
  static const EdgeInsets pageHorizontal = EdgeInsets.symmetric(
    horizontal: pagePadding,
  );

  /// Card internal padding
  static const EdgeInsets card = EdgeInsets.all(cardPadding);

  /// Button padding
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: sm,
  );

  /// Button padding small
  static const EdgeInsets buttonPaddingSmall = EdgeInsets.symmetric(
    horizontal: md,
    vertical: xs,
  );

  /// Input field padding
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: 14,
  );

  /// List tile padding
  static const EdgeInsets listTilePadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // SIZED BOX HELPERS - Height
  // ═══════════════════════════════════════════════════════════════════════════

  static const SizedBox heightNone = SizedBox.shrink();
  static const SizedBox heightXxs = SizedBox(height: xxs);
  static const SizedBox heightXs = SizedBox(height: xs);
  static const SizedBox heightSm = SizedBox(height: sm);
  static const SizedBox heightMd = SizedBox(height: md);
  static const SizedBox heightLg = SizedBox(height: lg);
  static const SizedBox heightXl = SizedBox(height: xl);
  static const SizedBox heightXxl = SizedBox(height: xxl);
  static const SizedBox heightXxxl = SizedBox(height: xxxl);

  // ═══════════════════════════════════════════════════════════════════════════
  // SIZED BOX HELPERS - Width
  // ═══════════════════════════════════════════════════════════════════════════

  static const SizedBox widthNone = SizedBox.shrink();
  static const SizedBox widthXxs = SizedBox(width: xxs);
  static const SizedBox widthXs = SizedBox(width: xs);
  static const SizedBox widthSm = SizedBox(width: sm);
  static const SizedBox widthMd = SizedBox(width: md);
  static const SizedBox widthLg = SizedBox(width: lg);
  static const SizedBox widthXl = SizedBox(width: xl);
  static const SizedBox widthXxl = SizedBox(width: xxl);

  // ═══════════════════════════════════════════════════════════════════════════
  // GAP HELPERS (for Row/Column with spacing)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Create a vertical gap
  static SizedBox vGap(double height) => SizedBox(height: height);

  /// Create a horizontal gap
  static SizedBox hGap(double width) => SizedBox(width: width);
}
