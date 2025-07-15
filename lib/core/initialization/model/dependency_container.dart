import 'package:screpagram/core/router/auth_guard.dart';

final class DependenciesContainer {
  const DependenciesContainer({
    required this.authGuard,
  });

  final AuthGuard authGuard;
}
