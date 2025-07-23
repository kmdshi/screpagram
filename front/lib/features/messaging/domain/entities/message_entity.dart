// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String content;
  final String senderId;
  final DateTime timestamp;

  MessageModel({
    required this.content,
    required this.senderId,
    required this.timestamp,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map, {required String id}) {
    return MessageModel(
      content: map['content'] ?? '',
      senderId: map['senderId'] ?? '',
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'senderId': senderId,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}
