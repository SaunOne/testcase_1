import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Square action button for weight row actions
class TallySquareButton extends StatelessWidget {
  const TallySquareButton({
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    this.onTap,
    this.size = 48,
    super.key,
  });

  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? context.colors.surfaceAlt,
      borderRadius: AppRadius.borderSm,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.borderSm,
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, color: iconColor ?? context.colors.textPrimary),
        ),
      ),
    );
  }
}
