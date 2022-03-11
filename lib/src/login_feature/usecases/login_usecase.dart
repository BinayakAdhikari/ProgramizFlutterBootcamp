import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bootcamp/src/core/errors/custom_errors.dart';
import 'package:flutter_bootcamp/src/login_feature/data/model/user_model.dart';
import 'package:flutter_bootcamp/src/login_feature/data/repository/login_repository.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase({required this.repository});

  Future<Either<LoginError, UserModel>> execute(
      {required String email, required String password}) async {
    return await repository.login(email: email, password: password);
  }
}
