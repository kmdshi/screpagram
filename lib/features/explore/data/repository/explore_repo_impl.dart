// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:screpagram/features/auth/domain/entities/person_entity.dart';
import 'package:screpagram/features/explore/data/datasource/explore_fb_repo.dart';
import 'package:screpagram/features/explore/domain/explore_repo.dart';

class ExploreRepoImpl implements ExploreRepo {
  final ExploreFbRepo exploreFbRepo;
  ExploreRepoImpl({
    required this.exploreFbRepo,
  });

  @override
  Future<List<PersonEntity>> getAllUsers() async {
    return await exploreFbRepo.getAllUsers();
  }

  @override
  Future<PersonEntity> getUserById(String userId) async {
    return await exploreFbRepo.getUserById(userId);
  }

  @override
  Future<void> addFriendRequest(String userId) async {
    await exploreFbRepo.addUserToFriends(userId);
  }
}
