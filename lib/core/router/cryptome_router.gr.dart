// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:screpagram/core/presentation/root_screen.dart' as _i14;
import 'package:screpagram/features/auth/presentation/widgets/adding_additional_info_screen.dart'
    as _i2;
import 'package:screpagram/features/auth/presentation/widgets/base_reg_screen.dart'
    as _i3;
import 'package:screpagram/features/auth/presentation/widgets/login_page.dart'
    as _i8;
import 'package:screpagram/features/auth/presentation/widgets/onboarding_screen.dart'
    as _i10;
import 'package:screpagram/features/auth/presentation/widgets/registration_screen.dart'
    as _i13;
import 'package:screpagram/features/explore/presentation/widget/explore_router.dart'
    as _i4;
import 'package:screpagram/features/explore/presentation/widget/explore_screen.dart'
    as _i5;
import 'package:screpagram/features/explore/presentation/widget/people_screen.dart'
    as _i11;
import 'package:screpagram/features/feed/presentation/widgets/add_post_screen.dart'
    as _i1;
import 'package:screpagram/features/feed/presentation/widgets/feed_router.dart'
    as _i6;
import 'package:screpagram/features/feed/presentation/widgets/feed_screen.dart'
    as _i7;
import 'package:screpagram/features/messaging/presentation/widgets/communication_screen.dart'
    as _i9;
import 'package:screpagram/features/profile/widget/profile_screen.dart' as _i12;

/// generated route for
/// [_i1.AddPostScreen]
class AddPostRoute extends _i15.PageRouteInfo<void> {
  const AddPostRoute({List<_i15.PageRouteInfo>? children})
      : super(AddPostRoute.name, initialChildren: children);

  static const String name = 'AddPostRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddPostScreen();
    },
  );
}

/// generated route for
/// [_i2.AddingAdditionalInfoScreen]
class AddingAdditionalInfoRoute extends _i15.PageRouteInfo<void> {
  const AddingAdditionalInfoRoute({List<_i15.PageRouteInfo>? children})
      : super(AddingAdditionalInfoRoute.name, initialChildren: children);

  static const String name = 'AddingAdditionalInfoRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddingAdditionalInfoScreen();
    },
  );
}

/// generated route for
/// [_i3.BaseRegScreen]
class BaseRegRoute extends _i15.PageRouteInfo<void> {
  const BaseRegRoute({List<_i15.PageRouteInfo>? children})
      : super(BaseRegRoute.name, initialChildren: children);

  static const String name = 'BaseRegRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i3.BaseRegScreen();
    },
  );
}

/// generated route for
/// [_i4.ExploreRouter]
class ExploreRouter extends _i15.PageRouteInfo<void> {
  const ExploreRouter({List<_i15.PageRouteInfo>? children})
      : super(ExploreRouter.name, initialChildren: children);

  static const String name = 'ExploreRouter';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i4.ExploreRouter();
    },
  );
}

/// generated route for
/// [_i5.ExploreScreen]
class ExploreRoute extends _i15.PageRouteInfo<void> {
  const ExploreRoute({List<_i15.PageRouteInfo>? children})
      : super(ExploreRoute.name, initialChildren: children);

  static const String name = 'ExploreRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i5.ExploreScreen();
    },
  );
}

/// generated route for
/// [_i6.FeedRouter]
class FeedRouter extends _i15.PageRouteInfo<void> {
  const FeedRouter({List<_i15.PageRouteInfo>? children})
      : super(FeedRouter.name, initialChildren: children);

  static const String name = 'FeedRouter';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i6.FeedRouter();
    },
  );
}

/// generated route for
/// [_i7.FeedScreen]
class FeedRoute extends _i15.PageRouteInfo<void> {
  const FeedRoute({List<_i15.PageRouteInfo>? children})
      : super(FeedRoute.name, initialChildren: children);

  static const String name = 'FeedRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i7.FeedScreen();
    },
  );
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute({List<_i15.PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i8.LoginPage();
    },
  );
}

/// generated route for
/// [_i9.MessagingScreen]
class MessagingRoute extends _i15.PageRouteInfo<void> {
  const MessagingRoute({List<_i15.PageRouteInfo>? children})
      : super(MessagingRoute.name, initialChildren: children);

  static const String name = 'MessagingRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i9.MessagingScreen();
    },
  );
}

/// generated route for
/// [_i10.OnboardingScreen]
class OnboardingRoute extends _i15.PageRouteInfo<void> {
  const OnboardingRoute({List<_i15.PageRouteInfo>? children})
      : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i10.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i11.PeopleScreen]
class PeopleRoute extends _i15.PageRouteInfo<PeopleRouteArgs> {
  PeopleRoute({
    _i16.Key? key,
    required String uid,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          PeopleRoute.name,
          args: PeopleRouteArgs(key: key, uid: uid),
          initialChildren: children,
        );

  static const String name = 'PeopleRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PeopleRouteArgs>();
      return _i11.PeopleScreen(key: args.key, uid: args.uid);
    },
  );
}

class PeopleRouteArgs {
  const PeopleRouteArgs({this.key, required this.uid});

  final _i16.Key? key;

  final String uid;

  @override
  String toString() {
    return 'PeopleRouteArgs{key: $key, uid: $uid}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PeopleRouteArgs) return false;
    return key == other.key && uid == other.uid;
  }

  @override
  int get hashCode => key.hashCode ^ uid.hashCode;
}

/// generated route for
/// [_i12.ProfileScreen]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute({List<_i15.PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i12.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i13.RegistrationRoute]
class RegistrationRoute extends _i15.PageRouteInfo<void> {
  const RegistrationRoute({List<_i15.PageRouteInfo>? children})
      : super(RegistrationRoute.name, initialChildren: children);

  static const String name = 'RegistrationRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i13.RegistrationRoute();
    },
  );
}

/// generated route for
/// [_i14.RootPage]
class RootRoute extends _i15.PageRouteInfo<void> {
  const RootRoute({List<_i15.PageRouteInfo>? children})
      : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i14.RootPage();
    },
  );
}
