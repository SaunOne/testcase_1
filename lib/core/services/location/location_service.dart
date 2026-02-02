import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:testcase_1/core/services/location/location_result.dart';

/// Service for handling device location
class LocationService {
  LocationService._();
  static final instance = LocationService._();

  StreamSubscription<Position>? _positionSubscription;
  final _positionController = StreamController<Position>.broadcast();

  /// Stream of position updates
  Stream<Position> get positionStream => _positionController.stream;

  /// Current cached position
  Position? _lastKnownPosition;
  Position? get lastKnownPosition => _lastKnownPosition;

  /// Check current permission status
  Future<AppLocationPermission> checkPermission() async {
    // Check if location services enabled
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return AppLocationPermission.serviceDisabled;
    }

    // Check permission status
    final permission = await Geolocator.checkPermission();

    switch (permission) {
      case LocationPermission.denied:
        return AppLocationPermission.denied;
      case LocationPermission.deniedForever:
        return AppLocationPermission.deniedForever;
      case LocationPermission.whileInUse:
        return AppLocationPermission.granted;
      case LocationPermission.always:
        return AppLocationPermission.grantedBackground;
      case LocationPermission.unableToDetermine:
        return AppLocationPermission.denied;
    }
  }

  /// Request foreground location permission
  Future<AppLocationPermission> requestPermission() async {
    // Check if location services enabled
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return AppLocationPermission.serviceDisabled;
    }

    // Request permission
    final permission = await Geolocator.requestPermission();

    switch (permission) {
      case LocationPermission.denied:
        return AppLocationPermission.denied;
      case LocationPermission.deniedForever:
        return AppLocationPermission.deniedForever;
      case LocationPermission.whileInUse:
        return AppLocationPermission.granted;
      case LocationPermission.always:
        return AppLocationPermission.grantedBackground;
      case LocationPermission.unableToDetermine:
        return AppLocationPermission.denied;
    }
  }

  /// Request background location permission (Android 10+)
  /// Must call requestPermission() first and get granted
  Future<AppLocationPermission> requestBackgroundPermission() async {
    // On iOS, this is handled automatically with always permission
    // On Android 10+, need separate request
    final status = await ph.Permission.locationAlways.request();

    if (status.isGranted) {
      return AppLocationPermission.grantedBackground;
    } else if (status.isPermanentlyDenied) {
      return AppLocationPermission.deniedForever;
    }
    return AppLocationPermission.granted; // Still have foreground
  }

  /// Open app settings (for permanently denied permissions)
  Future<bool> openSettings() async {
    return Geolocator.openAppSettings();
  }

  /// Open location settings (for disabled location services)
  Future<bool> openLocationSettings() async {
    return Geolocator.openLocationSettings();
  }

  /// Get current position once
  Future<LocationResult> getCurrentPosition({
    Duration timeout = const Duration(seconds: 10),
    LocationAccuracy accuracy = LocationAccuracy.high,
  }) async {
    try {
      // Check permission first
      final permissionStatus = await checkPermission();

      if (permissionStatus == AppLocationPermission.serviceDisabled) {
        return const LocationError(LocationErrorType.serviceDisabled);
      }

      if (permissionStatus == AppLocationPermission.denied) {
        return const LocationError(LocationErrorType.permissionDenied);
      }

      if (permissionStatus == AppLocationPermission.deniedForever) {
        return const LocationError(LocationErrorType.permissionDeniedForever);
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: accuracy,
          timeLimit: timeout,
        ),
      );

      _lastKnownPosition = position;
      return LocationSuccess(position);
    } on TimeoutException {
      return const LocationError(LocationErrorType.timeout);
    } catch (e) {
      debugPrint('[LocationService] Error getting position: $e');
      return LocationError(LocationErrorType.unknown, e.toString());
    }
  }

  /// Start listening to position updates
  Future<void> startPositionStream({
    int distanceFilter = 10, // meters
    LocationAccuracy accuracy = LocationAccuracy.high,
  }) async {
    await stopPositionStream();

    final permissionStatus = await checkPermission();
    if (permissionStatus != AppLocationPermission.granted &&
        permissionStatus != AppLocationPermission.grantedBackground) {
      debugPrint('[LocationService] Cannot start stream: no permission');
      return;
    }

    _positionSubscription =
        Geolocator.getPositionStream(
          locationSettings: LocationSettings(
            accuracy: accuracy,
            distanceFilter: distanceFilter,
          ),
        ).listen(
          (position) {
            _lastKnownPosition = position;
            _positionController.add(position);
          },
          onError: (Object e) {
            debugPrint('[LocationService] Stream error: $e');
          },
        );
  }

  /// Stop listening to position updates
  Future<void> stopPositionStream() async {
    await _positionSubscription?.cancel();
    _positionSubscription = null;
  }

  /// Calculate distance between two points (in meters)
  double distanceBetween(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  ) {
    return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
  }

  /// Dispose service
  void dispose() {
    stopPositionStream();
    _positionController.close();
  }
}
