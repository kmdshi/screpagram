import 'package:firebase_auth/firebase_auth.dart';

abstract class RegRepo {
  Future<UserCredential> signUp(String email, String pass);
  Future<UserCredential> signIn(String email, String pass);
  Future<void> addAddInfo();
}
