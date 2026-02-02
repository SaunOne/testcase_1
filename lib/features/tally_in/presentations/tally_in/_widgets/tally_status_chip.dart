import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';

/// Predefined status chip variants
enum TallyChipVariant {
  /// Orange chip for offline mode / warning
  warning,

  /// Blue chip for info actions (View RCS)
  info,

  /// Green chip for success actions (BAPB)
  success,

  /// Yellow/Gold chip for photo actions
  photo,

  /// Primary blue for main actions (Tally Sheet)
  primary,
}

/// Status chip widget for tally feature
///
/// Used for status indicators and action chips like:
/// - Offline Mode (warning)
/// - View RCS (info)
/// - BAPB (success)
/// - Photo (photo)
/// - Tally Sheet (primary)
class TallyStatusChip extends StatelessWidget {
  const TallyStatusChip({
    required this.label,
    this.variant = TallyChipVariant.info,
    this.icon,
    this.onTap,
    this.isSelected = false,
    super.key,
  });

  /// Chip label text
  final String label;

  /// Chip color variant
  final TallyChipVariant variant;

  /// Optional leading icon
  final IconData? icon;

  /// Callback when chip is tapped
  final VoidCallback? onTap;

  /// Whether chip is in selected state
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colors = _getColors();

    return Material(
      color: colors.background,
      borderRadius: AppRadius.borderSm,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.borderSm,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 14,
                  color: colors.foreground,
                ),
                AppSpacing.widthXs,
              ],
              AppText.caption(
                label,
                color: colors.foreground,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _ChipColors _getColors() {
    return switch (variant) {
      TallyChipVariant.warning => const _ChipColors(
          background: Color(0xFFFFF3E0),
          foreground: Color(0xFFE65100),
        ),
      TallyChipVariant.info => const _ChipColors(
          background: Color(0xFFE3F2FD),
          foreground: Color(0xFF1976D2),
        ),
      TallyChipVariant.success => const _ChipColors(
          background: Color(0xFFE8F5E9),
          foreground: Color(0xFF388E3C),
        ),
      TallyChipVariant.photo => const _ChipColors(
          background: Color(0xFFFFF8E1),
          foreground: Color(0xFFF9A825),
        ),
      TallyChipVariant.primary => const _ChipColors(
          background: AppPalette.primaryBlue,
          foreground: AppPalette.white,
        ),
    };
  }
}

class _ChipColors {
  const _ChipColors({
    required this.background,
    required this.foreground,
  });

  final Color background;
  final Color foreground;
}
