import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/tally_status_chip.dart';

/// Data model for top bar information
class TallyTopBarData {
  const TallyTopBarData({
    required this.asnNumber,
    required this.companyName,
    required this.vehicleNumber,
    this.containerSeal,
    this.isOffline = false,
  });

  final String asnNumber;
  final String companyName;
  final String vehicleNumber;
  final String? containerSeal;
  final bool isOffline;
}

/// Top bar section for Tally In page
///
/// Contains:
/// - Back button
/// - ASN info (number, company, vehicle, container/seal)
/// - Action chips (Offline Mode, View RCS, BAPB, Photo, Tally Sheet)
class TallyTopBarSection extends StatelessWidget {
  const TallyTopBarSection({
    required this.data,
    this.onBack,
    this.onViewRCS,
    this.onBAPB,
    this.onPhoto,
    this.onTallySheet,
    this.onContainerSealTap,
    super.key,
  });

  final TallyTopBarData data;
  final VoidCallback? onBack;
  final VoidCallback? onViewRCS;
  final VoidCallback? onBAPB;
  final VoidCallback? onPhoto;
  final VoidCallback? onTallySheet;
  final VoidCallback? onContainerSealTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: context.colorScheme.primary, width: 8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 16, top: 12, bottom: 12),
        child: Row(
          children: [
            // Left side: Back button + ASN info
            _BackButton(onTap: onBack),
            AppSpacing.widthMd,
            _AsnInfo(data: data, onContainerSealTap: onContainerSealTap),
            const Spacer(),
            // Right side: Action chips
            _ActionChips(
              isOffline: data.isOffline,
              onViewRCS: onViewRCS,
              onBAPB: onBAPB,
              onPhoto: onPhoto,
              onTallySheet: onTallySheet,
            ),
          ],
        ),
      ),
    );
  }
}

/// Back button with blue accent bar
class _BackButton extends StatelessWidget {
  const _BackButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSpacing.widthSm,
        // Back arrow
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: AppRadius.borderSm,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: context.colors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// ASN information display
class _AsnInfo extends StatelessWidget {
  const _AsnInfo({required this.data, this.onContainerSealTap});

  final TallyTopBarData data;
  final VoidCallback? onContainerSealTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ASN Number
        AppText.title('ASN - ${data.asnNumber}', fontWeight: FontWeight.w600),
        _Separator(),
        // Company name
        AppText.body(data.companyName, color: context.colors.textSecondary),
        _Separator(),
        // Vehicle number
        AppText.body(data.vehicleNumber, color: context.colors.textSecondary),
        _Separator(),
        // Container/Seal dropdown
        _ContainerSealDropdown(
          value: data.containerSeal ?? 'No Cont / Seal',
          onTap: onContainerSealTap,
        ),
      ],
    );
  }
}

/// Separator dot between info items
class _Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.horizontalMd,
      child: AppText.body('·', color: context.colors.textSecondary),
    );
  }
}

/// Container/Seal dropdown button
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
              AppText.body(value),
              AppSpacing.widthXs,
              Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: context.colors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Action chips row
class _ActionChips extends StatelessWidget {
  const _ActionChips({
    required this.isOffline,
    this.onViewRCS,
    this.onBAPB,
    this.onPhoto,
    this.onTallySheet,
  });

  final bool isOffline;
  final VoidCallback? onViewRCS;
  final VoidCallback? onBAPB;
  final VoidCallback? onPhoto;
  final VoidCallback? onTallySheet;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Offline mode indicator
        if (isOffline) ...[
          TallyStatusChip(
            label: 'Offline Mode',
            variant: TallyChipVariant.warning,
            icon: Icons.wifi_off,
          ),
          AppSpacing.widthSm,
        ],
        // View RCS
        TallyStatusChip(
          label: 'View RCS',
          variant: TallyChipVariant.info,
          icon: Icons.description_outlined,
          onTap: onViewRCS,
        ),
        AppSpacing.widthSm,
        // BAPB
        TallyStatusChip(
          label: 'BAPB',
          variant: TallyChipVariant.success,
          icon: Icons.description_outlined,
          onTap: onBAPB,
        ),
        AppSpacing.widthSm,
        // Photo
        TallyStatusChip(
          label: 'Photo',
          variant: TallyChipVariant.photo,
          icon: Icons.camera_alt_outlined,
          onTap: onPhoto,
        ),
        AppSpacing.widthSm,
        // Tally Sheet
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
