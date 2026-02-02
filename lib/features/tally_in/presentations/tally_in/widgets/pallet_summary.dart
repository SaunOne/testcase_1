import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Summary widget for total weight & total pack
///
/// Displays:
/// - Total Weight (in kg)
/// - Total Pack (in pcs)
class PalletSummary extends StatelessWidget {
  const PalletSummary({
    required this.totalWeight,
    required this.totalPack,
    super.key,
  });

  final double totalWeight;
  final int totalPack;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 320),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.border),
        borderRadius: AppRadius.borderSm,
      ),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: _SummaryRow(
                label: 'Total Weight',
                value: _formatWeight(totalWeight),
                unit: 'kg',
              ),
            ),
            Container(height: 1, color: context.colors.border),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: _SummaryRow(
                label: 'Total Pack',
                value: totalPack.toString(),
                unit: 'pcs',
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatWeight(double weight) {
    // Format with thousand separator and 2 decimal places
    final parts = weight.toStringAsFixed(2).split('.');
    final intPart = parts[0];
    final decPart = parts[1];

    // Add thousand separator
    final buffer = StringBuffer();
    for (var i = 0; i < intPart.length; i++) {
      if (i > 0 && (intPart.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(intPart[i]);
    }

    return '${buffer.toString()}.$decPart';
  }
}

/// Row for displaying label + value + unit
class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    required this.unit,
  });

  final String label;
  final String value;
  final String unit;

  /// Minimum width for label to keep consistent spacing
  static const double _labelMinWidth = 140;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: _labelMinWidth),
          child: AppText.caption(label, color: context.colors.textSecondary),
        ),
        AppText.title(value, fontWeight: FontWeight.w700),
        const Spacer(),
        AppText.caption(
          fontSize: 10,
          unit,
          color: context.colors.textSecondary,
        ),
      ],
    );
  }
}
