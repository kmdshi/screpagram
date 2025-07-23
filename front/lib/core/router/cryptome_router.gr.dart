// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
import 'package:screpagram/core/presentation/root_screen.dart' as _i17;
import 'package:screpagram/features/auth/presentation/widgets/adding_additional_info_screen.dart'
    as _i3;
import 'package:screpagram/features/auth/presentation/widgets/base_reg_screen.dart'
    as _i4;
import 'package:screpagram/features/auth/presentation/widgets/login_page.dart'
    as _i12;
import 'package:screpagram/features/auth/presentation/widgets/onboarding_screen.dart'
    as _i13;
import 'package:screpagram/features/auth/presentation/widgets/registration_screen.dart'
    as _i16;
import 'package:screpagram/features/explore/presentation/widget/explore_router.dart'
    as _i8;
import 'package:screpagram/features/explore/presentation/widget/explore_screen.dart'
    as _i9;
import 'package:screpagram/features/explore/presentation/widget/people_screen.dart'
    as _i14;
import 'package:screpagram/features/feed/presentation/widgets/actions_screen.dart'
    as _i1;
import 'package:screpagram/features/feed/presentation/widgets/add_post_screen.dart'
    as _i2;
import 'package:screpagram/features/feed/presentation/widgets/feed_router.dart'
    as _i10;
import 'package:screpagram/features/feed/presentation/widgets/feed_screen.dart'
    as _i11;
import 'package:screpagram/features/messaging/domain/entities/chat_entity.dart'
    as _i20;
import 'package:screpagram/features/messaging/presentation/widgets/chat_router.dart'
    as _i5;
import 'package:screpagram/features/messaging/presentation/widgets/chat_screen.dart'
    as _i6;
import 'package:screpagram/features/messaging/presentation/widgets/chats_screen.dart'
    as _i7;
import 'package:screpagram/features/profile/widget/profile_screen.dart' as _i15;

/// generated route for
/// [_i1.ActionsScreen]
class ActionsRoute extends _i18.PageRouteInfo<void> {
  const ActionsRoute({List<_i18.PageRouteInfo>? children})
      : super(ActionsRoute.name, initialChildren: children);

  static const String name = 'ActionsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i1.ActionsScreen();
    },
  );
}

/// generated route for
/// [_i2.AddPostScreen]
class AddPostRoute extends _i18.PageRouteInfo<void> {
  const AddPostRoute({List<_i18.PageRouteInfo>? children})
      : super(AddPostRoute.name, initialChildren: children);

  static const String name = 'AddPostRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddPostScreen();
    },
  );
}

/// generated route for
/// [_i3.AddingAdditionalInfoScreen]
class AddingAdditionalInfoRoute extends _i18.PageRouteInfo<void> {
  const AddingAdditionalInfoRoute({List<_i18.PageRouteInfo>? children})
      : super(AddingAdditionalInfoRoute.name, initialChildren: children);

  static const String name = 'AddingAdditionalInfoRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i3.AddingAdditionalInfoScreen();
    },
  );
}

/// generated route for
/// [_i4.BaseRegScreen]
class BaseRegRoute extends _i18.PageRouteInfo<void> {
  const BaseRegRoute({List<_i18.PageRouteInfo>? children})
      : super(BaseRegRoute.name, initialChildren: children);

  static const String name = 'BaseRegRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i4.BaseRegScreen();
    },
  );
}

/// generated route for
/// [_i5.ChatRouter]
class ChatRouter extends _i18.PageRouteInfo<void> {
  const ChatRouter({List<_i18.PageRouteInfo>? children})
      : super(ChatRouter.name, initialChildren: children);

  static const String name = 'ChatRouter';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i5.ChatRouter();
    },
  );
}

/// generated route for
/// [_i6.ChatScreen]
class ChatRoute extends _i18.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i19.Key? key,
    required _i20.ChatEntity chat,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(key: key, chat: chat),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatRouteArgs>();
      return _i6.ChatScreen(key: args.key, chat: args.chat);
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key, required this.chat});

  final _i19.Key? key;

  final _i20.ChatEntity chat;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, chat: $chat}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatRouteArgs) return false;
    return key == other.key && chat == other.chat;
  }

  @override
  int get hashCode => key.hashCode ^ chat.hashCode;
}

/// generated route for
/// [_i7.ChatsScreen]
class ChatsRoute extends _i18.PageRouteInfo<void> {
  const ChatsRoute({List<_i18.PageRouteInfo>? children})
      : super(ChatsRoute.name, initialChildren: children);

  static const String name = 'ChatsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i7.ChatsScreen();
    },
  );
}

/// generated route for
/// [_i8.ExploreRouter]
class ExploreRouter extends _i18.PageRouteInfo<void> {
  const ExploreRouter({List<_i18.PageRouteInfo>? children})
      : super(ExploreRouter.name, initialChildren: children);

  static const String name = 'ExploreRouter';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i8.ExploreRouter();
    },
  );
}

/// generated route for
/// [_i9.ExploreScreen]
class ExploreRoute extends _i18.PageRouteInfo<void> {
  const ExploreRoute({List<_i18.PageRouteInfo>? children})
      : super(ExploreRoute.name, initialChildren: children);

  static const String name = 'ExploreRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i9.ExploreScreen();
    },
  );
}

/// generated route for
/// [_i10.FeedRouter]
class FeedRouter extends _i18.PageRouteInfo<void> {
  const FeedRouter({List<_i18.PageRouteInfo>? children})
      : super(FeedRouter.name, initialChildren: children);

  static const String name = 'FeedRouter';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i10.FeedRouter();
    },
  );
}

/// generated route for
/// [_i11.FeedScreen]
class FeedRoute extends _i18.PageRouteInfo<void> {
  const FeedRoute({List<_i18.PageRouteInfo>? children})
      : super(FeedRoute.name, initialChildren: children);

  static const String name = 'FeedRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i11.FeedScreen();
    },
  );
}

/// generated route for
/// [_i12.LoginPage]
class LoginRoute extends _i18.PageRouteInfo<void> {
  const LoginRoute({List<_i18.PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i12.LoginPage();
    },
  );
}

/// generated route for
/// [_i13.OnboardingScreen]
class OnboardingRoute extends _i18.PageRouteInfo<void> {
  const OnboardingRoute({List<_i18.PageRouteInfo>? children})
      : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i13.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i14.PeopleScreen]
class PeopleRoute extends _i18.PageRouteInfo<PeopleRouteArgs> {
  PeopleRoute({
    _i19.Key? key,
    required String uid,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          PeopleRoute.name,
          args: PeopleRouteArgs(key: key, uid: uid),
          initialChildren: children,
        );

  static const String name = 'PeopleRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PeopleRouteArgs>();
      return _i14.PeopleScreen(key: args.key, uid: args.uid);
    },
  );
}

class PeopleRouteArgs {
  const PeopleRouteArgs({this.key, required this.uid});

  final _i19.Key? key;

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
/// [_i15.ProfileScreen]
class ProfileRoute extends _i18.PageRouteInfo<void> {
  const ProfileRoute({List<_i18.PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i15.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i16.RegistrationRoute]
class RegistrationRoute extends _i18.PageRouteInfo<void> {
  const RegistrationRoute({List<_i18.PageRouteInfo>? children})
      : super(RegistrationRoute.name, initialChildren: children);

  static const String name = 'RegistrationRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i16.RegistrationRoute();
    },
  );
}

/// generated route for
/// [_i17.RootPage]
class RootRoute extends _i18.PageRouteInfo<void> {
  const RootRoute({List<_i18.PageRouteInfo>? children})
      : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i17.RootPage();
    },
  );
}
