import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/tally_in/data/models/pallet_data_model.dart';

/// Product item card widget
///
/// Displays product information in a card format:
/// - Product name
/// - Batch code
/// - Total weight (kg) and pack count (pcs)
/// - Pallet progress indicator
class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    required this.data,
    this.onTap,
    super.key,
  });

  final ProductItemData data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderColor = data.isSelected
        ? AppPalette.primaryBlue
        : data.hasActivePallets
            ? AppPalette.earthGreen.withValues(alpha: 0.5)
            : context.colors.border;

    return Material(
      color: data.hasActivePallets
          ? AppPalette.earthGreen.withValues(alpha: 0.05)
          : context.colors.surface,
      borderRadius: AppRadius.borderMd,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.borderMd,
        child: Container(
          padding: AppSpacing.paddingMd,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: data.isSelected ? 2 : 1,
            ),
            borderRadius: AppRadius.borderMd,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product name
              AppText.title(
                data.productName,
                fontWeight: FontWeight.w600,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              AppSpacing.heightXs,
              // Batch code
              AppText.caption(
                data.batchCode,
                color: context.colors.textSecondary,
              ),
              AppSpacing.heightMd,
              // Weight and Pack info + Pallet indicator
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Weight and Pack
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _WeightDisplay(weight: data.totalWeight),
                        AppSpacing.heightXxs,
                        _PackDisplay(pack: data.totalPack),
                      ],
                    ),
                  ),
                  // Pallet indicator
                  _PalletIndicator(
                    currentPallet: data.currentPallet,
                    activePalletCount: data.activePalletCount,
                    totalPallet: data.totalPallet,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Weight display with "kg" unit
class _WeightDisplay extends StatelessWidget {
  const _WeightDisplay({required this.weight});

  final double weight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText.h2(
          _formatWeight(weight),
          fontWeight: FontWeight.w700,
        ),
        AppSpacing.widthXs,
        AppText.caption(
          'kg',
          color: context.colors.textSecondary,
        ),
      ],
    );
  }

  String _formatWeight(double weight) {
    final parts = weight.toStringAsFixed(2).split('.');
    final intPart = parts[0];
    final decPart = parts[1];

    final buffer = StringBuffer();
    for (var i = 0; i < intPart.length; i++) {
      if (i > 0 && (intPart.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(intPart[i]);
    }

    return '${buffer.toString()}.$decPart';
  }
}

/// Pack display with "pcs" unit
class _PackDisplay extends StatelessWidget {
  const _PackDisplay({required this.pack});

  final int pack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText.title(
          pack.toString(),
          fontWeight: FontWeight.w600,
        ),
        AppSpacing.widthXs,
        AppText.caption(
          'pcs',
          color: context.colors.textSecondary,
        ),
      ],
    );
  }
}

/// Pallet progress indicator
class _PalletIndicator extends StatelessWidget {
  const _PalletIndicator({
    required this.currentPallet,
    required this.activePalletCount,
    required this.totalPallet,
  });

  final int currentPallet;
  final int activePalletCount;
  final int totalPallet;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.border),
        borderRadius: AppRadius.borderSm,
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.inventory_2_outlined,
                size: 14,
                color: context.colors.textSecondary,
              ),
              AppSpacing.widthXs,
              AppText.caption(
                'Pallet',
                color: context.colors.textSecondary,
              ),
            ],
          ),
          AppSpacing.heightXs,
          _buildPalletCount(context),
        ],
      ),
    );
  }

  Widget _buildPalletCount(BuildContext context) {
    if (currentPallet > 0 && activePalletCount > 0) {
      // Show "current / active / total" format with colors
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.title(
            currentPallet.toString(),
            color: AppPalette.earthGreen,
            fontWeight: FontWeight.w700,
          ),
          AppText.caption(
            ' / $activePalletCount ',
            color: context.colors.textSecondary,
          ),
          AppText.title(
            activePalletCount.toString(),
            color: AppPalette.errorRed,
            fontWeight: FontWeight.w700,
          ),
          AppText.caption(
            ' / $totalPallet',
            color: context.colors.textSecondary,
          ),
        ],
      );
    }

    // Show "current / total" format
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText.title(
          currentPallet.toString(),
          fontWeight: FontWeight.w700,
        ),
        AppText.caption(
          ' / $totalPallet',
          color: context.colors.textSecondary,
        ),
      ],
    );
  }
}
