import 'package:testcase_1/features/home/data/dto/get_posts/get_posts_response.dart';

class PostLocalDatasource {
  Future<List<GetPostsResponse>> getPosts() async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    return _mockPosts;
  }

  Future<GetPostsResponse> getPostById(int id) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return _mockPosts.firstWhere((p) => p.postId == id);
  }

  static final List<GetPostsResponse> _mockPosts = [
    const GetPostsResponse(
      postId: 1,
      postTitle: 'Getting Started with Flutter',
      postBody:
          'Flutter is an open-source UI toolkit created by Google for building natively compiled applications for mobile, web, and desktop from a single codebase. It uses the Dart programming language and provides a rich set of pre-designed widgets.',
      authorName: 'John Doe',
      categoryId: 1,
      createdAt: '2024-01-15T10:30:00Z',
    ),
    const GetPostsResponse(
      postId: 2,
      postTitle: 'Clean Architecture in Flutter',
      postBody:
          'Clean Architecture is a software design philosophy that separates the elements of a design into ring levels. The main rule of clean architecture is that code dependencies can only move from the outer levels inward.',
      authorName: 'Jane Smith',
      categoryId: 1,
      createdAt: '2024-01-14T08:15:00Z',
    ),
    const GetPostsResponse(
      postId: 3,
      postTitle: 'Work-Life Balance Tips',
      postBody:
          'Maintaining a healthy work-life balance is essential for your mental and physical well-being. Here are some tips to help you achieve a better balance between your professional and personal life.',
      authorName: 'Emily Johnson',
      categoryId: 2,
      createdAt: '2024-01-13T14:45:00Z',
    ),
    const GetPostsResponse(
      postId: 4,
      postTitle: 'Startup Funding Strategies',
      postBody:
          'Securing funding for your startup can be challenging. This article explores various funding strategies including bootstrapping, angel investors, venture capital, and crowdfunding platforms.',
      authorName: 'Michael Brown',
      categoryId: 3,
      createdAt: '2024-01-12T09:00:00Z',
    ),
    const GetPostsResponse(
      postId: 5,
      postTitle: 'State Management with BLoC',
      postBody:
          'BLoC (Business Logic Component) is a design pattern that helps separate presentation from business logic. It makes your code more testable and reusable while keeping the UI clean and simple.',
      authorName: 'Sarah Wilson',
      categoryId: 1,
      createdAt: '2024-01-11T16:20:00Z',
    ),
  ];
}
