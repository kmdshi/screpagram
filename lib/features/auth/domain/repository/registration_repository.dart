import 'package:firebase_auth/firebase_auth.dart';
import 'package:screpagram/features/auth/domain/entities/person_form_model.dart';

abstract class RegRepo {
  Future<UserCredential> signUp(PersonFormModel personEntity);
  Future<UserCredential> signIn(PersonFormModel personEntity);
  Future<void> addAddInfo(PersonFormModel personEntity);
}
