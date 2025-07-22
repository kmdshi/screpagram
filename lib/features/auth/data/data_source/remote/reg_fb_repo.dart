// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:screpagram/core/domain/models/person_entity.dart';

class RegFbRepo {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  RegFbRepo({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  Future<UserCredential> signIn(String email, String pass) async {
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided.');
      } else if (e.code == 'invalid-email') {
        throw Exception('Invalid email format.');
      } else if (e.code == 'user-disabled') {
        throw Exception('This user account has been disabled.');
      } else if (e.code == 'too-many-requests') {
        throw Exception('Too many attempts. Try again later.');
      } else if (e.code == 'operation-not-allowed') {
        throw Exception('Email/password accounts are not enabled.');
      } else {
        throw Exception('Sign-in failed: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  Future<UserCredential> signUp(String email, String pass) async {
    try {
      final UserCredential user =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      } else {
        throw Exception('FirebaseAuth error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  Future<PersonEntity> addAdditInfo() async {
    final user = firebaseAuth.currentUser;
    if (user == null) throw Exception('Пользователь не авторизован');

    final profiles = firebaseFirestore.collection('profiles');
    final existingDoc = await profiles.doc(user.uid).get();
    if (existingDoc.exists) return PersonEntity.fromMap(existingDoc.data()!);

    final query =
        await profiles.orderBy('nickname', descending: true).limit(1).get();

    int lastNumber = 0;
    if (query.docs.isNotEmpty) {
      final lastNickname = query.docs.first['nickname'] as String;
      final match = RegExp(r'Гражданин №(\d+)').firstMatch(lastNickname);
      if (match != null) {
        lastNumber = int.parse(match.group(1)!);
      }
    }

    final citizenNumber = lastNumber + 1;

    final updatedPerson = PersonEntity(
      id: user.uid,
      nickname: 'Гражданин №$citizenNumber',
      friends: [],
      friendRequests: [],
      trustworthinessIndex: 100,
    );

    await profiles.doc(user.uid).set(updatedPerson.toMap());

    return updatedPerson;
  }
}
