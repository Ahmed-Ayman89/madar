import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/job_apply_request_entity.dart';
import '../../domain/repositories/job_repository.dart';
import 'job_apply_state.dart';

class JobApplyCubit extends Cubit<JobApplyState> {
  final JobRepository _repository;

  JobApplyCubit(this._repository) : super(JobApplyInitial());

  Future<void> applyForJob(JobApplyRequestEntity request) async {
    emit(JobApplyLoading());

    final response = await _repository.applyForJob(request);

    if (response.isSuccess) {
      emit(JobApplySuccess());
    } else {
      emit(JobApplyError(response.message ?? 'Failed to submit application'));
    }
  }
}
