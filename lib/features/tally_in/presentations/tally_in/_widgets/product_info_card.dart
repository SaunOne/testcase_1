import 'package:flutter/material.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Product name and batch code section
class ProductInfoCard extends StatelessWidget {
  const ProductInfoCard({
    required this.productName,
    required this.batchCode,
    super.key,
  });

  final String productName;
  final String batchCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product name (bold, can wrap to 2 lines)
        Text(
          productName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: context.colors.textPrimary,
            height: 1.3,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        // Batch code
        Text(
          batchCode,
          style: TextStyle(
            fontSize: 14,
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
