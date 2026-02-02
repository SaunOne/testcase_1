import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testcase_1/features/tally_in/data/models/tally_models.dart';

part 'tally_list_event.dart';
part 'tally_list_state.dart';
part 'tally_list_bloc.freezed.dart';

class TallyListBloc extends Bloc<TallyListEvent, TallyListState> {
  TallyListBloc() : super(const TallyListState()) {
    on<_Started>(_onStarted);
    on<_SelectItem>(_onSelectItem);
    on<_UpdateItemTotals>(_onUpdateItemTotals);
    on<_FinishItem>(_onFinishItem);
    on<_UpdateItems>(_onUpdateItems);
  }

  void _onStarted(_Started event, Emitter<TallyListState> emit) {
    final items = event.items;
    if (items.isEmpty) {
      emit(state.copyWith(items: items, isLoading: false));
      return;
    }

    // Set first item as active
    final firstItemId = items.keys.first;

    emit(state.copyWith(
      items: items,
      activeItemId: firstItemId,
      isLoading: false,
    ));
  }

  void _onSelectItem(_SelectItem event, Emitter<TallyListState> emit) {
    if (!state.items.containsKey(event.itemId)) return;
    emit(state.copyWith(activeItemId: event.itemId));
  }

  void _onUpdateItemTotals(
      _UpdateItemTotals event, Emitter<TallyListState> emit) {
    final item = state.items[event.itemId];
    if (item == null) return;

    // Items are already updated through TallyMonitorBloc
    // This event is mainly for triggering UI rebuild if needed
    // The actual data is synced via updateItems event
  }

  void _onFinishItem(_FinishItem event, Emitter<TallyListState> emit) {
    final item = state.items[event.itemId];
    if (item == null) return;

    final updatedItem = item.copyWith(isFinished: true);
    final updatedItems = Map<String, TallyItem>.from(state.items);
    updatedItems[event.itemId] = updatedItem;

    emit(state.copyWith(items: updatedItems));
  }

  void _onUpdateItems(_UpdateItems event, Emitter<TallyListState> emit) {
    emit(state.copyWith(items: event.items));
  }
}
