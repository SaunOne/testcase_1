import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/tally_square_button.dart';

/// Weight display row with action buttons (lock, delete, clear)
class TallyWeightRow extends StatelessWidget {
  const TallyWeightRow({
    required this.weight,
    this.onLockTap,
    this.onDeleteTap,
    this.onClearTap,
    super.key,
  });

  final String weight;
  final VoidCallback? onLockTap;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onClearTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: context.colors.border),
              borderRadius: AppRadius.borderSm,
            ),
            child: Row(
              children: [
                AppText.caption(
                  'Weight (kg)',
                  color: context.colors.textSecondary,
                ),
                const Spacer(),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 150),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.3),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: AppText.h1(
                    weight.isEmpty ? '0' : weight,
                    key: ValueKey(weight),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        AppSpacing.widthSm,
        TallySquareButton(
          icon: Icons.lock_outline,
          backgroundColor: context.colors.surfaceAlt,
          onTap: onLockTap,
        ),
        AppSpacing.widthSm,
        TallySquareButton(
          icon: Icons.delete_outline,
          backgroundColor: AppPalette.warningOrange,
          iconColor: AppPalette.white,
          onTap: onDeleteTap,
        ),
        AppSpacing.widthSm,
        TallySquareButton(
          icon: Icons.close,
          backgroundColor: AppPalette.errorRed,
          iconColor: AppPalette.white,
          onTap: onClearTap,
        ),
      ],
    );
  }
}
