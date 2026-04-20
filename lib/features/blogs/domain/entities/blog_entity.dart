import 'blog_image_entity.dart';
import 'blog_seo_entity.dart';

class BlogEntity {
  final String id;
  final String title;
  final String? content;
  final String excerpt;
  final BlogImageEntity? imageCover;
  final List<String>? categories;
  final List<String>? tags;
  final List<String>? tagsAr;
  final BlogSeoEntity? seo;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String slug;
  final List<BlogEntity>? relatedBlogs;
  final List<BlogEntity>? latestNews;

  const BlogEntity({
    required this.id,
    required this.title,
    this.content,
    required this.excerpt,
    this.imageCover,
    this.categories,
    this.tags,
    this.tagsAr,
    this.seo,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    required this.slug,
    this.relatedBlogs,
    this.latestNews,
  });
}
