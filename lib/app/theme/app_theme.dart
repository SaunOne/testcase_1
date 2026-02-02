import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';

/// App Theme - Maps color tokens ke Material 3 ColorScheme
///
/// **PENTING:**
/// - Semua style berasal dari tokens di core/shared/styles/tokens
/// - Tidak ada hardcode warna, radius, spacing di sini
/// - Typography menggunakan AppTypography (Plus Jakarta Sans)
abstract final class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppTypography.fontFamily,
    colorScheme: ColorScheme.light(
      // Brand colors
      primary: AppColorTokens.light.primary,
      onPrimary: AppColorTokens.light.onPrimary,
      primaryContainer: AppColorTokens.light.primaryContainer,
      onPrimaryContainer: AppColorTokens.light.onPrimaryContainer,
      secondary: AppColorTokens.light.secondary,
      onSecondary: AppColorTokens.light.onSecondary,
      secondaryContainer: AppColorTokens.light.secondaryContainer,
      onSecondaryContainer: AppColorTokens.light.onSecondaryContainer,
      tertiary: AppColorTokens.light.tertiary,
      onTertiary: AppColorTokens.light.onTertiary,
      // Surface & Background
      surface: AppColorTokens.light.surface,
      onSurface: AppColorTokens.light.textPrimary,
      surfaceContainerHighest: AppColorTokens.light.surfaceAlt,
      // Semantic
      error: AppColorTokens.light.error,
      onError: AppColorTokens.light.onError,
      errorContainer: AppColorTokens.light.errorContainer,
      // Outline
      outline: AppColorTokens.light.border,
      outlineVariant: AppColorTokens.light.divider,
    ),
    scaffoldBackgroundColor: AppColorTokens.light.background,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColorTokens.light.surface,
      foregroundColor: AppColorTokens.light.textPrimary,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: AppTypography.title.copyWith(
        color: AppColorTokens.light.textPrimary,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.borderCard,
        side: BorderSide(color: AppColorTokens.light.border),
      ),
      color: AppColorTokens.light.surface,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: AppSpacing.buttonPadding,
        minimumSize: Size(0, AppSizes.buttonLg),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderButton),
        backgroundColor: AppColorTokens.light.primary,
        foregroundColor: AppColorTokens.light.onPrimary,
        textStyle: AppTypography.button,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: AppSpacing.buttonPadding,
        minimumSize: Size(0, AppSizes.buttonLg),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderButton),
        side: BorderSide(color: AppColorTokens.light.primary),
        textStyle: AppTypography.button,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: AppSpacing.buttonPaddingSmall,
        textStyle: AppTypography.button,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorTokens.light.surfaceAlt,
      border: OutlineInputBorder(
        borderRadius: AppRadius.borderInput,
        borderSide: BorderSide(color: AppColorTokens.light.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.borderInput,
        borderSide: BorderSide(color: AppColorTokens.light.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.borderInput,
        borderSide: BorderSide(color: AppColorTokens.light.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.borderInput,
        borderSide: BorderSide(color: AppColorTokens.light.error),
      ),
      contentPadding: AppSpacing.inputPadding,
      labelStyle: AppTypography.inputLabel,
      hintStyle: AppTypography.input.copyWith(
        color: AppColorTokens.light.textSecondary,
      ),
      helperStyle: AppTypography.inputHelper,
      errorStyle: AppTypography.inputHelper.copyWith(
        color: AppColorTokens.light.error,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorTokens.light.surface,
      selectedItemColor: AppColorTokens.light.primary,
      unselectedItemColor: AppColorTokens.light.textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: AppShadows.elevationMd,
    ),
    dividerTheme: DividerThemeData(
      color: AppColorTokens.light.divider,
      thickness: AppSizes.divider,
    ),
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(borderRadius: AppRadius.borderChip),
      labelStyle: AppTypography.caption,
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppTypography.fontFamily,
    colorScheme: ColorScheme.dark(
      // Brand colors
      primary: AppColorTokens.dark.primary,
      onPrimary: AppColorTokens.dark.onPrimary,
      primaryContainer: AppColorTokens.dark.primaryContainer,
      onPrimaryContainer: AppColorTokens.dark.onPrimaryContainer,
      secondary: AppColorTokens.dark.secondary,
      onSecondary: AppColorTokens.dark.onSecondary,
      secondaryContainer: AppColorTokens.dark.secondaryContainer,
      onSecondaryContainer: AppColorTokens.dark.onSecondaryContainer,
      tertiary: AppColorTokens.dark.tertiary,
      onTertiary: AppColorTokens.dark.onTertiary,
      // Surface & Background
      surface: AppColorTokens.dark.surface,
      onSurface: AppColorTokens.dark.textPrimary,
      surfaceContainerHighest: AppColorTokens.dark.surfaceAlt,
      // Semantic
      error: AppColorTokens.dark.error,
      onError: AppColorTokens.dark.onError,
      errorContainer: AppColorTokens.dark.errorContainer,
      // Outline
      outline: AppColorTokens.dark.border,
      outlineVariant: AppColorTokens.dark.divider,
    ),
    scaffoldBackgroundColor: AppColorTokens.dark.background,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColorTokens.dark.surface,
      foregroundColor: AppColorTokens.dark.textPrimary,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: AppTypography.title.copyWith(
        color: AppColorTokens.dark.textPrimary,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.borderCard,
        side: BorderSide(color: AppColorTokens.dark.border),
      ),
      color: AppColorTokens.dark.surface,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: AppSpacing.buttonPadding,
        minimumSize: Size(0, AppSizes.buttonLg),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderButton),
        backgroundColor: AppColorTokens.dark.primary,
        foregroundColor: AppColorTokens.dark.onPrimary,
        textStyle: AppTypography.button,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: AppSpacing.buttonPadding,
        minimumSize: Size(0, AppSizes.buttonLg),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderButton),
        side: BorderSide(color: AppColorTokens.dark.primary),
        textStyle: AppTypography.button,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: AppSpacing.buttonPaddingSmall,
        textStyle: AppTypography.button,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorTokens.dark.surfaceAlt,
      border: OutlineInputBorder(
        borderRadius: AppRadius.borderInput,
        borderSide: BorderSide(color: AppColorTokens.dark.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.borderInput,
        borderSide: BorderSide(color: AppColorTokens.dark.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.borderInput,
        borderSide: BorderSide(color: AppColorTokens.dark.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.borderInput,
        borderSide: BorderSide(color: AppColorTokens.dark.error),
      ),
      contentPadding: AppSpacing.inputPadding,
      labelStyle: AppTypography.inputLabel,
      hintStyle: AppTypography.input.copyWith(
        color: AppColorTokens.dark.textSecondary,
      ),
      helperStyle: AppTypography.inputHelper,
      errorStyle: AppTypography.inputHelper.copyWith(
        color: AppColorTokens.dark.error,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorTokens.dark.surface,
      selectedItemColor: AppColorTokens.dark.primary,
      unselectedItemColor: AppColorTokens.dark.textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: AppShadows.elevationMd,
    ),
    dividerTheme: DividerThemeData(
      color: AppColorTokens.dark.divider,
      thickness: AppSizes.divider,
    ),
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(borderRadius: AppRadius.borderChip),
      labelStyle: AppTypography.caption,
    ),
  );
}
