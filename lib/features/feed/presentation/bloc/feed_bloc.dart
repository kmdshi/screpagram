import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/features/feed/domain/model/post_model.dart';
import 'package:screpagram/features/feed/domain/repository/feed_repo.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepo feedRepo;
  StreamSubscription<List<PostModel>>? _subscription;

  FeedBloc({required this.feedRepo}) : super(FeedInitial()) {
    on<LoadFeedEvent>(_onLoadFeed);
    on<FeedUpdated>(_onFeedUpdated);
    on<AddPostEvent>(_onAddPost);
  }

  void _onLoadFeed(LoadFeedEvent event, Emitter<FeedState> emit) async {
    emit(FeedLoading());

    _subscription?.cancel();

    final initialPosts = await feedRepo.getPostsStream().first;
    emit(FeedLoaded(posts: initialPosts));

    _subscription = feedRepo.getPostsStream().listen((posts) {
      add(FeedUpdated(posts: posts));
    });
  }

  void _onFeedUpdated(FeedUpdated event, Emitter<FeedState> emit) {
    emit(FeedLoaded(posts: event.posts));
  }

  Future<void> _onAddPost(AddPostEvent event, Emitter<FeedState> emit) async {
    try {
      await feedRepo.addPost(event.post);
    } catch (e) {
      emit(FeedFailure(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
