// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tally_monitor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TallyMonitorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String palletId) selectPallet,
    required TResult Function(String cellId) selectCell,
    required TResult Function(AddWeightData data) addWeight,
    required TResult Function(String cellId) deleteCell,
    required TResult Function(bool isOffline) setOfflineMode,
    required TResult Function(Map<String, TallyItem> items) updateItems,
    required TResult Function() addPallet,
    required TResult Function() prevPallet,
    required TResult Function() nextPallet,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String palletId)? selectPallet,
    TResult? Function(String cellId)? selectCell,
    TResult? Function(AddWeightData data)? addWeight,
    TResult? Function(String cellId)? deleteCell,
    TResult? Function(bool isOffline)? setOfflineMode,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
    TResult? Function()? addPallet,
    TResult? Function()? prevPallet,
    TResult? Function()? nextPallet,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String palletId)? selectPallet,
    TResult Function(String cellId)? selectCell,
    TResult Function(AddWeightData data)? addWeight,
    TResult Function(String cellId)? deleteCell,
    TResult Function(bool isOffline)? setOfflineMode,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    TResult Function()? addPallet,
    TResult Function()? prevPallet,
    TResult Function()? nextPallet,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_SelectPallet value) selectPallet,
    required TResult Function(_SelectCell value) selectCell,
    required TResult Function(_AddWeight value) addWeight,
    required TResult Function(_DeleteCell value) deleteCell,
    required TResult Function(_SetOfflineMode value) setOfflineMode,
    required TResult Function(_UpdateItems value) updateItems,
    required TResult Function(_AddPallet value) addPallet,
    required TResult Function(_PrevPallet value) prevPallet,
    required TResult Function(_NextPallet value) nextPallet,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_SelectPallet value)? selectPallet,
    TResult? Function(_SelectCell value)? selectCell,
    TResult? Function(_AddWeight value)? addWeight,
    TResult? Function(_DeleteCell value)? deleteCell,
    TResult? Function(_SetOfflineMode value)? setOfflineMode,
    TResult? Function(_UpdateItems value)? updateItems,
    TResult? Function(_AddPallet value)? addPallet,
    TResult? Function(_PrevPallet value)? prevPallet,
    TResult? Function(_NextPallet value)? nextPallet,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_SelectPallet value)? selectPallet,
    TResult Function(_SelectCell value)? selectCell,
    TResult Function(_AddWeight value)? addWeight,
    TResult Function(_DeleteCell value)? deleteCell,
    TResult Function(_SetOfflineMode value)? setOfflineMode,
    TResult Function(_UpdateItems value)? updateItems,
    TResult Function(_AddPallet value)? addPallet,
    TResult Function(_PrevPallet value)? prevPallet,
    TResult Function(_NextPallet value)? nextPallet,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TallyMonitorEventCopyWith<$Res> {
  factory $TallyMonitorEventCopyWith(
    TallyMonitorEvent value,
    $Res Function(TallyMonitorEvent) then,
  ) = _$TallyMonitorEventCopyWithImpl<$Res, TallyMonitorEvent>;
}

/// @nodoc
class _$TallyMonitorEventCopyWithImpl<$Res, $Val extends TallyMonitorEvent>
    implements $TallyMonitorEventCopyWith<$Res> {
  _$TallyMonitorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TallyMonitorEvent
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
    extends _$TallyMonitorEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyMonitorEvent
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
    return 'TallyMonitorEvent.started(items: $items)';
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

  /// Create a copy of TallyMonitorEvent
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
    required TResult Function(String palletId) selectPallet,
    required TResult Function(String cellId) selectCell,
    required TResult Function(AddWeightData data) addWeight,
    required TResult Function(String cellId) deleteCell,
    required TResult Function(bool isOffline) setOfflineMode,
    required TResult Function(Map<String, TallyItem> items) updateItems,
    required TResult Function() addPallet,
    required TResult Function() prevPallet,
    required TResult Function() nextPallet,
  }) {
    return started(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String palletId)? selectPallet,
    TResult? Function(String cellId)? selectCell,
    TResult? Function(AddWeightData data)? addWeight,
    TResult? Function(String cellId)? deleteCell,
    TResult? Function(bool isOffline)? setOfflineMode,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
    TResult? Function()? addPallet,
    TResult? Function()? prevPallet,
    TResult? Function()? nextPallet,
  }) {
    return started?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String palletId)? selectPallet,
    TResult Function(String cellId)? selectCell,
    TResult Function(AddWeightData data)? addWeight,
    TResult Function(String cellId)? deleteCell,
    TResult Function(bool isOffline)? setOfflineMode,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    TResult Function()? addPallet,
    TResult Function()? prevPallet,
    TResult Function()? nextPallet,
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
    required TResult Function(_SelectPallet value) selectPallet,
    required TResult Function(_SelectCell value) selectCell,
    required TResult Function(_AddWeight value) addWeight,
    required TResult Function(_DeleteCell value) deleteCell,
    required TResult Function(_SetOfflineMode value) setOfflineMode,
    required TResult Function(_UpdateItems value) updateItems,
    required TResult Function(_AddPallet value) addPallet,
    required TResult Function(_PrevPallet value) prevPallet,
    required TResult Function(_NextPallet value) nextPallet,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_SelectPallet value)? selectPallet,
    TResult? Function(_SelectCell value)? selectCell,
    TResult? Function(_AddWeight value)? addWeight,
    TResult? Function(_DeleteCell value)? deleteCell,
    TResult? Function(_SetOfflineMode value)? setOfflineMode,
    TResult? Function(_UpdateItems value)? updateItems,
    TResult? Function(_AddPallet value)? addPallet,
    TResult? Function(_PrevPallet value)? prevPallet,
    TResult? Function(_NextPallet value)? nextPallet,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_SelectPallet value)? selectPallet,
    TResult Function(_SelectCell value)? selectCell,
    TResult Function(_AddWeight value)? addWeight,
    TResult Function(_DeleteCell value)? deleteCell,
    TResult Function(_SetOfflineMode value)? setOfflineMode,
    TResult Function(_UpdateItems value)? updateItems,
    TResult Function(_AddPallet value)? addPallet,
    TResult Function(_PrevPallet value)? prevPallet,
    TResult Function(_NextPallet value)? nextPallet,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TallyMonitorEvent {
  const factory _Started(final Map<String, TallyItem> items) = _$StartedImpl;

  Map<String, TallyItem> get items;

  /// Create a copy of TallyMonitorEvent
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
    extends _$TallyMonitorEventCopyWithImpl<$Res, _$SelectItemImpl>
    implements _$$SelectItemImplCopyWith<$Res> {
  __$$SelectItemImplCopyWithImpl(
    _$SelectItemImpl _value,
    $Res Function(_$SelectItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyMonitorEvent
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
    return 'TallyMonitorEvent.selectItem(itemId: $itemId)';
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

  /// Create a copy of TallyMonitorEvent
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
    required TResult Function(String palletId) selectPallet,
    required TResult Function(String cellId) selectCell,
    required TResult Function(AddWeightData data) addWeight,
    required TResult Function(String cellId) deleteCell,
    required TResult Function(bool isOffline) setOfflineMode,
    required TResult Function(Map<String, TallyItem> items) updateItems,
    required TResult Function() addPallet,
    required TResult Function() prevPallet,
    required TResult Function() nextPallet,
  }) {
    return selectItem(itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String palletId)? selectPallet,
    TResult? Function(String cellId)? selectCell,
    TResult? Function(AddWeightData data)? addWeight,
    TResult? Function(String cellId)? deleteCell,
    TResult? Function(bool isOffline)? setOfflineMode,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
    TResult? Function()? addPallet,
    TResult? Function()? prevPallet,
    TResult? Function()? nextPallet,
  }) {
    return selectItem?.call(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String palletId)? selectPallet,
    TResult Function(String cellId)? selectCell,
    TResult Function(AddWeightData data)? addWeight,
    TResult Function(String cellId)? deleteCell,
    TResult Function(bool isOffline)? setOfflineMode,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    TResult Function()? addPallet,
    TResult Function()? prevPallet,
    TResult Function()? nextPallet,
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
    required TResult Function(_SelectPallet value) selectPallet,
    required TResult Function(_SelectCell value) selectCell,
    required TResult Function(_AddWeight value) addWeight,
    required TResult Function(_DeleteCell value) deleteCell,
    required TResult Function(_SetOfflineMode value) setOfflineMode,
    required TResult Function(_UpdateItems value) updateItems,
    required TResult Function(_AddPallet value) addPallet,
    required TResult Function(_PrevPallet value) prevPallet,
    required TResult Function(_NextPallet value) nextPallet,
  }) {
    return selectItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_SelectPallet value)? selectPallet,
    TResult? Function(_SelectCell value)? selectCell,
    TResult? Function(_AddWeight value)? addWeight,
    TResult? Function(_DeleteCell value)? deleteCell,
    TResult? Function(_SetOfflineMode value)? setOfflineMode,
    TResult? Function(_UpdateItems value)? updateItems,
    TResult? Function(_AddPallet value)? addPallet,
    TResult? Function(_PrevPallet value)? prevPallet,
    TResult? Function(_NextPallet value)? nextPallet,
  }) {
    return selectItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_SelectPallet value)? selectPallet,
    TResult Function(_SelectCell value)? selectCell,
    TResult Function(_AddWeight value)? addWeight,
    TResult Function(_DeleteCell value)? deleteCell,
    TResult Function(_SetOfflineMode value)? setOfflineMode,
    TResult Function(_UpdateItems value)? updateItems,
    TResult Function(_AddPallet value)? addPallet,
    TResult Function(_PrevPallet value)? prevPallet,
    TResult Function(_NextPallet value)? nextPallet,
    required TResult orElse(),
  }) {
    if (selectItem != null) {
      return selectItem(this);
    }
    return orElse();
  }
}

abstract class _SelectItem implements TallyMonitorEvent {
  const factory _SelectItem(final String itemId) = _$SelectItemImpl;

  String get itemId;

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectItemImplCopyWith<_$SelectItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectPalletImplCopyWith<$Res> {
  factory _$$SelectPalletImplCopyWith(
    _$SelectPalletImpl value,
    $Res Function(_$SelectPalletImpl) then,
  ) = __$$SelectPalletImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String palletId});
}

/// @nodoc
class __$$SelectPalletImplCopyWithImpl<$Res>
    extends _$TallyMonitorEventCopyWithImpl<$Res, _$SelectPalletImpl>
    implements _$$SelectPalletImplCopyWith<$Res> {
  __$$SelectPalletImplCopyWithImpl(
    _$SelectPalletImpl _value,
    $Res Function(_$SelectPalletImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? palletId = null}) {
    return _then(
      _$SelectPalletImpl(
        null == palletId
            ? _value.palletId
            : palletId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SelectPalletImpl implements _SelectPallet {
  const _$SelectPalletImpl(this.palletId);

  @override
  final String palletId;

  @override
  String toString() {
    return 'TallyMonitorEvent.selectPallet(palletId: $palletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectPalletImpl &&
            (identical(other.palletId, palletId) ||
                other.palletId == palletId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, palletId);

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectPalletImplCopyWith<_$SelectPalletImpl> get copyWith =>
      __$$SelectPalletImplCopyWithImpl<_$SelectPalletImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String palletId) selectPallet,
    required TResult Function(String cellId) selectCell,
    required TResult Function(AddWeightData data) addWeight,
    required TResult Function(String cellId) deleteCell,
    required TResult Function(bool isOffline) setOfflineMode,
    required TResult Function(Map<String, TallyItem> items) updateItems,
    required TResult Function() addPallet,
    required TResult Function() prevPallet,
    required TResult Function() nextPallet,
  }) {
    return selectPallet(palletId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String palletId)? selectPallet,
    TResult? Function(String cellId)? selectCell,
    TResult? Function(AddWeightData data)? addWeight,
    TResult? Function(String cellId)? deleteCell,
    TResult? Function(bool isOffline)? setOfflineMode,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
    TResult? Function()? addPallet,
    TResult? Function()? prevPallet,
    TResult? Function()? nextPallet,
  }) {
    return selectPallet?.call(palletId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String palletId)? selectPallet,
    TResult Function(String cellId)? selectCell,
    TResult Function(AddWeightData data)? addWeight,
    TResult Function(String cellId)? deleteCell,
    TResult Function(bool isOffline)? setOfflineMode,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    TResult Function()? addPallet,
    TResult Function()? prevPallet,
    TResult Function()? nextPallet,
    required TResult orElse(),
  }) {
    if (selectPallet != null) {
      return selectPallet(palletId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_SelectPallet value) selectPallet,
    required TResult Function(_SelectCell value) selectCell,
    required TResult Function(_AddWeight value) addWeight,
    required TResult Function(_DeleteCell value) deleteCell,
    required TResult Function(_SetOfflineMode value) setOfflineMode,
    required TResult Function(_UpdateItems value) updateItems,
    required TResult Function(_AddPallet value) addPallet,
    required TResult Function(_PrevPallet value) prevPallet,
    required TResult Function(_NextPallet value) nextPallet,
  }) {
    return selectPallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_SelectPallet value)? selectPallet,
    TResult? Function(_SelectCell value)? selectCell,
    TResult? Function(_AddWeight value)? addWeight,
    TResult? Function(_DeleteCell value)? deleteCell,
    TResult? Function(_SetOfflineMode value)? setOfflineMode,
    TResult? Function(_UpdateItems value)? updateItems,
    TResult? Function(_AddPallet value)? addPallet,
    TResult? Function(_PrevPallet value)? prevPallet,
    TResult? Function(_NextPallet value)? nextPallet,
  }) {
    return selectPallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_SelectPallet value)? selectPallet,
    TResult Function(_SelectCell value)? selectCell,
    TResult Function(_AddWeight value)? addWeight,
    TResult Function(_DeleteCell value)? deleteCell,
    TResult Function(_SetOfflineMode value)? setOfflineMode,
    TResult Function(_UpdateItems value)? updateItems,
    TResult Function(_AddPallet value)? addPallet,
    TResult Function(_PrevPallet value)? prevPallet,
    TResult Function(_NextPallet value)? nextPallet,
    required TResult orElse(),
  }) {
    if (selectPallet != null) {
      return selectPallet(this);
    }
    return orElse();
  }
}

abstract class _SelectPallet implements TallyMonitorEvent {
  const factory _SelectPallet(final String palletId) = _$SelectPalletImpl;

  String get palletId;

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectPalletImplCopyWith<_$SelectPalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCellImplCopyWith<$Res> {
  factory _$$SelectCellImplCopyWith(
    _$SelectCellImpl value,
    $Res Function(_$SelectCellImpl) then,
  ) = __$$SelectCellImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cellId});
}

/// @nodoc
class __$$SelectCellImplCopyWithImpl<$Res>
    extends _$TallyMonitorEventCopyWithImpl<$Res, _$SelectCellImpl>
    implements _$$SelectCellImplCopyWith<$Res> {
  __$$SelectCellImplCopyWithImpl(
    _$SelectCellImpl _value,
    $Res Function(_$SelectCellImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cellId = null}) {
    return _then(
      _$SelectCellImpl(
        null == cellId
            ? _value.cellId
            : cellId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SelectCellImpl implements _SelectCell {
  const _$SelectCellImpl(this.cellId);

  @override
  final String cellId;

  @override
  String toString() {
    return 'TallyMonitorEvent.selectCell(cellId: $cellId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCellImpl &&
            (identical(other.cellId, cellId) || other.cellId == cellId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cellId);

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCellImplCopyWith<_$SelectCellImpl> get copyWith =>
      __$$SelectCellImplCopyWithImpl<_$SelectCellImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String palletId) selectPallet,
    required TResult Function(String cellId) selectCell,
    required TResult Function(AddWeightData data) addWeight,
    required TResult Function(String cellId) deleteCell,
    required TResult Function(bool isOffline) setOfflineMode,
    required TResult Function(Map<String, TallyItem> items) updateItems,
    required TResult Function() addPallet,
    required TResult Function() prevPallet,
    required TResult Function() nextPallet,
  }) {
    return selectCell(cellId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String palletId)? selectPallet,
    TResult? Function(String cellId)? selectCell,
    TResult? Function(AddWeightData data)? addWeight,
    TResult? Function(String cellId)? deleteCell,
    TResult? Function(bool isOffline)? setOfflineMode,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
    TResult? Function()? addPallet,
    TResult? Function()? prevPallet,
    TResult? Function()? nextPallet,
  }) {
    return selectCell?.call(cellId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String palletId)? selectPallet,
    TResult Function(String cellId)? selectCell,
    TResult Function(AddWeightData data)? addWeight,
    TResult Function(String cellId)? deleteCell,
    TResult Function(bool isOffline)? setOfflineMode,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    TResult Function()? addPallet,
    TResult Function()? prevPallet,
    TResult Function()? nextPallet,
    required TResult orElse(),
  }) {
    if (selectCell != null) {
      return selectCell(cellId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_SelectPallet value) selectPallet,
    required TResult Function(_SelectCell value) selectCell,
    required TResult Function(_AddWeight value) addWeight,
    required TResult Function(_DeleteCell value) deleteCell,
    required TResult Function(_SetOfflineMode value) setOfflineMode,
    required TResult Function(_UpdateItems value) updateItems,
    required TResult Function(_AddPallet value) addPallet,
    required TResult Function(_PrevPallet value) prevPallet,
    required TResult Function(_NextPallet value) nextPallet,
  }) {
    return selectCell(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_SelectPallet value)? selectPallet,
    TResult? Function(_SelectCell value)? selectCell,
    TResult? Function(_AddWeight value)? addWeight,
    TResult? Function(_DeleteCell value)? deleteCell,
    TResult? Function(_SetOfflineMode value)? setOfflineMode,
    TResult? Function(_UpdateItems value)? updateItems,
    TResult? Function(_AddPallet value)? addPallet,
    TResult? Function(_PrevPallet value)? prevPallet,
    TResult? Function(_NextPallet value)? nextPallet,
  }) {
    return selectCell?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_SelectPallet value)? selectPallet,
    TResult Function(_SelectCell value)? selectCell,
    TResult Function(_AddWeight value)? addWeight,
    TResult Function(_DeleteCell value)? deleteCell,
    TResult Function(_SetOfflineMode value)? setOfflineMode,
    TResult Function(_UpdateItems value)? updateItems,
    TResult Function(_AddPallet value)? addPallet,
    TResult Function(_PrevPallet value)? prevPallet,
    TResult Function(_NextPallet value)? nextPallet,
    required TResult orElse(),
  }) {
    if (selectCell != null) {
      return selectCell(this);
    }
    return orElse();
  }
}

abstract class _SelectCell implements TallyMonitorEvent {
  const factory _SelectCell(final String cellId) = _$SelectCellImpl;

  String get cellId;

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectCellImplCopyWith<_$SelectCellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddWeightImplCopyWith<$Res> {
  factory _$$AddWeightImplCopyWith(
    _$AddWeightImpl value,
    $Res Function(_$AddWeightImpl) then,
  ) = __$$AddWeightImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddWeightData data});

  $AddWeightDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$AddWeightImplCopyWithImpl<$Res>
    extends _$TallyMonitorEventCopyWithImpl<$Res, _$AddWeightImpl>
    implements _$$AddWeightImplCopyWith<$Res> {
  __$$AddWeightImplCopyWithImpl(
    _$AddWeightImpl _value,
    $Res Function(_$AddWeightImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$AddWeightImpl(
        null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as AddWeightData,
      ),
    );
  }

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddWeightDataCopyWith<$Res> get data {
    return $AddWeightDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$AddWeightImpl implements _AddWeight {
  const _$AddWeightImpl(this.data);

  @override
  final AddWeightData data;

  @override
  String toString() {
    return 'TallyMonitorEvent.addWeight(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddWeightImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddWeightImplCopyWith<_$AddWeightImpl> get copyWith =>
      __$$AddWeightImplCopyWithImpl<_$AddWeightImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String palletId) selectPallet,
    required TResult Function(String cellId) selectCell,
    required TResult Function(AddWeightData data) addWeight,
    required TResult Function(String cellId) deleteCell,
    required TResult Function(bool isOffline) setOfflineMode,
    required TResult Function(Map<String, TallyItem> items) updateItems,
    required TResult Function() addPallet,
    required TResult Function() prevPallet,
    required TResult Function() nextPallet,
  }) {
    return addWeight(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String palletId)? selectPallet,
    TResult? Function(String cellId)? selectCell,
    TResult? Function(AddWeightData data)? addWeight,
    TResult? Function(String cellId)? deleteCell,
    TResult? Function(bool isOffline)? setOfflineMode,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
    TResult? Function()? addPallet,
    TResult? Function()? prevPallet,
    TResult? Function()? nextPallet,
  }) {
    return addWeight?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String palletId)? selectPallet,
    TResult Function(String cellId)? selectCell,
    TResult Function(AddWeightData data)? addWeight,
    TResult Function(String cellId)? deleteCell,
    TResult Function(bool isOffline)? setOfflineMode,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    TResult Function()? addPallet,
    TResult Function()? prevPallet,
    TResult Function()? nextPallet,
    required TResult orElse(),
  }) {
    if (addWeight != null) {
      return addWeight(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_SelectPallet value) selectPallet,
    required TResult Function(_SelectCell value) selectCell,
    required TResult Function(_AddWeight value) addWeight,
    required TResult Function(_DeleteCell value) deleteCell,
    required TResult Function(_SetOfflineMode value) setOfflineMode,
    required TResult Function(_UpdateItems value) updateItems,
    required TResult Function(_AddPallet value) addPallet,
    required TResult Function(_PrevPallet value) prevPallet,
    required TResult Function(_NextPallet value) nextPallet,
  }) {
    return addWeight(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_SelectPallet value)? selectPallet,
    TResult? Function(_SelectCell value)? selectCell,
    TResult? Function(_AddWeight value)? addWeight,
    TResult? Function(_DeleteCell value)? deleteCell,
    TResult? Function(_SetOfflineMode value)? setOfflineMode,
    TResult? Function(_UpdateItems value)? updateItems,
    TResult? Function(_AddPallet value)? addPallet,
    TResult? Function(_PrevPallet value)? prevPallet,
    TResult? Function(_NextPallet value)? nextPallet,
  }) {
    return addWeight?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_SelectPallet value)? selectPallet,
    TResult Function(_SelectCell value)? selectCell,
    TResult Function(_AddWeight value)? addWeight,
    TResult Function(_DeleteCell value)? deleteCell,
    TResult Function(_SetOfflineMode value)? setOfflineMode,
    TResult Function(_UpdateItems value)? updateItems,
    TResult Function(_AddPallet value)? addPallet,
    TResult Function(_PrevPallet value)? prevPallet,
    TResult Function(_NextPallet value)? nextPallet,
    required TResult orElse(),
  }) {
    if (addWeight != null) {
      return addWeight(this);
    }
    return orElse();
  }
}

abstract class _AddWeight implements TallyMonitorEvent {
  const factory _AddWeight(final AddWeightData data) = _$AddWeightImpl;

  AddWeightData get data;

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddWeightImplCopyWith<_$AddWeightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCellImplCopyWith<$Res> {
  factory _$$DeleteCellImplCopyWith(
    _$DeleteCellImpl value,
    $Res Function(_$DeleteCellImpl) then,
  ) = __$$DeleteCellImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cellId});
}

/// @nodoc
class __$$DeleteCellImplCopyWithImpl<$Res>
    extends _$TallyMonitorEventCopyWithImpl<$Res, _$DeleteCellImpl>
    implements _$$DeleteCellImplCopyWith<$Res> {
  __$$DeleteCellImplCopyWithImpl(
    _$DeleteCellImpl _value,
    $Res Function(_$DeleteCellImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cellId = null}) {
    return _then(
      _$DeleteCellImpl(
        null == cellId
            ? _value.cellId
            : cellId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteCellImpl implements _DeleteCell {
  const _$DeleteCellImpl(this.cellId);

  @override
  final String cellId;

  @override
  String toString() {
    return 'TallyMonitorEvent.deleteCell(cellId: $cellId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteCellImpl &&
            (identical(other.cellId, cellId) || other.cellId == cellId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cellId);

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCellImplCopyWith<_$DeleteCellImpl> get copyWith =>
      __$$DeleteCellImplCopyWithImpl<_$DeleteCellImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String palletId) selectPallet,
    required TResult Function(String cellId) selectCell,
    required TResult Function(AddWeightData data) addWeight,
    required TResult Function(String cellId) deleteCell,
    required TResult Function(bool isOffline) setOfflineMode,
    required TResult Function(Map<String, TallyItem> items) updateItems,
    required TResult Function() addPallet,
    required TResult Function() prevPallet,
    required TResult Function() nextPallet,
  }) {
    return deleteCell(cellId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String palletId)? selectPallet,
    TResult? Function(String cellId)? selectCell,
    TResult? Function(AddWeightData data)? addWeight,
    TResult? Function(String cellId)? deleteCell,
    TResult? Function(bool isOffline)? setOfflineMode,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
    TResult? Function()? addPallet,
    TResult? Function()? prevPallet,
    TResult? Function()? nextPallet,
  }) {
    return deleteCell?.call(cellId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String palletId)? selectPallet,
    TResult Function(String cellId)? selectCell,
    TResult Function(AddWeightData data)? addWeight,
    TResult Function(String cellId)? deleteCell,
    TResult Function(bool isOffline)? setOfflineMode,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    TResult Function()? addPallet,
    TResult Function()? prevPallet,
    TResult Function()? nextPallet,
    required TResult orElse(),
  }) {
    if (deleteCell != null) {
      return deleteCell(cellId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_SelectPallet value) selectPallet,
    required TResult Function(_SelectCell value) selectCell,
    required TResult Function(_AddWeight value) addWeight,
    required TResult Function(_DeleteCell value) deleteCell,
    required TResult Function(_SetOfflineMode value) setOfflineMode,
    required TResult Function(_UpdateItems value) updateItems,
    required TResult Function(_AddPallet value) addPallet,
    required TResult Function(_PrevPallet value) prevPallet,
    required TResult Function(_NextPallet value) nextPallet,
  }) {
    return deleteCell(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_SelectPallet value)? selectPallet,
    TResult? Function(_SelectCell value)? selectCell,
    TResult? Function(_AddWeight value)? addWeight,
    TResult? Function(_DeleteCell value)? deleteCell,
    TResult? Function(_SetOfflineMode value)? setOfflineMode,
    TResult? Function(_UpdateItems value)? updateItems,
    TResult? Function(_AddPallet value)? addPallet,
    TResult? Function(_PrevPallet value)? prevPallet,
    TResult? Function(_NextPallet value)? nextPallet,
  }) {
    return deleteCell?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_SelectPallet value)? selectPallet,
    TResult Function(_SelectCell value)? selectCell,
    TResult Function(_AddWeight value)? addWeight,
    TResult Function(_DeleteCell value)? deleteCell,
    TResult Function(_SetOfflineMode value)? setOfflineMode,
    TResult Function(_UpdateItems value)? updateItems,
    TResult Function(_AddPallet value)? addPallet,
    TResult Function(_PrevPallet value)? prevPallet,
    TResult Function(_NextPallet value)? nextPallet,
    required TResult orElse(),
  }) {
    if (deleteCell != null) {
      return deleteCell(this);
    }
    return orElse();
  }
}

abstract class _DeleteCell implements TallyMonitorEvent {
  const factory _DeleteCell(final String cellId) = _$DeleteCellImpl;

  String get cellId;

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteCellImplCopyWith<_$DeleteCellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetOfflineModeImplCopyWith<$Res> {
  factory _$$SetOfflineModeImplCopyWith(
    _$SetOfflineModeImpl value,
    $Res Function(_$SetOfflineModeImpl) then,
  ) = __$$SetOfflineModeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isOffline});
}

/// @nodoc
class __$$SetOfflineModeImplCopyWithImpl<$Res>
    extends _$TallyMonitorEventCopyWithImpl<$Res, _$SetOfflineModeImpl>
    implements _$$SetOfflineModeImplCopyWith<$Res> {
  __$$SetOfflineModeImplCopyWithImpl(
    _$SetOfflineModeImpl _value,
    $Res Function(_$SetOfflineModeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isOffline = null}) {
    return _then(
      _$SetOfflineModeImpl(
        null == isOffline
            ? _value.isOffline
            : isOffline // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$SetOfflineModeImpl implements _SetOfflineMode {
  const _$SetOfflineModeImpl(this.isOffline);

  @override
  final bool isOffline;

  @override
  String toString() {
    return 'TallyMonitorEvent.setOfflineMode(isOffline: $isOffline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetOfflineModeImpl &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOffline);

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetOfflineModeImplCopyWith<_$SetOfflineModeImpl> get copyWith =>
      __$$SetOfflineModeImplCopyWithImpl<_$SetOfflineModeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String palletId) selectPallet,
    required TResult Function(String cellId) selectCell,
    required TResult Function(AddWeightData data) addWeight,
    required TResult Function(String cellId) deleteCell,
    required TResult Function(bool isOffline) setOfflineMode,
    required TResult Function(Map<String, TallyItem> items) updateItems,
    required TResult Function() addPallet,
    required TResult Function() prevPallet,
    required TResult Function() nextPallet,
  }) {
    return setOfflineMode(isOffline);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String palletId)? selectPallet,
    TResult? Function(String cellId)? selectCell,
    TResult? Function(AddWeightData data)? addWeight,
    TResult? Function(String cellId)? deleteCell,
    TResult? Function(bool isOffline)? setOfflineMode,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
    TResult? Function()? addPallet,
    TResult? Function()? prevPallet,
    TResult? Function()? nextPallet,
  }) {
    return setOfflineMode?.call(isOffline);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String palletId)? selectPallet,
    TResult Function(String cellId)? selectCell,
    TResult Function(AddWeightData data)? addWeight,
    TResult Function(String cellId)? deleteCell,
    TResult Function(bool isOffline)? setOfflineMode,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    TResult Function()? addPallet,
    TResult Function()? prevPallet,
    TResult Function()? nextPallet,
    required TResult orElse(),
  }) {
    if (setOfflineMode != null) {
      return setOfflineMode(isOffline);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_SelectPallet value) selectPallet,
    required TResult Function(_SelectCell value) selectCell,
    required TResult Function(_AddWeight value) addWeight,
    required TResult Function(_DeleteCell value) deleteCell,
    required TResult Function(_SetOfflineMode value) setOfflineMode,
    required TResult Function(_UpdateItems value) updateItems,
    required TResult Function(_AddPallet value) addPallet,
    required TResult Function(_PrevPallet value) prevPallet,
    required TResult Function(_NextPallet value) nextPallet,
  }) {
    return setOfflineMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_SelectPallet value)? selectPallet,
    TResult? Function(_SelectCell value)? selectCell,
    TResult? Function(_AddWeight value)? addWeight,
    TResult? Function(_DeleteCell value)? deleteCell,
    TResult? Function(_SetOfflineMode value)? setOfflineMode,
    TResult? Function(_UpdateItems value)? updateItems,
    TResult? Function(_AddPallet value)? addPallet,
    TResult? Function(_PrevPallet value)? prevPallet,
    TResult? Function(_NextPallet value)? nextPallet,
  }) {
    return setOfflineMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_SelectPallet value)? selectPallet,
    TResult Function(_SelectCell value)? selectCell,
    TResult Function(_AddWeight value)? addWeight,
    TResult Function(_DeleteCell value)? deleteCell,
    TResult Function(_SetOfflineMode value)? setOfflineMode,
    TResult Function(_UpdateItems value)? updateItems,
    TResult Function(_AddPallet value)? addPallet,
    TResult Function(_PrevPallet value)? prevPallet,
    TResult Function(_NextPallet value)? nextPallet,
    required TResult orElse(),
  }) {
    if (setOfflineMode != null) {
      return setOfflineMode(this);
    }
    return orElse();
  }
}

abstract class _SetOfflineMode implements TallyMonitorEvent {
  const factory _SetOfflineMode(final bool isOffline) = _$SetOfflineModeImpl;

  bool get isOffline;

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetOfflineModeImplCopyWith<_$SetOfflineModeImpl> get copyWith =>
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
    extends _$TallyMonitorEventCopyWithImpl<$Res, _$UpdateItemsImpl>
    implements _$$UpdateItemsImplCopyWith<$Res> {
  __$$UpdateItemsImplCopyWithImpl(
    _$UpdateItemsImpl _value,
    $Res Function(_$UpdateItemsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyMonitorEvent
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
    return 'TallyMonitorEvent.updateItems(items: $items)';
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

  /// Create a copy of TallyMonitorEvent
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
    required TResult Function(String palletId) selectPallet,
    required TResult Function(String cellId) selectCell,
    required TResult Function(AddWeightData data) addWeight,
    required TResult Function(String cellId) deleteCell,
    required TResult Function(bool isOffline) setOfflineMode,
    required TResult Function(Map<String, TallyItem> items) updateItems,
    required TResult Function() addPallet,
    required TResult Function() prevPallet,
    required TResult Function() nextPallet,
  }) {
    return updateItems(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String palletId)? selectPallet,
    TResult? Function(String cellId)? selectCell,
    TResult? Function(AddWeightData data)? addWeight,
    TResult? Function(String cellId)? deleteCell,
    TResult? Function(bool isOffline)? setOfflineMode,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
    TResult? Function()? addPallet,
    TResult? Function()? prevPallet,
    TResult? Function()? nextPallet,
  }) {
    return updateItems?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String palletId)? selectPallet,
    TResult Function(String cellId)? selectCell,
    TResult Function(AddWeightData data)? addWeight,
    TResult Function(String cellId)? deleteCell,
    TResult Function(bool isOffline)? setOfflineMode,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    TResult Function()? addPallet,
    TResult Function()? prevPallet,
    TResult Function()? nextPallet,
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
    required TResult Function(_SelectPallet value) selectPallet,
    required TResult Function(_SelectCell value) selectCell,
    required TResult Function(_AddWeight value) addWeight,
    required TResult Function(_DeleteCell value) deleteCell,
    required TResult Function(_SetOfflineMode value) setOfflineMode,
    required TResult Function(_UpdateItems value) updateItems,
    required TResult Function(_AddPallet value) addPallet,
    required TResult Function(_PrevPallet value) prevPallet,
    required TResult Function(_NextPallet value) nextPallet,
  }) {
    return updateItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_SelectPallet value)? selectPallet,
    TResult? Function(_SelectCell value)? selectCell,
    TResult? Function(_AddWeight value)? addWeight,
    TResult? Function(_DeleteCell value)? deleteCell,
    TResult? Function(_SetOfflineMode value)? setOfflineMode,
    TResult? Function(_UpdateItems value)? updateItems,
    TResult? Function(_AddPallet value)? addPallet,
    TResult? Function(_PrevPallet value)? prevPallet,
    TResult? Function(_NextPallet value)? nextPallet,
  }) {
    return updateItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_SelectPallet value)? selectPallet,
    TResult Function(_SelectCell value)? selectCell,
    TResult Function(_AddWeight value)? addWeight,
    TResult Function(_DeleteCell value)? deleteCell,
    TResult Function(_SetOfflineMode value)? setOfflineMode,
    TResult Function(_UpdateItems value)? updateItems,
    TResult Function(_AddPallet value)? addPallet,
    TResult Function(_PrevPallet value)? prevPallet,
    TResult Function(_NextPallet value)? nextPallet,
    required TResult orElse(),
  }) {
    if (updateItems != null) {
      return updateItems(this);
    }
    return orElse();
  }
}

abstract class _UpdateItems implements TallyMonitorEvent {
  const factory _UpdateItems(final Map<String, TallyItem> items) =
      _$UpdateItemsImpl;

  Map<String, TallyItem> get items;

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateItemsImplCopyWith<_$UpdateItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPalletImplCopyWith<$Res> {
  factory _$$AddPalletImplCopyWith(
    _$AddPalletImpl value,
    $Res Function(_$AddPalletImpl) then,
  ) = __$$AddPalletImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddPalletImplCopyWithImpl<$Res>
    extends _$TallyMonitorEventCopyWithImpl<$Res, _$AddPalletImpl>
    implements _$$AddPalletImplCopyWith<$Res> {
  __$$AddPalletImplCopyWithImpl(
    _$AddPalletImpl _value,
    $Res Function(_$AddPalletImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddPalletImpl implements _AddPallet {
  const _$AddPalletImpl();

  @override
  String toString() {
    return 'TallyMonitorEvent.addPallet()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddPalletImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String palletId) selectPallet,
    required TResult Function(String cellId) selectCell,
    required TResult Function(AddWeightData data) addWeight,
    required TResult Function(String cellId) deleteCell,
    required TResult Function(bool isOffline) setOfflineMode,
    required TResult Function(Map<String, TallyItem> items) updateItems,
    required TResult Function() addPallet,
    required TResult Function() prevPallet,
    required TResult Function() nextPallet,
  }) {
    return addPallet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String palletId)? selectPallet,
    TResult? Function(String cellId)? selectCell,
    TResult? Function(AddWeightData data)? addWeight,
    TResult? Function(String cellId)? deleteCell,
    TResult? Function(bool isOffline)? setOfflineMode,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
    TResult? Function()? addPallet,
    TResult? Function()? prevPallet,
    TResult? Function()? nextPallet,
  }) {
    return addPallet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String palletId)? selectPallet,
    TResult Function(String cellId)? selectCell,
    TResult Function(AddWeightData data)? addWeight,
    TResult Function(String cellId)? deleteCell,
    TResult Function(bool isOffline)? setOfflineMode,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    TResult Function()? addPallet,
    TResult Function()? prevPallet,
    TResult Function()? nextPallet,
    required TResult orElse(),
  }) {
    if (addPallet != null) {
      return addPallet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_SelectPallet value) selectPallet,
    required TResult Function(_SelectCell value) selectCell,
    required TResult Function(_AddWeight value) addWeight,
    required TResult Function(_DeleteCell value) deleteCell,
    required TResult Function(_SetOfflineMode value) setOfflineMode,
    required TResult Function(_UpdateItems value) updateItems,
    required TResult Function(_AddPallet value) addPallet,
    required TResult Function(_PrevPallet value) prevPallet,
    required TResult Function(_NextPallet value) nextPallet,
  }) {
    return addPallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_SelectPallet value)? selectPallet,
    TResult? Function(_SelectCell value)? selectCell,
    TResult? Function(_AddWeight value)? addWeight,
    TResult? Function(_DeleteCell value)? deleteCell,
    TResult? Function(_SetOfflineMode value)? setOfflineMode,
    TResult? Function(_UpdateItems value)? updateItems,
    TResult? Function(_AddPallet value)? addPallet,
    TResult? Function(_PrevPallet value)? prevPallet,
    TResult? Function(_NextPallet value)? nextPallet,
  }) {
    return addPallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_SelectPallet value)? selectPallet,
    TResult Function(_SelectCell value)? selectCell,
    TResult Function(_AddWeight value)? addWeight,
    TResult Function(_DeleteCell value)? deleteCell,
    TResult Function(_SetOfflineMode value)? setOfflineMode,
    TResult Function(_UpdateItems value)? updateItems,
    TResult Function(_AddPallet value)? addPallet,
    TResult Function(_PrevPallet value)? prevPallet,
    TResult Function(_NextPallet value)? nextPallet,
    required TResult orElse(),
  }) {
    if (addPallet != null) {
      return addPallet(this);
    }
    return orElse();
  }
}

abstract class _AddPallet implements TallyMonitorEvent {
  const factory _AddPallet() = _$AddPalletImpl;
}

/// @nodoc
abstract class _$$PrevPalletImplCopyWith<$Res> {
  factory _$$PrevPalletImplCopyWith(
    _$PrevPalletImpl value,
    $Res Function(_$PrevPalletImpl) then,
  ) = __$$PrevPalletImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PrevPalletImplCopyWithImpl<$Res>
    extends _$TallyMonitorEventCopyWithImpl<$Res, _$PrevPalletImpl>
    implements _$$PrevPalletImplCopyWith<$Res> {
  __$$PrevPalletImplCopyWithImpl(
    _$PrevPalletImpl _value,
    $Res Function(_$PrevPalletImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PrevPalletImpl implements _PrevPallet {
  const _$PrevPalletImpl();

  @override
  String toString() {
    return 'TallyMonitorEvent.prevPallet()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PrevPalletImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String palletId) selectPallet,
    required TResult Function(String cellId) selectCell,
    required TResult Function(AddWeightData data) addWeight,
    required TResult Function(String cellId) deleteCell,
    required TResult Function(bool isOffline) setOfflineMode,
    required TResult Function(Map<String, TallyItem> items) updateItems,
    required TResult Function() addPallet,
    required TResult Function() prevPallet,
    required TResult Function() nextPallet,
  }) {
    return prevPallet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String palletId)? selectPallet,
    TResult? Function(String cellId)? selectCell,
    TResult? Function(AddWeightData data)? addWeight,
    TResult? Function(String cellId)? deleteCell,
    TResult? Function(bool isOffline)? setOfflineMode,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
    TResult? Function()? addPallet,
    TResult? Function()? prevPallet,
    TResult? Function()? nextPallet,
  }) {
    return prevPallet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String palletId)? selectPallet,
    TResult Function(String cellId)? selectCell,
    TResult Function(AddWeightData data)? addWeight,
    TResult Function(String cellId)? deleteCell,
    TResult Function(bool isOffline)? setOfflineMode,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    TResult Function()? addPallet,
    TResult Function()? prevPallet,
    TResult Function()? nextPallet,
    required TResult orElse(),
  }) {
    if (prevPallet != null) {
      return prevPallet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_SelectPallet value) selectPallet,
    required TResult Function(_SelectCell value) selectCell,
    required TResult Function(_AddWeight value) addWeight,
    required TResult Function(_DeleteCell value) deleteCell,
    required TResult Function(_SetOfflineMode value) setOfflineMode,
    required TResult Function(_UpdateItems value) updateItems,
    required TResult Function(_AddPallet value) addPallet,
    required TResult Function(_PrevPallet value) prevPallet,
    required TResult Function(_NextPallet value) nextPallet,
  }) {
    return prevPallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_SelectPallet value)? selectPallet,
    TResult? Function(_SelectCell value)? selectCell,
    TResult? Function(_AddWeight value)? addWeight,
    TResult? Function(_DeleteCell value)? deleteCell,
    TResult? Function(_SetOfflineMode value)? setOfflineMode,
    TResult? Function(_UpdateItems value)? updateItems,
    TResult? Function(_AddPallet value)? addPallet,
    TResult? Function(_PrevPallet value)? prevPallet,
    TResult? Function(_NextPallet value)? nextPallet,
  }) {
    return prevPallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_SelectPallet value)? selectPallet,
    TResult Function(_SelectCell value)? selectCell,
    TResult Function(_AddWeight value)? addWeight,
    TResult Function(_DeleteCell value)? deleteCell,
    TResult Function(_SetOfflineMode value)? setOfflineMode,
    TResult Function(_UpdateItems value)? updateItems,
    TResult Function(_AddPallet value)? addPallet,
    TResult Function(_PrevPallet value)? prevPallet,
    TResult Function(_NextPallet value)? nextPallet,
    required TResult orElse(),
  }) {
    if (prevPallet != null) {
      return prevPallet(this);
    }
    return orElse();
  }
}

abstract class _PrevPallet implements TallyMonitorEvent {
  const factory _PrevPallet() = _$PrevPalletImpl;
}

/// @nodoc
abstract class _$$NextPalletImplCopyWith<$Res> {
  factory _$$NextPalletImplCopyWith(
    _$NextPalletImpl value,
    $Res Function(_$NextPalletImpl) then,
  ) = __$$NextPalletImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextPalletImplCopyWithImpl<$Res>
    extends _$TallyMonitorEventCopyWithImpl<$Res, _$NextPalletImpl>
    implements _$$NextPalletImplCopyWith<$Res> {
  __$$NextPalletImplCopyWithImpl(
    _$NextPalletImpl _value,
    $Res Function(_$NextPalletImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyMonitorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NextPalletImpl implements _NextPallet {
  const _$NextPalletImpl();

  @override
  String toString() {
    return 'TallyMonitorEvent.nextPallet()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NextPalletImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, TallyItem> items) started,
    required TResult Function(String itemId) selectItem,
    required TResult Function(String palletId) selectPallet,
    required TResult Function(String cellId) selectCell,
    required TResult Function(AddWeightData data) addWeight,
    required TResult Function(String cellId) deleteCell,
    required TResult Function(bool isOffline) setOfflineMode,
    required TResult Function(Map<String, TallyItem> items) updateItems,
    required TResult Function() addPallet,
    required TResult Function() prevPallet,
    required TResult Function() nextPallet,
  }) {
    return nextPallet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, TallyItem> items)? started,
    TResult? Function(String itemId)? selectItem,
    TResult? Function(String palletId)? selectPallet,
    TResult? Function(String cellId)? selectCell,
    TResult? Function(AddWeightData data)? addWeight,
    TResult? Function(String cellId)? deleteCell,
    TResult? Function(bool isOffline)? setOfflineMode,
    TResult? Function(Map<String, TallyItem> items)? updateItems,
    TResult? Function()? addPallet,
    TResult? Function()? prevPallet,
    TResult? Function()? nextPallet,
  }) {
    return nextPallet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, TallyItem> items)? started,
    TResult Function(String itemId)? selectItem,
    TResult Function(String palletId)? selectPallet,
    TResult Function(String cellId)? selectCell,
    TResult Function(AddWeightData data)? addWeight,
    TResult Function(String cellId)? deleteCell,
    TResult Function(bool isOffline)? setOfflineMode,
    TResult Function(Map<String, TallyItem> items)? updateItems,
    TResult Function()? addPallet,
    TResult Function()? prevPallet,
    TResult Function()? nextPallet,
    required TResult orElse(),
  }) {
    if (nextPallet != null) {
      return nextPallet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectItem value) selectItem,
    required TResult Function(_SelectPallet value) selectPallet,
    required TResult Function(_SelectCell value) selectCell,
    required TResult Function(_AddWeight value) addWeight,
    required TResult Function(_DeleteCell value) deleteCell,
    required TResult Function(_SetOfflineMode value) setOfflineMode,
    required TResult Function(_UpdateItems value) updateItems,
    required TResult Function(_AddPallet value) addPallet,
    required TResult Function(_PrevPallet value) prevPallet,
    required TResult Function(_NextPallet value) nextPallet,
  }) {
    return nextPallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectItem value)? selectItem,
    TResult? Function(_SelectPallet value)? selectPallet,
    TResult? Function(_SelectCell value)? selectCell,
    TResult? Function(_AddWeight value)? addWeight,
    TResult? Function(_DeleteCell value)? deleteCell,
    TResult? Function(_SetOfflineMode value)? setOfflineMode,
    TResult? Function(_UpdateItems value)? updateItems,
    TResult? Function(_AddPallet value)? addPallet,
    TResult? Function(_PrevPallet value)? prevPallet,
    TResult? Function(_NextPallet value)? nextPallet,
  }) {
    return nextPallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectItem value)? selectItem,
    TResult Function(_SelectPallet value)? selectPallet,
    TResult Function(_SelectCell value)? selectCell,
    TResult Function(_AddWeight value)? addWeight,
    TResult Function(_DeleteCell value)? deleteCell,
    TResult Function(_SetOfflineMode value)? setOfflineMode,
    TResult Function(_UpdateItems value)? updateItems,
    TResult Function(_AddPallet value)? addPallet,
    TResult Function(_PrevPallet value)? prevPallet,
    TResult Function(_NextPallet value)? nextPallet,
    required TResult orElse(),
  }) {
    if (nextPallet != null) {
      return nextPallet(this);
    }
    return orElse();
  }
}

abstract class _NextPallet implements TallyMonitorEvent {
  const factory _NextPallet() = _$NextPalletImpl;
}

/// @nodoc
mixin _$TallyMonitorState {
  /// All items data
  Map<String, TallyItem> get items => throw _privateConstructorUsedError;

  /// Currently active item ID
  String? get activeItemId => throw _privateConstructorUsedError;

  /// Currently active pallet ID
  String? get activePalletId => throw _privateConstructorUsedError;

  /// Currently selected cell ID
  String? get selectedCellId => throw _privateConstructorUsedError;

  /// Next cell position for auto-focus
  String? get nextCellPosition => throw _privateConstructorUsedError;

  /// Offline mode flag
  bool get isOffline => throw _privateConstructorUsedError;

  /// Loading state
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of TallyMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TallyMonitorStateCopyWith<TallyMonitorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TallyMonitorStateCopyWith<$Res> {
  factory $TallyMonitorStateCopyWith(
    TallyMonitorState value,
    $Res Function(TallyMonitorState) then,
  ) = _$TallyMonitorStateCopyWithImpl<$Res, TallyMonitorState>;
  @useResult
  $Res call({
    Map<String, TallyItem> items,
    String? activeItemId,
    String? activePalletId,
    String? selectedCellId,
    String? nextCellPosition,
    bool isOffline,
    bool isLoading,
  });
}

/// @nodoc
class _$TallyMonitorStateCopyWithImpl<$Res, $Val extends TallyMonitorState>
    implements $TallyMonitorStateCopyWith<$Res> {
  _$TallyMonitorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TallyMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? activeItemId = freezed,
    Object? activePalletId = freezed,
    Object? selectedCellId = freezed,
    Object? nextCellPosition = freezed,
    Object? isOffline = null,
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
            activePalletId: freezed == activePalletId
                ? _value.activePalletId
                : activePalletId // ignore: cast_nullable_to_non_nullable
                      as String?,
            selectedCellId: freezed == selectedCellId
                ? _value.selectedCellId
                : selectedCellId // ignore: cast_nullable_to_non_nullable
                      as String?,
            nextCellPosition: freezed == nextCellPosition
                ? _value.nextCellPosition
                : nextCellPosition // ignore: cast_nullable_to_non_nullable
                      as String?,
            isOffline: null == isOffline
                ? _value.isOffline
                : isOffline // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$TallyMonitorStateImplCopyWith<$Res>
    implements $TallyMonitorStateCopyWith<$Res> {
  factory _$$TallyMonitorStateImplCopyWith(
    _$TallyMonitorStateImpl value,
    $Res Function(_$TallyMonitorStateImpl) then,
  ) = __$$TallyMonitorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<String, TallyItem> items,
    String? activeItemId,
    String? activePalletId,
    String? selectedCellId,
    String? nextCellPosition,
    bool isOffline,
    bool isLoading,
  });
}

/// @nodoc
class __$$TallyMonitorStateImplCopyWithImpl<$Res>
    extends _$TallyMonitorStateCopyWithImpl<$Res, _$TallyMonitorStateImpl>
    implements _$$TallyMonitorStateImplCopyWith<$Res> {
  __$$TallyMonitorStateImplCopyWithImpl(
    _$TallyMonitorStateImpl _value,
    $Res Function(_$TallyMonitorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? activeItemId = freezed,
    Object? activePalletId = freezed,
    Object? selectedCellId = freezed,
    Object? nextCellPosition = freezed,
    Object? isOffline = null,
    Object? isLoading = null,
  }) {
    return _then(
      _$TallyMonitorStateImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as Map<String, TallyItem>,
        activeItemId: freezed == activeItemId
            ? _value.activeItemId
            : activeItemId // ignore: cast_nullable_to_non_nullable
                  as String?,
        activePalletId: freezed == activePalletId
            ? _value.activePalletId
            : activePalletId // ignore: cast_nullable_to_non_nullable
                  as String?,
        selectedCellId: freezed == selectedCellId
            ? _value.selectedCellId
            : selectedCellId // ignore: cast_nullable_to_non_nullable
                  as String?,
        nextCellPosition: freezed == nextCellPosition
            ? _value.nextCellPosition
            : nextCellPosition // ignore: cast_nullable_to_non_nullable
                  as String?,
        isOffline: null == isOffline
            ? _value.isOffline
            : isOffline // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$TallyMonitorStateImpl extends _TallyMonitorState {
  const _$TallyMonitorStateImpl({
    final Map<String, TallyItem> items = const {},
    this.activeItemId = null,
    this.activePalletId = null,
    this.selectedCellId = null,
    this.nextCellPosition = null,
    this.isOffline = false,
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

  /// Currently active pallet ID
  @override
  @JsonKey()
  final String? activePalletId;

  /// Currently selected cell ID
  @override
  @JsonKey()
  final String? selectedCellId;

  /// Next cell position for auto-focus
  @override
  @JsonKey()
  final String? nextCellPosition;

  /// Offline mode flag
  @override
  @JsonKey()
  final bool isOffline;

  /// Loading state
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'TallyMonitorState(items: $items, activeItemId: $activeItemId, activePalletId: $activePalletId, selectedCellId: $selectedCellId, nextCellPosition: $nextCellPosition, isOffline: $isOffline, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TallyMonitorStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.activeItemId, activeItemId) ||
                other.activeItemId == activeItemId) &&
            (identical(other.activePalletId, activePalletId) ||
                other.activePalletId == activePalletId) &&
            (identical(other.selectedCellId, selectedCellId) ||
                other.selectedCellId == selectedCellId) &&
            (identical(other.nextCellPosition, nextCellPosition) ||
                other.nextCellPosition == nextCellPosition) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    activeItemId,
    activePalletId,
    selectedCellId,
    nextCellPosition,
    isOffline,
    isLoading,
  );

  /// Create a copy of TallyMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TallyMonitorStateImplCopyWith<_$TallyMonitorStateImpl> get copyWith =>
      __$$TallyMonitorStateImplCopyWithImpl<_$TallyMonitorStateImpl>(
        this,
        _$identity,
      );
}

abstract class _TallyMonitorState extends TallyMonitorState {
  const factory _TallyMonitorState({
    final Map<String, TallyItem> items,
    final String? activeItemId,
    final String? activePalletId,
    final String? selectedCellId,
    final String? nextCellPosition,
    final bool isOffline,
    final bool isLoading,
  }) = _$TallyMonitorStateImpl;
  const _TallyMonitorState._() : super._();

  /// All items data
  @override
  Map<String, TallyItem> get items;

  /// Currently active item ID
  @override
  String? get activeItemId;

  /// Currently active pallet ID
  @override
  String? get activePalletId;

  /// Currently selected cell ID
  @override
  String? get selectedCellId;

  /// Next cell position for auto-focus
  @override
  String? get nextCellPosition;

  /// Offline mode flag
  @override
  bool get isOffline;

  /// Loading state
  @override
  bool get isLoading;

  /// Create a copy of TallyMonitorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TallyMonitorStateImplCopyWith<_$TallyMonitorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
