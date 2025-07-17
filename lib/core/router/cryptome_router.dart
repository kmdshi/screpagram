import 'package:auto_route/auto_route.dart';
import 'package:screpagram/core/router/auth_guard.dart';
import 'package:screpagram/core/router/cryptome_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;

  AppRouter(this.authGuard);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: RootRoute.page,
          initial: true,
          guards: [authGuard],
          children: [
            AutoRoute(
              path: 'feedRouter',
              page: FeedRouter.page,
              children: [
                AutoRoute(path: '', page: FeedRoute.page),
                AutoRoute(path: 'newPost', page: AddPostRoute.page)
              ],
            ),
            AutoRoute(path: 'messages', page: MessagingRoute.page),
            AutoRoute(path: 'profile', page: ProfileRoute.page),
          ],
        ),
        AutoRoute(
          path: '/onboarding',
          page: OnboardingRoute.page,
        ),
        AutoRoute(
          path: '/reg',
          page: RegistrationRoute.page,
          children: [
            AutoRoute(path: '', page: BaseRegRoute.page),
            AutoRoute(
              path: 'additional',
              page: AddingAdditionalInfoRoute.page,
            )
          ],
        ),
      ];
}
