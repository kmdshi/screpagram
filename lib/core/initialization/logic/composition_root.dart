import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:screpagram/core/cubit/auth_cubit.dart';
import 'package:screpagram/core/initialization/model/dependency_container.dart';
import 'package:screpagram/core/router/auth_guard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:screpagram/features/auth/data/data_source/remote/reg_fb_repo.dart';
import 'package:screpagram/features/auth/data/repository/registration_repository_impl.dart';
import 'package:screpagram/features/auth/domain/repository/registration_repository.dart';
import 'package:screpagram/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:screpagram/features/feed/data/datasource/remote/feed_fb_repo.dart';
import 'package:screpagram/features/feed/data/repository/feed_repo_impl.dart';
import 'package:screpagram/features/feed/domain/repository/feed_repo.dart';
import 'package:screpagram/features/feed/presentation/bloc/feed_bloc.dart';

final class CompositionRoot {
  const CompositionRoot();

  Future<CompositionResult> compose() async {
    final dependencies = await createDependenciesContainer();

    return CompositionResult(
      dependencies: dependencies,
    );
  }
}

final class CompositionResult {
  const CompositionResult({
    required this.dependencies,
  });

  final DependenciesContainer dependencies;

  @override
  String toString() => 'CompositionResult('
      'dependencies: $dependencies, '
      ')';
}

Future<DependenciesContainer> createDependenciesContainer() async {
  final fbAuth = createFirebaseAuth();

  final fbFirestore = createFirebaseFirestore();

  // auth

  final authCubit = createAuthCubit(fbAuth);

  final authGuard = createAuthGuard(authCubit);

  final regFbRepo = createRegFbRepo(fbAuth, fbFirestore);

  final regRepo = createRegRepo(regFbRepo);

  final authBloc = createAuthBloc(regRepo);

  // auth

  // feed

  final feedFbRepo = createFeedFbRepo(fbFirestore);

  final feedRepo = createFeedRepo(feedFbRepo);

  final feedBloc = createFeedBloc(feedRepo);

  return DependenciesContainer(
    authGuard: authGuard,
    authBloc: authBloc,
    authCubit: authCubit,
    feedBloc: feedBloc,
  );
}

FirebaseAuth createFirebaseAuth() {
  return FirebaseAuth.instance;
}

FirebaseFirestore createFirebaseFirestore() {
  return FirebaseFirestore.instance;
}

AuthCubit createAuthCubit(FirebaseAuth firebaseAuth) {
  return AuthCubit(firebaseAuth: firebaseAuth);
}

AuthGuard createAuthGuard(AuthCubit authCubit) {
  return AuthGuard(authCubit);
}

RegFbRepo createRegFbRepo(
    FirebaseAuth firebaseAuth, FirebaseFirestore firebaseFirestore) {
  return RegFbRepo(
      firebaseAuth: firebaseAuth, firebaseFirestore: firebaseFirestore);
}

RegRepo createRegRepo(RegFbRepo regFbRepo) {
  return RegRepoImpl(regFbRepo: regFbRepo);
}

AuthBloc createAuthBloc(RegRepo regRepo) {
  return AuthBloc(regRepo: regRepo);
}

FeedFbRepo createFeedFbRepo(FirebaseFirestore firebaseFirestore) {
  return FeedFbRepo(firebaseFirestore: firebaseFirestore);
}

FeedRepo createFeedRepo(FeedFbRepo feedFbRepo) {
  return FeedRepoImpl(feedFbRepo: feedFbRepo);
}

FeedBloc createFeedBloc(FeedRepo feedRepo) {
  return FeedBloc(feedRepo: feedRepo);
}
