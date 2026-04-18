import '../../../../core/network/api_endpoint.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../models/setting_model.dart';

class SettingsRemoteDataSource {
  final APIHelper _apiHelper;

  SettingsRemoteDataSource(this._apiHelper);

  Future<ApiResponse<SettingModel>> getSettings({String? lang}) async {
    return await _apiHelper.getRequest<SettingModel>(
      endPoint: EndPoints.settings,
      queryParameters: lang != null ? {'lang': lang} : null,
      isProtected: false,
      parser: (json) => SettingModel.fromJson(json['data']),
    );
  }
}
