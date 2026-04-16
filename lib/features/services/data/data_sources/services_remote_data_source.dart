import 'package:flutter/material.dart';
import 'package:madar/core/network/api_endpoint.dart';
import 'package:madar/core/network/api_helper.dart';
import 'package:madar/core/network/api_response.dart';
import '../models/service_model.dart';

class ServicesRemoteDataSource {
  final APIHelper _apiHelper;

  ServicesRemoteDataSource(this._apiHelper);

  Future<ApiResponse<List<ServiceModel>>> getServices({String? lang}) async {
    return _apiHelper.getRequest<List<ServiceModel>>(
      endPoint: EndPoints.services,
      isProtected: false, // Public route
      queryParameters: {if (lang != null) 'lang': lang},
      parser: (json) {
        debugPrint('Services API Response keys: ${json.keys}');
        final dynamic data = json['data'];

        if (data is List) {
          debugPrint('Services found in "data": ${data.length}');
          return data.map((item) => ServiceModel.fromJson(item)).toList();
        } else if (data is Map) {
          if (data['services'] is List) {
            final servicesList = data['services'] as List;
            debugPrint(
              'Services found in "data.services": ${servicesList.length}',
            );
            return servicesList
                .map((item) => ServiceModel.fromJson(item))
                .toList();
          } else if (data['data'] is List) {
            final nestedData = data['data'] as List;
            debugPrint(
              'Services found in nested "data.data": ${nestedData.length}',
            );
            return nestedData
                .map((item) => ServiceModel.fromJson(item))
                .toList();
          }
        } else if (json['results'] is List) {
          final results = json['results'] as List;
          debugPrint('Services found in "results": ${results.length}');
          return results.map((item) => ServiceModel.fromJson(item)).toList();
        }

        debugPrint(
          'No services list found in response. "data" type: ${data.runtimeType}',
        );
        return [];
      },
    );
  }
}
