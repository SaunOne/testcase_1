import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.paddingLg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'home.title'.tr(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'home.subtitle'.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement filter with Query System
            },
            tooltip: 'home.filter'.tr(),
          ),
        ],
      ),
    );
  }
}
