import 'blog_image_entity.dart';
import 'blog_seo_entity.dart';

class BlogEntity {
  final String id;
  final String title;
  final String content;
  final String excerpt;
  final BlogImageEntity? imageCover;
  final List<String> categories;
  final List<String> tags;
  final List<String> tagsAr;
  final BlogSeoEntity? seo;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String slug;

  const BlogEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.excerpt,
    this.imageCover,
    required this.categories,
    required this.tags,
    required this.tagsAr,
    this.seo,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
  });
}
