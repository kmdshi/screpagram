import 'package:screpagram/core/cubit/auth_cubit.dart';
import 'package:screpagram/core/initialization/model/dependency_container.dart';
import 'package:screpagram/core/router/auth_guard.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  final authCubit = createAuthCubit(fbAuth);

  final authGuard = createAuthGuard(authCubit);

  return DependenciesContainer(authGuard: authGuard);
}

FirebaseAuth createFirebaseAuth() {
  return FirebaseAuth.instance;
}

AuthCubit createAuthCubit(FirebaseAuth firebaseAuth) {
  return AuthCubit(firebaseAuth: firebaseAuth);
}

AuthGuard createAuthGuard(AuthCubit authCubit) {
  return AuthGuard(authCubit);
}
