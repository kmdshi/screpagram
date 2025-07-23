import 'package:cloud_firestore/cloud_firestore.dart';

class ChatEntity {
  final String id;
  final List<String> participants;
  final String? lastMessage;
  final DateTime? lastUpdated;

  ChatEntity({
    required this.id,
    required this.participants,
    this.lastMessage,
    this.lastUpdated,
  });

  factory ChatEntity.fromMap(Map<String, dynamic> map, String docId) {
    final participants = List<String>.from(map['participants'] ?? {});
    return ChatEntity(
      id: docId,
      participants: participants,
      lastMessage: map['lastMessage'] as String?,
      lastUpdated: map['lastUpdated'] != null
          ? (map['lastUpdated'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'participants': participants,
      'lastMessage': lastMessage,
      'lastUpdated':
          lastUpdated != null ? Timestamp.fromDate(lastUpdated!) : null,
    };
  }

  ChatEntity copyWith({
    String? id,
    List<String>? participants,
    String? lastMessage,
    DateTime? lastUpdated,
  }) {
    return ChatEntity(
      id: id ?? this.id,
      participants: participants ?? this.participants,
      lastMessage: lastMessage ?? this.lastMessage,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
