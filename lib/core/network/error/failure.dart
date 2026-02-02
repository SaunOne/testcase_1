import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network({String? message, String? traceId}) =
      NetworkFailure;

  const factory Failure.server({
    required int code,
    String? message,
    String? errorCode,
    String? traceId,
  }) = ServerFailure;

  const factory Failure.unauthorized({
    String? message,
    String? errorCode,
    String? traceId,
  }) = UnauthorizedFailure;

  const factory Failure.notFound({
    String? message,
    String? errorCode,
    String? traceId,
  }) = NotFoundFailure;

  const factory Failure.validation({
    required Map<String, List<String>> errors,
    String? message,
    String? errorCode,
    String? traceId,
  }) = ValidationFailure;

  const factory Failure.forbidden({
    String? message,
    String? errorCode,
    String? traceId,
  }) = ForbiddenFailure;

  const factory Failure.conflict({
    String? message,
    String? errorCode,
    String? traceId,
  }) = ConflictFailure;

  const factory Failure.rateLimited({
    String? message,
    String? errorCode,
    String? traceId,
    int? retryAfter,
  }) = RateLimitedFailure;

  const factory Failure.unknown({String? message, String? traceId}) =
      UnknownFailure;
}

extension FailureX on Failure {
  String get displayMessage => switch (this) {
    NetworkFailure(:final message) => message ?? 'Network error occurred',
    ServerFailure(:final message) => message ?? 'Server error occurred',
    UnauthorizedFailure(:final message) => message ?? 'Unauthorized access',
    NotFoundFailure(:final message) => message ?? 'Resource not found',
    ValidationFailure(:final errors, :final message) =>
      message ?? errors.values.expand((e) => e).join(', '),
    ForbiddenFailure(:final message) => message ?? 'Access forbidden',
    ConflictFailure(:final message) => message ?? 'Resource already exists',
    RateLimitedFailure(:final message) => message ?? 'Too many requests',
    UnknownFailure(:final message) => message ?? 'Unknown error occurred',
  };

  String? get traceId => switch (this) {
    NetworkFailure(:final traceId) => traceId,
    ServerFailure(:final traceId) => traceId,
    UnauthorizedFailure(:final traceId) => traceId,
    NotFoundFailure(:final traceId) => traceId,
    ValidationFailure(:final traceId) => traceId,
    ForbiddenFailure(:final traceId) => traceId,
    ConflictFailure(:final traceId) => traceId,
    RateLimitedFailure(:final traceId) => traceId,
    UnknownFailure(:final traceId) => traceId,
  };

  String? get errorCode => switch (this) {
    ServerFailure(:final errorCode) => errorCode,
    UnauthorizedFailure(:final errorCode) => errorCode,
    NotFoundFailure(:final errorCode) => errorCode,
    ValidationFailure(:final errorCode) => errorCode,
    ForbiddenFailure(:final errorCode) => errorCode,
    ConflictFailure(:final errorCode) => errorCode,
    RateLimitedFailure(:final errorCode) => errorCode,
    _ => null,
  };

  bool get isUnauthorized => this is UnauthorizedFailure;
  bool get isNetwork => this is NetworkFailure;
  bool get isServer => this is ServerFailure;
  bool get isValidation => this is ValidationFailure;
  bool get isForbidden => this is ForbiddenFailure;
  bool get isConflict => this is ConflictFailure;
  bool get isRateLimited => this is RateLimitedFailure;
}
