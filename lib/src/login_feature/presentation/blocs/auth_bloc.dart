import 'dart:async';

import 'package:flutter_bootcamp/src/core/errors/custom_errors.dart';
import 'package:flutter_bootcamp/src/login_feature/data/model/user_model.dart';
import 'package:flutter_bootcamp/src/login_feature/usecases/login_usecase.dart';
import 'package:rxdart/subjects.dart';

class AuthBloc {
  late var _authStreamController;
  final LoginUsecase loginUsecase;

  AuthBloc({required this.loginUsecase}) {
    _authStreamController = BehaviorSubject<UserModel>();
  }

  Stream<UserModel> get authenticationStream => _authStreamController.stream;

  UserModel get getUserModel => _authStreamController.value;

  void login({required String email, required String password}) async {
    final loginResult =
        await loginUsecase.execute(email: email, password: password);
    loginResult.fold(
        (l) => print(l.message), (r) => _authStreamController.add(r));
  }

  void dispose() {
    _authStreamController.close();
  }
}
