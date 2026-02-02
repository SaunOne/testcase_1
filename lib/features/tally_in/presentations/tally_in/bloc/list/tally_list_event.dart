part of 'tally_list_bloc.dart';

@freezed
class TallyListEvent with _$TallyListEvent {
  /// Initialize list with data
  const factory TallyListEvent.started(Map<String, TallyItem> items) = _Started;

  /// Select an item
  const factory TallyListEvent.selectItem(String itemId) = _SelectItem;

  /// Update item totals (called from monitor after addWeight)
  const factory TallyListEvent.updateItemTotals({
    required String itemId,
    required double totalWeight,
    required int totalPcs,
  }) = _UpdateItemTotals;

  /// Mark item as finished
  const factory TallyListEvent.finishItem(String itemId) = _FinishItem;

  /// Update all items data
  const factory TallyListEvent.updateItems(Map<String, TallyItem> items) =
      _UpdateItems;
}
