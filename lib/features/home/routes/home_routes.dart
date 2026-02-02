import 'package:go_router/go_router.dart';
import 'package:testcase_1/app/router/feature_routes.dart';
import 'package:testcase_1/features/home/presentation/debug/debug_page.dart';
import 'package:testcase_1/features/home/presentation/home/home_page.dart';
import 'package:testcase_1/features/home/presentation/post_detail/page/post_detail_page.dart';

/// Home feature routes
///
/// Contains:
/// - Home page (shell branch - bottom nav tab)
/// - Post detail page (standalone, no shell)
/// - Debug page (standalone, for component testing)
class HomeRoutes extends FeatureRoutes {
  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: HomePage.routeName,
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/home/post/:id',
      name: 'post-detail',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return PostDetailPage(postId: id);
      },
    ),
    GoRoute(
      path: DebugPage.routeName,
      name: 'debug',
      builder: (context, state) => const DebugPage(),
    ),
  ];

  @override
  StatefulShellBranch? get shellBranch => null;
}
