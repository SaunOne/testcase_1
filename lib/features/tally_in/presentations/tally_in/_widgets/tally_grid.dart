import 'package:flutter/material.dart';
import 'package:testcase_1/features/tally_in/data/models/tally_models.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/tally_grid_cell.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/tally_grid_header_cell.dart';

/// Tally grid widget for pallet monitor
/// Grid fills available space with flexible cells, scrollable when overflow
class TallyGrid extends StatelessWidget {
  const TallyGrid({
    required this.cells,
    this.selectedCellId,
    this.nextCellPosition,
    this.onCellTap,
    this.onCellDelete,
    super.key,
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
                    SizedBox(width: _rowLabelWidth),
                    for (var col = 1; col <= TallyPallet.columnCount; col++)
                      Expanded(
                        child: TallyGridHeaderCell(label: col.toString()),
                      ),
                  ],
                ),
              ),
              // Grid rows
              for (final row in TallyPallet.rowLabels)
                SizedBox(
                  height: _rowMinHeight,
                  child: Row(
                    children: [
                      SizedBox(
                        width: _rowLabelWidth,
                        child: TallyGridHeaderCell(label: row, isRowLabel: true),
                      ),
                      for (var col = 1; col <= TallyPallet.columnCount; col++)
                        Expanded(
                          child: TallyGridCell(
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
