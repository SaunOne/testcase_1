part of 'tally_monitor_bloc.dart';

@freezed
class TallyMonitorState with _$TallyMonitorState {
  const TallyMonitorState._();

  const factory TallyMonitorState({
    /// All items data
    @Default({}) Map<String, TallyItem> items,

    /// Currently active item ID
    @Default(null) String? activeItemId,

    /// Currently active pallet ID
    @Default(null) String? activePalletId,

    /// Currently selected cell ID
    @Default(null) String? selectedCellId,

    /// Next cell position for auto-focus
    @Default(null) String? nextCellPosition,

    /// Offline mode flag
    @Default(false) bool isOffline,

    /// Loading state
    @Default(false) bool isLoading,
  }) = _TallyMonitorState;

  /// Get active item
  TallyItem? get activeItem =>
      activeItemId != null ? items[activeItemId] : null;

  /// Get active pallet
  TallyPallet? get activePallet {
    final item = activeItem;
    if (item == null || activePalletId == null) return null;
    return item.pallets[activePalletId];
  }

  /// Grand total weight across all items
  double get grandTotalWeight =>
      items.values.fold(0.0, (sum, item) => sum + item.totalWeight);

  /// Grand total pieces across all items
  int get grandTotalPcs =>
      items.values.fold(0, (sum, item) => sum + item.totalPcs);

  /// List of items sorted by ID
  List<TallyItem> get itemList {
    final list = items.values.toList();
    list.sort((a, b) => a.id.compareTo(b.id));
    return list;
  }

  /// Get cells for display in grid (from active pallet)
  Map<String, TallyCell> get displayCells => activePallet?.cells ?? {};

  /// Can navigate to previous pallet
  bool get canNavigatePrevPallet {
    final item = activeItem;
    if (item == null || item.pallets.isEmpty) return false;
    final palletIds = item.pallets.keys.toList();
    final currentIndex = palletIds.indexOf(activePalletId ?? '');
    return currentIndex > 0;
  }

  /// Can navigate to next pallet
  bool get canNavigateNextPallet {
    final item = activeItem;
    if (item == null || item.pallets.isEmpty) return false;
    final palletIds = item.pallets.keys.toList();
    final currentIndex = palletIds.indexOf(activePalletId ?? '');
    return currentIndex >= 0 && currentIndex < palletIds.length - 1;
  }
}
