import 'package:firebase_auth/firebase_auth.dart';
import 'package:screpagram/core/domain/models/person_entity.dart';

abstract class RegRepo {
  Future<UserCredential> signUp(String email, String pass);
  Future<UserCredential> signIn(String email, String pass);
  Future<PersonEntity> addAddInfo();
}
