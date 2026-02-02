import 'package:freezed_annotation/freezed_annotation.dart';

part 'mutation_state.freezed.dart';

/// Status enum untuk mutation lifecycle
enum MutationStatus {
  /// Initial state, belum pernah mutate
  idle,

  /// Sedang proses mutation
  loading,

  /// Mutation berhasil
  success,

  /// Mutation gagal
  error,
}

/// State model untuk mutation
@freezed
class MutationState<T> with _$MutationState<T> {
  const MutationState._();

  const factory MutationState({
    /// Data hasil mutation (bisa null jika belum mutate atau error)
    T? data,

    /// Status mutation saat ini
    @Default(MutationStatus.idle) MutationStatus status,

    /// Error message jika status == error
    String? errorMessage,
  }) = _MutationState<T>;

  /// True jika status idle (belum pernah mutate)
  bool get isIdle => status == MutationStatus.idle;

  /// True jika sedang proses mutation
  bool get isLoading => status == MutationStatus.loading;

  /// True jika mutation berhasil
  bool get isSuccess => status == MutationStatus.success;

  /// True jika mutation gagal
  bool get isError => status == MutationStatus.error;

  /// True jika ada data
  bool get hasData => data != null;

  /// Create loading state
  factory MutationState.loading() =>
      const MutationState(status: MutationStatus.loading);

  /// Create success state
  factory MutationState.success(T data) =>
      MutationState(data: data, status: MutationStatus.success);

  /// Create error state
  factory MutationState.error(String message) =>
      MutationState(status: MutationStatus.error, errorMessage: message);
}
