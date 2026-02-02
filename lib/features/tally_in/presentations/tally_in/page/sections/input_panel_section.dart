import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/layout/app_card.dart';
import 'package:testcase_1/core/shared/widgets/text/app_text.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/_widgets/tally_action_button.dart';

/// Data model for data input form
class DataInputFormData {
  const DataInputFormData({
    this.condition,
    this.prodDate,
    this.expDate,
    this.weight = '',
  });

  final String? condition;
  final DateTime? prodDate;
  final DateTime? expDate;
  final String weight;

  DataInputFormData copyWith({
    String? condition,
    DateTime? prodDate,
    DateTime? expDate,
    String? weight,
  }) {
    return DataInputFormData(
      condition: condition ?? this.condition,
      prodDate: prodDate ?? this.prodDate,
      expDate: expDate ?? this.expDate,
      weight: weight ?? this.weight,
    );
  }
}

/// Data input section with form fields and numpad
///
/// Contains:
/// - Header with title and settings
/// - Form fields (Condition, Prod Date, Exp Date)
/// - Weight display
/// - Numpad
/// - Add Item button
class InputPanelSection extends StatelessWidget {
  const InputPanelSection({
    required this.formData,
    this.onDecimalSettingTap,
    this.onEditTap,
    this.onSaveTap,
    this.onConditionTap,
    this.onProdDateTap,
    this.onExpDateTap,
    this.onNumpadTap,
    this.onLockTap,
    this.onDeleteTap,
    this.onClearTap,
    this.onAddItem,
    this.useFixedHeight = false,
    super.key,
  });

  final DataInputFormData formData;
  final VoidCallback? onDecimalSettingTap;
  final VoidCallback? onEditTap;
  final VoidCallback? onSaveTap;
  final VoidCallback? onConditionTap;
  final VoidCallback? onProdDateTap;
  final VoidCallback? onExpDateTap;
  final void Function(String value)? onNumpadTap;
  final VoidCallback? onLockTap;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onClearTap;
  final VoidCallback? onAddItem;

  /// When true, uses fixed height for numpad (for use in scrollable layouts)
  final bool useFixedHeight;

  /// Fixed height for numpad section when useFixedHeight is true
  static const double _numpadFixedHeight = 280;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: AppSpacing.paddingMd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: useFixedHeight ? MainAxisSize.min : MainAxisSize.max,
        children: [
          // Header
          _Header(
            onDecimalSettingTap: onDecimalSettingTap,
            onEditTap: onEditTap,
            onSaveTap: onSaveTap,
          ),
          AppSpacing.heightMd,

          // Form fields
          _FormFields(
            formData: formData,
            onConditionTap: onConditionTap,
            onProdDateTap: onProdDateTap,
            onExpDateTap: onExpDateTap,
          ),
          AppSpacing.heightMd,

          // Weight display and action buttons
          _WeightRow(
            weight: formData.weight,
            onLockTap: onLockTap,
            onDeleteTap: onDeleteTap,
            onClearTap: onClearTap,
          ),
          AppSpacing.heightMd,

          // Numpad - use fixed height when in scrollable context
          if (useFixedHeight)
            SizedBox(
              height: _numpadFixedHeight,
              child: _Numpad(onNumpadTap: onNumpadTap, onAddItem: onAddItem),
            )
          else
            Expanded(
              child: _Numpad(onNumpadTap: onNumpadTap, onAddItem: onAddItem),
            ),
        ],
      ),
    );
  }
}

/// Header with title and action buttons
class _Header extends StatelessWidget {
  const _Header({this.onDecimalSettingTap, this.onEditTap, this.onSaveTap});

  final VoidCallback? onDecimalSettingTap;
  final VoidCallback? onEditTap;
  final VoidCallback? onSaveTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText.h2('Data Input', fontWeight: FontWeight.w700),
        const Spacer(),
        // Decimal Setting button
        TallyActionButton(
          label: 'Decimal Setting',
          icon: Icons.settings,
          variant: TallyButtonVariant.primary,
          onPressed: onDecimalSettingTap,
        ),
        AppSpacing.widthSm,
        // Edit button
        _IconButton(icon: Icons.edit_outlined, onTap: onEditTap),
        AppSpacing.widthSm,
        // Save button
        _IconButton(
          icon: Icons.save_outlined,
          backgroundColor: AppPalette.warningOrange,
          iconColor: AppPalette.white,
          onTap: onSaveTap,
        ),
      ],
    );
  }
}

/// Small icon button
class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.icon,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? context.colors.surfaceAlt;
    final icColor = iconColor ?? context.colors.textPrimary;

    return Material(
      color: bgColor,
      borderRadius: AppRadius.borderSm,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.borderSm,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, size: 18, color: icColor),
        ),
      ),
    );
  }
}

/// Form fields row
class _FormFields extends StatelessWidget {
  const _FormFields({
    required this.formData,
    this.onConditionTap,
    this.onProdDateTap,
    this.onExpDateTap,
  });

  final DataInputFormData formData;
  final VoidCallback? onConditionTap;
  final VoidCallback? onProdDateTap;
  final VoidCallback? onExpDateTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Condition dropdown
        Expanded(
          flex: 2,
          child: _FormField(
            label: 'Condition',
            isRequired: true,
            child: _DropdownField(
              value: formData.condition,
              placeholder: 'Select',
              onTap: onConditionTap,
            ),
          ),
        ),
        AppSpacing.widthMd,
        // Prod Date
        Expanded(
          flex: 2,
          child: _FormField(
            label: 'Prod Date',
            isRequired: true,
            child: _DateField(
              value: formData.prodDate,
              placeholder: '22 / 12 / 2025',
              onTap: onProdDateTap,
            ),
          ),
        ),
        AppSpacing.widthMd,
        // Exp Date
        Expanded(
          flex: 2,
          child: _FormField(
            label: 'Exp Date',
            isRequired: true,
            child: _DateField(
              value: formData.expDate,
              placeholder: '22 / 12 / 2025',
              onTap: onExpDateTap,
            ),
          ),
        ),
      ],
    );
  }
}

/// Form field with label
class _FormField extends StatelessWidget {
  const _FormField({
    required this.label,
    required this.child,
    this.isRequired = false,
  });

  final String label;
  final Widget child;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            AppText.caption(label, color: context.colors.textSecondary),
            if (isRequired) AppText.caption(' *', color: AppPalette.errorRed),
          ],
        ),
        AppSpacing.heightXs,
        child,
      ],
    );
  }
}

/// Dropdown field widget
class _DropdownField extends StatelessWidget {
  const _DropdownField({this.value, required this.placeholder, this.onTap});

  final String? value;
  final String placeholder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.surface,
      borderRadius: AppRadius.borderSm,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.borderSm,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.border),
            borderRadius: AppRadius.borderSm,
          ),
          child: Row(
            children: [
              Expanded(
                child: AppText.body(
                  value ?? placeholder,
                  color: value != null
                      ? context.colors.textPrimary
                      : context.colors.textDisabled,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: context.colors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Date field widget
class _DateField extends StatelessWidget {
  const _DateField({this.value, required this.placeholder, this.onTap});

  final DateTime? value;
  final String placeholder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final displayText = value != null
        ? '${value!.day.toString().padLeft(2, '0')} / ${value!.month.toString().padLeft(2, '0')} / ${value!.year}'
        : placeholder;

    return Material(
      color: context.colors.surface,
      borderRadius: AppRadius.borderSm,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.borderSm,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.border),
            borderRadius: AppRadius.borderSm,
          ),
          child: Row(
            children: [
              Expanded(
                child: AppText.body(
                  displayText,
                  color: value != null
                      ? context.colors.textPrimary
                      : context.colors.textDisabled,
                ),
              ),
              Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: context.colors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Weight display row with action buttons
class _WeightRow extends StatelessWidget {
  const _WeightRow({
    required this.weight,
    this.onLockTap,
    this.onDeleteTap,
    this.onClearTap,
  });

  final String weight;
  final VoidCallback? onLockTap;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onClearTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Weight display
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: context.colors.border),
              borderRadius: AppRadius.borderSm,
            ),
            child: Row(
              children: [
                AppText.caption(
                  'Weight (kg)',
                  color: context.colors.textSecondary,
                ),
                const Spacer(),
                AppText.h1(
                  weight.isEmpty ? '0' : weight,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ),
        AppSpacing.widthSm,
        // Lock button
        _ActionButton(
          icon: Icons.lock_outline,
          backgroundColor: context.colors.surfaceAlt,
          onTap: onLockTap,
        ),
        AppSpacing.widthSm,
        // Delete button
        _ActionButton(
          icon: Icons.delete_outline,
          backgroundColor: AppPalette.warningOrange,
          iconColor: AppPalette.white,
          onTap: onDeleteTap,
        ),
        AppSpacing.widthSm,
        // Clear button
        _ActionButton(
          icon: Icons.close,
          backgroundColor: AppPalette.errorRed,
          iconColor: AppPalette.white,
          onTap: onClearTap,
        ),
      ],
    );
  }
}

/// Square action button
class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    this.onTap,
  });

  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? context.colors.surfaceAlt,
      borderRadius: AppRadius.borderSm,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.borderSm,
        child: SizedBox(
          width: 48,
          height: 48,
          child: Icon(icon, color: iconColor ?? context.colors.textPrimary),
        ),
      ),
    );
  }
}

/// Numpad widget
class _Numpad extends StatelessWidget {
  const _Numpad({this.onNumpadTap, this.onAddItem});

  final void Function(String value)? onNumpadTap;
  final VoidCallback? onAddItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1: 7, 8, 9
        Expanded(
          child: _NumpadRow(keys: ['7', '8', '9'], onTap: onNumpadTap),
        ),
        AppSpacing.heightSm,
        // Row 2: 4, 5, 6
        Expanded(
          child: _NumpadRow(keys: ['4', '5', '6'], onTap: onNumpadTap),
        ),
        AppSpacing.heightSm,
        // Row 3: 1, 2, 3
        Expanded(
          child: _NumpadRow(keys: ['1', '2', '3'], onTap: onNumpadTap),
        ),
        AppSpacing.heightSm,
        // Row 4: 0, ., Add Item
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: _NumpadKey(value: '0', onTap: onNumpadTap),
              ),
              AppSpacing.widthSm,
              Expanded(
                child: _NumpadKey(value: '.', onTap: onNumpadTap),
              ),
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
          Expanded(
            child: _NumpadKey(value: keys[i], onTap: onTap),
          ),
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
