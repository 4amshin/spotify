part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class SignUpEvent extends AuthEvent {
  final CreateUserReq createUserReq;
  SignUpEvent({required this.createUserReq});
}

final class SignInEvent extends AuthEvent {
  final SignInUserReq signInUserReq;
  SignInEvent({required this.signInUserReq});
}
