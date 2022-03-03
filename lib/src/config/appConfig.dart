import 'package:flutter/material.dart';

class AppConfig {
  ThemeData themeData = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: primary,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: black,
      ),
      headline3: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: blackLighter,
      ),
      headline4: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: blackLighter,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: black,
      ),
    ),
  );
}

const Color grey = Color(0xFFb8b8b8);
const Color black = Color(0xFF0f0f0f);
const Color blackLighter = Color(0xFF474747);
const Color white = Color(0xFFFFFFFF);
const Color primary = Color(0xFFd2e2fc);
const Color primaryDarker = Color(0xFF3a7bf3);
const Color secondary = Color(0xFFc7e1ce);
const Color secondaryDarker = Color(0xFF2f9e49);
