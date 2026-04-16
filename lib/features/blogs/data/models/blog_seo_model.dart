import '../../domain/entities/blog_seo_entity.dart';

class BlogSeoModel extends BlogSeoEntity {
  const BlogSeoModel({
    super.metaTitle,
    super.metaDescription,
    super.keywords,
    super.priority,
    super.changeFrequency,
    super.noIndex,
    super.noFollow,
    super.noArchive,
    super.noSnippet,
    super.slugUrl,
    super.canonicalUrl,
  });

  factory BlogSeoModel.fromJson(Map<String, dynamic> json) {
    return BlogSeoModel(
      metaTitle: json['metaTitle'],
      metaDescription: json['metaDescription'],
      keywords: json['keywords'] != null ? List<String>.from(json['keywords']) : null,
      priority: (json['priority'] as num?)?.toDouble(),
      changeFrequency: json['changeFrequency'],
      noIndex: json['noIndex']?.toString(),
      noFollow: json['noFollow']?.toString(),
      noArchive: json['noArchive']?.toString(),
      noSnippet: json['noSnippet']?.toString(),
      slugUrl: json['slugUrl'],
      canonicalUrl: json['canonicalUrl'],
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
      'slugUrl': slugUrl,
      'canonicalUrl': canonicalUrl,
    };
  }
}
