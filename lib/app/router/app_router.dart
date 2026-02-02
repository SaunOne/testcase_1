import 'package:go_router/go_router.dart';
import 'package:testcase_1/app/di/di.dart';
import 'package:testcase_1/app/router/auth_notifier.dart';
import 'package:testcase_1/app/router/feature_routes.dart';
import 'package:testcase_1/core/storage/token_store.dart';
import 'package:testcase_1/features/documentations/routes/documentation_routes.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/page/tally_in_page.dart';
import 'package:testcase_1/features/tally_in/routes/tally_in_routes.dart';

class AppRouter {
  AppRouter._();

  // ═══════════════════════════════════════════════════════════════════════════
  // Auth Dependencies
  // ═══════════════════════════════════════════════════════════════════════════

  static AuthNotifier get _authNotifier => getIt<AuthNotifier>();
  static TokenStore get _tokenStore => getIt<TokenStore>();

  // ═══════════════════════════════════════════════════════════════════════════
  // Register all feature routes here
  // ═══════════════════════════════════════════════════════════════════════════

  static final List<FeatureRoutes> _featureRoutes = [
    TallyInRoutes(),
    DoucmentationRoutes(),
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  // Collect routes from all features
  // ═══════════════════════════════════════════════════════════════════════════

  /// Standalone routes (no shell) from all features
  static List<RouteBase> get _standaloneRoutes =>
      _featureRoutes.expand((feature) => feature.routes).toList();

  /// Shell branches (bottom nav tabs) from all features
  /// Order matters - this determines tab order in bottom navigation
  static List<StatefulShellBranch> get _shellBranches => _featureRoutes
      .map((feature) => feature.shellBranch)
      .whereType<StatefulShellBranch>()
      .toList();

  // ═══════════════════════════════════════════════════════════════════════════
  // Router Configuration
  // ═══════════════════════════════════════════════════════════════════════════

  static final GoRouter router = GoRouter(
    initialLocation: TallyInPage.routeName,
    refreshListenable: _authNotifier,
    routes: [
      // Standalone routes (no bottom nav)
      ..._standaloneRoutes,
      // Shell routes (with bottom nav)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => navigationShell,
        branches: _shellBranches,
      ),
    ],
  );
}
