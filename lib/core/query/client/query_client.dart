import 'dart:async';
import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testcase_1/core/network/api_client.dart';
import 'package:testcase_1/core/network/cache/cache_manager.dart';
import 'package:testcase_1/core/query/endpoints/base_endpoint.dart';
import 'package:testcase_1/core/query/endpoints/query_endpoint.dart';
import 'package:testcase_1/core/query/endpoints/custom_query_endpoint.dart';
import 'package:testcase_1/core/query/endpoints/mutation_endpoint.dart';
import 'package:testcase_1/core/query/endpoints/custom_mutation_endpoint.dart';
import 'package:testcase_1/core/query/states/query_state.dart';
import 'package:testcase_1/core/query/states/mutation_state.dart';
import 'package:testcase_1/core/network/error/failure.dart';
import 'package:testcase_1/core/result/result.dart';

/// Core engine untuk Query System
///
/// Responsibilities:
/// - Execute queries dan mutations
/// - Manage cache
/// - Notify subscribers on state changes
/// - Handle tag-based invalidation
class QueryClient {
  final ApiClient _apiClient;
  final CacheManager _cacheManager;
  final GetIt _deps;

  /// Map of active query streams by cache key
  final Map<String, BehaviorSubject<QueryState<dynamic>>> _queryStreams = {};

  /// Map of in-flight requests to prevent duplicate calls
  final Map<String, Future<dynamic>> _inFlightRequests = {};

  /// Map of cache keys to their tags (for invalidation)
  final Map<String, Set<String>> _keyToTags = {};

  QueryClient({
    required ApiClient apiClient,
    required CacheManager cacheManager,
    GetIt? deps,
  }) : _apiClient = apiClient,
       _cacheManager = cacheManager,
       _deps = deps ?? GetIt.instance;

  // ═══════════════════════════════════════════════════════════════════════════
  // QUERY OPERATIONS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Subscribe ke query stream
  ///
  /// Returns stream of [QueryState] yang akan di-update setiap kali:
  /// - Query di-fetch
  /// - Cache di-invalidate
  /// - Manual refetch
  Stream<QueryState<TData>> watchQuery<TData, TParams>(
    QueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
    bool fetchOnSubscribe = true,
  }) {
    final key = endpoint.buildCacheKey(params);

    // Get or create stream
    final stream = _getOrCreateQueryStream<TData>(key);

    // Auto fetch on first subscribe
    if (fetchOnSubscribe && stream.value.isIdle) {
      _executeQuery(endpoint, params: params);
    }

    // Register tags for this key
    _registerTags(key, endpoint.cachePolicy.tags);

    return stream.stream.cast<QueryState<TData>>();
  }

  /// Subscribe ke custom query stream
  Stream<QueryState<TData>> watchCustomQuery<TData, TParams>(
    CustomQueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
    bool fetchOnSubscribe = true,
  }) {
    final key = endpoint.buildCacheKey(params);

    final stream = _getOrCreateQueryStream<TData>(key);

    if (fetchOnSubscribe && stream.value.isIdle) {
      _executeCustomQuery(endpoint, params: params);
    }

    _registerTags(key, endpoint.cachePolicy.tags);

    return stream.stream.cast<QueryState<TData>>();
  }

  /// Fetch query sekali (one-shot, tidak subscribe)
  Future<TData> fetch<TData, TParams>(
    QueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
  }) async {
    final state = await _executeQuery(endpoint, params: params);
    if (state.isError) {
      throw Exception(state.errorMessage);
    }
    return state.data as TData;
  }

  /// Fetch custom query sekali
  Future<TData> fetchCustom<TData, TParams>(
    CustomQueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
  }) async {
    final state = await _executeCustomQuery(endpoint, params: params);
    if (state.isError) {
      throw Exception(state.errorMessage);
    }
    return state.data as TData;
  }

  /// Refetch query (force fresh data)
  Future<void> refetch<TData, TParams>(
    QueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
  }) {
    return _executeQuery(endpoint, params: params, forceRefresh: true);
  }

  /// Refetch custom query (force fresh data)
  Future<void> refetchCustom<TData, TParams>(
    CustomQueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
  }) {
    return _executeCustomQuery(endpoint, params: params, forceRefresh: true);
  }

  /// Internal: Execute query
  Future<QueryState<TData>> _executeQuery<TData, TParams>(
    QueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
    bool forceRefresh = false,
  }) async {
    final key = endpoint.buildCacheKey(params);
    final stream = _getOrCreateQueryStream<TData>(key);
    final currentState = stream.value;

    // Check if already in flight
    if (_inFlightRequests.containsKey(key)) {
      return _inFlightRequests[key] as Future<QueryState<TData>>;
    }

    // Emit loading/fetching state
    if (currentState.hasData && currentState.data != null) {
      stream.add(QueryState<dynamic>.fetching(currentState.data));
    } else {
      stream.add(QueryState<dynamic>.loading());
    }

    // Check cache first (if not forcing refresh)
    if (!forceRefresh) {
      final cached = await _cacheManager.get(key);
      if (cached != null && !cached.isExpired) {
        final data = endpoint.fromJson(jsonDecode(cached.data));
        final state = QueryState<TData>.success(data, isFromCache: true);
        stream.add(state);
        return state;
      }
    }

    // Create fetch future
    final fetchFuture = _doFetch(endpoint, params, stream, key);
    _inFlightRequests[key] = fetchFuture;

    try {
      return await fetchFuture;
    } finally {
      _inFlightRequests.remove(key);
    }
  }

  /// Internal: Do actual fetch
  Future<QueryState<TData>> _doFetch<TData, TParams>(
    QueryEndpoint<TData, TParams> endpoint,
    TParams params,
    BehaviorSubject<QueryState<dynamic>> stream,
    String key,
  ) async {
    try {
      final path = endpoint.buildPath(params);
      final queryParams = endpoint.buildQueryParams(params);

      final result = await _apiClient.get<TData>(
        path: path,
        queryParameters: queryParams,
        fromJson: endpoint.fromJson,
        cachePolicy: endpoint.cachePolicy,
      );

      return result.when(
        success: (data) {
          // Save to cache
          _cacheManager.put(
            key: key,
            data: jsonEncode(data),
            policy: endpoint.cachePolicy,
          );

          final state = QueryState<TData>.success(data);
          stream.add(state);
          return state;
        },
        failure: (failure) {
          final currentData = stream.value.data;
          final state = QueryState<TData>.error(
            failure.displayMessage,
            previousData: currentData as TData?,
          );
          stream.add(state);
          return state;
        },
      );
    } catch (e) {
      final currentData = stream.value.data;
      final state = QueryState<TData>.error(
        e.toString(),
        previousData: currentData as TData?,
      );
      stream.add(state);
      return state;
    }
  }

  /// Internal: Execute custom query
  Future<QueryState<TData>> _executeCustomQuery<TData, TParams>(
    CustomQueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
    bool forceRefresh = false,
  }) async {
    final key = endpoint.buildCacheKey(params);
    final stream = _getOrCreateQueryStream<TData>(key);
    final currentState = stream.value;

    if (_inFlightRequests.containsKey(key)) {
      return _inFlightRequests[key] as Future<QueryState<TData>>;
    }

    if (currentState.hasData && currentState.data != null) {
      stream.add(QueryState<dynamic>.fetching(currentState.data));
    } else {
      stream.add(QueryState<dynamic>.loading());
    }

    // Check cache
    if (!forceRefresh) {
      final cached = await _cacheManager.get(key);
      if (cached != null && !cached.isExpired) {
        try {
          final data = jsonDecode(cached.data) as TData;
          final state = QueryState<TData>.success(data, isFromCache: true);
          stream.add(state);
          return state;
        } catch (_) {
          // Cache parse failed, fetch fresh
        }
      }
    }

    final fetchFuture = _doCustomFetch(endpoint, params, stream, key);
    _inFlightRequests[key] = fetchFuture;

    try {
      return await fetchFuture;
    } finally {
      _inFlightRequests.remove(key);
    }
  }

  Future<QueryState<TData>> _doCustomFetch<TData, TParams>(
    CustomQueryEndpoint<TData, TParams> endpoint,
    TParams params,
    BehaviorSubject<QueryState<dynamic>> stream,
    String key,
  ) async {
    try {
      final data = await endpoint.execute(params, this);

      // Save to cache
      _cacheManager.put(
        key: key,
        data: jsonEncode(data),
        policy: endpoint.cachePolicy,
      );

      final state = QueryState<TData>.success(data);
      stream.add(state);
      return state;
    } catch (e) {
      TData? currentData;
      if (stream.hasValue) {
        final previous = stream.value;
        final previousData = previous.data;
        if (previousData is TData) {
          currentData = previousData;
        }
      }
      final state = QueryState<TData>.error(
        e.toString(),
        previousData: currentData,
      );
      stream.add(state);
      return state;
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // MUTATION OPERATIONS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Execute mutation
  Future<MutationState<TData>> mutate<TData, TParams, TBody>(
    MutationEndpoint<TData, TParams, TBody> endpoint, {
    TParams? params,
    TBody? body,
  }) async {
    try {
      final path = endpoint.buildPath(params as TParams);
      final transformedBody = body != null
          ? endpoint.transformBody(body)
          : null;

      final result = await _executeHttpMethod<TData>(
        method: endpoint.method,
        path: path,
        body: transformedBody,
        fromJson: endpoint.fromJson,
      );

      return result.when(
        success: (data) {
          // Invalidate affected queries
          if (endpoint.invalidatesTags.isNotEmpty) {
            invalidateQueries(endpoint.invalidatesTags);
          }
          return MutationState<TData>.success(data);
        },
        failure: (failure) {
          return MutationState<TData>.error(failure.displayMessage);
        },
      );
    } catch (e) {
      return MutationState<TData>.error(e.toString());
    }
  }

  /// Execute custom mutation
  Future<MutationState<TData>> mutateCustom<TData, TParams, TBody>(
    CustomMutationEndpoint<TData, TParams, TBody> endpoint, {
    TParams? params,
    TBody? body,
  }) async {
    try {
      final data = await endpoint.execute(
        params as TParams,
        body as TBody,
        this,
        _deps,
      );

      // Invalidate affected queries
      if (endpoint.invalidatesTags.isNotEmpty) {
        invalidateQueries(endpoint.invalidatesTags);
      }

      endpoint.onSuccess?.call(data);
      return MutationState<TData>.success(data);
    } catch (e) {
      final error = e.toString();
      endpoint.onError?.call(error);
      return MutationState<TData>.error(error);
    }
  }

  /// Internal: Execute HTTP method
  Future<Result<TData>> _executeHttpMethod<TData>({
    required HttpMethod method,
    required String path,
    dynamic body,
    required TData Function(dynamic) fromJson,
  }) {
    switch (method) {
      case HttpMethod.get:
        return _apiClient.get(path: path, fromJson: fromJson);
      case HttpMethod.post:
        return _apiClient.post(path: path, data: body, fromJson: fromJson);
      case HttpMethod.put:
        return _apiClient.put(path: path, data: body, fromJson: fromJson);
      case HttpMethod.patch:
        return _apiClient.put(path: path, data: body, fromJson: fromJson);
      case HttpMethod.delete:
        return _apiClient
            .delete(path: path, data: body)
            .then((_) => Result.success(fromJson(null)));
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // CACHE INVALIDATION
  // ═══════════════════════════════════════════════════════════════════════════

  /// Invalidate queries by tags
  ///
  /// Semua queries dengan tag yang match akan di-refetch
  Future<void> invalidateQueries(List<String> tags) async {
    // Invalidate cache
    await _cacheManager.invalidateByTags(tags);

    // Find all keys affected by these tags
    final affectedKeys = <String>{};
    for (final entry in _keyToTags.entries) {
      if (entry.value.any((tag) => tags.contains(tag))) {
        affectedKeys.add(entry.key);
      }
    }

    // Mark affected queries as stale
    for (final key in affectedKeys) {
      final stream = _queryStreams[key];
      if (stream != null && !stream.isClosed) {
        final currentState = stream.value;
        if (currentState.hasData) {
          stream.add(currentState.copyWith(isStale: true));
        }
      }
    }
  }

  /// Invalidate specific query by key
  Future<void> invalidateQuery(String key) async {
    await _cacheManager.invalidate(key);

    final stream = _queryStreams[key];
    if (stream != null && !stream.isClosed) {
      final currentState = stream.value;
      if (currentState.hasData) {
        stream.add(currentState.copyWith(isStale: true));
      }
    }
  }

  /// Clear all cache and queries
  Future<void> clear() async {
    await _cacheManager.clear();
    for (final stream in _queryStreams.values) {
      if (!stream.isClosed) {
        stream.add(const QueryState());
      }
    }
  }

  /// Get current query state (without subscribing)
  QueryState<TData>? getQueryState<TData>(String key) {
    final stream = _queryStreams[key];
    if (stream != null) {
      final value = stream.value;
      return QueryState<TData>(
        data: value.data as TData?,
        status: value.status,
        errorMessage: value.errorMessage,
      );
    }
    return null;
  }

  /// Set query data manually (useful for optimistic updates)
  void setQueryData<TData>(String key, TData data) {
    final stream = _queryStreams[key];
    if (stream != null && !stream.isClosed) {
      stream.add(QueryState<TData>.success(data));
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // HELPERS
  // ═══════════════════════════════════════════════════════════════════════════

  BehaviorSubject<QueryState<dynamic>> _getOrCreateQueryStream<TData>(
    String key,
  ) {
    if (!_queryStreams.containsKey(key)) {
      _queryStreams[key] = BehaviorSubject<QueryState<dynamic>>.seeded(
        const QueryState<dynamic>(),
      );
    }
    return _queryStreams[key]!;
  }

  void _registerTags(String key, List<String> tags) {
    _keyToTags[key] = {...?_keyToTags[key], ...tags};
  }

  /// Dispose resources
  void dispose() {
    for (final stream in _queryStreams.values) {
      stream.close();
    }
    _queryStreams.clear();
    _inFlightRequests.clear();
    _keyToTags.clear();
  }
}
