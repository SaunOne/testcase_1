import 'package:dio/dio.dart';
import 'package:testcase_1/app/router/auth_notifier.dart';
import 'package:testcase_1/core/storage/token_store.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  final TokenStore _tokenStore;
  final Dio _dio;
  final AuthNotifier? authNotifier;
  final void Function()? onTokenExpired;

  AuthInterceptor({
    required TokenStore tokenStore,
    required Dio dio,
    this.authNotifier,
    this.onTokenExpired,
  }) : _tokenStore = tokenStore,
       _dio = dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStore.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final refreshed = await _refreshToken();
      if (refreshed) {
        try {
          final response = await _retryRequest(err.requestOptions);
          handler.resolve(response);
          return;
        } catch (e) {
          handler.reject(err);
          return;
        }
      } else {
        await _tokenStore.clearTokens();
        authNotifier?.logout(reason: SessionExpireReason.refreshFailed);
        onTokenExpired?.call();
      }
    }
    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _tokenStore.getRefreshToken();
      if (refreshToken == null) return false;

      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
        options: Options(headers: {'Authorization': null}),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null) {
          await _tokenStore.saveTokens(
            accessToken: data['access_token'] as String,
            refreshToken: data['refresh_token'] as String,
          );
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions options) async {
    final token = await _tokenStore.getAccessToken();
    options.headers['Authorization'] = 'Bearer $token';
    return _dio.fetch(options);
  }
}
