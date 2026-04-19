import 'package:madar/core/network/api_response.dart';
import '../../domain/entities/team_member_entity.dart';
import '../data_sources/team_remote_data_source.dart';

abstract class TeamRepository {
  Future<ApiResponse<List<TeamMemberEntity>>> getTeamMembers({String lang = 'en'});
}

class TeamRepositoryImpl implements TeamRepository {
  final TeamRemoteDataSource _remoteDataSource;

  TeamRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<List<TeamMemberEntity>>> getTeamMembers({String lang = 'en'}) async {
    return _remoteDataSource.getTeamMembers(lang: lang);
  }
}
