import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// Back button widget for top bar
class TallyBackButton extends StatelessWidget {
  const TallyBackButton({this.onTap, super.key});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSpacing.widthSm,
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: AppRadius.borderSm,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: context.colors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
