import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/tally_in/data/models/pallet_data_model.dart';

/// Cell widget for each box in the grid
///
/// States:
/// - Empty: gray background with dash
/// - Filled: white background with border, weight value + delete button
class PalletGridCell extends StatelessWidget {
  const PalletGridCell({
    required this.data,
    this.onTap,
    this.onDelete,
    this.isSelected = false,
    super.key,
  });

  final PalletCellData data;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final bool isSelected;

  /// Cell dimensions
  static const double cellWidth = 88;
  static const double cellHeight = 56;

  /// Header/Label dimensions (taller than data cells)
  static const double headerHeight = 36;

  @override
  Widget build(BuildContext context) {
    return data.hasValue
        ? _FilledCell(
            weight: data.weight!,
            onTap: onTap,
            onDelete: onDelete,
            isSelected: isSelected,
          )
        : _EmptyCell(onTap: onTap);
  }
}

/// Empty cell with dash
class _EmptyCell extends StatelessWidget {
  const _EmptyCell({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.surfaceAlt,
      borderRadius: AppRadius.borderMd,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.borderMd,
        child: Container(
          width: PalletGridCell.cellWidth,
          height: PalletGridCell.cellHeight,
          alignment: Alignment.center,
          child: AppText.body('-', color: context.colors.textDisabled),
        ),
      ),
    );
  }
}

/// Filled cell with weight + delete button
class _FilledCell extends StatefulWidget {
  const _FilledCell({
    required this.weight,
    this.onTap,
    this.onDelete,
    this.isSelected = false,
  });

  final double weight;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final bool isSelected;

  @override
  State<_FilledCell> createState() => _FilledCellState();
}

class _FilledCellState extends State<_FilledCell> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.isSelected
        ? AppPalette.primaryBlue
        : context.colors.border;
    final borderWidth = widget.isSelected ? 2.0 : 1.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main cell
          Material(
            color: AppPalette.white,
            borderRadius: AppRadius.borderMd,
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: AppRadius.borderMd,
              child: Container(
                width: PalletGridCell.cellWidth,
                height: PalletGridCell.cellHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor, width: borderWidth),
                  borderRadius: AppRadius.borderMd,
                ),
                alignment: Alignment.center,
                child: AppText.h2(
                  widget.weight.toStringAsFixed(2),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // Delete button (show on hover)
          if (_isHovered && widget.onDelete != null)
            Positioned(
              top: -6,
              right: -6,
              child: _DeleteButton(onPressed: widget.onDelete!),
            ),
        ],
      ),
    );
  }
}

/// Small red delete button with trash icon
class _DeleteButton extends StatelessWidget {
  const _DeleteButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppPalette.errorRed,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: const SizedBox(
          width: 22,
          height: 22,
          child: Icon(Icons.delete_outline, color: AppPalette.white, size: 14),
        ),
      ),
    );
  }
}
