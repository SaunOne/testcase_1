// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tally_input_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TallyInputEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String key) numpadPressed,
    required TResult Function() deleteLastChar,
    required TResult Function() clearInput,
    required TResult Function(int places) setDecimalPlaces,
    required TResult Function(String condition) setCondition,
    required TResult Function(DateTime date) setProdDate,
    required TResult Function(DateTime date) setExpDate,
    required TResult Function() submitInput,
    required TResult Function() resetStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String key)? numpadPressed,
    TResult? Function()? deleteLastChar,
    TResult? Function()? clearInput,
    TResult? Function(int places)? setDecimalPlaces,
    TResult? Function(String condition)? setCondition,
    TResult? Function(DateTime date)? setProdDate,
    TResult? Function(DateTime date)? setExpDate,
    TResult? Function()? submitInput,
    TResult? Function()? resetStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String key)? numpadPressed,
    TResult Function()? deleteLastChar,
    TResult Function()? clearInput,
    TResult Function(int places)? setDecimalPlaces,
    TResult Function(String condition)? setCondition,
    TResult Function(DateTime date)? setProdDate,
    TResult Function(DateTime date)? setExpDate,
    TResult Function()? submitInput,
    TResult Function()? resetStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumpadPressed value) numpadPressed,
    required TResult Function(_DeleteLastChar value) deleteLastChar,
    required TResult Function(_ClearInput value) clearInput,
    required TResult Function(_SetDecimalPlaces value) setDecimalPlaces,
    required TResult Function(_SetCondition value) setCondition,
    required TResult Function(_SetProdDate value) setProdDate,
    required TResult Function(_SetExpDate value) setExpDate,
    required TResult Function(_SubmitInput value) submitInput,
    required TResult Function(_ResetStatus value) resetStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NumpadPressed value)? numpadPressed,
    TResult? Function(_DeleteLastChar value)? deleteLastChar,
    TResult? Function(_ClearInput value)? clearInput,
    TResult? Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult? Function(_SetCondition value)? setCondition,
    TResult? Function(_SetProdDate value)? setProdDate,
    TResult? Function(_SetExpDate value)? setExpDate,
    TResult? Function(_SubmitInput value)? submitInput,
    TResult? Function(_ResetStatus value)? resetStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumpadPressed value)? numpadPressed,
    TResult Function(_DeleteLastChar value)? deleteLastChar,
    TResult Function(_ClearInput value)? clearInput,
    TResult Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult Function(_SetCondition value)? setCondition,
    TResult Function(_SetProdDate value)? setProdDate,
    TResult Function(_SetExpDate value)? setExpDate,
    TResult Function(_SubmitInput value)? submitInput,
    TResult Function(_ResetStatus value)? resetStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TallyInputEventCopyWith<$Res> {
  factory $TallyInputEventCopyWith(
    TallyInputEvent value,
    $Res Function(TallyInputEvent) then,
  ) = _$TallyInputEventCopyWithImpl<$Res, TallyInputEvent>;
}

/// @nodoc
class _$TallyInputEventCopyWithImpl<$Res, $Val extends TallyInputEvent>
    implements $TallyInputEventCopyWith<$Res> {
  _$TallyInputEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NumpadPressedImplCopyWith<$Res> {
  factory _$$NumpadPressedImplCopyWith(
    _$NumpadPressedImpl value,
    $Res Function(_$NumpadPressedImpl) then,
  ) = __$$NumpadPressedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String key});
}

/// @nodoc
class __$$NumpadPressedImplCopyWithImpl<$Res>
    extends _$TallyInputEventCopyWithImpl<$Res, _$NumpadPressedImpl>
    implements _$$NumpadPressedImplCopyWith<$Res> {
  __$$NumpadPressedImplCopyWithImpl(
    _$NumpadPressedImpl _value,
    $Res Function(_$NumpadPressedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? key = null}) {
    return _then(
      _$NumpadPressedImpl(
        null == key
            ? _value.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NumpadPressedImpl implements _NumpadPressed {
  const _$NumpadPressedImpl(this.key);

  @override
  final String key;

  @override
  String toString() {
    return 'TallyInputEvent.numpadPressed(key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumpadPressedImpl &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumpadPressedImplCopyWith<_$NumpadPressedImpl> get copyWith =>
      __$$NumpadPressedImplCopyWithImpl<_$NumpadPressedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String key) numpadPressed,
    required TResult Function() deleteLastChar,
    required TResult Function() clearInput,
    required TResult Function(int places) setDecimalPlaces,
    required TResult Function(String condition) setCondition,
    required TResult Function(DateTime date) setProdDate,
    required TResult Function(DateTime date) setExpDate,
    required TResult Function() submitInput,
    required TResult Function() resetStatus,
  }) {
    return numpadPressed(key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String key)? numpadPressed,
    TResult? Function()? deleteLastChar,
    TResult? Function()? clearInput,
    TResult? Function(int places)? setDecimalPlaces,
    TResult? Function(String condition)? setCondition,
    TResult? Function(DateTime date)? setProdDate,
    TResult? Function(DateTime date)? setExpDate,
    TResult? Function()? submitInput,
    TResult? Function()? resetStatus,
  }) {
    return numpadPressed?.call(key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String key)? numpadPressed,
    TResult Function()? deleteLastChar,
    TResult Function()? clearInput,
    TResult Function(int places)? setDecimalPlaces,
    TResult Function(String condition)? setCondition,
    TResult Function(DateTime date)? setProdDate,
    TResult Function(DateTime date)? setExpDate,
    TResult Function()? submitInput,
    TResult Function()? resetStatus,
    required TResult orElse(),
  }) {
    if (numpadPressed != null) {
      return numpadPressed(key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumpadPressed value) numpadPressed,
    required TResult Function(_DeleteLastChar value) deleteLastChar,
    required TResult Function(_ClearInput value) clearInput,
    required TResult Function(_SetDecimalPlaces value) setDecimalPlaces,
    required TResult Function(_SetCondition value) setCondition,
    required TResult Function(_SetProdDate value) setProdDate,
    required TResult Function(_SetExpDate value) setExpDate,
    required TResult Function(_SubmitInput value) submitInput,
    required TResult Function(_ResetStatus value) resetStatus,
  }) {
    return numpadPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NumpadPressed value)? numpadPressed,
    TResult? Function(_DeleteLastChar value)? deleteLastChar,
    TResult? Function(_ClearInput value)? clearInput,
    TResult? Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult? Function(_SetCondition value)? setCondition,
    TResult? Function(_SetProdDate value)? setProdDate,
    TResult? Function(_SetExpDate value)? setExpDate,
    TResult? Function(_SubmitInput value)? submitInput,
    TResult? Function(_ResetStatus value)? resetStatus,
  }) {
    return numpadPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumpadPressed value)? numpadPressed,
    TResult Function(_DeleteLastChar value)? deleteLastChar,
    TResult Function(_ClearInput value)? clearInput,
    TResult Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult Function(_SetCondition value)? setCondition,
    TResult Function(_SetProdDate value)? setProdDate,
    TResult Function(_SetExpDate value)? setExpDate,
    TResult Function(_SubmitInput value)? submitInput,
    TResult Function(_ResetStatus value)? resetStatus,
    required TResult orElse(),
  }) {
    if (numpadPressed != null) {
      return numpadPressed(this);
    }
    return orElse();
  }
}

abstract class _NumpadPressed implements TallyInputEvent {
  const factory _NumpadPressed(final String key) = _$NumpadPressedImpl;

  String get key;

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumpadPressedImplCopyWith<_$NumpadPressedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteLastCharImplCopyWith<$Res> {
  factory _$$DeleteLastCharImplCopyWith(
    _$DeleteLastCharImpl value,
    $Res Function(_$DeleteLastCharImpl) then,
  ) = __$$DeleteLastCharImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteLastCharImplCopyWithImpl<$Res>
    extends _$TallyInputEventCopyWithImpl<$Res, _$DeleteLastCharImpl>
    implements _$$DeleteLastCharImplCopyWith<$Res> {
  __$$DeleteLastCharImplCopyWithImpl(
    _$DeleteLastCharImpl _value,
    $Res Function(_$DeleteLastCharImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteLastCharImpl implements _DeleteLastChar {
  const _$DeleteLastCharImpl();

  @override
  String toString() {
    return 'TallyInputEvent.deleteLastChar()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteLastCharImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String key) numpadPressed,
    required TResult Function() deleteLastChar,
    required TResult Function() clearInput,
    required TResult Function(int places) setDecimalPlaces,
    required TResult Function(String condition) setCondition,
    required TResult Function(DateTime date) setProdDate,
    required TResult Function(DateTime date) setExpDate,
    required TResult Function() submitInput,
    required TResult Function() resetStatus,
  }) {
    return deleteLastChar();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String key)? numpadPressed,
    TResult? Function()? deleteLastChar,
    TResult? Function()? clearInput,
    TResult? Function(int places)? setDecimalPlaces,
    TResult? Function(String condition)? setCondition,
    TResult? Function(DateTime date)? setProdDate,
    TResult? Function(DateTime date)? setExpDate,
    TResult? Function()? submitInput,
    TResult? Function()? resetStatus,
  }) {
    return deleteLastChar?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String key)? numpadPressed,
    TResult Function()? deleteLastChar,
    TResult Function()? clearInput,
    TResult Function(int places)? setDecimalPlaces,
    TResult Function(String condition)? setCondition,
    TResult Function(DateTime date)? setProdDate,
    TResult Function(DateTime date)? setExpDate,
    TResult Function()? submitInput,
    TResult Function()? resetStatus,
    required TResult orElse(),
  }) {
    if (deleteLastChar != null) {
      return deleteLastChar();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumpadPressed value) numpadPressed,
    required TResult Function(_DeleteLastChar value) deleteLastChar,
    required TResult Function(_ClearInput value) clearInput,
    required TResult Function(_SetDecimalPlaces value) setDecimalPlaces,
    required TResult Function(_SetCondition value) setCondition,
    required TResult Function(_SetProdDate value) setProdDate,
    required TResult Function(_SetExpDate value) setExpDate,
    required TResult Function(_SubmitInput value) submitInput,
    required TResult Function(_ResetStatus value) resetStatus,
  }) {
    return deleteLastChar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NumpadPressed value)? numpadPressed,
    TResult? Function(_DeleteLastChar value)? deleteLastChar,
    TResult? Function(_ClearInput value)? clearInput,
    TResult? Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult? Function(_SetCondition value)? setCondition,
    TResult? Function(_SetProdDate value)? setProdDate,
    TResult? Function(_SetExpDate value)? setExpDate,
    TResult? Function(_SubmitInput value)? submitInput,
    TResult? Function(_ResetStatus value)? resetStatus,
  }) {
    return deleteLastChar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumpadPressed value)? numpadPressed,
    TResult Function(_DeleteLastChar value)? deleteLastChar,
    TResult Function(_ClearInput value)? clearInput,
    TResult Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult Function(_SetCondition value)? setCondition,
    TResult Function(_SetProdDate value)? setProdDate,
    TResult Function(_SetExpDate value)? setExpDate,
    TResult Function(_SubmitInput value)? submitInput,
    TResult Function(_ResetStatus value)? resetStatus,
    required TResult orElse(),
  }) {
    if (deleteLastChar != null) {
      return deleteLastChar(this);
    }
    return orElse();
  }
}

abstract class _DeleteLastChar implements TallyInputEvent {
  const factory _DeleteLastChar() = _$DeleteLastCharImpl;
}

/// @nodoc
abstract class _$$ClearInputImplCopyWith<$Res> {
  factory _$$ClearInputImplCopyWith(
    _$ClearInputImpl value,
    $Res Function(_$ClearInputImpl) then,
  ) = __$$ClearInputImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearInputImplCopyWithImpl<$Res>
    extends _$TallyInputEventCopyWithImpl<$Res, _$ClearInputImpl>
    implements _$$ClearInputImplCopyWith<$Res> {
  __$$ClearInputImplCopyWithImpl(
    _$ClearInputImpl _value,
    $Res Function(_$ClearInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearInputImpl implements _ClearInput {
  const _$ClearInputImpl();

  @override
  String toString() {
    return 'TallyInputEvent.clearInput()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearInputImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String key) numpadPressed,
    required TResult Function() deleteLastChar,
    required TResult Function() clearInput,
    required TResult Function(int places) setDecimalPlaces,
    required TResult Function(String condition) setCondition,
    required TResult Function(DateTime date) setProdDate,
    required TResult Function(DateTime date) setExpDate,
    required TResult Function() submitInput,
    required TResult Function() resetStatus,
  }) {
    return clearInput();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String key)? numpadPressed,
    TResult? Function()? deleteLastChar,
    TResult? Function()? clearInput,
    TResult? Function(int places)? setDecimalPlaces,
    TResult? Function(String condition)? setCondition,
    TResult? Function(DateTime date)? setProdDate,
    TResult? Function(DateTime date)? setExpDate,
    TResult? Function()? submitInput,
    TResult? Function()? resetStatus,
  }) {
    return clearInput?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String key)? numpadPressed,
    TResult Function()? deleteLastChar,
    TResult Function()? clearInput,
    TResult Function(int places)? setDecimalPlaces,
    TResult Function(String condition)? setCondition,
    TResult Function(DateTime date)? setProdDate,
    TResult Function(DateTime date)? setExpDate,
    TResult Function()? submitInput,
    TResult Function()? resetStatus,
    required TResult orElse(),
  }) {
    if (clearInput != null) {
      return clearInput();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumpadPressed value) numpadPressed,
    required TResult Function(_DeleteLastChar value) deleteLastChar,
    required TResult Function(_ClearInput value) clearInput,
    required TResult Function(_SetDecimalPlaces value) setDecimalPlaces,
    required TResult Function(_SetCondition value) setCondition,
    required TResult Function(_SetProdDate value) setProdDate,
    required TResult Function(_SetExpDate value) setExpDate,
    required TResult Function(_SubmitInput value) submitInput,
    required TResult Function(_ResetStatus value) resetStatus,
  }) {
    return clearInput(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NumpadPressed value)? numpadPressed,
    TResult? Function(_DeleteLastChar value)? deleteLastChar,
    TResult? Function(_ClearInput value)? clearInput,
    TResult? Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult? Function(_SetCondition value)? setCondition,
    TResult? Function(_SetProdDate value)? setProdDate,
    TResult? Function(_SetExpDate value)? setExpDate,
    TResult? Function(_SubmitInput value)? submitInput,
    TResult? Function(_ResetStatus value)? resetStatus,
  }) {
    return clearInput?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumpadPressed value)? numpadPressed,
    TResult Function(_DeleteLastChar value)? deleteLastChar,
    TResult Function(_ClearInput value)? clearInput,
    TResult Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult Function(_SetCondition value)? setCondition,
    TResult Function(_SetProdDate value)? setProdDate,
    TResult Function(_SetExpDate value)? setExpDate,
    TResult Function(_SubmitInput value)? submitInput,
    TResult Function(_ResetStatus value)? resetStatus,
    required TResult orElse(),
  }) {
    if (clearInput != null) {
      return clearInput(this);
    }
    return orElse();
  }
}

abstract class _ClearInput implements TallyInputEvent {
  const factory _ClearInput() = _$ClearInputImpl;
}

/// @nodoc
abstract class _$$SetDecimalPlacesImplCopyWith<$Res> {
  factory _$$SetDecimalPlacesImplCopyWith(
    _$SetDecimalPlacesImpl value,
    $Res Function(_$SetDecimalPlacesImpl) then,
  ) = __$$SetDecimalPlacesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int places});
}

/// @nodoc
class __$$SetDecimalPlacesImplCopyWithImpl<$Res>
    extends _$TallyInputEventCopyWithImpl<$Res, _$SetDecimalPlacesImpl>
    implements _$$SetDecimalPlacesImplCopyWith<$Res> {
  __$$SetDecimalPlacesImplCopyWithImpl(
    _$SetDecimalPlacesImpl _value,
    $Res Function(_$SetDecimalPlacesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? places = null}) {
    return _then(
      _$SetDecimalPlacesImpl(
        null == places
            ? _value.places
            : places // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$SetDecimalPlacesImpl implements _SetDecimalPlaces {
  const _$SetDecimalPlacesImpl(this.places);

  @override
  final int places;

  @override
  String toString() {
    return 'TallyInputEvent.setDecimalPlaces(places: $places)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetDecimalPlacesImpl &&
            (identical(other.places, places) || other.places == places));
  }

  @override
  int get hashCode => Object.hash(runtimeType, places);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetDecimalPlacesImplCopyWith<_$SetDecimalPlacesImpl> get copyWith =>
      __$$SetDecimalPlacesImplCopyWithImpl<_$SetDecimalPlacesImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String key) numpadPressed,
    required TResult Function() deleteLastChar,
    required TResult Function() clearInput,
    required TResult Function(int places) setDecimalPlaces,
    required TResult Function(String condition) setCondition,
    required TResult Function(DateTime date) setProdDate,
    required TResult Function(DateTime date) setExpDate,
    required TResult Function() submitInput,
    required TResult Function() resetStatus,
  }) {
    return setDecimalPlaces(places);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String key)? numpadPressed,
    TResult? Function()? deleteLastChar,
    TResult? Function()? clearInput,
    TResult? Function(int places)? setDecimalPlaces,
    TResult? Function(String condition)? setCondition,
    TResult? Function(DateTime date)? setProdDate,
    TResult? Function(DateTime date)? setExpDate,
    TResult? Function()? submitInput,
    TResult? Function()? resetStatus,
  }) {
    return setDecimalPlaces?.call(places);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String key)? numpadPressed,
    TResult Function()? deleteLastChar,
    TResult Function()? clearInput,
    TResult Function(int places)? setDecimalPlaces,
    TResult Function(String condition)? setCondition,
    TResult Function(DateTime date)? setProdDate,
    TResult Function(DateTime date)? setExpDate,
    TResult Function()? submitInput,
    TResult Function()? resetStatus,
    required TResult orElse(),
  }) {
    if (setDecimalPlaces != null) {
      return setDecimalPlaces(places);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumpadPressed value) numpadPressed,
    required TResult Function(_DeleteLastChar value) deleteLastChar,
    required TResult Function(_ClearInput value) clearInput,
    required TResult Function(_SetDecimalPlaces value) setDecimalPlaces,
    required TResult Function(_SetCondition value) setCondition,
    required TResult Function(_SetProdDate value) setProdDate,
    required TResult Function(_SetExpDate value) setExpDate,
    required TResult Function(_SubmitInput value) submitInput,
    required TResult Function(_ResetStatus value) resetStatus,
  }) {
    return setDecimalPlaces(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NumpadPressed value)? numpadPressed,
    TResult? Function(_DeleteLastChar value)? deleteLastChar,
    TResult? Function(_ClearInput value)? clearInput,
    TResult? Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult? Function(_SetCondition value)? setCondition,
    TResult? Function(_SetProdDate value)? setProdDate,
    TResult? Function(_SetExpDate value)? setExpDate,
    TResult? Function(_SubmitInput value)? submitInput,
    TResult? Function(_ResetStatus value)? resetStatus,
  }) {
    return setDecimalPlaces?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumpadPressed value)? numpadPressed,
    TResult Function(_DeleteLastChar value)? deleteLastChar,
    TResult Function(_ClearInput value)? clearInput,
    TResult Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult Function(_SetCondition value)? setCondition,
    TResult Function(_SetProdDate value)? setProdDate,
    TResult Function(_SetExpDate value)? setExpDate,
    TResult Function(_SubmitInput value)? submitInput,
    TResult Function(_ResetStatus value)? resetStatus,
    required TResult orElse(),
  }) {
    if (setDecimalPlaces != null) {
      return setDecimalPlaces(this);
    }
    return orElse();
  }
}

abstract class _SetDecimalPlaces implements TallyInputEvent {
  const factory _SetDecimalPlaces(final int places) = _$SetDecimalPlacesImpl;

  int get places;

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetDecimalPlacesImplCopyWith<_$SetDecimalPlacesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetConditionImplCopyWith<$Res> {
  factory _$$SetConditionImplCopyWith(
    _$SetConditionImpl value,
    $Res Function(_$SetConditionImpl) then,
  ) = __$$SetConditionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String condition});
}

/// @nodoc
class __$$SetConditionImplCopyWithImpl<$Res>
    extends _$TallyInputEventCopyWithImpl<$Res, _$SetConditionImpl>
    implements _$$SetConditionImplCopyWith<$Res> {
  __$$SetConditionImplCopyWithImpl(
    _$SetConditionImpl _value,
    $Res Function(_$SetConditionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? condition = null}) {
    return _then(
      _$SetConditionImpl(
        null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SetConditionImpl implements _SetCondition {
  const _$SetConditionImpl(this.condition);

  @override
  final String condition;

  @override
  String toString() {
    return 'TallyInputEvent.setCondition(condition: $condition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetConditionImpl &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @override
  int get hashCode => Object.hash(runtimeType, condition);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetConditionImplCopyWith<_$SetConditionImpl> get copyWith =>
      __$$SetConditionImplCopyWithImpl<_$SetConditionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String key) numpadPressed,
    required TResult Function() deleteLastChar,
    required TResult Function() clearInput,
    required TResult Function(int places) setDecimalPlaces,
    required TResult Function(String condition) setCondition,
    required TResult Function(DateTime date) setProdDate,
    required TResult Function(DateTime date) setExpDate,
    required TResult Function() submitInput,
    required TResult Function() resetStatus,
  }) {
    return setCondition(condition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String key)? numpadPressed,
    TResult? Function()? deleteLastChar,
    TResult? Function()? clearInput,
    TResult? Function(int places)? setDecimalPlaces,
    TResult? Function(String condition)? setCondition,
    TResult? Function(DateTime date)? setProdDate,
    TResult? Function(DateTime date)? setExpDate,
    TResult? Function()? submitInput,
    TResult? Function()? resetStatus,
  }) {
    return setCondition?.call(condition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String key)? numpadPressed,
    TResult Function()? deleteLastChar,
    TResult Function()? clearInput,
    TResult Function(int places)? setDecimalPlaces,
    TResult Function(String condition)? setCondition,
    TResult Function(DateTime date)? setProdDate,
    TResult Function(DateTime date)? setExpDate,
    TResult Function()? submitInput,
    TResult Function()? resetStatus,
    required TResult orElse(),
  }) {
    if (setCondition != null) {
      return setCondition(condition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumpadPressed value) numpadPressed,
    required TResult Function(_DeleteLastChar value) deleteLastChar,
    required TResult Function(_ClearInput value) clearInput,
    required TResult Function(_SetDecimalPlaces value) setDecimalPlaces,
    required TResult Function(_SetCondition value) setCondition,
    required TResult Function(_SetProdDate value) setProdDate,
    required TResult Function(_SetExpDate value) setExpDate,
    required TResult Function(_SubmitInput value) submitInput,
    required TResult Function(_ResetStatus value) resetStatus,
  }) {
    return setCondition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NumpadPressed value)? numpadPressed,
    TResult? Function(_DeleteLastChar value)? deleteLastChar,
    TResult? Function(_ClearInput value)? clearInput,
    TResult? Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult? Function(_SetCondition value)? setCondition,
    TResult? Function(_SetProdDate value)? setProdDate,
    TResult? Function(_SetExpDate value)? setExpDate,
    TResult? Function(_SubmitInput value)? submitInput,
    TResult? Function(_ResetStatus value)? resetStatus,
  }) {
    return setCondition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumpadPressed value)? numpadPressed,
    TResult Function(_DeleteLastChar value)? deleteLastChar,
    TResult Function(_ClearInput value)? clearInput,
    TResult Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult Function(_SetCondition value)? setCondition,
    TResult Function(_SetProdDate value)? setProdDate,
    TResult Function(_SetExpDate value)? setExpDate,
    TResult Function(_SubmitInput value)? submitInput,
    TResult Function(_ResetStatus value)? resetStatus,
    required TResult orElse(),
  }) {
    if (setCondition != null) {
      return setCondition(this);
    }
    return orElse();
  }
}

abstract class _SetCondition implements TallyInputEvent {
  const factory _SetCondition(final String condition) = _$SetConditionImpl;

  String get condition;

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetConditionImplCopyWith<_$SetConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetProdDateImplCopyWith<$Res> {
  factory _$$SetProdDateImplCopyWith(
    _$SetProdDateImpl value,
    $Res Function(_$SetProdDateImpl) then,
  ) = __$$SetProdDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$SetProdDateImplCopyWithImpl<$Res>
    extends _$TallyInputEventCopyWithImpl<$Res, _$SetProdDateImpl>
    implements _$$SetProdDateImplCopyWith<$Res> {
  __$$SetProdDateImplCopyWithImpl(
    _$SetProdDateImpl _value,
    $Res Function(_$SetProdDateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? date = null}) {
    return _then(
      _$SetProdDateImpl(
        null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$SetProdDateImpl implements _SetProdDate {
  const _$SetProdDateImpl(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'TallyInputEvent.setProdDate(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetProdDateImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetProdDateImplCopyWith<_$SetProdDateImpl> get copyWith =>
      __$$SetProdDateImplCopyWithImpl<_$SetProdDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String key) numpadPressed,
    required TResult Function() deleteLastChar,
    required TResult Function() clearInput,
    required TResult Function(int places) setDecimalPlaces,
    required TResult Function(String condition) setCondition,
    required TResult Function(DateTime date) setProdDate,
    required TResult Function(DateTime date) setExpDate,
    required TResult Function() submitInput,
    required TResult Function() resetStatus,
  }) {
    return setProdDate(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String key)? numpadPressed,
    TResult? Function()? deleteLastChar,
    TResult? Function()? clearInput,
    TResult? Function(int places)? setDecimalPlaces,
    TResult? Function(String condition)? setCondition,
    TResult? Function(DateTime date)? setProdDate,
    TResult? Function(DateTime date)? setExpDate,
    TResult? Function()? submitInput,
    TResult? Function()? resetStatus,
  }) {
    return setProdDate?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String key)? numpadPressed,
    TResult Function()? deleteLastChar,
    TResult Function()? clearInput,
    TResult Function(int places)? setDecimalPlaces,
    TResult Function(String condition)? setCondition,
    TResult Function(DateTime date)? setProdDate,
    TResult Function(DateTime date)? setExpDate,
    TResult Function()? submitInput,
    TResult Function()? resetStatus,
    required TResult orElse(),
  }) {
    if (setProdDate != null) {
      return setProdDate(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumpadPressed value) numpadPressed,
    required TResult Function(_DeleteLastChar value) deleteLastChar,
    required TResult Function(_ClearInput value) clearInput,
    required TResult Function(_SetDecimalPlaces value) setDecimalPlaces,
    required TResult Function(_SetCondition value) setCondition,
    required TResult Function(_SetProdDate value) setProdDate,
    required TResult Function(_SetExpDate value) setExpDate,
    required TResult Function(_SubmitInput value) submitInput,
    required TResult Function(_ResetStatus value) resetStatus,
  }) {
    return setProdDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NumpadPressed value)? numpadPressed,
    TResult? Function(_DeleteLastChar value)? deleteLastChar,
    TResult? Function(_ClearInput value)? clearInput,
    TResult? Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult? Function(_SetCondition value)? setCondition,
    TResult? Function(_SetProdDate value)? setProdDate,
    TResult? Function(_SetExpDate value)? setExpDate,
    TResult? Function(_SubmitInput value)? submitInput,
    TResult? Function(_ResetStatus value)? resetStatus,
  }) {
    return setProdDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumpadPressed value)? numpadPressed,
    TResult Function(_DeleteLastChar value)? deleteLastChar,
    TResult Function(_ClearInput value)? clearInput,
    TResult Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult Function(_SetCondition value)? setCondition,
    TResult Function(_SetProdDate value)? setProdDate,
    TResult Function(_SetExpDate value)? setExpDate,
    TResult Function(_SubmitInput value)? submitInput,
    TResult Function(_ResetStatus value)? resetStatus,
    required TResult orElse(),
  }) {
    if (setProdDate != null) {
      return setProdDate(this);
    }
    return orElse();
  }
}

abstract class _SetProdDate implements TallyInputEvent {
  const factory _SetProdDate(final DateTime date) = _$SetProdDateImpl;

  DateTime get date;

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetProdDateImplCopyWith<_$SetProdDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetExpDateImplCopyWith<$Res> {
  factory _$$SetExpDateImplCopyWith(
    _$SetExpDateImpl value,
    $Res Function(_$SetExpDateImpl) then,
  ) = __$$SetExpDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$SetExpDateImplCopyWithImpl<$Res>
    extends _$TallyInputEventCopyWithImpl<$Res, _$SetExpDateImpl>
    implements _$$SetExpDateImplCopyWith<$Res> {
  __$$SetExpDateImplCopyWithImpl(
    _$SetExpDateImpl _value,
    $Res Function(_$SetExpDateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? date = null}) {
    return _then(
      _$SetExpDateImpl(
        null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$SetExpDateImpl implements _SetExpDate {
  const _$SetExpDateImpl(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'TallyInputEvent.setExpDate(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetExpDateImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetExpDateImplCopyWith<_$SetExpDateImpl> get copyWith =>
      __$$SetExpDateImplCopyWithImpl<_$SetExpDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String key) numpadPressed,
    required TResult Function() deleteLastChar,
    required TResult Function() clearInput,
    required TResult Function(int places) setDecimalPlaces,
    required TResult Function(String condition) setCondition,
    required TResult Function(DateTime date) setProdDate,
    required TResult Function(DateTime date) setExpDate,
    required TResult Function() submitInput,
    required TResult Function() resetStatus,
  }) {
    return setExpDate(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String key)? numpadPressed,
    TResult? Function()? deleteLastChar,
    TResult? Function()? clearInput,
    TResult? Function(int places)? setDecimalPlaces,
    TResult? Function(String condition)? setCondition,
    TResult? Function(DateTime date)? setProdDate,
    TResult? Function(DateTime date)? setExpDate,
    TResult? Function()? submitInput,
    TResult? Function()? resetStatus,
  }) {
    return setExpDate?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String key)? numpadPressed,
    TResult Function()? deleteLastChar,
    TResult Function()? clearInput,
    TResult Function(int places)? setDecimalPlaces,
    TResult Function(String condition)? setCondition,
    TResult Function(DateTime date)? setProdDate,
    TResult Function(DateTime date)? setExpDate,
    TResult Function()? submitInput,
    TResult Function()? resetStatus,
    required TResult orElse(),
  }) {
    if (setExpDate != null) {
      return setExpDate(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumpadPressed value) numpadPressed,
    required TResult Function(_DeleteLastChar value) deleteLastChar,
    required TResult Function(_ClearInput value) clearInput,
    required TResult Function(_SetDecimalPlaces value) setDecimalPlaces,
    required TResult Function(_SetCondition value) setCondition,
    required TResult Function(_SetProdDate value) setProdDate,
    required TResult Function(_SetExpDate value) setExpDate,
    required TResult Function(_SubmitInput value) submitInput,
    required TResult Function(_ResetStatus value) resetStatus,
  }) {
    return setExpDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NumpadPressed value)? numpadPressed,
    TResult? Function(_DeleteLastChar value)? deleteLastChar,
    TResult? Function(_ClearInput value)? clearInput,
    TResult? Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult? Function(_SetCondition value)? setCondition,
    TResult? Function(_SetProdDate value)? setProdDate,
    TResult? Function(_SetExpDate value)? setExpDate,
    TResult? Function(_SubmitInput value)? submitInput,
    TResult? Function(_ResetStatus value)? resetStatus,
  }) {
    return setExpDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumpadPressed value)? numpadPressed,
    TResult Function(_DeleteLastChar value)? deleteLastChar,
    TResult Function(_ClearInput value)? clearInput,
    TResult Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult Function(_SetCondition value)? setCondition,
    TResult Function(_SetProdDate value)? setProdDate,
    TResult Function(_SetExpDate value)? setExpDate,
    TResult Function(_SubmitInput value)? submitInput,
    TResult Function(_ResetStatus value)? resetStatus,
    required TResult orElse(),
  }) {
    if (setExpDate != null) {
      return setExpDate(this);
    }
    return orElse();
  }
}

abstract class _SetExpDate implements TallyInputEvent {
  const factory _SetExpDate(final DateTime date) = _$SetExpDateImpl;

  DateTime get date;

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetExpDateImplCopyWith<_$SetExpDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitInputImplCopyWith<$Res> {
  factory _$$SubmitInputImplCopyWith(
    _$SubmitInputImpl value,
    $Res Function(_$SubmitInputImpl) then,
  ) = __$$SubmitInputImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitInputImplCopyWithImpl<$Res>
    extends _$TallyInputEventCopyWithImpl<$Res, _$SubmitInputImpl>
    implements _$$SubmitInputImplCopyWith<$Res> {
  __$$SubmitInputImplCopyWithImpl(
    _$SubmitInputImpl _value,
    $Res Function(_$SubmitInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmitInputImpl implements _SubmitInput {
  const _$SubmitInputImpl();

  @override
  String toString() {
    return 'TallyInputEvent.submitInput()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitInputImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String key) numpadPressed,
    required TResult Function() deleteLastChar,
    required TResult Function() clearInput,
    required TResult Function(int places) setDecimalPlaces,
    required TResult Function(String condition) setCondition,
    required TResult Function(DateTime date) setProdDate,
    required TResult Function(DateTime date) setExpDate,
    required TResult Function() submitInput,
    required TResult Function() resetStatus,
  }) {
    return submitInput();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String key)? numpadPressed,
    TResult? Function()? deleteLastChar,
    TResult? Function()? clearInput,
    TResult? Function(int places)? setDecimalPlaces,
    TResult? Function(String condition)? setCondition,
    TResult? Function(DateTime date)? setProdDate,
    TResult? Function(DateTime date)? setExpDate,
    TResult? Function()? submitInput,
    TResult? Function()? resetStatus,
  }) {
    return submitInput?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String key)? numpadPressed,
    TResult Function()? deleteLastChar,
    TResult Function()? clearInput,
    TResult Function(int places)? setDecimalPlaces,
    TResult Function(String condition)? setCondition,
    TResult Function(DateTime date)? setProdDate,
    TResult Function(DateTime date)? setExpDate,
    TResult Function()? submitInput,
    TResult Function()? resetStatus,
    required TResult orElse(),
  }) {
    if (submitInput != null) {
      return submitInput();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumpadPressed value) numpadPressed,
    required TResult Function(_DeleteLastChar value) deleteLastChar,
    required TResult Function(_ClearInput value) clearInput,
    required TResult Function(_SetDecimalPlaces value) setDecimalPlaces,
    required TResult Function(_SetCondition value) setCondition,
    required TResult Function(_SetProdDate value) setProdDate,
    required TResult Function(_SetExpDate value) setExpDate,
    required TResult Function(_SubmitInput value) submitInput,
    required TResult Function(_ResetStatus value) resetStatus,
  }) {
    return submitInput(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NumpadPressed value)? numpadPressed,
    TResult? Function(_DeleteLastChar value)? deleteLastChar,
    TResult? Function(_ClearInput value)? clearInput,
    TResult? Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult? Function(_SetCondition value)? setCondition,
    TResult? Function(_SetProdDate value)? setProdDate,
    TResult? Function(_SetExpDate value)? setExpDate,
    TResult? Function(_SubmitInput value)? submitInput,
    TResult? Function(_ResetStatus value)? resetStatus,
  }) {
    return submitInput?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumpadPressed value)? numpadPressed,
    TResult Function(_DeleteLastChar value)? deleteLastChar,
    TResult Function(_ClearInput value)? clearInput,
    TResult Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult Function(_SetCondition value)? setCondition,
    TResult Function(_SetProdDate value)? setProdDate,
    TResult Function(_SetExpDate value)? setExpDate,
    TResult Function(_SubmitInput value)? submitInput,
    TResult Function(_ResetStatus value)? resetStatus,
    required TResult orElse(),
  }) {
    if (submitInput != null) {
      return submitInput(this);
    }
    return orElse();
  }
}

abstract class _SubmitInput implements TallyInputEvent {
  const factory _SubmitInput() = _$SubmitInputImpl;
}

/// @nodoc
abstract class _$$ResetStatusImplCopyWith<$Res> {
  factory _$$ResetStatusImplCopyWith(
    _$ResetStatusImpl value,
    $Res Function(_$ResetStatusImpl) then,
  ) = __$$ResetStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetStatusImplCopyWithImpl<$Res>
    extends _$TallyInputEventCopyWithImpl<$Res, _$ResetStatusImpl>
    implements _$$ResetStatusImplCopyWith<$Res> {
  __$$ResetStatusImplCopyWithImpl(
    _$ResetStatusImpl _value,
    $Res Function(_$ResetStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyInputEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetStatusImpl implements _ResetStatus {
  const _$ResetStatusImpl();

  @override
  String toString() {
    return 'TallyInputEvent.resetStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String key) numpadPressed,
    required TResult Function() deleteLastChar,
    required TResult Function() clearInput,
    required TResult Function(int places) setDecimalPlaces,
    required TResult Function(String condition) setCondition,
    required TResult Function(DateTime date) setProdDate,
    required TResult Function(DateTime date) setExpDate,
    required TResult Function() submitInput,
    required TResult Function() resetStatus,
  }) {
    return resetStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String key)? numpadPressed,
    TResult? Function()? deleteLastChar,
    TResult? Function()? clearInput,
    TResult? Function(int places)? setDecimalPlaces,
    TResult? Function(String condition)? setCondition,
    TResult? Function(DateTime date)? setProdDate,
    TResult? Function(DateTime date)? setExpDate,
    TResult? Function()? submitInput,
    TResult? Function()? resetStatus,
  }) {
    return resetStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String key)? numpadPressed,
    TResult Function()? deleteLastChar,
    TResult Function()? clearInput,
    TResult Function(int places)? setDecimalPlaces,
    TResult Function(String condition)? setCondition,
    TResult Function(DateTime date)? setProdDate,
    TResult Function(DateTime date)? setExpDate,
    TResult Function()? submitInput,
    TResult Function()? resetStatus,
    required TResult orElse(),
  }) {
    if (resetStatus != null) {
      return resetStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumpadPressed value) numpadPressed,
    required TResult Function(_DeleteLastChar value) deleteLastChar,
    required TResult Function(_ClearInput value) clearInput,
    required TResult Function(_SetDecimalPlaces value) setDecimalPlaces,
    required TResult Function(_SetCondition value) setCondition,
    required TResult Function(_SetProdDate value) setProdDate,
    required TResult Function(_SetExpDate value) setExpDate,
    required TResult Function(_SubmitInput value) submitInput,
    required TResult Function(_ResetStatus value) resetStatus,
  }) {
    return resetStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NumpadPressed value)? numpadPressed,
    TResult? Function(_DeleteLastChar value)? deleteLastChar,
    TResult? Function(_ClearInput value)? clearInput,
    TResult? Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult? Function(_SetCondition value)? setCondition,
    TResult? Function(_SetProdDate value)? setProdDate,
    TResult? Function(_SetExpDate value)? setExpDate,
    TResult? Function(_SubmitInput value)? submitInput,
    TResult? Function(_ResetStatus value)? resetStatus,
  }) {
    return resetStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumpadPressed value)? numpadPressed,
    TResult Function(_DeleteLastChar value)? deleteLastChar,
    TResult Function(_ClearInput value)? clearInput,
    TResult Function(_SetDecimalPlaces value)? setDecimalPlaces,
    TResult Function(_SetCondition value)? setCondition,
    TResult Function(_SetProdDate value)? setProdDate,
    TResult Function(_SetExpDate value)? setExpDate,
    TResult Function(_SubmitInput value)? submitInput,
    TResult Function(_ResetStatus value)? resetStatus,
    required TResult orElse(),
  }) {
    if (resetStatus != null) {
      return resetStatus(this);
    }
    return orElse();
  }
}

abstract class _ResetStatus implements TallyInputEvent {
  const factory _ResetStatus() = _$ResetStatusImpl;
}

/// @nodoc
mixin _$TallyInputState {
  /// Current input weight as string
  String get inputWeight => throw _privateConstructorUsedError;

  /// Decimal places setting (0-3)
  int get decimalPlaces => throw _privateConstructorUsedError;

  /// Input status
  InputStatus get status => throw _privateConstructorUsedError;

  /// Error message if validation fails
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Selected condition
  String? get condition => throw _privateConstructorUsedError;

  /// Production date
  DateTime? get prodDate => throw _privateConstructorUsedError;

  /// Expiration date
  DateTime? get expDate => throw _privateConstructorUsedError;

  /// Payload when input is successfully validated
  AddWeightData? get payload => throw _privateConstructorUsedError;

  /// Create a copy of TallyInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TallyInputStateCopyWith<TallyInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TallyInputStateCopyWith<$Res> {
  factory $TallyInputStateCopyWith(
    TallyInputState value,
    $Res Function(TallyInputState) then,
  ) = _$TallyInputStateCopyWithImpl<$Res, TallyInputState>;
  @useResult
  $Res call({
    String inputWeight,
    int decimalPlaces,
    InputStatus status,
    String? errorMessage,
    String? condition,
    DateTime? prodDate,
    DateTime? expDate,
    AddWeightData? payload,
  });

  $AddWeightDataCopyWith<$Res>? get payload;
}

/// @nodoc
class _$TallyInputStateCopyWithImpl<$Res, $Val extends TallyInputState>
    implements $TallyInputStateCopyWith<$Res> {
  _$TallyInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TallyInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputWeight = null,
    Object? decimalPlaces = null,
    Object? status = null,
    Object? errorMessage = freezed,
    Object? condition = freezed,
    Object? prodDate = freezed,
    Object? expDate = freezed,
    Object? payload = freezed,
  }) {
    return _then(
      _value.copyWith(
            inputWeight: null == inputWeight
                ? _value.inputWeight
                : inputWeight // ignore: cast_nullable_to_non_nullable
                      as String,
            decimalPlaces: null == decimalPlaces
                ? _value.decimalPlaces
                : decimalPlaces // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as InputStatus,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
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
            payload: freezed == payload
                ? _value.payload
                : payload // ignore: cast_nullable_to_non_nullable
                      as AddWeightData?,
          )
          as $Val,
    );
  }

  /// Create a copy of TallyInputState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddWeightDataCopyWith<$Res>? get payload {
    if (_value.payload == null) {
      return null;
    }

    return $AddWeightDataCopyWith<$Res>(_value.payload!, (value) {
      return _then(_value.copyWith(payload: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TallyInputStateImplCopyWith<$Res>
    implements $TallyInputStateCopyWith<$Res> {
  factory _$$TallyInputStateImplCopyWith(
    _$TallyInputStateImpl value,
    $Res Function(_$TallyInputStateImpl) then,
  ) = __$$TallyInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String inputWeight,
    int decimalPlaces,
    InputStatus status,
    String? errorMessage,
    String? condition,
    DateTime? prodDate,
    DateTime? expDate,
    AddWeightData? payload,
  });

  @override
  $AddWeightDataCopyWith<$Res>? get payload;
}

/// @nodoc
class __$$TallyInputStateImplCopyWithImpl<$Res>
    extends _$TallyInputStateCopyWithImpl<$Res, _$TallyInputStateImpl>
    implements _$$TallyInputStateImplCopyWith<$Res> {
  __$$TallyInputStateImplCopyWithImpl(
    _$TallyInputStateImpl _value,
    $Res Function(_$TallyInputStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TallyInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputWeight = null,
    Object? decimalPlaces = null,
    Object? status = null,
    Object? errorMessage = freezed,
    Object? condition = freezed,
    Object? prodDate = freezed,
    Object? expDate = freezed,
    Object? payload = freezed,
  }) {
    return _then(
      _$TallyInputStateImpl(
        inputWeight: null == inputWeight
            ? _value.inputWeight
            : inputWeight // ignore: cast_nullable_to_non_nullable
                  as String,
        decimalPlaces: null == decimalPlaces
            ? _value.decimalPlaces
            : decimalPlaces // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as InputStatus,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        payload: freezed == payload
            ? _value.payload
            : payload // ignore: cast_nullable_to_non_nullable
                  as AddWeightData?,
      ),
    );
  }
}

/// @nodoc

class _$TallyInputStateImpl extends _TallyInputState {
  const _$TallyInputStateImpl({
    this.inputWeight = '',
    this.decimalPlaces = 2,
    this.status = InputStatus.idle,
    this.errorMessage = null,
    this.condition = null,
    this.prodDate = null,
    this.expDate = null,
    this.payload = null,
  }) : super._();

  /// Current input weight as string
  @override
  @JsonKey()
  final String inputWeight;

  /// Decimal places setting (0-3)
  @override
  @JsonKey()
  final int decimalPlaces;

  /// Input status
  @override
  @JsonKey()
  final InputStatus status;

  /// Error message if validation fails
  @override
  @JsonKey()
  final String? errorMessage;

  /// Selected condition
  @override
  @JsonKey()
  final String? condition;

  /// Production date
  @override
  @JsonKey()
  final DateTime? prodDate;

  /// Expiration date
  @override
  @JsonKey()
  final DateTime? expDate;

  /// Payload when input is successfully validated
  @override
  @JsonKey()
  final AddWeightData? payload;

  @override
  String toString() {
    return 'TallyInputState(inputWeight: $inputWeight, decimalPlaces: $decimalPlaces, status: $status, errorMessage: $errorMessage, condition: $condition, prodDate: $prodDate, expDate: $expDate, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TallyInputStateImpl &&
            (identical(other.inputWeight, inputWeight) ||
                other.inputWeight == inputWeight) &&
            (identical(other.decimalPlaces, decimalPlaces) ||
                other.decimalPlaces == decimalPlaces) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.prodDate, prodDate) ||
                other.prodDate == prodDate) &&
            (identical(other.expDate, expDate) || other.expDate == expDate) &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    inputWeight,
    decimalPlaces,
    status,
    errorMessage,
    condition,
    prodDate,
    expDate,
    payload,
  );

  /// Create a copy of TallyInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TallyInputStateImplCopyWith<_$TallyInputStateImpl> get copyWith =>
      __$$TallyInputStateImplCopyWithImpl<_$TallyInputStateImpl>(
        this,
        _$identity,
      );
}

abstract class _TallyInputState extends TallyInputState {
  const factory _TallyInputState({
    final String inputWeight,
    final int decimalPlaces,
    final InputStatus status,
    final String? errorMessage,
    final String? condition,
    final DateTime? prodDate,
    final DateTime? expDate,
    final AddWeightData? payload,
  }) = _$TallyInputStateImpl;
  const _TallyInputState._() : super._();

  /// Current input weight as string
  @override
  String get inputWeight;

  /// Decimal places setting (0-3)
  @override
  int get decimalPlaces;

  /// Input status
  @override
  InputStatus get status;

  /// Error message if validation fails
  @override
  String? get errorMessage;

  /// Selected condition
  @override
  String? get condition;

  /// Production date
  @override
  DateTime? get prodDate;

  /// Expiration date
  @override
  DateTime? get expDate;

  /// Payload when input is successfully validated
  @override
  AddWeightData? get payload;

  /// Create a copy of TallyInputState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TallyInputStateImplCopyWith<_$TallyInputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
