import 'package:flutter/material.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Reusable option card widget for modal selections
class OptionCard extends StatelessWidget {
  const OptionCard({
    required this.icon,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.iconColor,
    this.trailing,
    super.key,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Color? iconColor;
  final Widget? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ?? context.colors.primary;

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: effectiveIconColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: effectiveIconColor),
      ),
      title: Text(title),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(
                color: context.colors.textSecondary,
                fontSize: 12,
              ),
            )
          : null,
      trailing:
          trailing ??
          Icon(
            Icons.chevron_right_rounded,
            color: context.colors.textSecondary,
          ),
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
    );
  }
}
