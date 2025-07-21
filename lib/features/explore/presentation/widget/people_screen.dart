import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/core/initialization/widget/custom_snackbar.dart';
import 'package:screpagram/features/explore/presentation/bloc/explore/explore_bloc.dart';
import 'package:screpagram/features/profile/widget/statistics_widget.dart';

@RoutePage()
class PeopleScreen extends StatefulWidget {
  final String uid;
  const PeopleScreen({
    super.key,
    required this.uid,
  });

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  @override
  void initState() {
    context.read<ExploreBloc>().add(LoadExploreUserByIdEvent(widget.uid));
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: BlocBuilder<ExploreBloc, ExploreState>(
          buildWhen: (previous, current) => current is ExploreUserLoaded,
          builder: (context, state) {
            if (state is ExploreUserLoaded) {
              return AppBar(
                leading: BackButton(
                  onPressed: () {
                    context.read<ExploreBloc>().add(LoadExploreUsersEvent());
                    context.router.pop();
                  },
                ),
                centerTitle: true,
                title: Text(state.user.nickname),
              );
            }

            return SizedBox.shrink();
          },
        ),
      ),
      body: SafeArea(
        child: BlocListener<ExploreBloc, ExploreState>(
          listenWhen: (previous, current) =>
              current is ExploreSuccess || current is ExploreError,
          listener: (context, state) {
            if (state is ExploreSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is ExploreError) {
              return showCustomSnackBar(context, state.message);
            }
          },
          child: BlocBuilder<ExploreBloc, ExploreState>(
            buildWhen: (previous, current) => current is ExploreUserLoaded,
            builder: (context, state) {
              if (state is ExploreLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ExploreUserLoaded) {
                final user = state.user;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          const CircleAvatar(radius: 35),
                          const SizedBox(height: 15),
                          Text('${user.friends.length} Связей'),
                          const SizedBox(height: 15),
                          const StatisticsWidget(),
                          const Divider(height: 30),
                          ListTile(
                            leading: const Icon(Icons.add_circle_outline),
                            title: const Text('Создать связь'),
                            onTap: () => context
                                .read<ExploreBloc>()
                                .add(AddUserFreindRequest(user.id)),
                          ),
                          ListTile(
                            leading: const Icon(Icons.chat_bubble_outline),
                            title: const Text('Написать сообщение'),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.flag_outlined),
                            title: const Text('Донести'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return const Center(child: Text('Загрузка...'));
            },
          ),
        ),
      ),
    );
  }
}
