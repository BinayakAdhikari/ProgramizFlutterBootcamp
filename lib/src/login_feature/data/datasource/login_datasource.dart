import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/core/errors/custom_errors.dart';
import 'package:flutter_bootcamp/src/login_feature/data/model/user_model.dart';
import 'package:flutter_bootcamp/src/services/authentication_serivce.dart';

abstract class LoginDatasource {
  Future<Either<LoginError, UserModel>> login(
      {required String email, required String password});
}

class LoginDatasourceImp extends LoginDatasource {
  final AuthenticationService authenticationService;

  LoginDatasourceImp({required this.authenticationService});

  @override
  Future<Either<LoginError, UserModel>> login(
      {required String email, required String password}) async {
    return await authenticationService.login(email: email, password: password);
  }
}
