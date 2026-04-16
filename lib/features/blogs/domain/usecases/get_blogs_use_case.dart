import '../../../../core/network/api_response.dart';
import '../entities/blog_entity.dart';
import '../repositories/blog_repository.dart';

class GetBlogsUseCase {
  final BlogRepository _repository;

  GetBlogsUseCase(this._repository);

  Future<ApiResponse<List<BlogEntity>>> call({String? lang}) async {
    return await _repository.getBlogs(lang: lang);
  }
}
