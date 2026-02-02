import 'package:flutter/material.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Header cell for row/column labels with background color
class TallyGridHeaderCell extends StatelessWidget {
  const TallyGridHeaderCell({
    required this.label,
    this.isRowLabel = false,
    super.key,
  });

  final String label;
  final bool isRowLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}
