import '../../../../core/network/api_endpoint.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../models/project_model.dart';

class ProjectRemoteDataSource {
  final APIHelper _apiHelper;

  ProjectRemoteDataSource(this._apiHelper);

  Future<ApiResponse<List<ProjectModel>>> getProjects({String? lang}) async {
    return await _apiHelper.getRequest<List<ProjectModel>>(
      endPoint: EndPoints.projects,
      queryParameters: lang != null ? {'lang': lang} : null,
      isProtected: false,
      parser: (json) => (json['data'] as List)
          .map((e) => ProjectModel.fromJson(e))
          .toList(),
    );
  }

  Future<ApiResponse<ProjectModel>> getProjectDetails(String id,
      {String? lang}) async {
    return await _apiHelper.getRequest<ProjectModel>(
      endPoint: '${EndPoints.projects}/$id',
      queryParameters: lang != null ? {'lang': lang} : null,
      isProtected: false,
      parser: (json) => ProjectModel.fromJson(json['data']),
    );
  }
}
