import 'package:equatable/equatable.dart';

enum PostCategory { technology, lifestyle, business, other }

class Post extends Equatable {
  const Post({
    required this.id,
    required this.title,
    required this.body,
    required this.author,
    required this.category,
    required this.createdAt,
  });

  final int id;
  final String title;
  final String body;
  final String author;
  final PostCategory category;
  final DateTime createdAt;

  String get excerpt =>
      body.length > 100 ? '${body.substring(0, 100)}...' : body;
  bool get isRecent => DateTime.now().difference(createdAt).inDays < 7;

  @override
  List<Object?> get props => [id, title, body, author, category, createdAt];
}
