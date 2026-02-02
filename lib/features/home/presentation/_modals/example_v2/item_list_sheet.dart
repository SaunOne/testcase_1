import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/widgets/modals/index.dart';
import 'package:testcase_1/features/home/presentation/_modals/example_v2/sections/item_list_content.dart';

/// Draggable bottom sheet with item list
///
/// Usage:
/// ```dart
/// final selectedItem = await ItemListSheet.show(context);
/// if (selectedItem != null) { ... }
/// ```
class ItemListSheet extends BaseDraggableSheet<String> {
  const ItemListSheet({
    required super.scrollController,
    this.itemCount = 50,
    super.key,
  });

  final int itemCount;

  @override
  String? get title => 'Select Item';

  @override
  Widget buildContent(BuildContext context) {
    return ItemListContent(
      scrollController: scrollController,
      itemCount: itemCount,
      onItemTap: (index) => close(context, 'item_$index'),
    );
  }

  /// Show this draggable sheet
  static Future<String?> show(
    BuildContext context, {
    int itemCount = 50,
    AppDraggableSheetConfig config = const AppDraggableSheetConfig(
      initialChildSize: 0.5,
      maxChildSize: 1.0,
      snap: true,
      snapSizes: [0.25, 0.5, 1.0],
    ),
  }) {
    return context.showDraggableSheet<String>(
      config: config,
      builder: (_, controller) =>
          ItemListSheet(scrollController: controller, itemCount: itemCount),
    );
  }
}
