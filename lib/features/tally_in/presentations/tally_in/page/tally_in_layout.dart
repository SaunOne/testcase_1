import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';

/// Main layout for Tally In page
///
/// Structure:
/// ```
/// ┌─────────────────────────────────────────────────┐
/// │                   topBar                         │
/// ├─────────────────────────────────────────────────┤
/// │                palletMonitor                     │
/// ├───────────────────────────┬─────────────────────┤
/// │                           │                     │
/// │       itemList            │     dataInput       │
/// │       (flex: 6)           │     (flex: 4)       │
/// │                           │                     │
/// └───────────────────────────┴─────────────────────┘
/// ```
class TallyInLayout extends StatelessWidget {
  const TallyInLayout({
    super.key,
    required this.topBar,
    required this.palletMonitor,
    required this.itemList,
    required this.inputPanel,
  });

  /// Top bar with back button, ASN info, and action chips
  final Widget topBar;

  /// Pallet monitor section (grid view)
  final Widget palletMonitor;

  /// Item list section (product cards)
  final Widget itemList;

  /// Input panel section (numpad and form)
  final Widget inputPanel;

  /// Layout configuration
  static const double _gap = 12;
  static const double _breakpoint = 1024;

  /// Flex ratios for responsive layout
  static const int _itemListFlex = 6;
  static const int _dataInputFlex = 4;

  /// Maximum height for pallet monitor section
  static const double _palletMonitorMaxHeight = 360;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWideScreen = constraints.maxWidth >= _breakpoint;

            return Column(
              children: [
                // Top bar (fixed height based on content)
                topBar,
                // Main content area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    child: Column(
                      children: [
                        // Pallet monitor (max height with scroll)
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: _palletMonitorMaxHeight,
                          ),
                          child: palletMonitor,
                        ),
                        const SizedBox(height: _gap),

                        // Bottom section (items + data input)
                        Expanded(
                          child: isWideScreen
                              ? _buildWideLayout()
                              : _buildNarrowLayout(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Wide screen layout: items and data input side by side
  Widget _buildWideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Item list (left side)
        Expanded(flex: _itemListFlex, child: itemList),
        const SizedBox(width: _gap),
        // Input panel (right side)
        Expanded(flex: _dataInputFlex, child: inputPanel),
      ],
    );
  }

  /// Narrow screen layout: stacked vertically with fixed proportions
  Widget _buildNarrowLayout() {
    return Column(
      children: [
        // Item list (takes 60% of available space)
        Expanded(flex: _itemListFlex, child: itemList),
        const SizedBox(height: _gap),
        // Input panel (takes 40% of available space)
        Expanded(flex: _dataInputFlex, child: inputPanel),
      ],
    );
  }
}
