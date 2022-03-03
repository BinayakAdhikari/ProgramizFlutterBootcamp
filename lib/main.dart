import 'package:flutter/material.dart';
import 'package:todo_app/src/config/appConfig.dart';
import 'package:todo_app/src/todo_feature/presentation/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppConfig().themeData,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
