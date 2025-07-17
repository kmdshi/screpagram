import 'package:screpagram/core/domain/models/person_entity.dart';

class PersonFormModel {
  String? email;
  String? password;
  String? nickname;
  int trustworthinessIndex;

  PersonFormModel({
    this.email,
    this.password,
    this.nickname,
    this.trustworthinessIndex = 100,
  });

  factory PersonFormModel.fromEntity(PersonEntity entity) {
    return PersonFormModel(
      email: entity.email,
      password: entity.password,
      nickname: entity.nickname,
      trustworthinessIndex: entity.trustworthinessIndex,
    );
  }
}
