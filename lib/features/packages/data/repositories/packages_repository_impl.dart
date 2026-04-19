import 'package:madar/core/network/api_response.dart';
import '../../domain/entities/package_entity.dart';
import '../../domain/repositories/packages_repository.dart';
import '../data_sources/packages_remote_data_source.dart';

class PackagesRepositoryImpl implements PackagesRepository {
  final PackagesRemoteDataSource _remoteDataSource;

  PackagesRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<List<PackageEntity>>> getPackages({String? lang}) async {
    final response = await _remoteDataSource.getPackages(lang: lang);

    if (response.isSuccess) {
      return ApiResponse.success(
        response.data!,
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
