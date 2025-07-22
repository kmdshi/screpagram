import 'package:screpagram/core/cubit/auth/auth_cubit.dart';
import 'package:screpagram/core/cubit/user/user_cubit.dart';
import 'package:screpagram/core/router/auth_guard.dart';
import 'package:screpagram/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:screpagram/features/explore/presentation/bloc/explore/explore_bloc.dart';
import 'package:screpagram/features/feed/presentation/bloc/actions/actions_bloc.dart';
import 'package:screpagram/features/feed/presentation/bloc/feed/feed_bloc.dart';
import 'package:screpagram/features/messaging/presentation/bloc/messaging_bloc.dart';

final class DependenciesContainer {
  const DependenciesContainer({
    required this.authGuard,
    required this.authBloc,
    required this.feedBloc,
    required this.authCubit,
    required this.userCubit,
    required this.actionsBloc,
    required this.exploreBloc,
    required this.messagingBloc,
  });

  final AuthGuard authGuard;

  final AuthCubit authCubit;

  final UserCubit userCubit;

  final AuthBloc authBloc;

  final FeedBloc feedBloc;

  final ActionsBloc actionsBloc;

  final MessagingBloc messagingBloc;

  final ExploreBloc exploreBloc;
}
