import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testcase_1/features/tally_in/data/models/tally_models.dart';

part 'tally_input_event.dart';
part 'tally_input_state.dart';
part 'tally_input_bloc.freezed.dart';

class TallyInputBloc extends Bloc<TallyInputEvent, TallyInputState> {
  TallyInputBloc() : super(const TallyInputState()) {
    on<_NumpadPressed>(_onNumpadPressed);
    on<_DeleteLastChar>(_onDeleteLastChar);
    on<_ClearInput>(_onClearInput);
    on<_SetDecimalPlaces>(_onSetDecimalPlaces);
    on<_SetCondition>(_onSetCondition);
    on<_SetProdDate>(_onSetProdDate);
    on<_SetExpDate>(_onSetExpDate);
    on<_SubmitInput>(_onSubmitInput);
    on<_ResetStatus>(_onResetStatus);
  }

  void _onNumpadPressed(_NumpadPressed event, Emitter<TallyInputState> emit) {
    final key = event.key;
    var currentInput = state.inputWeight;

    // Handle decimal point
    if (key == '.') {
      // Don't add if already has decimal
      if (currentInput.contains('.')) return;
      // Add leading zero if empty
      if (currentInput.isEmpty) {
        currentInput = '0';
      }
    }

    // Check decimal places limit
    if (currentInput.contains('.')) {
      final decimalPart = currentInput.split('.')[1];
      if (key != '.' && decimalPart.length >= state.decimalPlaces) {
        return;
      }
    }

    // Prevent leading zeros (except for "0.")
    if (currentInput == '0' && key != '.') {
      currentInput = '';
    }

    final newInput = currentInput + key;

    emit(state.copyWith(
      inputWeight: newInput,
      status: InputStatus.idle,
      errorMessage: null,
    ));
  }

  void _onDeleteLastChar(_DeleteLastChar event, Emitter<TallyInputState> emit) {
    if (state.inputWeight.isEmpty) return;

    final newInput =
        state.inputWeight.substring(0, state.inputWeight.length - 1);

    emit(state.copyWith(
      inputWeight: newInput,
      status: InputStatus.idle,
      errorMessage: null,
    ));
  }

  void _onClearInput(_ClearInput event, Emitter<TallyInputState> emit) {
    emit(state.copyWith(
      inputWeight: '',
      status: InputStatus.idle,
      errorMessage: null,
    ));
  }

  void _onSetDecimalPlaces(
      _SetDecimalPlaces event, Emitter<TallyInputState> emit) {
    final places = event.places.clamp(0, 3);
    emit(state.copyWith(decimalPlaces: places));
  }

  void _onSetCondition(_SetCondition event, Emitter<TallyInputState> emit) {
    emit(state.copyWith(
      condition: event.condition,
      status: InputStatus.idle,
      errorMessage: null,
    ));
  }

  void _onSetProdDate(_SetProdDate event, Emitter<TallyInputState> emit) {
    emit(state.copyWith(
      prodDate: event.date,
      status: InputStatus.idle,
      errorMessage: null,
    ));
  }

  void _onSetExpDate(_SetExpDate event, Emitter<TallyInputState> emit) {
    emit(state.copyWith(
      expDate: event.date,
      status: InputStatus.idle,
      errorMessage: null,
    ));
  }

  void _onSubmitInput(_SubmitInput event, Emitter<TallyInputState> emit) {
    emit(state.copyWith(status: InputStatus.validating));

    // Validate weight
    if (state.inputWeight.isEmpty) {
      emit(state.copyWith(
        status: InputStatus.invalid,
        errorMessage: 'Weight is required',
      ));
      return;
    }

    final weight = double.tryParse(state.inputWeight);
    if (weight == null) {
      emit(state.copyWith(
        status: InputStatus.invalid,
        errorMessage: 'Invalid weight format',
      ));
      return;
    }

    if (weight <= 0) {
      emit(state.copyWith(
        status: InputStatus.invalid,
        errorMessage: 'Weight must be greater than 0',
      ));
      return;
    }

    // Validate condition
    if (state.condition == null) {
      emit(state.copyWith(
        status: InputStatus.invalid,
        errorMessage: 'Condition is required',
      ));
      return;
    }

    // Validate dates
    if (state.prodDate == null) {
      emit(state.copyWith(
        status: InputStatus.invalid,
        errorMessage: 'Production date is required',
      ));
      return;
    }

    if (state.expDate == null) {
      emit(state.copyWith(
        status: InputStatus.invalid,
        errorMessage: 'Expiration date is required',
      ));
      return;
    }

    // Validate exp date > prod date
    if (state.expDate!.isBefore(state.prodDate!)) {
      emit(state.copyWith(
        status: InputStatus.invalid,
        errorMessage: 'Expiration date must be after production date',
      ));
      return;
    }

    // All valid - create payload
    final payload = AddWeightData(
      weight: weight,
      condition: state.condition!,
      prodDate: state.prodDate!,
      expDate: state.expDate!,
    );

    emit(state.copyWith(
      status: InputStatus.success,
      payload: payload,
      errorMessage: null,
    ));
  }

  void _onResetStatus(_ResetStatus event, Emitter<TallyInputState> emit) {
    emit(state.copyWith(
      inputWeight: '',
      status: InputStatus.idle,
      errorMessage: null,
      payload: null,
    ));
  }
}
