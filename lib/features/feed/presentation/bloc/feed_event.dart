// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'feed_bloc.dart';

sealed class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class LoadFeedEvent extends FeedEvent {}

class AddPostEvent extends FeedEvent {
  final PostModel post;
  const AddPostEvent({
    required this.post,
  });

  @override
  List<Object> get props => [post];
}

class FeedUpdated extends FeedEvent {
  final List<PostModel> posts;
  const FeedUpdated({required this.posts});

  @override
  List<Object> get props => [posts];
}
