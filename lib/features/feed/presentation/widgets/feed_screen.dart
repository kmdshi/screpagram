import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/core/router/cryptome_router.gr.dart';
import 'package:screpagram/features/feed/presentation/bloc/feed_bloc.dart';

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
    return Scaffold(
      floatingActionButton: ElevatedButton(
          onPressed: () => context.pushRoute(AddPostRoute()),
          child: Icon(Icons.add)),
      body: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          if (state is FeedLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FeedLoaded) {
            final posts = state.posts;
            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final cur = posts[index];
                  return ListTile(
                    title: Text(cur.content),
                  );
                });
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
