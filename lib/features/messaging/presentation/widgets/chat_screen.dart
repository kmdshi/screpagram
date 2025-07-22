import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screpagram/core/cubit/user/user_cubit.dart';
import 'package:screpagram/features/messaging/domain/entities/chat_entity.dart';
import 'package:screpagram/features/messaging/domain/entities/message_entity.dart';
import 'package:screpagram/features/messaging/presentation/bloc/messaging_bloc.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  final ChatEntity chat;
  const ChatScreen({super.key, required this.chat});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final String currentUid;
  late final String otherUid;
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initChat();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Чат с $otherUid'),
        leading: BackButton(
          onPressed: () {
            context.read<MessagingBloc>().add(const GetChatsEvent());
            context.router.pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<MessagingBloc, MessagingState>(
              builder: (context, state) {
                if (state is ChatLoaded) {
                  final messages = state.messages;
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isMine = message.senderId == currentUid;
                      return Align(
                        alignment: isMine
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            color:
                                isMine ? Colors.blueAccent : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            message.content,
                            style: TextStyle(
                                color: isMine ? Colors.white : Colors.black),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is MessagingLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text("Нет сообщений"));
                }
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _sendMessage(),
                    decoration: const InputDecoration(
                      hintText: 'Введите сообщение...',
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _initChat() {
    final currentUser = context.read<UserCubit>().state!;
    currentUid = currentUser.id;
    otherUid = widget.chat.participants.where((id) => id != currentUid).first;

    context.read<MessagingBloc>().add(GetChatEvent(
          uid1: currentUid,
          uid2: otherUid,
        ));
  }

  void _sendMessage() {
    final content = _messageController.text.trim();
    if (content.isEmpty) return;

    final message = MessageModel(
      senderId: currentUid,
      content: content,
      timestamp: DateTime.now(),
    );

    context.read<MessagingBloc>().add(SendMessageEvent(
          chatId: widget.chat.id,
          message: message,
        ));

    _messageController.clear();

    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
