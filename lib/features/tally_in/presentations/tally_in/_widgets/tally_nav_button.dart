import 'package:flutter/material.dart';

/// Navigation button for pallet prev/next
class TallyNavButton extends StatelessWidget {
  const TallyNavButton({
    required this.icon,
    required this.enabled,
    this.onPressed,
    super.key,
  });

  final IconData icon;
  final bool enabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: enabled ? const Color(0xFF607D8B) : Colors.grey[300],
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            size: 16,
            color: enabled ? Colors.white : Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
