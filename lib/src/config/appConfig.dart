import 'package:flutter/material.dart';

class AppConfig {
  ThemeData themeData = ThemeData(
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: black,
      ),
      headline2: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: black,
      ),
      headline3: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: black,
      ),
      headline4: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: black,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: black,
      ),
    ),
  );
}

const Color pureWhite = Color(0xFFFFFFFF);
const Color blackDark = Color(0xFF0f0f0f);
const Color black = Color(0xFF1a1a1a);
const Color blackLight = Color(0xFF1f1f1f);
const Color primaryDark = Color(0xFFdb9e1f);
const Color primary = Color(0xFFf3b22a);
const Color primaryLight = Color(0xFFf2b638);
