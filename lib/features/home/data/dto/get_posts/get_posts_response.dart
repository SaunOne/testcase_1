/// Response DTO untuk GET /posts endpoint
class GetPostsResponse {
  const GetPostsResponse({
    required this.postId,
    required this.postTitle,
    required this.postBody,
    required this.authorName,
    required this.categoryId,
    required this.createdAt,
  });

  factory GetPostsResponse.fromJson(Map<String, dynamic> json) {
    return GetPostsResponse(
      postId: json['post_id'] as int,
      postTitle: json['post_title'] as String,
      postBody: json['post_body'] as String,
      authorName: json['author_name'] as String,
      categoryId: json['category_id'] as int,
      createdAt: json['created_at'] as String,
    );
  }

  final int postId;
  final String postTitle;
  final String postBody;
  final String authorName;
  final int categoryId;
  final String createdAt;

  /// Parse list of posts from JSON array
  static List<GetPostsResponse> fromJsonList(dynamic json) {
    return (json as List)
        .map((e) => GetPostsResponse.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
