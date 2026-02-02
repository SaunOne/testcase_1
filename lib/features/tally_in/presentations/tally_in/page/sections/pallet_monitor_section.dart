import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/layout/app_card.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/tally_in/data/models/pallet_data_model.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/widgets/pallet_grid.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/widgets/pallet_header.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/widgets/pallet_summary.dart';

/// Main section widget for displaying the pallet monitor
///
/// Consists of:
/// - Header (pallet number, product name, code, status, print button)
/// - Summary (total weight & total pack)
/// - Grid (A-D x 1-15)
class PalletMonitorSection extends StatelessWidget {
  const PalletMonitorSection({
    required this.data,
    this.onPrint,
    this.onCellTap,
    this.onCellDelete,
    super.key,
  });

  final PalletData data;
  final VoidCallback? onPrint;
  final void Function(PalletCellData cell)? onCellTap;
  final void Function(PalletCellData cell)? onCellDelete;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: AppSpacing.paddingMd,
      child: Container(
        padding: AppSpacing.paddingMd,
        decoration: BoxDecoration(
          border: Border.all(color: context.colors.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header + Summary row
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              padding: AppSpacing.paddingSm,
              child: Row(
                children: [
                  Expanded(
                    child: PalletHeader(
                      palletNumber: data.palletNumber,
                      productName: data.productName,
                      palletCode: data.palletCode,
                      status: data.status,
                      onPrint: onPrint,
                    ),
                  ),
                  AppSpacing.widthMd,
                  PalletSummary(
                    totalWeight: 102323.0123123,
                    totalPack: data.totalPack,
                  ),
                ],
              ),
            ),
            AppSpacing.heightMd,
            // Grid (scrollable both vertically and horizontally)
            Flexible(
              child: SingleChildScrollView(
                child: PalletGrid(
                  cells: data.cells,
                  onCellTap: onCellTap,
                  onCellDelete: onCellDelete,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
