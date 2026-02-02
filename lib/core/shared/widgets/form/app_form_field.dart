import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// AppFormField - Wrapper for form fields with label, error, and helper text
///
/// Usage:
/// ```dart
/// AppFormField(
///   label: 'Email',
///   helperText: 'We will never share your email',
///   child: TextField(),
/// )
///
/// AppFormField(
///   label: 'Password',
///   isRequired: true,
///   errorText: 'Password is required',
///   child: TextField(obscureText: true),
/// )
/// ```
class AppFormField extends StatelessWidget {
  const AppFormField({
    required this.child,
    super.key,
    this.label,
    this.labelWidget,
    this.helperText,
    this.errorText,
    this.isRequired = false,
    this.spacing,
  });

  final Widget child;
  final String? label;
  final Widget? labelWidget;
  final String? helperText;
  final String? errorText;
  final bool isRequired;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectiveSpacing = spacing ?? AppSpacing.xs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null || labelWidget != null)
          Padding(
            padding: EdgeInsets.only(bottom: effectiveSpacing),
            child:
                labelWidget ??
                Row(
                  children: [
                    Text(
                      label!,
                      style: AppTypography.inputLabel.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                    if (isRequired)
                      Text(
                        ' *',
                        style: AppTypography.inputLabel.copyWith(
                          color: colors.error,
                        ),
                      ),
                  ],
                ),
          ),
        child,
        if (errorText != null || helperText != null)
          Padding(
            padding: EdgeInsets.only(top: effectiveSpacing),
            child: Text(
              errorText ?? helperText!,
              style: AppTypography.inputHelper.copyWith(
                color: errorText != null ? colors.error : colors.textSecondary,
              ),
            ),
          ),
      ],
    );
  }
}
