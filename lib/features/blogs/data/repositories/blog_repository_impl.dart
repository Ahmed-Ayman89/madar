import '../../../../core/network/api_response.dart';
import '../../domain/repositories/blog_repository.dart';
import '../data_sources/blog_remote_data_source.dart';
import '../models/blog_model.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource _remoteDataSource;

  BlogRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<List<BlogModel>>> getBlogs({String? lang}) async {
    return await _remoteDataSource.getBlogs(lang: lang);
  }

  @override
  Future<ApiResponse<BlogModel>> getBlogDetails(String id, {String? lang}) async {
    return await _remoteDataSource.getBlogDetails(id, lang: lang);
  }
}
