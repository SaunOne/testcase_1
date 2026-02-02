// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mutation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MutationState<T> {
  /// Data hasil mutation (bisa null jika belum mutate atau error)
  T? get data => throw _privateConstructorUsedError;

  /// Status mutation saat ini
  MutationStatus get status => throw _privateConstructorUsedError;

  /// Error message jika status == error
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MutationStateCopyWith<T, MutationState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MutationStateCopyWith<T, $Res> {
  factory $MutationStateCopyWith(
    MutationState<T> value,
    $Res Function(MutationState<T>) then,
  ) = _$MutationStateCopyWithImpl<T, $Res, MutationState<T>>;
  @useResult
  $Res call({T? data, MutationStatus status, String? errorMessage});
}

/// @nodoc
class _$MutationStateCopyWithImpl<T, $Res, $Val extends MutationState<T>>
    implements $MutationStateCopyWith<T, $Res> {
  _$MutationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
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
                      as MutationStatus,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MutationStateImplCopyWith<T, $Res>
    implements $MutationStateCopyWith<T, $Res> {
  factory _$$MutationStateImplCopyWith(
    _$MutationStateImpl<T> value,
    $Res Function(_$MutationStateImpl<T>) then,
  ) = __$$MutationStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? data, MutationStatus status, String? errorMessage});
}

/// @nodoc
class __$$MutationStateImplCopyWithImpl<T, $Res>
    extends _$MutationStateCopyWithImpl<T, $Res, _$MutationStateImpl<T>>
    implements _$$MutationStateImplCopyWith<T, $Res> {
  __$$MutationStateImplCopyWithImpl(
    _$MutationStateImpl<T> _value,
    $Res Function(_$MutationStateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$MutationStateImpl<T>(
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MutationStatus,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$MutationStateImpl<T> extends _MutationState<T> {
  const _$MutationStateImpl({
    this.data,
    this.status = MutationStatus.idle,
    this.errorMessage,
  }) : super._();

  /// Data hasil mutation (bisa null jika belum mutate atau error)
  @override
  final T? data;

  /// Status mutation saat ini
  @override
  @JsonKey()
  final MutationStatus status;

  /// Error message jika status == error
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'MutationState<$T>(data: $data, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MutationStateImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(data),
    status,
    errorMessage,
  );

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MutationStateImplCopyWith<T, _$MutationStateImpl<T>> get copyWith =>
      __$$MutationStateImplCopyWithImpl<T, _$MutationStateImpl<T>>(
        this,
        _$identity,
      );
}

abstract class _MutationState<T> extends MutationState<T> {
  const factory _MutationState({
    final T? data,
    final MutationStatus status,
    final String? errorMessage,
  }) = _$MutationStateImpl<T>;
  const _MutationState._() : super._();

  /// Data hasil mutation (bisa null jika belum mutate atau error)
  @override
  T? get data;

  /// Status mutation saat ini
  @override
  MutationStatus get status;

  /// Error message jika status == error
  @override
  String? get errorMessage;

  /// Create a copy of MutationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MutationStateImplCopyWith<T, _$MutationStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
