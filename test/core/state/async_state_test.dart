import 'package:testcase_1/core/state/async_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AsyncState', () {
    test('Initial state should be initial', () {
      final state = AsyncState<int>.initial();

      expect(state.isInitial, isTrue);
      expect(state.isLoading, isFalse);
      expect(state.isSuccess, isFalse);
      expect(state.isError, isFalse);
    });

    test('Loading state should be loading', () {
      final state = AsyncState<int>.loading();

      expect(state.isInitial, isFalse);
      expect(state.isLoading, isTrue);
      expect(state.isSuccess, isFalse);
      expect(state.isError, isFalse);
    });

    test('Success state should contain data', () {
      final state = AsyncState<int>.success(42);

      expect(state.isInitial, isFalse);
      expect(state.isLoading, isFalse);
      expect(state.isSuccess, isTrue);
      expect(state.isError, isFalse);
      expect(state.dataOrNull, equals(42));
    });

    test('Error state should contain message', () {
      final state = AsyncState<int>.error('Network error');

      expect(state.isInitial, isFalse);
      expect(state.isLoading, isFalse);
      expect(state.isSuccess, isFalse);
      expect(state.isError, isTrue);
      expect(state.errorOrNull, equals('Network error'));
    });

    test('when should call correct callback', () {
      final state = AsyncState<int>.success(42);

      final output = state.when(
        initial: () => 'Initial',
        loading: () => 'Loading',
        success: (data) => 'Success: $data',
        error: (message) => 'Error: $message',
      );

      expect(output, equals('Success: 42'));
    });

    test('maybeWhen should call success or orElse', () {
      final state = AsyncState<int>.loading();

      final output = state.maybeWhen(
        success: (data) => 'Success: $data',
        orElse: () => 'Not success',
      );

      expect(output, equals('Not success'));
    });
  });
}
