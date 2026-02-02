// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QueryState<T> {
  /// Data hasil fetch (bisa null jika belum fetch atau error)
  T? get data => throw _privateConstructorUsedError;

  /// Status query saat ini
  QueryStatus get status => throw _privateConstructorUsedError;

  /// Error message jika status == error
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Timestamp terakhir data di-update
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  /// True jika data dari cache yang sudah expired
  bool get isStale => throw _privateConstructorUsedError;

  /// True jika response dari cache (bukan fresh dari API)
  bool get isFromCache => throw _privateConstructorUsedError;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueryStateCopyWith<T, QueryState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryStateCopyWith<T, $Res> {
  factory $QueryStateCopyWith(
    QueryState<T> value,
    $Res Function(QueryState<T>) then,
  ) = _$QueryStateCopyWithImpl<T, $Res, QueryState<T>>;
  @useResult
  $Res call({
    T? data,
    QueryStatus status,
    String? errorMessage,
    DateTime? lastUpdated,
    bool isStale,
    bool isFromCache,
  });
}

/// @nodoc
class _$QueryStateCopyWithImpl<T, $Res, $Val extends QueryState<T>>
    implements $QueryStateCopyWith<T, $Res> {
  _$QueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
    Object? lastUpdated = freezed,
    Object? isStale = null,
    Object? isFromCache = null,
  }) {
    return _then(
      _value.copyWith(
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as T?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as QueryStatus,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastUpdated: freezed == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isStale: null == isStale
                ? _value.isStale
                : isStale // ignore: cast_nullable_to_non_nullable
                      as bool,
            isFromCache: null == isFromCache
                ? _value.isFromCache
                : isFromCache // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QueryStateImplCopyWith<T, $Res>
    implements $QueryStateCopyWith<T, $Res> {
  factory _$$QueryStateImplCopyWith(
    _$QueryStateImpl<T> value,
    $Res Function(_$QueryStateImpl<T>) then,
  ) = __$$QueryStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    T? data,
    QueryStatus status,
    String? errorMessage,
    DateTime? lastUpdated,
    bool isStale,
    bool isFromCache,
  });
}

/// @nodoc
class __$$QueryStateImplCopyWithImpl<T, $Res>
    extends _$QueryStateCopyWithImpl<T, $Res, _$QueryStateImpl<T>>
    implements _$$QueryStateImplCopyWith<T, $Res> {
  __$$QueryStateImplCopyWithImpl(
    _$QueryStateImpl<T> _value,
    $Res Function(_$QueryStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
    Object? lastUpdated = freezed,
    Object? isStale = null,
    Object? isFromCache = null,
  }) {
    return _then(
      _$QueryStateImpl<T>(
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as QueryStatus,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastUpdated: freezed == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isStale: null == isStale
            ? _value.isStale
            : isStale // ignore: cast_nullable_to_non_nullable
                  as bool,
        isFromCache: null == isFromCache
            ? _value.isFromCache
            : isFromCache // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$QueryStateImpl<T> extends _QueryState<T> {
  const _$QueryStateImpl({
    this.data,
    this.status = QueryStatus.idle,
    this.errorMessage,
    this.lastUpdated,
    this.isStale = false,
    this.isFromCache = false,
  }) : super._();

  /// Data hasil fetch (bisa null jika belum fetch atau error)
  @override
  final T? data;

  /// Status query saat ini
  @override
  @JsonKey()
  final QueryStatus status;

  /// Error message jika status == error
  @override
  final String? errorMessage;

  /// Timestamp terakhir data di-update
  @override
  final DateTime? lastUpdated;

  /// True jika data dari cache yang sudah expired
  @override
  @JsonKey()
  final bool isStale;

  /// True jika response dari cache (bukan fresh dari API)
  @override
  @JsonKey()
  final bool isFromCache;

  @override
  String toString() {
    return 'QueryState<$T>(data: $data, status: $status, errorMessage: $errorMessage, lastUpdated: $lastUpdated, isStale: $isStale, isFromCache: $isFromCache)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryStateImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.isStale, isStale) || other.isStale == isStale) &&
            (identical(other.isFromCache, isFromCache) ||
                other.isFromCache == isFromCache));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(data),
    status,
    errorMessage,
    lastUpdated,
    isStale,
    isFromCache,
  );

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryStateImplCopyWith<T, _$QueryStateImpl<T>> get copyWith =>
      __$$QueryStateImplCopyWithImpl<T, _$QueryStateImpl<T>>(this, _$identity);
}

abstract class _QueryState<T> extends QueryState<T> {
  const factory _QueryState({
    final T? data,
    final QueryStatus status,
    final String? errorMessage,
    final DateTime? lastUpdated,
    final bool isStale,
    final bool isFromCache,
  }) = _$QueryStateImpl<T>;
  const _QueryState._() : super._();

  /// Data hasil fetch (bisa null jika belum fetch atau error)
  @override
  T? get data;

  /// Status query saat ini
  @override
  QueryStatus get status;

  /// Error message jika status == error
  @override
  String? get errorMessage;

  /// Timestamp terakhir data di-update
  @override
  DateTime? get lastUpdated;

  /// True jika data dari cache yang sudah expired
  @override
  bool get isStale;

  /// True jika response dari cache (bukan fresh dari API)
  @override
  bool get isFromCache;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueryStateImplCopyWith<T, _$QueryStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
