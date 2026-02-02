import 'package:testcase_1/core/network/cache/cache_entry.dart';

abstract class CacheStore {
  Future<CacheEntry?> get(String key);
  Future<void> put(CacheEntry entry);
  Future<void> remove(String key);
  Future<void> clear();
}
