import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/blog_repository.dart';
import 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  final BlogRepository _blogRepository;

  BlogCubit(this._blogRepository) : super(BlogInitial());

  Future<void> getBlogs({String? lang}) async {
    try {
      emit(BlogLoading());
      final response = await _blogRepository.getBlogs(lang: lang);

      if (!isClosed) {
        if (response.isSuccess) {
          emit(BlogsLoaded(response.data!));
        } else {
          emit(BlogError(response.message ?? 'Failed to load blogs'));
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(BlogError('Unexpected error: ${e.toString()}'));
      }
    }
  }

  Future<void> getBlogDetails(String id, {String? lang}) async {
    try {
      emit(BlogLoading());
      final response = await _blogRepository.getBlogDetails(id, lang: lang);

      if (!isClosed) {
        if (response.isSuccess) {
          emit(BlogDetailLoaded(response.data!));
        } else {
          emit(BlogError(response.message ?? 'Failed to load blog details'));
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(BlogError('Unexpected error: ${e.toString()}'));
      }
    }
  }
}
