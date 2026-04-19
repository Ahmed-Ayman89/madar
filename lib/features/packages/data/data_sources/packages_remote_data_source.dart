import 'package:madar/core/network/api_endpoint.dart';
import 'package:madar/core/network/api_helper.dart';
import 'package:madar/core/network/api_response.dart';
import '../models/package_model.dart';

class PackagesRemoteDataSource {
  final APIHelper _apiHelper;

  PackagesRemoteDataSource(this._apiHelper);

  Future<ApiResponse<List<PackageModel>>> getPackages({String? lang}) async {
    return _apiHelper.getRequest<List<PackageModel>>(
      endPoint: EndPoints.packages,
      isProtected: false,
      queryParameters: {if (lang != null) 'lang': lang},
      parser: (json) {
        final dynamic data = json['data'];
        if (data is List) {
          return data.map((item) => PackageModel.fromJson(item)).toList();
        }
        return [];
      },
    );
  }
}
