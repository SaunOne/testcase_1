import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/features/home/presentation/_modals/example_v2/widgets/confirm_buttons.dart';

/// Section content for confirmation modal
class ConfirmActionContent extends StatelessWidget {
  const ConfirmActionContent({
    required this.message,
    required this.onConfirm,
    required this.onCancel,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    this.isDestructive = false,
    super.key,
  });

  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String confirmText;
  final String cancelText;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(message),
        AppSpacing.heightLg,
        ConfirmButtons(
          onConfirm: onConfirm,
          onCancel: onCancel,
          confirmText: confirmText,
          cancelText: cancelText,
          isDestructive: isDestructive,
        ),
      ],
    );
  }
}
