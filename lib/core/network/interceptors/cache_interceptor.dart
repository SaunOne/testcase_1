import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:testcase_1/core/network/cache/cache_manager.dart';
import 'package:testcase_1/core/network/cache/cache_policy.dart';

class CacheInterceptor extends Interceptor {
  final CacheManager _cacheManager;

  CacheInterceptor({required CacheManager cacheManager})
    : _cacheManager = cacheManager;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.method != 'GET') {
      handler.next(options);
      return;
    }

    final policy = options.extra['cachePolicy'] as CachePolicy?;
    if (policy == null || policy.ttlSeconds == 0) {
      handler.next(options);
      return;
    }

    final key = _cacheManager.buildKey(
      method: options.method,
      path: options.path,
      queryParams: options.queryParameters,
    );

    final entry = await _cacheManager.get(key);

    if (entry != null && !entry.isExpired) {
      handler.resolve(
        Response(
          requestOptions: options,
          data: jsonDecode(entry.data),
          statusCode: 200,
          extra: {'fromCache': true},
        ),
      );
      return;
    }

    if (policy.swr && entry != null) {
      options.extra['staleEntry'] = entry;
      options.extra['cacheKey'] = key;
    } else {
      options.extra['cacheKey'] = key;
    }

    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.requestOptions.method != 'GET' || response.statusCode != 200) {
      handler.next(response);
      return;
    }

    final policy = response.requestOptions.extra['cachePolicy'] as CachePolicy?;
    final key = response.requestOptions.extra['cacheKey'] as String?;

    if (policy != null && key != null && policy.ttlSeconds > 0) {
      await _cacheManager.put(
        key: key,
        data: jsonEncode(response.data),
        policy: policy,
      );
    }

    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final policy = err.requestOptions.extra['cachePolicy'] as CachePolicy?;
    final key = err.requestOptions.extra['cacheKey'] as String?;

    if (policy != null && key != null) {
      final entry = await _cacheManager.get(key);
      if (entry != null) {
        handler.resolve(
          Response(
            requestOptions: err.requestOptions,
            data: jsonDecode(entry.data),
            statusCode: 200,
            extra: {'fromCache': true, 'isStale': true},
          ),
        );
        return;
      }
    }

    handler.next(err);
  }
}
