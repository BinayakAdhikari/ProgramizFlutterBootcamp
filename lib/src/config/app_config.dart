import 'package:flutter/material.dart';

class AppConfig {
  ThemeData themeData = ThemeData(
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline2: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 233, 233, 233),
      ),
      headline3: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: Color.fromARGB(255, 233, 233, 233),
      ),
    ),
  );
}
