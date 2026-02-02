import 'package:get_it/get_it.dart';
import 'package:testcase_1/core/query/client/query_client.dart';
import 'package:testcase_1/core/query/endpoints/base_endpoint.dart';

/// Type definition untuk custom mutator function
///
/// Parameters:
/// - [params]: Parameter dari UI
/// - [body]: Request body dari UI
/// - [client]: QueryClient untuk nested operations
/// - [deps]: GetIt untuk akses dependencies (services, etc)
typedef MutationMutator<TData, TParams, TBody> =
    Future<TData> Function(
      TParams params,
      TBody body,
      QueryClient client,
      GetIt deps,
    );

/// Endpoint definition untuk complex mutations dengan side effects
///
/// Gunakan ini ketika:
/// - Perlu side effects (analytics, local DB, etc)
/// - Perlu multiple API calls dalam satu mutation
/// - Perlu access ke services lain
///
/// Example:
/// ```dart
/// static final createPostWithDraft = CustomMutationEndpoint<Post, void, CreatePostBody>(
///   invalidatesTags: ['posts'],
///   mutator: (_, body, client, deps) async {
///     // Create post via API
///     final post = await client.mutate(createPost, body: body);
///
///     // Side effect: clear local draft
///     await deps.get<LocalDatabase>().clearDraft(body.draftId);
///
///     // Side effect: track analytics
///     deps.get<AnalyticsService>().trackPostCreated(post.id);
///
///     return post;
///   },
/// );
/// ```
class CustomMutationEndpoint<TData, TParams, TBody> extends BaseEndpoint
    with InvalidatingEndpoint {
  /// Custom mutator function
  final MutationMutator<TData, TParams, TBody> mutator;

  /// Tags to invalidate on success
  @override
  final List<String> invalidatesTags;

  /// Optional: Callback on success
  final void Function(TData data)? onSuccess;

  /// Optional: Callback on error
  final void Function(String error)? onError;

  const CustomMutationEndpoint({
    required this.mutator,
    this.invalidatesTags = const [],
    this.onSuccess,
    this.onError,
  });

  /// Execute mutator
  Future<TData> execute(
    TParams params,
    TBody body,
    QueryClient client,
    GetIt deps,
  ) {
    return mutator(params, body, client, deps);
  }
}

/// Shortcut untuk CustomMutationEndpoint tanpa params
class SimpleCustomMutationEndpoint<TData, TBody>
    extends CustomMutationEndpoint<TData, void, TBody> {
  SimpleCustomMutationEndpoint({
    required Future<TData> Function(TBody body, QueryClient client, GetIt deps)
    mutator,
    super.invalidatesTags,
    super.onSuccess,
    super.onError,
  }) : super(mutator: (_, body, client, deps) => mutator(body, client, deps));
}
