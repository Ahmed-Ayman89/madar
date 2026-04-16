import 'package:madar/core/network/api_response.dart';
import '../../domain/entities/job_entity.dart';
import '../../domain/repositories/job_repository.dart';
import '../data_sources/job_remote_data_source.dart';

class JobRepositoryImpl implements JobRepository {
  final JobRemoteDataSource _jobRemoteDataSource;

  JobRepositoryImpl(this._jobRemoteDataSource);

  @override
  Future<ApiResponse<List<JobEntity>>> getJobs({String? lang}) async {
    return await _jobRemoteDataSource.getJobs(lang: lang);
  }

  @override
  Future<ApiResponse<JobEntity>> getJobDetails(String id, {String? lang}) async {
    return await _jobRemoteDataSource.getJobDetails(id, lang: lang);
  }
}
