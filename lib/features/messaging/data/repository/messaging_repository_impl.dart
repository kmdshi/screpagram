import 'package:screpagram/features/messaging/data/datasources/remote/msg_fb_repo.dart';
import 'package:screpagram/features/messaging/domain/entities/chat_entity.dart';
import 'package:screpagram/features/messaging/domain/entities/message_entity.dart';
import 'package:screpagram/features/messaging/domain/repository/messaging_repository.dart';

class MessagingRepositoryImpl implements MessagingRepo {
  final MsgFbRepo msgFbRepo;

  MessagingRepositoryImpl({
    required this.msgFbRepo,
  });

  @override
  Future<void> createChat({required String uid1, required String uid2}) {
    return msgFbRepo.createChat(uid1: uid1, uid2: uid2);
  }

  @override
  Stream<List<MessageModel>> getChatMessages(String chatId) {
    return msgFbRepo.getChatMessages(chatId);
  }

  @override
  Future<void> sendMessage({
    required String chatId,
    required MessageModel message,
  }) {
    return msgFbRepo.sendMessage(chatId: chatId, message: message);
  }

  @override
  Stream<List<ChatEntity>> getUserChatIds() {
    return msgFbRepo.getUserChats().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => ChatEntity.fromMap(doc.data(), doc.id),
              )
              .toList(),
        );
  }

  @override
  String getChatId(String uid1, String uid2) {
    return msgFbRepo.generateChatId(uid1, uid2);
  }
}
