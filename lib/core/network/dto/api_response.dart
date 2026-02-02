/// Base API response wrapper
///
/// All API responses follow this structure:
/// ```json
/// {
///   "success": true,
///   "trace_id": "abc123",
///   "code": "SUCCESS",
///   "message": "Operation successful",
///   "data": { ... },
///   "meta": { ... }
/// }
/// ```
class ApiResponse<T> {
  const ApiResponse({
    required this.success,
    required this.data,
    this.traceId,
    this.code,
    this.message,
    this.meta,
  });

  /// For single object responses
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    return ApiResponse(
      success: json['success'] as bool? ?? true,
      data: fromJsonT(json['data'] as Map<String, dynamic>),
      traceId: json['trace_id'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      meta: json['meta'] as Map<String, dynamic>?,
    );
  }

  /// For list responses
  factory ApiResponse.fromJsonList(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return ApiResponse(
      success: json['success'] as bool? ?? true,
      data: fromJsonT(json['data']),
      traceId: json['trace_id'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      meta: json['meta'] as Map<String, dynamic>?,
    );
  }

  final bool success;
  final T data;
  final String? traceId;
  final String? code;
  final String? message;
  final Map<String, dynamic>? meta;

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) {
    return {
      'success': success,
      'data': toJsonT(data),
      if (traceId != null) 'trace_id': traceId,
      if (code != null) 'code': code,
      if (message != null) 'message': message,
      if (meta != null) 'meta': meta,
    };
  }
}

/// Error response structure from API
///
/// ```json
/// {
///   "success": false,
///   "trace_id": "abc123",
///   "code": "VALIDATION_ERROR",
///   "message": "Validation failed",
///   "errors": {
///     "email": [{"code": "INVALID_FORMAT", "message": "Invalid email format"}]
///   }
/// }
/// ```
class ApiErrorResponse {
  const ApiErrorResponse({
    required this.success,
    this.traceId,
    this.code,
    this.message,
    this.errors,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(
      success: json['success'] as bool? ?? false,
      traceId: json['trace_id'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      errors: _parseErrors(json['errors']),
    );
  }

  static Map<String, List<FieldError>>? _parseErrors(dynamic errors) {
    if (errors == null) return null;
    if (errors is! Map) return null;

    return errors.map((key, value) {
      final fieldErrors = <FieldError>[];
      if (value is List) {
        for (final item in value) {
          if (item is Map<String, dynamic>) {
            fieldErrors.add(FieldError.fromJson(item));
          } else if (item is String) {
            fieldErrors.add(FieldError(message: item));
          }
        }
      }
      return MapEntry(key.toString(), fieldErrors);
    });
  }

  final bool success;
  final String? traceId;
  final String? code;
  final String? message;
  final Map<String, List<FieldError>>? errors;

  /// Get first error message for a field
  String? getFieldError(String field) {
    return errors?[field]?.firstOrNull?.message;
  }

  /// Get all field error messages as a flat map
  Map<String, String> get fieldErrorMessages {
    if (errors == null) return {};
    return errors!.map(
      (key, value) => MapEntry(key, value.map((e) => e.message).join(', ')),
    );
  }
}

/// Field-level error with code and message
class FieldError {
  const FieldError({this.code, required this.message});

  factory FieldError.fromJson(Map<String, dynamic> json) {
    return FieldError(
      code: json['code'] as String?,
      message: json['message'] as String? ?? 'Unknown error',
    );
  }

  final String? code;
  final String message;
}
