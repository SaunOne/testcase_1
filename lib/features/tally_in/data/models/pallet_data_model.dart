/// Data model for a single cell in the pallet grid
class PalletCellData {
  const PalletCellData({
    required this.rowLabel,
    required this.columnIndex,
    this.weight,
  });

  /// Row label (A, B, C, D)
  final String rowLabel;

  /// Column index (1-15)
  final int columnIndex;

  /// Weight value (null if empty)
  final double? weight;

  /// Unique identifier for this cell
  String get cellId => '$rowLabel$columnIndex';

  /// Whether this cell has a value
  bool get hasValue => weight != null;

  PalletCellData copyWith({
    String? rowLabel,
    int? columnIndex,
    double? weight,
  }) {
    return PalletCellData(
      rowLabel: rowLabel ?? this.rowLabel,
      columnIndex: columnIndex ?? this.columnIndex,
      weight: weight ?? this.weight,
    );
  }
}

/// Data model for a single pallet
class PalletData {
  const PalletData({
    required this.palletNumber,
    required this.productName,
    required this.palletCode,
    required this.status,
    required this.totalWeight,
    required this.totalPack,
    required this.cells,
  });

  final int palletNumber;
  final String productName;
  final String palletCode;
  final String status;
  final double totalWeight;
  final int totalPack;
  final List<PalletCellData> cells;

  /// Grid configuration
  static const List<String> rowLabels = ['A', 'B', 'C', 'D'];
  static const int columnCount = 15;

  PalletData copyWith({
    int? palletNumber,
    String? productName,
    String? palletCode,
    String? status,
    double? totalWeight,
    int? totalPack,
    List<PalletCellData>? cells,
  }) {
    return PalletData(
      palletNumber: palletNumber ?? this.palletNumber,
      productName: productName ?? this.productName,
      palletCode: palletCode ?? this.palletCode,
      status: status ?? this.status,
      totalWeight: totalWeight ?? this.totalWeight,
      totalPack: totalPack ?? this.totalPack,
      cells: cells ?? this.cells,
    );
  }
}

/// Pallet progress status
enum PalletStatus {
  finished('Finished'),
  inProgress('In Progress'),
  pending('Pending');

  const PalletStatus(this.label);
  final String label;
}

/// Data model for product item in the list
class ProductItemData {
  const ProductItemData({
    required this.id,
    required this.productName,
    required this.batchCode,
    required this.totalWeight,
    required this.totalPack,
    required this.currentPallet,
    required this.totalPallet,
    this.activePalletCount = 0,
    this.isSelected = false,
  });

  final String id;
  final String productName;
  final String batchCode;
  final double totalWeight;
  final int totalPack;
  final int currentPallet;
  final int totalPallet;
  final int activePalletCount;
  final bool isSelected;

  /// Whether this item has active pallets
  bool get hasActivePallets => activePalletCount > 0;

  ProductItemData copyWith({
    String? id,
    String? productName,
    String? batchCode,
    double? totalWeight,
    int? totalPack,
    int? currentPallet,
    int? totalPallet,
    int? activePalletCount,
    bool? isSelected,
  }) {
    return ProductItemData(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      batchCode: batchCode ?? this.batchCode,
      totalWeight: totalWeight ?? this.totalWeight,
      totalPack: totalPack ?? this.totalPack,
      currentPallet: currentPallet ?? this.currentPallet,
      totalPallet: totalPallet ?? this.totalPallet,
      activePalletCount: activePalletCount ?? this.activePalletCount,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

/// Summary data for list header
class ListSummaryData {
  const ListSummaryData({
    required this.currentPallets,
    required this.totalPallets,
    required this.totalItems,
  });

  final int currentPallets;
  final int totalPallets;
  final int totalItems;
}
