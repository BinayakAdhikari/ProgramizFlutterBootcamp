import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bootcamp/src/login_feature/data/model/user_model.dart';

import '../core/errors/custom_errors.dart';

class AuthenticationService {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthenticationService({required this.firestore, required this.firebaseAuth});

  Future<Either<LoginError, UserModel>> login(
      {required String email, required String password}) async {
    try {
      UserCredential credentials = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      CollectionReference users = firestore.collection('users');

      final userFound = await users.doc(credentials.user!.uid).get();

      UserModel resultModel =
          UserModel.fromJson(userFound.data() as Map<String, dynamic>);

      return Right(resultModel);
    } on FirebaseAuthException catch (e) {
      return Left(
        LoginError(
          message: e.toString(),
        ),
      );
    }
  }
}
