import 'package:dio/dio.dart';
import 'package:testcase_1/core/config/env_config.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  final _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, printEmojis: false),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (EnvConfig.isDev) {
      _logger.d('REQUEST[${options.method}] => ${options.path}');
      _logger.d('Full URL: ${options.uri}');
      if (options.data != null) {
        _logger.d('Body: ${options.data}');
      }
      if (options.queryParameters.isNotEmpty) {
        _logger.d('Query: ${options.queryParameters}');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (EnvConfig.isDev) {
      _logger.d(
        'RESPONSE[${response.statusCode}] => ${response.requestOptions.path}',
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (EnvConfig.isDev) {
      _logger.e(
        'ERROR[${err.response?.statusCode}] => ${err.requestOptions.path}',
      );
      _logger.e('Full URL: ${err.requestOptions.uri}');
      _logger.e('Message: ${err.message}');
      _logger.e('Error Type: ${err.type}');
      if (err.response?.data != null) {
        _logger.e('Response Body: ${err.response?.data}');
      }
    }
    handler.next(err);
  }
}
