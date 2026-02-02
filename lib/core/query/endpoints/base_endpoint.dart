import 'package:testcase_1/core/network/cache/cache_policy.dart';

/// HTTP methods untuk mutations
enum HttpMethod { get, post, put, patch, delete }

/// Base class untuk semua endpoint types
abstract class BaseEndpoint {
  const BaseEndpoint();
}

/// Mixin untuk endpoints yang support caching
mixin CacheableEndpoint {
  CachePolicy get cachePolicy;
  List<String> get tags => cachePolicy.tags;
}

/// Mixin untuk endpoints yang invalidate cache
mixin InvalidatingEndpoint {
  List<String> get invalidatesTags;
}
