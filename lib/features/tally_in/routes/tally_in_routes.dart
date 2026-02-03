import 'package:go_router/go_router.dart';
import 'package:testcase_1/app/router/feature_routes.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/page/tally_in_page.dart';

class TallyInRoutes extends FeatureRoutes {
  @override
  List<RouteBase> get routes => [];

  @override
  StatefulShellBranch? get shellBranch => StatefulShellBranch(
    routes: [
      GoRoute(
        path: TallyInPage.routeName,
        builder: (context, state) => const TallyInPage(),
      ),
    ],
  );
}
