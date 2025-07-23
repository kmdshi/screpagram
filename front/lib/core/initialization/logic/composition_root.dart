import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:screpagram/core/cubit/auth/auth_cubit.dart';
import 'package:screpagram/core/cubit/user/user_cubit.dart';
import 'package:screpagram/core/initialization/model/dependency_container.dart';
import 'package:screpagram/core/router/auth_guard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:screpagram/features/auth/data/data_source/remote/reg_fb_repo.dart';
import 'package:screpagram/features/auth/data/repository/registration_repository_impl.dart';
import 'package:screpagram/features/auth/domain/repository/registration_repository.dart';
import 'package:screpagram/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:screpagram/features/explore/data/datasource/explore_fb_repo.dart';
import 'package:screpagram/features/explore/data/repository/explore_repo_impl.dart';
import 'package:screpagram/features/explore/domain/explore_repo.dart';
import 'package:screpagram/features/explore/presentation/bloc/explore/explore_bloc.dart';
import 'package:screpagram/features/feed/data/datasource/remote/feed_fb_repo.dart';
import 'package:screpagram/features/feed/data/repository/feed_repo_impl.dart';
import 'package:screpagram/features/feed/domain/repository/feed_repo.dart';
import 'package:screpagram/features/feed/presentation/bloc/actions/actions_bloc.dart';
import 'package:screpagram/features/feed/presentation/bloc/feed/feed_bloc.dart';
import 'package:screpagram/features/messaging/data/datasources/remote/msg_fb_repo.dart';
import 'package:screpagram/features/messaging/data/repository/messaging_repository_impl.dart';
import 'package:screpagram/features/messaging/domain/repository/messaging_repository.dart';
import 'package:screpagram/features/messaging/presentation/bloc/messaging_bloc.dart';

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

  // user

  final userCubit = createUserCubit();

  // user

  // auth

  final authCubit = createAuthCubit(fbAuth);

  final authGuard = createAuthGuard(authCubit);

  final regFbRepo = createRegFbRepo(fbAuth, fbFirestore);

  final regRepo = createRegRepo(regFbRepo);

  final authBloc = createAuthBloc(regRepo);

  // auth

  // feed

  final feedFbRepo = createFeedFbRepo(fbFirestore, fbAuth);

  final feedRepo = createFeedRepo(feedFbRepo);

  final feedBloc = createFeedBloc(feedRepo);

  // feed

  // explore

  final exploreFbRepo = createExploreFbRepo(fbFirestore, fbAuth);

  final exploreRepo = createExploreRepo(exploreFbRepo);

  final exploreBloc = createExploreBloc(exploreRepo);

  // explore

  // messaging

  final msgFbRepo = createMsgFbRepo(fbAuth, fbFirestore);

  final msgRepo = createMessagingRepo(msgFbRepo);

  final msgBloc = createMessagingBloc(msgRepo);

  // messaging

  // feed

  final actionsBloc = createActionsBloc(feedRepo);

  // feed

  return DependenciesContainer(
    authGuard: authGuard,
    authBloc: authBloc,
    authCubit: authCubit,
    userCubit: userCubit,
    actionsBloc: actionsBloc,
    feedBloc: feedBloc,
    exploreBloc: exploreBloc,
    messagingBloc: msgBloc,
  );
}

FirebaseAuth createFirebaseAuth() {
  return FirebaseAuth.instance;
}

FirebaseFirestore createFirebaseFirestore() {
  return FirebaseFirestore.instance;
}

UserCubit createUserCubit() {
  return UserCubit();
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

FeedFbRepo createFeedFbRepo(
    FirebaseFirestore firebaseFirestore, FirebaseAuth firebaseAuth) {
  return FeedFbRepo(
      firebaseFirestore: firebaseFirestore, firebaseAuth: firebaseAuth);
}

FeedRepo createFeedRepo(FeedFbRepo feedFbRepo) {
  return FeedRepoImpl(feedFbRepo: feedFbRepo);
}

FeedBloc createFeedBloc(FeedRepo feedRepo) {
  return FeedBloc(feedRepo: feedRepo);
}

ExploreFbRepo createExploreFbRepo(
    FirebaseFirestore firestore, FirebaseAuth fbAuth) {
  return ExploreFbRepo(firestore, fbAuth);
}

ExploreRepo createExploreRepo(ExploreFbRepo exploreFbRepo) {
  return ExploreRepoImpl(exploreFbRepo: exploreFbRepo);
}

ExploreBloc createExploreBloc(ExploreRepo exploreRepo) {
  return ExploreBloc(exploreRepo);
}

MsgFbRepo createMsgFbRepo(
    FirebaseAuth firebaseAuth, FirebaseFirestore firebaseFirestore) {
  return MsgFbRepo(
      firebaseFirestore: firebaseFirestore, firebaseAuth: firebaseAuth);
}

MessagingRepo createMessagingRepo(MsgFbRepo msgFbRepo) {
  return MessagingRepositoryImpl(msgFbRepo: msgFbRepo);
}

MessagingBloc createMessagingBloc(MessagingRepo messagingRepo) {
  return MessagingBloc(messagingRepo);
}

ActionsBloc createActionsBloc(FeedRepo feedRepo) {
  return ActionsBloc(feedRepo: feedRepo);
}
