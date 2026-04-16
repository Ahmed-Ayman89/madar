import '../../../../core/network/api_response.dart';
import '../../domain/repositories/project_repository.dart';
import '../data_sources/project_remote_data_source.dart';
import '../models/project_model.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource _remoteDataSource;

  ProjectRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<List<ProjectModel>>> getProjects({String? lang}) async {
    return await _remoteDataSource.getProjects(lang: lang);
  }

  @override
  Future<ApiResponse<ProjectModel>> getProjectDetails(String id,
      {String? lang}) async {
    return await _remoteDataSource.getProjectDetails(id, lang: lang);
  }
}
