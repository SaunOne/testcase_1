import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/foundation.dart';

/// Battery state information
class BatteryInfo {
  const BatteryInfo({
    required this.level,
    required this.state,
  });

  /// Battery level (0-100)
  final int level;

  /// Current battery state
  final BatteryState state;

  /// Whether battery is low (below 20%)
  bool get isLow => level < 20;

  /// Whether battery is critical (below 10%)
  bool get isCritical => level < 10;

  /// Whether device is charging
  bool get isCharging =>
      state == BatteryState.charging || state == BatteryState.full;

  @override
  String toString() => 'BatteryInfo(level: $level%, state: $state)';
}

/// Service for monitoring device battery
class BatteryService {
  BatteryService._();
  static final instance = BatteryService._();

  final Battery _battery = Battery();

  StreamSubscription<BatteryState>? _stateSubscription;
  final _batteryController = StreamController<BatteryInfo>.broadcast();

  /// Stream of battery info updates
  Stream<BatteryInfo> get batteryStream => _batteryController.stream;

  /// Last known battery info
  BatteryInfo? _lastKnownInfo;
  BatteryInfo? get lastKnownInfo => _lastKnownInfo;

  /// Get current battery info
  Future<BatteryInfo> getBatteryInfo() async {
    try {
      final level = await _battery.batteryLevel;
      final state = await _battery.batteryState;

      final info = BatteryInfo(level: level, state: state);
      _lastKnownInfo = info;

      return info;
    } catch (e) {
      debugPrint('[BatteryService] Error getting battery info: $e');
      // Return cached or default
      return _lastKnownInfo ??
          const BatteryInfo(level: -1, state: BatteryState.unknown);
    }
  }

  /// Start monitoring battery changes
  void startMonitoring() {
    _stateSubscription?.cancel();

    _stateSubscription = _battery.onBatteryStateChanged.listen(
      (state) async {
        final level = await _battery.batteryLevel;
        final info = BatteryInfo(level: level, state: state);
        _lastKnownInfo = info;
        _batteryController.add(info);
      },
      onError: (Object e) {
        debugPrint('[BatteryService] Stream error: $e');
      },
    );
  }

  /// Stop monitoring
  void stopMonitoring() {
    _stateSubscription?.cancel();
    _stateSubscription = null;
  }

  /// Check if battery saver mode is active (Android only)
  Future<bool> isInBatterySaveMode() async {
    try {
      return await _battery.isInBatterySaveMode;
    } catch (e) {
      return false;
    }
  }

  /// Dispose service
  void dispose() {
    stopMonitoring();
    _batteryController.close();
  }
}
