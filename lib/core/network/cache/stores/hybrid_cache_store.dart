import 'package:testcase_1/core/network/cache/cache_entry.dart';
import 'package:testcase_1/core/network/cache/cache_store.dart';
import 'package:testcase_1/core/network/cache/stores/hive_cache_store.dart';
import 'package:testcase_1/core/network/cache/stores/memory_cache_store.dart';
import 'package:testcase_1/core/network/cache/tag_index.dart';

class HybridCacheStore implements CacheStore {
  final MemoryCacheStore _memory;
  final HiveCacheStore _hive;
  final TagIndex _tagIndex;

  HybridCacheStore({
    required MemoryCacheStore memory,
    required HiveCacheStore hive,
    required TagIndex tagIndex,
  }) : _memory = memory,
       _hive = hive,
       _tagIndex = tagIndex;

  @override
  Future<CacheEntry?> get(String key) async {
    // Try memory first
    var entry = await _memory.get(key);
    if (entry != null) return entry;

    // Fallback to Hive
    entry = await _hive.get(key);
    if (entry != null) {
      // Promote to memory
      await _memory.put(entry);
      return entry;
    }

    return null;
  }

  @override
  Future<void> put(CacheEntry entry) async {
    await _memory.put(entry);
    await _hive.put(entry);
    await _tagIndex.index(entry.key, entry.tags);
  }

  @override
  Future<void> remove(String key) async {
    await _memory.remove(key);
    await _hive.remove(key);
    await _tagIndex.removeKey(key);
  }

  @override
  Future<void> clear() async {
    await _memory.clear();
    await _hive.clear();
    await _tagIndex.clear();
  }

  Future<void> invalidateByTags(List<String> tags) async {
    final keys = await _tagIndex.getKeysByTags(tags);
    for (final key in keys) {
      await _memory.remove(key);
      await _hive.remove(key);
    }
    await _tagIndex.removeKeys(keys);
  }

  Future<CacheEntry?> getStale(String key) async {
    final entry = _memory.getSync(key);
    if (entry != null) return entry;
    return _hive.get(key);
  }
}
