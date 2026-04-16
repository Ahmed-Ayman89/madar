import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/project_repository.dart';
import 'project_details_state.dart';

class ProjectDetailsCubit extends Cubit<ProjectDetailsState> {
  final ProjectRepository _projectRepository;

  ProjectDetailsCubit(this._projectRepository) : super(ProjectDetailsInitial());

  Future<void> getProjectDetails(String id, {String? lang}) async {
    try {
      emit(ProjectDetailsLoading());
      final response = await _projectRepository.getProjectDetails(id, lang: lang);

      if (response.isSuccess) {
        emit(ProjectDetailsLoaded(response.data!));
      } else {
        emit(ProjectDetailsError(response.message ?? 'Failed to load project details'));
      }
    } catch (e) {
      emit(ProjectDetailsError('Unexpected error: ${e.toString()}'));
    }
  }
}
