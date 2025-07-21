import 'package:screpagram/features/auth/domain/entities/person_entity.dart';

abstract class ExploreRepo {
  Future<List<PersonEntity>> getAllUsers();
  Future<PersonEntity> getUserById(String userId);
  Future<void> addFriendRequest(String userId);
}
