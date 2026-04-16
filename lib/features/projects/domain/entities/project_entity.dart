import 'seo_entity.dart';

class ProjectEntity {
  final String id;
  final String title;
  final String description;
  final String shortDescription;
  final String imageUrl;
  final String? logoUrl;
  final String slug;
  final String? link;
  final String category;
  final List<String> technologies;
  final int order;
  final bool isFeatured;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SeoEntity? seo;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.shortDescription,
    required this.imageUrl,
    this.logoUrl,
    required this.slug,
    this.link,
    required this.category,
    required this.technologies,
    required this.order,
    required this.isFeatured,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.seo,
  });
}
