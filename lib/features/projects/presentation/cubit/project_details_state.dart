import '../../domain/entities/project_entity.dart';

abstract class ProjectDetailsState {}

class ProjectDetailsInitial extends ProjectDetailsState {}

class ProjectDetailsLoading extends ProjectDetailsState {}

class ProjectDetailsLoaded extends ProjectDetailsState {
  final ProjectEntity project;
  ProjectDetailsLoaded(this.project);
}

class ProjectDetailsError extends ProjectDetailsState {
  final String message;
  ProjectDetailsError(this.message);
}
