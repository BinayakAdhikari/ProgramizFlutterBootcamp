import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:flutter_bootcamp/src/config/router.dart';
import 'package:flutter_bootcamp/src/weather_feature/presentation/view/weather_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RouteGenerator _routeGenerator = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppConfig().themeData,
      onGenerateRoute: _routeGenerator.generateRoute,
    );
  }
}
