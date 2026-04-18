import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/project_repository.dart';
import 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final ProjectRepository _projectRepository;

  ProjectCubit(this._projectRepository) : super(ProjectInitial());

  Future<void> getProjects({String? lang}) async {
    try {
      emit(ProjectLoading());
      final response = await _projectRepository.getProjects(lang: lang);

      if (!isClosed) {
        if (response.isSuccess) {
          emit(ProjectLoaded(response.data!));
        } else {
          emit(ProjectError(response.message ?? 'Failed to load projects'));
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(ProjectError('Unexpected error: ${e.toString()}'));
      }
    }
  }
}
