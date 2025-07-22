// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'messaging_bloc.dart';

sealed class MessagingState extends Equatable {
  const MessagingState();

  @override
  List<Object> get props => [];
}

final class MessagingInitial extends MessagingState {}

final class MessagingLoading extends MessagingState {}

final class ChatsLoaded extends MessagingState {
  final List<ChatEntity> chats;
  const ChatsLoaded(this.chats);

  @override
  List<Object> get props => [chats];
}

final class ChatLoaded extends MessagingState {
  final String chatId;
  final List<MessageModel> messages;

  const ChatLoaded({
    required this.chatId,
    required this.messages,
  });

  @override
  List<Object> get props => [chatId, messages];

  ChatLoaded copyWith({
    String? chatId,
    List<MessageModel>? messages,
  }) {
    return ChatLoaded(
      chatId: chatId ?? this.chatId,
      messages: messages ?? this.messages,
    );
  }
}

final class MessagingFailure extends MessagingState {
  final String message;
  const MessagingFailure(this.message);

  @override
  List<Object> get props => [message];
}
