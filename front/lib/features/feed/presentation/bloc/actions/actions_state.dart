// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'actions_bloc.dart';

sealed class ActionsState extends Equatable {
  const ActionsState();

  @override
  List<Object> get props => [];
}

class ActionsInitial extends ActionsState {}

class ActionsLoading extends ActionsState {}

class ActionsLoaded extends ActionsState {
  final List<ActionModel> actions;

  const ActionsLoaded(this.actions);

  @override
  List<Object> get props => [actions];

  ActionsLoaded copyWith({
    List<ActionModel>? actions,
  }) {
    return ActionsLoaded(
      actions ?? this.actions,
    );
  }
}

class ActionsFailure extends ActionsState {
  final String message;

  const ActionsFailure(this.message);

  @override
  List<Object> get props => [message];
}
