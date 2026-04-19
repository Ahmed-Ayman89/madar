import 'package:madar/core/network/api_endpoint.dart';
import 'package:madar/core/network/api_helper.dart';
import 'package:madar/core/network/api_response.dart';
import '../models/team_member_model.dart';

class TeamRemoteDataSource {
  final APIHelper _apiHelper;

  TeamRemoteDataSource(this._apiHelper);

  Future<ApiResponse<List<TeamMemberModel>>> getTeamMembers({String lang = 'en'}) async {
    return _apiHelper.getRequest<List<TeamMemberModel>>(
      endPoint: EndPoints.teams,
      queryParameters: {'lang': lang},
      isProtected: false,
      parser: (json) {
        if (json is Map && json['data'] is List) {
          return (json['data'] as List)
              .map((e) => TeamMemberModel.fromJson(e))
              .toList();
        }
        return [];
      },
    );
  }
}
