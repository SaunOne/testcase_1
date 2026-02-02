import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/core/shared/widgets/modals/index.dart';

/// Fullscreen modal for creating a post
///
/// Usage:
/// ```dart
/// final result = await CreatePostModal.show(context);
/// if (result == 'saved') { ... }
/// ```
class CreatePostModal extends BaseFullscreenModal<String> {
  const CreatePostModal({super.key});

  @override
  String? get title => 'Create Post';

  @override
  List<Widget>? get actions => [
    Builder(
      builder: (context) => TextButton(
        onPressed: () => close(context, 'saved'),
        child: const Text('Save'),
      ),
    ),
    const SizedBox(width: 8),
  ];

  @override
  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create a new post',
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
              labelText: 'Content',
              border: OutlineInputBorder(),
            ),
            maxLines: 6,
          ),
          AppSpacing.heightMd,
          const TextField(
            decoration: InputDecoration(
              labelText: 'Tags',
              border: OutlineInputBorder(),
              hintText: 'Separate with commas',
            ),
          ),
        ],
      ),
    );
  }

  /// Show this fullscreen modal
  static Future<String?> show(BuildContext context) {
    return context.showFullscreenModal<String>(
      builder: (_) => const CreatePostModal(),
    );
  }
}
