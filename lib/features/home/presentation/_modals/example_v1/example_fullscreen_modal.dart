import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/core/shared/widgets/buttons/app_button.dart';
import 'package:testcase_1/core/shared/widgets/modals/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Example fullscreen modal
///
/// Usage:
/// ```dart
/// final result = await ExampleFullscreenModal.show(context);
/// ```
class ExampleFullscreenModal extends StatelessWidget {
  const ExampleFullscreenModal({super.key});

  /// Convenience method to show this fullscreen modal
  static Future<String?> show(BuildContext context) {
    return context.showFullscreenModal<String>(
      builder: (_) => const ExampleFullscreenModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppFullscreenModal(
      title: 'Fullscreen Modal',
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop('saved'),
          child: const Text('Save'),
        ),
        const SizedBox(width: 8),
      ],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This is a fullscreen modal example',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AppSpacing.heightMd,
            Text(
              'Fullscreen modals are useful for:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            AppSpacing.heightSm,
            _buildFeatureItem(context, 'Complex forms with many fields'),
            _buildFeatureItem(context, 'Content creation (posts, articles)'),
            _buildFeatureItem(context, 'Image/media editing'),
            _buildFeatureItem(context, 'Settings or preferences'),
            _buildFeatureItem(context, 'Detail views that need full screen'),
            AppSpacing.heightLg,
            // Example form
            Text(
              'Example Form',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AppSpacing.heightMd,
            const TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            AppSpacing.heightMd,
            const TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            AppSpacing.heightMd,
            const TextField(
              decoration: InputDecoration(
                labelText: 'Tags',
                border: OutlineInputBorder(),
                hintText: 'Separate with commas',
              ),
            ),
            AppSpacing.heightLg,
            AppButton(
              text: 'Submit',
              onPressed: () => Navigator.of(context).pop('submitted'),
            ),
            AppSpacing.heightMd,
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: context.colors.primary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
