import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/core/error/failure.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/sign_in_user_req.dart';
import 'package:spotify/data/sources/auth/auth_remote_data_source.dart';
import 'package:spotify/domain/repository/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> signIn(SignInUserReq signInUserReq) async {
    try {
      final result = await remoteDataSource.signIn(signInUserReq);
      return result;
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: e.message ?? 'Sign In Failed'));
    } catch (e) {
      return Left(Failure(message: 'An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, String>> signUp(CreateUserReq createUserReq) async {
    try {
      final result = await remoteDataSource.signUp(createUserReq);
      return result;
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: e.message ?? 'Sign up failed'));
    } catch (e) {
      return Left(Failure(message: 'An unexpected error occurred'));
    }
  }
}
