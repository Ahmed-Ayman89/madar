import '../../../../core/network/api_response.dart';
import '../entities/project_entity.dart';

abstract class ProjectRepository {
  Future<ApiResponse<List<ProjectEntity>>> getProjects({String? lang});
  Future<ApiResponse<ProjectEntity>> getProjectDetails(String id, {String? lang});
}
