import 'package:geolocator/geolocator.dart';

/// Result wrapper for location operations
sealed class LocationResult {
  const LocationResult();
}

class LocationSuccess extends LocationResult {
  const LocationSuccess(this.position);
  final Position position;
}

class LocationError extends LocationResult {
  const LocationError(this.type, [this.message]);
  final LocationErrorType type;
  final String? message;
}

enum LocationErrorType {
  /// Location services disabled on device
  serviceDisabled,

  /// Permission denied by user
  permissionDenied,

  /// Permission permanently denied (need to open settings)
  permissionDeniedForever,

  /// Timeout getting location
  timeout,

  /// Unknown error
  unknown,
}

/// Permission status for location
enum AppLocationPermission {
  /// Permission granted (foreground only)
  granted,

  /// Permission granted including background
  grantedBackground,

  /// Permission denied
  denied,

  /// Permission permanently denied
  deniedForever,

  /// Location services disabled
  serviceDisabled,
}
