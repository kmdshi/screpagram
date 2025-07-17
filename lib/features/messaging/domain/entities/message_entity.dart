// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String content;
  final String senderId;
  final int senderTwi;
  final DateTime timestamp;

  MessageModel({
    required this.id,
    required this.content,
    required this.senderId,
    required this.senderTwi,
    required this.timestamp,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map, {required String id}) {
    return MessageModel(
      id: id,
      content: map['content'] ?? '',
      senderId: map['senderId'] ?? '',
      senderTwi: map['senderTwi'] ?? 0,
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'senderId': senderId,
      'senderTwi': senderTwi,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}
