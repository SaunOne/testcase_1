import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testcase_1/core/query/query.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/features/home/data/api/post_endpoints.dart';
import 'package:testcase_1/features/home/data/entities/post.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key, required this.postId});

  final String postId;

  static String routeName({String id = ":id"}) => "/home/post/$id";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('post_detail.title'.tr())),
      body: QueryBuilder<Post, String>(
        endpoint: PostEndpoints.getPost,
        params: postId,
        onError: (String error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        },
        builder: (context, QueryState<Post> state, refetch) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.isError && !state.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('post_detail.error.load_failed'.tr()),
                  AppSpacing.heightMd,
                  ElevatedButton(
                    onPressed: refetch,
                    child: Text('common.retry'.tr()),
                  ),
                ],
              ),
            );
          }

          final post = state.data;
          if (post == null) {
            return Center(child: Text('post_detail.not_found'.tr()));
          }

          return RefreshIndicator(
            onRefresh: refetch,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: AppSpacing.paddingLg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(label: Text(post.category.name)),
                  AppSpacing.heightMd,
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  AppSpacing.heightSm,
                  Text(
                    '${post.author} • ${_formatDate(post.createdAt)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  AppSpacing.heightLg,
                  Text(post.body, style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
