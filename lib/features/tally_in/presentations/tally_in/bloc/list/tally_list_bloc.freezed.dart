// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tally_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TallyListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String itemId, double totalWeight, int totalPcs)
    updateItemTotals,
    required TResult Function(String itemId) finishItem,
    required TResult Function(Map<String, TallyItem> items) updateItems,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String itemId, double totalWeight, int totalPcs)?
    updateItemTotals,
    TResult? Function(String itemId)? finishItem,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String itemId, double totalWeight, int totalPcs)?
    updateItemTotals,
    TResult Function(String itemId)? finishItem,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_UpdateItemTotals value) updateItemTotals,
    required TResult Function(_FinishItem value) finishItem,
    required TResult Function(_UpdateItems value) updateItems,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_UpdateItemTotals value)? updateItemTotals,
    TResult? Function(_FinishItem value)? finishItem,
    TResult? Function(_UpdateItems value)? updateItems,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_UpdateItemTotals value)? updateItemTotals,
    TResult Function(_FinishItem value)? finishItem,
    TResult Function(_UpdateItems value)? updateItems,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TallyListEventCopyWith<$Res> {
  factory $TallyListEventCopyWith(
    TallyListEvent value,
    $Res Function(TallyListEvent) then,
  ) = _$TallyListEventCopyWithImpl<$Res, TallyListEvent>;
}

/// @nodoc
class _$TallyListEventCopyWithImpl<$Res, $Val extends TallyListEvent>
    implements $TallyListEventCopyWith<$Res> {
  _$TallyListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, TallyItem> items});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$TallyListEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$StartedImpl(
        null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as Map<String, TallyItem>,
      ),
    );
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl(final Map<String, TallyItem> items) : _items = items;

  final Map<String, TallyItem> _items;
  @override
  Map<String, TallyItem> get items {
    if (_items is EqualUnmodifiableMapView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_items);
  }

  @override
  String toString() {
    return 'TallyListEvent.started(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String itemId, double totalWeight, int totalPcs)
    updateItemTotals,
    required TResult Function(String itemId) finishItem,
    required TResult Function(Map<String, TallyItem> items) updateItems,
  }) {
    return started(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String itemId, double totalWeight, int totalPcs)?
    updateItemTotals,
    TResult? Function(String itemId)? finishItem,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
  }) {
    return started?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String itemId, double totalWeight, int totalPcs)?
    updateItemTotals,
    TResult Function(String itemId)? finishItem,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_UpdateItemTotals value) updateItemTotals,
    required TResult Function(_FinishItem value) finishItem,
    required TResult Function(_UpdateItems value) updateItems,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_UpdateItemTotals value)? updateItemTotals,
    TResult? Function(_FinishItem value)? finishItem,
    TResult? Function(_UpdateItems value)? updateItems,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_UpdateItemTotals value)? updateItemTotals,
    TResult Function(_FinishItem value)? finishItem,
    TResult Function(_UpdateItems value)? updateItems,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TallyListEvent {
  const factory _Started(final Map<String, TallyItem> items) = _$StartedImpl;

  Map<String, TallyItem> get items;

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectItemImplCopyWith<$Res> {
  factory _$$SelectItemImplCopyWith(
    _$SelectItemImpl value,
    $Res Function(_$SelectItemImpl) then,
  ) = __$$SelectItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String itemId});
}

/// @nodoc
class __$$SelectItemImplCopyWithImpl<$Res>
    extends _$TallyListEventCopyWithImpl<$Res, _$SelectItemImpl>
    implements _$$SelectItemImplCopyWith<$Res> {
  __$$SelectItemImplCopyWithImpl(
    _$SelectItemImpl _value,
    $Res Function(_$SelectItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? itemId = null}) {
    return _then(
      _$SelectItemImpl(
        null == itemId
            ? _value.itemId
            : itemId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SelectItemImpl implements _SelectItem {
  const _$SelectItemImpl(this.itemId);

  @override
  final String itemId;

  @override
  String toString() {
    return 'TallyListEvent.selectItem(itemId: $itemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId);

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectItemImplCopyWith<_$SelectItemImpl> get copyWith =>
      __$$SelectItemImplCopyWithImpl<_$SelectItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String itemId, double totalWeight, int totalPcs)
    updateItemTotals,
    required TResult Function(String itemId) finishItem,
    required TResult Function(Map<String, TallyItem> items) updateItems,
  }) {
    return selectItem(itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String itemId, double totalWeight, int totalPcs)?
    updateItemTotals,
    TResult? Function(String itemId)? finishItem,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
  }) {
    return selectItem?.call(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String itemId, double totalWeight, int totalPcs)?
    updateItemTotals,
    TResult Function(String itemId)? finishItem,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    required TResult orElse(),
  }) {
    if (selectItem != null) {
      return selectItem(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_UpdateItemTotals value) updateItemTotals,
    required TResult Function(_FinishItem value) finishItem,
    required TResult Function(_UpdateItems value) updateItems,
  }) {
    return selectItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_UpdateItemTotals value)? updateItemTotals,
    TResult? Function(_FinishItem value)? finishItem,
    TResult? Function(_UpdateItems value)? updateItems,
  }) {
    return selectItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_UpdateItemTotals value)? updateItemTotals,
    TResult Function(_FinishItem value)? finishItem,
    TResult Function(_UpdateItems value)? updateItems,
    required TResult orElse(),
  }) {
    if (selectItem != null) {
      return selectItem(this);
    }
    return orElse();
  }
}

abstract class _SelectItem implements TallyListEvent {
  const factory _SelectItem(final String itemId) = _$SelectItemImpl;

  String get itemId;

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectItemImplCopyWith<_$SelectItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateItemTotalsImplCopyWith<$Res> {
  factory _$$UpdateItemTotalsImplCopyWith(
    _$UpdateItemTotalsImpl value,
    $Res Function(_$UpdateItemTotalsImpl) then,
  ) = __$$UpdateItemTotalsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String itemId, double totalWeight, int totalPcs});
}

/// @nodoc
class __$$UpdateItemTotalsImplCopyWithImpl<$Res>
    extends _$TallyListEventCopyWithImpl<$Res, _$UpdateItemTotalsImpl>
    implements _$$UpdateItemTotalsImplCopyWith<$Res> {
  __$$UpdateItemTotalsImplCopyWithImpl(
    _$UpdateItemTotalsImpl _value,
    $Res Function(_$UpdateItemTotalsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? totalWeight = null,
    Object? totalPcs = null,
  }) {
    return _then(
      _$UpdateItemTotalsImpl(
        itemId: null == itemId
            ? _value.itemId
            : itemId // ignore: cast_nullable_to_non_nullable
                  as String,
        totalWeight: null == totalWeight
            ? _value.totalWeight
            : totalWeight // ignore: cast_nullable_to_non_nullable
                  as double,
        totalPcs: null == totalPcs
            ? _value.totalPcs
            : totalPcs // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$UpdateItemTotalsImpl implements _UpdateItemTotals {
  const _$UpdateItemTotalsImpl({
    required this.itemId,
    required this.totalWeight,
    required this.totalPcs,
  });

  @override
  final String itemId;
  @override
  final double totalWeight;
  @override
  final int totalPcs;

  @override
  String toString() {
    return 'TallyListEvent.updateItemTotals(itemId: $itemId, totalWeight: $totalWeight, totalPcs: $totalPcs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateItemTotalsImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.totalWeight, totalWeight) ||
                other.totalWeight == totalWeight) &&
            (identical(other.totalPcs, totalPcs) ||
                other.totalPcs == totalPcs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId, totalWeight, totalPcs);

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateItemTotalsImplCopyWith<_$UpdateItemTotalsImpl> get copyWith =>
      __$$UpdateItemTotalsImplCopyWithImpl<_$UpdateItemTotalsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String itemId, double totalWeight, int totalPcs)
    updateItemTotals,
    required TResult Function(String itemId) finishItem,
    required TResult Function(Map<String, TallyItem> items) updateItems,
  }) {
    return updateItemTotals(itemId, totalWeight, totalPcs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String itemId, double totalWeight, int totalPcs)?
    updateItemTotals,
    TResult? Function(String itemId)? finishItem,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
  }) {
    return updateItemTotals?.call(itemId, totalWeight, totalPcs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String itemId, double totalWeight, int totalPcs)?
    updateItemTotals,
    TResult Function(String itemId)? finishItem,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    required TResult orElse(),
  }) {
    if (updateItemTotals != null) {
      return updateItemTotals(itemId, totalWeight, totalPcs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_UpdateItemTotals value) updateItemTotals,
    required TResult Function(_FinishItem value) finishItem,
    required TResult Function(_UpdateItems value) updateItems,
  }) {
    return updateItemTotals(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_UpdateItemTotals value)? updateItemTotals,
    TResult? Function(_FinishItem value)? finishItem,
    TResult? Function(_UpdateItems value)? updateItems,
  }) {
    return updateItemTotals?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_UpdateItemTotals value)? updateItemTotals,
    TResult Function(_FinishItem value)? finishItem,
    TResult Function(_UpdateItems value)? updateItems,
    required TResult orElse(),
  }) {
    if (updateItemTotals != null) {
      return updateItemTotals(this);
    }
    return orElse();
  }
}

abstract class _UpdateItemTotals implements TallyListEvent {
  const factory _UpdateItemTotals({
    required final String itemId,
    required final double totalWeight,
    required final int totalPcs,
  }) = _$UpdateItemTotalsImpl;

  String get itemId;
  double get totalWeight;
  int get totalPcs;

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateItemTotalsImplCopyWith<_$UpdateItemTotalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FinishItemImplCopyWith<$Res> {
  factory _$$FinishItemImplCopyWith(
    _$FinishItemImpl value,
    $Res Function(_$FinishItemImpl) then,
  ) = __$$FinishItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String itemId});
}

/// @nodoc
class __$$FinishItemImplCopyWithImpl<$Res>
    extends _$TallyListEventCopyWithImpl<$Res, _$FinishItemImpl>
    implements _$$FinishItemImplCopyWith<$Res> {
  __$$FinishItemImplCopyWithImpl(
    _$FinishItemImpl _value,
    $Res Function(_$FinishItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? itemId = null}) {
    return _then(
      _$FinishItemImpl(
        null == itemId
            ? _value.itemId
            : itemId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FinishItemImpl implements _FinishItem {
  const _$FinishItemImpl(this.itemId);

  @override
  final String itemId;

  @override
  String toString() {
    return 'TallyListEvent.finishItem(itemId: $itemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinishItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId);

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinishItemImplCopyWith<_$FinishItemImpl> get copyWith =>
      __$$FinishItemImplCopyWithImpl<_$FinishItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String itemId, double totalWeight, int totalPcs)
    updateItemTotals,
    required TResult Function(String itemId) finishItem,
    required TResult Function(Map<String, TallyItem> items) updateItems,
  }) {
    return finishItem(itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String itemId, double totalWeight, int totalPcs)?
    updateItemTotals,
    TResult? Function(String itemId)? finishItem,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
  }) {
    return finishItem?.call(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String itemId, double totalWeight, int totalPcs)?
    updateItemTotals,
    TResult Function(String itemId)? finishItem,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    required TResult orElse(),
  }) {
    if (finishItem != null) {
      return finishItem(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_UpdateItemTotals value) updateItemTotals,
    required TResult Function(_FinishItem value) finishItem,
    required TResult Function(_UpdateItems value) updateItems,
  }) {
    return finishItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_UpdateItemTotals value)? updateItemTotals,
    TResult? Function(_FinishItem value)? finishItem,
    TResult? Function(_UpdateItems value)? updateItems,
  }) {
    return finishItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_UpdateItemTotals value)? updateItemTotals,
    TResult Function(_FinishItem value)? finishItem,
    TResult Function(_UpdateItems value)? updateItems,
    required TResult orElse(),
  }) {
    if (finishItem != null) {
      return finishItem(this);
    }
    return orElse();
  }
}

abstract class _FinishItem implements TallyListEvent {
  const factory _FinishItem(final String itemId) = _$FinishItemImpl;

  String get itemId;

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinishItemImplCopyWith<_$FinishItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateItemsImplCopyWith<$Res> {
  factory _$$UpdateItemsImplCopyWith(
    _$UpdateItemsImpl value,
    $Res Function(_$UpdateItemsImpl) then,
  ) = __$$UpdateItemsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, TallyItem> items});
}

/// @nodoc
class __$$UpdateItemsImplCopyWithImpl<$Res>
    extends _$TallyListEventCopyWithImpl<$Res, _$UpdateItemsImpl>
    implements _$$UpdateItemsImplCopyWith<$Res> {
  __$$UpdateItemsImplCopyWithImpl(
    _$UpdateItemsImpl _value,
    $Res Function(_$UpdateItemsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$UpdateItemsImpl(
        null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as Map<String, TallyItem>,
      ),
    );
  }
}

/// @nodoc

class _$UpdateItemsImpl implements _UpdateItems {
  const _$UpdateItemsImpl(final Map<String, TallyItem> items) : _items = items;

  final Map<String, TallyItem> _items;
  @override
  Map<String, TallyItem> get items {
    if (_items is EqualUnmodifiableMapView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_items);
  }

  @override
  String toString() {
    return 'TallyListEvent.updateItems(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateItemsImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateItemsImplCopyWith<_$UpdateItemsImpl> get copyWith =>
      __$$UpdateItemsImplCopyWithImpl<_$UpdateItemsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String itemId, double totalWeight, int totalPcs)
    updateItemTotals,
    required TResult Function(String itemId) finishItem,
    required TResult Function(Map<String, TallyItem> items) updateItems,
  }) {
    return updateItems(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String itemId, double totalWeight, int totalPcs)?
    updateItemTotals,
    TResult? Function(String itemId)? finishItem,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
  }) {
    return updateItems?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String itemId, double totalWeight, int totalPcs)?
    updateItemTotals,
    TResult Function(String itemId)? finishItem,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    required TResult orElse(),
  }) {
    if (updateItems != null) {
      return updateItems(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_UpdateItemTotals value) updateItemTotals,
    required TResult Function(_FinishItem value) finishItem,
    required TResult Function(_UpdateItems value) updateItems,
  }) {
    return updateItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_UpdateItemTotals value)? updateItemTotals,
    TResult? Function(_FinishItem value)? finishItem,
    TResult? Function(_UpdateItems value)? updateItems,
  }) {
    return updateItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_UpdateItemTotals value)? updateItemTotals,
    TResult Function(_FinishItem value)? finishItem,
    TResult Function(_UpdateItems value)? updateItems,
    required TResult orElse(),
  }) {
    if (updateItems != null) {
      return updateItems(this);
    }
    return orElse();
  }
}

abstract class _UpdateItems implements TallyListEvent {
  const factory _UpdateItems(final Map<String, TallyItem> items) =
      _$UpdateItemsImpl;

  Map<String, TallyItem> get items;

  /// Create a copy of TallyListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateItemsImplCopyWith<_$UpdateItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TallyListState {
  /// All items data
  Map<String, TallyItem> get items => throw _privateConstructorUsedError;

  /// Currently active item ID
  String? get activeItemId => throw _privateConstructorUsedError;

  /// Loading state
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of TallyListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TallyListStateCopyWith<TallyListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TallyListStateCopyWith<$Res> {
  factory $TallyListStateCopyWith(
    TallyListState value,
    $Res Function(TallyListState) then,
  ) = _$TallyListStateCopyWithImpl<$Res, TallyListState>;
  @useResult
  $Res call({
    Map<String, TallyItem> items,
    String? activeItemId,
    bool isLoading,
  });
}

/// @nodoc
class _$TallyListStateCopyWithImpl<$Res, $Val extends TallyListState>
    implements $TallyListStateCopyWith<$Res> {
  _$TallyListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TallyListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? activeItemId = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as Map<String, TallyItem>,
            activeItemId: freezed == activeItemId
                ? _value.activeItemId
                : activeItemId // ignore: cast_nullable_to_non_nullable
                      as String?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TallyListStateImplCopyWith<$Res>
    implements $TallyListStateCopyWith<$Res> {
  factory _$$TallyListStateImplCopyWith(
    _$TallyListStateImpl value,
    $Res Function(_$TallyListStateImpl) then,
  ) = __$$TallyListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<String, TallyItem> items,
    String? activeItemId,
    bool isLoading,
  });
}

/// @nodoc
class __$$TallyListStateImplCopyWithImpl<$Res>
    extends _$TallyListStateCopyWithImpl<$Res, _$TallyListStateImpl>
    implements _$$TallyListStateImplCopyWith<$Res> {
  __$$TallyListStateImplCopyWithImpl(
    _$TallyListStateImpl _value,
    $Res Function(_$TallyListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? activeItemId = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _$TallyListStateImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as Map<String, TallyItem>,
        activeItemId: freezed == activeItemId
            ? _value.activeItemId
            : activeItemId // ignore: cast_nullable_to_non_nullable
                  as String?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$TallyListStateImpl extends _TallyListState {
  const _$TallyListStateImpl({
    final Map<String, TallyItem> items = const {},
    this.activeItemId = null,
    this.isLoading = false,
  }) : _items = items,
       super._();

  /// All items data
  final Map<String, TallyItem> _items;

  /// All items data
  @override
  @JsonKey()
  Map<String, TallyItem> get items {
    if (_items is EqualUnmodifiableMapView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_items);
  }

  /// Currently active item ID
  @override
  @JsonKey()
  final String? activeItemId;

  /// Loading state
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'TallyListState(items: $items, activeItemId: $activeItemId, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TallyListStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.activeItemId, activeItemId) ||
                other.activeItemId == activeItemId) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    activeItemId,
    isLoading,
  );

  /// Create a copy of TallyListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TallyListStateImplCopyWith<_$TallyListStateImpl> get copyWith =>
      __$$TallyListStateImplCopyWithImpl<_$TallyListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _TallyListState extends TallyListState {
  const factory _TallyListState({
    final Map<String, TallyItem> items,
    final String? activeItemId,
    final bool isLoading,
  }) = _$TallyListStateImpl;
  const _TallyListState._() : super._();

  /// All items data
  @override
  Map<String, TallyItem> get items;

  /// Currently active item ID
  @override
  String? get activeItemId;

  /// Loading state
  @override
  bool get isLoading;

  /// Create a copy of TallyListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TallyListStateImplCopyWith<_$TallyListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
