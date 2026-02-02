import 'dart:convert';
import 'package:flutter/services.dart';

class L10nBundleLoader {
  static final L10nBundleLoader _instance = L10nBundleLoader._internal();
  factory L10nBundleLoader() => _instance;
  L10nBundleLoader._internal();

  final Map<String, Map<String, dynamic>> _cache = {};

  Future<void> loadBundle(
    String locale,
    String bundleName, {
    String? featurePath,
  }) async {
    final key = '${locale}_$bundleName';

    if (_cache.containsKey(key)) {
      return;
    }

    try {
      final path = featurePath ?? 'assets/i18n/$locale/$bundleName.json';
      final jsonString = await rootBundle.loadString(path);
      final data = json.decode(jsonString) as Map<String, dynamic>;
      _cache[key] = data;
    } catch (e) {
      _cache[key] = {};
    }
  }

  Future<void> loadAppBundle(String locale) async {
    await loadBundle(
      locale,
      'app',
      featurePath: 'lib/app/l10n/$locale/app.json',
    );
  }

  Future<void> loadFeatureBundle(String locale, String featureName) async {
    await loadBundle(
      locale,
      featureName,
      featurePath: 'lib/features/$featureName/l10n/$locale/$featureName.json',
    );
  }

  Map<String, dynamic>? getBundle(String locale, String bundleName) {
    final key = '${locale}_$bundleName';
    return _cache[key];
  }

  void clearCache() {
    _cache.clear();
  }
}
