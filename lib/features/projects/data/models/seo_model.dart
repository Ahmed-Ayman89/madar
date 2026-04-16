import '../../domain/entities/seo_entity.dart';

class SeoModel extends SeoEntity {
  const SeoModel({
    super.metaTitle,
    super.metaDescription,
    super.keywords,
    super.priority,
    super.changeFrequency,
    super.noIndex,
    super.noFollow,
    super.noArchive,
    super.noSnippet,
  });

  factory SeoModel.fromJson(Map<String, dynamic> json) {
    return SeoModel(
      metaTitle: json['metaTitle'],
      metaDescription: json['metaDescription'],
      keywords: json['keywords'] != null ? List<String>.from(json['keywords']) : null,
      priority: (json['priority'] as num?)?.toDouble(),
      changeFrequency: json['changeFrequency'],
      noIndex: json['noIndex']?.toString(),
      noFollow: json['noFollow']?.toString(),
      noArchive: json['noArchive']?.toString(),
      noSnippet: json['noSnippet']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'metaTitle': metaTitle,
      'metaDescription': metaDescription,
      'keywords': keywords,
      'priority': priority,
      'changeFrequency': changeFrequency,
      'noIndex': noIndex,
      'noFollow': noFollow,
      'noArchive': noArchive,
      'noSnippet': noSnippet,
    };
  }
}
