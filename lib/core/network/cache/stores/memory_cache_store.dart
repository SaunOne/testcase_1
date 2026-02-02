import 'package:testcase_1/core/network/cache/cache_entry.dart';
import 'package:testcase_1/core/network/cache/cache_store.dart';

class MemoryCacheStore implements CacheStore {
  final Map<String, CacheEntry> _cache = {};

  @override
  Future<CacheEntry?> get(String key) async {
    final entry = _cache[key];
    if (entry != null && entry.isExpired) {
      _cache.remove(key);
      return null;
    }
    return entry;
  }

  @override
  Future<void> put(CacheEntry entry) async {
    _cache[entry.key] = entry;
  }

  @override
  Future<void> remove(String key) async {
    _cache.remove(key);
  }

  @override
  Future<void> clear() async {
    _cache.clear();
  }

  CacheEntry? getSync(String key) {
    final entry = _cache[key];
    if (entry != null && entry.isExpired) {
      _cache.remove(key);
      return null;
    }
    return entry;
  }
}
