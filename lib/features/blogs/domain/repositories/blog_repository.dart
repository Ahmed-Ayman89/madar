import '../../../../core/network/api_response.dart';
import '../entities/blog_entity.dart';

abstract class BlogRepository {
  Future<ApiResponse<List<BlogEntity>>> getBlogs({String? lang});
  Future<ApiResponse<BlogEntity>> getBlogDetails(String id, {String? lang});
}
