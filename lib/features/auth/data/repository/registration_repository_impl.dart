// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:screpagram/core/domain/models/person_entity.dart';

import 'package:screpagram/features/auth/data/data_source/remote/reg_fb_repo.dart';
import 'package:screpagram/features/auth/domain/repository/registration_repository.dart';

class RegRepoImpl implements RegRepo {
  final RegFbRepo regFbRepo;
  RegRepoImpl({
    required this.regFbRepo,
  });

  @override
  Future<UserCredential> signIn(String email, String pass) async {
    return await regFbRepo.signIn(email, pass);
  }

  @override
  Future<UserCredential> signUp(String email, String pass) async {
    return await regFbRepo.signUp(email, pass);
  }

  @override
  Future<PersonEntity> addAddInfo() async {
   return await regFbRepo.addAdditInfo();
  }
}
