import '../../../../core/network/api_response.dart';
import '../../domain/entities/setting_entity.dart';
import '../../domain/repositories/settings_repository.dart';
import '../data_sources/settings_remote_data_source.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource _remoteDataSource;

  SettingsRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<SettingEntity>> getSettings({String? lang}) async {
    return await _remoteDataSource.getSettings(lang: lang);
  }
}
