import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Dropdown field widget using PopupMenuButton for inline dropdown
class TallyDropdownField extends StatelessWidget {
  const TallyDropdownField({
    this.value,
    required this.placeholder,
    this.items = const [],
    this.onItemSelected,
    super.key,
  });

  final String? value;
  final String placeholder;
  final List<String> items;
  final void Function(String)? onItemSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onItemSelected,
      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.borderSm),
      itemBuilder: (context) => items
          .map((item) => PopupMenuItem<String>(value: item, child: Text(item)))
          .toList(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: context.colors.surface,
          border: Border.all(color: context.colors.border),
          borderRadius: AppRadius.borderSm,
        ),
        child: Row(
          children: [
            Expanded(
              child: AppText.body(
                value ?? placeholder,
                color: value != null
                    ? context.colors.textPrimary
                    : context.colors.textDisabled,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 18,
              color: context.colors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
