import '../../domain/entities/job_entity.dart';

class JobModel extends JobEntity {
  JobModel({
    required super.id,
    required super.title,
    required super.description,
    required super.requirements,
    required super.responsibilities,
    required super.location,
    required super.type,
    required super.salaryRange,
    required super.active,
    required super.createdAt,
    required super.slug,
  });

  factory JobModel.fromJson(Map<String, dynamic> json, {String lang = 'en'}) {
    // Choose localized fields based on lang
    final String requirements = lang == 'ar' 
        ? (json['requirementsAr'] ?? json['requirements'] ?? '') 
        : (json['requirements'] ?? '');
    
    final String responsibilities = lang == 'ar'
        ? (json['responsibilitiesAr'] ?? json['responsibilities'] ?? '')
        : (json['responsibilities'] ?? '');

    final String location = lang == 'ar'
        ? (json['locationAr'] ?? json['location'] ?? '')
        : (json['location'] ?? '');

    return JobModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      requirements: requirements,
      responsibilities: responsibilities,
      location: location,
      type: json['type'] ?? '',
      salaryRange: json['salaryRange'] ?? '',
      active: json['active'] ?? false,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      slug: json['slug'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'requirements': requirements,
      'responsibilities': responsibilities,
      'location': location,
      'type': type,
      'salaryRange': salaryRange,
      'active': active,
      'createdAt': createdAt.toIso8601String(),
      'slug': slug,
    };
  }
}
