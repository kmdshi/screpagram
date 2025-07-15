// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:screpagram/features/auth/domain/entities/person_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<CreatePersonEvent>(_createPerson);
  }

  Future<void> _createPerson(
      CreatePersonEvent event, Emitter<RegistrationState> emit) async {
    try {
      emit(RegistrationLoaded());
    } catch (e) {
      emit(RegistrationFailure(message: e.toString()));
    }
  }
}
