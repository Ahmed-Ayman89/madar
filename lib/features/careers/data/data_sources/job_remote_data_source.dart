import 'package:madar/core/network/api_helper.dart';
import 'package:madar/core/network/api_endpoint.dart';
import 'package:madar/core/network/api_response.dart';
import '../models/job_model.dart';

class JobRemoteDataSource {
  final APIHelper _apiHelper;

  JobRemoteDataSource(this._apiHelper);

  Future<ApiResponse<List<JobModel>>> getJobs({String? lang}) async {
    return await _apiHelper.getRequest<List<JobModel>>(
      endPoint: EndPoints.jobs,
      queryParameters: lang != null ? {'lang': lang} : null,
      isProtected: false,
      parser: (json) => (json['data'] as List)
          .map((e) => JobModel.fromJson(e, lang: lang ?? 'en'))
          .toList(),
    );
  }

  Future<ApiResponse<JobModel>> getJobDetails(String id, {String? lang}) async {
    return await _apiHelper.getRequest<JobModel>(
      endPoint: EndPoints.jobs,
      resourcePath: id,
      queryParameters: lang != null ? {'lang': lang} : null,
      isProtected: false,
      parser: (json) => JobModel.fromJson(json['data'], lang: lang ?? 'en'),
    );
  }
}
