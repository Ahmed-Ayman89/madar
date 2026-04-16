import '../../../../core/network/api_endpoint.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../models/blog_model.dart';

class BlogRemoteDataSource {
  final APIHelper _apiHelper;

  BlogRemoteDataSource(this._apiHelper);

  Future<ApiResponse<List<BlogModel>>> getBlogs({String? lang}) async {
    return await _apiHelper.getRequest<List<BlogModel>>(
      endPoint: EndPoints.blogs,
      queryParameters: lang != null ? {'lang': lang} : null,
      isProtected: false,
      parser: (json) => (json['data'] as List)
          .map((e) => BlogModel.fromJson(e))
          .toList(),
    );
  }

  Future<ApiResponse<BlogModel>> getBlogDetails(String id, {String? lang}) async {
    return await _apiHelper.getRequest<BlogModel>(
      endPoint: '${EndPoints.blogs}/$id',
      queryParameters: lang != null ? {'lang': lang} : null,
      isProtected: false,
      parser: (json) => BlogModel.fromJson(json['data']),
    );
  }
}
