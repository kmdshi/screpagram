import 'package:auto_route/auto_route.dart';
import 'package:screpagram/core/cubit/auth_cubit.dart';
import 'package:screpagram/core/initialization/dependency_scope.dart';
import 'package:screpagram/core/router/cryptome_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter(DependenciesScope.of(context).authGuard);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => DependenciesScope.of(context).authCubit),
        BlocProvider(create: (ctx) => DependenciesScope.of(context).authBloc),
        BlocProvider(create: (ctx) => DependenciesScope.of(context).feedBloc),
        BlocProvider(
            create: (ctx) => DependenciesScope.of(context).exploreBloc),
      ],
      child: MaterialApp.router(
        routerConfig: router.config(),
      ),
    );
  }
}
