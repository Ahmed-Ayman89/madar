import 'package:madar/core/network/api_response.dart';
import '../entities/package_entity.dart';

abstract class PackagesRepository {
  Future<ApiResponse<List<PackageEntity>>> getPackages({String? lang});
}
