import 'package:screpagram/features/messaging/domain/entities/chat_entity.dart';
import 'package:screpagram/features/messaging/domain/entities/message_entity.dart';
import 'package:screpagram/features/messaging/domain/repository/messaging_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'messaging_event.dart';
part 'messaging_state.dart';

class MessagingBloc extends Bloc<MessagingEvent, MessagingState> {
  final MessagingRepo messagingRepository;

  MessagingBloc(this.messagingRepository) : super(MessagingInitial()) {
    on<GetChatsEvent>(_onGetChats);
    on<GetChatEvent>(_onGetChat);
    on<SendMessageEvent>(_onSendMessage);
  }

  Future<void> _onGetChats(
    GetChatsEvent event,
    Emitter<MessagingState> emit,
  ) async {
    emit(MessagingLoading());
    try {
      final chatsStream = messagingRepository.getUserChatIds();
      await emit.forEach<List<ChatEntity>>(
        chatsStream,
        onData: (chatIds) => ChatsLoaded(chatIds),
        onError: (error, _) =>
            MessagingFailure('Ошибка при загрузке чатов: $error'),
      );
    } catch (e) {
      emit(MessagingFailure('Ошибка при получении чатов: $e'));
    }
  }

  Future<void> _onGetChat(
    GetChatEvent event,
    Emitter<MessagingState> emit,
  ) async {
    try {
      final chatId = messagingRepository.getChatId(event.uid1, event.uid2);
      final messagesStream = messagingRepository.getChatMessages(chatId);

      await emit.forEach<List<MessageModel>>(
        messagesStream,
        onData: (messages) => ChatLoaded(messages: messages, chatId: chatId),
        onError: (error, _) => MessagingFailure('Ошибка при подписке: $error'),
      );
    } catch (e) {
      emit(MessagingFailure('Ошибка при инициализации чата: $e'));
    }
  }

  Future<void> _onSendMessage(
    SendMessageEvent event,
    Emitter<MessagingState> emit,
  ) async {
    try {
      await messagingRepository.sendMessage(
        chatId: event.chatId,
        message: event.message,
      );
    } catch (e) {
      emit(MessagingFailure('Не удалось отправить сообщение: $e'));
    }
  }
}
