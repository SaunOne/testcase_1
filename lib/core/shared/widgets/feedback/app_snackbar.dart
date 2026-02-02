import 'package:flutter/material.dart';

enum SnackbarType { success, error, warning, info }

class AppSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    required SnackbarType type,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final colors = _getColors(type, colorScheme);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(_getIcon(type), color: colors.iconColor, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: colors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: colors.backgroundColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: colors.borderColor, width: 1),
          ),
          duration: duration,
          action: action,
          margin: const EdgeInsets.all(16),
        ),
      );
  }

  static IconData _getIcon(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return Icons.check_circle_outline;
      case SnackbarType.error:
        return Icons.error_outline;
      case SnackbarType.warning:
        return Icons.warning_amber_outlined;
      case SnackbarType.info:
        return Icons.info_outline;
    }
  }

  static _SnackbarColors _getColors(
    SnackbarType type,
    ColorScheme colorScheme,
  ) {
    switch (type) {
      case SnackbarType.success:
        return _SnackbarColors(
          backgroundColor: const Color(0xFF10B981).withOpacity(0.1),
          borderColor: const Color(0xFF10B981),
          iconColor: const Color(0xFF10B981),
          textColor: colorScheme.onSurface,
        );
      case SnackbarType.error:
        return _SnackbarColors(
          backgroundColor: const Color(0xFFEF4444).withOpacity(0.1),
          borderColor: const Color(0xFFEF4444),
          iconColor: const Color(0xFFEF4444),
          textColor: colorScheme.onSurface,
        );
      case SnackbarType.warning:
        return _SnackbarColors(
          backgroundColor: const Color(0xFFF59E0B).withOpacity(0.1),
          borderColor: const Color(0xFFF59E0B),
          iconColor: const Color(0xFFF59E0B),
          textColor: colorScheme.onSurface,
        );
      case SnackbarType.info:
        return _SnackbarColors(
          backgroundColor: const Color(0xFF3B82F6).withOpacity(0.1),
          borderColor: const Color(0xFF3B82F6),
          iconColor: const Color(0xFF3B82F6),
          textColor: colorScheme.onSurface,
        );
    }
  }
}

class _SnackbarColors {
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;

  _SnackbarColors({
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.textColor,
  });
}
