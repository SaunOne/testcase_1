import 'package:testcase_1/features/home/data/dto/get_posts/get_posts_response.dart';
import 'package:testcase_1/features/home/data/entities/post.dart';

class PostMapper {
  static Post fromGetPostsResponse(GetPostsResponse response) {
    return Post(
      id: response.postId,
      title: response.postTitle,
      body: response.postBody,
      author: response.authorName,
      category: _mapCategory(response.categoryId),
      createdAt: DateTime.parse(response.createdAt),
    );
  }

  static List<Post> fromGetPostsResponseList(List<GetPostsResponse> responses) {
    return responses.map(fromGetPostsResponse).toList();
  }

  static PostCategory _mapCategory(int categoryId) {
    switch (categoryId) {
      case 1:
        return PostCategory.technology;
      case 2:
        return PostCategory.lifestyle;
      case 3:
        return PostCategory.business;
      default:
        return PostCategory.other;
    }
  }
}
