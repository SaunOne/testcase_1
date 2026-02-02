import 'package:testcase_1/core/network/cache/cache_policy.dart';
import 'package:testcase_1/core/query/endpoints/base_endpoint.dart';

/// Endpoint definition untuk simple GET queries
///
/// Type parameters:
/// - [TData]: Tipe data response
/// - [TParams]: Tipe parameter (gunakan `void` jika tidak ada params)
///
/// Example:
/// ```dart
/// // Tanpa params
/// static final getPosts = QueryEndpoint<List<Post>, void>(
///   path: '/posts',
///   fromJson: Post.fromJsonList,
/// );
///
/// // Dengan params
/// static final getPost = QueryEndpoint<Post, String>(
///   pathBuilder: (id) => '/posts/$id',
///   fromJson: Post.fromJson,
/// );
///
/// // Dengan query params
/// static final searchPosts = QueryEndpoint<List<Post>, SearchParams>(
///   path: '/posts/search',
///   queryParams: (params) => params.toMap(),
///   fromJson: Post.fromJsonList,
/// );
/// ```
class QueryEndpoint<TData, TParams> extends BaseEndpoint
    with CacheableEndpoint {
  /// Static path (gunakan ini ATAU pathBuilder, tidak keduanya)
  final String? path;

  /// Dynamic path builder (untuk path dengan params seperti `/posts/$id`)
  final String Function(TParams params)? pathBuilder;

  /// Function untuk convert JSON response ke [TData]
  final TData Function(dynamic json) fromJson;

  /// Function untuk convert [TParams] ke query parameters
  final Map<String, dynamic> Function(TParams params)? queryParams;

  /// Cache policy (TTL, tags, SWR)
  @override
  final CachePolicy cachePolicy;

  const QueryEndpoint({
    this.path,
    this.pathBuilder,
    required this.fromJson,
    this.queryParams,
    this.cachePolicy = const CachePolicy(),
  }) : assert(
         path != null || pathBuilder != null,
         'Either path or pathBuilder must be provided',
       );

  /// Build full path dengan params
  String buildPath(TParams params) {
    if (pathBuilder != null) {
      return pathBuilder!(params);
    }
    return path!;
  }

  /// Build query parameters
  Map<String, dynamic>? buildQueryParams(TParams params) {
    return queryParams?.call(params);
  }

  /// Generate cache key untuk query ini
  String buildCacheKey(TParams params) {
    final builtPath = buildPath(params);
    final query = buildQueryParams(params);

    if (query == null || query.isEmpty) {
      return 'GET:$builtPath';
    }

    final sortedQuery = Map.fromEntries(
      query.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
    );
    return 'GET:$builtPath:${sortedQuery.toString()}';
  }
}

/// Shortcut untuk QueryEndpoint tanpa params
///
/// Example:
/// ```dart
/// static final getPosts = SimpleQueryEndpoint<List<Post>>(
///   path: '/posts',
///   fromJson: Post.fromJsonList,
/// );
/// ```
class SimpleQueryEndpoint<TData> extends QueryEndpoint<TData, void> {
  const SimpleQueryEndpoint({
    required String super.path,
    required super.fromJson,
    super.cachePolicy,
  });

  @override
  String buildPath(void params) => path!;

  @override
  Map<String, dynamic>? buildQueryParams(void params) => null;

  @override
  String buildCacheKey(void params) => 'GET:$path';
}
