import 'package:go_router/go_router.dart';
import 'package:testcase_1/app/router/feature_routes.dart';
import 'package:testcase_1/features/documentations/documantations_page.dart';

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
