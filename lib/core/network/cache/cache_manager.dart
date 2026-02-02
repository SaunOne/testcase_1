import 'dart:async';

import 'package:testcase_1/core/network/cache/cache_entry.dart';
import 'package:testcase_1/core/network/cache/cache_key_builder.dart';
import 'package:testcase_1/core/network/cache/cache_policy.dart';
import 'package:testcase_1/core/network/cache/stores/hybrid_cache_store.dart';

class CacheManager {
  final HybridCacheStore _store;
  final Map<String, Completer<String?>> _inFlight = {};

  CacheManager({required HybridCacheStore store}) : _store = store;

  Future<CacheEntry?> get(String key) => _store.get(key);

  Future<void> put({
    required String key,
    required String data,
    required CachePolicy policy,
  }) async {
    final entry = CacheEntry(
      key: key,
      data: data,
      createdAt: DateTime.now(),
      ttlSeconds: policy.ttlSeconds,
      tags: policy.tags,
    );
    await _store.put(entry);
  }

  Future<void> invalidate(String key) => _store.remove(key);

  Future<void> invalidateByTags(List<String> tags) =>
      _store.invalidateByTags(tags);

  Future<void> clear() => _store.clear();

  Future<String?> getOrFetch(
    String key,
    Future<String> Function() fetcher,
  ) async {
    if (_inFlight.containsKey(key)) {
      return _inFlight[key]!.future;
    }

    final completer = Completer<String?>();
    _inFlight[key] = completer;

    try {
      final data = await fetcher();
      completer.complete(data);
      return data;
    } catch (e) {
      completer.completeError(e);
      rethrow;
    } finally {
      _inFlight.remove(key);
    }
  }

  String buildKey({
    required String method,
    required String path,
    Map<String, dynamic>? queryParams,
  }) {
    return CacheKeyBuilder.build(
      method: method,
      path: path,
      queryParams: queryParams,
    );
  }
}
