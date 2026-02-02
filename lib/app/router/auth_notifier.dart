import 'package:flutter/foundation.dart';

enum SessionExpireReason {
  tokenExpired,
  refreshFailed,
  manual,
}

class AuthNotifier extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _sessionExpired = false;
  SessionExpireReason? _expireReason;

  bool get isLoggedIn => _isLoggedIn;
  bool get sessionExpired => _sessionExpired;
  SessionExpireReason? get expireReason => _expireReason;

  void setLoggedIn({required bool value}) {
    _isLoggedIn = value;
    if (value) {
      // Reset session expired state on login
      _sessionExpired = false;
      _expireReason = null;
    }
    notifyListeners();
  }

  void login() => setLoggedIn(value: true);

  void logout({SessionExpireReason? reason}) {
    _isLoggedIn = false;
    if (reason != null) {
      _sessionExpired = true;
      _expireReason = reason;
    }
    notifyListeners();
  }

  /// Clear the session expired flag (call after showing snackbar)
  void clearSessionExpired() {
    _sessionExpired = false;
    _expireReason = null;
  }
}
