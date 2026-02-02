import 'package:go_router/go_router.dart';

/// Base class for feature-specific routes
///
/// Each feature can implement this to define its own routes.
/// Routes are separated into two categories:
/// - [routes]: Standalone routes (no bottom nav shell)
/// - [shellBranch]: Routes that appear in bottom navigation shell
abstract class FeatureRoutes {
  /// Standalone routes without bottom navigation shell
  /// Examples: login, register, detail pages, fullscreen modals
  List<RouteBase> get routes => [];

  /// Shell branch for bottom navigation tab
  /// Return null if this feature doesn't have a tab in bottom nav
  StatefulShellBranch? get shellBranch => null;
}
