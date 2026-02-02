import 'package:hive/hive.dart';

class TagIndex {
  static const String _boxName = 'cache_tag_index';
  Box<List<dynamic>>? _box;

  Future<void> init() async {
    _box = await Hive.openBox<List<dynamic>>(_boxName);
  }

  Future<void> index(String key, List<String> tags) async {
    final box = _box;
    if (box == null) return;

    for (final tag in tags) {
      final existing = box.get(tag);
      final keys = existing?.cast<String>().toList() ?? <String>[];
      if (!keys.contains(key)) {
        keys.add(key);
        await box.put(tag, keys);
      }
    }
  }

  Future<Set<String>> getKeysByTags(List<String> tags) async {
    final box = _box;
    if (box == null) return {};

    final keys = <String>{};
    for (final tag in tags) {
      final existing = box.get(tag);
      final tagKeys = existing?.cast<String>().toList() ?? <String>[];
      keys.addAll(tagKeys);
    }
    return keys;
  }

  Future<void> removeKey(String key) async {
    final box = _box;
    if (box == null) return;

    for (final tag in box.keys) {
      final existing = box.get(tag);
      final keys = existing?.cast<String>().toList() ?? <String>[];
      if (keys.contains(key)) {
        keys.remove(key);
        await box.put(tag as String, keys);
      }
    }
  }

  Future<void> removeKeys(Set<String> keysToRemove) async {
    for (final key in keysToRemove) {
      await removeKey(key);
    }
  }

  Future<void> clear() async {
    await _box?.clear();
  }
}
