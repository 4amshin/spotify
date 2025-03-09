import 'package:dartz/dartz.dart';
import 'package:spotify/core/error/failure.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/sign_in_user_req.dart';
import 'package:spotify/domain/repository/auth/auth_repository.dart';

class SignInUseCase implements UseCase<Either, SignInUserReq> {
  final AuthRepository authRepository;
  SignInUseCase({required this.authRepository});

  @override
  Future<Either<Failure, String>> call({SignInUserReq? params}) async {
    return await authRepository.signIn(params!);
  }
}
