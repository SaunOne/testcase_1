import 'package:freezed_annotation/freezed_annotation.dart';

part 'tally_models.freezed.dart';

/// Cell position in the grid (e.g., A1, B5, E15)
@freezed
class TallyCell with _$TallyCell {
  const TallyCell._();

  const factory TallyCell({
    required String id,
    required String rowLabel,
    required int columnIndex,
    @Default(null) double? weight,
    @Default(null) String? condition,
    @Default(null) DateTime? prodDate,
    @Default(null) DateTime? expDate,
    @Default(null) DateTime? createdAt,
  }) = _TallyCell;

  /// Whether this cell has a value
  bool get hasValue => weight != null;

  /// Cell position string (e.g., "A1", "B5")
  String get position => '$rowLabel$columnIndex';
}

/// Pallet containing a grid of cells
@freezed
class TallyPallet with _$TallyPallet {
  const TallyPallet._();

  const factory TallyPallet({
    required String id,
    required String itemId,
    required int palletNumber,
    required String palletCode,
    @Default('In Progress') String status,
    @Default({}) Map<String, TallyCell> cells,
    @Default(10) int maxPcs,
  }) = _TallyPallet;

  /// Grid configuration
  static const List<String> rowLabels = ['A', 'B', 'C', 'D', 'E'];
  static const int columnCount = 15;

  /// Total weight of all cells
  double get totalWeight => cells.values
      .where((c) => c.hasValue)
      .fold(0.0, (sum, c) => sum + (c.weight ?? 0));

  /// Total pieces (cells with value)
  int get totalPcs => cells.values.where((c) => c.hasValue).length;

  /// Whether pallet is complete (reached maxPcs)
  bool get isComplete => totalPcs >= maxPcs;

  /// Get next empty cell position
  /// Fill direction: right first (A1→A15), then down (B1→B15)
  TallyCell? get nextEmptyCell {
    for (var row in rowLabels) {
      for (var col = 1; col <= columnCount; col++) {
        final cellId = '$row$col';
        if (!cells.containsKey(cellId) || !cells[cellId]!.hasValue) {
          return TallyCell(id: cellId, rowLabel: row, columnIndex: col);
        }
      }
    }
    return null;
  }

  /// Get cell by position
  TallyCell? getCell(String rowLabel, int columnIndex) {
    final cellId = '$rowLabel$columnIndex';
    return cells[cellId];
  }
}

/// Item containing multiple pallets
@freezed
class TallyItem with _$TallyItem {
  const TallyItem._();

  const factory TallyItem({
    required String id,
    required String productName,
    required String batchCode,
    @Default({}) Map<String, TallyPallet> pallets,
    @Default(null) String? activePalletId,
    @Default(false) bool isFinished,
  }) = _TallyItem;

  /// Total weight across all pallets
  double get totalWeight =>
      pallets.values.fold(0.0, (sum, p) => sum + p.totalWeight);

  /// Total pieces across all pallets
  int get totalPcs => pallets.values.fold(0, (sum, p) => sum + p.totalPcs);

  /// Number of pallets
  int get palletCount => pallets.length;

  /// Number of finished pallets
  int get finishedPalletCount =>
      pallets.values.where((p) => p.isComplete).length;

  /// Active pallet
  TallyPallet? get activePallet =>
      activePalletId != null ? pallets[activePalletId] : null;

  /// List of pallets sorted by number
  List<TallyPallet> get palletList {
    final list = pallets.values.toList();
    list.sort((a, b) => a.palletNumber.compareTo(b.palletNumber));
    return list;
  }
}

/// Data payload for adding weight to a cell
@freezed
class AddWeightData with _$AddWeightData {
  const factory AddWeightData({
    required double weight,
    required String condition,
    required DateTime prodDate,
    required DateTime expDate,
  }) = _AddWeightData;
}

/// Input validation status
enum InputStatus { idle, validating, valid, invalid, success }

/// Top bar data
@freezed
class TallyTopBarData with _$TallyTopBarData {
  const factory TallyTopBarData({
    required String asnNumber,
    required String companyName,
    required String vehicleNumber,
    required String containerSeal,
    @Default(false) bool isOffline,
  }) = _TallyTopBarData;
}
