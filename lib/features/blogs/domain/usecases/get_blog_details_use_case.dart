import '../../../../core/network/api_response.dart';
import '../entities/blog_entity.dart';
import '../repositories/blog_repository.dart';

class GetBlogDetailsUseCase {
  final BlogRepository _repository;

  GetBlogDetailsUseCase(this._repository);

  Future<ApiResponse<BlogEntity>> call(String id, {String? lang}) async {
    return await _repository.getBlogDetails(id, lang: lang);
  }
}
