import '../../domain/entities/blog_image_entity.dart';

class BlogImageModel extends BlogImageEntity {
  const BlogImageModel({
    required super.url,
    required super.alt,
    super.altAr,
  });

  factory BlogImageModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return BlogImageModel(
        url: json.toString(),
        alt: '',
      );
    }
    return BlogImageModel(
      url: json['url'] ?? '',
      alt: json['alt'] ?? '',
      altAr: json['altAr'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'alt': alt,
      'altAr': altAr,
    };
  }
}
