part of 'tally_list_bloc.dart';

@freezed
class TallyListState with _$TallyListState {
  const TallyListState._();

  const factory TallyListState({
    /// All items data
    @Default({}) Map<String, TallyItem> items,

    /// Currently active item ID
    @Default(null) String? activeItemId,

    /// Loading state
    @Default(false) bool isLoading,
  }) = _TallyListState;

  /// List of items
  List<TallyItem> get itemList {
    final list = items.values.toList();
    list.sort((a, b) => a.id.compareTo(b.id));
    return list;
  }

  /// Active item
  TallyItem? get activeItem =>
      activeItemId != null ? items[activeItemId] : null;

  /// Total items count
  int get totalItems => items.length;

  /// Finished items count
  int get finishedItems => items.values.where((i) => i.isFinished).length;

  /// Total pallets across all items
  int get totalPallets =>
      items.values.fold(0, (sum, item) => sum + item.palletCount);

  /// Current pallets (in progress)
  int get currentPallets => items.values.fold(
      0, (sum, item) => sum + item.palletCount - item.finishedPalletCount);
}
