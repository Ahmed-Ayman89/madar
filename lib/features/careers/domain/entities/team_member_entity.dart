import 'package:equatable/equatable.dart';

class TeamMemberEntity extends Equatable {
  final String id;
  final String name;
  final String jobTitle;
  final String jobTitleAr;
  final String image;

  const TeamMemberEntity({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.jobTitleAr,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, jobTitle, jobTitleAr, image];
}
