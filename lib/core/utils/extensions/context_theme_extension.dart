import 'package:flutter/material.dart';
import 'package:testcase_1/app/theme/app_color_tokens.dart';

/// Extension untuk akses mudah ke color tokens
///
/// Usage:
/// ```dart
/// context.colors.primary
/// context.colors.textPrimary
/// context.colors.success
/// ```
extension ThemeExtension on BuildContext {
  /// Akses color tokens berdasarkan brightness (light/dark)
  AppColorTokens get colors {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.light
        ? AppColorTokens.light
        : AppColorTokens.dark;
  }

  /// Shortcut ke ThemeData
  ThemeData get theme => Theme.of(this);

  /// Shortcut ke TextTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Shortcut ke ColorScheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Check if dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
