part of 'tally_monitor_bloc.dart';

@freezed
class TallyMonitorEvent with _$TallyMonitorEvent {
  /// Initialize monitor with data
  const factory TallyMonitorEvent.started(Map<String, TallyItem> items) =
      _Started;

  /// Select an item
  const factory TallyMonitorEvent.selectItem(String itemId) = _SelectItem;

  /// Select a pallet within current item
  const factory TallyMonitorEvent.selectPallet(String palletId) = _SelectPallet;

  /// Select a cell in the grid
  const factory TallyMonitorEvent.selectCell(String cellId) = _SelectCell;

  /// Add weight to selected cell
  const factory TallyMonitorEvent.addWeight(AddWeightData data) = _AddWeight;

  /// Delete cell value
  const factory TallyMonitorEvent.deleteCell(String cellId) = _DeleteCell;

  /// Toggle offline mode
  const factory TallyMonitorEvent.setOfflineMode(bool isOffline) =
      _SetOfflineMode;

  /// Update items data (from external source)
  const factory TallyMonitorEvent.updateItems(Map<String, TallyItem> items) =
      _UpdateItems;

  /// Add new pallet to current item
  const factory TallyMonitorEvent.addPallet() = _AddPallet;

  /// Navigate to previous pallet
  const factory TallyMonitorEvent.prevPallet() = _PrevPallet;

  /// Navigate to next pallet
  const factory TallyMonitorEvent.nextPallet() = _NextPallet;
}
