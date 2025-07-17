// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:screpagram/features/messaging/domain/entities/message_entity.dart';

class MsgFbRepo {
  final FirebaseFirestore firebaseFirestore;
  MsgFbRepo({
    required this.firebaseFirestore,
  });

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserChats(String uid) {
    return firebaseFirestore
        .collection('chats')
        .where('participants', arrayContains: uid)
        .snapshots();
  }

  Stream<List<MessageModel>> getMessages(String chatId) {
    return firebaseFirestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => MessageModel.fromMap(doc.data(), id: doc.id))
            .toList());
  }

  Future<void> sendMessage({
    required String chatId,
    required MessageModel message,
  }) async {
    await firebaseFirestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toMap());
  }

  Future<void> createChat({
    required String uid1,
    required String uid2,
  }) async {
    final chatId = _generateChatId(uid1, uid2);

    final chatDoc = firebaseFirestore.collection('chats').doc(chatId);
    final docSnapshot = await chatDoc.get();

    if (!docSnapshot.exists) {
      await chatDoc.set({
        'participants': [uid1, uid2],
        'createdAt': Timestamp.now(),
      });
    }
  }

  String _generateChatId(String uid1, String uid2) {
    final sorted = [uid1, uid2]..sort();
    return sorted.join('_');
  }
}
