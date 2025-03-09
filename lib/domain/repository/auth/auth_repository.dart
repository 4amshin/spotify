import 'package:dartz/dartz.dart';
import 'package:spotify/core/error/failure.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/sign_in_user_req.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUp(CreateUserReq createUserReq);
  Future<Either<Failure, String>> signIn(SignInUserReq signInUserReq);
}
