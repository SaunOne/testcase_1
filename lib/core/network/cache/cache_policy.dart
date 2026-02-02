import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_policy.freezed.dart';

@freezed
class CachePolicy with _$CachePolicy {
  const CachePolicy._();

  const factory CachePolicy({
    @Default(60) int ttlSeconds,
    @Default(false) bool swr,
    @Default(true) bool showStaleWithIndicator,
    @Default([]) List<String> tags,
  }) = _CachePolicy;

  static const CachePolicy noCache = CachePolicy(ttlSeconds: 0);
  static const CachePolicy standard = CachePolicy();
  static const CachePolicy swrEnabled = CachePolicy(swr: true);
  static const CachePolicy longTerm = CachePolicy(ttlSeconds: 3600);
}
