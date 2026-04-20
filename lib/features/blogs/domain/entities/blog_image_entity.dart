class BlogImageEntity {
  final String url;
  final String alt;
  final String? altAr;

  const BlogImageEntity({
    required this.url,
    required this.alt,
    this.altAr,
  });
}
