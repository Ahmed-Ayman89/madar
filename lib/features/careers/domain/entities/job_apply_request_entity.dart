import 'package:equatable/equatable.dart';

class JobApplyRequestEntity extends Equatable {
  final String jobId;
  final String fullName;
  final String email;
  final String phone;
  final String? personalLink;
  final String experienceYears;
  final List<String> skills;
  final String currentStatus;
  final String currentLocation;
  final String cv;

  const JobApplyRequestEntity({
    required this.jobId,
    required this.fullName,
    required this.email,
    required this.phone,
    this.personalLink,
    required this.experienceYears,
    required this.skills,
    required this.currentStatus,
    required this.currentLocation,
    required this.cv,
  });

  @override
  List<Object?> get props => [
        jobId,
        fullName,
        email,
        phone,
        personalLink,
        experienceYears,
        skills,
        currentStatus,
        currentLocation,
        cv,
      ];
}
