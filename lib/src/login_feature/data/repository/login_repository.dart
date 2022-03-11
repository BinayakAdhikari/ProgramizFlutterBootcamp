import 'package:dartz/dartz.dart';
import 'package:flutter_bootcamp/src/login_feature/data/datasource/login_datasource.dart';
import 'package:flutter_bootcamp/src/login_feature/data/model/user_model.dart';

import '../../../core/errors/custom_errors.dart';

abstract class LoginRepository {
  Future<Either<LoginError, UserModel>> login(
      {required String email, required String password});
}

class LoginRepoistoryImp extends LoginRepository {
  final LoginDatasource loginDatasource;

  LoginRepoistoryImp({required this.loginDatasource});
  @override
  Future<Either<LoginError, UserModel>> login(
      {required String email, required String password}) async {
    return await loginDatasource.login(email: email, password: password);
  }
}
