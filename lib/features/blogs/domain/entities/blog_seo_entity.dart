class BlogSeoEntity {
  final String? metaTitle;
  final String? metaDescription;
  final List<String>? keywords;
  final double? priority;
  final String? changeFrequency;
  final String? noIndex;
  final String? noFollow;
  final String? noArchive;
  final String? noSnippet;
  final String? slugUrl;
  final String? canonicalUrl;

  const BlogSeoEntity({
    this.metaTitle,
    this.metaDescription,
    this.keywords,
    this.priority,
    this.changeFrequency,
    this.noIndex,
    this.noFollow,
    this.noArchive,
    this.noSnippet,
    this.slugUrl,
    this.canonicalUrl,
  });
}
