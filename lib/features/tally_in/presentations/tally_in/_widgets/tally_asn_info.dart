import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/tally_in/data/models/tally_models.dart';

/// ASN information display widget
class TallyAsnInfo extends StatelessWidget {
  const TallyAsnInfo({
    required this.data,
    this.onContainerSealTap,
    super.key,
  });

  final TallyTopBarData data;
  final VoidCallback? onContainerSealTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.title(
            fontSize: 16,
            'ASN - ${data.asnNumber}',
            fontWeight: FontWeight.w600,
          ),
          _Separator(),
          AppText.body(
            fontSize: 12,
            data.companyName,
            color: context.colors.textSecondary,
          ),
          _Separator(),
          AppText.body(
            fontSize: 12,
            data.vehicleNumber,
            color: context.colors.textSecondary,
          ),
          _Separator(),
          _ContainerSealDropdown(
            value: data.containerSeal,
            onTap: onContainerSealTap,
          ),
        ],
      ),
    );
  }
}

class _Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.horizontalXs,
      child: AppText.body('·', color: context.colors.textSecondary),
    );
  }
}

class _ContainerSealDropdown extends StatelessWidget {
  const _ContainerSealDropdown({required this.value, this.onTap});

  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.borderSm,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText.body(fontSize: 12, value),
              AppSpacing.widthXs,
              Icon(
                Icons.keyboard_arrow_down,
                size: 14,
                color: context.colors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
