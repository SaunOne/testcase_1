import 'package:flutter/material.dart';
import 'package:testcase_1/features/tally_in/data/models/pallet_data_model.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/page/sections/input_panel_section.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/page/sections/list_item_section.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/page/sections/pallet_monitor_section.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/page/sections/tally_top_bar_section.dart';
import 'package:testcase_1/features/tally_in/presentations/tally_in/page/tally_in_layout.dart';

class TallyInPage extends StatelessWidget {
  const TallyInPage({super.key});
  static const routeName = '/tally_in';

  @override
  Widget build(BuildContext context) {
    return TallyInLayout(
      topBar: const TallyTopBarSection(
        data: TallyTopBarData(
          asnNumber: 'ASN Number',
          companyName: 'Company Name',
          vehicleNumber: 'Vehicle Number',
          containerSeal: 'Container/Seal',
          isOffline: false,
        ),
      ),
      palletMonitor: PalletMonitorSection(
        data: PalletData(
          cells: [
            const PalletCellData(rowLabel: 'A', columnIndex: 1, weight: 0),
          ],
          palletNumber: 1,
          productName: 'Product Name',
          palletCode: 'Pallet Code',
          status: 'Status',
          totalWeight: 0,
          totalPack: 0,
        ),
      ),
      itemList: const ListItemSection(
        items: [],
        summaryData: ListSummaryData(
          currentPallets: 0,
          totalPallets: 0,
          totalItems: 0,
        ),
      ),
      inputPanel: const InputPanelSection(formData: DataInputFormData()),
    );
  }
}
