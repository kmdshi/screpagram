// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:screpagram/features/feed/data/datasource/remote/feed_fb_repo.dart';
import 'package:screpagram/features/feed/domain/model/action_model.dart';
import 'package:screpagram/features/feed/domain/model/post_model.dart';
import 'package:screpagram/features/feed/domain/repository/feed_repo.dart';

class FeedRepoImpl implements FeedRepo {
  final FeedFbRepo feedFbRepo;
  FeedRepoImpl({
    required this.feedFbRepo,
  });
  @override
  Future<void> addPost(PostModel post) async {
    feedFbRepo.addPost(post);
  }

  @override
  Stream<List<PostModel>> getPostsStream() {
    return feedFbRepo.getPostsStream().map((snapshot) {
      return snapshot.docs
          .map((doc) => PostModel.fromMap(doc.data(), doc.id))
          .toList();
    });
  }

  @override
  Future<List<ActionModel>> getActions() async {
    return await feedFbRepo.getUserActions();
  }

  @override
  Future<void> acceptFriendRequest(String actorId, String actionId) async {
    await feedFbRepo.acceptFriendRequest(actorId, actionId);
  }

  @override
  Future<void> rejectFriendRequest(String actorId, String actionId) async {
    await feedFbRepo.rejectFriendRequest(actorId, actorId);
  }
}
