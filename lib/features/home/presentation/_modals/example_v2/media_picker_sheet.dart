import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/widgets/modals/index.dart';
import 'package:testcase_1/features/home/presentation/_modals/example_v2/sections/media_picker_content.dart';

/// Simple bottom sheet for media picking
///
/// Usage:
/// ```dart
/// final result = await MediaPickerSheet.show(context);
/// if (result == 'gallery') { ... }
/// ```
class MediaPickerSheet extends BaseBottomSheet<String> {
  const MediaPickerSheet({super.key});

  @override
  String? get title => 'Select Media';

  @override
  Widget buildContent(BuildContext context) {
    return MediaPickerContent(onSelect: (value) => close(context, value));
  }

  /// Show this sheet
  static Future<String?> show(BuildContext context) {
    return context.showSheet<String>(builder: (_) => const MediaPickerSheet());
  }
}
