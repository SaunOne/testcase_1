// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cache_policy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CachePolicy {
  int get ttlSeconds => throw _privateConstructorUsedError;
  bool get swr => throw _privateConstructorUsedError;
  bool get showStaleWithIndicator => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  /// Create a copy of CachePolicy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CachePolicyCopyWith<CachePolicy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CachePolicyCopyWith<$Res> {
  factory $CachePolicyCopyWith(
    CachePolicy value,
    $Res Function(CachePolicy) then,
  ) = _$CachePolicyCopyWithImpl<$Res, CachePolicy>;
  @useResult
  $Res call({
    int ttlSeconds,
    bool swr,
    bool showStaleWithIndicator,
    List<String> tags,
  });
}

/// @nodoc
class _$CachePolicyCopyWithImpl<$Res, $Val extends CachePolicy>
    implements $CachePolicyCopyWith<$Res> {
  _$CachePolicyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CachePolicy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ttlSeconds = null,
    Object? swr = null,
    Object? showStaleWithIndicator = null,
    Object? tags = null,
  }) {
    return _then(
      _value.copyWith(
            ttlSeconds: null == ttlSeconds
                ? _value.ttlSeconds
                : ttlSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            swr: null == swr
                ? _value.swr
                : swr // ignore: cast_nullable_to_non_nullable
                      as bool,
            showStaleWithIndicator: null == showStaleWithIndicator
                ? _value.showStaleWithIndicator
                : showStaleWithIndicator // ignore: cast_nullable_to_non_nullable
                      as bool,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CachePolicyImplCopyWith<$Res>
    implements $CachePolicyCopyWith<$Res> {
  factory _$$CachePolicyImplCopyWith(
    _$CachePolicyImpl value,
    $Res Function(_$CachePolicyImpl) then,
  ) = __$$CachePolicyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int ttlSeconds,
    bool swr,
    bool showStaleWithIndicator,
    List<String> tags,
  });
}

/// @nodoc
class __$$CachePolicyImplCopyWithImpl<$Res>
    extends _$CachePolicyCopyWithImpl<$Res, _$CachePolicyImpl>
    implements _$$CachePolicyImplCopyWith<$Res> {
  __$$CachePolicyImplCopyWithImpl(
    _$CachePolicyImpl _value,
    $Res Function(_$CachePolicyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CachePolicy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ttlSeconds = null,
    Object? swr = null,
    Object? showStaleWithIndicator = null,
    Object? tags = null,
  }) {
    return _then(
      _$CachePolicyImpl(
        ttlSeconds: null == ttlSeconds
            ? _value.ttlSeconds
            : ttlSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        swr: null == swr
            ? _value.swr
            : swr // ignore: cast_nullable_to_non_nullable
                  as bool,
        showStaleWithIndicator: null == showStaleWithIndicator
            ? _value.showStaleWithIndicator
            : showStaleWithIndicator // ignore: cast_nullable_to_non_nullable
                  as bool,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$CachePolicyImpl extends _CachePolicy {
  const _$CachePolicyImpl({
    this.ttlSeconds = 60,
    this.swr = false,
    this.showStaleWithIndicator = true,
    final List<String> tags = const [],
  }) : _tags = tags,
       super._();

  @override
  @JsonKey()
  final int ttlSeconds;
  @override
  @JsonKey()
  final bool swr;
  @override
  @JsonKey()
  final bool showStaleWithIndicator;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'CachePolicy(ttlSeconds: $ttlSeconds, swr: $swr, showStaleWithIndicator: $showStaleWithIndicator, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CachePolicyImpl &&
            (identical(other.ttlSeconds, ttlSeconds) ||
                other.ttlSeconds == ttlSeconds) &&
            (identical(other.swr, swr) || other.swr == swr) &&
            (identical(other.showStaleWithIndicator, showStaleWithIndicator) ||
                other.showStaleWithIndicator == showStaleWithIndicator) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    ttlSeconds,
    swr,
    showStaleWithIndicator,
    const DeepCollectionEquality().hash(_tags),
  );

  /// Create a copy of CachePolicy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CachePolicyImplCopyWith<_$CachePolicyImpl> get copyWith =>
      __$$CachePolicyImplCopyWithImpl<_$CachePolicyImpl>(this, _$identity);
}

abstract class _CachePolicy extends CachePolicy {
  const factory _CachePolicy({
    final int ttlSeconds,
    final bool swr,
    final bool showStaleWithIndicator,
    final List<String> tags,
  }) = _$CachePolicyImpl;
  const _CachePolicy._() : super._();

  @override
  int get ttlSeconds;
  @override
  bool get swr;
  @override
  bool get showStaleWithIndicator;
  @override
  List<String> get tags;

  /// Create a copy of CachePolicy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CachePolicyImplCopyWith<_$CachePolicyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
