import 'package:testcase_1/features/tally_in/data/models/tally_models.dart';

/// Generate dummy tally data for testing
/// Returns a map of TallyItem with:
/// - Minimum 3 items
/// - Each item has >= 2 pallets
/// - Each pallet has maxPcs >= 10
/// - Grid 5x15 (rows A-E, cols 1-15)
/// - Some cells pre-filled for demo
Map<String, TallyItem> generateDummyTallyData() {
  final items = <String, TallyItem>{};

  // Item 1: Apel Fuji
  final item1Id = 'item-001';
  final item1Pallets = <String, TallyPallet>{};

  // Pallet 1 for Item 1 - partially filled
  final pallet1_1Id = 'pallet-001-001';
  final pallet1_1Cells = <String, TallyCell>{};
  _addCell(pallet1_1Cells, 'A', 1, 25.5, 'Good');
  _addCell(pallet1_1Cells, 'B', 1, 24.8, 'Good');
  _addCell(pallet1_1Cells, 'C', 1, 26.2, 'Good');
  _addCell(pallet1_1Cells, 'A', 2, 25.0, 'Good');
  _addCell(pallet1_1Cells, 'B', 2, 24.5, 'Good');

  item1Pallets[pallet1_1Id] = TallyPallet(
    id: pallet1_1Id,
    itemId: item1Id,
    palletNumber: 1,
    palletCode: 'PLT-001-001',
    status: 'In Progress',
    cells: pallet1_1Cells,
    maxPcs: 15,
  );

  // Pallet 2 for Item 1 - empty
  final pallet1_2Id = 'pallet-001-002';
  item1Pallets[pallet1_2Id] = TallyPallet(
    id: pallet1_2Id,
    itemId: item1Id,
    palletNumber: 2,
    palletCode: 'PLT-001-002',
    status: 'Pending',
    cells: const {},
    maxPcs: 15,
  );

  items[item1Id] = TallyItem(
    id: item1Id,
    productName: 'Apel Fuji Premium',
    batchCode: 'BATCH-AF-2024-001',
    pallets: item1Pallets,
    activePalletId: pallet1_1Id,
  );

  // Item 2: Jeruk Mandarin
  final item2Id = 'item-002';
  final item2Pallets = <String, TallyPallet>{};

  // Pallet 1 for Item 2 - more filled
  final pallet2_1Id = 'pallet-002-001';
  final pallet2_1Cells = <String, TallyCell>{};
  _addCell(pallet2_1Cells, 'A', 1, 18.2, 'Good');
  _addCell(pallet2_1Cells, 'B', 1, 17.8, 'Good');
  _addCell(pallet2_1Cells, 'C', 1, 18.5, 'Good');
  _addCell(pallet2_1Cells, 'D', 1, 17.9, 'Good');
  _addCell(pallet2_1Cells, 'E', 1, 18.0, 'Good');
  _addCell(pallet2_1Cells, 'A', 2, 18.3, 'Good');
  _addCell(pallet2_1Cells, 'B', 2, 17.6, 'Good');
  _addCell(pallet2_1Cells, 'C', 2, 18.1, 'Damaged');

  item2Pallets[pallet2_1Id] = TallyPallet(
    id: pallet2_1Id,
    itemId: item2Id,
    palletNumber: 1,
    palletCode: 'PLT-002-001',
    status: 'In Progress',
    cells: pallet2_1Cells,
    maxPcs: 12,
  );

  // Pallet 2 for Item 2
  final pallet2_2Id = 'pallet-002-002';
  final pallet2_2Cells = <String, TallyCell>{};
  _addCell(pallet2_2Cells, 'A', 1, 17.5, 'Good');
  _addCell(pallet2_2Cells, 'B', 1, 18.0, 'Good');

  item2Pallets[pallet2_2Id] = TallyPallet(
    id: pallet2_2Id,
    itemId: item2Id,
    palletNumber: 2,
    palletCode: 'PLT-002-002',
    status: 'In Progress',
    cells: pallet2_2Cells,
    maxPcs: 12,
  );

  // Pallet 3 for Item 2
  final pallet2_3Id = 'pallet-002-003';
  item2Pallets[pallet2_3Id] = TallyPallet(
    id: pallet2_3Id,
    itemId: item2Id,
    palletNumber: 3,
    palletCode: 'PLT-002-003',
    status: 'Pending',
    cells: const {},
    maxPcs: 12,
  );

  items[item2Id] = TallyItem(
    id: item2Id,
    productName: 'Jeruk Mandarin',
    batchCode: 'BATCH-JM-2024-002',
    pallets: item2Pallets,
    activePalletId: pallet2_1Id,
  );

  // Item 3: Anggur Merah
  final item3Id = 'item-003';
  final item3Pallets = <String, TallyPallet>{};

  // Pallet 1 for Item 3 - fully filled (complete)
  final pallet3_1Id = 'pallet-003-001';
  final pallet3_1Cells = <String, TallyCell>{};
  for (var col = 1; col <= 2; col++) {
    for (var row in ['A', 'B', 'C', 'D', 'E']) {
      _addCell(pallet3_1Cells, row, col, 12.0 + (col * 0.5), 'Good');
    }
  }

  item3Pallets[pallet3_1Id] = TallyPallet(
    id: pallet3_1Id,
    itemId: item3Id,
    palletNumber: 1,
    palletCode: 'PLT-003-001',
    status: 'Finished',
    cells: pallet3_1Cells,
    maxPcs: 10,
  );

  // Pallet 2 for Item 3 - partially filled
  final pallet3_2Id = 'pallet-003-002';
  final pallet3_2Cells = <String, TallyCell>{};
  _addCell(pallet3_2Cells, 'A', 1, 12.3, 'Good');
  _addCell(pallet3_2Cells, 'B', 1, 12.1, 'Good');
  _addCell(pallet3_2Cells, 'C', 1, 12.5, 'Good');

  item3Pallets[pallet3_2Id] = TallyPallet(
    id: pallet3_2Id,
    itemId: item3Id,
    palletNumber: 2,
    palletCode: 'PLT-003-002',
    status: 'In Progress',
    cells: pallet3_2Cells,
    maxPcs: 10,
  );

  items[item3Id] = TallyItem(
    id: item3Id,
    productName: 'Anggur Merah Import',
    batchCode: 'BATCH-AM-2024-003',
    pallets: item3Pallets,
    activePalletId: pallet3_2Id,
  );

  // Item 4: Pir Xiang Lie
  final item4Id = 'item-004';
  final item4Pallets = <String, TallyPallet>{};

  // Pallet 1 for Item 4
  final pallet4_1Id = 'pallet-004-001';
  final pallet4_1Cells = <String, TallyCell>{};
  _addCell(pallet4_1Cells, 'A', 1, 15.5, 'Good');
  _addCell(pallet4_1Cells, 'B', 1, 15.2, 'Good');

  item4Pallets[pallet4_1Id] = TallyPallet(
    id: pallet4_1Id,
    itemId: item4Id,
    palletNumber: 1,
    palletCode: 'PLT-004-001',
    status: 'In Progress',
    cells: pallet4_1Cells,
    maxPcs: 10,
  );

  // Pallet 2 for Item 4 - empty
  final pallet4_2Id = 'pallet-004-002';
  item4Pallets[pallet4_2Id] = TallyPallet(
    id: pallet4_2Id,
    itemId: item4Id,
    palletNumber: 2,
    palletCode: 'PLT-004-002',
    status: 'Pending',
    cells: const {},
    maxPcs: 10,
  );

  items[item4Id] = TallyItem(
    id: item4Id,
    productName: 'Pir Xiang Lie',
    batchCode: 'BATCH-PX-2024-004',
    pallets: item4Pallets,
    activePalletId: pallet4_1Id,
  );

  return items;
}

/// Helper to add a cell to the map
void _addCell(
  Map<String, TallyCell> cells,
  String rowLabel,
  int columnIndex,
  double weight,
  String condition,
) {
  final cellId = '$rowLabel$columnIndex';
  cells[cellId] = TallyCell(
    id: cellId,
    rowLabel: rowLabel,
    columnIndex: columnIndex,
    weight: weight,
    condition: condition,
    prodDate: DateTime(2024, 12, 15),
    expDate: DateTime(2025, 6, 15),
    createdAt: DateTime.now(),
  );
}

/// Generate dummy top bar data
TallyTopBarData generateDummyTopBarData() {
  return const TallyTopBarData(
    asnNumber: 'ASN-2024-00123',
    companyName: 'PT. Fresh Fruit',
    vehicleNumber: 'B 123',
    containerSeal: 'CONT-ABC123 ',
    isOffline: false,
  );
}
