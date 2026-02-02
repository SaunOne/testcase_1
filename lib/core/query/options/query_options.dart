/// Options untuk QueryBuilder
class QueryOptions {
  /// Polling interval (null = no polling)
  final Duration? pollingInterval;

  /// Enable/disable query (false = tidak auto fetch)
  final bool enabled;

  /// Stale time - setelah ini, data dianggap stale
  final Duration? staleTime;

  /// Retry count on error
  final int retryCount;

  /// Retry delay
  final Duration retryDelay;

  const QueryOptions({
    this.pollingInterval,
    this.enabled = true,
    this.staleTime,
    this.retryCount = 0,
    this.retryDelay = const Duration(seconds: 1),
  });

  /// Preset: No auto fetch
  static const QueryOptions manual = QueryOptions(enabled: false);

  /// Preset: With polling every 30 seconds
  static const QueryOptions polling30s = QueryOptions(
    pollingInterval: Duration(seconds: 30),
  );

  /// Preset: With polling every 60 seconds
  static const QueryOptions polling60s = QueryOptions(
    pollingInterval: Duration(seconds: 60),
  );
}

/// Options untuk MutationBuilder
class MutationOptions {
  /// Reset state after success
  final bool resetOnSuccess;

  /// Reset state after error
  final bool resetOnError;

  /// Reset delay
  final Duration? resetDelay;

  const MutationOptions({
    this.resetOnSuccess = false,
    this.resetOnError = false,
    this.resetDelay,
  });
}
