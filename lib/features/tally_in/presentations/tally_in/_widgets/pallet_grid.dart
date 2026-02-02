import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/tally_in/data/models/pallet_data_model.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/pallet_grid_cell.dart';

/// Grid widget for displaying cells in table format
///
/// Layout:
/// - Header row: columns 1-15 (shorter height)
/// - Data rows: A, B, C, D with cells in each column (taller height)
class PalletGrid extends StatelessWidget {
  const PalletGrid({
    required this.cells,
    this.onCellTap,
    this.onCellDelete,
    this.selectedCellId,
    super.key,
  });

  final List<PalletCellData> cells;
  final void Function(PalletCellData cell)? onCellTap;
  final void Function(PalletCellData cell)? onCellDelete;
  final String? selectedCellId;

  static const List<String> _rowLabels = ['A', 'B', 'C', 'D', 'E'];
  static const int _columnCount = 15;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Column headers (1-15)
          _buildColumnHeaders(context),
          AppSpacing.heightXs,
          // Data rows (A-D)
          ..._rowLabels.map((rowLabel) => _buildDataRow(context, rowLabel)),
        ],
      ),
    );
  }

  Widget _buildColumnHeaders(BuildContext context) {
    return Row(
      children: [
        // Empty space for row label column
        const SizedBox(width: 36),
        AppSpacing.widthXs,
        // Column numbers
        for (var i = 1; i <= _columnCount; i++) ...[
          _ColumnHeader(number: i),
          if (i < _columnCount) AppSpacing.widthXs,
        ],
      ],
    );
  }

  Widget _buildDataRow(BuildContext context, String rowLabel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        children: [
          // Row label (A, B, C, D)
          _RowLabel(label: rowLabel),
          AppSpacing.widthXs,
          // Cells
          for (var col = 1; col <= _columnCount; col++) ...[
            _buildCell(rowLabel, col),
            if (col < _columnCount) AppSpacing.widthXs,
          ],
        ],
      ),
    );
  }

  Widget _buildCell(String rowLabel, int columnIndex) {
    // Find cell data for this position
    final cellData = cells.firstWhere(
      (c) => c.rowLabel == rowLabel && c.columnIndex == columnIndex,
      orElse: () =>
          PalletCellData(rowLabel: rowLabel, columnIndex: columnIndex),
    );

    final isSelected = selectedCellId == cellData.cellId;

    return PalletGridCell(
      data: cellData,
      isSelected: isSelected,
      onTap: onCellTap != null ? () => onCellTap!(cellData) : null,
      onDelete: onCellDelete != null ? () => onCellDelete!(cellData) : null,
    );
  }
}

/// Column header (1-15) with gray background - shorter height
class _ColumnHeader extends StatelessWidget {
  const _ColumnHeader({required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: PalletGridCell.cellWidth,
      height: PalletGridCell.headerHeight,
      decoration: BoxDecoration(
        color: context.colors.surfaceAlt,
        borderRadius: AppRadius.borderMd,
      ),
      alignment: Alignment.center,
      child: AppText.body(
        number.toString(),
        color: context.colors.textSecondary,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

/// Row label (A, B, C, D) - matches data cell height
class _RowLabel extends StatelessWidget {
  const _RowLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: PalletGridCell.cellHeight,
      decoration: BoxDecoration(
        color: context.colors.surfaceAlt,
        borderRadius: AppRadius.borderMd,
      ),
      alignment: Alignment.center,
      child: AppText.body(label, fontWeight: FontWeight.w600),
    );
  }
}
