import 'package:testcase_1/core/network/cache/cache_policy.dart';
import 'package:testcase_1/core/network/dto/api_response.dart';
import 'package:testcase_1/core/query/query.dart';
import 'package:testcase_1/features/home/data/dto/get_posts/get_posts_response.dart';
import 'package:testcase_1/features/home/data/entities/post.dart';
import 'package:testcase_1/features/home/data/mappers/post_mapper.dart';

/// Post endpoints using Query System
class PostEndpoints {
  PostEndpoints._();

  // ═══════════════════════════════════════════════════════════════════════════
  // Queries
  // ═══════════════════════════════════════════════════════════════════════════

  /// Get all posts
  static final getPosts = SimpleQueryEndpoint<List<Post>>(
    path: '/posts',
    fromJson: (json) {
      final response = ApiResponse<List<GetPostsResponse>>.fromJsonList(
        json as Map<String, dynamic>,
        (data) => GetPostsResponse.fromJsonList(data),
      );
      return PostMapper.fromGetPostsResponseList(response.data);
    },
    cachePolicy: const CachePolicy(ttlSeconds: 300, tags: ['posts']),
  );

  /// Get single post by ID
  static final getPost = QueryEndpoint<Post, String>(
    pathBuilder: (id) => '/posts/$id',
    fromJson: (json) {
      final response = ApiResponse<GetPostsResponse>.fromJson(
        json as Map<String, dynamic>,
        GetPostsResponse.fromJson,
      );
      return PostMapper.fromGetPostsResponse(response.data);
    },
    cachePolicy: const CachePolicy(
      ttlSeconds: 300,
      tags: ['posts', 'post-detail'],
    ),
  );

  /// Get posts by category
  static final getPostsByCategory = QueryEndpoint<List<Post>, PostCategory>(
    path: '/posts',
    queryParams: (category) => {
      'category_id': _categoryToId(category).toString(),
    },
    fromJson: (json) {
      final response = ApiResponse<List<GetPostsResponse>>.fromJsonList(
        json as Map<String, dynamic>,
        (data) => GetPostsResponse.fromJsonList(data),
      );
      return PostMapper.fromGetPostsResponseList(response.data);
    },
    cachePolicy: const CachePolicy(ttlSeconds: 300, tags: ['posts']),
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // Mutations
  // ═══════════════════════════════════════════════════════════════════════════

  /// Create new post
  static final createPost = MutationEndpoint<Post, void, Map<String, dynamic>>(
    path: '/posts',
    method: HttpMethod.post,
    fromJson: (json) {
      final response = ApiResponse<GetPostsResponse>.fromJson(
        json as Map<String, dynamic>,
        GetPostsResponse.fromJson,
      );
      return PostMapper.fromGetPostsResponse(response.data);
    },
    invalidatesTags: ['posts'],
  );

  /// Update post
  static final updatePost =
      MutationEndpoint<Post, String, Map<String, dynamic>>(
        pathBuilder: (id) => '/posts/$id',
        method: HttpMethod.put,
        fromJson: (json) {
          final response = ApiResponse<GetPostsResponse>.fromJson(
            json as Map<String, dynamic>,
            GetPostsResponse.fromJson,
          );
          return PostMapper.fromGetPostsResponse(response.data);
        },
        invalidatesTags: ['posts', 'post-detail'],
      );

  /// Delete post
  static final deletePost = MutationEndpoint<void, String, void>(
    pathBuilder: (id) => '/posts/$id',
    method: HttpMethod.delete,
    fromJson: (json) {
      // Delete response might just return success without data
      final response = json as Map<String, dynamic>;
      if (response['success'] == true) {
        return;
      }
      throw Exception('Delete failed');
    },
    invalidatesTags: ['posts'],
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // Helpers
  // ═══════════════════════════════════════════════════════════════════════════

  static int _categoryToId(PostCategory category) {
    switch (category) {
      case PostCategory.technology:
        return 1;
      case PostCategory.lifestyle:
        return 2;
      case PostCategory.business:
        return 3;
      case PostCategory.other:
        return 4;
    }
  }
}
