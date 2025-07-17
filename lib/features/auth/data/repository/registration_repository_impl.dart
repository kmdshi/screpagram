// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import 'package:screpagram/features/auth/data/data_source/remote/reg_fb_repo.dart';
import 'package:screpagram/features/auth/domain/entities/person_form_model.dart';
import 'package:screpagram/features/auth/domain/repository/registration_repository.dart';

class RegRepoImpl implements RegRepo {
  final RegFbRepo regFbRepo;
  RegRepoImpl({
    required this.regFbRepo,
  });

  @override
  Future<UserCredential> signIn(PersonFormModel personEntity) async {
    return await regFbRepo.signIn(personEntity);
  }

  @override
  Future<UserCredential> signUp(PersonFormModel personEntity) async {
    return await regFbRepo.signUp(personEntity);
  }

  @override
  Future<void> addAddInfo(PersonFormModel personEntity) {
    // TODO: implement addAddInfo
    throw UnimplementedError();
  }
}
