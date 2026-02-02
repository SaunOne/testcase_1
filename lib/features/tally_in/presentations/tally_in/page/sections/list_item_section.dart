import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/layout/app_card.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/features/tally_in/data/models/tally_models.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/index.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/bloc/list/tally_list_bloc.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/bloc/monitor/tally_monitor_bloc.dart';

/// Section widget for displaying list of product items
/// Pure presentation - receives data from BLoC via wrapper
class ListItemSection extends StatelessWidget {
  const ListItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TallyListBloc, TallyListState>(
      builder: (context, listState) {
        return BlocBuilder<TallyMonitorBloc, TallyMonitorState>(
          builder: (context, monitorState) {
            return AppCard(
              padding: AppSpacing.paddingMd,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with summary and actions
                  _ListHeader(
                    currentPallets: listState.currentPallets,
                    totalPallets: listState.totalPallets,
                    totalItems: listState.totalItems,
                    canNavigatePrev: monitorState.canNavigatePrevPallet,
                    canNavigateNext: monitorState.canNavigateNextPallet,
                  ),
                  AppSpacing.heightMd,
                  // Items grid
                  Expanded(
                    child: _ItemsGrid(
                      items: listState.itemList,
                      activeItemId: listState.activeItemId,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

/// Header with title, summary badges, and action buttons
class _ListHeader extends StatelessWidget {
  const _ListHeader({
    required this.currentPallets,
    required this.totalPallets,
    required this.totalItems,
    required this.canNavigatePrev,
    required this.canNavigateNext,
  });

  final int currentPallets;
  final int totalPallets;
  final int totalItems;
  final bool canNavigatePrev;
  final bool canNavigateNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Title
        AppText.h2('Items', fontWeight: FontWeight.w700),
        const Spacer(),
        // Pallet navigation buttons
        TallyNavButton(
          icon: Icons.chevron_left,
          enabled: canNavigatePrev,
          onPressed: () {
            context.read<TallyMonitorBloc>().add(
              const TallyMonitorEvent.prevPallet(),
            );
          },
        ),
        AppSpacing.widthXs,
        // Pallet count badge
        TallySummaryButton(
          icon: Icons.inventory_2_outlined,
          label: '$currentPallets / $totalPallets Pallets',
        ),
        AppSpacing.widthXs,
        TallyNavButton(
          icon: Icons.chevron_right,
          enabled: canNavigateNext,
          onPressed: () {
            context.read<TallyMonitorBloc>().add(
              const TallyMonitorEvent.nextPallet(),
            );
          },
        ),
        AppSpacing.widthSm,
        // Items count badge
        TallySummaryButton(
          icon: Icons.checklist_outlined,
          label: '$totalItems Items',
        ),
        AppSpacing.widthSm,
        // Add pallet button
        TallyActionButton(
          label: '+ Add More Pallet',
          variant: TallyButtonVariant.primary,
          borderRadius: AppRadius.borderSm,
          onPressed: () {
            context.read<TallyMonitorBloc>().add(
              const TallyMonitorEvent.addPallet(),
            );
          },
        ),
      ],
    );
  }
}

/// Grid of product item cards
class _ItemsGrid extends StatelessWidget {
  const _ItemsGrid({required this.items, this.activeItemId});

  final List<TallyItem> items;
  final String? activeItemId;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('No items'));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        const minCardWidth = 240.0;
        const maxCardWidth = 340.0;
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
                  onTap: () {
                    context.read<TallyListBloc>().add(
                      TallyListEvent.selectItem(item.id),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
