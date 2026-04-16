import '../../domain/entities/blog_entity.dart';

abstract class BlogState {}

class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class BlogsLoaded extends BlogState {
  final List<BlogEntity> blogs;
  BlogsLoaded(this.blogs);
}

class BlogDetailLoaded extends BlogState {
  final BlogEntity blog;
  BlogDetailLoaded(this.blog);
}

class BlogError extends BlogState {
  final String message;
  BlogError(this.message);
}
