import 'package:auto_route/auto_route.dart';
import 'package:screpagram/core/cubit/auth_cubit.dart';
import 'package:screpagram/core/router/cryptome_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthCubit authCubit;

  AuthGuard(this.authCubit);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final state = authCubit.state;
    if (state is AuthAuthenticated) {
      resolver.redirectUntil(const FeedRoute(), replace: true);
    } else {
      resolver.redirectUntil(const RegistationRoute(), replace: true);
    }
  }
}
