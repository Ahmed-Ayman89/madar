import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/team_repository_impl.dart';
import 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  final TeamRepository _repository;

  TeamCubit(this._repository) : super(TeamInitial());

  Future<void> getTeamMembers({String lang = 'en'}) async {
    emit(TeamLoading());

    final response = await _repository.getTeamMembers(lang: lang);

    if (response.isSuccess) {
      emit(TeamSuccess(response.data ?? []));
    } else {
      emit(TeamError(response.message ?? 'Failed to fetch team members'));
    }
  }
}
