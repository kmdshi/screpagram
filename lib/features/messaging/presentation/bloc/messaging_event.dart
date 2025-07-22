// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'messaging_bloc.dart';

sealed class MessagingEvent extends Equatable {
  const MessagingEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends MessagingEvent {
  final String chatId;
  final MessageModel message;

  const SendMessageEvent({
    required this.chatId,
    required this.message,
  });

  @override
  List<Object> get props => [chatId, message];
}

class GetChatsEvent extends MessagingEvent {
  const GetChatsEvent();
}

class GetChatEvent extends MessagingEvent {
  final String uid1;
  final String uid2;
  const GetChatEvent({required this.uid1, required this.uid2});

  @override
  List<Object> get props => [uid1, uid2];
}
