import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/di/injection_base.dart';

import 'package:flutter_bootcamp/src/login_feature/presentation/views/login_screen.dart';
import 'package:flutter_bootcamp/src/services/authentication_serivce.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    print(InjectionModule().get<AuthenticationService>().hashCode);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
