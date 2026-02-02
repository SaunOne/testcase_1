import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/features/home/data/entities/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({required this.post, required this.onTap, super.key});

  final Post post;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: AppSpacing.paddingMd,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _CategoryBadge(category: post.category),
                  const Spacer(),
                  if (post.isRecent) const _RecentBadge(),
                ],
              ),
              AppSpacing.heightSm,
              Text(post.title, style: Theme.of(context).textTheme.titleMedium),
              AppSpacing.heightXs,
              Text(post.excerpt, style: Theme.of(context).textTheme.bodyMedium),
              AppSpacing.heightSm,
              Text(
                post.author,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge({required this.category});
  final PostCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getCategoryColor(context).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'home.category.${category.name}'.tr(),
        style: Theme.of(
          context,
        ).textTheme.labelSmall?.copyWith(color: _getCategoryColor(context)),
      ),
    );
  }

  Color _getCategoryColor(BuildContext context) {
    switch (category) {
      case PostCategory.technology:
        return Colors.blue;
      case PostCategory.lifestyle:
        return Colors.green;
      case PostCategory.business:
        return Colors.orange;
      case PostCategory.other:
        return Theme.of(context).colorScheme.secondary;
    }
  }
}

class _RecentBadge extends StatelessWidget {
  const _RecentBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'home.badge.recent'.tr(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
