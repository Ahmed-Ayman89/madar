import 'package:madar/core/network/api_response.dart';
import '../entities/job_entity.dart';

abstract class JobRepository {
  Future<ApiResponse<List<JobEntity>>> getJobs({String? lang});
  Future<ApiResponse<JobEntity>> getJobDetails(String id, {String? lang});
}
