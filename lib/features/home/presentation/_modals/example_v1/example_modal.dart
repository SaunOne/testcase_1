import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/core/shared/widgets/buttons/app_button.dart';
import 'package:testcase_1/core/shared/widgets/modals/index.dart';

/// Example center dialog modal
///
/// Usage:
/// ```dart
/// // Option 1: Using extension
/// final result = await context.showModal<bool>(
///   builder: (_) => const ExampleModal(),
/// );
///
/// // Option 2: Using static method on the modal itself
/// final result = await ExampleModal.show(context);
/// ```
class ExampleModal extends StatelessWidget {
  const ExampleModal({super.key});

  /// Convenience method to show this modal
  static Future<bool?> show(BuildContext context) {
    return context.showModal<bool>(builder: (_) => const ExampleModal());
  }

  @override
  Widget build(BuildContext context) {
    return AppModal(
      title: 'Example Modal',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'This is an example center dialog modal. '
            'You can put any content here.',
          ),
          AppSpacing.heightLg,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => context.closeModal(false),
                child: const Text('Cancel'),
              ),
              AppSpacing.widthSm,
              AppButton(
                onPressed: () => context.closeModal(true),
                text: 'Confirm',
                isExpanded: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
