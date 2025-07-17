import 'package:screpagram/features/messaging/data/datasources/remote/msg_fb_repo.dart';
import 'package:screpagram/features/messaging/domain/entities/message_entity.dart';
import 'package:screpagram/features/messaging/domain/repository/messaging_repository.dart';

class MessagingRepositoryImpl implements MessagingRepository {
  final MsgFbRepo msgFbRepo;

  MessagingRepositoryImpl({
    required this.msgFbRepo,
  });

  @override
  Future<void> createChat({required String uid1, required String uid2}) {
    return msgFbRepo.createChat(uid1: uid1, uid2: uid2);
  }

  @override
  Stream<List<MessageModel>> getMessages(String chatId) {
    return msgFbRepo.getMessages(chatId);
  }

  @override
  Future<void> sendMessage({
    required String chatId,
    required MessageModel message,
  }) {
    return msgFbRepo.sendMessage(chatId: chatId, message: message);
  }

  @override
  Stream<List<String>> getUserChatIds(String uid) {
    return msgFbRepo
        .getUserChats(uid)
        .map((snapshot) => snapshot.docs.map((doc) => doc.id).toList());
  }

  String generateChatId(String uid1, String uid2) {
    final sorted = [uid1, uid2]..sort();
    return sorted.join('_');
  }
}
