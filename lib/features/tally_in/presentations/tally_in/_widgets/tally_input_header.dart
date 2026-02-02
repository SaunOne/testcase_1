import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/tally_action_button.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/tally_icon_button.dart';

/// Header widget for input panel with title and action buttons
class TallyInputHeader extends StatelessWidget {
  const TallyInputHeader({
    this.onDecimalSettingTap,
    this.onEditTap,
    this.onSaveTap,
    super.key,
  });

  final VoidCallback? onDecimalSettingTap;
  final VoidCallback? onEditTap;
  final VoidCallback? onSaveTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText.h2('Data Input', fontWeight: FontWeight.w700),
        const Spacer(),
        TallyActionButton(
          label: 'Decimal Setting',
          icon: Icons.settings,
          variant: TallyButtonVariant.primary,
          onPressed: onDecimalSettingTap,
        ),
        AppSpacing.widthSm,
        TallyIconButton(icon: Icons.edit_outlined, onTap: onEditTap),
        AppSpacing.widthSm,
        TallyIconButton(
          icon: Icons.save_outlined,
          backgroundColor: AppPalette.warningOrange,
          iconColor: AppPalette.white,
          onTap: onSaveTap,
        ),
      ],
    );
  }
}
