import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PersonEntity {
  final String nickname;
  final String email;
  final String password;
  final int trustworthinessIndex;

  PersonEntity({
    required this.nickname,
    required this.email,
    required this.password,
    required this.trustworthinessIndex,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nickname': nickname,
      'email': email,
      'password': password,
      'trustworthinessIndex': trustworthinessIndex,
    };
  }

  factory PersonEntity.fromMap(Map<String, dynamic> map) {
    return PersonEntity(
      nickname: map['nickname'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      trustworthinessIndex: map['trustworthinessIndex'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonEntity.fromJson(String source) =>
      PersonEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  PersonEntity copyWith(
      {String? nickname,
      String? email,
      String? password,
      int? trustworthinessIndex}) {
    return PersonEntity(
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      password: password ?? this.password,
      trustworthinessIndex: trustworthinessIndex ?? this.trustworthinessIndex,
    );
  }
}
