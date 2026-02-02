import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:testcase_1/core/network/error/failure.dart';

class DioErrorMapper {
  const DioErrorMapper._();

  static Failure map(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.connectionError => const Failure.network(
        message: 'Connection error. Please check your internet.',
      ),
      DioExceptionType.badResponse => _mapStatusCode(exception.response),
      DioExceptionType.cancel => const Failure.network(
        message: 'Request was cancelled',
      ),
      _ => Failure.unknown(message: exception.message),
    };
  }

  static Failure _mapStatusCode(Response<dynamic>? response) {
    final statusCode = response?.statusCode ?? 0;
    final data = response?.data;

    // Parse standard API error response fields
    final message = data is Map ? data['message'] as String? : null;
    final errorCode = data is Map ? data['code'] as String? : null;
    final traceId = data is Map ? data['trace_id'] as String? : null;

    // Log trace_id for debugging
    if (traceId != null && kDebugMode) {
      debugPrint('[API Error] trace_id: $traceId, code: $errorCode');
    }

    return switch (statusCode) {
      400 => Failure.server(
        code: statusCode,
        message: message ?? 'Bad request',
        errorCode: errorCode,
        traceId: traceId,
      ),
      401 => Failure.unauthorized(
        message: message,
        errorCode: errorCode,
        traceId: traceId,
      ),
      403 => Failure.forbidden(
        message: message ?? 'Access forbidden',
        errorCode: errorCode,
        traceId: traceId,
      ),
      404 => Failure.notFound(
        message: message,
        errorCode: errorCode,
        traceId: traceId,
      ),
      409 => Failure.conflict(
        message: message ?? 'Resource already exists',
        errorCode: errorCode,
        traceId: traceId,
      ),
      422 => Failure.validation(
        errors: _parseValidationErrors(response),
        message: message,
        errorCode: errorCode,
        traceId: traceId,
      ),
      429 => Failure.rateLimited(
        message: message ?? 'Too many requests',
        errorCode: errorCode,
        traceId: traceId,
        retryAfter: _parseRetryAfter(response),
      ),
      >= 500 => Failure.server(
        code: statusCode,
        message: message ?? 'Server error',
        errorCode: errorCode,
        traceId: traceId,
      ),
      _ => Failure.unknown(message: message, traceId: traceId),
    };
  }

  static Map<String, List<String>> _parseValidationErrors(
    Response<dynamic>? response,
  ) {
    final data = response?.data;
    if (data is Map && data['errors'] is Map) {
      final errors = data['errors'] as Map<dynamic, dynamic>;
      return errors.map((key, value) {
        final messages = <String>[];
        if (value is List) {
          for (final item in value) {
            if (item is Map) {
              // New format: {"code": "INVALID", "message": "Invalid format"}
              messages.add(item['message']?.toString() ?? item.toString());
            } else {
              // Legacy format: ["Invalid format"]
              messages.add(item.toString());
            }
          }
        } else {
          messages.add(value.toString());
        }
        return MapEntry(key.toString(), messages);
      });
    }
    return {};
  }

  static int? _parseRetryAfter(Response<dynamic>? response) {
    // Try to get retry-after from header
    final retryAfterHeader = response?.headers.value('retry-after');
    if (retryAfterHeader != null) {
      return int.tryParse(retryAfterHeader);
    }

    // Try to get from response body
    final data = response?.data;
    if (data is Map && data['retry_after'] != null) {
      return data['retry_after'] as int?;
    }

    return null;
  }
}
