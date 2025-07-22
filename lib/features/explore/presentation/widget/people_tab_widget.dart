import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/core/router/cryptome_router.gr.dart';
import 'package:screpagram/features/explore/presentation/bloc/explore/explore_bloc.dart';

class PeopleTabWidget extends StatelessWidget {
  const PeopleTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        if (state is ExploreLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ExploreUsersLoaded) {
          final users = state.users;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final person = users[index];

              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(person.nickname),
                subtitle: Text('${person.friends.length} связей'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.router.push(PeopleRoute(uid: person.id)),
              );
            },
          );
        }

        if (state is ExploreError) {
          return Center(child: Text('Ошибка: ${state.message}'));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
