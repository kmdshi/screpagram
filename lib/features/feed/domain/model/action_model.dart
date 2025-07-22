import 'package:cloud_firestore/cloud_firestore.dart';

enum ActionType { newPost, friendRequest, report, message }

class ActionModel {
  final String id;
  final String title;
  final String description;
  final DateTime timestamp;
  final ActionType type;
  final String? actorId;

  ActionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.type,
    this.actorId,
  });

  factory ActionModel.fromMap(Map<String, dynamic> map, String docId) {
    return ActionModel(
      id: docId,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      type: _stringToActionType(map['type'] ?? 'newPost'),
      actorId: map['actorId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'timestamp': timestamp,
      'type': type.name,
      'actorId': actorId,
    };
  }

  static ActionType _stringToActionType(String typeStr) {
    return ActionType.values.firstWhere(
      (e) => e.name == typeStr,
      orElse: () => ActionType.newPost,
    );
  }
}
