import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/widgets/modals/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Example bottom sheet modal
///
/// Usage:
/// ```dart
/// // Option 1: Using extension
/// final result = await context.showSheet<String>(
///   builder: (_) => const ExampleBottomSheet(),
/// );
///
/// // Option 2: Using static method on the modal itself
/// final result = await ExampleBottomSheet.show(context);
/// ```
class ExampleBottomSheet extends StatelessWidget {
  const ExampleBottomSheet({super.key});

  /// Convenience method to show this bottom sheet
  static Future<String?> show(BuildContext context) {
    return context.showSheet<String>(
      builder: (_) => const ExampleBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      title: 'Select Option',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildOption(
            context,
            icon: Icons.photo_library_rounded,
            title: 'Choose from Gallery',
            subtitle: 'Select an existing photo',
            value: 'gallery',
          ),
          _buildOption(
            context,
            icon: Icons.camera_alt_rounded,
            title: 'Take Photo',
            subtitle: 'Use camera to take new photo',
            value: 'camera',
          ),
          _buildOption(
            context,
            icon: Icons.insert_drive_file_rounded,
            title: 'Choose File',
            subtitle: 'Select a document',
            value: 'file',
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String value,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: context.colors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: context.colors.primary),
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: context.colors.textSecondary, fontSize: 12),
      ),
      contentPadding: EdgeInsets.zero,
      onTap: () => context.closeModal(value),
    );
  }
}
