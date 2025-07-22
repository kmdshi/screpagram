import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PersonEntity {
  final String id;
  final String nickname;
  final List<String> friends;
  final List<String> friendRequests;
  final int trustworthinessIndex;

  PersonEntity({
    required this.friends,
    required this.friendRequests,
    required this.id,
    required this.nickname,
    required this.trustworthinessIndex,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'friends': friends,
      'friendRequests': friendRequests,
      'nickname': nickname,
      'trustworthinessIndex': trustworthinessIndex,
    };
  }

  factory PersonEntity.fromMap(final Map<String, dynamic> map) {
    return PersonEntity(
      id: map['id'] as String,
      nickname: map['nickname'] as String,
      trustworthinessIndex: map['trustworthinessIndex'] as int,
      friends: List<String>.from(map['friends'] ?? []),
      friendRequests: List<String>.from(map['friendRequests'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonEntity.fromJson(String source) =>
      PersonEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  PersonEntity copyWith({
    final String? id,
    final String? nickname,
    final String? email,
    final String? password,
    final int? trustworthinessIndex,
    final List<String>? friends,
    final List<String>? friendRequests,
  }) {
    return PersonEntity(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      friendRequests: friendRequests ?? this.friendRequests,
      trustworthinessIndex: trustworthinessIndex ?? this.trustworthinessIndex,
      friends: friends ?? this.friends,
    );
  }
}
