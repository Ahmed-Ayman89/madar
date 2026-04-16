class JobEntity {
  final String id;
  final String title;
  final String description;
  final String requirements;
  final String responsibilities;
  final String location;
  final String type;
  final String salaryRange;
  final bool active;
  final DateTime createdAt;
  final String slug;

  JobEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.requirements,
    required this.responsibilities,
    required this.location,
    required this.type,
    required this.salaryRange,
    required this.active,
    required this.createdAt,
    required this.slug,
  });
}
