import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:screpagram/core/cubit/auth_cubit.dart';
import 'package:screpagram/core/router/cryptome_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthCubit authCubit;

  AuthGuard(this.authCubit);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final state = authCubit.state;
    debugPrint(state.toString());
    if (state is AuthAuthenticated) {
      resolver.next();
    } else {
      resolver.redirectUntil(const RegistrationRoute(), replace: true);
    }
  }
}
