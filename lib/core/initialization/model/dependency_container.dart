import 'package:screpagram/core/cubit/auth_cubit.dart';
import 'package:screpagram/core/router/auth_guard.dart';
import 'package:screpagram/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:screpagram/features/explore/presentation/bloc/explore/explore_bloc.dart';
import 'package:screpagram/features/feed/presentation/bloc/feed_bloc.dart';

final class DependenciesContainer {
  const DependenciesContainer({
    required this.authGuard,
    required this.authBloc,
    required this.feedBloc,
    required this.authCubit,
    required this.exploreBloc
  });

  final AuthGuard authGuard;
  
  final AuthCubit authCubit;

  final AuthBloc authBloc;

  final FeedBloc feedBloc;

  final ExploreBloc exploreBloc;
}
