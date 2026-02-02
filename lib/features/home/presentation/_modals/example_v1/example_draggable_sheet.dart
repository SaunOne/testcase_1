import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/widgets/modals/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Example draggable bottom sheet with lots of content
///
/// This demonstrates a bottom sheet that:
/// - Starts at 50% height
/// - Can be dragged up to 95% (almost fullscreen)
/// - Can be dragged down to 25% minimum
/// - Expands when scrolling through content
///
/// Usage:
/// ```dart
/// final result = await ExampleDraggableSheet.show(context);
/// ```

class ExampleDraggableSheet extends StatelessWidget {
  const ExampleDraggableSheet({required this.scrollController, super.key});

  final ScrollController scrollController;

  /// Convenience method to show this draggable sheet
  static Future<String?> show(
    BuildContext context, {
    AppDraggableSheetConfig config = const AppDraggableSheetConfig(
      maxChildSize: 1, // Full screen when scrolled up
      snap: true,
      snapSizes: [0.25, 0.5, 1.0],
    ),
  }) {
    return context.showDraggableSheet<String>(
      config: config,
      builder: (_, scrollController) =>
          ExampleDraggableSheet(scrollController: scrollController),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppDraggableBottomSheet(
      scrollController: scrollController,
      title: 'Draggable Sheet',
      child: ListView.builder(
        controller: scrollController,
        itemCount: 50,
        itemBuilder: (context, index) => _buildItem(context, index),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
    ];
    final color = colors[index % colors.length];

    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(Icons.article_rounded, color: color),
      ),
      title: Text('Item ${index + 1}'),
      subtitle: Text(
        'This is a sample item with some description text to make it more realistic.',
        style: TextStyle(color: context.colors.textSecondary, fontSize: 12),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: context.colors.textSecondary,
      ),
      contentPadding: EdgeInsets.zero,
      onTap: () => Navigator.of(context).pop('item_$index'),
    );
  }
}
