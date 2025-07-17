import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth firebaseAuth;
  StreamSubscription<User?>? _authSub;

  AuthCubit({required this.firebaseAuth}) : super(AuthInitial()) {
    _init();
  }

  void _init() {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnauthenticated());
    }

    _authSub = firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticated());
      }
    });
  }

  @override
  Future<void> close() {
    _authSub?.cancel();
    return super.close();
  }
}
