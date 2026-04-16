import '../../domain/entities/job_entity.dart';

abstract class JobState {}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobsLoaded extends JobState {
  final List<JobEntity> jobs;
  JobsLoaded(this.jobs);
}

class JobDetailLoaded extends JobState {
  final JobEntity job;
  JobDetailLoaded(this.job);
}

class JobError extends JobState {
  final String message;
  JobError(this.message);
}
