import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/layout/app_card.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/features/tally_in/data/models/tally_models.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/index.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/bloc/list/tally_list_bloc.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/bloc/monitor/tally_monitor_bloc.dart';

/// Connected widget - manages BlocBuilder internally
class ListItemSectionConnected extends StatelessWidget {
  const ListItemSectionConnected({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TallyListBloc, TallyListState>(
      buildWhen: (prev, curr) =>
          prev.items != curr.items || prev.activeItemId != curr.activeItemId,
      builder: (context, state) {
        return ListItemSection(
          items: state.itemList,
          activeItemId: state.activeItemId,
          summaryData: ListSummaryData(
            currentPallets: state.currentPallets,
            totalPallets: state.totalPallets,
            totalItems: state.totalItems,
          ),
          onItemTap: (itemId) {
            context.read<TallyListBloc>().add(
              TallyListEvent.selectItem(itemId),
            );
          },
          onPalletChange: (String palletId) {
            // Dispatch to monitor bloc to change active pallet
            context.read<TallyMonitorBloc>().add(
              TallyMonitorEvent.selectPallet(palletId),
            );
          },
          onAddPallet: () {
            // Add new pallet to the active item
            context.read<TallyMonitorBloc>().add(
              const TallyMonitorEvent.addPallet(),
            );
          },
        );
      },
    );
  }
}

/// Summary data for list header
class ListSummaryData {
  const ListSummaryData({
    required this.currentPallets,
    required this.totalPallets,
    required this.totalItems,
  });

  final int currentPallets;
  final int totalPallets;
  final int totalItems;
}

/// Section widget for displaying list of product items
///
/// Contains:
/// - Header with title, summary badges, and add button
/// - Grid of product item cards
class ListItemSection extends StatelessWidget {
  const ListItemSection({
    required this.items,
    required this.summaryData,
    this.activeItemId,
    this.onItemTap,
    this.onAddPallet,
    this.onPalletChange,
    super.key,
  });

  /// List of tally items to display
  final List<TallyItem> items;

  /// Currently active item ID
  final String? activeItemId;

  /// Summary data for header badges
  final ListSummaryData summaryData;

  /// Callback when an item is tapped
  final void Function(String itemId)? onItemTap;

  /// Callback when add pallet button is pressed
  final VoidCallback? onAddPallet;

  /// Callback when pallet is changed from item card
  final void Function(String palletId)? onPalletChange;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: AppSpacing.paddingMd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _ListHeader(summaryData: summaryData, onAddPallet: onAddPallet),
          AppSpacing.heightMd,
          // Items grid
          Expanded(
            child: _ItemsGrid(
              items: items,
              activeItemId: activeItemId,
              onItemTap: onItemTap,
              onPalletChange: onPalletChange,
            ),
          ),
        ],
      ),
    );
  }
}

/// Header with title, summary badges, and add button
class _ListHeader extends StatelessWidget {
  const _ListHeader({required this.summaryData, this.onAddPallet});

  final ListSummaryData summaryData;
  final VoidCallback? onAddPallet;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Title
        AppText.h2('Items', fontWeight: FontWeight.w700),
        const Spacer(),
        // Summary badges - pill-shaped dark navy buttons
        TallySummaryBadge(
          icon: Icons.inventory_2_outlined,
          currentValue: summaryData.currentPallets,
          totalValue: summaryData.totalPallets,
          label: 'Pallets',
        ),
        AppSpacing.widthSm,
        TallySummaryBadge(
          icon: Icons.checklist_outlined,
          totalValue: summaryData.totalItems,
          label: 'Items',
        ),
        AppSpacing.widthSm,
        // Add pallet button - rectangular rounded
        TallyActionButton(
          label: '+ Add More Pallet',
          variant: TallyButtonVariant.primary,
          borderRadius: AppRadius.borderSm,
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
    this.activeItemId,
    this.onItemTap,
    this.onPalletChange,
  });

  final List<TallyItem> items;
  final String? activeItemId;
  final void Function(String itemId)? onItemTap;
  final void Function(String palletId)? onPalletChange;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('No items'));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        const minCardWidth = 260.0;
        const maxCardWidth = 350.0;
        const spacing = AppSpacing.md;

        final availableWidth = constraints.maxWidth;
        var columnCount = (availableWidth / minCardWidth).floor();
        columnCount = columnCount.clamp(1, 4);

        final cardWidth =
            (availableWidth - (spacing * (columnCount - 1))) / columnCount;
        final effectiveCardWidth = cardWidth.clamp(minCardWidth, maxCardWidth);

        return SingleChildScrollView(
          child: Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: items.map((item) {
              final isSelected = item.id == activeItemId;
              return SizedBox(
                width: effectiveCardWidth,
                child: TallyItemCard(
                  item: item,
                  isSelected: isSelected,
                  onTap: () => onItemTap?.call(item.id),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
