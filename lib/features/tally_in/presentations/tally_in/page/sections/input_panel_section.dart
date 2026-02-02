import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/layout/app_card.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/index.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/bloc/input/tally_input_bloc.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/bloc/monitor/tally_monitor_bloc.dart';

/// Data input section with form fields and numpad
/// Handles BLoC internally - no need for Connected wrapper
class InputPanelSection extends StatelessWidget {
  const InputPanelSection({this.useFixedHeight = false, super.key});

  /// When true, uses fixed height for numpad (for scrollable layouts)
  final bool useFixedHeight;

  static const double _numpadFixedHeight = 280;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TallyMonitorBloc, TallyMonitorState>(
      buildWhen: (prev, curr) =>
          prev.activeItem?.isFinished != curr.activeItem?.isFinished ||
          prev.activePallet?.isComplete != curr.activePallet?.isComplete,
      builder: (context, monitorState) {
        final isItemFinished = monitorState.activeItem?.isFinished ?? false;
        final isPalletFull = monitorState.activePallet?.isComplete ?? false;
        final isDisabled = isItemFinished || isPalletFull;
        final disabledReason = isItemFinished
            ? 'Item is finished'
            : isPalletFull
            ? 'Pallet is full'
            : null;

        return BlocBuilder<TallyInputBloc, TallyInputState>(
          buildWhen: (prev, curr) =>
              prev.inputWeight != curr.inputWeight ||
              prev.condition != curr.condition ||
              prev.prodDate != curr.prodDate ||
              prev.expDate != curr.expDate,
          builder: (context, inputState) {
            return AppCard(
              padding: AppSpacing.paddingMd,
              child: Opacity(
                opacity: isDisabled ? 0.6 : 1.0,
                child: AbsorbPointer(
                  absorbing: isDisabled,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: useFixedHeight
                        ? MainAxisSize.min
                        : MainAxisSize.max,
                    children: [
                      // Disabled banner
                      if (isDisabled && disabledReason != null) ...[
                        _DisabledBanner(reason: disabledReason),
                        AppSpacing.heightMd,
                      ],

                      // Header
                      const TallyInputHeader(),
                      AppSpacing.heightMd,

                      // Form fields
                      TallyInputFormFields(
                        condition: inputState.condition,
                        prodDate: inputState.prodDate,
                        expDate: inputState.expDate,
                        onConditionSelected: (condition) {
                          context.read<TallyInputBloc>().add(
                            TallyInputEvent.setCondition(condition),
                          );
                        },
                        onProdDateTap: () =>
                            _showDatePicker(context, isProduction: true),
                        onExpDateTap: () =>
                            _showDatePicker(context, isProduction: false),
                      ),
                      AppSpacing.heightMd,

                      // Weight row
                      TallyWeightRow(
                        weight: inputState.inputWeight,
                        onDeleteTap: () {
                          context.read<TallyInputBloc>().add(
                            const TallyInputEvent.deleteLastChar(),
                          );
                        },
                        onClearTap: () {
                          context.read<TallyInputBloc>().add(
                            const TallyInputEvent.clearInput(),
                          );
                        },
                      ),
                      AppSpacing.heightMd,

                      // Numpad
                      if (useFixedHeight)
                        SizedBox(
                          height: _numpadFixedHeight,
                          child: TallyNumpad(
                            onNumpadTap: (key) {
                              context.read<TallyInputBloc>().add(
                                TallyInputEvent.numpadPressed(key),
                              );
                            },
                            onAddItem: () {
                              context.read<TallyInputBloc>().add(
                                const TallyInputEvent.submitInput(),
                              );
                            },
                            isDisabled: isDisabled,
                          ),
                        )
                      else
                        Expanded(
                          child: TallyNumpad(
                            onNumpadTap: (key) {
                              context.read<TallyInputBloc>().add(
                                TallyInputEvent.numpadPressed(key),
                              );
                            },
                            onAddItem: () {
                              context.read<TallyInputBloc>().add(
                                const TallyInputEvent.submitInput(),
                              );
                            },
                            isDisabled: isDisabled,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _showDatePicker(
    BuildContext context, {
    required bool isProduction,
  }) async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: isProduction ? DateTime(2020) : now,
      lastDate: isProduction ? now : DateTime(2030),
    );

    if (date != null && context.mounted) {
      if (isProduction) {
        context.read<TallyInputBloc>().add(TallyInputEvent.setProdDate(date));
      } else {
        context.read<TallyInputBloc>().add(TallyInputEvent.setExpDate(date));
      }
    }
  }
}

/// Disabled state banner
class _DisabledBanner extends StatelessWidget {
  const _DisabledBanner({required this.reason});

  final String reason;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.paddingSm,
      decoration: BoxDecoration(
        color: context.colors.warning.withValues(alpha: 0.1),
        borderRadius: AppRadius.borderSm,
        border: Border.all(color: context.colors.warning),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 16, color: context.colors.warning),
          AppSpacing.widthSm,
          AppText.caption(reason, color: context.colors.warning),
        ],
      ),
    );
  }
}
