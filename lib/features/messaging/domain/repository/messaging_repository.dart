import 'package:screpagram/features/messaging/domain/entities/chat_entity.dart';
import 'package:screpagram/features/messaging/domain/entities/message_entity.dart';

abstract class MessagingRepo {
  Stream<List<ChatEntity>> getUserChatIds();

  Stream<List<MessageModel>> getChatMessages(String chatId);

  String getChatId(String uid1, String uid2);

  Future<void> sendMessage({
    required String chatId,
    required MessageModel message,
  });

  Future<void> createChat({
    required String uid1,
    required String uid2,
  });
}
