import 'package:firebase_auth/firebase_auth.dart';
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
        (injector) =>
            AuthenticationService(firebaseAuth: FirebaseAuth.instance),
        isSingleton: true);
  }
}
