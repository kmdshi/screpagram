// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'messaging_bloc.dart';

sealed class MessagingEvent extends Equatable {
  const MessagingEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends MessagingEvent {}

class MessagesUpdated extends MessagingEvent {}
