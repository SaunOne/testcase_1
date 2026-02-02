part of 'tally_input_bloc.dart';

@freezed
class TallyInputEvent with _$TallyInputEvent {
  /// Numpad key pressed (0-9 or .)
  const factory TallyInputEvent.numpadPressed(String key) = _NumpadPressed;

  /// Delete last character from input
  const factory TallyInputEvent.deleteLastChar() = _DeleteLastChar;

  /// Clear all input
  const factory TallyInputEvent.clearInput() = _ClearInput;

  /// Set decimal places setting
  const factory TallyInputEvent.setDecimalPlaces(int places) = _SetDecimalPlaces;

  /// Set condition value
  const factory TallyInputEvent.setCondition(String condition) = _SetCondition;

  /// Set production date
  const factory TallyInputEvent.setProdDate(DateTime date) = _SetProdDate;

  /// Set expiration date
  const factory TallyInputEvent.setExpDate(DateTime date) = _SetExpDate;

  /// Submit input and validate
  const factory TallyInputEvent.submitInput() = _SubmitInput;

  /// Reset status to idle (after success handled)
  const factory TallyInputEvent.resetStatus() = _ResetStatus;
}
