import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Form field with label wrapper
class TallyFormField extends StatelessWidget {
  const TallyFormField({
    required this.label,
    required this.child,
    this.isRequired = false,
    super.key,
  });

  final String label;
  final Widget child;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            AppText.caption(label, color: context.colors.textSecondary),
            if (isRequired) AppText.caption(' *', color: AppPalette.errorRed),
          ],
        ),
        AppSpacing.heightXs,
        child,
      ],
    );
  }
}
