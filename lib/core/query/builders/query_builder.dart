import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:testcase_1/core/query/client/query_client.dart';
import 'package:testcase_1/core/query/client/query_client_provider.dart';
import 'package:testcase_1/core/query/endpoints/query_endpoint.dart';
import 'package:testcase_1/core/query/endpoints/custom_query_endpoint.dart';
import 'package:testcase_1/core/query/options/query_options.dart';
import 'package:testcase_1/core/query/states/query_state.dart';

/// Widget builder untuk consume query
///
/// Features:
/// - Auto fetch on mount
/// - Provides refetch callback
/// - Optional polling
/// - Handle loading/error/success states
///
/// Example:
/// ```dart
/// QueryBuilder<List<Post>, void>(
///   endpoint: PostApiService.getPosts,
///   builder: (context, state, refetch) {
///     if (state.isLoading) return CircularProgressIndicator();
///     if (state.isError) return Text(state.errorMessage!);
///     return ListView(children: state.data!.map(PostCard.new).toList());
///   },
/// )
/// ```
class QueryBuilder<TData, TParams> extends StatefulWidget {
  /// Query endpoint
  final QueryEndpoint<TData, TParams>? endpoint;

  /// Custom query endpoint (alternative to endpoint)
  final CustomQueryEndpoint<TData, TParams>? customEndpoint;

  /// Parameters untuk query
  final TParams params;

  /// Builder function
  final Widget Function(
    BuildContext context,
    QueryState<TData> state,
    Future<void> Function() refetch,
  )
  builder;

  /// Query options (polling, enabled, etc)
  final QueryOptions options;

  /// Callback when query succeeds
  final void Function(TData data)? onSuccess;

  /// Callback when query fails
  final void Function(String error)? onError;

  const QueryBuilder({
    super.key,
    this.endpoint,
    this.customEndpoint,
    required this.params,
    required this.builder,
    this.options = const QueryOptions(),
    this.onSuccess,
    this.onError,
  }) : assert(
         endpoint != null || customEndpoint != null,
         'Either endpoint or customEndpoint must be provided',
       );

  /// Factory constructor untuk simple endpoint (tanpa params)
  static Widget simple<TData>({
    Key? key,
    required SimpleQueryEndpoint<TData> endpoint,
    required Widget Function(
      BuildContext context,
      QueryState<TData> state,
      Future<void> Function() refetch,
    )
    builder,
    QueryOptions options = const QueryOptions(),
    void Function(TData data)? onSuccess,
    void Function(String error)? onError,
  }) {
    return _SimpleQueryBuilder<TData>(
      key: key,
      endpoint: endpoint,
      builder: builder,
      options: options,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  @override
  State<QueryBuilder<TData, TParams>> createState() =>
      _QueryBuilderState<TData, TParams>();
}

class _QueryBuilderState<TData, TParams>
    extends State<QueryBuilder<TData, TParams>> {
  late QueryClient _client;
  StreamSubscription<QueryState<TData>>? _subscription;
  Timer? _pollingTimer;
  QueryState<TData> _state = const QueryState();
  QueryStatus? _lastStatus;

  @override
  void initState() {
    super.initState();
    _client = QueryClientProvider.read(context);
    _subscribe();
    _setupPolling();
  }

  @override
  void didUpdateWidget(QueryBuilder<TData, TParams> oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Re-subscribe jika params berubah
    if (widget.params != oldWidget.params ||
        widget.endpoint != oldWidget.endpoint ||
        widget.customEndpoint != oldWidget.customEndpoint) {
      _unsubscribe();
      _state = const QueryState();
      _lastStatus = null;
      _subscribe();
    }

    // Update polling
    if (widget.options.pollingInterval != oldWidget.options.pollingInterval) {
      _stopPolling();
      _setupPolling();
    }
  }

  @override
  void dispose() {
    _unsubscribe();
    _stopPolling();
    super.dispose();
  }

  void _subscribe() {
    if (!widget.options.enabled) return;

    Stream<QueryState<TData>> stream;

    if (widget.endpoint != null) {
      stream = _client.watchQuery(
        widget.endpoint!,
        params: widget.params,
        fetchOnSubscribe: true,
      );
    } else {
      stream = _client.watchCustomQuery(
        widget.customEndpoint!,
        params: widget.params,
        fetchOnSubscribe: true,
      );
    }

    _subscription = stream.listen((state) {
      if (mounted) {
        setState(() => _state = state);

        // Callbacks - only trigger once per status change
        if (state.status != _lastStatus) {
          _lastStatus = state.status;

          if (state.isSuccess && state.data != null) {
            widget.onSuccess?.call(state.data as TData);
          }
          if (state.isError && state.errorMessage != null) {
            widget.onError?.call(state.errorMessage!);
          }
        }
      }
    });
  }

  void _unsubscribe() {
    _subscription?.cancel();
    _subscription = null;
  }

  void _setupPolling() {
    final interval = widget.options.pollingInterval;
    if (interval != null && widget.options.enabled) {
      _pollingTimer = Timer.periodic(interval, (_) => _refetch());
    }
  }

  void _stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
  }

  Future<void> _refetch() async {
    if (widget.endpoint != null) {
      await _client.refetch(widget.endpoint!, params: widget.params);
    } else {
      await _client.refetchCustom(
        widget.customEndpoint!,
        params: widget.params,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _state, _refetch);
  }
}

/// Internal widget for simple queries (no params)
class _SimpleQueryBuilder<TData> extends StatefulWidget {
  final SimpleQueryEndpoint<TData> endpoint;
  final Widget Function(
    BuildContext context,
    QueryState<TData> state,
    Future<void> Function() refetch,
  )
  builder;
  final QueryOptions options;
  final void Function(TData data)? onSuccess;
  final void Function(String error)? onError;

  const _SimpleQueryBuilder({
    super.key,
    required this.endpoint,
    required this.builder,
    this.options = const QueryOptions(),
    this.onSuccess,
    this.onError,
  });

  @override
  State<_SimpleQueryBuilder<TData>> createState() =>
      _SimpleQueryBuilderState<TData>();
}

class _SimpleQueryBuilderState<TData>
    extends State<_SimpleQueryBuilder<TData>> {
  late QueryClient _client;
  StreamSubscription<QueryState<TData>>? _subscription;
  Timer? _pollingTimer;
  QueryState<TData> _state = const QueryState();
  QueryStatus? _lastStatus;

  @override
  void initState() {
    super.initState();
    _client = QueryClientProvider.read(context);
    _subscribe();
    _setupPolling();
  }

  @override
  void didUpdateWidget(_SimpleQueryBuilder<TData> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.endpoint != oldWidget.endpoint) {
      _unsubscribe();
      _state = const QueryState();
      _lastStatus = null;
      _subscribe();
    }

    if (widget.options.pollingInterval != oldWidget.options.pollingInterval) {
      _stopPolling();
      _setupPolling();
    }
  }

  @override
  void dispose() {
    _unsubscribe();
    _stopPolling();
    super.dispose();
  }

  void _subscribe() {
    if (!widget.options.enabled) return;

    final stream = _client.watchQuery<TData, void>(
      widget.endpoint,
      params: null,
      fetchOnSubscribe: true,
    );

    _subscription = stream.listen((state) {
      if (mounted) {
        setState(() => _state = state);

        if (state.status != _lastStatus) {
          _lastStatus = state.status;

          if (state.isSuccess && state.data != null) {
            widget.onSuccess?.call(state.data as TData);
          }
          if (state.isError && state.errorMessage != null) {
            widget.onError?.call(state.errorMessage!);
          }
        }
      }
    });
  }

  void _unsubscribe() {
    _subscription?.cancel();
    _subscription = null;
  }

  void _setupPolling() {
    final interval = widget.options.pollingInterval;
    if (interval != null && widget.options.enabled) {
      _pollingTimer = Timer.periodic(interval, (_) => _refetch());
    }
  }

  void _stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
  }

  Future<void> _refetch() async {
    await _client.refetch<TData, void>(widget.endpoint, params: null);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _state, _refetch);
  }
}
