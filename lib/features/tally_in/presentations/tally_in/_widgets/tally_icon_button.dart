import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Small icon button for header actions
class TallyIconButton extends StatelessWidget {
  const TallyIconButton({
    required this.icon,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    super.key,
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
