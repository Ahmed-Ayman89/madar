import '../../domain/entities/team_member_entity.dart';

class TeamMemberModel extends TeamMemberEntity {
  const TeamMemberModel({
    required super.id,
    required super.name,
    required super.jobTitle,
    required super.jobTitleAr,
    required super.image,
  });

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      jobTitle: json['jobTitle'] ?? '',
      jobTitleAr: json['jobTitleAr'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
