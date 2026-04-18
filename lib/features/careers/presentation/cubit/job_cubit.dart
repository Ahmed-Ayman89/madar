import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/job_repository.dart';
import 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  final JobRepository _jobRepository;

  JobCubit(this._jobRepository) : super(JobInitial());

  Future<void> getJobs({String? lang}) async {
    try {
      emit(JobLoading());
      final response = await _jobRepository.getJobs(lang: lang);

      if (!isClosed) {
        if (response.isSuccess) {
          emit(JobsLoaded(response.data!));
        } else {
          emit(JobError(response.message ?? 'Failed to load jobs'));
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(JobError('Unexpected error: ${e.toString()}'));
      }
    }
  }

  Future<void> getJobDetails(String id, {String? lang}) async {
    try {
      emit(JobLoading());
      final response = await _jobRepository.getJobDetails(id, lang: lang);

      if (!isClosed) {
        if (response.isSuccess) {
          emit(JobDetailLoaded(response.data!));
        } else {
          emit(JobError(response.message ?? 'Failed to load job details'));
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(JobError('Unexpected error: ${e.toString()}'));
      }
    }
  }
}
