import 'package:screpagram/core/initialization/dependency_scope.dart';
import 'package:screpagram/core/router/cryptome_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter(DependenciesScope.of(context).authGuard);

    return MaterialApp.router(
      routerConfig: router.config(),
    );
  }
}
