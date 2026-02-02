import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/layout/app_card.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/tally_in/data/models/tally_models.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/bloc/monitor/tally_monitor_bloc.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/pallet_header.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/pallet_summary.dart';

/// Connected widget - manages BlocBuilder internally
class PalletMonitorSectionConnected extends StatelessWidget {
  const PalletMonitorSectionConnected({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TallyMonitorBloc, TallyMonitorState>(
      buildWhen: (prev, curr) =>
          prev.activePallet != curr.activePallet ||
          prev.selectedCellId != curr.selectedCellId ||
          prev.nextCellPosition != curr.nextCellPosition,
      builder: (context, state) {
        final pallet = state.activePallet;
        final item = state.activeItem;

        if (pallet == null || item == null) {
          return const Center(child: Text('No pallet selected'));
        }

        return PalletMonitorSection(
          pallet: pallet,
          item: item,
          selectedCellId: state.selectedCellId,
          nextCellPosition: state.nextCellPosition,
          onCellTap: (cellId) {
            context.read<TallyMonitorBloc>().add(
              TallyMonitorEvent.selectCell(cellId),
            );
          },
          onCellDelete: (cellId) {
            context.read<TallyMonitorBloc>().add(
              TallyMonitorEvent.deleteCell(cellId),
            );
          },
          onPalletChange: (palletId) {
            context.read<TallyMonitorBloc>().add(
              TallyMonitorEvent.selectPallet(palletId),
            );
          },
        );
      },
    );
  }
}

/// Main section widget for displaying the pallet monitor
///
/// Consists of:
/// - Header (pallet number, product name, code, status, print button)
/// - Summary (total weight & total pack)
/// - Grid (A-E x 1-15)
class PalletMonitorSection extends StatelessWidget {
  const PalletMonitorSection({
    required this.pallet,
    required this.item,
    this.selectedCellId,
    this.nextCellPosition,
    this.onPrint,
    this.onCellTap,
    this.onCellDelete,
    this.onPalletChange,
    super.key,
  });

  final TallyPallet pallet;
  final TallyItem item;
  final String? selectedCellId;
  final String? nextCellPosition;
  final VoidCallback? onPrint;
  final void Function(String cellId)? onCellTap;
  final void Function(String cellId)? onCellDelete;
  final void Function(String palletId)? onPalletChange;

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
                      palletNumber: pallet.palletNumber,
                      productName: item.productName,
                      palletCode: pallet.palletCode,
                      status: pallet.status,
                      onPrint: onPrint,
                    ),
                  ),
                  AppSpacing.widthMd,
                  PalletSummary(
                    totalWeight: pallet.totalWeight,
                    totalPack: pallet.totalPcs,
                  ),
                ],
              ),
            ),
            AppSpacing.heightMd,
            // Grid (fills available space)
            Expanded(
              child: _TallyGrid(
                cells: pallet.cells,
                selectedCellId: selectedCellId,
                nextCellPosition: nextCellPosition,
                onCellTap: onCellTap,
                onCellDelete: onCellDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tally grid widget using new TallyCell model
/// Grid fills available space with flexible cells, scrollable when overflow
class _TallyGrid extends StatelessWidget {
  const _TallyGrid({
    required this.cells,
    this.selectedCellId,
    this.nextCellPosition,
    this.onCellTap,
    this.onCellDelete,
  });

  final Map<String, TallyCell> cells;
  final String? selectedCellId;
  final String? nextCellPosition;
  final void Function(String cellId)? onCellTap;
  final void Function(String cellId)? onCellDelete;

  static const double _rowLabelWidth = 32;
  static const double _headerHeight = 36;
  static const double _rowMinHeight = 48;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Column headers row
              SizedBox(
                height: _headerHeight,
                child: Row(
                  children: [
                    // Empty corner cell
                    SizedBox(width: _rowLabelWidth),
                    // Column headers (1-15) - use Expanded to fill available space
                    for (var col = 1; col <= TallyPallet.columnCount; col++)
                      Expanded(child: _HeaderCell(label: col.toString())),
                  ],
                ),
              ),
              // Grid rows
              for (final row in TallyPallet.rowLabels)
                SizedBox(
                  height: _rowMinHeight,
                  child: Row(
                    children: [
                      // Row label (A, B, C, D, E)
                      SizedBox(
                        width: _rowLabelWidth,
                        child: _HeaderCell(label: row, isRowLabel: true),
                      ),
                      // Data cells - use Expanded to fill available space
                      for (var col = 1; col <= TallyPallet.columnCount; col++)
                        Expanded(
                          child: _GridCell(
                            cellId: '$row$col',
                            cell: cells['$row$col'],
                            isSelected: selectedCellId == '$row$col',
                            isNextCell: nextCellPosition == '$row$col',
                            onTap: () => onCellTap?.call('$row$col'),
                            onDelete: cells['$row$col']?.hasValue ?? false
                                ? () => onCellDelete?.call('$row$col')
                                : null,
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

/// Header cell for row/column labels with background color
class _HeaderCell extends StatelessWidget {
  const _HeaderCell({required this.label, this.isRowLabel = false});

  final String label;
  final bool isRowLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}

/// Individual grid cell with delete icon for selected cells
class _GridCell extends StatelessWidget {
  const _GridCell({
    required this.cellId,
    this.cell,
    this.isSelected = false,
    this.isNextCell = false,
    this.onTap,
    this.onDelete,
  });

  final String cellId;
  final TallyCell? cell;
  final bool isSelected;
  final bool isNextCell;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final hasValue = cell?.hasValue ?? false;

    Color backgroundColor;
    Color borderColor;

    if (isSelected) {
      backgroundColor = context.colors.primary.withValues(alpha: 0.15);
      borderColor = context.colors.primary;
    } else if (isNextCell) {
      backgroundColor = Colors.orange.withValues(alpha: 0.1);
      borderColor = Colors.orange;
    } else if (hasValue) {
      backgroundColor = context.colors.primary.withValues(alpha: 0.05);
      borderColor = context.colors.primary.withValues(alpha: 0.3);
    } else {
      backgroundColor = context.colors.surface;
      borderColor = context.colors.border;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(2),
        constraints: const BoxConstraints(minHeight: 44),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Weight value - centered, bigger and bold
            if (hasValue)
              Center(
                child: Text(
                  cell!.weight!.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: context.colors.textPrimary,
                  ),
                ),
              ),
            // Delete icon - top right corner, outside the cell (like Image 2)
            if (isSelected && hasValue && onDelete != null)
              Positioned(
                top: -6,
                right: -6,
                child: GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.delete_outline,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
