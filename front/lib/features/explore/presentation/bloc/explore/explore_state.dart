part of 'explore_bloc.dart';

sealed class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

final class ExploreInitial extends ExploreState {}

final class ExploreLoading extends ExploreState {}

final class ExploreUsersLoaded extends ExploreState {
  final List<PersonEntity> users;

  const ExploreUsersLoaded(this.users);

  @override
  List<Object> get props => [users];
}

final class ExplorePostsLoaded extends ExploreState {
  final List<PostModel> posts;

  const ExplorePostsLoaded(this.posts);

  @override
  List<Object> get props => [posts];
}



final class ExploreUserLoaded extends ExploreState {
  final PersonEntity user;

  const ExploreUserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

final class ExploreError extends ExploreState {
  final String message;

  const ExploreError(this.message);

  @override
  List<Object> get props => [message];
}

final class ExploreSuccess extends ExploreState {
  final String message;

  const ExploreSuccess(this.message);

  @override
  List<Object> get props => [message];
}