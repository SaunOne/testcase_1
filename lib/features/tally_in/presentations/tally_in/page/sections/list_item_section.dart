import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/layout/app_card.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/features/tally_in/data/models/pallet_data_model.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/product_item_card.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/tally_action_button.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/tally_summary_badge.dart';

/// Section widget for displaying list of product items
///
/// Contains:
/// - Header with title, summary badges, and add button
/// - Grid of product item cards
class ListItemSection extends StatelessWidget {
  const ListItemSection({
    required this.items,
    required this.summaryData,
    this.onItemTap,
    this.onAddPallet,
    super.key,
  });

  /// List of product items to display
  final List<ProductItemData> items;

  /// Summary data for header badges
  final ListSummaryData summaryData;

  /// Callback when an item is tapped
  final void Function(ProductItemData item)? onItemTap;

  /// Callback when add pallet button is pressed
  final VoidCallback? onAddPallet;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: AppSpacing.paddingMd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _ListHeader(
            summaryData: summaryData,
            onAddPallet: onAddPallet,
          ),
          AppSpacing.heightMd,
          // Items grid
          _ItemsGrid(
            items: items,
            onItemTap: onItemTap,
          ),
        ],
      ),
    );
  }
}

/// Header with title, summary badges, and add button
class _ListHeader extends StatelessWidget {
  const _ListHeader({
    required this.summaryData,
    this.onAddPallet,
  });

  final ListSummaryData summaryData;
  final VoidCallback? onAddPallet;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Title
        AppText.h2(
          'Items',
          fontWeight: FontWeight.w700,
        ),
        const Spacer(),
        // Summary badges
        TallySummaryBadge(
          icon: Icons.inventory_2_outlined,
          currentValue: summaryData.currentPallets,
          totalValue: summaryData.totalPallets,
          label: 'Pallets',
        ),
        AppSpacing.widthSm,
        TallySummaryBadge(
          icon: Icons.inventory_outlined,
          totalValue: summaryData.totalItems,
          label: 'Items',
        ),
        AppSpacing.widthSm,
        // Add pallet button
        TallyActionButton(
          label: 'Add More Pallet',
          icon: Icons.add,
          variant: TallyButtonVariant.primary,
          onPressed: onAddPallet,
        ),
      ],
    );
  }
}

/// Grid of product item cards
class _ItemsGrid extends StatelessWidget {
  const _ItemsGrid({
    required this.items,
    this.onItemTap,
  });

  final List<ProductItemData> items;
  final void Function(ProductItemData item)? onItemTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate columns based on available width
        // Minimum card width: 280, maximum: 350
        const minCardWidth = 280.0;
        const maxCardWidth = 350.0;
        const spacing = AppSpacing.md;

        final availableWidth = constraints.maxWidth;
        var columnCount = (availableWidth / minCardWidth).floor();
        columnCount = columnCount.clamp(1, 4);

        final cardWidth = (availableWidth - (spacing * (columnCount - 1))) / columnCount;
        final effectiveCardWidth = cardWidth.clamp(minCardWidth, maxCardWidth);

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: items.map((item) {
            return SizedBox(
              width: effectiveCardWidth,
              child: ProductItemCard(
                data: item,
                onTap: onItemTap != null ? () => onItemTap!(item) : null,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
