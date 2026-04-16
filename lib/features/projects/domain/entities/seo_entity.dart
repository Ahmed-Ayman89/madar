class SeoEntity {
  final String? metaTitle;
  final String? metaDescription;
  final List<String>? keywords;
  final double? priority;
  final String? changeFrequency;
  final String? noIndex;
  final String? noFollow;
  final String? noArchive;
  final String? noSnippet;

  const SeoEntity({
    this.metaTitle,
    this.metaDescription,
    this.keywords,
    this.priority,
    this.changeFrequency,
    this.noIndex,
    this.noFollow,
    this.noArchive,
    this.noSnippet,
  });
}
