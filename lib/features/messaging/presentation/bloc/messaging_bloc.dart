import 'dart:async';


import 'package:screpagram/features/messaging/domain/repository/messaging_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'messaging_event.dart';
part 'messaging_state.dart';

class MessagingBloc extends Bloc<MessagingEvent, MessagingState> {
  final MessagingRepository messagingRepository;

  MessagingBloc({
    required this.messagingRepository,
  }) : super(MessagingInitial()) {}
}
