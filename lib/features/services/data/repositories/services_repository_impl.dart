import 'package:madar/core/network/api_response.dart';
import '../../domain/entities/service_entity.dart';
import '../../domain/repositories/services_repository.dart';
import '../data_sources/services_remote_data_source.dart';

class ServicesRepositoryImpl implements ServicesRepository {
  final ServicesRemoteDataSource _remoteDataSource;

  ServicesRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<List<ServiceEntity>>> getServices({String? lang}) async {
    final response = await _remoteDataSource.getServices(lang: lang);
    
    if (response.isSuccess) {
      return ApiResponse.success(
        response.data!.map((e) => e.toEntity()).toList(),
        statusCode: response.statusCode,
        message: response.message,
      );
    } else {
      return ApiResponse.error(
        statusCode: response.statusCode,
        message: response.message,
        error: response.error,
      );
    }
  }
}
