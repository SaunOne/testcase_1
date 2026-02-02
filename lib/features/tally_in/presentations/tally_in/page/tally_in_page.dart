import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase_1/features/tally_in/data/models/tally_models.dart';
import 'package:testcase_1/features/tally_in/data/tally_dummy.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/bloc/input/tally_input_bloc.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/bloc/list/tally_list_bloc.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/bloc/monitor/tally_monitor_bloc.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/page/sections/input_panel_section.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/page/sections/list_item_section.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/page/sections/pallet_monitor_section.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/page/sections/tally_top_bar_section.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/page/tally_in_layout.dart';

/// Tally In Page
///
/// Provides:
/// - MultiBlocProvider for TallyInputBloc, TallyMonitorBloc, TallyListBloc
/// - MultiBlocListener for inter-bloc communication
/// - Clean layout with sections handling their own BlocBuilder
class TallyInPage extends StatelessWidget {
  const TallyInPage({super.key});
  static const routeName = '/tally_in';

  @override
  Widget build(BuildContext context) {
    final dummyItems = generateDummyTallyData();
    final dummyTopBar = generateDummyTopBarData();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TallyInputBloc()),
        BlocProvider(
          create: (_) =>
              TallyMonitorBloc()..add(TallyMonitorEvent.started(dummyItems)),
        ),
        BlocProvider(
          create: (_) =>
              TallyListBloc()..add(TallyListEvent.started(dummyItems)),
        ),
      ],
      child: _TallyInView(topBarData: dummyTopBar),
    );
  }
}

class _TallyInView extends StatelessWidget {
  const _TallyInView({required this.topBarData});

  final TallyTopBarData topBarData;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // Input -> Monitor: add weight on success
        BlocListener<TallyInputBloc, TallyInputState>(
          listenWhen: (p, c) =>
              p.status != c.status && c.status == InputStatus.success,
          listener: (context, state) {
            if (state.payload != null) {
              context.read<TallyMonitorBloc>().add(
                TallyMonitorEvent.addWeight(state.payload!),
              );
              context.read<TallyInputBloc>().add(
                const TallyInputEvent.resetStatus(),
              );
            }
          },
        ),
        // Monitor -> List: sync items
        BlocListener<TallyMonitorBloc, TallyMonitorState>(
          listenWhen: (p, c) => p.items != c.items,
          listener: (context, state) {
            context.read<TallyListBloc>().add(
              TallyListEvent.updateItems(state.items),
            );
          },
        ),
        // List -> Monitor: sync active item
        BlocListener<TallyListBloc, TallyListState>(
          listenWhen: (p, c) => p.activeItemId != c.activeItemId,
          listener: (context, state) {
            if (state.activeItemId != null) {
              context.read<TallyMonitorBloc>().add(
                TallyMonitorEvent.selectItem(state.activeItemId!),
              );
            }
          },
        ),
        // Input error snackbar
        BlocListener<TallyInputBloc, TallyInputState>(
          listenWhen: (p, c) =>
              p.status != c.status && c.status == InputStatus.invalid,
          listener: (context, state) {
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
      ],
      child: TallyInLayout(
        topBar: TallyTopBarSection(data: topBarData),
        palletMonitor: const PalletMonitorSection(),
        itemList: const ListItemSection(),
        inputPanel: const InputPanelSection(),
      ),
    );
  }
}
