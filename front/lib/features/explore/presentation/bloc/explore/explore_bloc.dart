import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/core/domain/models/person_entity.dart';
import 'package:screpagram/features/explore/domain/explore_repo.dart';
import 'package:screpagram/features/feed/domain/model/post_model.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final ExploreRepo exploreRepo;

  ExploreBloc(this.exploreRepo) : super(ExploreInitial()) {
    on<LoadExploreUsersEvent>(_onLoadExploreUsers);
    on<LoadExploreUserByIdEvent>(_onLoadExploreUserById);
    on<AddUserFreindRequest>(_onAddUserFriendRequest);
    on<LoadPostsEvent>(_onLoadPosts);
  }

  Future<void> _onLoadPosts(
      LoadPostsEvent event, Emitter<ExploreState> emit) async {
    emit(ExploreLoading());

    await emit.forEach<List<PostModel>>(
      exploreRepo.getPostsStream(),
      onData: (posts) => ExplorePostsLoaded(posts),
      onError: (error, _) => ExploreError(error.toString()),
    );
  }

  Future<void> _onLoadExploreUsers(
    LoadExploreUsersEvent event,
    Emitter<ExploreState> emit,
  ) async {
    emit(ExploreLoading());
    try {
      final users = await exploreRepo.getAllUsers();
      emit(ExploreUsersLoaded(users));
    } catch (e) {
      emit(ExploreError('Failed to load users: ${e.toString()}'));
    }
  }

  Future<void> _onAddUserFriendRequest(
    AddUserFreindRequest event,
    Emitter<ExploreState> emit,
  ) async {
    try {
      await exploreRepo.addFriendRequest(event.userId);

      emit(ExploreSuccess('Заявка отправлена'));
    } on Exception catch (e) {
      emit(ExploreError(e.toString()));
    } catch (e) {
      emit(ExploreError(
          'Не удалось отправить заявку в друзья: ${e.toString()}'));
      final user = await exploreRepo.getUserById(event.userId);
      emit(ExploreUserLoaded(user));
    }
  }

  Future<void> _onLoadExploreUserById(
    LoadExploreUserByIdEvent event,
    Emitter<ExploreState> emit,
  ) async {
    emit(ExploreLoading());
    try {
      final user = await exploreRepo.getUserById(event.userId);
      emit(ExploreUserLoaded(user));
    } catch (e) {
      emit(ExploreError('Failed to load user: ${e.toString()}'));
    }
  }
}
