import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/tally_status_chip.dart';

/// Action chips row for top bar
class TallyTopBarActions extends StatelessWidget {
  const TallyTopBarActions({
    required this.isOffline,
    this.onOfflineModeToggle,
    this.onViewRCS,
    this.onBAPB,
    this.onPhoto,
    this.onTallySheet,
    super.key,
  });

  final bool isOffline;
  final VoidCallback? onOfflineModeToggle;
  final VoidCallback? onViewRCS;
  final VoidCallback? onBAPB;
  final VoidCallback? onPhoto;
  final VoidCallback? onTallySheet;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TallyStatusChip(
          label: isOffline ? 'Offline Mode' : 'Online Mode',
          variant:
              isOffline ? TallyChipVariant.warning : TallyChipVariant.success,
          icon: isOffline ? Icons.wifi_off : Icons.wifi,
          onTap: onOfflineModeToggle,
        ),
        AppSpacing.widthSm,
        TallyStatusChip(
          label: 'View RCS',
          variant: TallyChipVariant.info,
          icon: Icons.description_outlined,
          onTap: onViewRCS,
        ),
        AppSpacing.widthSm,
        TallyStatusChip(
          label: 'BAPB',
          variant: TallyChipVariant.success,
          icon: Icons.description_outlined,
          onTap: onBAPB,
        ),
        AppSpacing.widthSm,
        TallyStatusChip(
          label: 'Photo',
          variant: TallyChipVariant.photo,
          icon: Icons.camera_alt_outlined,
          onTap: onPhoto,
        ),
        AppSpacing.widthSm,
        TallyStatusChip(
          label: 'Tally Sheet',
          variant: TallyChipVariant.primary,
          icon: Icons.description_outlined,
          onTap: onTallySheet,
        ),
      ],
    );
  }
}
