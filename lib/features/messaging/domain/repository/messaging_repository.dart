import 'package:screpagram/features/messaging/domain/entities/message_entity.dart';

abstract class MessagingRepository {
  Stream<List<String>> getUserChatIds(String uid);

  Stream<List<MessageModel>> getMessages(String chatId);

  Future<void> sendMessage({
    required String chatId,
    required MessageModel message,
  });

  Future<void> createChat({
    required String uid1,
    required String uid2,
  });
}
