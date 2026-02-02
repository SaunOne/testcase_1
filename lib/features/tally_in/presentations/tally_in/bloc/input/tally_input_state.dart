part of 'tally_input_bloc.dart';

@freezed
class TallyInputState with _$TallyInputState {
  const TallyInputState._();

  const factory TallyInputState({
    /// Current input weight as string
    @Default('') String inputWeight,

    /// Decimal places setting (0-3)
    @Default(2) int decimalPlaces,

    /// Input status
    @Default(InputStatus.idle) InputStatus status,

    /// Error message if validation fails
    @Default(null) String? errorMessage,

    /// Selected condition
    @Default(null) String? condition,

    /// Production date
    @Default(null) DateTime? prodDate,

    /// Expiration date
    @Default(null) DateTime? expDate,

    /// Payload when input is successfully validated
    @Default(null) AddWeightData? payload,
  }) = _TallyInputState;

  /// Whether input is valid for submission
  bool get canSubmit =>
      inputWeight.isNotEmpty &&
      condition != null &&
      prodDate != null &&
      expDate != null;

  /// Parsed weight value
  double? get weightValue => double.tryParse(inputWeight);

  /// Whether weight is valid
  bool get isWeightValid {
    final value = weightValue;
    return value != null && value > 0;
  }

  /// Display weight with formatting
  String get displayWeight {
    if (inputWeight.isEmpty) return '0';
    return inputWeight;
  }

  /// Available conditions
  static const List<String> conditions = [
    'Good',
    'Damaged',
    'Expired',
    'Reject',
  ];
}
