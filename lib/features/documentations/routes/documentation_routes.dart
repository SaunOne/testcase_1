import 'package:go_router/go_router.dart';
import 'package:testcase_1/app/router/feature_routes.dart';
import 'package:testcase_1/features/documentations/documantations_page.dart';

/// Home feature routes
///
/// Contains:
/// - Home page (shell branch - bottom nav tab)
/// - Post detail page (standalone, no shell)
/// - Debug page (standalone, for component testing)
class DoucmentationRoutes extends FeatureRoutes {
  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: DocumantationsPage.routeName,
      name: 'documentations',
      builder: (context, state) => const DocumantationsPage(),
    ),
  ];

  @override
  StatefulShellBranch? get shellBranch => null;
}
