import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Header widget for pallet monitor
///
/// Displays:
/// - Pallet number (in green box)
/// - Product name
/// - Print button
/// - Pallet code + status
class PalletHeader extends StatelessWidget {
  const PalletHeader({
    required this.palletNumber,
    required this.productName,
    required this.palletCode,
    required this.status,
    this.onPrint,
    super.key,
  });

  final int palletNumber;
  final String productName;
  final String palletCode;
  final String status;
  final VoidCallback? onPrint;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Pallet number badge
        _PalletNumberBadge(number: palletNumber),
        AppSpacing.widthMd,
        // Product info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product name + Print button
              Row(
                children: [
                  Flexible(
                    child: AppText.title(
                      productName,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppSpacing.widthSm,
                  _PrintButton(onPressed: onPrint),
                ],
              ),
              AppSpacing.heightXs,
              // Pallet code + Status
              Row(
                children: [
                  AppText.bodySmall(
                    palletCode,
                    color: context.colors.textSecondary,
                  ),
                  AppSpacing.widthSm,
                  _StatusChip(status: status),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Green badge with pallet number
class _PalletNumberBadge extends StatelessWidget {
  const _PalletNumberBadge({required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppPalette.earthGreen,
        borderRadius: AppRadius.borderSm,
      ),
      alignment: Alignment.center,
      child: AppText.title(
        number.toString(),
        color: AppPalette.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

/// Blue print button
class _PrintButton extends StatelessWidget {
  const _PrintButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppPalette.primaryBlue,
      borderRadius: AppRadius.borderSm,
      child: InkWell(
        onTap: onPressed,
        borderRadius: AppRadius.borderSm,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.print_outlined,
                color: AppPalette.white,
                size: 16,
              ),
              AppSpacing.widthXs,
              AppText.buttonSmall('Print', color: AppPalette.white),
            ],
          ),
        ),
      ),
    );
  }
}

/// Chip status (Finished, In Progress, etc)
class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final String status;

  Color get _color {
    switch (status.toLowerCase()) {
      case 'finished':
        return AppPalette.earthGreen;
      case 'in progress':
        return AppPalette.warningOrange;
      default:
        return AppPalette.darkGray;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppText.caption(
      status,
      color: _color,
      fontWeight: FontWeight.w500,
    );
  }
}
