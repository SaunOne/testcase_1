import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';

/// Reusable confirm/cancel button row for modals
class ConfirmButtons extends StatelessWidget {
  const ConfirmButtons({
    required this.onConfirm,
    required this.onCancel,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    this.isLoading = false,
    this.isDestructive = false,
    super.key,
  });

  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String confirmText;
  final String cancelText;
  final bool isLoading;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: isLoading ? null : onCancel,
          child: Text(cancelText),
        ),
        AppSpacing.widthSm,
        ElevatedButton(
          onPressed: isLoading ? null : onConfirm,
          style: isDestructive
              ? ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.error,
                  foregroundColor: colorScheme.onError,
                )
              : null,
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(confirmText),
        ),
      ],
    );
  }
}
