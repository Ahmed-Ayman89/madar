import '../../domain/entities/blog_image_entity.dart';

class BlogImageModel extends BlogImageEntity {
  const BlogImageModel({
    required super.url,
    required super.alt,
  });

  factory BlogImageModel.fromJson(Map<String, dynamic> json) {
    return BlogImageModel(
      url: json['url'] ?? '',
      alt: json['alt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'alt': alt,
    };
  }
}
