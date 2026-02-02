// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Failure {
  String? get message => throw _privateConstructorUsedError;
  String? get traceId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? traceId) network,
    required TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )
    server,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    unauthorized,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    notFound,
    required TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )
    validation,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    forbidden,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    conflict,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )
    rateLimited,
    required TResult Function(String? message, String? traceId) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? traceId)? network,
    TResult? Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult? Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult? Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult? Function(String? message, String? traceId)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? traceId)? network,
    TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult Function(String? message, String? traceId)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(UnauthorizedFailure value) unauthorized,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(ForbiddenFailure value) forbidden,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(RateLimitedFailure value) rateLimited,
    required TResult Function(UnknownFailure value) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UnauthorizedFailure value)? unauthorized,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(ForbiddenFailure value)? forbidden,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(RateLimitedFailure value)? rateLimited,
    TResult? Function(UnknownFailure value)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(UnauthorizedFailure value)? unauthorized,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(ForbiddenFailure value)? forbidden,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(RateLimitedFailure value)? rateLimited,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String? message, String? traceId});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed, Object? traceId = freezed}) {
    return _then(
      _value.copyWith(
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            traceId: freezed == traceId
                ? _value.traceId
                : traceId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(
    _$NetworkFailureImpl value,
    $Res Function(_$NetworkFailureImpl) then,
  ) = __$$NetworkFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? traceId});
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
    _$NetworkFailureImpl _value,
    $Res Function(_$NetworkFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed, Object? traceId = freezed}) {
    return _then(
      _$NetworkFailureImpl(
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        traceId: freezed == traceId
            ? _value.traceId
            : traceId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$NetworkFailureImpl implements NetworkFailure {
  const _$NetworkFailureImpl({this.message, this.traceId});

  @override
  final String? message;
  @override
  final String? traceId;

  @override
  String toString() {
    return 'Failure.network(message: $message, traceId: $traceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.traceId, traceId) || other.traceId == traceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, traceId);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? traceId) network,
    required TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )
    server,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    unauthorized,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    notFound,
    required TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )
    validation,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    forbidden,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    conflict,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )
    rateLimited,
    required TResult Function(String? message, String? traceId) unknown,
  }) {
    return network(message, traceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? traceId)? network,
    TResult? Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult? Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult? Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult? Function(String? message, String? traceId)? unknown,
  }) {
    return network?.call(message, traceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? traceId)? network,
    TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult Function(String? message, String? traceId)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message, traceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(UnauthorizedFailure value) unauthorized,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(ForbiddenFailure value) forbidden,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(RateLimitedFailure value) rateLimited,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UnauthorizedFailure value)? unauthorized,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(ForbiddenFailure value)? forbidden,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(RateLimitedFailure value)? rateLimited,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(UnauthorizedFailure value)? unauthorized,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(ForbiddenFailure value)? forbidden,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(RateLimitedFailure value)? rateLimited,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure implements Failure {
  const factory NetworkFailure({final String? message, final String? traceId}) =
      _$NetworkFailureImpl;

  @override
  String? get message;
  @override
  String? get traceId;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
    _$ServerFailureImpl value,
    $Res Function(_$ServerFailureImpl) then,
  ) = __$$ServerFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String? message, String? errorCode, String? traceId});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
    _$ServerFailureImpl _value,
    $Res Function(_$ServerFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
    Object? errorCode = freezed,
    Object? traceId = freezed,
  }) {
    return _then(
      _$ServerFailureImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as int,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorCode: freezed == errorCode
            ? _value.errorCode
            : errorCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        traceId: freezed == traceId
            ? _value.traceId
            : traceId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ServerFailureImpl implements ServerFailure {
  const _$ServerFailureImpl({
    required this.code,
    this.message,
    this.errorCode,
    this.traceId,
  });

  @override
  final int code;
  @override
  final String? message;
  @override
  final String? errorCode;
  @override
  final String? traceId;

  @override
  String toString() {
    return 'Failure.server(code: $code, message: $message, errorCode: $errorCode, traceId: $traceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.traceId, traceId) || other.traceId == traceId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, code, message, errorCode, traceId);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? traceId) network,
    required TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )
    server,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    unauthorized,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    notFound,
    required TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )
    validation,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    forbidden,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    conflict,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )
    rateLimited,
    required TResult Function(String? message, String? traceId) unknown,
  }) {
    return server(code, message, errorCode, traceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? traceId)? network,
    TResult? Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult? Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult? Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult? Function(String? message, String? traceId)? unknown,
  }) {
    return server?.call(code, message, errorCode, traceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? traceId)? network,
    TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult Function(String? message, String? traceId)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(code, message, errorCode, traceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(UnauthorizedFailure value) unauthorized,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(ForbiddenFailure value) forbidden,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(RateLimitedFailure value) rateLimited,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UnauthorizedFailure value)? unauthorized,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(ForbiddenFailure value)? forbidden,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(RateLimitedFailure value)? rateLimited,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(UnauthorizedFailure value)? unauthorized,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(ForbiddenFailure value)? forbidden,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(RateLimitedFailure value)? rateLimited,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerFailure implements Failure {
  const factory ServerFailure({
    required final int code,
    final String? message,
    final String? errorCode,
    final String? traceId,
  }) = _$ServerFailureImpl;

  int get code;
  @override
  String? get message;
  String? get errorCode;
  @override
  String? get traceId;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnauthorizedFailureImplCopyWith(
    _$UnauthorizedFailureImpl value,
    $Res Function(_$UnauthorizedFailureImpl) then,
  ) = __$$UnauthorizedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? errorCode, String? traceId});
}

/// @nodoc
class __$$UnauthorizedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnauthorizedFailureImpl>
    implements _$$UnauthorizedFailureImplCopyWith<$Res> {
  __$$UnauthorizedFailureImplCopyWithImpl(
    _$UnauthorizedFailureImpl _value,
    $Res Function(_$UnauthorizedFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? errorCode = freezed,
    Object? traceId = freezed,
  }) {
    return _then(
      _$UnauthorizedFailureImpl(
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorCode: freezed == errorCode
            ? _value.errorCode
            : errorCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        traceId: freezed == traceId
            ? _value.traceId
            : traceId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UnauthorizedFailureImpl implements UnauthorizedFailure {
  const _$UnauthorizedFailureImpl({this.message, this.errorCode, this.traceId});

  @override
  final String? message;
  @override
  final String? errorCode;
  @override
  final String? traceId;

  @override
  String toString() {
    return 'Failure.unauthorized(message: $message, errorCode: $errorCode, traceId: $traceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.traceId, traceId) || other.traceId == traceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, errorCode, traceId);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedFailureImplCopyWith<_$UnauthorizedFailureImpl> get copyWith =>
      __$$UnauthorizedFailureImplCopyWithImpl<_$UnauthorizedFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? traceId) network,
    required TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )
    server,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    unauthorized,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    notFound,
    required TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )
    validation,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    forbidden,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    conflict,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )
    rateLimited,
    required TResult Function(String? message, String? traceId) unknown,
  }) {
    return unauthorized(message, errorCode, traceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? traceId)? network,
    TResult? Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult? Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult? Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult? Function(String? message, String? traceId)? unknown,
  }) {
    return unauthorized?.call(message, errorCode, traceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? traceId)? network,
    TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult Function(String? message, String? traceId)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message, errorCode, traceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(UnauthorizedFailure value) unauthorized,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(ForbiddenFailure value) forbidden,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(RateLimitedFailure value) rateLimited,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UnauthorizedFailure value)? unauthorized,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(ForbiddenFailure value)? forbidden,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(RateLimitedFailure value)? rateLimited,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(UnauthorizedFailure value)? unauthorized,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(ForbiddenFailure value)? forbidden,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(RateLimitedFailure value)? rateLimited,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedFailure implements Failure {
  const factory UnauthorizedFailure({
    final String? message,
    final String? errorCode,
    final String? traceId,
  }) = _$UnauthorizedFailureImpl;

  @override
  String? get message;
  String? get errorCode;
  @override
  String? get traceId;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedFailureImplCopyWith<_$UnauthorizedFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NotFoundFailureImplCopyWith(
    _$NotFoundFailureImpl value,
    $Res Function(_$NotFoundFailureImpl) then,
  ) = __$$NotFoundFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? errorCode, String? traceId});
}

/// @nodoc
class __$$NotFoundFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotFoundFailureImpl>
    implements _$$NotFoundFailureImplCopyWith<$Res> {
  __$$NotFoundFailureImplCopyWithImpl(
    _$NotFoundFailureImpl _value,
    $Res Function(_$NotFoundFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? errorCode = freezed,
    Object? traceId = freezed,
  }) {
    return _then(
      _$NotFoundFailureImpl(
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorCode: freezed == errorCode
            ? _value.errorCode
            : errorCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        traceId: freezed == traceId
            ? _value.traceId
            : traceId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$NotFoundFailureImpl implements NotFoundFailure {
  const _$NotFoundFailureImpl({this.message, this.errorCode, this.traceId});

  @override
  final String? message;
  @override
  final String? errorCode;
  @override
  final String? traceId;

  @override
  String toString() {
    return 'Failure.notFound(message: $message, errorCode: $errorCode, traceId: $traceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.traceId, traceId) || other.traceId == traceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, errorCode, traceId);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      __$$NotFoundFailureImplCopyWithImpl<_$NotFoundFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? traceId) network,
    required TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )
    server,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    unauthorized,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    notFound,
    required TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )
    validation,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    forbidden,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    conflict,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )
    rateLimited,
    required TResult Function(String? message, String? traceId) unknown,
  }) {
    return notFound(message, errorCode, traceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? traceId)? network,
    TResult? Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult? Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult? Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult? Function(String? message, String? traceId)? unknown,
  }) {
    return notFound?.call(message, errorCode, traceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? traceId)? network,
    TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult Function(String? message, String? traceId)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message, errorCode, traceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(UnauthorizedFailure value) unauthorized,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(ForbiddenFailure value) forbidden,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(RateLimitedFailure value) rateLimited,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UnauthorizedFailure value)? unauthorized,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(ForbiddenFailure value)? forbidden,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(RateLimitedFailure value)? rateLimited,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(UnauthorizedFailure value)? unauthorized,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(ForbiddenFailure value)? forbidden,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(RateLimitedFailure value)? rateLimited,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundFailure implements Failure {
  const factory NotFoundFailure({
    final String? message,
    final String? errorCode,
    final String? traceId,
  }) = _$NotFoundFailureImpl;

  @override
  String? get message;
  String? get errorCode;
  @override
  String? get traceId;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ValidationFailureImplCopyWith(
    _$ValidationFailureImpl value,
    $Res Function(_$ValidationFailureImpl) then,
  ) = __$$ValidationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<String, List<String>> errors,
    String? message,
    String? errorCode,
    String? traceId,
  });
}

/// @nodoc
class __$$ValidationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ValidationFailureImpl>
    implements _$$ValidationFailureImplCopyWith<$Res> {
  __$$ValidationFailureImplCopyWithImpl(
    _$ValidationFailureImpl _value,
    $Res Function(_$ValidationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
    Object? message = freezed,
    Object? errorCode = freezed,
    Object? traceId = freezed,
  }) {
    return _then(
      _$ValidationFailureImpl(
        errors: null == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as Map<String, List<String>>,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorCode: freezed == errorCode
            ? _value.errorCode
            : errorCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        traceId: freezed == traceId
            ? _value.traceId
            : traceId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ValidationFailureImpl implements ValidationFailure {
  const _$ValidationFailureImpl({
    required final Map<String, List<String>> errors,
    this.message,
    this.errorCode,
    this.traceId,
  }) : _errors = errors;

  final Map<String, List<String>> _errors;
  @override
  Map<String, List<String>> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  @override
  final String? message;
  @override
  final String? errorCode;
  @override
  final String? traceId;

  @override
  String toString() {
    return 'Failure.validation(errors: $errors, message: $message, errorCode: $errorCode, traceId: $traceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationFailureImpl &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.traceId, traceId) || other.traceId == traceId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_errors),
    message,
    errorCode,
    traceId,
  );

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      __$$ValidationFailureImplCopyWithImpl<_$ValidationFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? traceId) network,
    required TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )
    server,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    unauthorized,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    notFound,
    required TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )
    validation,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    forbidden,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    conflict,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )
    rateLimited,
    required TResult Function(String? message, String? traceId) unknown,
  }) {
    return validation(errors, message, errorCode, traceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? traceId)? network,
    TResult? Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult? Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult? Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult? Function(String? message, String? traceId)? unknown,
  }) {
    return validation?.call(errors, message, errorCode, traceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? traceId)? network,
    TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult Function(String? message, String? traceId)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(errors, message, errorCode, traceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(UnauthorizedFailure value) unauthorized,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(ForbiddenFailure value) forbidden,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(RateLimitedFailure value) rateLimited,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UnauthorizedFailure value)? unauthorized,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(ForbiddenFailure value)? forbidden,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(RateLimitedFailure value)? rateLimited,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(UnauthorizedFailure value)? unauthorized,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(ForbiddenFailure value)? forbidden,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(RateLimitedFailure value)? rateLimited,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationFailure implements Failure {
  const factory ValidationFailure({
    required final Map<String, List<String>> errors,
    final String? message,
    final String? errorCode,
    final String? traceId,
  }) = _$ValidationFailureImpl;

  Map<String, List<String>> get errors;
  @override
  String? get message;
  String? get errorCode;
  @override
  String? get traceId;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForbiddenFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ForbiddenFailureImplCopyWith(
    _$ForbiddenFailureImpl value,
    $Res Function(_$ForbiddenFailureImpl) then,
  ) = __$$ForbiddenFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? errorCode, String? traceId});
}

/// @nodoc
class __$$ForbiddenFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ForbiddenFailureImpl>
    implements _$$ForbiddenFailureImplCopyWith<$Res> {
  __$$ForbiddenFailureImplCopyWithImpl(
    _$ForbiddenFailureImpl _value,
    $Res Function(_$ForbiddenFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? errorCode = freezed,
    Object? traceId = freezed,
  }) {
    return _then(
      _$ForbiddenFailureImpl(
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorCode: freezed == errorCode
            ? _value.errorCode
            : errorCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        traceId: freezed == traceId
            ? _value.traceId
            : traceId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ForbiddenFailureImpl implements ForbiddenFailure {
  const _$ForbiddenFailureImpl({this.message, this.errorCode, this.traceId});

  @override
  final String? message;
  @override
  final String? errorCode;
  @override
  final String? traceId;

  @override
  String toString() {
    return 'Failure.forbidden(message: $message, errorCode: $errorCode, traceId: $traceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForbiddenFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.traceId, traceId) || other.traceId == traceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, errorCode, traceId);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForbiddenFailureImplCopyWith<_$ForbiddenFailureImpl> get copyWith =>
      __$$ForbiddenFailureImplCopyWithImpl<_$ForbiddenFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? traceId) network,
    required TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )
    server,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    unauthorized,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    notFound,
    required TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )
    validation,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    forbidden,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    conflict,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )
    rateLimited,
    required TResult Function(String? message, String? traceId) unknown,
  }) {
    return forbidden(message, errorCode, traceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? traceId)? network,
    TResult? Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult? Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult? Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult? Function(String? message, String? traceId)? unknown,
  }) {
    return forbidden?.call(message, errorCode, traceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? traceId)? network,
    TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult Function(String? message, String? traceId)? unknown,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden(message, errorCode, traceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(UnauthorizedFailure value) unauthorized,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(ForbiddenFailure value) forbidden,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(RateLimitedFailure value) rateLimited,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return forbidden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UnauthorizedFailure value)? unauthorized,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(ForbiddenFailure value)? forbidden,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(RateLimitedFailure value)? rateLimited,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return forbidden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(UnauthorizedFailure value)? unauthorized,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(ForbiddenFailure value)? forbidden,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(RateLimitedFailure value)? rateLimited,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden(this);
    }
    return orElse();
  }
}

abstract class ForbiddenFailure implements Failure {
  const factory ForbiddenFailure({
    final String? message,
    final String? errorCode,
    final String? traceId,
  }) = _$ForbiddenFailureImpl;

  @override
  String? get message;
  String? get errorCode;
  @override
  String? get traceId;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForbiddenFailureImplCopyWith<_$ForbiddenFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConflictFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ConflictFailureImplCopyWith(
    _$ConflictFailureImpl value,
    $Res Function(_$ConflictFailureImpl) then,
  ) = __$$ConflictFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? errorCode, String? traceId});
}

/// @nodoc
class __$$ConflictFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ConflictFailureImpl>
    implements _$$ConflictFailureImplCopyWith<$Res> {
  __$$ConflictFailureImplCopyWithImpl(
    _$ConflictFailureImpl _value,
    $Res Function(_$ConflictFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? errorCode = freezed,
    Object? traceId = freezed,
  }) {
    return _then(
      _$ConflictFailureImpl(
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorCode: freezed == errorCode
            ? _value.errorCode
            : errorCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        traceId: freezed == traceId
            ? _value.traceId
            : traceId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ConflictFailureImpl implements ConflictFailure {
  const _$ConflictFailureImpl({this.message, this.errorCode, this.traceId});

  @override
  final String? message;
  @override
  final String? errorCode;
  @override
  final String? traceId;

  @override
  String toString() {
    return 'Failure.conflict(message: $message, errorCode: $errorCode, traceId: $traceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConflictFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.traceId, traceId) || other.traceId == traceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, errorCode, traceId);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConflictFailureImplCopyWith<_$ConflictFailureImpl> get copyWith =>
      __$$ConflictFailureImplCopyWithImpl<_$ConflictFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? traceId) network,
    required TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )
    server,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    unauthorized,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    notFound,
    required TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )
    validation,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    forbidden,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    conflict,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )
    rateLimited,
    required TResult Function(String? message, String? traceId) unknown,
  }) {
    return conflict(message, errorCode, traceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? traceId)? network,
    TResult? Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult? Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult? Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult? Function(String? message, String? traceId)? unknown,
  }) {
    return conflict?.call(message, errorCode, traceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? traceId)? network,
    TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult Function(String? message, String? traceId)? unknown,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict(message, errorCode, traceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(UnauthorizedFailure value) unauthorized,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(ForbiddenFailure value) forbidden,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(RateLimitedFailure value) rateLimited,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return conflict(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UnauthorizedFailure value)? unauthorized,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(ForbiddenFailure value)? forbidden,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(RateLimitedFailure value)? rateLimited,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return conflict?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(UnauthorizedFailure value)? unauthorized,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(ForbiddenFailure value)? forbidden,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(RateLimitedFailure value)? rateLimited,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict(this);
    }
    return orElse();
  }
}

abstract class ConflictFailure implements Failure {
  const factory ConflictFailure({
    final String? message,
    final String? errorCode,
    final String? traceId,
  }) = _$ConflictFailureImpl;

  @override
  String? get message;
  String? get errorCode;
  @override
  String? get traceId;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConflictFailureImplCopyWith<_$ConflictFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RateLimitedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$RateLimitedFailureImplCopyWith(
    _$RateLimitedFailureImpl value,
    $Res Function(_$RateLimitedFailureImpl) then,
  ) = __$$RateLimitedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? message,
    String? errorCode,
    String? traceId,
    int? retryAfter,
  });
}

/// @nodoc
class __$$RateLimitedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$RateLimitedFailureImpl>
    implements _$$RateLimitedFailureImplCopyWith<$Res> {
  __$$RateLimitedFailureImplCopyWithImpl(
    _$RateLimitedFailureImpl _value,
    $Res Function(_$RateLimitedFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? errorCode = freezed,
    Object? traceId = freezed,
    Object? retryAfter = freezed,
  }) {
    return _then(
      _$RateLimitedFailureImpl(
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorCode: freezed == errorCode
            ? _value.errorCode
            : errorCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        traceId: freezed == traceId
            ? _value.traceId
            : traceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        retryAfter: freezed == retryAfter
            ? _value.retryAfter
            : retryAfter // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$RateLimitedFailureImpl implements RateLimitedFailure {
  const _$RateLimitedFailureImpl({
    this.message,
    this.errorCode,
    this.traceId,
    this.retryAfter,
  });

  @override
  final String? message;
  @override
  final String? errorCode;
  @override
  final String? traceId;
  @override
  final int? retryAfter;

  @override
  String toString() {
    return 'Failure.rateLimited(message: $message, errorCode: $errorCode, traceId: $traceId, retryAfter: $retryAfter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateLimitedFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.traceId, traceId) || other.traceId == traceId) &&
            (identical(other.retryAfter, retryAfter) ||
                other.retryAfter == retryAfter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, errorCode, traceId, retryAfter);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RateLimitedFailureImplCopyWith<_$RateLimitedFailureImpl> get copyWith =>
      __$$RateLimitedFailureImplCopyWithImpl<_$RateLimitedFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? traceId) network,
    required TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )
    server,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    unauthorized,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    notFound,
    required TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )
    validation,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    forbidden,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    conflict,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )
    rateLimited,
    required TResult Function(String? message, String? traceId) unknown,
  }) {
    return rateLimited(message, errorCode, traceId, retryAfter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? traceId)? network,
    TResult? Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult? Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult? Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult? Function(String? message, String? traceId)? unknown,
  }) {
    return rateLimited?.call(message, errorCode, traceId, retryAfter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? traceId)? network,
    TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult Function(String? message, String? traceId)? unknown,
    required TResult orElse(),
  }) {
    if (rateLimited != null) {
      return rateLimited(message, errorCode, traceId, retryAfter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(UnauthorizedFailure value) unauthorized,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(ForbiddenFailure value) forbidden,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(RateLimitedFailure value) rateLimited,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return rateLimited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UnauthorizedFailure value)? unauthorized,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(ForbiddenFailure value)? forbidden,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(RateLimitedFailure value)? rateLimited,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return rateLimited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(UnauthorizedFailure value)? unauthorized,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(ForbiddenFailure value)? forbidden,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(RateLimitedFailure value)? rateLimited,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (rateLimited != null) {
      return rateLimited(this);
    }
    return orElse();
  }
}

abstract class RateLimitedFailure implements Failure {
  const factory RateLimitedFailure({
    final String? message,
    final String? errorCode,
    final String? traceId,
    final int? retryAfter,
  }) = _$RateLimitedFailureImpl;

  @override
  String? get message;
  String? get errorCode;
  @override
  String? get traceId;
  int? get retryAfter;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RateLimitedFailureImplCopyWith<_$RateLimitedFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnknownFailureImplCopyWith(
    _$UnknownFailureImpl value,
    $Res Function(_$UnknownFailureImpl) then,
  ) = __$$UnknownFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? traceId});
}

/// @nodoc
class __$$UnknownFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnknownFailureImpl>
    implements _$$UnknownFailureImplCopyWith<$Res> {
  __$$UnknownFailureImplCopyWithImpl(
    _$UnknownFailureImpl _value,
    $Res Function(_$UnknownFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed, Object? traceId = freezed}) {
    return _then(
      _$UnknownFailureImpl(
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        traceId: freezed == traceId
            ? _value.traceId
            : traceId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UnknownFailureImpl implements UnknownFailure {
  const _$UnknownFailureImpl({this.message, this.traceId});

  @override
  final String? message;
  @override
  final String? traceId;

  @override
  String toString() {
    return 'Failure.unknown(message: $message, traceId: $traceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.traceId, traceId) || other.traceId == traceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, traceId);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      __$$UnknownFailureImplCopyWithImpl<_$UnknownFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? traceId) network,
    required TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )
    server,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    unauthorized,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    notFound,
    required TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )
    validation,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    forbidden,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
    )
    conflict,
    required TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )
    rateLimited,
    required TResult Function(String? message, String? traceId) unknown,
  }) {
    return unknown(message, traceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? traceId)? network,
    TResult? Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult? Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult? Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult? Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult? Function(String? message, String? traceId)? unknown,
  }) {
    return unknown?.call(message, traceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? traceId)? network,
    TResult Function(
      int code,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    server,
    TResult Function(String? message, String? errorCode, String? traceId)?
    unauthorized,
    TResult Function(String? message, String? errorCode, String? traceId)?
    notFound,
    TResult Function(
      Map<String, List<String>> errors,
      String? message,
      String? errorCode,
      String? traceId,
    )?
    validation,
    TResult Function(String? message, String? errorCode, String? traceId)?
    forbidden,
    TResult Function(String? message, String? errorCode, String? traceId)?
    conflict,
    TResult Function(
      String? message,
      String? errorCode,
      String? traceId,
      int? retryAfter,
    )?
    rateLimited,
    TResult Function(String? message, String? traceId)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message, traceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ServerFailure value) server,
    required TResult Function(UnauthorizedFailure value) unauthorized,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(ForbiddenFailure value) forbidden,
    required TResult Function(ConflictFailure value) conflict,
    required TResult Function(RateLimitedFailure value) rateLimited,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UnauthorizedFailure value)? unauthorized,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(ForbiddenFailure value)? forbidden,
    TResult? Function(ConflictFailure value)? conflict,
    TResult? Function(RateLimitedFailure value)? rateLimited,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(ServerFailure value)? server,
    TResult Function(UnauthorizedFailure value)? unauthorized,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(ForbiddenFailure value)? forbidden,
    TResult Function(ConflictFailure value)? conflict,
    TResult Function(RateLimitedFailure value)? rateLimited,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownFailure implements Failure {
  const factory UnknownFailure({final String? message, final String? traceId}) =
      _$UnknownFailureImpl;

  @override
  String? get message;
  @override
  String? get traceId;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
