import 'package:testcase_1/core/query/endpoints/base_endpoint.dart';

/// Endpoint definition untuk simple mutations (POST/PUT/DELETE)
///
/// Type parameters:
/// - [TData]: Tipe data response
/// - [TParams]: Tipe parameter untuk path (gunakan `void` jika tidak ada)
/// - [TBody]: Tipe request body (gunakan `void` jika tidak ada body)
///
/// Example:
/// ```dart
/// // POST tanpa params
/// static final createPost = MutationEndpoint<Post, void, CreatePostBody>(
///   path: '/posts',
///   method: HttpMethod.post,
///   fromJson: Post.fromJson,
///   invalidatesTags: ['posts'],
/// );
///
/// // PUT dengan params
/// static final updatePost = MutationEndpoint<Post, String, UpdatePostBody>(
///   pathBuilder: (id) => '/posts/$id',
///   method: HttpMethod.put,
///   fromJson: Post.fromJson,
///   invalidatesTags: ['posts', 'post-detail'],
/// );
///
/// // DELETE tanpa body
/// static final deletePost = MutationEndpoint<void, String, void>(
///   pathBuilder: (id) => '/posts/$id',
///   method: HttpMethod.delete,
///   fromJson: (_) {},
///   invalidatesTags: ['posts'],
/// );
/// ```
class MutationEndpoint<TData, TParams, TBody> extends BaseEndpoint
    with InvalidatingEndpoint {
  /// Static path
  final String? path;

  /// Dynamic path builder
  final String Function(TParams params)? pathBuilder;

  /// HTTP method
  final HttpMethod method;

  /// Function untuk convert JSON response ke [TData]
  final TData Function(dynamic json) fromJson;

  /// Tags to invalidate on success
  @override
  final List<String> invalidatesTags;

  /// Optional: Function untuk transform body sebelum send
  final Map<String, dynamic> Function(TBody body)? bodyTransformer;

  const MutationEndpoint({
    this.path,
    this.pathBuilder,
    required this.method,
    required this.fromJson,
    this.invalidatesTags = const [],
    this.bodyTransformer,
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

  /// Transform body jika ada transformer
  dynamic transformBody(TBody body) {
    if (bodyTransformer != null) {
      return bodyTransformer!(body);
    }
    if (body is Map) {
      return body;
    }
    try {
      return (body as dynamic).toJson();
    } catch (_) {
      return body;
    }
  }
}

/// Shortcut untuk mutation tanpa params dan body (simple action)
class SimpleMutationEndpoint<TData>
    extends MutationEndpoint<TData, void, void> {
  const SimpleMutationEndpoint({
    required String super.path,
    required super.method,
    required super.fromJson,
    super.invalidatesTags,
  });

  @override
  String buildPath(void params) => path!;
}
