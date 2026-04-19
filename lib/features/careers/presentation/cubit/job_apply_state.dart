import 'package:equatable/equatable.dart';

abstract class JobApplyState extends Equatable {
  const JobApplyState();

  @override
  List<Object?> get props => [];
}

class JobApplyInitial extends JobApplyState {}

class JobApplyLoading extends JobApplyState {}

class JobApplySuccess extends JobApplyState {}

class JobApplyError extends JobApplyState {
  final String message;

  const JobApplyError(this.message);

  @override
  List<Object?> get props => [message];
}
