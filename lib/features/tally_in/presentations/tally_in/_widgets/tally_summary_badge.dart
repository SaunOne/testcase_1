import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';

/// Summary badge widget for displaying counts
///
/// Used for showing summary info like:
/// - "25 / 50 Pallets"
/// - "5 Items"
class TallySummaryBadge extends StatelessWidget {
  const TallySummaryBadge({
    required this.label,
    this.icon,
    this.currentValue,
    this.totalValue,
    this.onTap,
    super.key,
  });

  /// Badge label (e.g., "Pallets", "Items")
  final String label;

  /// Optional leading icon
  final IconData? icon;

  /// Current value (optional, for showing "current / total")
  final int? currentValue;

  /// Total value (optional, for showing "current / total")
  final int? totalValue;

  /// Callback when badge is tapped
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppPalette.neutralDark,
      borderRadius: AppRadius.borderFull,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.borderCard,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 16, color: AppPalette.white),
                AppSpacing.widthSm,
              ],
              _buildValueText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildValueText() {
    if (currentValue != null && totalValue != null) {
      // Show "current / total Label" format
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.body(
            currentValue.toString(),
            color: AppPalette.white,
            fontWeight: FontWeight.w600,
          ),
          AppText.caption(' / $totalValue ', color: AppPalette.mediumGray),
          AppText.caption(label, color: AppPalette.white),
        ],
      );
    } else if (totalValue != null) {
      // Show "total Label" format
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.body(
            totalValue.toString(),
            color: AppPalette.white,
            fontWeight: FontWeight.w600,
          ),
          AppSpacing.widthXs,
          AppText.caption(label, color: AppPalette.white),
        ],
      );
    }

    // Just show label
    return AppText.caption(label, color: AppPalette.white);
  }
}
