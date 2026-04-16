import '../../domain/entities/project_entity.dart';
import 'seo_model.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required super.id,
    required super.title,
    required super.description,
    required super.shortDescription,
    required super.imageUrl,
    super.logoUrl,
    required super.slug,
    super.link,
    required super.category,
    required super.technologies,
    required super.order,
    required super.isFeatured,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
    super.seo,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['_id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      shortDescription: json['shortDescription'] ?? '',
      imageUrl: json['image'] != null ? json['image']['url'] : '',
      logoUrl: json['logo'] != null ? json['logo']['url'] : null,
      slug: json['slug'] ?? '',
      link: json['link'],
      category: json['category'] ?? '',
      technologies: json['technologies'] != null ? List<String>.from(json['technologies']) : [],
      order: json['order'] ?? 0,
      isFeatured: json['isFeatured'] ?? false,
      isActive: json['isActive'] ?? true,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
      seo: json['seo'] != null ? SeoModel.fromJson(json['seo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'shortDescription': shortDescription,
      'image': {'url': imageUrl},
      'logo': logoUrl != null ? {'url': logoUrl} : null,
      'slug': slug,
      'link': link,
      'category': category,
      'technologies': technologies,
      'order': order,
      'isFeatured': isFeatured,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'seo': seo != null ? (seo as SeoModel).toJson() : null,
    };
  }
}
