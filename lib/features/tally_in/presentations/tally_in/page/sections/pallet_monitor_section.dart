import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/layout/app_card.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/bloc/monitor/tally_monitor_bloc.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/index.dart';

/// Pallet monitor section - displays pallet grid with header and summary
/// Handles BLoC internally - no need for Connected wrapper
class PalletMonitorSection extends StatelessWidget {
  const PalletMonitorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TallyMonitorBloc, TallyMonitorState>(
      buildWhen: (prev, curr) =>
          prev.activePallet != curr.activePallet ||
          prev.activeItem != curr.activeItem ||
          prev.selectedCellId != curr.selectedCellId ||
          prev.nextCellPosition != curr.nextCellPosition,
      builder: (context, state) {
        final pallet = state.activePallet;
        final item = state.activeItem;

        if (pallet == null || item == null) {
          return const Center(child: Text('No pallet selected'));
        }

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
                // Grid
                Expanded(
                  child: TallyGrid(
                    cells: pallet.cells,
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
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
