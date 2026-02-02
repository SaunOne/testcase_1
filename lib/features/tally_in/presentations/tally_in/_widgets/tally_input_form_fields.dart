import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/tally_date_field.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/tally_dropdown_field.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/tally_form_field.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/bloc/input/tally_input_bloc.dart';

/// Form fields row for input panel (Condition, Prod Date, Exp Date)
class TallyInputFormFields extends StatelessWidget {
  const TallyInputFormFields({
    this.condition,
    this.prodDate,
    this.expDate,
    this.onConditionSelected,
    this.onProdDateTap,
    this.onExpDateTap,
    super.key,
  });

  final String? condition;
  final DateTime? prodDate;
  final DateTime? expDate;
  final void Function(String)? onConditionSelected;
  final VoidCallback? onProdDateTap;
  final VoidCallback? onExpDateTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TallyFormField(
            label: 'Condition',
            isRequired: true,
            child: TallyDropdownField(
              value: condition,
              placeholder: 'Select',
              items: TallyInputState.conditions,
              onItemSelected: onConditionSelected,
            ),
          ),
        ),
        AppSpacing.widthMd,
        Expanded(
          flex: 2,
          child: TallyFormField(
            label: 'Prod Date',
            isRequired: true,
            child: TallyDateField(
              value: prodDate,
              placeholder: '22 / 12 / 2025',
              onTap: onProdDateTap,
            ),
          ),
        ),
        AppSpacing.widthMd,
        Expanded(
          flex: 2,
          child: TallyFormField(
            label: 'Exp Date',
            isRequired: true,
            child: TallyDateField(
              value: expDate,
              placeholder: '22 / 12 / 2025',
              onTap: onExpDateTap,
            ),
          ),
        ),
      ],
    );
  }
}
