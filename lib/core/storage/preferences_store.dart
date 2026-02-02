import 'package:shared_preferences/shared_preferences.dart';

class PreferencesStore {
  final SharedPreferences _prefs;

  PreferencesStore({required SharedPreferences prefs}) : _prefs = prefs;

  static const _onboardingCompletedKey = 'onboarding_completed';
  static const _localeKey = 'locale';

  bool get isOnboardingCompleted =>
      _prefs.getBool(_onboardingCompletedKey) ?? false;

  Future<void> setOnboardingCompleted({bool value = true}) =>
      _prefs.setBool(_onboardingCompletedKey, value);

  String? get locale => _prefs.getString(_localeKey);

  Future<void> setLocale(String locale) => _prefs.setString(_localeKey, locale);

  Future<void> clear() => _prefs.clear();
}
