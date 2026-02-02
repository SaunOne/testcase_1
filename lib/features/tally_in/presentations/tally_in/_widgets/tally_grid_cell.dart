import 'package:flutter/material.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/tally_in/data/models/tally_models.dart';

/// Individual grid cell with delete icon for selected cells
class TallyGridCell extends StatelessWidget {
  const TallyGridCell({
    required this.cellId,
    this.cell,
    this.isSelected = false,
    this.isNextCell = false,
    this.onTap,
    this.onDelete,
    super.key,
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
            // Weight value
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
            // Delete icon
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
