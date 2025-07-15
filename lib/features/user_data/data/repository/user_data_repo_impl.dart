// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:screpagram/features/user_data/domain/entities/last_message_entity.dart';
import 'package:screpagram/features/user_data/domain/entities/self_entity.dart';
import 'package:screpagram/features/user_data/domain/entities/user_entity.dart';
import 'package:screpagram/features/user_data/domain/repository/user_data_repository.dart';

class UserDataRepoImpl implements UserDataRepository {
  UserDataRepoImpl();

  @override
  Future<String?> addNewCompanion(
      String AID, String newContact, String? localName) {
    // TODO: implement addNewCompanion
    throw UnimplementedError();
  }

  @override
  Future<void> changeDataUrlStatus(String AID, bool newStatus) {
    // TODO: implement changeDataUrlStatus
    throw UnimplementedError();
  }

  @override
  Future<Stream<List<UserEntity>?>> getContactsStream(String initiatorAID) {
    // TODO: implement getContactsStream
    throw UnimplementedError();
  }

  @override
  Future<Stream<LastMessageEntity?>> getLastMessageStream(
      String initiatorAID, String secondAID) {
    // TODO: implement getLastMessageStream
    throw UnimplementedError();
  }

  @override
  Future<SelfEntity> handleSelfEntity() {
    // TODO: implement handleSelfEntity
    throw UnimplementedError();
  }
}
