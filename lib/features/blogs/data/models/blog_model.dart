import '../../domain/entities/blog_entity.dart';
import 'blog_image_model.dart';
import 'blog_seo_model.dart';

class BlogModel extends BlogEntity {
  const BlogModel({
    required super.id,
    required super.title,
    super.content,
    required super.excerpt,
    super.imageCover,
    super.categories,
    super.tags,
    super.tagsAr,
    super.seo,
    super.createdBy,
    super.createdAt,
    super.updatedAt,
    required super.slug,
    super.relatedBlogs,
    super.latestNews,
  });

  factory BlogModel.fromJson(dynamic json) {
    if (json is String) {
      return BlogModel(
        id: json,
        title: '',
        excerpt: '',
        slug: '',
      );
    }
    
    if (json is! Map<String, dynamic>) {
      return BlogModel(
        id: '',
        title: '',
        excerpt: '',
        slug: '',
      );
    }

    return BlogModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'],
      excerpt: json['excerpt'] ?? '',
      imageCover: json['imageCover'] != null
          ? (json['imageCover'] is Map<String, dynamic>
              ? BlogImageModel.fromJson(json['imageCover'])
              : BlogImageModel(url: json['imageCover'].toString(), alt: ''))
          : null,
      categories: json['categories'] != null
          ? List<String>.from(json['categories'])
          : null,
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      tagsAr: json['tagsAr'] != null
          ? List<String>.from(json['tagsAr'])
          : null,
      seo: json['seo'] != null && json['seo'] is Map<String, dynamic>
          ? BlogSeoModel.fromJson(json['seo'])
          : null,
      createdBy: json['createdBy'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      slug: json['slug'] ?? '',
      relatedBlogs: json['relatedBlogs'] != null && json['relatedBlogs'] is List
          ? (json['relatedBlogs'] as List)
              .map((e) => BlogModel.fromJson(e))
              .toList()
          : null,
      latestNews: json['latestNews'] != null && json['latestNews'] is List
          ? (json['latestNews'] as List)
              .map((e) => BlogModel.fromJson(e))
              .toList()
          : null,
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
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'slug': slug,
      'relatedBlogs': relatedBlogs != null
          ? relatedBlogs!.map((e) => (e as BlogModel).toJson()).toList()
          : null,
      'latestNews': latestNews != null
          ? latestNews!.map((e) => (e as BlogModel).toJson()).toList()
          : null,
    };
  }
}
