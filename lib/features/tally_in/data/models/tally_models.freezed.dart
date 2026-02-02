// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tally_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TallyCell {
  String get id => throw _privateConstructorUsedError;
  String get rowLabel => throw _privateConstructorUsedError;
  int get columnIndex => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  String? get condition => throw _privateConstructorUsedError;
  DateTime? get prodDate => throw _privateConstructorUsedError;
  DateTime? get expDate => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of TallyCell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TallyCellCopyWith<TallyCell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TallyCellCopyWith<$Res> {
  factory $TallyCellCopyWith(TallyCell value, $Res Function(TallyCell) then) =
      _$TallyCellCopyWithImpl<$Res, TallyCell>;
  @useResult
  $Res call({
    String id,
    String rowLabel,
    int columnIndex,
    double? weight,
    String? condition,
    DateTime? prodDate,
    DateTime? expDate,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$TallyCellCopyWithImpl<$Res, $Val extends TallyCell>
    implements $TallyCellCopyWith<$Res> {
  _$TallyCellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TallyCell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rowLabel = null,
    Object? columnIndex = null,
    Object? weight = freezed,
    Object? condition = freezed,
    Object? prodDate = freezed,
    Object? expDate = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            rowLabel: null == rowLabel
                ? _value.rowLabel
                : rowLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            columnIndex: null == columnIndex
                ? _value.columnIndex
                : columnIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            weight: freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double?,
            condition: freezed == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as String?,
            prodDate: freezed == prodDate
                ? _value.prodDate
                : prodDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            expDate: freezed == expDate
                ? _value.expDate
                : expDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TallyCellImplCopyWith<$Res>
    implements $TallyCellCopyWith<$Res> {
  factory _$$TallyCellImplCopyWith(
    _$TallyCellImpl value,
    $Res Function(_$TallyCellImpl) then,
  ) = __$$TallyCellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String rowLabel,
    int columnIndex,
    double? weight,
    String? condition,
    DateTime? prodDate,
    DateTime? expDate,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$TallyCellImplCopyWithImpl<$Res>
    extends _$TallyCellCopyWithImpl<$Res, _$TallyCellImpl>
    implements _$$TallyCellImplCopyWith<$Res> {
  __$$TallyCellImplCopyWithImpl(
    _$TallyCellImpl _value,
    $Res Function(_$TallyCellImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyCell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rowLabel = null,
    Object? columnIndex = null,
    Object? weight = freezed,
    Object? condition = freezed,
    Object? prodDate = freezed,
    Object? expDate = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$TallyCellImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        rowLabel: null == rowLabel
            ? _value.rowLabel
            : rowLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        columnIndex: null == columnIndex
            ? _value.columnIndex
            : columnIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        weight: freezed == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double?,
        condition: freezed == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as String?,
        prodDate: freezed == prodDate
            ? _value.prodDate
            : prodDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        expDate: freezed == expDate
            ? _value.expDate
            : expDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$TallyCellImpl extends _TallyCell {
  const _$TallyCellImpl({
    required this.id,
    required this.rowLabel,
    required this.columnIndex,
    this.weight = null,
    this.condition = null,
    this.prodDate = null,
    this.expDate = null,
    this.createdAt = null,
  }) : super._();

  @override
  final String id;
  @override
  final String rowLabel;
  @override
  final int columnIndex;
  @override
  @JsonKey()
  final double? weight;
  @override
  @JsonKey()
  final String? condition;
  @override
  @JsonKey()
  final DateTime? prodDate;
  @override
  @JsonKey()
  final DateTime? expDate;
  @override
  @JsonKey()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'TallyCell(id: $id, rowLabel: $rowLabel, columnIndex: $columnIndex, weight: $weight, condition: $condition, prodDate: $prodDate, expDate: $expDate, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TallyCellImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rowLabel, rowLabel) ||
                other.rowLabel == rowLabel) &&
            (identical(other.columnIndex, columnIndex) ||
                other.columnIndex == columnIndex) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.prodDate, prodDate) ||
                other.prodDate == prodDate) &&
            (identical(other.expDate, expDate) || other.expDate == expDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    rowLabel,
    columnIndex,
    weight,
    condition,
    prodDate,
    expDate,
    createdAt,
  );

  /// Create a copy of TallyCell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TallyCellImplCopyWith<_$TallyCellImpl> get copyWith =>
      __$$TallyCellImplCopyWithImpl<_$TallyCellImpl>(this, _$identity);
}

abstract class _TallyCell extends TallyCell {
  const factory _TallyCell({
    required final String id,
    required final String rowLabel,
    required final int columnIndex,
    final double? weight,
    final String? condition,
    final DateTime? prodDate,
    final DateTime? expDate,
    final DateTime? createdAt,
  }) = _$TallyCellImpl;
  const _TallyCell._() : super._();

  @override
  String get id;
  @override
  String get rowLabel;
  @override
  int get columnIndex;
  @override
  double? get weight;
  @override
  String? get condition;
  @override
  DateTime? get prodDate;
  @override
  DateTime? get expDate;
  @override
  DateTime? get createdAt;

  /// Create a copy of TallyCell
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TallyCellImplCopyWith<_$TallyCellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TallyPallet {
  String get id => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  int get palletNumber => throw _privateConstructorUsedError;
  String get palletCode => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  Map<String, TallyCell> get cells => throw _privateConstructorUsedError;
  int get maxPcs => throw _privateConstructorUsedError;

  /// Create a copy of TallyPallet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TallyPalletCopyWith<TallyPallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TallyPalletCopyWith<$Res> {
  factory $TallyPalletCopyWith(
    TallyPallet value,
    $Res Function(TallyPallet) then,
  ) = _$TallyPalletCopyWithImpl<$Res, TallyPallet>;
  @useResult
  $Res call({
    String id,
    String itemId,
    int palletNumber,
    String palletCode,
    String status,
    Map<String, TallyCell> cells,
    int maxPcs,
  });
}

/// @nodoc
class _$TallyPalletCopyWithImpl<$Res, $Val extends TallyPallet>
    implements $TallyPalletCopyWith<$Res> {
  _$TallyPalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TallyPallet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? palletNumber = null,
    Object? palletCode = null,
    Object? status = null,
    Object? cells = null,
    Object? maxPcs = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            itemId: null == itemId
                ? _value.itemId
                : itemId // ignore: cast_nullable_to_non_nullable
                      as String,
            palletNumber: null == palletNumber
                ? _value.palletNumber
                : palletNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            palletCode: null == palletCode
                ? _value.palletCode
                : palletCode // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            cells: null == cells
                ? _value.cells
                : cells // ignore: cast_nullable_to_non_nullable
                      as Map<String, TallyCell>,
            maxPcs: null == maxPcs
                ? _value.maxPcs
                : maxPcs // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TallyPalletImplCopyWith<$Res>
    implements $TallyPalletCopyWith<$Res> {
  factory _$$TallyPalletImplCopyWith(
    _$TallyPalletImpl value,
    $Res Function(_$TallyPalletImpl) then,
  ) = __$$TallyPalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String itemId,
    int palletNumber,
    String palletCode,
    String status,
    Map<String, TallyCell> cells,
    int maxPcs,
  });
}

/// @nodoc
class __$$TallyPalletImplCopyWithImpl<$Res>
    extends _$TallyPalletCopyWithImpl<$Res, _$TallyPalletImpl>
    implements _$$TallyPalletImplCopyWith<$Res> {
  __$$TallyPalletImplCopyWithImpl(
    _$TallyPalletImpl _value,
    $Res Function(_$TallyPalletImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyPallet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? palletNumber = null,
    Object? palletCode = null,
    Object? status = null,
    Object? cells = null,
    Object? maxPcs = null,
  }) {
    return _then(
      _$TallyPalletImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        itemId: null == itemId
            ? _value.itemId
            : itemId // ignore: cast_nullable_to_non_nullable
                  as String,
        palletNumber: null == palletNumber
            ? _value.palletNumber
            : palletNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        palletCode: null == palletCode
            ? _value.palletCode
            : palletCode // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        cells: null == cells
            ? _value._cells
            : cells // ignore: cast_nullable_to_non_nullable
                  as Map<String, TallyCell>,
        maxPcs: null == maxPcs
            ? _value.maxPcs
            : maxPcs // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$TallyPalletImpl extends _TallyPallet {
  const _$TallyPalletImpl({
    required this.id,
    required this.itemId,
    required this.palletNumber,
    required this.palletCode,
    this.status = 'In Progress',
    final Map<String, TallyCell> cells = const {},
    this.maxPcs = 10,
  }) : _cells = cells,
       super._();

  @override
  final String id;
  @override
  final String itemId;
  @override
  final int palletNumber;
  @override
  final String palletCode;
  @override
  @JsonKey()
  final String status;
  final Map<String, TallyCell> _cells;
  @override
  @JsonKey()
  Map<String, TallyCell> get cells {
    if (_cells is EqualUnmodifiableMapView) return _cells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cells);
  }

  @override
  @JsonKey()
  final int maxPcs;

  @override
  String toString() {
    return 'TallyPallet(id: $id, itemId: $itemId, palletNumber: $palletNumber, palletCode: $palletCode, status: $status, cells: $cells, maxPcs: $maxPcs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TallyPalletImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.palletNumber, palletNumber) ||
                other.palletNumber == palletNumber) &&
            (identical(other.palletCode, palletCode) ||
                other.palletCode == palletCode) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._cells, _cells) &&
            (identical(other.maxPcs, maxPcs) || other.maxPcs == maxPcs));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    itemId,
    palletNumber,
    palletCode,
    status,
    const DeepCollectionEquality().hash(_cells),
    maxPcs,
  );

  /// Create a copy of TallyPallet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TallyPalletImplCopyWith<_$TallyPalletImpl> get copyWith =>
      __$$TallyPalletImplCopyWithImpl<_$TallyPalletImpl>(this, _$identity);
}

abstract class _TallyPallet extends TallyPallet {
  const factory _TallyPallet({
    required final String id,
    required final String itemId,
    required final int palletNumber,
    required final String palletCode,
    final String status,
    final Map<String, TallyCell> cells,
    final int maxPcs,
  }) = _$TallyPalletImpl;
  const _TallyPallet._() : super._();

  @override
  String get id;
  @override
  String get itemId;
  @override
  int get palletNumber;
  @override
  String get palletCode;
  @override
  String get status;
  @override
  Map<String, TallyCell> get cells;
  @override
  int get maxPcs;

  /// Create a copy of TallyPallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TallyPalletImplCopyWith<_$TallyPalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TallyItem {
  String get id => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get batchCode => throw _privateConstructorUsedError;
  Map<String, TallyPallet> get pallets => throw _privateConstructorUsedError;
  String? get activePalletId => throw _privateConstructorUsedError;
  bool get isFinished => throw _privateConstructorUsedError;

  /// Create a copy of TallyItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TallyItemCopyWith<TallyItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TallyItemCopyWith<$Res> {
  factory $TallyItemCopyWith(TallyItem value, $Res Function(TallyItem) then) =
      _$TallyItemCopyWithImpl<$Res, TallyItem>;
  @useResult
  $Res call({
    String id,
    String productName,
    String batchCode,
    Map<String, TallyPallet> pallets,
    String? activePalletId,
    bool isFinished,
  });
}

/// @nodoc
class _$TallyItemCopyWithImpl<$Res, $Val extends TallyItem>
    implements $TallyItemCopyWith<$Res> {
  _$TallyItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TallyItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productName = null,
    Object? batchCode = null,
    Object? pallets = null,
    Object? activePalletId = freezed,
    Object? isFinished = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            productName: null == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String,
            batchCode: null == batchCode
                ? _value.batchCode
                : batchCode // ignore: cast_nullable_to_non_nullable
                      as String,
            pallets: null == pallets
                ? _value.pallets
                : pallets // ignore: cast_nullable_to_non_nullable
                      as Map<String, TallyPallet>,
            activePalletId: freezed == activePalletId
                ? _value.activePalletId
                : activePalletId // ignore: cast_nullable_to_non_nullable
                      as String?,
            isFinished: null == isFinished
                ? _value.isFinished
                : isFinished // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TallyItemImplCopyWith<$Res>
    implements $TallyItemCopyWith<$Res> {
  factory _$$TallyItemImplCopyWith(
    _$TallyItemImpl value,
    $Res Function(_$TallyItemImpl) then,
  ) = __$$TallyItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String productName,
    String batchCode,
    Map<String, TallyPallet> pallets,
    String? activePalletId,
    bool isFinished,
  });
}

/// @nodoc
class __$$TallyItemImplCopyWithImpl<$Res>
    extends _$TallyItemCopyWithImpl<$Res, _$TallyItemImpl>
    implements _$$TallyItemImplCopyWith<$Res> {
  __$$TallyItemImplCopyWithImpl(
    _$TallyItemImpl _value,
    $Res Function(_$TallyItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productName = null,
    Object? batchCode = null,
    Object? pallets = null,
    Object? activePalletId = freezed,
    Object? isFinished = null,
  }) {
    return _then(
      _$TallyItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        productName: null == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String,
        batchCode: null == batchCode
            ? _value.batchCode
            : batchCode // ignore: cast_nullable_to_non_nullable
                  as String,
        pallets: null == pallets
            ? _value._pallets
            : pallets // ignore: cast_nullable_to_non_nullable
                  as Map<String, TallyPallet>,
        activePalletId: freezed == activePalletId
            ? _value.activePalletId
            : activePalletId // ignore: cast_nullable_to_non_nullable
                  as String?,
        isFinished: null == isFinished
            ? _value.isFinished
            : isFinished // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$TallyItemImpl extends _TallyItem {
  const _$TallyItemImpl({
    required this.id,
    required this.productName,
    required this.batchCode,
    final Map<String, TallyPallet> pallets = const {},
    this.activePalletId = null,
    this.isFinished = false,
  }) : _pallets = pallets,
       super._();

  @override
  final String id;
  @override
  final String productName;
  @override
  final String batchCode;
  final Map<String, TallyPallet> _pallets;
  @override
  @JsonKey()
  Map<String, TallyPallet> get pallets {
    if (_pallets is EqualUnmodifiableMapView) return _pallets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pallets);
  }

  @override
  @JsonKey()
  final String? activePalletId;
  @override
  @JsonKey()
  final bool isFinished;

  @override
  String toString() {
    return 'TallyItem(id: $id, productName: $productName, batchCode: $batchCode, pallets: $pallets, activePalletId: $activePalletId, isFinished: $isFinished)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TallyItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.batchCode, batchCode) ||
                other.batchCode == batchCode) &&
            const DeepCollectionEquality().equals(other._pallets, _pallets) &&
            (identical(other.activePalletId, activePalletId) ||
                other.activePalletId == activePalletId) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    productName,
    batchCode,
    const DeepCollectionEquality().hash(_pallets),
    activePalletId,
    isFinished,
  );

  /// Create a copy of TallyItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TallyItemImplCopyWith<_$TallyItemImpl> get copyWith =>
      __$$TallyItemImplCopyWithImpl<_$TallyItemImpl>(this, _$identity);
}

abstract class _TallyItem extends TallyItem {
  const factory _TallyItem({
    required final String id,
    required final String productName,
    required final String batchCode,
    final Map<String, TallyPallet> pallets,
    final String? activePalletId,
    final bool isFinished,
  }) = _$TallyItemImpl;
  const _TallyItem._() : super._();

  @override
  String get id;
  @override
  String get productName;
  @override
  String get batchCode;
  @override
  Map<String, TallyPallet> get pallets;
  @override
  String? get activePalletId;
  @override
  bool get isFinished;

  /// Create a copy of TallyItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TallyItemImplCopyWith<_$TallyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddWeightData {
  double get weight => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;
  DateTime get prodDate => throw _privateConstructorUsedError;
  DateTime get expDate => throw _privateConstructorUsedError;

  /// Create a copy of AddWeightData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddWeightDataCopyWith<AddWeightData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddWeightDataCopyWith<$Res> {
  factory $AddWeightDataCopyWith(
    AddWeightData value,
    $Res Function(AddWeightData) then,
  ) = _$AddWeightDataCopyWithImpl<$Res, AddWeightData>;
  @useResult
  $Res call({
    double weight,
    String condition,
    DateTime prodDate,
    DateTime expDate,
  });
}

/// @nodoc
class _$AddWeightDataCopyWithImpl<$Res, $Val extends AddWeightData>
    implements $AddWeightDataCopyWith<$Res> {
  _$AddWeightDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddWeightData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = null,
    Object? condition = null,
    Object? prodDate = null,
    Object? expDate = null,
  }) {
    return _then(
      _value.copyWith(
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double,
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as String,
            prodDate: null == prodDate
                ? _value.prodDate
                : prodDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            expDate: null == expDate
                ? _value.expDate
                : expDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddWeightDataImplCopyWith<$Res>
    implements $AddWeightDataCopyWith<$Res> {
  factory _$$AddWeightDataImplCopyWith(
    _$AddWeightDataImpl value,
    $Res Function(_$AddWeightDataImpl) then,
  ) = __$$AddWeightDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double weight,
    String condition,
    DateTime prodDate,
    DateTime expDate,
  });
}

/// @nodoc
class __$$AddWeightDataImplCopyWithImpl<$Res>
    extends _$AddWeightDataCopyWithImpl<$Res, _$AddWeightDataImpl>
    implements _$$AddWeightDataImplCopyWith<$Res> {
  __$$AddWeightDataImplCopyWithImpl(
    _$AddWeightDataImpl _value,
    $Res Function(_$AddWeightDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddWeightData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = null,
    Object? condition = null,
    Object? prodDate = null,
    Object? expDate = null,
  }) {
    return _then(
      _$AddWeightDataImpl(
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double,
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as String,
        prodDate: null == prodDate
            ? _value.prodDate
            : prodDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expDate: null == expDate
            ? _value.expDate
            : expDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$AddWeightDataImpl implements _AddWeightData {
  const _$AddWeightDataImpl({
    required this.weight,
    required this.condition,
    required this.prodDate,
    required this.expDate,
  });

  @override
  final double weight;
  @override
  final String condition;
  @override
  final DateTime prodDate;
  @override
  final DateTime expDate;

  @override
  String toString() {
    return 'AddWeightData(weight: $weight, condition: $condition, prodDate: $prodDate, expDate: $expDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddWeightDataImpl &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.prodDate, prodDate) ||
                other.prodDate == prodDate) &&
            (identical(other.expDate, expDate) || other.expDate == expDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, weight, condition, prodDate, expDate);

  /// Create a copy of AddWeightData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddWeightDataImplCopyWith<_$AddWeightDataImpl> get copyWith =>
      __$$AddWeightDataImplCopyWithImpl<_$AddWeightDataImpl>(this, _$identity);
}

abstract class _AddWeightData implements AddWeightData {
  const factory _AddWeightData({
    required final double weight,
    required final String condition,
    required final DateTime prodDate,
    required final DateTime expDate,
  }) = _$AddWeightDataImpl;

  @override
  double get weight;
  @override
  String get condition;
  @override
  DateTime get prodDate;
  @override
  DateTime get expDate;

  /// Create a copy of AddWeightData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddWeightDataImplCopyWith<_$AddWeightDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TallyTopBarData {
  String get asnNumber => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get vehicleNumber => throw _privateConstructorUsedError;
  String get containerSeal => throw _privateConstructorUsedError;
  bool get isOffline => throw _privateConstructorUsedError;

  /// Create a copy of TallyTopBarData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TallyTopBarDataCopyWith<TallyTopBarData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TallyTopBarDataCopyWith<$Res> {
  factory $TallyTopBarDataCopyWith(
    TallyTopBarData value,
    $Res Function(TallyTopBarData) then,
  ) = _$TallyTopBarDataCopyWithImpl<$Res, TallyTopBarData>;
  @useResult
  $Res call({
    String asnNumber,
    String companyName,
    String vehicleNumber,
    String containerSeal,
    bool isOffline,
  });
}

/// @nodoc
class _$TallyTopBarDataCopyWithImpl<$Res, $Val extends TallyTopBarData>
    implements $TallyTopBarDataCopyWith<$Res> {
  _$TallyTopBarDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TallyTopBarData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asnNumber = null,
    Object? companyName = null,
    Object? vehicleNumber = null,
    Object? containerSeal = null,
    Object? isOffline = null,
  }) {
    return _then(
      _value.copyWith(
            asnNumber: null == asnNumber
                ? _value.asnNumber
                : asnNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            companyName: null == companyName
                ? _value.companyName
                : companyName // ignore: cast_nullable_to_non_nullable
                      as String,
            vehicleNumber: null == vehicleNumber
                ? _value.vehicleNumber
                : vehicleNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            containerSeal: null == containerSeal
                ? _value.containerSeal
                : containerSeal // ignore: cast_nullable_to_non_nullable
                      as String,
            isOffline: null == isOffline
                ? _value.isOffline
                : isOffline // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TallyTopBarDataImplCopyWith<$Res>
    implements $TallyTopBarDataCopyWith<$Res> {
  factory _$$TallyTopBarDataImplCopyWith(
    _$TallyTopBarDataImpl value,
    $Res Function(_$TallyTopBarDataImpl) then,
  ) = __$$TallyTopBarDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String asnNumber,
    String companyName,
    String vehicleNumber,
    String containerSeal,
    bool isOffline,
  });
}

/// @nodoc
class __$$TallyTopBarDataImplCopyWithImpl<$Res>
    extends _$TallyTopBarDataCopyWithImpl<$Res, _$TallyTopBarDataImpl>
    implements _$$TallyTopBarDataImplCopyWith<$Res> {
  __$$TallyTopBarDataImplCopyWithImpl(
    _$TallyTopBarDataImpl _value,
    $Res Function(_$TallyTopBarDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyTopBarData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asnNumber = null,
    Object? companyName = null,
    Object? vehicleNumber = null,
    Object? containerSeal = null,
    Object? isOffline = null,
  }) {
    return _then(
      _$TallyTopBarDataImpl(
        asnNumber: null == asnNumber
            ? _value.asnNumber
            : asnNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        companyName: null == companyName
            ? _value.companyName
            : companyName // ignore: cast_nullable_to_non_nullable
                  as String,
        vehicleNumber: null == vehicleNumber
            ? _value.vehicleNumber
            : vehicleNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        containerSeal: null == containerSeal
            ? _value.containerSeal
            : containerSeal // ignore: cast_nullable_to_non_nullable
                  as String,
        isOffline: null == isOffline
            ? _value.isOffline
            : isOffline // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$TallyTopBarDataImpl implements _TallyTopBarData {
  const _$TallyTopBarDataImpl({
    required this.asnNumber,
    required this.companyName,
    required this.vehicleNumber,
    required this.containerSeal,
    this.isOffline = false,
  });

  @override
  final String asnNumber;
  @override
  final String companyName;
  @override
  final String vehicleNumber;
  @override
  final String containerSeal;
  @override
  @JsonKey()
  final bool isOffline;

  @override
  String toString() {
    return 'TallyTopBarData(asnNumber: $asnNumber, companyName: $companyName, vehicleNumber: $vehicleNumber, containerSeal: $containerSeal, isOffline: $isOffline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TallyTopBarDataImpl &&
            (identical(other.asnNumber, asnNumber) ||
                other.asnNumber == asnNumber) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber) &&
            (identical(other.containerSeal, containerSeal) ||
                other.containerSeal == containerSeal) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    asnNumber,
    companyName,
    vehicleNumber,
    containerSeal,
    isOffline,
  );

  /// Create a copy of TallyTopBarData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TallyTopBarDataImplCopyWith<_$TallyTopBarDataImpl> get copyWith =>
      __$$TallyTopBarDataImplCopyWithImpl<_$TallyTopBarDataImpl>(
        this,
        _$identity,
      );
}

abstract class _TallyTopBarData implements TallyTopBarData {
  const factory _TallyTopBarData({
    required final String asnNumber,
    required final String companyName,
    required final String vehicleNumber,
    required final String containerSeal,
    final bool isOffline,
  }) = _$TallyTopBarDataImpl;

  @override
  String get asnNumber;
  @override
  String get companyName;
  @override
  String get vehicleNumber;
  @override
  String get containerSeal;
  @override
  bool get isOffline;

  /// Create a copy of TallyTopBarData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TallyTopBarDataImplCopyWith<_$TallyTopBarDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
