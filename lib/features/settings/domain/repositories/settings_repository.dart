import '../../../../core/network/api_response.dart';
import '../entities/setting_entity.dart';

abstract class SettingsRepository {
  Future<ApiResponse<SettingEntity>> getSettings({String? lang});
}
