part of 'actions_bloc.dart';

sealed class ActionsEvent extends Equatable {
  const ActionsEvent();

  @override
  List<Object> get props => [];
}

class LoadActionsEvent extends ActionsEvent {}

class AcceptFriendRequestEvent extends ActionsEvent {
  final ActionModel action;

  const AcceptFriendRequestEvent(this.action);

  @override
  List<Object> get props => [action];
}


class RejectFriendRequestEvent extends ActionsEvent {
  final ActionModel action;

  const RejectFriendRequestEvent(this.action);

  @override
  List<Object> get props => [action];
}
