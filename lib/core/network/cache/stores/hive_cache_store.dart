import 'dart:convert';

import 'package:testcase_1/core/network/cache/cache_entry.dart';
import 'package:testcase_1/core/network/cache/cache_store.dart';
import 'package:hive/hive.dart';

class HiveCacheStore implements CacheStore {
  static const String _boxName = 'cache_entries';
  Box<String>? _box;

  Future<void> init() async {
    _box = await Hive.openBox<String>(_boxName);
  }

  @override
  Future<CacheEntry?> get(String key) async {
    final box = _box;
    if (box == null) return null;

    final json = box.get(key);
    if (json == null) return null;

    try {
      final entry = CacheEntry.fromJson(
        jsonDecode(json) as Map<String, dynamic>,
      );
      if (entry.isExpired) {
        await remove(key);
        return null;
      }
      return entry;
    } catch (e) {
      await remove(key);
      return null;
    }
  }

  @override
  Future<void> put(CacheEntry entry) async {
    await _box?.put(entry.key, jsonEncode(entry.toJson()));
  }

  @override
  Future<void> remove(String key) async {
    await _box?.delete(key);
  }

  @override
  Future<void> clear() async {
    await _box?.clear();
  }
}
