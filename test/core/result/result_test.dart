import 'package:testcase_1/core/network/error/failure.dart';
import 'package:testcase_1/core/result/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result', () {
    test('Success should contain data', () {
      const result = Result<int>.success(42);

      expect(result.isSuccess, isTrue);
      expect(result.isFailure, isFalse);
      expect(result.dataOrNull, equals(42));
      expect(result.failureOrNull, isNull);
    });

    test('Failure should contain error', () {
      const failure = Failure.network(message: 'Network error');
      const result = Result<int>.failure(failure);

      expect(result.isSuccess, isFalse);
      expect(result.isFailure, isTrue);
      expect(result.dataOrNull, isNull);
      expect(result.failureOrNull, equals(failure));
    });

    test('when should execute success callback on Success', () {
      const result = Result<int>.success(42);

      final output = result.when(
        success: (data) => 'Success: $data',
        failure: (error) => 'Failure',
      );

      expect(output, equals('Success: 42'));
    });

    test('when should execute failure callback on Failure', () {
      const failure = Failure.network(message: 'Network error');
      const result = Result<int>.failure(failure);

      final output = result.when(
        success: (data) => 'Success: $data',
        failure: (error) => 'Failure',
      );

      expect(output, equals('Failure'));
    });

    test('dataOrNull returns data for Success', () {
      const result = Result<int>.success(42);
      expect(result.dataOrNull, equals(42));
    });

    test('dataOrNull returns null for Failure', () {
      const failure = Failure.network(message: 'Network error');
      const result = Result<int>.failure(failure);
      expect(result.dataOrNull, isNull);
    });
  });
}
