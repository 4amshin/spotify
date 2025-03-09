import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/sign_in_user_req.dart';
import 'package:spotify/domain/usecases/auth/sign_in.dart';
import 'package:spotify/domain/usecases/auth/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUp;
  final SignInUseCase signIn;
  AuthBloc({
    required this.signUp,
    required this.signIn,
  }) : super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<SignUpEvent>(_onSignUp);
    on<SignInEvent>(_onSignIn);
  }

  Future<void> _onSignUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await signUp(params: event.createUserReq);
    result.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (success) => emit(AuthSuccess(message: success)),
    );
  }

  Future<void> _onSignIn(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await signIn(params: event.signInUserReq);
    result.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (success) => emit(AuthSuccess(message: success)),
    );
  }
}
