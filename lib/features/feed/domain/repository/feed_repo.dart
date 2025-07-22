import 'package:screpagram/features/feed/domain/model/action_model.dart';
import 'package:screpagram/features/feed/domain/model/post_model.dart';

abstract class FeedRepo {
  Future<void> addPost(PostModel post);
  Stream<List<PostModel>> getPostsStream();
  Future<List<ActionModel>> getActions();
  Future<void> acceptFriendRequest(String actorId, String actionId);
  Future<void> rejectFriendRequest(String actorId, String actionId);
}
