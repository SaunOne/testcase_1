import 'package:flutter/material.dart';

/// Motion / Animation tokens - Single source of truth
///
/// Gunakan tokens ini untuk semua animasi dan transisi.
/// Mengikuti Material Design motion guidelines.
abstract final class AppMotion {
  const AppMotion._();

  // ═══════════════════════════════════════════════════════════════════════════
  // DURATION
  // ═══════════════════════════════════════════════════════════════════════════

  /// Instant - untuk micro interactions (ripple, tap feedback)
  static const Duration instant = Duration(milliseconds: 100);

  /// Fast - untuk simple state changes (toggle, checkbox)
  static const Duration fast = Duration(milliseconds: 150);

  /// Normal - default untuk kebanyakan animasi
  static const Duration normal = Duration(milliseconds: 200);

  /// Medium - untuk transisi yang lebih kompleks
  static const Duration medium = Duration(milliseconds: 300);

  /// Slow - untuk animasi yang perlu perhatian user
  static const Duration slow = Duration(milliseconds: 400);

  /// Slower - untuk page transitions, complex animations
  static const Duration slower = Duration(milliseconds: 500);

  /// Slowest - untuk dramatic reveals, splash screens
  static const Duration slowest = Duration(milliseconds: 700);

  // ═══════════════════════════════════════════════════════════════════════════
  // SEMANTIC DURATIONS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Button tap feedback
  static const Duration buttonTap = instant;

  /// Toggle switch, checkbox
  static const Duration toggle = fast;

  /// Fade in/out content
  static const Duration fade = normal;

  /// Slide content in/out
  static const Duration slide = medium;

  /// Expand/collapse content
  static const Duration expand = medium;

  /// Modal/sheet show/hide
  static const Duration modal = medium;

  /// Page transition
  static const Duration pageTransition = slower;

  /// Splash screen
  static const Duration splash = slowest;

  /// Loading shimmer cycle
  static const Duration shimmer = Duration(milliseconds: 1500);

  // ═══════════════════════════════════════════════════════════════════════════
  // CURVES - Standard Easing
  // ═══════════════════════════════════════════════════════════════════════════

  /// Standard - default untuk kebanyakan animasi
  static const Curve standard = Curves.easeInOut;

  /// Emphasized - untuk animasi yang perlu attention
  static const Curve emphasized = Curves.easeInOutCubic;

  /// Decelerate - element masuk ke view (fade in, slide in)
  static const Curve decelerate = Curves.easeOut;

  /// Accelerate - element keluar dari view (fade out, slide out)
  static const Curve accelerate = Curves.easeIn;

  /// Sharp - untuk micro interactions
  static const Curve sharp = Curves.easeInOutQuart;

  // ═══════════════════════════════════════════════════════════════════════════
  // CURVES - Semantic
  // ═══════════════════════════════════════════════════════════════════════════

  /// Untuk content yang muncul (fade in, slide in from bottom)
  static const Curve enter = decelerate;

  /// Untuk content yang hilang (fade out, slide out)
  static const Curve exit = accelerate;

  /// Untuk expand/collapse
  static const Curve expandCollapse = emphasized;

  /// Untuk bouncy feedback
  static const Curve bounce = Curves.elasticOut;

  /// Untuk spring animations
  static const Curve spring = Curves.easeOutBack;

  // ═══════════════════════════════════════════════════════════════════════════
  // ANIMATION HELPERS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Create AnimationController dengan default duration
  static AnimationController createController(
    TickerProvider vsync, {
    Duration duration = normal,
  }) {
    return AnimationController(vsync: vsync, duration: duration);
  }

  /// Create curved animation
  static Animation<double> curved(
    Animation<double> parent, {
    Curve curve = standard,
  }) {
    return CurvedAnimation(parent: parent, curve: curve);
  }
}
