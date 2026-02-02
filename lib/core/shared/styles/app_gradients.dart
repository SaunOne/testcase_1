import 'package:flutter/material.dart';

/// Flexible gradient system for the app
/// Provides preset gradients and helper methods for creating custom gradients
abstract final class AppGradients {
  // ═══════════════════════════════════════════════════════════════════════════
  // PRESET GRADIENTS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Primary blue gradient - used for primary buttons, headers
  static const LinearGradient primaryBlue = LinearGradient(
    colors: [Color(0xFF2F80ED), Color(0xFF1B4F9C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Light blue gradient - subtle background accent
  static const LinearGradient lightBlue = LinearGradient(
    colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Sky gradient - for decorative elements
  static const LinearGradient sky = LinearGradient(
    colors: [Color(0xFF6EC1FF), Color(0xFF2F80ED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Green gradient - success, positive actions
  static const LinearGradient green = LinearGradient(
    colors: [Color(0xFF27AE60), Color(0xFF1E8449)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Dark gradient - for dark themed elements
  static const LinearGradient dark = LinearGradient(
    colors: [Color(0xFF1F2937), Color(0xFF111827)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Glassmorphism overlay - subtle white gradient for glass effect
  static const LinearGradient glassOverlay = LinearGradient(
    colors: [Color(0x40FFFFFF), Color(0x10FFFFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Subtle background gradient - very light, for page backgrounds
  static const LinearGradient subtleBackground = LinearGradient(
    colors: [Color(0xFFF8FAFC), Color(0xFFEFF6FF), Color(0xFFF8FAFC)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.5, 1.0],
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // HELPER METHODS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Creates a linear gradient with custom colors
  static LinearGradient linear({
    required List<Color> colors,
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
    List<double>? stops,
  }) {
    return LinearGradient(colors: colors, begin: begin, end: end, stops: stops);
  }

  /// Creates a radial gradient with custom colors
  static RadialGradient radial({
    required List<Color> colors,
    AlignmentGeometry center = Alignment.center,
    double radius = 0.5,
    List<double>? stops,
  }) {
    return RadialGradient(
      colors: colors,
      center: center,
      radius: radius,
      stops: stops,
    );
  }

  /// Creates a gradient with opacity applied to all colors
  static LinearGradient withOpacity(LinearGradient gradient, double opacity) {
    return LinearGradient(
      colors: gradient.colors.map((c) => c.withValues(alpha: opacity)).toList(),
      begin: gradient.begin,
      end: gradient.end,
      stops: gradient.stops,
    );
  }

  /// Creates a vertical gradient (top to bottom)
  static LinearGradient vertical(List<Color> colors, {List<double>? stops}) {
    return LinearGradient(
      colors: colors,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: stops,
    );
  }

  /// Creates a horizontal gradient (left to right)
  static LinearGradient horizontal(List<Color> colors, {List<double>? stops}) {
    return LinearGradient(
      colors: colors,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: stops,
    );
  }
}
