import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';

/// Variant styles for TallyActionButton
enum TallyButtonVariant {
  /// Blue filled button (primary action)
  primary,

  /// Green filled button (success/confirm)
  success,

  /// Orange filled button (warning)
  warning,

  /// Red filled button (danger/error)
  danger,

  /// Gray outlined button
  outlined,
}

/// Reusable action button for tally feature
///
/// Supports:
/// - Multiple color variants (primary, success, warning, danger, outlined)
/// - Optional leading icon
/// - Customizable border radius
/// - Loading state
class TallyActionButton extends StatelessWidget {
  const TallyActionButton({
    required this.label,
    this.onPressed,
    this.variant = TallyButtonVariant.primary,
    this.icon,
    this.isLoading = false,
    this.borderRadius,
    this.padding,
    super.key,
  });

  /// Button label text
  final String label;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Button color variant
  final TallyButtonVariant variant;

  /// Optional leading icon
  final IconData? icon;

  /// Whether button is in loading state
  final bool isLoading;

  /// Custom border radius (default: AppRadius.sm)
  final BorderRadius? borderRadius;

  /// Custom padding
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final colors = _getColors();
    final effectiveRadius = borderRadius ?? AppRadius.borderSm;
    final effectivePadding = padding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8);

    return Material(
      color: colors.background,
      borderRadius: effectiveRadius,
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: effectiveRadius,
        child: Container(
          padding: effectivePadding,
          decoration: variant == TallyButtonVariant.outlined
              ? BoxDecoration(
                  border: Border.all(color: colors.border),
                  borderRadius: effectiveRadius,
                )
              : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isLoading) ...[
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colors.foreground,
                  ),
                ),
              ] else if (icon != null) ...[
                Icon(
                  icon,
                  size: 16,
                  color: colors.foreground,
                ),
              ],
              if (icon != null || isLoading) AppSpacing.widthXs,
              AppText.buttonSmall(
                label,
                color: colors.foreground,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _ButtonColors _getColors() {
    return switch (variant) {
      TallyButtonVariant.primary => _ButtonColors(
          background: AppPalette.primaryBlue,
          foreground: AppPalette.white,
          border: AppPalette.primaryBlue,
        ),
      TallyButtonVariant.success => _ButtonColors(
          background: AppPalette.earthGreen,
          foreground: AppPalette.white,
          border: AppPalette.earthGreen,
        ),
      TallyButtonVariant.warning => _ButtonColors(
          background: AppPalette.warningOrange,
          foreground: AppPalette.white,
          border: AppPalette.warningOrange,
        ),
      TallyButtonVariant.danger => _ButtonColors(
          background: AppPalette.errorRed,
          foreground: AppPalette.white,
          border: AppPalette.errorRed,
        ),
      TallyButtonVariant.outlined => _ButtonColors(
          background: Colors.transparent,
          foreground: AppPalette.darkGray,
          border: AppPalette.mediumGray,
        ),
    };
  }
}

class _ButtonColors {
  const _ButtonColors({
    required this.background,
    required this.foreground,
    required this.border,
  });

  final Color background;
  final Color foreground;
  final Color border;
}
