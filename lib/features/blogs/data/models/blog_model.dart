import '../../domain/entities/blog_entity.dart';
import 'blog_image_model.dart';
import 'blog_seo_model.dart';

class BlogModel extends BlogEntity {
  const BlogModel({
    required super.id,
    required super.title,
    required super.content,
    required super.excerpt,
    super.imageCover,
    required super.categories,
    required super.tags,
    required super.tagsAr,
    super.seo,
    required super.createdBy,
    required super.createdAt,
    required super.updatedAt,
    required super.slug,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      excerpt: json['excerpt'] ?? '',
      imageCover: json['imageCover'] != null
          ? BlogImageModel.fromJson(json['imageCover'])
          : null,
      categories: json['categories'] != null
          ? List<String>.from(json['categories'])
          : [],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : [],
      tagsAr: json['tagsAr'] != null
          ? List<String>.from(json['tagsAr'])
          : [],
      seo: json['seo'] != null ? BlogSeoModel.fromJson(json['seo']) : null,
      createdBy: json['createdBy'] ?? '',
      createdAt: DateTime.parse(
          json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updatedAt'] ?? DateTime.now().toIso8601String()),
      slug: json['slug'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'content': content,
      'excerpt': excerpt,
      'imageCover': imageCover != null
          ? (imageCover as BlogImageModel).toJson()
          : null,
      'categories': categories,
      'tags': tags,
      'tagsAr': tagsAr,
      'seo': seo != null ? (seo as BlogSeoModel).toJson() : null,
      'createdBy': createdBy,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'slug': slug,
    };
  }
}
