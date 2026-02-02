import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testcase_1/features/tally_in/data/models/tally_models.dart';

part 'tally_monitor_event.dart';
part 'tally_monitor_state.dart';
part 'tally_monitor_bloc.freezed.dart';

class TallyMonitorBloc extends Bloc<TallyMonitorEvent, TallyMonitorState> {
  TallyMonitorBloc() : super(const TallyMonitorState()) {
    on<_Started>(_onStarted);
    on<_SelectItem>(_onSelectItem);
    on<_SelectPallet>(_onSelectPallet);
    on<_SelectCell>(_onSelectCell);
    on<_AddWeight>(_onAddWeight);
    on<_DeleteCell>(_onDeleteCell);
    on<_SetOfflineMode>(_onSetOfflineMode);
    on<_UpdateItems>(_onUpdateItems);
    on<_AddPallet>(_onAddPallet);
    on<_PrevPallet>(_onPrevPallet);
    on<_NextPallet>(_onNextPallet);
  }

  void _onStarted(_Started event, Emitter<TallyMonitorState> emit) {
    final items = event.items;
    if (items.isEmpty) {
      emit(state.copyWith(items: items, isLoading: false));
      return;
    }

    // Set first item as active
    final firstItemId = items.keys.first;
    final firstItem = items[firstItemId]!;

    // Set first pallet as active
    String? firstPalletId;
    String? nextCell;
    if (firstItem.pallets.isNotEmpty) {
      firstPalletId = firstItem.activePalletId ?? firstItem.pallets.keys.first;
      final pallet = firstItem.pallets[firstPalletId];
      nextCell = pallet?.nextEmptyCell?.id;
    }

    emit(
      state.copyWith(
        items: items,
        activeItemId: firstItemId,
        activePalletId: firstPalletId,
        nextCellPosition: nextCell,
        isLoading: false,
      ),
    );
  }

  void _onSelectItem(_SelectItem event, Emitter<TallyMonitorState> emit) {
    final item = state.items[event.itemId];
    if (item == null) return;

    // Get active pallet for this item
    String? palletId = item.activePalletId;
    if (palletId == null && item.pallets.isNotEmpty) {
      palletId = item.pallets.keys.first;
    }

    String? nextCell;
    if (palletId != null) {
      final pallet = item.pallets[palletId];
      nextCell = pallet?.nextEmptyCell?.id;
    }

    emit(
      state.copyWith(
        activeItemId: event.itemId,
        activePalletId: palletId,
        selectedCellId: null,
        nextCellPosition: nextCell,
      ),
    );
  }

  void _onSelectPallet(_SelectPallet event, Emitter<TallyMonitorState> emit) {
    final item = state.activeItem;
    if (item == null) return;

    final pallet = item.pallets[event.palletId];
    if (pallet == null) return;

    emit(
      state.copyWith(
        activePalletId: event.palletId,
        selectedCellId: null,
        nextCellPosition: pallet.nextEmptyCell?.id,
      ),
    );
  }

  void _onSelectCell(_SelectCell event, Emitter<TallyMonitorState> emit) {
    emit(state.copyWith(selectedCellId: event.cellId));
  }

  void _onAddWeight(_AddWeight event, Emitter<TallyMonitorState> emit) {
    final activeItem = state.activeItem;
    final activePallet = state.activePallet;
    if (activeItem == null || activePallet == null) return;

    // Determine target cell
    final targetCellId = state.selectedCellId ?? state.nextCellPosition;
    if (targetCellId == null) return;

    // Parse cell position
    final rowLabel = targetCellId[0];
    final columnIndex = int.tryParse(targetCellId.substring(1));
    if (columnIndex == null) return;

    // Create new cell with weight data
    final newCell = TallyCell(
      id: targetCellId,
      rowLabel: rowLabel,
      columnIndex: columnIndex,
      weight: event.data.weight,
      condition: event.data.condition,
      prodDate: event.data.prodDate,
      expDate: event.data.expDate,
      createdAt: DateTime.now(),
    );

    // Update cells map
    final updatedCells = Map<String, TallyCell>.from(activePallet.cells);
    updatedCells[targetCellId] = newCell;

    // Update pallet
    final updatedPallet = activePallet.copyWith(cells: updatedCells);

    // Update item's pallets
    final updatedPallets = Map<String, TallyPallet>.from(activeItem.pallets);
    updatedPallets[activePallet.id] = updatedPallet;

    // Update item
    final updatedItem = activeItem.copyWith(pallets: updatedPallets);

    // Update items map
    final updatedItems = Map<String, TallyItem>.from(state.items);
    updatedItems[activeItem.id] = updatedItem;

    // Calculate next cell
    final nextCell = updatedPallet.nextEmptyCell?.id;

    emit(
      state.copyWith(
        items: updatedItems,
        selectedCellId: null,
        nextCellPosition: nextCell,
      ),
    );
  }

  void _onDeleteCell(_DeleteCell event, Emitter<TallyMonitorState> emit) {
    final activeItem = state.activeItem;
    final activePallet = state.activePallet;
    if (activeItem == null || activePallet == null) return;

    // Remove cell from map
    final updatedCells = Map<String, TallyCell>.from(activePallet.cells);
    final cellToDelete = updatedCells[event.cellId];
    if (cellToDelete == null) return;

    // Create empty cell (without weight)
    updatedCells[event.cellId] = cellToDelete.copyWith(
      weight: null,
      condition: null,
      prodDate: null,
      expDate: null,
      createdAt: null,
    );

    // Or completely remove the cell
    updatedCells.remove(event.cellId);

    // Update pallet
    final updatedPallet = activePallet.copyWith(cells: updatedCells);

    // Update item's pallets
    final updatedPallets = Map<String, TallyPallet>.from(activeItem.pallets);
    updatedPallets[activePallet.id] = updatedPallet;

    // Update item
    final updatedItem = activeItem.copyWith(pallets: updatedPallets);

    // Update items map
    final updatedItems = Map<String, TallyItem>.from(state.items);
    updatedItems[activeItem.id] = updatedItem;

    // Recalculate next cell
    final nextCell = updatedPallet.nextEmptyCell?.id;

    emit(state.copyWith(items: updatedItems, nextCellPosition: nextCell));
  }

  void _onSetOfflineMode(
    _SetOfflineMode event,
    Emitter<TallyMonitorState> emit,
  ) {
    emit(state.copyWith(isOffline: event.isOffline));
  }

  void _onUpdateItems(_UpdateItems event, Emitter<TallyMonitorState> emit) {
    emit(state.copyWith(items: event.items));
  }

  void _onAddPallet(_AddPallet event, Emitter<TallyMonitorState> emit) {
    final activeItem = state.activeItem;
    if (activeItem == null) return;

    // Generate new pallet ID
    final newPalletNumber = activeItem.pallets.length + 1;
    final newPalletId = '${activeItem.id}_pallet_$newPalletNumber';

    // Create new empty pallet
    final newPallet = TallyPallet(
      id: newPalletId,
      itemId: activeItem.id,
      palletNumber: newPalletNumber,
      palletCode:
          'PLT-${activeItem.id.substring(0, 4).toUpperCase()}-$newPalletNumber',
      cells: const {},
    );

    // Update item's pallets
    final updatedPallets = Map<String, TallyPallet>.from(activeItem.pallets);
    updatedPallets[newPalletId] = newPallet;

    // Update item
    final updatedItem = activeItem.copyWith(pallets: updatedPallets);

    // Update items map
    final updatedItems = Map<String, TallyItem>.from(state.items);
    updatedItems[activeItem.id] = updatedItem;

    // Switch to the new pallet
    emit(
      state.copyWith(
        items: updatedItems,
        activePalletId: newPalletId,
        selectedCellId: null,
        nextCellPosition: 'A1', // First cell of new pallet
      ),
    );
  }

  void _onPrevPallet(_PrevPallet event, Emitter<TallyMonitorState> emit) {
    final item = state.activeItem;
    if (item == null || item.pallets.isEmpty) return;

    final palletIds = item.pallets.keys.toList();
    final currentIndex = palletIds.indexOf(state.activePalletId ?? '');

    if (currentIndex <= 0) return; // Already at first pallet

    final prevPalletId = palletIds[currentIndex - 1];
    final prevPallet = item.pallets[prevPalletId];

    emit(
      state.copyWith(
        activePalletId: prevPalletId,
        selectedCellId: null,
        nextCellPosition: prevPallet?.nextEmptyCell?.id,
      ),
    );
  }

  void _onNextPallet(_NextPallet event, Emitter<TallyMonitorState> emit) {
    final item = state.activeItem;
    if (item == null || item.pallets.isEmpty) return;

    final palletIds = item.pallets.keys.toList();
    final currentIndex = palletIds.indexOf(state.activePalletId ?? '');

    if (currentIndex < 0 || currentIndex >= palletIds.length - 1) {
      return; // Already at last pallet
    }

    final nextPalletId = palletIds[currentIndex + 1];
    final nextPallet = item.pallets[nextPalletId];

    emit(
      state.copyWith(
        activePalletId: nextPalletId,
        selectedCellId: null,
        nextCellPosition: nextPallet?.nextEmptyCell?.id,
      ),
    );
  }
}
