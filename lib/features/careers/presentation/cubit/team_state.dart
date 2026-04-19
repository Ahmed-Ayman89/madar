import 'package:equatable/equatable.dart';
import '../../domain/entities/team_member_entity.dart';

abstract class TeamState extends Equatable {
  const TeamState();

  @override
  List<Object?> get props => [];
}

class TeamInitial extends TeamState {}

class TeamLoading extends TeamState {}

class TeamSuccess extends TeamState {
  final List<TeamMemberEntity> members;
  const TeamSuccess(this.members);

  @override
  List<Object?> get props => [members];
}

class TeamError extends TeamState {
  final String message;
  const TeamError(this.message);

  @override
  List<Object?> get props => [message];
}
