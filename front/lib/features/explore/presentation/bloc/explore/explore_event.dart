part of 'explore_bloc.dart';

sealed class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

final class LoadExploreUsersEvent extends ExploreEvent {}

final class LoadExploreUserByIdEvent extends ExploreEvent {
  final String userId;

  const LoadExploreUserByIdEvent(this.userId);

  @override
  List<Object> get props => [userId];
}

final class LoadPostsEvent extends ExploreEvent {}

final class AddUserFreindRequest extends ExploreEvent {
  final String userId;

  const AddUserFreindRequest(this.userId);
  
  @override
  List<Object> get props => [userId];
}
