import 'package:flutter/material.dart';

class AppConfig {
  ThemeData themeData = ThemeData(
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: black,
      ),
      headline2: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: black,
      ),
      headline3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: blackLighter,
      ),
      headline4: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: blackLighter,
      ),
      headline5: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: blackLighter,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: grey,
      ),
    ),
  );
}

// Colors
const Color primary = Color(0xFFeb3483);
const Color blackLighter = Color(0xFF2b2b2b);
const Color black = Color(0xFF242424);
const Color blackDarker = Color(0xFF171717);
const Color greyLighter = Color(0xFFd4d4d4);
const Color grey = Color(0xFF4d4d4d);
const Color whiteLighter = Color(0xFFFFFFFF);
const Color white = Color(0xFFf7f7f7);
const Color whiteDarker = Color(0xFFeeeeee);

// Default variables
const int averageReadSpeed = 200;
const String baseUrl = "https://newsapi.org/v2/";
