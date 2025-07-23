import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/core/cubit/user/user_cubit.dart';
import 'package:screpagram/core/presentation/post_widget.dart';
import 'package:screpagram/core/router/cryptome_router.gr.dart';
import 'package:screpagram/features/feed/presentation/bloc/feed/feed_bloc.dart';

@RoutePage()
class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    context.read<FeedBloc>().add(LoadFeedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserCubit>().state;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.router.push(ActionsRoute()),
            icon: user != null && user.friendRequests.isNotEmpty
                ? const Icon(Icons.notifications_active)
                : const Icon(Icons.notifications_none),
          )
        ],
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () => context.pushRoute(AddPostRoute()),
          child: Icon(Icons.add)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            if (state is FeedLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FeedLoaded) {
              final posts = state.posts;
              return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final cur = posts[index];
                    return Column(
                      children: [
                        PostWidget(post: cur),
                        Divider(),
                      ],
                    );
                  });
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
