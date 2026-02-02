import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_state.freezed.dart';

/// Status enum untuk query lifecycle
enum QueryStatus {
  /// Initial state, belum pernah fetch
  idle,

  /// Sedang fetch untuk pertama kali (tidak ada data)
  loading,

  /// Sedang refetch (sudah ada data sebelumnya)
  fetching,

  /// Fetch berhasil
  success,

  /// Fetch gagal
  error,
}

/// State model untuk query
@freezed
class QueryState<T> with _$QueryState<T> {
  const QueryState._();

  const factory QueryState({
    /// Data hasil fetch (bisa null jika belum fetch atau error)
    T? data,

    /// Status query saat ini
    @Default(QueryStatus.idle) QueryStatus status,

    /// Error message jika status == error
    String? errorMessage,

    /// Timestamp terakhir data di-update
    DateTime? lastUpdated,

    /// True jika data dari cache yang sudah expired
    @Default(false) bool isStale,

    /// True jika response dari cache (bukan fresh dari API)
    @Default(false) bool isFromCache,
  }) = _QueryState<T>;

  /// True jika status idle (belum pernah fetch)
  bool get isIdle => status == QueryStatus.idle;

  /// True jika sedang loading TANPA data sebelumnya
  bool get isLoading => status == QueryStatus.loading;

  /// True jika sedang fetch DENGAN data sebelumnya (refetch)
  bool get isFetching => status == QueryStatus.fetching;

  /// True jika fetch berhasil
  bool get isSuccess => status == QueryStatus.success;

  /// True jika fetch gagal
  bool get isError => status == QueryStatus.error;

  /// True jika ada data (terlepas dari status)
  bool get hasData => data != null;

  /// True jika ada error message
  bool get hasError => errorMessage != null;

  /// Create loading state (first fetch)
  factory QueryState.loading() => const QueryState(status: QueryStatus.loading);

  /// Create fetching state (refetch with existing data)
  factory QueryState.fetching(T data) =>
      QueryState(data: data, status: QueryStatus.fetching);

  /// Create success state
  factory QueryState.success(T data, {bool isFromCache = false}) => QueryState(
    data: data,
    status: QueryStatus.success,
    lastUpdated: DateTime.now(),
    isFromCache: isFromCache,
  );

  /// Create error state (keep old data if available)
  factory QueryState.error(String message, {T? previousData}) => QueryState(
    data: previousData,
    status: QueryStatus.error,
    errorMessage: message,
  );
}
