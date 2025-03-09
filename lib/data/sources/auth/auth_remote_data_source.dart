import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/core/error/exception.dart';
import 'package:spotify/core/error/failure.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/sign_in_user_req.dart';

abstract interface class AuthRemoteDataSource {
  Future<Either<Failure, String>> signUp(CreateUserReq createUserReq);
  Future<Either<Failure, String>> signIn(SignInUserReq signInUserReq);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRemoteDataSourceImpl({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, String>> signUp(CreateUserReq createUserReq) async {
    try {
      //Data Validation
      if (createUserReq.email.isEmpty || createUserReq.password.isEmpty) {
        return Left(Failure(message: 'Email and Password cannot be Empty'));
      }

      //Create User with FirebaseAuth
      // final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      //   email: createUserReq.email,
      //   password: createUserReq.password,
      // );
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      //Save User with Firestore
      // await _firestore.collection('Users').doc(userCredential.user?.uid).set({
      //   'name': createUserReq.fullName,
      //   'email': userCredential.user?.email,
      // });

      return const Right('SignUp Successful');
    } on FirebaseAuthException catch (e) {
      return left(Failure(message: e.message ?? 'Sign Up Failed'));
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Either<Failure, String>> signIn(SignInUserReq signInUserReq) async {
    try {
      //Data Validation
      if (signInUserReq.email.isEmpty || signInUserReq.password.isEmpty) {
        return Left(Failure(message: 'Email and Password cannot be Empty'));
      }

      //Sign In with Firebase Auth
      await _firebaseAuth.signInWithEmailAndPassword(
        email: signInUserReq.email,
        password: signInUserReq.password,
      );

      return const Right('SignIn Successful');
    } on FirebaseAuthException catch (e) {
      return left(Failure(message: e.message ?? 'Sign In Failed'));
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
