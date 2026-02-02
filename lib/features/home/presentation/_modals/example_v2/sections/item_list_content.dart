import 'package:flutter/material.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Section content for item list in draggable sheet
class ItemListContent extends StatelessWidget {
  const ItemListContent({
    required this.scrollController,
    required this.itemCount,
    required this.onItemTap,
    super.key,
  });

  final ScrollController scrollController;
  final int itemCount;
  final void Function(int index) onItemTap;

  static const _colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: itemCount,
      itemBuilder: (context, index) => _buildItem(context, index),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final color = _colors[index % _colors.length];

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
        'This is a sample item with some description text.',
        style: TextStyle(color: context.colors.textSecondary, fontSize: 12),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: context.colors.textSecondary,
      ),
      contentPadding: EdgeInsets.zero,
      onTap: () => onItemTap(index),
    );
  }
}
