import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';

enum AppButtonType { primary, secondary, text }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final bool isLoading;
  final bool isExpanded;
  final IconData? icon;

  const AppButton({
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.isLoading = false,
    this.isExpanded = true,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final child = isLoading
        ? const SizedBox(
            height: AppSizes.iconMd,
            width: AppSizes.iconMd,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: AppSizes.iconMd),
              AppSpacing.widthSm,
              Text(text),
            ],
          )
        : Text(text);

    final button = switch (type) {
      AppButtonType.primary => ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: child,
      ),
      AppButtonType.secondary => OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        child: child,
      ),
      AppButtonType.text => TextButton(
        onPressed: isLoading ? null : onPressed,
        child: child,
      ),
    };

    return isExpanded
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}
