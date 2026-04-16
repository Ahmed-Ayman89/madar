import '../entities/service_entity.dart';
import 'package:madar/core/network/api_response.dart';

abstract class ServicesRepository {
  Future<ApiResponse<List<ServiceEntity>>> getServices({String? lang});
}
