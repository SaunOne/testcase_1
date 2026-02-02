import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_entry.freezed.dart';
part 'cache_entry.g.dart';

@freezed
class CacheEntry with _$CacheEntry {
  const CacheEntry._();

  const factory CacheEntry({
    required String key,
    required String data,
    required DateTime createdAt,
    required int ttlSeconds,
    @Default([]) List<String> tags,
  }) = _CacheEntry;

  factory CacheEntry.fromJson(Map<String, dynamic> json) =>
      _$CacheEntryFromJson(json);

  bool get isExpired => DateTime.now().isAfter(expiresAt);
  DateTime get expiresAt => createdAt.add(Duration(seconds: ttlSeconds));
}
