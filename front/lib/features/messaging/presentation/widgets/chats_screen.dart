import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/core/router/cryptome_router.gr.dart';
import 'package:screpagram/features/messaging/presentation/bloc/messaging_bloc.dart';

@RoutePage()
class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  void initState() {
    context.read<MessagingBloc>().add(GetChatsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Чаты')),
      body: BlocBuilder<MessagingBloc, MessagingState>(
        builder: (context, state) {
          if (state is MessagingLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ChatsLoaded) {
            if (state.chats.isEmpty) {
              return const Center(child: Text('Чатов пока нет'));
            }

            return ListView.builder(
              itemCount: state.chats.length,
              itemBuilder: (context, index) {
                final chat = state.chats[index];
                return ListTile(
                  leading: const Icon(Icons.chat_bubble_outline),
                  title: Text('Чат ${chat.id}'),
                  onTap: () => context.router.push(ChatRoute(chat: chat)),
                );
              },
            );
          }

          if (state is MessagingFailure) {
            return Center(child: Text('Ошибка: ${state.message}'));
          }

          return const Center(child: Text('Загрузка...'));
        },
      ),
    );
  }
}
