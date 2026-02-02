import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Date field widget with calendar icon
class TallyDateField extends StatelessWidget {
  const TallyDateField({
    this.value,
    required this.placeholder,
    this.onTap,
    super.key,
  });

  final DateTime? value;
  final String placeholder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final displayText = value != null
        ? '${value!.day.toString().padLeft(2, '0')} / ${value!.month.toString().padLeft(2, '0')} / ${value!.year}'
        : placeholder;

    return Material(
      color: context.colors.surface,
      borderRadius: AppRadius.borderSm,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.borderSm,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.border),
            borderRadius: AppRadius.borderSm,
          ),
          child: Row(
            children: [
              Expanded(
                child: AppText.body(
                  displayText,
                  color: value != null
                      ? context.colors.textPrimary
                      : context.colors.textDisabled,
                ),
              ),
              Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: context.colors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
