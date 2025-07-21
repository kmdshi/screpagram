// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String pass;
  SignUpEvent({required this.email, required this.pass});

  @override
  List<Object?> get props => [email, pass];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String pass;
  SignInEvent({required this.email, required this.pass});

  @override
  List<Object?> get props => [email, pass];
}

class AddAdditInfoEvent extends AuthEvent {
  AddAdditInfoEvent();

  @override
  List<Object?> get props => [];
}
