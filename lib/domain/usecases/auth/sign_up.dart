import 'package:dartz/dartz.dart';
import 'package:spotify/core/error/failure.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/repository/auth/auth_repository.dart';

class SignUpUseCase implements UseCase<Either, CreateUserReq> {
  final AuthRepository authRepository;
  SignUpUseCase({required this.authRepository});

  @override
  Future<Either<Failure, String>> call({CreateUserReq? params}) async {
    return await authRepository.signUp(params!);
  }
}
