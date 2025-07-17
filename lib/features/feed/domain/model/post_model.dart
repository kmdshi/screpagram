// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String content;
  final String authorId;
  final DateTime timestamp;

  PostModel({
    required this.id,
    required this.content,
    required this.authorId,
    required this.timestamp,
  });

  factory PostModel.fromMap(Map<String, dynamic> map, String documentId) {
    return PostModel(
      id: documentId,
      content: map['content'] ?? '',
      authorId: map['authorId'] ?? '',
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'authorId': authorId,
      'timestamp': timestamp,
    };
  }

  PostModel copyWith({
    String? id,
    String? content,
    String? authorId,
    DateTime? timestamp,
  }) {
    return PostModel(
      id: id ?? this.id,
      content: content ?? this.content,
      authorId: authorId ?? this.authorId,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
