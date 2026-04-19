import '../../domain/entities/job_apply_request_entity.dart';

class JobApplyRequestModel extends JobApplyRequestEntity {
  const JobApplyRequestModel({
    required super.jobId,
    required super.fullName,
    required super.email,
    required super.phone,
    super.personalLink,
    required super.experienceYears,
    required super.skills,
    required super.currentStatus,
    required super.currentLocation,
    required super.cv,
  });

  Map<String, dynamic> toJson() {
    return {
      'jobId': jobId,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'personalLink': personalLink,
      'experienceYears': experienceYears,
      'skills': skills,
      'currentStatus': currentStatus,
      'currentLocation': currentLocation,
      'cv': cv,
    };
  }

  factory JobApplyRequestModel.fromEntity(JobApplyRequestEntity entity) {
    return JobApplyRequestModel(
      jobId: entity.jobId,
      fullName: entity.fullName,
      email: entity.email,
      phone: entity.phone,
      personalLink: entity.personalLink,
      experienceYears: entity.experienceYears,
      skills: entity.skills,
      currentStatus: entity.currentStatus,
      currentLocation: entity.currentLocation,
      cv: entity.cv,
    );
  }
}
