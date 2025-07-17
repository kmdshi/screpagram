import 'package:screpagram/features/feed/domain/model/post_model.dart';

abstract class FeedRepo {
  Future<void> addPost(PostModel post);
  Stream<List<PostModel>> getPostsStream();
}
