import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Numpad widget for weight input
class TallyNumpad extends StatelessWidget {
  const TallyNumpad({
    this.onNumpadTap,
    this.onAddItem,
    this.isDisabled = false,
    super.key,
  });

  final void Function(String value)? onNumpadTap;
  final VoidCallback? onAddItem;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1: 7, 8, 9
        Expanded(child: _NumpadRow(keys: ['7', '8', '9'], onTap: onNumpadTap)),
        AppSpacing.heightSm,
        // Row 2: 4, 5, 6
        Expanded(child: _NumpadRow(keys: ['4', '5', '6'], onTap: onNumpadTap)),
        AppSpacing.heightSm,
        // Row 3: 1, 2, 3
        Expanded(child: _NumpadRow(keys: ['1', '2', '3'], onTap: onNumpadTap)),
        AppSpacing.heightSm,
        // Row 4: 0, ., Add Item
        Expanded(
          child: Row(
            children: [
              Expanded(child: _NumpadKey(value: '0', onTap: onNumpadTap)),
              AppSpacing.widthSm,
              Expanded(child: _NumpadKey(value: '.', onTap: onNumpadTap)),
              AppSpacing.widthSm,
              Expanded(child: _AddItemButton(onTap: onAddItem)),
            ],
          ),
        ),
      ],
    );
  }
}

/// Numpad row
class _NumpadRow extends StatelessWidget {
  const _NumpadRow({required this.keys, this.onTap});

  final List<String> keys;
  final void Function(String value)? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < keys.length; i++) ...[
          Expanded(child: _NumpadKey(value: keys[i], onTap: onTap)),
          if (i < keys.length - 1) AppSpacing.widthSm,
        ],
      ],
    );
  }
}

/// Individual numpad key
class _NumpadKey extends StatelessWidget {
  const _NumpadKey({required this.value, this.onTap});

  final String value;
  final void Function(String value)? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.surfaceAlt,
      borderRadius: AppRadius.borderSm,
      child: InkWell(
        onTap: onTap != null ? () => onTap!(value) : null,
        borderRadius: AppRadius.borderSm,
        child: Center(child: AppText.h2(value, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

/// Add item button
class _AddItemButton extends StatelessWidget {
  const _AddItemButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppPalette.earthGreen,
      borderRadius: AppRadius.borderSm,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.borderSm,
        child: Center(
          child: AppText.button('Add Item', color: AppPalette.white),
        ),
      ),
    );
  }
}
