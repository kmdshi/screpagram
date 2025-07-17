// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {}

class SignUpEvent extends AuthEvent {
  final PersonFormModel personEntity;
  SignUpEvent({
    required this.personEntity,
  });

  @override
  List<Object?> get props => [personEntity];
}

class SignInEvent extends AuthEvent {
  final PersonFormModel personEntity;
  SignInEvent({
    required this.personEntity,
  });

  @override
  List<Object?> get props => [personEntity];
}
