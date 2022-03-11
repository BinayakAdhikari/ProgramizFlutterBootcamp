import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bootcamp/src/login_feature/data/datasource/login_datasource.dart';
import 'package:flutter_bootcamp/src/login_feature/data/repository/login_repository.dart';
import 'package:flutter_bootcamp/src/login_feature/presentation/blocs/auth_bloc.dart';
import 'package:flutter_bootcamp/src/login_feature/usecases/login_usecase.dart';

import 'package:flutter_bootcamp/src/services/authentication_serivce.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

abstract class InjectionBase {
  late Injector _injector;
  void configure(Injector injector);

  InjectionBase() {
    _injector = Injector();
  }

  T get<T>({String? key, Map<String, dynamic>? additionalParameters}) {
    return _injector.get(key: key, additionalParameters: additionalParameters);
  }
}

class InjectionModule extends InjectionBase {
  static final InjectionModule _injectionModule = InjectionModule._internal();

  factory InjectionModule() {
    return _injectionModule;
  }

  InjectionModule._internal() {
    configure(_injector);
  }

  @override
  void configure(Injector injector) {
    injector.map<AuthenticationService>(
        (injector) => AuthenticationService(
            firebaseAuth: FirebaseAuth.instance,
            firestore: FirebaseFirestore.instance),
        isSingleton: true);
    injector.map(
      (injector) => LoginDatasourceImp(
        authenticationService: injector.get<AuthenticationService>(),
      ),
    );
    injector.map(
      (injector) => LoginRepoistoryImp(
        loginDatasource: injector.get<LoginDatasourceImp>(),
      ),
    );
    injector.map<AuthBloc>(
      (injector) => AuthBloc(
        loginUsecase: LoginUsecase(
          repository: injector.get<LoginRepoistoryImp>(),
        ),
      ),
    );
  }
}
