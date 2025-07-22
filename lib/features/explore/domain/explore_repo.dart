import 'package:screpagram/core/domain/models/person_entity.dart';
import 'package:screpagram/features/feed/domain/model/post_model.dart';

abstract class ExploreRepo {
  Future<List<PersonEntity>> getAllUsers();
  Future<PersonEntity> getUserById(String userId);
  Future<void> addFriendRequest(String userId);
  Stream<List<PostModel>> getPostsStream();
}
