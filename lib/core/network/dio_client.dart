import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:testcase_1/app/router/auth_notifier.dart';
import 'package:testcase_1/core/config/env_config.dart';
import 'package:testcase_1/core/network/cache/cache_manager.dart';
import 'package:testcase_1/core/network/cache/cache_policy.dart';
import 'package:testcase_1/core/network/interceptors/auth_interceptor.dart';
import 'package:testcase_1/core/network/interceptors/cache_interceptor.dart';
import 'package:testcase_1/core/network/interceptors/logger_interceptor.dart';
import 'package:testcase_1/core/storage/token_store.dart';

class DioClient {
  late final Dio _dio;
  final TokenStore _tokenStore;
  final CacheManager _cacheManager;
  final AuthNotifier _authNotifier;
  void Function()? onTokenExpired;

  DioClient({
    required TokenStore tokenStore,
    required CacheManager cacheManager,
    required AuthNotifier authNotifier,
    String? baseUrl,
  }) : _tokenStore = tokenStore,
       _cacheManager = cacheManager,
       _authNotifier = authNotifier {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? EnvConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (EnvConfig.apiKey.isNotEmpty) 'X-API-Key': EnvConfig.apiKey,
        },
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.addAll([
      AuthInterceptor(
        tokenStore: _tokenStore,
        dio: _dio,
        authNotifier: _authNotifier,
        onTokenExpired: () => onTokenExpired?.call(),
      ),
      CacheInterceptor(cacheManager: _cacheManager),
      LoggerInterceptor(),
    ]);
  }

  Dio get dio => _dio;

  String _normalizePath(String path) {
    if (path.startsWith('/')) return path.substring(1);
    return path;
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CachePolicy? cachePolicy,
  }) {
    final normalizedPath = _normalizePath(path);
    debugPrint(
      '🟦 DioClient.get => path: $path -> normalized: $normalizedPath',
    );
    debugPrint('🟦 DioClient.get => baseUrl: ${_dio.options.baseUrl}');
    debugPrint(
      '🟦 DioClient.get => final URL will be: ${_dio.options.baseUrl}/$normalizedPath',
    );
    if (queryParameters != null && queryParameters.isNotEmpty) {
      debugPrint('🟦 DioClient.get => queryParams: $queryParameters');
    }
    return _dio.get<T>(
      normalizedPath,
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(
        extra: {
          ...?options?.extra,
          if (cachePolicy != null) 'cachePolicy': cachePolicy,
        },
      ),
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    final normalizedPath = _normalizePath(path);
    debugPrint(
      '🟦 DioClient.post => path: $path -> normalized: $normalizedPath',
    );
    debugPrint('🟦 DioClient.post => baseUrl: ${_dio.options.baseUrl}');
    debugPrint(
      '🟦 DioClient.post => final URL will be: ${_dio.options.baseUrl}/$normalizedPath',
    );
    debugPrint('🟦 DioClient.post => data: $data');
    return _dio.post<T>(
      normalizedPath,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    final normalizedPath = _normalizePath(path);
    return _dio.put<T>(
      normalizedPath,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    final normalizedPath = _normalizePath(path);
    return _dio.delete<T>(
      normalizedPath,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
