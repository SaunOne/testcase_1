import 'package:flutter/widgets.dart';
import 'package:testcase_1/core/query/client/query_client.dart';

/// InheritedWidget untuk provide QueryClient ke widget tree
class QueryClientProvider extends InheritedWidget {
  final QueryClient client;

  const QueryClientProvider({
    super.key,
    required this.client,
    required super.child,
  });

  /// Get QueryClient dari context (with dependency)
  static QueryClient of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<QueryClientProvider>();
    assert(provider != null, 'QueryClientProvider not found in widget tree');
    return provider!.client;
  }

  /// Get QueryClient tanpa dependency (tidak rebuild saat client berubah)
  static QueryClient read(BuildContext context) {
    final provider = context
        .getInheritedWidgetOfExactType<QueryClientProvider>();
    assert(provider != null, 'QueryClientProvider not found in widget tree');
    return provider!.client;
  }

  /// Try to get QueryClient (returns null if not found)
  static QueryClient? maybeOf(BuildContext context) {
    final provider = context
        .getInheritedWidgetOfExactType<QueryClientProvider>();
    return provider?.client;
  }

  @override
  bool updateShouldNotify(QueryClientProvider oldWidget) {
    return client != oldWidget.client;
  }
}
