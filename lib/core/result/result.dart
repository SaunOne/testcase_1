import 'package:testcase_1/core/network/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const Result._();

  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(Failure failure) = Fail<T>;
}

extension ResultX<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Fail<T>;

  T? get dataOrNull => switch (this) {
    Success(:final data) => data,
    Fail() => null,
  };

  Failure? get failureOrNull => switch (this) {
    Success() => null,
    Fail(:final failure) => failure,
  };

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) failure,
  }) {
    return switch (this) {
      Success(:final data) => success(data),
      Fail(failure: final f) => failure(f),
    };
  }

  Result<R> map<R>(R Function(T data) mapper) {
    return switch (this) {
      Success(:final data) => Result.success(mapper(data)),
      Fail(:final failure) => Result.failure(failure),
    };
  }

  Future<Result<R>> asyncMap<R>(Future<R> Function(T data) mapper) async {
    return switch (this) {
      Success(:final data) => Result.success(await mapper(data)),
      Fail(:final failure) => Result.failure(failure),
    };
  }
}
