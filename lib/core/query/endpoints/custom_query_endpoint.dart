import 'package:testcase_1/core/network/cache/cache_policy.dart';
import 'package:testcase_1/core/query/endpoints/base_endpoint.dart';
import 'package:testcase_1/core/query/client/query_client.dart';

/// Type definition untuk custom fetcher function
///
/// Parameters:
/// - [params]: Parameter dari UI
/// - [client]: QueryClient untuk nested queries
typedef QueryFetcher<TData, TParams> =
    Future<TData> Function(TParams params, QueryClient client);

/// Endpoint definition untuk complex queries dengan custom fetcher
///
/// Gunakan ini ketika:
/// - Perlu combine multiple API calls
/// - Perlu transform data sebelum return
/// - Perlu business logic kompleks
///
/// Example:
/// ```dart
/// static final getPostWithComments = CustomQueryEndpoint<PostWithComments, String>(
///   queryKey: (id) => ['post-with-comments', id],
///   cachePolicy: CachePolicy(tags: ['posts', 'comments']),
///   fetcher: (id, client) async {
///     final post = await client.fetch(getPost, params: id);
///     final comments = await client.fetch(getComments, params: id);
///     return PostWithComments(post: post, comments: comments);
///   },
/// );
/// ```
class CustomQueryEndpoint<TData, TParams> extends BaseEndpoint
    with CacheableEndpoint {
  /// Function untuk generate unique cache key
  final List<String> Function(TParams params) queryKey;

  /// Custom fetcher function
  final QueryFetcher<TData, TParams> fetcher;

  /// Cache policy
  @override
  final CachePolicy cachePolicy;

  const CustomQueryEndpoint({
    required this.queryKey,
    required this.fetcher,
    this.cachePolicy = const CachePolicy(),
  });

  /// Build cache key dari queryKey function
  String buildCacheKey(TParams params) {
    return queryKey(params).join(':');
  }

  /// Execute fetcher
  Future<TData> execute(TParams params, QueryClient client) {
    return fetcher(params, client);
  }
}

/// Shortcut untuk CustomQueryEndpoint tanpa params
class SimpleCustomQueryEndpoint<TData>
    extends CustomQueryEndpoint<TData, void> {
  SimpleCustomQueryEndpoint({
    required List<String> queryKey,
    required Future<TData> Function(QueryClient client) fetcher,
    super.cachePolicy,
  }) : super(
         queryKey: (_) => queryKey,
         fetcher: (_, client) => fetcher(client),
       );
}
