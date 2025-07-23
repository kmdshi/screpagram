import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/features/feed/domain/model/action_model.dart';
import 'package:screpagram/features/feed/domain/model/post_model.dart';
import 'package:screpagram/features/feed/domain/repository/feed_repo.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepo feedRepo;

  FeedBloc({required this.feedRepo}) : super(FeedInitial()) {
    on<LoadFeedEvent>(_onLoadFeed);
    on<AddPostEvent>(_onAddPost);
  }

  void _onLoadFeed(LoadFeedEvent event, Emitter<FeedState> emit) async {
    emit(FeedLoading());

    await emit.forEach<List<PostModel>>(
      feedRepo.getPostsStream(),
      onData: (posts) => FeedLoaded(posts: posts),
      onError: (error, _) => FeedFailure(message: error.toString()),
    );
  }

  Future<void> _onAddPost(AddPostEvent event, Emitter<FeedState> emit) async {
    try {
      await feedRepo.addPost(event.post);
    } catch (e) {
      emit(FeedFailure(message: e.toString()));
    }
  }
}
