import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/features/feed/domain/model/action_model.dart';
import 'package:screpagram/features/feed/domain/repository/feed_repo.dart';

part 'actions_event.dart';
part 'actions_state.dart';

class ActionsBloc extends Bloc<ActionsEvent, ActionsState> {
  final FeedRepo feedRepo;

  ActionsBloc({required this.feedRepo}) : super(ActionsInitial()) {
    on<LoadActionsEvent>(_onLoadActions);
    on<AcceptFriendRequestEvent>(_onAcceptFriend);
    on<RejectFriendRequestEvent>(_onRejectFriend);
  }

  Future<void> _onLoadActions(
      LoadActionsEvent event, Emitter<ActionsState> emit) async {
    emit(ActionsLoading());
    try {
      final actions = await feedRepo.getActions();
      emit(ActionsLoaded(actions));
    } catch (e) {
      emit(ActionsFailure(e.toString()));
    }
  }

  Future<void> _onAcceptFriend(
      AcceptFriendRequestEvent event, Emitter<ActionsState> emit) async {
    try {
      await feedRepo.acceptFriendRequest(
          event.action.actorId!, event.action.id);

      if (state is ActionsLoaded) {
        final updatedActions = (state as ActionsLoaded)
            .actions
            .where((a) => a.id != event.action.id)
            .toList();
        emit((state as ActionsLoaded).copyWith(actions: updatedActions));
      }
    } catch (e) {
      emit(ActionsFailure(e.toString()));
    }
  }

  Future<void> _onRejectFriend(
      RejectFriendRequestEvent event, Emitter<ActionsState> emit) async {
    try {
      await feedRepo.rejectFriendRequest(
          event.action.actorId!, event.action.id);

      if (state is ActionsLoaded) {
        final updatedActions = (state as ActionsLoaded)
            .actions
            .where((a) => a.id != event.action.id)
            .toList();
        emit((state as ActionsLoaded).copyWith(actions: updatedActions));
      }
    } catch (e) {
      emit(ActionsFailure(e.toString()));
    }
  }
}
