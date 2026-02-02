import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

@freezed
sealed class AsyncState<T> with _$AsyncState<T> {
  const factory AsyncState.initial() = AsyncInitial<T>;
  const factory AsyncState.loading() = AsyncLoading<T>;
  const factory AsyncState.success(T data) = AsyncSuccess<T>;
  const factory AsyncState.error(String message) = AsyncError<T>;
}

extension AsyncStateX<T> on AsyncState<T> {
  bool get isInitial => this is AsyncInitial<T>;
  bool get isLoading => this is AsyncLoading<T>;
  bool get isSuccess => this is AsyncSuccess<T>;
  bool get isError => this is AsyncError<T>;

  T? get dataOrNull => switch (this) {
    AsyncSuccess(:final data) => data,
    _ => null,
  };

  String? get errorOrNull => switch (this) {
    AsyncError(:final message) => message,
    _ => null,
  };

  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(T data) success,
    required R Function(String message) error,
  }) {
    return switch (this) {
      AsyncInitial() => initial(),
      AsyncLoading() => loading(),
      AsyncSuccess(:final data) => success(data),
      AsyncError(:final message) => error(message),
    };
  }

  R maybeWhen<R>({
    R Function()? initial,
    R Function()? loading,
    R Function(T data)? success,
    R Function(String message)? error,
    required R Function() orElse,
  }) {
    return switch (this) {
      AsyncInitial() => initial?.call() ?? orElse(),
      AsyncLoading() => loading?.call() ?? orElse(),
      AsyncSuccess(:final data) => success?.call(data) ?? orElse(),
      AsyncError(:final message) => error?.call(message) ?? orElse(),
    };
  }
}
