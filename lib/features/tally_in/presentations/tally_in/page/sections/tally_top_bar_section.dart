import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/tally_in/data/models/tally_models.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/index.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/bloc/monitor/tally_monitor_bloc.dart';

/// Top bar section for Tally In page
/// Handles BLoC internally - no need for Connected wrapper
class TallyTopBarSection extends StatelessWidget {
  const TallyTopBarSection({required this.data, this.onBack, super.key});

  final TallyTopBarData data;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TallyMonitorBloc, TallyMonitorState, bool>(
      selector: (state) => state.isOffline,
      builder: (context, isOffline) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(color: context.colorScheme.primary, width: 8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 0,
              right: 16,
              top: 12,
              bottom: 12,
            ),
            child: Row(
              children: [
                // Left side: Back button + ASN info
                TallyBackButton(onTap: onBack),
                AppSpacing.widthMd,
                TallyAsnInfo(
                  data: TallyTopBarData(
                    asnNumber: data.asnNumber,
                    companyName: data.companyName,
                    vehicleNumber: data.vehicleNumber,
                    containerSeal: data.containerSeal,
                    isOffline: isOffline,
                  ),
                ),
                const Spacer(),
                // Right side: Action chips
                TallyTopBarActions(
                  isOffline: isOffline,
                  onOfflineModeToggle: () {
                    context.read<TallyMonitorBloc>().add(
                      TallyMonitorEvent.setOfflineMode(!isOffline),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
