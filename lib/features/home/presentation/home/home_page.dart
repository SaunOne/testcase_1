import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testcase_1/core/query/query.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/shared/widgets/feedback/app_empty_state.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';
import 'package:testcase_1/features/home/data/api/post_endpoints.dart';
import 'package:testcase_1/features/home/data/entities/post.dart';
import 'package:testcase_1/features/home/presentation/_widgets/post_card.dart';
import 'package:testcase_1/features/home/presentation/debug/debug_page.dart';
import 'package:testcase_1/features/home/presentation/home/sections/home_header_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: kDebugMode
          ? FloatingActionButton(
              onPressed: () => context.push(DebugPage.routeName),
              backgroundColor: context.colors.warning,
              child: const Icon(Icons.bug_report),
            )
          : null,
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeaderSection(),
            Expanded(
              child: QueryBuilder.simple<List<Post>>(
                endpoint: PostEndpoints.getPosts,
                onError: (String error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                  );
                },
                builder: (context, QueryState<List<Post>> state, refetch) {
                  // ════════════════════════════════════════════════════════
                  // Loading State
                  // ════════════════════════════════════════════════════════
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // ════════════════════════════════════════════════════════
                  // Error State (no data)
                  // ════════════════════════════════════════════════════════
                  if (state.isError && !state.hasData) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('home.error.load_failed'.tr()),
                          AppSpacing.heightMd,
                          ElevatedButton(
                            onPressed: refetch,
                            child: Text('common.retry'.tr()),
                          ),
                        ],
                      ),
                    );
                  }

                  // ════════════════════════════════════════════════════════
                  // Success State
                  // ════════════════════════════════════════════════════════
                  final posts = state.data ?? [];

                  if (posts.isEmpty) {
                    return AppEmptyState(
                      icon: Icons.article_outlined,
                      title: 'home.empty'.tr(),
                    );
                  }

                  return Stack(
                    children: [
                      RefreshIndicator(
                        onRefresh: refetch,
                        child: ListView.builder(
                          padding: AppSpacing.paddingMd,
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            final post = posts[index];
                            return PostCard(
                              post: post,
                              onTap: () =>
                                  context.push('/home/post/${post.id}'),
                            );
                          },
                        ),
                      ),

                      // Refetching indicator
                      if (state.isFetching)
                        const Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: LinearProgressIndicator(),
                        ),

                      // Stale indicator
                      if (state.isStale)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Chip(
                            label: Text('home.stale'.tr()),
                            backgroundColor: context.colors.warningContainer,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
